Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A5CD3BA1F7
	for <lists+linux-media@lfdr.de>; Fri,  2 Jul 2021 16:06:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233059AbhGBOJN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jul 2021 10:09:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:53336 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232802AbhGBOJN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 2 Jul 2021 10:09:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8D1FD61427;
        Fri,  2 Jul 2021 14:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625234801;
        bh=5Hdlb3+MTH841lHzZzZ079inMG1s0uR7k1ZqKN9Z+3E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MefMqpmk6X4zAerZ8fEqYmdsuc4pWH8afZzej+gODOLBbJ5troJONTfenWYAhOs0/
         H4Rwj6r5O+UoYRkb8UtsbkiZwg1uHOL2J1NHsTTdsFvR5qQlZv3C9Yyo1kOyQ0+TCL
         kyze8iCl4j6H4tAY21gF4vBnjk71YGa/eBXsm68mVQgBnQjEEZbJh05QBLfLKbGFul
         P4ZwwL9saDeRc6kLaS5BNYY0YOKFiDhhmaMXqDnYDlTnn9It7XsPuPLltC8n/snu5r
         TEz4IPtYGJoTXOuh+et0cA6XzfAw9KnRe4JIgl0gXO9OjL0TclUFU9d7ZOZfphAUo7
         kQvvoR2IQXKQA==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1lzJoV-0006aB-JD; Fri, 02 Jul 2021 16:06:39 +0200
Date:   Fri, 2 Jul 2021 16:06:39 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Rhees <support@usbuirt.com>,
        Oliver Neukum <oneukum@suse.com>
Subject: Re: [PATCH v5 1/2] media: rc: new driver for USB-UIRT device
Message-ID: <YN8db6Q/9np7C43h@hovoldconsulting.com>
References: <cover.1624006513.git.sean@mess.org>
 <710e8007bc7365be8f999bae3aafaa22c3b2f7d1.1624006513.git.sean@mess.org>
 <YN7tihZHJERJAWzL@hovoldconsulting.com>
 <YN8FVEIcxnznaz1F@hovoldconsulting.com>
 <20210702132022.GC29760@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210702132022.GC29760@gofer.mess.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jul 02, 2021 at 02:20:22PM +0100, Sean Young wrote:
> On Fri, Jul 02, 2021 at 02:23:48PM +0200, Johan Hovold wrote:
> > On Fri, Jul 02, 2021 at 12:42:18PM +0200, Johan Hovold wrote:
> > > On Fri, Jun 18, 2021 at 11:18:46AM +0100, Sean Young wrote:
> > > > This device uses an ftdi usb serial port, so this driver has a tiny
> > > > amount of usb ftdi code. It would be preferable to connect this driver via
> > > > serdev or line-discipline, but unfortunately neither support
> > > > hotplugging yet.
> > > > 
> > > > See http://www.usbuirt.com/
> > > > 
> > > > Signed-off-by: Sean Young <sean@mess.org>
> > > > ---
> > 
> > > > +struct uirt {
> > > > +	struct device *dev;
> > > > +	struct usb_device *usbdev;
> > > > +
> > > > +	struct rc_dev *rc;
> > > > +	struct urb *urb_in, *urb_out;
> > > > +
> > > > +	u8 *in;
> > > > +	u8 *out;
> > > > +	struct completion cmd_done;
> > > > +	u8 freq;
> > > > +	u8 high;
> > > > +	bool wideband;
> > > > +	u32 last_duration;
> > > > +
> > > > +	enum cmd_state cmd_state;
> > > > +	enum rx_state rx_state;
> > > > +
> > > > +	void *tx_buf;
> > > > +	u32 tx_len;
> > > > +
> > > > +	char phys[64];
> > > > +};
> > 
> > > > +static void uirt_response(struct uirt *uirt, u32 len)
> > > > +{
> > > > +	int offset = 2;
> > > > +	int i;
> > > > +
> > > > +	dev_dbg(uirt->dev, "state:%d data: %*phN\n", uirt->cmd_state, len, uirt->in);
> > > > +
> > > > +	// Do we have more IR to transmit and is Clear-To-Send set
> > > > +	if (uirt->cmd_state == CMD_STATE_STREAMING_TX && len >= 2 &&
> > > > +	    uirt->tx_len && uirt->in[0] & FTDI_RS0_CTS) {
> > > 
> > > Do you really need to handle this manually when you have hardware
> > > assisted flow control enabled?
> > > 
> > > > +		u32 len;
> > > > +		int err;
> > > > +
> > > > +		len = min_t(u32, uirt->tx_len, MAX_PACKET);
> > > > +
> > > > +		memcpy(uirt->out, uirt->tx_buf, len);
> > > > +		uirt->urb_out->transfer_buffer_length = len;
> > > > +
> > > > +		uirt->tx_len -= len;
> > > > +		uirt->tx_buf += len;
> > > > +
> > > > +		err = usb_submit_urb(uirt->urb_out, GFP_ATOMIC);
> > > > +		if (err != 0)
> > > > +			dev_warn(uirt->dev,
> > > > +				 "failed to submit out urb: %d\n", err);
> > 
> > Also, this looks entirely broken since you don't have any
> > synchronisation with uirt_command() below which may try to submit the
> > same URB in parallel.
> 
> uirt_command() only gets called via lirc chardev ioctl/write ops; the lirc
> chardev code does locking for the drivers already. So, if someone does a
> write to /dev/lirc0 (which means transmit) the mutex is taken, no other
> writes/ioctls are allowed on /dev/lirc0; the uirt_tx() calls uirt_command()
> which waits for completion. During this period the code above can be
> executed, but not after the transmit succeeds or fails (when the lircdev
> chardev mutex is released, see:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/rc/lirc_dev.c#n337
> 
> Having said all that this is not evident from code at all. A comment could
> really help.

My point is that uirt_command() may race with the bulk-in completion
handler and uirt_response() which can end up submitting the out urb in
parallel with uirt_command() and corrupting the tx state. There only
needs to be one ioctl()/write() for this to happen.

Johan
