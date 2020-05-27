Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A2021E4240
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2020 14:28:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729683AbgE0M20 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 May 2020 08:28:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725872AbgE0M20 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 May 2020 08:28:26 -0400
X-Greylist: delayed 10036 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 27 May 2020 05:28:26 PDT
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 046EBC08C5C1;
        Wed, 27 May 2020 05:28:26 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id E4785C635E; Wed, 27 May 2020 13:28:22 +0100 (BST)
Date:   Wed, 27 May 2020 13:28:22 +0100
From:   Sean Young <sean@mess.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 1/3] media: rc: add support for Infrared Toy and IR
 Droid devices
Message-ID: <20200527122822.GA14488@gofer.mess.org>
References: <20200527094107.11936-1-sean@mess.org>
 <20200527094107.11936-2-sean@mess.org>
 <1590578201.2838.69.camel@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1590578201.2838.69.camel@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Oliver,

On Wed, May 27, 2020 at 01:16:41PM +0200, Oliver Neukum wrote:
> Am Mittwoch, den 27.05.2020, 10:41 +0100 schrieb Sean Young:
> 
> Hi,
> 
> thank you for the driver. Much cleaner than routing this through
> CDC_ACM.

Yes, it certainly is. It took some time for that insight to sink in (for me).

> I am afraid there are a few issues though. Nothing major.
> I've added remarks directly to the code. Would you care to
> fix them up?

Of course, thank you for reviewing it. The driver is much better for it.

I'll send out a v3 shortly, response and a question below.

Thanks,

Sean

> 
> 	Regards
> 		Oliver
> 
> > +static const u8 COMMAND_VERSION[] = { 'v' };
> > +// End transmit and repeat reset command so we exit sump mode
> > +static const u8 COMMAND_RESET[] = { 0xff, 0xff, 0, 0, 0, 0, 0 };
> > +static const u8 COMMAND_SMODE_ENTER[] = { 's' };
> > +static const u8 COMMAND_TXSTART[] = { 0x26, 0x24, 0x25, 0x03 };
> 
> Using these directly as buffers is based on the assuption that the
> kernel code is accessable by DMA. On some architectures that is
> false. You need to use a bounce buffer.

This is true, however these arrays are not directly accessed, they're
memcpy'ed into irtoy->out.

> 
> > +
> > +#define REPLY_XMITCOUNT 't'
> > +#define REPLY_XMITSUCCESS 'C'
> > +#define REPLY_VERSION 'V'
> > +#define REPLY_SAMPLEMODEPROTO 'S'
> > +
> > +#define TIMEOUT 500
> > +
> > +#define LEN_XMITRES 3
> > +#define LEN_VERSION 4
> > +#define LEN_SAMPLEMODEPROTO 3
> > +
> > +#define MIN_FW_VERSION 20
> > +#define UNIT_NS 21333
> > +#define MAX_TIMEOUT_NS (UNIT_NS * U16_MAX)
> > +
> > +#define MAX_PACKET 64
> > +
> > +enum state {
> > +	STATE_IRDATA,
> > +	STATE_RESET,
> > +	STATE_COMMAND,
> > +	STATE_TX,
> > +};
> > +
> > +struct irtoy {
> > +	struct device *dev;
> > +	struct usb_device *usbdev;
> > +
> > +	struct rc_dev *rc;
> > +	struct urb *urb_in, *urb_out;
> > +
> > +	u8 in[MAX_PACKET];
> > +	u8 out[MAX_PACKET];
> 
> This violates the DMA coherency rules. The buffers must be
> allocated separately with kmalloc().

Right, I'll fix this and send out a v3. There are other usb drivers in
drivers/media/rc/.. that break this rule too.

> > +	case STATE_IRDATA: {
> > +		struct ir_raw_event rawir = { .pulse = irtoy->pulse };
> > +		__be16 *in = (__be16 *)irtoy->in;
> > +		int i;
> > +
> > +		for (i = 0; i < len / sizeof(__be16); i++) {
> > +			u32 v = be16_to_cpup(in + i);
> 
> Is this 16 or 32 bit?

It's 16 bit but I would like it up-cast so that v * UNIT_NS is a 32 bit
multiply. This could do with a comment. Also could be be16_to_cpu(in[i]).

> 
> > +
> > +			if (v == 0xffff) {
> > +				rawir.pulse = false;
> > +			} else {
> > +				rawir.duration = v * UNIT_NS;
> > +				ir_raw_event_store_with_timeout(irtoy->rc,
> > +								&rawir);
> > +			}
> > +
> > +			rawir.pulse = !rawir.pulse;
> > +		}
> > +
> > +		irtoy->pulse = rawir.pulse;
> > +
> > +		ir_raw_event_handle(irtoy->rc);
> > +		break;
> > +	}
> > +	case STATE_TX:
> > +		if (irtoy->tx_len == 0) {
> > +			if (len == LEN_XMITRES &&
> > +			    irtoy->in[0] == REPLY_XMITCOUNT) {
> 
> Endianness?

Single byte.

> > +				__be16 *emitted = (__be16 *)(irtoy->in + 1);
> > +
> > +				irtoy->emitted = be16_to_cpup(emitted);
> 
> Reason you are using cpup versions?

emitted is not aligned. So, I'm wrong and this should be get_unaligned_be16().

> 
> > +			} else if (len == 1 &&
> > +				   irtoy->in[0] == REPLY_XMITSUCCESS) {
> > +				complete(&irtoy->rx_done);
> > +				irtoy->state = STATE_IRDATA;
> 
> Race condition. Whoever you wake up with that complete could read
> the old state.

irtoy->state is only read in this function, the urb callback handler. However,
as you noticed, this is looks wrong so it should be re-ordered.

> > +			}
> > +		} else {
> > +			// send next part of tx buffer
> > +			uint max_send = irtoy->in[0];
> > +			uint buf_len = min(max_send, irtoy->tx_len);
> > +			int err;
> > +
> > +			dev_dbg(irtoy->dev, "ready to receive: 0x%02x\n",
> > +				max_send);
> > +
> > +			memcpy(irtoy->out, irtoy->tx_buf, buf_len);
> > +			irtoy->urb_out->transfer_buffer_length = buf_len;
> > +			err = usb_submit_urb(irtoy->urb_out, GFP_ATOMIC);
> > +			if (err != 0) {
> > +				dev_err(irtoy->dev, "fail to submit tx buf urb: %d\n",
> > +					err);
> > +				complete(&irtoy->rx_done);
> > +				irtoy->state = STATE_IRDATA;
> 
> Same race condition as above.
> 
> > +			}
> > +
> > +			irtoy->tx_buf += buf_len;
> > +			irtoy->tx_len -= buf_len;
> > +			break;
> > +		}
> > +		break;
> > +	case STATE_RESET:
> > +		dev_err(irtoy->dev, "unexpected response to reset: %*phN\n",
> > +			len, irtoy->in);
> > +	}
> > +}
> > +
> > +static void irtoy_out_callback(struct urb *urb)
> > +{
> > +	struct irtoy *irtoy = urb->context;
> > +
> > +	switch (urb->status) {
> > +	case 0:
> > +		if (irtoy->state == STATE_RESET)
> > +			complete(&irtoy->rx_done);
> > +		break;
> > +
> > +	case -ECONNRESET:
> > +	case -ENOENT:
> > +	case -ESHUTDOWN:
> > +	case -EPROTO:
> > +		usb_unlink_urb(urb);
> 
> Redundant.

Removed, thanks.

> > +		return;
> > +
> > +	default:
> > +		dev_warn(irtoy->dev, "out urb status: %d\n", urb->status);
> > +	}
> > +}
> > +
> > +static void irtoy_in_callback(struct urb *urb)
> > +{
> > +	struct irtoy *irtoy = urb->context;
> > +	int ret;
> > +
> > +	switch (urb->status) {
> > +	case 0:
> > +		irtoy_response(irtoy, urb->actual_length);
> > +		break;
> > +
> > +	case -ECONNRESET:
> > +	case -ENOENT:
> > +	case -ESHUTDOWN:
> > +	case -EPROTO:
> > +		usb_unlink_urb(urb);
> 
> Redundant.

Removed, thanks.

> > +		return;
> > +
> > +	default:
> > +		dev_warn(irtoy->dev, "in urb status: %d\n", urb->status);
> > +	}
> > +
> > +	ret = usb_submit_urb(urb, GFP_ATOMIC);
> > +	if (ret && ret != -ENODEV)
> > +		dev_warn(irtoy->dev, "failed to resubmit urb: %d\n", ret);
> > +}
> > +
> > +static int irtoy_command(struct irtoy *irtoy, const u8 *cmd, int cmd_len)
> > +{
> > +	int err;
> > +
> > +	init_completion(&irtoy->rx_done);
> > +
> > +	memcpy(irtoy->out, cmd, cmd_len);
> > +	irtoy->urb_out->transfer_buffer_length = cmd_len;
> > +
> > +	err = usb_submit_urb(irtoy->urb_out, GFP_KERNEL);
> > +	if (err != 0)
> > +		return err;
> > +
> > +	if (!wait_for_completion_timeout(&irtoy->rx_done,
> > +					 msecs_to_jiffies(TIMEOUT)))
> > +		return -ETIMEDOUT;
> 
> Wrong error handling. The URB is still active. You cannot free the
> buffer. The caller has no idea when that is safe to do so. You must
> kill the URB in the timeout case.

Good point, fixed.

> > +
> > +	return 0;
> > +}
> > +
> > +/*
> > + * When sending IR, it is imperative that we send the IR data as quickly
> > + * as possible to the device, so it does not run out of IR data and
> > + * introduce gaps. So, we feed the data from the urb callback handler
> > + */
> > +static int irtoy_tx(struct rc_dev *rc, uint *txbuf, uint count)
> > +{
> > +	struct irtoy *irtoy = rc->priv;
> > +	unsigned int i, size;
> > +	__be16 *buf;
> > +	int err;
> > +
> > +	size = sizeof(u16) * (count + 1);
> > +	buf = kmalloc(size, GFP_KERNEL);
> 
> This is incompatible with the comment. If you are potentially in
> interrupt, you must use GFP_ATOMIC. Please clarify.

This function is called in process context, from a write() on a lirc chardev.
However, this buffer is stored in irtoy->tx_buf. It is then sent, in packets,
to the device (memcpy'ed to irtoy->out). This handled in irtoy_response() in
a response to the device sending a "you may send X bytes irdata now" message. 

I'll update the comment.

> > +static int irtoy_suspend(struct usb_interface *intf, pm_message_t message)
> > +{
> > +	struct irtoy *irtoy = usb_get_intfdata(intf);
> > +
> > +	usb_kill_urb(irtoy->urb_in);
> > +	usb_kill_urb(irtoy->urb_out);
> 
> That is brutal. It could fail commands. Do you really want to
> do that?

Commands can only be sent during 1) device probe and 2) ir transmit. During
ir transmit we are non-interruptable process context, so we should not end up
here unless I'm mistaken.

When we're not issuing commands we're waiting for ir receive; should that
urb be killed for the duration of suspend?

> 
> > +
> > +	return 0;
> > +}
> > +
> > +static int irtoy_resume(struct usb_interface *intf)
> > +{
> > +	struct irtoy *irtoy = usb_get_intfdata(intf);
> > +	int err;
> > +
> > +	err = usb_submit_urb(irtoy->urb_in, GFP_KERNEL);
> 
> That should technically be GFP_NOIO

Fixed.

> 
> > +	if (err)
> > +		dev_warn(&intf->dev, "failed to submit urb: %d\n", err);
> > +
> > +	return err;
> > +}
