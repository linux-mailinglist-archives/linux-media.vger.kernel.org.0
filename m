Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCEDB3B9F2E
	for <lists+linux-media@lfdr.de>; Fri,  2 Jul 2021 12:42:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231466AbhGBKoy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jul 2021 06:44:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:43234 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230205AbhGBKox (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 2 Jul 2021 06:44:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 28DD861263;
        Fri,  2 Jul 2021 10:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625222541;
        bh=BZ4VgQiZXgFoD21UK6fZ0SXMqRpUJje1vWxiYRkVDXM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=e6xb8rCgLnfatUe5HBOgpdjsFNocr504+64mK6deItNHWnah7Tg7BfW7Bj6djGzPb
         LFiphRN5eAXy6RWC5f71ehqSAeNgJhbDo0vyrrQeU4nCELfz5Tw20RyZ4lcSVhev9U
         lc6ybn2fArLza5+0dIB7LAU+Hokor6aiXFzT0REr3Qoa/Klv2CTijB9+we8oV3o9dv
         2CuUtGa/Wbg4JY8UM8VuApituEjYenupva78lDqE9TdccUSroadOgrPpmTL4J9HJJR
         WF48CczFWgPPXqGbzYJ9JB9ZTOB5Los7dVEt7sdgAtkalibYycNkIuPC9en/Tohx0r
         E05QBBqS6VuhQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1lzGck-0003BB-1F; Fri, 02 Jul 2021 12:42:18 +0200
Date:   Fri, 2 Jul 2021 12:42:18 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Rhees <support@usbuirt.com>,
        Oliver Neukum <oneukum@suse.com>
Subject: Re: [PATCH v5 1/2] media: rc: new driver for USB-UIRT device
Message-ID: <YN7tihZHJERJAWzL@hovoldconsulting.com>
References: <cover.1624006513.git.sean@mess.org>
 <710e8007bc7365be8f999bae3aafaa22c3b2f7d1.1624006513.git.sean@mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <710e8007bc7365be8f999bae3aafaa22c3b2f7d1.1624006513.git.sean@mess.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jun 18, 2021 at 11:18:46AM +0100, Sean Young wrote:
> This device uses an ftdi usb serial port, so this driver has a tiny
> amount of usb ftdi code. It would be preferable to connect this driver via
> serdev or line-discipline, but unfortunately neither support
> hotplugging yet.
> 
> See http://www.usbuirt.com/
> 
> Signed-off-by: Sean Young <sean@mess.org>
> ---
>  drivers/media/rc/Kconfig  |  11 +
>  drivers/media/rc/Makefile |   1 +
>  drivers/media/rc/uirt.c   | 744 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 756 insertions(+)
>  create mode 100644 drivers/media/rc/uirt.c
> 
> diff --git a/drivers/media/rc/Kconfig b/drivers/media/rc/Kconfig
> index d0a8326b75c2..cb1a2c65f920 100644
> --- a/drivers/media/rc/Kconfig
> +++ b/drivers/media/rc/Kconfig
> @@ -471,6 +471,17 @@ config IR_TOY
>  	   To compile this driver as a module, choose M here: the module will be
>  	   called ir_toy.
>  
> +config IR_UIRT
> +	tristate "USB-UIRT"
> +	depends on RC_CORE
> +	depends on USB_ARCH_HAS_HCD
> +	help
> +	   Say Y here if you want to use the USB-UIRT. See
> +	   http://www.usbuirt.com/
> +
> +	   To compile this driver as a module, choose M here: the module will be
> +	   called uirt.
> +
>  endif #RC_DEVICES
>  
>  endif #RC_CORE
> diff --git a/drivers/media/rc/Makefile b/drivers/media/rc/Makefile
> index 692e9b6b203f..068036698747 100644
> --- a/drivers/media/rc/Makefile
> +++ b/drivers/media/rc/Makefile
> @@ -50,3 +50,4 @@ obj-$(CONFIG_IR_SIR) += sir_ir.o
>  obj-$(CONFIG_IR_MTK) += mtk-cir.o
>  obj-$(CONFIG_RC_XBOX_DVD) += xbox_remote.o
>  obj-$(CONFIG_IR_TOY) += ir_toy.o
> +obj-$(CONFIG_IR_UIRT) += uirt.o
> diff --git a/drivers/media/rc/uirt.c b/drivers/media/rc/uirt.c
> new file mode 100644
> index 000000000000..928b29680f64
> --- /dev/null
> +++ b/drivers/media/rc/uirt.c
> @@ -0,0 +1,744 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +/*
> + * USB-UIRT
> + *
> + * Copyright (C) 2021 Sean Young <sean@mess.org>
> + *
> + * See http://www.usbuirt.com/USB-UIRT%20Command%20Protocol.doc
> + */
> +
> +#include <linux/completion.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/usb.h>
> +#include <linux/slab.h>
> +#include <linux/usb/input.h>
> +
> +#include <media/rc-core.h>
> +
> +/* Copied from drivers/usb/serial/ftdi_sio.h */
> +#define FTDI_SIO_SET_BAUDRATE_REQUEST_TYPE 0x40
> +#define FTDI_SIO_SET_BAUDRATE_REQUEST 3
> +
> +#define FTDI_SIO_SET_LATENCY_TIMER_REQUEST FTDI_SIO_SET_LATENCY_TIMER
> +#define FTDI_SIO_SET_LATENCY_TIMER_REQUEST_TYPE 0x40
> +
> +#define FTDI_SIO_SET_FLOW_CTRL_REQUEST_TYPE 0x40
> +#define FTDI_SIO_SET_FLOW_CTRL_REQUEST FTDI_SIO_SET_FLOW_CTRL
> +
> +#define FTDI_SIO_SET_FLOW_CTRL 2 /* Set flow control register */
> +#define FTDI_SIO_SET_LATENCY_TIMER 9 /* Set the latency timer */
> +
> +#define FTDI_SIO_RTS_CTS_HS BIT(8)
> +#define FTDI_RS0_CTS BIT(4)
> +
> +static const u8 CMD_GETVERSION[] = { 0x23, 0xdd };
> +static const u8 CMD_SETMODERAW[] = { 0x21, 0xdf };
> +static const u8 CMD_SETWIDEBAND[] = { 0x24, 0xdc };
> +
> +#define UNIT_US 50
> +#define IR_TIMEOUT 12500
> +#define MAX_PACKET 64
> +
> +enum cmd_state {
> +	CMD_STATE_GETVERSION,
> +	CMD_STATE_SETMODERAW,
> +	CMD_STATE_SETMODEWIDEBAND,
> +	CMD_STATE_IRDATA,
> +	CMD_STATE_DOTXRAW,
> +	CMD_STATE_STREAMING_TX,
> +};
> +
> +enum rx_state {
> +	RX_STATE_INTERSPACE_HIGH,
> +	RX_STATE_INTERSPACE_LOW,
> +	RX_STATE_ON_HIGH,
> +	RX_STATE_ON_LOW,
> +	RX_STATE_FREQ_HIGH,
> +	RX_STATE_FREQ_LOW,
> +	RX_STATE_OFF_HIGH,
> +	RX_STATE_OFF_LOW,
> +};
> +
> +struct uirt {
> +	struct device *dev;
> +	struct usb_device *usbdev;
> +
> +	struct rc_dev *rc;
> +	struct urb *urb_in, *urb_out;
> +
> +	u8 *in;
> +	u8 *out;
> +	struct completion cmd_done;
> +	u8 freq;
> +	u8 high;
> +	bool wideband;
> +	u32 last_duration;
> +
> +	enum cmd_state cmd_state;
> +	enum rx_state rx_state;
> +
> +	void *tx_buf;
> +	u32 tx_len;
> +
> +	char phys[64];
> +};
> +
> +// read IR in raw mode
> +static void uirt_raw_mode(struct uirt *uirt, u32 offset, u32 len)
> +{
> +	uint i, duration;
> +
> +	for (i = offset; i < len; i++) {
> +		switch (uirt->rx_state) {
> +		case RX_STATE_INTERSPACE_HIGH:
> +			uirt->rx_state = RX_STATE_INTERSPACE_LOW;
> +			break;
> +		case RX_STATE_INTERSPACE_LOW:
> +			uirt->rx_state = RX_STATE_ON_HIGH;
> +			break;
> +		case RX_STATE_ON_HIGH:
> +			duration = uirt->in[i];
> +			if (duration == 0)
> +				duration = 1;
> +
> +			ir_raw_event_store(uirt->rc, &((struct ir_raw_event) {
> +				.duration = duration * UNIT_US,
> +				.pulse = true,
> +			}));
> +
> +			uirt->rx_state = RX_STATE_OFF_HIGH;
> +			break;
> +		case RX_STATE_OFF_HIGH:
> +			if (uirt->in[i] == 0xff) {
> +				ir_raw_event_store(uirt->rc, &((struct ir_raw_event) {
> +					.duration = IR_TIMEOUT,
> +					.timeout = true,
> +				}));
> +				uirt->rx_state = RX_STATE_INTERSPACE_HIGH;
> +				break;
> +			}
> +
> +			duration = uirt->in[i];
> +			if (duration == 0)
> +				duration = 1;
> +
> +			ir_raw_event_store(uirt->rc, &((struct ir_raw_event) {
> +				.duration = duration * UNIT_US,
> +				.pulse = false,
> +			}));
> +			uirt->rx_state = RX_STATE_ON_HIGH;
> +			break;
> +		default:
> +			WARN(1, "unreachable state");

This should probably be dev_warn_ratelimited() or similar. Judging from
a quick look a malicious device can end up triggering this.

> +			uirt->rx_state = RX_STATE_INTERSPACE_HIGH;
> +			break;
> +		}
> +	}
> +
> +	ir_raw_event_handle(uirt->rc);
> +}
> +
> +// Read IR in wideband mode. The byte stream is delivered in packets,
> +// and the values which come in two bytes may straddle two packets
> +static void uirt_wideband(struct uirt *uirt, u32 offset, u32 len)
> +{
> +	uint i, duration, carrier, pulses;
> +
> +	for (i = offset; i < len; i++) {
> +		switch (uirt->rx_state) {
> +		case RX_STATE_INTERSPACE_HIGH:
> +			uirt->rx_state = RX_STATE_INTERSPACE_LOW;
> +			break;
> +		case RX_STATE_INTERSPACE_LOW:
> +			uirt->rx_state = RX_STATE_ON_HIGH;
> +			break;
> +		case RX_STATE_ON_HIGH:
> +			uirt->high = uirt->in[i];
> +			uirt->rx_state = RX_STATE_ON_LOW;
> +			break;
> +		case RX_STATE_ON_LOW:
> +			// duration is in 400ns units
> +			duration = (uirt->high << 8) | uirt->in[i];
> +			uirt->last_duration = duration;
> +			// Convert to microseconds
> +			duration = DIV_ROUND_CLOSEST(duration * 2, 5);
> +			if (duration == 0)
> +				duration = 1;
> +			ir_raw_event_store(uirt->rc, &((struct ir_raw_event) {
> +				.duration = duration,
> +				.pulse = true,
> +			}));
> +			uirt->rx_state = RX_STATE_FREQ_HIGH;
> +			break;
> +		case RX_STATE_FREQ_HIGH:
> +			if (uirt->in[i] & 0x80) {
> +				uirt->high = uirt->in[i] & 0x7f;
> +				uirt->rx_state = RX_STATE_FREQ_LOW;
> +				break;
> +			}
> +
> +			uirt->high = 0;
> +			fallthrough;
> +		case RX_STATE_FREQ_LOW:
> +			pulses = (uirt->high << 8) | uirt->in[i];
> +			if (pulses && uirt->last_duration) {
> +				dev_dbg(uirt->dev, "carrier duration %u pulses %u",
> +					uirt->last_duration, pulses);
> +
> +				// calculate the Hz of pulses in duration 400ns units
> +				carrier = DIV_ROUND_CLOSEST_ULL(pulses * 10000000ull,
> +								uirt->last_duration * 4);
> +				ir_raw_event_store(uirt->rc, &((struct ir_raw_event) {
> +					.carrier = carrier,
> +					.carrier_report = true,
> +				}));
> +			}
> +			uirt->rx_state = RX_STATE_OFF_HIGH;
> +			break;
> +		case RX_STATE_OFF_HIGH:
> +			if (uirt->in[i] == 0xff) {
> +				ir_raw_event_store(uirt->rc, &((struct ir_raw_event) {
> +					.duration = IR_TIMEOUT,
> +					.timeout = true,
> +				}));
> +				uirt->rx_state = RX_STATE_INTERSPACE_HIGH;
> +			} else {
> +				uirt->high = uirt->in[i];
> +				uirt->rx_state = RX_STATE_OFF_LOW;
> +			}
> +			break;
> +		case RX_STATE_OFF_LOW:
> +			// Convert 400ns units to microseconds
> +			duration = DIV_ROUND_CLOSEST(((uirt->high << 8) | uirt->in[i]) * 2, 5);
> +			if (duration == 0)
> +				duration = 1;
> +			ir_raw_event_store(uirt->rc, &((struct ir_raw_event) {
> +				.duration = duration,
> +				.pulse = false,
> +			}));
> +			uirt->rx_state = RX_STATE_ON_HIGH;
> +			break;
> +		}
> +	}
> +
> +	ir_raw_event_handle(uirt->rc);
> +}
> +
> +static void uirt_response(struct uirt *uirt, u32 len)
> +{
> +	int offset = 2;
> +	int i;
> +
> +	dev_dbg(uirt->dev, "state:%d data: %*phN\n", uirt->cmd_state, len, uirt->in);
> +
> +	// Do we have more IR to transmit and is Clear-To-Send set
> +	if (uirt->cmd_state == CMD_STATE_STREAMING_TX && len >= 2 &&
> +	    uirt->tx_len && uirt->in[0] & FTDI_RS0_CTS) {

Do you really need to handle this manually when you have hardware
assisted flow control enabled?

> +		u32 len;
> +		int err;
> +
> +		len = min_t(u32, uirt->tx_len, MAX_PACKET);
> +
> +		memcpy(uirt->out, uirt->tx_buf, len);
> +		uirt->urb_out->transfer_buffer_length = len;
> +
> +		uirt->tx_len -= len;
> +		uirt->tx_buf += len;
> +
> +		err = usb_submit_urb(uirt->urb_out, GFP_ATOMIC);
> +		if (err != 0)
> +			dev_warn(uirt->dev,
> +				 "failed to submit out urb: %d\n", err);
> +	}
> +
> +	// if we only have two bytes, it just gives us the serial line status
> +	if (len <= 2)
> +		return;
> +
> +	// We have to assume that the response to a command is at the beginning
> +	// of the packet. There is no way to distinguish IR data from command
> +	// responses other than the position in the byte stream.
> +	switch (uirt->cmd_state) {
> +	case CMD_STATE_GETVERSION:
> +		if (len >= 10) {
> +			// check checksum
> +			u8 checksum = 0;
> +
> +			for (i = 2; i < len; i++)
> +				checksum += uirt->in[i];
> +
> +			if (checksum != 0) {
> +				dev_err(uirt->dev, "checksum does not match: %*phN\n",
> +					len, uirt->in);

Should this not be ratelimited too in case you get out of sync?

> +				return;
> +			}
> +
> +			dev_info(uirt->dev,
> +				 "USB-UIRT firmware v%u.%u protocol v%u.%u %04u-%02u-%02u",

Missing '\n' and in a lot of other printks throughout.

> +				 uirt->in[2], uirt->in[3], uirt->in[4], uirt->in[5],
> +				 uirt->in[8] + 2000, uirt->in[7], uirt->in[6]);
> +
> +			complete(&uirt->cmd_done);
> +			uirt->cmd_state = CMD_STATE_IRDATA;
> +			offset += 10;
> +		}
> +		break;
> +	case CMD_STATE_DOTXRAW:
> +	case CMD_STATE_STREAMING_TX:
> +	case CMD_STATE_SETMODERAW:
> +	case CMD_STATE_SETMODEWIDEBAND:
> +		if (len >= 3) {
> +			switch (uirt->in[2]) {
> +			case 0x20:
> +				// 0x20 transmitting is expected during streaming tx
> +				if (uirt->cmd_state == CMD_STATE_STREAMING_TX)
> +					return;
> +
> +				if (uirt->cmd_state == CMD_STATE_DOTXRAW)
> +					complete(&uirt->cmd_done);
> +				else
> +					dev_err(uirt->dev, "device transmitting");

I think most of these printks need to be ratelimited or dev_dbg() since
bad input input can trigger them.

Another missing newline, but please fix throughout.

> +				break;
> +			case 0x21:
> +				if (uirt->tx_len) {
> +					dev_err(uirt->dev, "tx completed with %u left to send",
> +						uirt->tx_len);
> +				} else {
> +					if (uirt->cmd_state == CMD_STATE_SETMODERAW)
> +						uirt->wideband = false;
> +					if (uirt->cmd_state == CMD_STATE_SETMODEWIDEBAND)
> +						uirt->wideband = true;
> +
> +					complete(&uirt->cmd_done);
> +				}
> +				break;
> +			case 0x80:
> +				dev_err(uirt->dev, "checksum error");
> +				break;
> +			case 0x81:
> +				dev_err(uirt->dev, "timeout");
> +				break;
> +			case 0x82:
> +				dev_err(uirt->dev, "command error");
> +				break;
> +			default:
> +				dev_err(uirt->dev, "unknown response");
> +			}
> +
> +			uirt->cmd_state = CMD_STATE_IRDATA;
> +			offset += 1;
> +		}
> +	default:
> +		break;
> +	}
> +
> +	if (uirt->wideband)
> +		uirt_wideband(uirt, offset, len);
> +	else
> +		uirt_raw_mode(uirt, offset, len);
> +}

> +static int uirt_command(struct uirt *uirt, const u8 *cmd, u32 cmd_len,
> +			enum cmd_state state)
> +{
> +	int err;
> +
> +	init_completion(&uirt->cmd_done);
> +
> +	uirt->cmd_state = state;
> +
> +	memcpy(uirt->out, cmd, cmd_len);
> +	uirt->urb_out->transfer_buffer_length = cmd_len;
> +
> +	err = usb_submit_urb(uirt->urb_out, GFP_KERNEL);
> +	if (err != 0) {
> +		uirt->cmd_state = CMD_STATE_IRDATA;
> +		return err;
> +	}
> +
> +	if (!wait_for_completion_timeout(&uirt->cmd_done,
> +					 msecs_to_jiffies(USB_CTRL_SET_TIMEOUT))) {
> +		usb_kill_urb(uirt->urb_out);
> +		uirt->cmd_state = CMD_STATE_IRDATA;
> +		return -ETIMEDOUT;
> +	}
> +
> +	return 0;
> +}

> +static int uirt_tx(struct rc_dev *rc, uint *txbuf, uint count)
> +{
> +	struct uirt *uirt = rc->priv;
> +	u8 *out;
> +	u32 i, dest, unit_raw, freq, len;
> +	int err;
> +
> +	// streaming tx does not work for short IR; use non-streaming
> +	// tx for short IR
> +	if (count <= 24)
> +		return uirt_short_tx(rc, txbuf, count);
> +
> +	out = kmalloc(count * 2 + 3, GFP_KERNEL);
> +	if (!out)
> +		return -ENOMEM;
> +
> +	out[0] = 0x25; // Streaming Transmit
> +	out[1] = 0xdb; // checksum over command (just the previous byte)
> +	out[2] = uirt->freq; // carrier frequency
> +
> +	dest = 3;
> +
> +	freq = uirt->freq & 0x7f;
> +
> +	for (i = 0; i < count; i++) {
> +		// width = (us / freq) * 2.5
> +		unit_raw = DIV_ROUND_CLOSEST(txbuf[i] * 5, freq * 2);
> +
> +		if (unit_raw == 0)
> +			unit_raw = 1;
> +		else if (unit_raw > 127)
> +			out[dest++] = (unit_raw >> 8) | 0x80;
> +
> +		out[dest++] = unit_raw;
> +	}
> +
> +	len = min_t(u32, dest, MAX_PACKET);
> +
> +	uirt->tx_buf = out + len;
> +	uirt->tx_len = dest - len;
> +
> +	err = uirt_command(uirt, out, len, CMD_STATE_STREAMING_TX);
> +	kfree(out);

This look fragile; are you sure nothing can access uirt_tx->buf (out)
after the command returns here? 

> +	if (err != 0)
> +		return err;
> +
> +	return count;
> +}
> +
> +static int uirt_set_tx_carrier(struct rc_dev *dev, u32 carrier)
> +{
> +	struct uirt *uirt = dev->priv;
> +
> +	if (carrier == 0)
> +		// bit 7 must be 1 for unmodulated, lower bits need to
> +		// be something that makes sense for tx
> +		uirt->freq = 0xc0;
> +	else if (carrier >= 20000 && carrier <= 500000)
> +		// bit 7 must be 0 for modulated
> +		uirt->freq = 2500000 / carrier;
> +	else
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static int uirt_set_rx_wideband(struct rc_dev *dev, int enable)
> +{
> +	struct uirt *uirt = dev->priv;
> +	int err;
> +
> +	if (enable)
> +		err = uirt_command(uirt, CMD_SETWIDEBAND,
> +				   sizeof(CMD_SETWIDEBAND),
> +				   CMD_STATE_SETMODEWIDEBAND);
> +	else
> +		err = uirt_command(uirt, CMD_SETMODERAW,
> +				   sizeof(CMD_SETMODERAW),
> +				   CMD_STATE_SETMODERAW);
> +
> +	if (err) {
> +		dev_err(uirt->dev, "set mode command failed: %d\n",
> +			err);
> +		return err;
> +	}
> +
> +	return 0;
> +}
> +
> +static int init_ftdi(struct usb_device *udev)
> +{
> +	int err;
> +
> +	// set the baud rate

Please mention the rate here too.

> +	err = usb_control_msg(udev, usb_sndctrlpipe(udev, 0),
> +			      FTDI_SIO_SET_BAUDRATE_REQUEST,
> +			      FTDI_SIO_SET_BAUDRATE_REQUEST_TYPE,
> +			      0x4009, 0x0001,
> +			      NULL, 0, USB_CTRL_SET_TIMEOUT);
> +	if (err)
> +		return err;
> +
> +	// enabling rts/cts flow control
> +	err = usb_control_msg(udev, usb_sndctrlpipe(udev, 0),
> +			      FTDI_SIO_SET_FLOW_CTRL_REQUEST,
> +			      FTDI_SIO_SET_FLOW_CTRL_REQUEST_TYPE,
> +			      0, FTDI_SIO_RTS_CTS_HS,
> +			      NULL, 0, USB_CTRL_SET_TIMEOUT);
> +	if (err)
> +		return err;
> +
> +	// Set latency in milliseconds. The USB-UIRT will generate a
> +	// urb every latency milliseconds (IR or not), so this should be
> +	// set as high as possible to reduce interrupts. However, setting
> +	// this value too high will mean there is a preceptible delay for
> +	// IR being processed and a key press being registered.
> +	//
> +	// Choose 50ms as a compromise.
> +	return usb_control_msg(udev, usb_sndctrlpipe(udev, 0),
> +			      FTDI_SIO_SET_LATENCY_TIMER_REQUEST,
> +			      FTDI_SIO_SET_LATENCY_TIMER_REQUEST_TYPE,
> +			      50, 0,
> +			      NULL, 0, USB_CTRL_SET_TIMEOUT);
> +}

Johan
