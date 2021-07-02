Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB4D43BA127
	for <lists+linux-media@lfdr.de>; Fri,  2 Jul 2021 15:20:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232183AbhGBNW4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jul 2021 09:22:56 -0400
Received: from gofer.mess.org ([88.97.38.141]:34857 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231846AbhGBNW4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 2 Jul 2021 09:22:56 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 86588C6364; Fri,  2 Jul 2021 14:20:22 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1625232022; bh=g95uEA1yaeSESqHl1FTiYIxm3UxO84eqQh0OOlpnmu0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eI/H6w6ZsTFOUn4cgP+tdI7RDXaMrqgXWIZ6ZVOYswpmhqlXbHkVpGRBhY/7oMbZn
         VFN7Z06/4DDqqkhdxwfnlWESUmfc61KCDmkOYFKv+BJQ5gpB0bzFpSzHTa2B5+yllv
         l3fBSeZjb20+/ItwwurZhs6FGFbUjHrM+XApLDr35tby1ASqyDGfffrN7QBmrkO0On
         I47IQDmvY9Lz66PKEd4bV1zpF3ALUlu3gDNwPAroBWH2tKtTwwwj5KyGo/AmjKvZpT
         c0HR7qmbZG5l2JvcEoe+ujOXxqRKEI8Ip4YiHO+7b06+OD3s3O/B870Eww74JgOXWi
         y6gBf7gv7+fhA==
Date:   Fri, 2 Jul 2021 14:20:22 +0100
From:   Sean Young <sean@mess.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Rhees <support@usbuirt.com>,
        Oliver Neukum <oneukum@suse.com>
Subject: Re: [PATCH v5 1/2] media: rc: new driver for USB-UIRT device
Message-ID: <20210702132022.GC29760@gofer.mess.org>
References: <cover.1624006513.git.sean@mess.org>
 <710e8007bc7365be8f999bae3aafaa22c3b2f7d1.1624006513.git.sean@mess.org>
 <YN7tihZHJERJAWzL@hovoldconsulting.com>
 <YN8FVEIcxnznaz1F@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YN8FVEIcxnznaz1F@hovoldconsulting.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jul 02, 2021 at 02:23:48PM +0200, Johan Hovold wrote:
> On Fri, Jul 02, 2021 at 12:42:18PM +0200, Johan Hovold wrote:
> > On Fri, Jun 18, 2021 at 11:18:46AM +0100, Sean Young wrote:
> > > This device uses an ftdi usb serial port, so this driver has a tiny
> > > amount of usb ftdi code. It would be preferable to connect this driver via
> > > serdev or line-discipline, but unfortunately neither support
> > > hotplugging yet.
> > > 
> > > See http://www.usbuirt.com/
> > > 
> > > Signed-off-by: Sean Young <sean@mess.org>
> > > ---
> 
> > > +struct uirt {
> > > +	struct device *dev;
> > > +	struct usb_device *usbdev;
> > > +
> > > +	struct rc_dev *rc;
> > > +	struct urb *urb_in, *urb_out;
> > > +
> > > +	u8 *in;
> > > +	u8 *out;
> > > +	struct completion cmd_done;
> > > +	u8 freq;
> > > +	u8 high;
> > > +	bool wideband;
> > > +	u32 last_duration;
> > > +
> > > +	enum cmd_state cmd_state;
> > > +	enum rx_state rx_state;
> > > +
> > > +	void *tx_buf;
> > > +	u32 tx_len;
> > > +
> > > +	char phys[64];
> > > +};
> 
> > > +static void uirt_response(struct uirt *uirt, u32 len)
> > > +{
> > > +	int offset = 2;
> > > +	int i;
> > > +
> > > +	dev_dbg(uirt->dev, "state:%d data: %*phN\n", uirt->cmd_state, len, uirt->in);
> > > +
> > > +	// Do we have more IR to transmit and is Clear-To-Send set
> > > +	if (uirt->cmd_state == CMD_STATE_STREAMING_TX && len >= 2 &&
> > > +	    uirt->tx_len && uirt->in[0] & FTDI_RS0_CTS) {
> > 
> > Do you really need to handle this manually when you have hardware
> > assisted flow control enabled?
> > 
> > > +		u32 len;
> > > +		int err;
> > > +
> > > +		len = min_t(u32, uirt->tx_len, MAX_PACKET);
> > > +
> > > +		memcpy(uirt->out, uirt->tx_buf, len);
> > > +		uirt->urb_out->transfer_buffer_length = len;
> > > +
> > > +		uirt->tx_len -= len;
> > > +		uirt->tx_buf += len;
> > > +
> > > +		err = usb_submit_urb(uirt->urb_out, GFP_ATOMIC);
> > > +		if (err != 0)
> > > +			dev_warn(uirt->dev,
> > > +				 "failed to submit out urb: %d\n", err);
> 
> Also, this looks entirely broken since you don't have any
> synchronisation with uirt_command() below which may try to submit the
> same URB in parallel.

uirt_command() only gets called via lirc chardev ioctl/write ops; the lirc
chardev code does locking for the drivers already. So, if someone does a
write to /dev/lirc0 (which means transmit) the mutex is taken, no other
writes/ioctls are allowed on /dev/lirc0; the uirt_tx() calls uirt_command()
which waits for completion. During this period the code above can be
executed, but not after the transmit succeeds or fails (when the lircdev
chardev mutex is released, see:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/rc/lirc_dev.c#n337

Having said all that this is not evident from code at all. A comment could
really help.

Thanks,

Sean
