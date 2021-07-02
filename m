Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DD913BA04B
	for <lists+linux-media@lfdr.de>; Fri,  2 Jul 2021 14:23:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232111AbhGBM0X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jul 2021 08:26:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:59354 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232047AbhGBM0X (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 2 Jul 2021 08:26:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3C3AF61427;
        Fri,  2 Jul 2021 12:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625228631;
        bh=vh3Z/WJsJn2qr/eDwTpVu1S+XhaBDn6vqQ0KQCgUrFk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=J5SN6badNCu+EBP80FCeJbrPNAg8Hb8XpWnEl7RIavaZlY93j1+tB4upOthqF3O48
         j+xDHxl+KDNqLCA64/X7o25WbiPAjELMSOWivuanfVH7lnirzNu9NStya0wImFP9hv
         +G0DVC45KFbeL1zAxEzXET2RwJwsRYmMPfbJ0WZvj+U+AHbwCApJNLlvU4DSd872LB
         GR80HjpwV6kEqyClH9ASZ7Ag0/8tQcVoUErnfTkEHiCwbi9pOBgOanMtbEmTjyqbxF
         q06I3pz3ohHgTfL2ZyUvzD9R/tKXXPeMa4PK5MEobV2Bh2ofQUuheW809bAt3MEabd
         b9DBUpcOKkd3Q==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1lzICy-0003Tr-6r; Fri, 02 Jul 2021 14:23:48 +0200
Date:   Fri, 2 Jul 2021 14:23:48 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Rhees <support@usbuirt.com>,
        Oliver Neukum <oneukum@suse.com>
Subject: Re: [PATCH v5 1/2] media: rc: new driver for USB-UIRT device
Message-ID: <YN8FVEIcxnznaz1F@hovoldconsulting.com>
References: <cover.1624006513.git.sean@mess.org>
 <710e8007bc7365be8f999bae3aafaa22c3b2f7d1.1624006513.git.sean@mess.org>
 <YN7tihZHJERJAWzL@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YN7tihZHJERJAWzL@hovoldconsulting.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jul 02, 2021 at 12:42:18PM +0200, Johan Hovold wrote:
> On Fri, Jun 18, 2021 at 11:18:46AM +0100, Sean Young wrote:
> > This device uses an ftdi usb serial port, so this driver has a tiny
> > amount of usb ftdi code. It would be preferable to connect this driver via
> > serdev or line-discipline, but unfortunately neither support
> > hotplugging yet.
> > 
> > See http://www.usbuirt.com/
> > 
> > Signed-off-by: Sean Young <sean@mess.org>
> > ---

> > +struct uirt {
> > +	struct device *dev;
> > +	struct usb_device *usbdev;
> > +
> > +	struct rc_dev *rc;
> > +	struct urb *urb_in, *urb_out;
> > +
> > +	u8 *in;
> > +	u8 *out;
> > +	struct completion cmd_done;
> > +	u8 freq;
> > +	u8 high;
> > +	bool wideband;
> > +	u32 last_duration;
> > +
> > +	enum cmd_state cmd_state;
> > +	enum rx_state rx_state;
> > +
> > +	void *tx_buf;
> > +	u32 tx_len;
> > +
> > +	char phys[64];
> > +};

> > +static void uirt_response(struct uirt *uirt, u32 len)
> > +{
> > +	int offset = 2;
> > +	int i;
> > +
> > +	dev_dbg(uirt->dev, "state:%d data: %*phN\n", uirt->cmd_state, len, uirt->in);
> > +
> > +	// Do we have more IR to transmit and is Clear-To-Send set
> > +	if (uirt->cmd_state == CMD_STATE_STREAMING_TX && len >= 2 &&
> > +	    uirt->tx_len && uirt->in[0] & FTDI_RS0_CTS) {
> 
> Do you really need to handle this manually when you have hardware
> assisted flow control enabled?
> 
> > +		u32 len;
> > +		int err;
> > +
> > +		len = min_t(u32, uirt->tx_len, MAX_PACKET);
> > +
> > +		memcpy(uirt->out, uirt->tx_buf, len);
> > +		uirt->urb_out->transfer_buffer_length = len;
> > +
> > +		uirt->tx_len -= len;
> > +		uirt->tx_buf += len;
> > +
> > +		err = usb_submit_urb(uirt->urb_out, GFP_ATOMIC);
> > +		if (err != 0)
> > +			dev_warn(uirt->dev,
> > +				 "failed to submit out urb: %d\n", err);

Also, this looks entirely broken since you don't have any
synchronisation with uirt_command() below which may try to submit the
same URB in parallel.

> > +static int uirt_command(struct uirt *uirt, const u8 *cmd, u32 cmd_len,
> > +			enum cmd_state state)
> > +{
> > +	int err;
> > +
> > +	init_completion(&uirt->cmd_done);
> > +
> > +	uirt->cmd_state = state;
> > +
> > +	memcpy(uirt->out, cmd, cmd_len);
> > +	uirt->urb_out->transfer_buffer_length = cmd_len;
> > +
> > +	err = usb_submit_urb(uirt->urb_out, GFP_KERNEL);
> > +	if (err != 0) {
> > +		uirt->cmd_state = CMD_STATE_IRDATA;
> > +		return err;
> > +	}
> > +
> > +	if (!wait_for_completion_timeout(&uirt->cmd_done,
> > +					 msecs_to_jiffies(USB_CTRL_SET_TIMEOUT))) {
> > +		usb_kill_urb(uirt->urb_out);
> > +		uirt->cmd_state = CMD_STATE_IRDATA;
> > +		return -ETIMEDOUT;
> > +	}
> > +
> > +	return 0;
> > +}
> 
> > +static int uirt_tx(struct rc_dev *rc, uint *txbuf, uint count)
> > +{
> > +	struct uirt *uirt = rc->priv;
> > +	u8 *out;
> > +	u32 i, dest, unit_raw, freq, len;
> > +	int err;
> > +
> > +	// streaming tx does not work for short IR; use non-streaming
> > +	// tx for short IR
> > +	if (count <= 24)
> > +		return uirt_short_tx(rc, txbuf, count);
> > +
> > +	out = kmalloc(count * 2 + 3, GFP_KERNEL);
> > +	if (!out)
> > +		return -ENOMEM;
> > +
> > +	out[0] = 0x25; // Streaming Transmit
> > +	out[1] = 0xdb; // checksum over command (just the previous byte)
> > +	out[2] = uirt->freq; // carrier frequency
> > +
> > +	dest = 3;
> > +
> > +	freq = uirt->freq & 0x7f;
> > +
> > +	for (i = 0; i < count; i++) {
> > +		// width = (us / freq) * 2.5
> > +		unit_raw = DIV_ROUND_CLOSEST(txbuf[i] * 5, freq * 2);
> > +
> > +		if (unit_raw == 0)
> > +			unit_raw = 1;
> > +		else if (unit_raw > 127)
> > +			out[dest++] = (unit_raw >> 8) | 0x80;
> > +
> > +		out[dest++] = unit_raw;
> > +	}
> > +
> > +	len = min_t(u32, dest, MAX_PACKET);
> > +
> > +	uirt->tx_buf = out + len;
> > +	uirt->tx_len = dest - len;
> > +
> > +	err = uirt_command(uirt, out, len, CMD_STATE_STREAMING_TX);
> > +	kfree(out);
> 
> This look fragile; are you sure nothing can access uirt_tx->buf (out)
> after the command returns here? 
> 
> > +	if (err != 0)
> > +		return err;
> > +
> > +	return count;
> > +}

Johan
