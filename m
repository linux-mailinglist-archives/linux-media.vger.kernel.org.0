Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07A693808AC
	for <lists+linux-media@lfdr.de>; Fri, 14 May 2021 13:38:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231920AbhENLjX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 May 2021 07:39:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:58818 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229445AbhENLjX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 May 2021 07:39:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9CDDD61457;
        Fri, 14 May 2021 11:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620992291;
        bh=yCXhv6oKSY9vdcoN2nE/ahPiiaRNz+IQrvkqyf20dqQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ui9tkffDOsANyEp8ofmhDjaVWZGrnOaBbvJ/kBXbrvs8FW11Aqyj7cOhBq6iKPokX
         rD69WzoeeLR2PvHALwf57d7VO8B8rk48EyjhOb32/FqLplg/qflzF/RLmR6C9eAeIu
         /nXt0AsyKv9MxAl1kb1zE7aHXKa80TODGnsyKJo9FALzWKEZkue3q+3ky8YTwLV4WH
         6y28ue3Ezhhr8Z2IVy+JuIZ8NCXH3lvz44qfY25pu25j1pM/lO21LDQCV1Cj5GssKC
         U9668tPA5eJlNIq63F2JMG1sDWZXgjE979G1HXx/o9MomSJQ3RlLsDO3qrzbCp7bfI
         wvWeBk5ZrkYrw==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1lhW8y-0000wA-00; Fri, 14 May 2021 13:38:12 +0200
Date:   Fri, 14 May 2021 13:38:11 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Rhees <support@usbuirt.com>,
        Oliver Neukum <oneukum@suse.com>
Subject: Re: [PATCH v3 2/3] media: rc: new driver for USB-UIRT device
Message-ID: <YJ5hI4HCfkSgKoNQ@hovoldconsulting.com>
References: <cover.1620304986.git.sean@mess.org>
 <1c40fb8cf798d185a62b56121f58eff1720b76a6.1620304986.git.sean@mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c40fb8cf798d185a62b56121f58eff1720b76a6.1620304986.git.sean@mess.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 06, 2021 at 01:44:54PM +0100, Sean Young wrote:
> See http://www.usbuirt.com/

No proper commit message?

> Signed-off-by: Sean Young <sean@mess.org>

> +// Read IR in wideband mode. The byte stream is delivered in packets,
> +// and the values which come in two bytes may straddle two packets
> +static void uirt_wideband(struct uirt *uirt, u32 len)
> +{
> +	uint i, duration, carrier, pulses;
> +
> +	for (i = 2; i < len; i++) {
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
> +			ir_raw_event_store(uirt->rc, &((struct ir_raw_event) {
> +				.duration = DIV_ROUND_CLOSEST(duration * 2, 5),
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
> +			if (pulses) {
> +				dev_dbg(uirt->dev, "carrier duration %u pulses %u",
> +					uirt->last_duration, pulses);
> +
> +				// calculate the Hz of pulses in duration 400ns units
> +				carrier = DIV_ROUND_CLOSEST_ULL(pulses * 10000000ull,
> +								uirt->last_duration * 4);

Looks like uirt->last_duration comes from the external device and you
don't have any sanity checks to prevent division by zero here.

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
> +			// duration is in 400ns units
> +			duration = (uirt->high << 8) | uirt->in[i];
> +			ir_raw_event_store(uirt->rc, &((struct ir_raw_event) {
> +				.duration = DIV_ROUND_CLOSEST(duration * 2, 5),
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
> +	int i;
> +
> +	dev_dbg(uirt->dev, "state:%d data: %*phN\n", uirt->cmd_state, len, uirt->in);
> +
> +	// Do we have more IR to transmit
> +	if (uirt->cmd_state == CMD_STATE_STREAMING_TX && len >= 2 &&
> +	    uirt->tx_len && uirt->in[0] & FTDI_RS0_CTS) {
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
> +	switch (uirt->cmd_state) {
> +	case CMD_STATE_GETVERSION:
> +		if (len == 10) {
> +			// check checksum
> +			u8 checksum = 0;
> +
> +			for (i = 2; i < len; i++)
> +				checksum += uirt->in[i];
> +
> +			if (checksum != 0) {
> +				dev_err(uirt->dev, "checksum does not match: %*phN\n",
> +					len, uirt->in);
> +				return;
> +			}
> +
> +			dev_info(uirt->dev,
> +				 "USB-UIRT firmware v%u.%u protocol v%u.%u %02u-%02u-%04u",
> +				 uirt->in[2], uirt->in[3], uirt->in[4],
> +				 uirt->in[5], uirt->in[6], uirt->in[7],
> +				 2000 + uirt->in[8]);
> +
> +			complete(&uirt->cmd_done);
> +			uirt->cmd_state = CMD_STATE_IRDATA;
> +			return;
> +		}
> +		break;
> +	case CMD_STATE_DOTXRAW:
> +	case CMD_STATE_STREAMING_TX:
> +	case CMD_STATE_SETMODERAW:
> +	case CMD_STATE_SETMODEWIDEBAND:
> +		if (len == 3) {
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
> +			return;
> +		}
> +	default:
> +		break;
> +	}
> +
> +	if (uirt->wideband)
> +		uirt_wideband(uirt, len);
> +	else
> +		uirt_raw_mode(uirt, len);
> +}

Your code assumes that you'll always get one message per transfer, but
since the device uses a regular FTDI chip with a FIFO this isn't
guaranteed. 

> +
> +static void uirt_out_callback(struct urb *urb)
> +{
> +	struct uirt *uirt = urb->context;
> +
> +	if (urb->status)
> +		dev_warn(uirt->dev, "out urb status: %d\n", urb->status);

Disconnecting a device shouldn't print a warning.

> +}
> +
> +static void uirt_in_callback(struct urb *urb)
> +{
> +	struct uirt *uirt = urb->context;
> +	int ret;
> +
> +	if (urb->status == 0)
> +		uirt_response(uirt, urb->actual_length);
> +	else
> +		dev_dbg(uirt->dev, "in urb status: %d\n", urb->status);
> +
> +	ret = usb_submit_urb(urb, GFP_ATOMIC);
> +	if (ret && ret != -ENODEV)
> +		dev_warn(uirt->dev, "failed to resubmit urb: %d\n", ret);
> +}

> +static int init_ftdi(struct usb_device *udev)
> +{
> +	int err;
> +
> +	// set the baud rate
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

Does the device UART actually have RTS wired up?

> +
> +	// Set latency in milliseconds. The USB-UIRT will generate a
> +	// urb every latency milliseconds (IR or not), so this should be
> +	// set as high as possible.
> +	//
> +	// The USB-UIRT has a IR timeout of 14ms (i.e. it sends the 0xff
> +	// byte after 14ms of IR silence. So if we set the timeout to a higher
> +	// value, the 0xff just gets sent in a separate packet, and there
> +	// is a small delay for the IR to be processed.
> +	return usb_control_msg(udev, usb_sndctrlpipe(udev, 0),
> +			      FTDI_SIO_SET_LATENCY_TIMER_REQUEST,
> +			      FTDI_SIO_SET_LATENCY_TIMER_REQUEST_TYPE,
> +			      50, 0,

Magic constant; it's not entirely clear from the code (or comment) what
50 is here. The latency go as high as 255 IIRC.

> +			      NULL, 0, USB_CTRL_SET_TIMEOUT);
> +}
> +
> +static int uirt_probe(struct usb_interface *intf,
> +		      const struct usb_device_id *id)
> +{
> +	struct usb_host_interface *idesc = intf->cur_altsetting;
> +	struct usb_device *usbdev = interface_to_usbdev(intf);
> +	struct usb_endpoint_descriptor *ep_in = NULL;
> +	struct usb_endpoint_descriptor *ep_out = NULL;
> +	struct usb_endpoint_descriptor *ep = NULL;
> +	struct uirt *uirt;
> +	struct rc_dev *rc;
> +	struct urb *urb;
> +	int i, pipe, err = -ENOMEM;
> +
> +	for (i = 0; i < idesc->desc.bNumEndpoints; i++) {
> +		ep = &idesc->endpoint[i].desc;
> +
> +		if (!ep_in && usb_endpoint_is_bulk_in(ep) &&
> +		    usb_endpoint_maxp(ep) == MAX_PACKET)
> +			ep_in = ep;
> +
> +		if (!ep_out && usb_endpoint_is_bulk_out(ep) &&
> +		    usb_endpoint_maxp(ep) == MAX_PACKET)
> +			ep_out = ep;
> +	}

You should use usb_find_common_endpoints() instead of open coding even
if you'd still need to check the endpoint size with your implementation.

> +
> +	if (!ep_in || !ep_out) {
> +		dev_err(&intf->dev, "required endpoints not found\n");
> +		return -ENODEV;
> +	}
> +
> +	uirt = kzalloc(sizeof(*uirt), GFP_KERNEL);
> +	if (!uirt)
> +		return -ENOMEM;
> +
> +	uirt->in = kmalloc(MAX_PACKET, GFP_KERNEL);
> +	if (!uirt->in)
> +		goto free_uirt;
> +
> +	uirt->out = kmalloc(MAX_PACKET, GFP_KERNEL);
> +	if (!uirt->out)
> +		goto free_uirt;
> +
> +	rc = rc_allocate_device(RC_DRIVER_IR_RAW);
> +	if (!rc)
> +		goto free_uirt;
> +
> +	urb = usb_alloc_urb(0, GFP_KERNEL);
> +	if (!urb)
> +		goto free_rcdev;
> +
> +	pipe = usb_rcvbulkpipe(usbdev, ep_in->bEndpointAddress);
> +	usb_fill_bulk_urb(urb, usbdev, pipe, uirt->in, MAX_PACKET,
> +			  uirt_in_callback, uirt);
> +	uirt->urb_in = urb;
> +
> +	urb = usb_alloc_urb(0, GFP_KERNEL);
> +	if (!urb)
> +		goto free_rcdev;
> +
> +	pipe = usb_sndbulkpipe(usbdev, ep_out->bEndpointAddress);
> +	usb_fill_bulk_urb(urb, usbdev, pipe, uirt->out, MAX_PACKET,
> +			  uirt_out_callback, uirt);
> +
> +	uirt->dev = &intf->dev;
> +	uirt->usbdev = usbdev;
> +	uirt->rc = rc;
> +	uirt->urb_out = urb;
> +	uirt->rx_state = RX_STATE_INTERSPACE_HIGH;
> +
> +	err = usb_submit_urb(uirt->urb_in, GFP_KERNEL);
> +	if (err != 0) {
> +		dev_err(uirt->dev, "failed to submit read urb: %d\n", err);
> +		goto free_rcdev;
> +	}
> +
> +	err = init_ftdi(usbdev);
> +	if (err) {
> +		dev_err(uirt->dev, "failed to setup ftdi: %d\n", err);
> +		goto free_rcdev;
> +	}
> +
> +	err = uirt_setup(uirt);
> +	if (err)
> +		goto free_rcdev;
> +
> +	usb_make_path(usbdev, uirt->phys, sizeof(uirt->phys));
> +
> +	rc->device_name = "USB-UIRT";
> +	rc->driver_name = KBUILD_MODNAME;
> +	rc->input_phys = uirt->phys;
> +	usb_to_input_id(usbdev, &rc->input_id);
> +	rc->dev.parent = &intf->dev;
> +	rc->priv = uirt;
> +	rc->tx_ir = uirt_tx;
> +	rc->s_tx_carrier = uirt_set_tx_carrier;
> +	rc->s_learning_mode = uirt_set_rx_wideband;
> +	rc->allowed_protocols = RC_PROTO_BIT_ALL_IR_DECODER;
> +	rc->map_name = RC_MAP_RC6_MCE;
> +	rc->rx_resolution = UNIT_US;
> +	rc->timeout = IR_TIMEOUT;
> +
> +	uirt_set_tx_carrier(rc, 38000);
> +
> +	err = rc_register_device(rc);
> +	if (err)
> +		goto free_rcdev;
> +
> +	usb_set_intfdata(intf, uirt);
> +
> +	return 0;
> +
> +free_rcdev:
> +	usb_kill_urb(uirt->urb_in);
> +	usb_kill_urb(uirt->urb_out);

Looks lazy to kill the URBs before they've been allocated, better to add
another label even if it's not a bug.

> +	usb_free_urb(uirt->urb_in);
> +	usb_free_urb(uirt->urb_out);
> +	rc_free_device(rc);
> +free_uirt:
> +	kfree(uirt->in);
> +	kfree(uirt->out);
> +	kfree(uirt);
> +	return err;
> +}

Johan
