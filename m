Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4DD71E3FA3
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2020 13:16:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387959AbgE0LQt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 May 2020 07:16:49 -0400
Received: from mx2.suse.de ([195.135.220.15]:43160 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387397AbgE0LQs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 May 2020 07:16:48 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id D90FDAE2C;
        Wed, 27 May 2020 11:16:47 +0000 (UTC)
Message-ID: <1590578201.2838.69.camel@suse.com>
Subject: Re: [PATCH v2 1/3] media: rc: add support for Infrared Toy and IR
 Droid devices
From:   Oliver Neukum <oneukum@suse.com>
To:     Sean Young <sean@mess.org>, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>
Date:   Wed, 27 May 2020 13:16:41 +0200
In-Reply-To: <20200527094107.11936-2-sean@mess.org>
References: <20200527094107.11936-1-sean@mess.org>
         <20200527094107.11936-2-sean@mess.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Mittwoch, den 27.05.2020, 10:41 +0100 schrieb Sean Young:

Hi,

thank you for the driver. Much cleaner than routing this through
CDC_ACM.

I am afraid there are a few issues though. Nothing major.
I've added remarks directly to the code. Would you care to
fix them up?

	Regards
		Oliver

> +static const u8 COMMAND_VERSION[] = { 'v' };
> +// End transmit and repeat reset command so we exit sump mode
> +static const u8 COMMAND_RESET[] = { 0xff, 0xff, 0, 0, 0, 0, 0 };
> +static const u8 COMMAND_SMODE_ENTER[] = { 's' };
> +static const u8 COMMAND_TXSTART[] = { 0x26, 0x24, 0x25, 0x03 };

Using these directly as buffers is based on the assuption that the
kernel code is accessable by DMA. On some architectures that is
false. You need to use a bounce buffer.

> +
> +#define REPLY_XMITCOUNT 't'
> +#define REPLY_XMITSUCCESS 'C'
> +#define REPLY_VERSION 'V'
> +#define REPLY_SAMPLEMODEPROTO 'S'
> +
> +#define TIMEOUT 500
> +
> +#define LEN_XMITRES 3
> +#define LEN_VERSION 4
> +#define LEN_SAMPLEMODEPROTO 3
> +
> +#define MIN_FW_VERSION 20
> +#define UNIT_NS 21333
> +#define MAX_TIMEOUT_NS (UNIT_NS * U16_MAX)
> +
> +#define MAX_PACKET 64
> +
> +enum state {
> +	STATE_IRDATA,
> +	STATE_RESET,
> +	STATE_COMMAND,
> +	STATE_TX,
> +};
> +
> +struct irtoy {
> +	struct device *dev;
> +	struct usb_device *usbdev;
> +
> +	struct rc_dev *rc;
> +	struct urb *urb_in, *urb_out;
> +
> +	u8 in[MAX_PACKET];
> +	u8 out[MAX_PACKET];

This violates the DMA coherency rules. The buffers must be
allocated separately with kmalloc().

> +	case STATE_IRDATA: {
> +		struct ir_raw_event rawir = { .pulse = irtoy->pulse };
> +		__be16 *in = (__be16 *)irtoy->in;
> +		int i;
> +
> +		for (i = 0; i < len / sizeof(__be16); i++) {
> +			u32 v = be16_to_cpup(in + i);

Is this 16 or 32 bit?

> +
> +			if (v == 0xffff) {
> +				rawir.pulse = false;
> +			} else {
> +				rawir.duration = v * UNIT_NS;
> +				ir_raw_event_store_with_timeout(irtoy->rc,
> +								&rawir);
> +			}
> +
> +			rawir.pulse = !rawir.pulse;
> +		}
> +
> +		irtoy->pulse = rawir.pulse;
> +
> +		ir_raw_event_handle(irtoy->rc);
> +		break;
> +	}
> +	case STATE_TX:
> +		if (irtoy->tx_len == 0) {
> +			if (len == LEN_XMITRES &&
> +			    irtoy->in[0] == REPLY_XMITCOUNT) {

Endianness?

> +				__be16 *emitted = (__be16 *)(irtoy->in + 1);
> +
> +				irtoy->emitted = be16_to_cpup(emitted);

Reason you are using cpup versions?

> +			} else if (len == 1 &&
> +				   irtoy->in[0] == REPLY_XMITSUCCESS) {
> +				complete(&irtoy->rx_done);
> +				irtoy->state = STATE_IRDATA;

Race condition. Whoever you wake up with that complete could read
the old state.

> +			}
> +		} else {
> +			// send next part of tx buffer
> +			uint max_send = irtoy->in[0];
> +			uint buf_len = min(max_send, irtoy->tx_len);
> +			int err;
> +
> +			dev_dbg(irtoy->dev, "ready to receive: 0x%02x\n",
> +				max_send);
> +
> +			memcpy(irtoy->out, irtoy->tx_buf, buf_len);
> +			irtoy->urb_out->transfer_buffer_length = buf_len;
> +			err = usb_submit_urb(irtoy->urb_out, GFP_ATOMIC);
> +			if (err != 0) {
> +				dev_err(irtoy->dev, "fail to submit tx buf urb: %d\n",
> +					err);
> +				complete(&irtoy->rx_done);
> +				irtoy->state = STATE_IRDATA;

Same race condition as above.

> +			}
> +
> +			irtoy->tx_buf += buf_len;
> +			irtoy->tx_len -= buf_len;
> +			break;
> +		}
> +		break;
> +	case STATE_RESET:
> +		dev_err(irtoy->dev, "unexpected response to reset: %*phN\n",
> +			len, irtoy->in);
> +	}
> +}
> +
> +static void irtoy_out_callback(struct urb *urb)
> +{
> +	struct irtoy *irtoy = urb->context;
> +
> +	switch (urb->status) {
> +	case 0:
> +		if (irtoy->state == STATE_RESET)
> +			complete(&irtoy->rx_done);
> +		break;
> +
> +	case -ECONNRESET:
> +	case -ENOENT:
> +	case -ESHUTDOWN:
> +	case -EPROTO:
> +		usb_unlink_urb(urb);

Redundant.

> +		return;
> +
> +	default:
> +		dev_warn(irtoy->dev, "out urb status: %d\n", urb->status);
> +	}
> +}
> +
> +static void irtoy_in_callback(struct urb *urb)
> +{
> +	struct irtoy *irtoy = urb->context;
> +	int ret;
> +
> +	switch (urb->status) {
> +	case 0:
> +		irtoy_response(irtoy, urb->actual_length);
> +		break;
> +
> +	case -ECONNRESET:
> +	case -ENOENT:
> +	case -ESHUTDOWN:
> +	case -EPROTO:
> +		usb_unlink_urb(urb);

Redundant.

> +		return;
> +
> +	default:
> +		dev_warn(irtoy->dev, "in urb status: %d\n", urb->status);
> +	}
> +
> +	ret = usb_submit_urb(urb, GFP_ATOMIC);
> +	if (ret && ret != -ENODEV)
> +		dev_warn(irtoy->dev, "failed to resubmit urb: %d\n", ret);
> +}
> +
> +static int irtoy_command(struct irtoy *irtoy, const u8 *cmd, int cmd_len)
> +{
> +	int err;
> +
> +	init_completion(&irtoy->rx_done);
> +
> +	memcpy(irtoy->out, cmd, cmd_len);
> +	irtoy->urb_out->transfer_buffer_length = cmd_len;
> +
> +	err = usb_submit_urb(irtoy->urb_out, GFP_KERNEL);
> +	if (err != 0)
> +		return err;
> +
> +	if (!wait_for_completion_timeout(&irtoy->rx_done,
> +					 msecs_to_jiffies(TIMEOUT)))
> +		return -ETIMEDOUT;

Wrong error handling. The URB is still active. You cannot free the
buffer. The caller has no idea when that is safe to do so. You must
kill the URB in the timeout case.

> +
> +	return 0;
> +}
> +
> +/*
> + * When sending IR, it is imperative that we send the IR data as quickly
> + * as possible to the device, so it does not run out of IR data and
> + * introduce gaps. So, we feed the data from the urb callback handler
> + */
> +static int irtoy_tx(struct rc_dev *rc, uint *txbuf, uint count)
> +{
> +	struct irtoy *irtoy = rc->priv;
> +	unsigned int i, size;
> +	__be16 *buf;
> +	int err;
> +
> +	size = sizeof(u16) * (count + 1);
> +	buf = kmalloc(size, GFP_KERNEL);

This is incompatible with the comment. If you are potentially in
interrupt, you must use GFP_ATOMIC. Please clarify.

> 
> +static int irtoy_suspend(struct usb_interface *intf, pm_message_t message)
> +{
> +	struct irtoy *irtoy = usb_get_intfdata(intf);
> +
> +	usb_kill_urb(irtoy->urb_in);
> +	usb_kill_urb(irtoy->urb_out);

That is brutal. It could fail commands. Do you really want to
do that?

> +
> +	return 0;
> +}
> +
> +static int irtoy_resume(struct usb_interface *intf)
> +{
> +	struct irtoy *irtoy = usb_get_intfdata(intf);
> +	int err;
> +
> +	err = usb_submit_urb(irtoy->urb_in, GFP_KERNEL);

That should technically be GFP_NOIO

> +	if (err)
> +		dev_warn(&intf->dev, "failed to submit urb: %d\n", err);
> +
> +	return err;
> +}
