Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6F973828B1
	for <lists+linux-media@lfdr.de>; Mon, 17 May 2021 11:46:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236151AbhEQJrs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 May 2021 05:47:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:47662 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236066AbhEQJrs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 May 2021 05:47:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 69EFF611CA;
        Mon, 17 May 2021 09:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621244292;
        bh=FODlh22Ar0Gze2kxdZOImhYdQ1KD7tuxHQZzw8GIY/4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AOWF5PL77d4zpUTDxlKCweel4PSNdA1O/qN9tDg+2d/DU0pR2UAT0bmqV2FP9pXrK
         Jys3Pjk+//7i8iNew2v5cyhO8aa9W1xGzqCppdIbIMn1hcNKdLZJ9O96H0HMtSTzmB
         S1I4pyKpLvQ0ZYxGNzuklZ1coX/lr6jWkEanldJIfD1RUnF7FSGchnzFOnblIMQyrQ
         JVww0/6QVNaJVPpbNCbglSHeF3O6+rCkP+xKjYXv0VRle0vXwBoje61QnijHx/JSi0
         QaRPk78RNultpudbNyT+MQfAY5Pp8UVGoWhFj6Mrl75wuo2YQFsgu3VHU6jdiGk07t
         qbPlv3hCJdWNA==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1liZhS-0003kv-9v; Mon, 17 May 2021 11:38:10 +0200
Date:   Mon, 17 May 2021 11:38:10 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Rhees <support@usbuirt.com>,
        Oliver Neukum <oneukum@suse.com>
Subject: Re: [PATCH v3 2/3] media: rc: new driver for USB-UIRT device
Message-ID: <YKI5gthIZBkzHFzz@hovoldconsulting.com>
References: <cover.1620304986.git.sean@mess.org>
 <1c40fb8cf798d185a62b56121f58eff1720b76a6.1620304986.git.sean@mess.org>
 <YJ5hI4HCfkSgKoNQ@hovoldconsulting.com>
 <20210515095241.GB31801@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210515095241.GB31801@gofer.mess.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, May 15, 2021 at 10:52:41AM +0100, Sean Young wrote:
> On Fri, May 14, 2021 at 01:38:11PM +0200, Johan Hovold wrote:
> > On Thu, May 06, 2021 at 01:44:54PM +0100, Sean Young wrote:
> > > See http://www.usbuirt.com/
> > 
> > No proper commit message?
> 
> No sure what to say here what's not already in the first line of the
> commit.
> 
> Maybe I could mention the fact this uses fdti usb serial chip.

That'd be good. Perhaps mention why you chose to implement a kernel
driver for this device which appears to already be supported by the lirc
daemon from user space too.
 
> > > +static void uirt_response(struct uirt *uirt, u32 len)
> > > +{
> > > +	int i;
> > > +
> > > +	dev_dbg(uirt->dev, "state:%d data: %*phN\n", uirt->cmd_state, len, uirt->in);
> > > +
> > > +	// Do we have more IR to transmit
> > > +	if (uirt->cmd_state == CMD_STATE_STREAMING_TX && len >= 2 &&
> > > +	    uirt->tx_len && uirt->in[0] & FTDI_RS0_CTS) {
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
> > > +	}
> > > +
> > > +	// if we only have two bytes, it just gives us the serial line status
> > > +	if (len <= 2)
> > > +		return;
> > > +
> > > +	switch (uirt->cmd_state) {
> > > +	case CMD_STATE_GETVERSION:
> > > +		if (len == 10) {
> > > +			// check checksum
> > > +			u8 checksum = 0;
> > > +
> > > +			for (i = 2; i < len; i++)
> > > +				checksum += uirt->in[i];
> > > +
> > > +			if (checksum != 0) {
> > > +				dev_err(uirt->dev, "checksum does not match: %*phN\n",
> > > +					len, uirt->in);
> > > +				return;
> > > +			}
> > > +
> > > +			dev_info(uirt->dev,
> > > +				 "USB-UIRT firmware v%u.%u protocol v%u.%u %02u-%02u-%04u",
> > > +				 uirt->in[2], uirt->in[3], uirt->in[4],
> > > +				 uirt->in[5], uirt->in[6], uirt->in[7],
> > > +				 2000 + uirt->in[8]);
> > > +
> > > +			complete(&uirt->cmd_done);
> > > +			uirt->cmd_state = CMD_STATE_IRDATA;
> > > +			return;
> > > +		}
> > > +		break;
> > > +	case CMD_STATE_DOTXRAW:
> > > +	case CMD_STATE_STREAMING_TX:
> > > +	case CMD_STATE_SETMODERAW:
> > > +	case CMD_STATE_SETMODEWIDEBAND:
> > > +		if (len == 3) {
> > > +			switch (uirt->in[2]) {
> > > +			case 0x20:
> > > +				// 0x20 transmitting is expected during streaming tx
> > > +				if (uirt->cmd_state == CMD_STATE_STREAMING_TX)
> > > +					return;
> > > +
> > > +				if (uirt->cmd_state == CMD_STATE_DOTXRAW)
> > > +					complete(&uirt->cmd_done);
> > > +				else
> > > +					dev_err(uirt->dev, "device transmitting");
> > > +				break;
> > > +			case 0x21:
> > > +				if (uirt->tx_len) {
> > > +					dev_err(uirt->dev, "tx completed with %u left to send",
> > > +						uirt->tx_len);
> > > +				} else {
> > > +					if (uirt->cmd_state == CMD_STATE_SETMODERAW)
> > > +						uirt->wideband = false;
> > > +					if (uirt->cmd_state == CMD_STATE_SETMODEWIDEBAND)
> > > +						uirt->wideband = true;
> > > +
> > > +					complete(&uirt->cmd_done);
> > > +				}
> > > +				break;
> > > +			case 0x80:
> > > +				dev_err(uirt->dev, "checksum error");
> > > +				break;
> > > +			case 0x81:
> > > +				dev_err(uirt->dev, "timeout");
> > > +				break;
> > > +			case 0x82:
> > > +				dev_err(uirt->dev, "command error");
> > > +				break;
> > > +			default:
> > > +				dev_err(uirt->dev, "unknown response");
> > > +			}
> > > +
> > > +			uirt->cmd_state = CMD_STATE_IRDATA;
> > > +			return;
> > > +		}
> > > +	default:
> > > +		break;
> > > +	}
> > > +
> > > +	if (uirt->wideband)
> > > +		uirt_wideband(uirt, len);
> > > +	else
> > > +		uirt_raw_mode(uirt, len);
> > > +}
> > 
> > Your code assumes that you'll always get one message per transfer, but
> > since the device uses a regular FTDI chip with a FIFO this isn't
> > guaranteed. 
> 
> I guess you're talking about that data can straddle multiple packets
> because there is a fifo involved, or there can be more data before/after
> a command response.

Right.

> Let me see what I can do about that.

You'd get buffering for free if you let the tty layer handle this...

> > > +static int init_ftdi(struct usb_device *udev)
> > > +{
> > > +	int err;
> > > +
> > > +	// set the baud rate
> > > +	err = usb_control_msg(udev, usb_sndctrlpipe(udev, 0),
> > > +			      FTDI_SIO_SET_BAUDRATE_REQUEST,
> > > +			      FTDI_SIO_SET_BAUDRATE_REQUEST_TYPE,
> > > +			      0x4009, 0x0001,
> > > +			      NULL, 0, USB_CTRL_SET_TIMEOUT);
> > > +	if (err)
> > > +		return err;
> > > +
> > > +	// enabling rts/cts flow control
> > > +	err = usb_control_msg(udev, usb_sndctrlpipe(udev, 0),
> > > +			      FTDI_SIO_SET_FLOW_CTRL_REQUEST,
> > > +			      FTDI_SIO_SET_FLOW_CTRL_REQUEST_TYPE,
> > > +			      0, FTDI_SIO_RTS_CTS_HS,
> > > +			      NULL, 0, USB_CTRL_SET_TIMEOUT);
> > > +	if (err)
> > > +		return err;
> > 
> > Does the device UART actually have RTS wired up?
> 
> I don't know TBH. However it does have CTS wired up.

When using a serial driver, RTS would be asserted on open and
(typically) deasserted on close. Not sure it matters.

The FTDI driver would also clear the receive FIFO when opening the port
I believe.

Johan
