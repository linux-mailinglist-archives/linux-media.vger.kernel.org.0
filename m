Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C84C53BA1D7
	for <lists+linux-media@lfdr.de>; Fri,  2 Jul 2021 16:01:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232978AbhGBODx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jul 2021 10:03:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:52274 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232858AbhGBODw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 2 Jul 2021 10:03:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 99B3F6142B;
        Fri,  2 Jul 2021 14:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625234480;
        bh=ZEixAfVb3KStUcKY4qBpDKkbdnvxQ4oSEnSidgX3KDI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lkBr3a8n6V/9G/8Dz3O0oP1UA+obRs8gHvzocZ15lOXErq4GY+gkqUb3d5nkoemKS
         yYEYcryclHT9yW1rFvxskuGzJEygKHb4D4xmiU6xNVvyxUdHy2aBv6GiI8rIysJZXK
         4Qk66JTcRqjAlZSelZPz3V2kTGVayhUjD5fHp5+AI092PbtX2aDhyojuASl4CjYPsT
         mMaYvdqnZ2D4VrtwSn5QL7CB1pAGoQoYXJH6qZ0TaMochi/bT8wbddFOardXtEBfLP
         MMYttAksXOjPaQ5NyZKiKdwzrtlt47X83ZM4lTtf5iDR1M6DyIALc3R9w6oA/xUvEA
         EFB5LbMQvrVCQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1lzJjK-0006Z6-2A; Fri, 02 Jul 2021 16:01:18 +0200
Date:   Fri, 2 Jul 2021 16:01:18 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Rhees <support@usbuirt.com>,
        Oliver Neukum <oneukum@suse.com>
Subject: Re: [PATCH v5 1/2] media: rc: new driver for USB-UIRT device
Message-ID: <YN8cLhry5ULJUxt7@hovoldconsulting.com>
References: <cover.1624006513.git.sean@mess.org>
 <710e8007bc7365be8f999bae3aafaa22c3b2f7d1.1624006513.git.sean@mess.org>
 <YN7tihZHJERJAWzL@hovoldconsulting.com>
 <20210702131318.GB29760@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210702131318.GB29760@gofer.mess.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jul 02, 2021 at 02:13:18PM +0100, Sean Young wrote:
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

> > > +// read IR in raw mode
> > > +static void uirt_raw_mode(struct uirt *uirt, u32 offset, u32 len)
> > > +{
> > > +	uint i, duration;
> > > +
> > > +	for (i = offset; i < len; i++) {
> > > +		switch (uirt->rx_state) {
> > > +		case RX_STATE_INTERSPACE_HIGH:
> > > +			uirt->rx_state = RX_STATE_INTERSPACE_LOW;
> > > +			break;
> > > +		case RX_STATE_INTERSPACE_LOW:
> > > +			uirt->rx_state = RX_STATE_ON_HIGH;
> > > +			break;
> > > +		case RX_STATE_ON_HIGH:
> > > +			duration = uirt->in[i];
> > > +			if (duration == 0)
> > > +				duration = 1;
> > > +
> > > +			ir_raw_event_store(uirt->rc, &((struct ir_raw_event) {
> > > +				.duration = duration * UNIT_US,
> > > +				.pulse = true,
> > > +			}));
> > > +
> > > +			uirt->rx_state = RX_STATE_OFF_HIGH;
> > > +			break;
> > > +		case RX_STATE_OFF_HIGH:
> > > +			if (uirt->in[i] == 0xff) {
> > > +				ir_raw_event_store(uirt->rc, &((struct ir_raw_event) {
> > > +					.duration = IR_TIMEOUT,
> > > +					.timeout = true,
> > > +				}));
> > > +				uirt->rx_state = RX_STATE_INTERSPACE_HIGH;
> > > +				break;
> > > +			}
> > > +
> > > +			duration = uirt->in[i];
> > > +			if (duration == 0)
> > > +				duration = 1;
> > > +
> > > +			ir_raw_event_store(uirt->rc, &((struct ir_raw_event) {
> > > +				.duration = duration * UNIT_US,
> > > +				.pulse = false,
> > > +			}));
> > > +			uirt->rx_state = RX_STATE_ON_HIGH;
> > > +			break;
> > > +		default:
> > > +			WARN(1, "unreachable state");
> > 
> > This should probably be dev_warn_ratelimited() or similar. Judging from
> > a quick look a malicious device can end up triggering this.
> 
> Well, the other states can reached only by enabling the wideband receiver
> and then disabling it again, and then the driver state machine needs to
> be broken too. Just belt and braces.

Still looks like you can end up here since uirt->wideband isn't updated
until you get a reply from the device and the it's device input which
drives the uirt->rx_state transitions.

> > > +			uirt->rx_state = RX_STATE_INTERSPACE_HIGH;
> > > +			break;
> > > +		}
> > > +	}
> > > +
> > > +	ir_raw_event_handle(uirt->rc);
> > > +}
> > > +
> > > +// Read IR in wideband mode. The byte stream is delivered in packets,
> > > +// and the values which come in two bytes may straddle two packets
> > > +static void uirt_wideband(struct uirt *uirt, u32 offset, u32 len)
> > > +{
> > > +	uint i, duration, carrier, pulses;
> > > +
> > > +	for (i = offset; i < len; i++) {
> > > +		switch (uirt->rx_state) {
> > > +		case RX_STATE_INTERSPACE_HIGH:
> > > +			uirt->rx_state = RX_STATE_INTERSPACE_LOW;
> > > +			break;
> > > +		case RX_STATE_INTERSPACE_LOW:
> > > +			uirt->rx_state = RX_STATE_ON_HIGH;
> > > +			break;
> > > +		case RX_STATE_ON_HIGH:
> > > +			uirt->high = uirt->in[i];
> > > +			uirt->rx_state = RX_STATE_ON_LOW;
> > > +			break;
> > > +		case RX_STATE_ON_LOW:
> > > +			// duration is in 400ns units
> > > +			duration = (uirt->high << 8) | uirt->in[i];
> > > +			uirt->last_duration = duration;
> > > +			// Convert to microseconds
> > > +			duration = DIV_ROUND_CLOSEST(duration * 2, 5);
> > > +			if (duration == 0)
> > > +				duration = 1;
> > > +			ir_raw_event_store(uirt->rc, &((struct ir_raw_event) {
> > > +				.duration = duration,
> > > +				.pulse = true,
> > > +			}));
> > > +			uirt->rx_state = RX_STATE_FREQ_HIGH;
> > > +			break;
> > > +		case RX_STATE_FREQ_HIGH:
> > > +			if (uirt->in[i] & 0x80) {
> > > +				uirt->high = uirt->in[i] & 0x7f;
> > > +				uirt->rx_state = RX_STATE_FREQ_LOW;
> > > +				break;
> > > +			}
> > > +
> > > +			uirt->high = 0;
> > > +			fallthrough;
> > > +		case RX_STATE_FREQ_LOW:
> > > +			pulses = (uirt->high << 8) | uirt->in[i];
> > > +			if (pulses && uirt->last_duration) {
> > > +				dev_dbg(uirt->dev, "carrier duration %u pulses %u",
> > > +					uirt->last_duration, pulses);
> > > +
> > > +				// calculate the Hz of pulses in duration 400ns units
> > > +				carrier = DIV_ROUND_CLOSEST_ULL(pulses * 10000000ull,
> > > +								uirt->last_duration * 4);
> > > +				ir_raw_event_store(uirt->rc, &((struct ir_raw_event) {
> > > +					.carrier = carrier,
> > > +					.carrier_report = true,
> > > +				}));
> > > +			}
> > > +			uirt->rx_state = RX_STATE_OFF_HIGH;
> > > +			break;
> > > +		case RX_STATE_OFF_HIGH:
> > > +			if (uirt->in[i] == 0xff) {
> > > +				ir_raw_event_store(uirt->rc, &((struct ir_raw_event) {
> > > +					.duration = IR_TIMEOUT,
> > > +					.timeout = true,
> > > +				}));
> > > +				uirt->rx_state = RX_STATE_INTERSPACE_HIGH;
> > > +			} else {
> > > +				uirt->high = uirt->in[i];
> > > +				uirt->rx_state = RX_STATE_OFF_LOW;
> > > +			}
> > > +			break;
> > > +		case RX_STATE_OFF_LOW:
> > > +			// Convert 400ns units to microseconds
> > > +			duration = DIV_ROUND_CLOSEST(((uirt->high << 8) | uirt->in[i]) * 2, 5);
> > > +			if (duration == 0)
> > > +				duration = 1;
> > > +			ir_raw_event_store(uirt->rc, &((struct ir_raw_event) {
> > > +				.duration = duration,
> > > +				.pulse = false,
> > > +			}));
> > > +			uirt->rx_state = RX_STATE_ON_HIGH;
> > > +			break;
> > > +		}
> > > +	}
> > > +
> > > +	ir_raw_event_handle(uirt->rc);
> > > +}
> > > +
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
> 
> I had not considered this. I'll look into it.
> 
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
> > > +	// We have to assume that the response to a command is at the beginning
> > > +	// of the packet. There is no way to distinguish IR data from command
> > > +	// responses other than the position in the byte stream.
> > > +	switch (uirt->cmd_state) {
> > > +	case CMD_STATE_GETVERSION:
> > > +		if (len >= 10) {
> > > +			// check checksum
> > > +			u8 checksum = 0;
> > > +
> > > +			for (i = 2; i < len; i++)
> > > +				checksum += uirt->in[i];
> > > +
> > > +			if (checksum != 0) {
> > > +				dev_err(uirt->dev, "checksum does not match: %*phN\n",
> > > +					len, uirt->in);
> > 
> > Should this not be ratelimited too in case you get out of sync?
> 
> The get version command is only issued during probe, so this can only occur
> once.

Sure, but you don't update the state in case this check fails so the
following packets of IR data could all end up here until the command
times out.

> > > +				return;
> > > +			}
> > > +
> > > +			dev_info(uirt->dev,
> > > +				 "USB-UIRT firmware v%u.%u protocol v%u.%u %04u-%02u-%02u",
> > 
> > Missing '\n' and in a lot of other printks throughout.
> 
> Yes, good point. I'll fix this.
> 
> > > +				 uirt->in[2], uirt->in[3], uirt->in[4], uirt->in[5],
> > > +				 uirt->in[8] + 2000, uirt->in[7], uirt->in[6]);
> > > +
> > > +			complete(&uirt->cmd_done);
> > > +			uirt->cmd_state = CMD_STATE_IRDATA;
> > > +			offset += 10;
> > > +		}
> > > +		break;
> > > +	case CMD_STATE_DOTXRAW:
> > > +	case CMD_STATE_STREAMING_TX:
> > > +	case CMD_STATE_SETMODERAW:
> > > +	case CMD_STATE_SETMODEWIDEBAND:
> > > +		if (len >= 3) {
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
> > 
> > I think most of these printks need to be ratelimited or dev_dbg() since
> > bad input input can trigger them.
> 
> All of these occur only as a response to an user space command, like transmit
> or switching wideband/narrowband receiver. These command are not issued very
> often, usually only in response to someone running ir-ctl(1) or so.

But a broken/malicious device, or if things just get out of sync, could
end up triggering these messages repeatedly until the commands time out
after five seconds, right?

> > Another missing newline, but please fix throughout.
> 
> Absolutely.
> 
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
> > > +			offset += 1;
> > > +		}
> > > +	default:
> > > +		break;
> > > +	}
> > > +
> > > +	if (uirt->wideband)
> > > +		uirt_wideband(uirt, offset, len);
> > > +	else
> > > +		uirt_raw_mode(uirt, offset, len);
> > > +}

Johan
