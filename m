Return-Path: <linux-media+bounces-51528-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kITkKcw3d2lZdQEAu9opvQ
	(envelope-from <linux-media+bounces-51528-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 10:45:48 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7A2862A4
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 10:45:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 30C6F3019B81
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 09:45:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 893DC32BF41;
	Mon, 26 Jan 2026 09:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="XN4HwDIq"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438A8329C6A;
	Mon, 26 Jan 2026 09:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769420700; cv=none; b=kiijzaCUjSMHba3x3zKelrjjCSt7+9jVNlP6uEiAmCN78zYA+2mYNmhe+IWbDFzyxX0TUb6STw8d4CTa+mXEp22zuJDC3ACyNMASEzvIMJ0QsC2niF5vk/SaizZMAD/7K9saqkQ2xA4YOe7TD8rsazsZyJ10J8+E7h9F56IKlaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769420700; c=relaxed/simple;
	bh=ch7EQe4RpjjO/RrRWgGLt+o1+PwLzYpNdsQx7g7nK4o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sXpZZKhAeM7pxVpF6sJNKncsLZHpO4+QHcVrC4W5hgNpDcopYsaiC15oH1xoiyg9lBBW7tXFs2mRBq538YdvlMZicGCD+PfLsn1rRP3xokDiA0f8FZvQYy58lbdsKTWebzoDOdRHWmLbwRzm86EX+BDDZ5mS6QQ5pjpWseDvCoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=XN4HwDIq; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769420695;
	bh=ch7EQe4RpjjO/RrRWgGLt+o1+PwLzYpNdsQx7g7nK4o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XN4HwDIqulRxlWJQUBlH0dQuVzYDF9CcLlyDuFlYgV+FmXD+5/lItVI5bdp2vO3AB
	 T28pHTIserJVesEA+YcQaU+HwlweF+xn98R2X11OCYrAe5L9m0T9DpzPPtupjiMA4k
	 qPolObToxrEfEbR8mOARu7f7r0NaAaVQIotJ6jQKBR5htR8ptqIz2VGXBwVua3jg7r
	 CWP7R1jONnnAFU4sECWLrYLbo51y3OWQxR1cp+YGYr+OSSuoaymK5MK9VhFyYeT8tp
	 87oci8Y2K+rsb6VZOumgsSL8IbW5ANkKuCCkFaGKLAk3fEoJgD/wTuM7KIwW5v26hZ
	 MkrEGrecpOTcw==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 77E0B17E0181;
	Mon, 26 Jan 2026 10:44:54 +0100 (CET)
Message-ID: <544a98f3-d451-4ca1-b7d0-0b0a1238f66a@collabora.com>
Date: Mon, 26 Jan 2026 10:44:53 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v1 00/11] Add iMX95 neoisp driver
To: Antoine Bouyer <antoine.bouyer@nxp.com>, julien.vuillaumier@nxp.com,
 alexi.birlinger@nxp.com, daniel.baluta@nxp.com, peng.fan@nxp.com,
 frank.li@nxp.com, jacopo.mondi@ideasonboard.com,
 laurent.pinchart@ideasonboard.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260123080938.3367348-1-antoine.bouyer@nxp.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260123080938.3367348-1-antoine.bouyer@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51528-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[nxp.com,ideasonboard.com,kernel.org,pengutronix.de,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.riesch@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:mid,collabora.com:dkim]
X-Rspamd-Queue-Id: 1F7A2862A4
X-Rspamd-Action: no action

Hi Antoine,

On 1/23/26 09:09, Antoine Bouyer wrote:
> Hi all,
> 
> This RFC patch series introduces the NXP Neo Image Signal Processor (ISP)
> driver, used in the NXP i.MX95 SoC and future devices in the i.MX9 family.
> The series also includes updates to the generic v4l2-isp interface to
> support extended statistics required by the Neo ISP.
> 
> The Neo ISP processes one or more camera streams, converting RAW formats
> into YUV or RGB outputs. Its architecture is largely influenced by the
> PISP driver. The hardware supports up to eight contexts, with three sink
> pads (main input, HDR input, and parameter buffers) and three source pads
> (RGB output, IR output, and statistics metadata).
> 
> At this stage, both legacy (fixed-size) and extensible (dynamic-size)
> parameter/statistics buffers are supported through the generic v4l2-isp
> framework, similar to rkisp1 and Mali-C55. The driver currently supports
> M2M operation; direct CSI-to-ISP streaming is not yet implemented.

How do you envisage the direct CSI-to-ISP streaming shall be supported?
 - How shall the final media graph(s) look like?
 - How many media devices are registered and which driver registers it
   or them?
 - How can the user decide whether direct (csi2isp) or indirect
   (mem2mem) streaming shall be used?

While it is certainly OK to introduce this support only at a later
stage, it makes sense to consider this right from the start to avoid
some nasty changes e.g. in how this hardware is exposed to user space.

Also, we are facing a similiar challenge with recent Rockchip ISP
hardware (RK3588, RK3576, ...) and it would be great to hear your
thoughts about that.

Thanks in advance and best regards,
Michael

> 
> This series is posted as RFC because extending the v4l2-isp interface may
> overlap with ongoing work. If similar development already exists, I am
> happy to rebase or adapt the series accordingly. If preferred, the series
> can also be split into two parts: the v4l2-isp rework and the Neo ISP
> driver introduction.
> 
> A few checkpatch warnings in v4l2-ioctl.c remain intentionally to stay
> consistent with the existing style in that file.
> 
> Testing was performed on the i.MX95 EVK using the media/next kernel in
> standalone M2M mode. End-to-end camera-to-ISP capture has been validated
> using the downstream NXP kernel, as some hardware dependencies are not
> yet upstreamed.
> 
> Thanks,
> Antoine
> 
> ---
> Here are v4l2-compliance test results:
> 
> v4l2-compliance 1.28.1-5233, 64 bits, 64-bit time_t
> v4l2-compliance SHA: fc15e229d9d3 2024-07-23 19:22:15
> 
> Compliance test for neoisp device /dev/media0:
> 
> Media Driver Info:
> 	Driver name      : neoisp
> 	Model            : neoisp
> 	Serial           : 
> 	Bus info         : platform:4ae00000.isp
> 	Media version    : 6.19.0
> 	Hardware revision: 0x00000002 (2)
> 	Driver version   : 6.19.0
> 
> Required ioctls:
> 	test MEDIA_IOC_DEVICE_INFO: OK
> 	test invalid ioctls: OK
> 
> Allow for multiple opens:
> 	test second /dev/media0 open: OK
> 	test MEDIA_IOC_DEVICE_INFO: OK
> 	test for unlimited opens: OK
> 
> Media Controller ioctls:
> 	test MEDIA_IOC_G_TOPOLOGY: OK
> 	Entities: 7 Interfaces: 7 Pads: 12 Links: 13
> 	test MEDIA_IOC_ENUM_ENTITIES/LINKS: OK
> 	test MEDIA_IOC_SETUP_LINK: OK
> 
> Total for neoisp device /dev/media0: 8, Succeeded: 8, Failed: 0, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for neoisp device /dev/video0:
> 
> Driver Info:
> 	Driver name      : neoisp
> 	Card type        : neoisp
> 	Bus info         : platform:4ae00000.isp
> 	Driver version   : 6.19.0
> 	Capabilities     : 0x8ca03000
> 		Video Capture Multiplanar
> 		Video Output Multiplanar
> 		Metadata Capture
> 		Metadata Output
> 		Streaming
> 		Extended Pix Format
> 		Device Capabilities
> 	Device Caps      : 0x04202000
> 		Video Output Multiplanar
> 		Streaming
> 		Extended Pix Format
> Media Driver Info:
> 	Driver name      : neoisp
> 	Model            : neoisp
> 	Serial           : 
> 	Bus info         : platform:4ae00000.isp
> 	Media version    : 6.19.0
> 	Hardware revision: 0x00000002 (2)
> 	Driver version   : 6.19.0
> Interface Info:
> 	ID               : 0x0300000a
> 	Type             : V4L Video
> Entity Info:
> 	ID               : 0x00000008 (8)
> 	Name             : neoisp-input0
> 	Function         : V4L2 I/O
> 	Pad 0x01000009   : 0: Source
> 	  Link 0x0200000c: to remote pad 0x1000002 of entity 'neoisp' (Image Signal Processor): Data, Enabled, Immutable
> 
> Required ioctls:
> 	test MC information (see 'Media Driver Info' above): OK
> 	test VIDIOC_QUERYCAP: OK
> 	test invalid ioctls: OK
> 
> Allow for multiple opens:
> 	test second /dev/video0 open: OK
> 	test VIDIOC_QUERYCAP: OK
> 	test VIDIOC_G/S_PRIORITY: OK
> 	test for unlimited opens: OK
> 
> Debug ioctls:
> 	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> 	test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
> 	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> 	test VIDIOC_ENUMAUDIO: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDIO: OK (Not Supported)
> 	Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
> 	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> 	Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
> 	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> 	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> 	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> 	test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
> 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
> 	test VIDIOC_QUERYCTRL: OK (Not Supported)
> 	test VIDIOC_G/S_CTRL: OK (Not Supported)
> 	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
> 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
> 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> 	Standard Controls: 0 Private Controls: 0
> 
> Format ioctls:
> 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> 	test VIDIOC_G/S_PARM: OK (Not Supported)
> 	test VIDIOC_G_FBUF: OK (Not Supported)
> 	test VIDIOC_G_FMT: OK
> 	test VIDIOC_TRY_FMT: OK
> 	test VIDIOC_S_FMT: OK
> 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> 	test Cropping: OK
> 	test Composing: OK (Not Supported)
> 	test Scaling: OK
> 
> Codec ioctls:
> 	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> 	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls:
> 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> 	test CREATE_BUFS maximum buffers: OK
> 	test VIDIOC_REMOVE_BUFS: OK
> 	test VIDIOC_EXPBUF: OK
> 	test Requests: OK (Not Supported)
> 
> Total for neoisp device /dev/video0: 48, Succeeded: 48, Failed: 0, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for neoisp device /dev/video1:
> 
> Driver Info:
> 	Driver name      : neoisp
> 	Card type        : neoisp
> 	Bus info         : platform:4ae00000.isp
> 	Driver version   : 6.19.0
> 	Capabilities     : 0x8ca03000
> 		Video Capture Multiplanar
> 		Video Output Multiplanar
> 		Metadata Capture
> 		Metadata Output
> 		Streaming
> 		Extended Pix Format
> 		Device Capabilities
> 	Device Caps      : 0x04202000
> 		Video Output Multiplanar
> 		Streaming
> 		Extended Pix Format
> Media Driver Info:
> 	Driver name      : neoisp
> 	Model            : neoisp
> 	Serial           : 
> 	Bus info         : platform:4ae00000.isp
> 	Media version    : 6.19.0
> 	Hardware revision: 0x00000002 (2)
> 	Driver version   : 6.19.0
> Interface Info:
> 	ID               : 0x03000010
> 	Type             : V4L Video
> Entity Info:
> 	ID               : 0x0000000e (14)
> 	Name             : neoisp-input1
> 	Function         : V4L2 I/O
> 	Pad 0x0100000f   : 0: Source
> 	  Link 0x02000012: to remote pad 0x1000003 of entity 'neoisp' (Image Signal Processor): Data
> 
> Required ioctls:
> 	test MC information (see 'Media Driver Info' above): OK
> 	test VIDIOC_QUERYCAP: OK
> 	test invalid ioctls: OK
> 
> Allow for multiple opens:
> 	test second /dev/video1 open: OK
> 	test VIDIOC_QUERYCAP: OK
> 	test VIDIOC_G/S_PRIORITY: OK
> 	test for unlimited opens: OK
> 
> Debug ioctls:
> 	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> 	test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
> 	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> 	test VIDIOC_ENUMAUDIO: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDIO: OK (Not Supported)
> 	Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
> 	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> 	Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
> 	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> 	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> 	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> 	test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
> 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
> 	test VIDIOC_QUERYCTRL: OK (Not Supported)
> 	test VIDIOC_G/S_CTRL: OK (Not Supported)
> 	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
> 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
> 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> 	Standard Controls: 0 Private Controls: 0
> 
> Format ioctls:
> 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> 	test VIDIOC_G/S_PARM: OK (Not Supported)
> 	test VIDIOC_G_FBUF: OK (Not Supported)
> 	test VIDIOC_G_FMT: OK
> 	test VIDIOC_TRY_FMT: OK
> 	test VIDIOC_S_FMT: OK
> 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> 	test Cropping: OK
> 	test Composing: OK (Not Supported)
> 	test Scaling: OK
> 
> Codec ioctls:
> 	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> 	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls:
> 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> 	test CREATE_BUFS maximum buffers: OK
> 	test VIDIOC_REMOVE_BUFS: OK
> 	test VIDIOC_EXPBUF: OK
> 	test Requests: OK (Not Supported)
> 
> Total for neoisp device /dev/video1: 48, Succeeded: 48, Failed: 0, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for neoisp device /dev/video2:
> 
> Driver Info:
> 	Driver name      : neoisp
> 	Card type        : neoisp
> 	Bus info         : platform:4ae00000.isp
> 	Driver version   : 6.19.0
> 	Capabilities     : 0x8ca03000
> 		Video Capture Multiplanar
> 		Video Output Multiplanar
> 		Metadata Capture
> 		Metadata Output
> 		Streaming
> 		Extended Pix Format
> 		Device Capabilities
> 	Device Caps      : 0x0c200000
> 		Metadata Output
> 		Streaming
> 		Extended Pix Format
> Media Driver Info:
> 	Driver name      : neoisp
> 	Model            : neoisp
> 	Serial           : 
> 	Bus info         : platform:4ae00000.isp
> 	Media version    : 6.19.0
> 	Hardware revision: 0x00000002 (2)
> 	Driver version   : 6.19.0
> Interface Info:
> 	ID               : 0x03000016
> 	Type             : V4L Video
> Entity Info:
> 	ID               : 0x00000014 (20)
> 	Name             : neoisp-params
> 	Function         : V4L2 I/O
> 	Pad 0x01000015   : 0: Source
> 	  Link 0x02000018: to remote pad 0x1000004 of entity 'neoisp' (Image Signal Processor): Data, Enabled
> 
> Required ioctls:
> 	test MC information (see 'Media Driver Info' above): OK
> 	test VIDIOC_QUERYCAP: OK
> 	test invalid ioctls: OK
> 
> Allow for multiple opens:
> 	test second /dev/video2 open: OK
> 	test VIDIOC_QUERYCAP: OK
> 	test VIDIOC_G/S_PRIORITY: OK
> 	test for unlimited opens: OK
> 
> Debug ioctls:
> 	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> 	test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
> 	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> 	test VIDIOC_ENUMAUDIO: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDIO: OK (Not Supported)
> 	Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
> 	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> 	Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
> 	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> 	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> 	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> 	test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
> 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
> 	test VIDIOC_QUERYCTRL: OK (Not Supported)
> 	test VIDIOC_G/S_CTRL: OK (Not Supported)
> 	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
> 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
> 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> 	Standard Controls: 0 Private Controls: 0
> 
> Format ioctls:
> 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> 	test VIDIOC_G/S_PARM: OK (Not Supported)
> 	test VIDIOC_G_FBUF: OK (Not Supported)
> 	test VIDIOC_G_FMT: OK
> 	test VIDIOC_TRY_FMT: OK
> 	test VIDIOC_S_FMT: OK
> 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> 	test Cropping: OK (Not Supported)
> 	test Composing: OK (Not Supported)
> 	test Scaling: OK (Not Supported)
> 
> Codec ioctls:
> 	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> 	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls:
> 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> 	test CREATE_BUFS maximum buffers: OK
> 	test VIDIOC_REMOVE_BUFS: OK
> 	test VIDIOC_EXPBUF: OK
> 	test Requests: OK (Not Supported)
> 
> Total for neoisp device /dev/video2: 48, Succeeded: 48, Failed: 0, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for neoisp device /dev/video3:
> 
> Driver Info:
> 	Driver name      : neoisp
> 	Card type        : neoisp
> 	Bus info         : platform:4ae00000.isp
> 	Driver version   : 6.19.0
> 	Capabilities     : 0x8ca03000
> 		Video Capture Multiplanar
> 		Video Output Multiplanar
> 		Metadata Capture
> 		Metadata Output
> 		Streaming
> 		Extended Pix Format
> 		Device Capabilities
> 	Device Caps      : 0x04201000
> 		Video Capture Multiplanar
> 		Streaming
> 		Extended Pix Format
> Media Driver Info:
> 	Driver name      : neoisp
> 	Model            : neoisp
> 	Serial           : 
> 	Bus info         : platform:4ae00000.isp
> 	Media version    : 6.19.0
> 	Hardware revision: 0x00000002 (2)
> 	Driver version   : 6.19.0
> Interface Info:
> 	ID               : 0x0300001c
> 	Type             : V4L Video
> Entity Info:
> 	ID               : 0x0000001a (26)
> 	Name             : neoisp-frame
> 	Function         : V4L2 I/O
> 	Pad 0x0100001b   : 0: Sink
> 	  Link 0x0200001e: from remote pad 0x1000005 of entity 'neoisp' (Image Signal Processor): Data, Enabled
> 
> Required ioctls:
> 	test MC information (see 'Media Driver Info' above): OK
> 	test VIDIOC_QUERYCAP: OK
> 	test invalid ioctls: OK
> 
> Allow for multiple opens:
> 	test second /dev/video3 open: OK
> 	test VIDIOC_QUERYCAP: OK
> 	test VIDIOC_G/S_PRIORITY: OK
> 	test for unlimited opens: OK
> 
> Debug ioctls:
> 	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> 	test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
> 	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> 	test VIDIOC_ENUMAUDIO: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDIO: OK (Not Supported)
> 	Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
> 	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> 	Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
> 	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> 	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> 	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> 	test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
> 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
> 	test VIDIOC_QUERYCTRL: OK (Not Supported)
> 	test VIDIOC_G/S_CTRL: OK (Not Supported)
> 	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
> 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
> 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> 	Standard Controls: 0 Private Controls: 0
> 
> Format ioctls:
> 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> 	test VIDIOC_G/S_PARM: OK (Not Supported)
> 	test VIDIOC_G_FBUF: OK (Not Supported)
> 	test VIDIOC_G_FMT: OK
> 	test VIDIOC_TRY_FMT: OK
> 	test VIDIOC_S_FMT: OK
> 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> 	test Cropping: OK (Not Supported)
> 	test Composing: OK (Not Supported)
> 	test Scaling: OK
> 
> Codec ioctls:
> 	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> 	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls:
> 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> 	test CREATE_BUFS maximum buffers: OK
> 	test VIDIOC_REMOVE_BUFS: OK
> 	test VIDIOC_EXPBUF: OK
> 	test Requests: OK (Not Supported)
> 
> Total for neoisp device /dev/video3: 48, Succeeded: 48, Failed: 0, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for neoisp device /dev/video4:
> 
> Driver Info:
> 	Driver name      : neoisp
> 	Card type        : neoisp
> 	Bus info         : platform:4ae00000.isp
> 	Driver version   : 6.19.0
> 	Capabilities     : 0x8ca03000
> 		Video Capture Multiplanar
> 		Video Output Multiplanar
> 		Metadata Capture
> 		Metadata Output
> 		Streaming
> 		Extended Pix Format
> 		Device Capabilities
> 	Device Caps      : 0x04201000
> 		Video Capture Multiplanar
> 		Streaming
> 		Extended Pix Format
> Media Driver Info:
> 	Driver name      : neoisp
> 	Model            : neoisp
> 	Serial           : 
> 	Bus info         : platform:4ae00000.isp
> 	Media version    : 6.19.0
> 	Hardware revision: 0x00000002 (2)
> 	Driver version   : 6.19.0
> Interface Info:
> 	ID               : 0x03000022
> 	Type             : V4L Video
> Entity Info:
> 	ID               : 0x00000020 (32)
> 	Name             : neoisp-ir
> 	Function         : V4L2 I/O
> 	Pad 0x01000021   : 0: Sink
> 	  Link 0x02000024: from remote pad 0x1000006 of entity 'neoisp' (Image Signal Processor): Data
> 
> Required ioctls:
> 	test MC information (see 'Media Driver Info' above): OK
> 	test VIDIOC_QUERYCAP: OK
> 	test invalid ioctls: OK
> 
> Allow for multiple opens:
> 	test second /dev/video4 open: OK
> 	test VIDIOC_QUERYCAP: OK
> 	test VIDIOC_G/S_PRIORITY: OK
> 	test for unlimited opens: OK
> 
> Debug ioctls:
> 	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> 	test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
> 	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> 	test VIDIOC_ENUMAUDIO: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDIO: OK (Not Supported)
> 	Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
> 	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> 	Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
> 	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> 	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> 	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> 	test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
> 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
> 	test VIDIOC_QUERYCTRL: OK (Not Supported)
> 	test VIDIOC_G/S_CTRL: OK (Not Supported)
> 	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
> 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
> 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> 	Standard Controls: 0 Private Controls: 0
> 
> Format ioctls:
> 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> 	test VIDIOC_G/S_PARM: OK (Not Supported)
> 	test VIDIOC_G_FBUF: OK (Not Supported)
> 	test VIDIOC_G_FMT: OK
> 	test VIDIOC_TRY_FMT: OK
> 	test VIDIOC_S_FMT: OK
> 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> 	test Cropping: OK (Not Supported)
> 	test Composing: OK (Not Supported)
> 	test Scaling: OK
> 
> Codec ioctls:
> 	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> 	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls:
> 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> 	test CREATE_BUFS maximum buffers: OK
> 	test VIDIOC_REMOVE_BUFS: OK
> 	test VIDIOC_EXPBUF: OK
> 	test Requests: OK (Not Supported)
> 
> Total for neoisp device /dev/video4: 48, Succeeded: 48, Failed: 0, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for neoisp device /dev/video5:
> 
> Driver Info:
> 	Driver name      : neoisp
> 	Card type        : neoisp
> 	Bus info         : platform:4ae00000.isp
> 	Driver version   : 6.19.0
> 	Capabilities     : 0x8ca03000
> 		Video Capture Multiplanar
> 		Video Output Multiplanar
> 		Metadata Capture
> 		Metadata Output
> 		Streaming
> 		Extended Pix Format
> 		Device Capabilities
> 	Device Caps      : 0x04a00000
> 		Metadata Capture
> 		Streaming
> 		Extended Pix Format
> Media Driver Info:
> 	Driver name      : neoisp
> 	Model            : neoisp
> 	Serial           : 
> 	Bus info         : platform:4ae00000.isp
> 	Media version    : 6.19.0
> 	Hardware revision: 0x00000002 (2)
> 	Driver version   : 6.19.0
> Interface Info:
> 	ID               : 0x03000028
> 	Type             : V4L Video
> Entity Info:
> 	ID               : 0x00000026 (38)
> 	Name             : neoisp-stats
> 	Function         : V4L2 I/O
> 	Pad 0x01000027   : 0: Sink
> 	  Link 0x0200002a: from remote pad 0x1000007 of entity 'neoisp' (Image Signal Processor): Data, Enabled
> 
> Required ioctls:
> 	test MC information (see 'Media Driver Info' above): OK
> 	test VIDIOC_QUERYCAP: OK
> 	test invalid ioctls: OK
> 
> Allow for multiple opens:
> 	test second /dev/video5 open: OK
> 	test VIDIOC_QUERYCAP: OK
> 	test VIDIOC_G/S_PRIORITY: OK
> 	test for unlimited opens: OK
> 
> Debug ioctls:
> 	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> 	test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
> 	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> 	test VIDIOC_ENUMAUDIO: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDIO: OK (Not Supported)
> 	Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
> 	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> 	Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
> 	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> 	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> 	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> 	test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
> 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
> 	test VIDIOC_QUERYCTRL: OK (Not Supported)
> 	test VIDIOC_G/S_CTRL: OK (Not Supported)
> 	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
> 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
> 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> 	Standard Controls: 0 Private Controls: 0
> 
> Format ioctls:
> 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> 	test VIDIOC_G/S_PARM: OK (Not Supported)
> 	test VIDIOC_G_FBUF: OK (Not Supported)
> 	test VIDIOC_G_FMT: OK
> 	test VIDIOC_TRY_FMT: OK
> 	test VIDIOC_S_FMT: OK
> 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> 	test Cropping: OK (Not Supported)
> 	test Composing: OK (Not Supported)
> 	test Scaling: OK (Not Supported)
> 
> Codec ioctls:
> 	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> 	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls:
> 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> 	test CREATE_BUFS maximum buffers: OK
> 	test VIDIOC_REMOVE_BUFS: OK
> 	test VIDIOC_EXPBUF: OK
> 	test Requests: OK (Not Supported)
> 
> Total for neoisp device /dev/video5: 48, Succeeded: 48, Failed: 0, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for neoisp device /dev/v4l-subdev0:
> 
> Driver Info:
> 	Driver version   : 6.19.0
> 	Capabilities     : 0x00000000
> 	Client Capabilities: 0x0000000000000002
> interval-uses-which Media Driver Info:
> 	Driver name      : neoisp
> 	Model            : neoisp
> 	Serial           : 
> 	Bus info         : platform:4ae00000.isp
> 	Media version    : 6.19.0
> 	Hardware revision: 0x00000002 (2)
> 	Driver version   : 6.19.0
> Interface Info:
> 	ID               : 0x0300002c
> 	Type             : V4L Sub-Device
> Entity Info:
> 	ID               : 0x00000001 (1)
> 	Name             : neoisp
> 	Function         : Image Signal Processor
> 	Pad 0x01000002   : 0: Sink
> 	  Link 0x0200000c: from remote pad 0x1000009 of entity 'neoisp-input0' (V4L2 I/O): Data, Enabled, Immutable
> 	Pad 0x01000003   : 1: Sink
> 	  Link 0x02000012: from remote pad 0x100000f of entity 'neoisp-input1' (V4L2 I/O): Data
> 	Pad 0x01000004   : 2: Sink
> 	  Link 0x02000018: from remote pad 0x1000015 of entity 'neoisp-params' (V4L2 I/O): Data, Enabled
> 	Pad 0x01000005   : 3: Source
> 	  Link 0x0200001e: to remote pad 0x100001b of entity 'neoisp-frame' (V4L2 I/O): Data, Enabled
> 	Pad 0x01000006   : 4: Source
> 	  Link 0x02000024: to remote pad 0x1000021 of entity 'neoisp-ir' (V4L2 I/O): Data
> 	Pad 0x01000007   : 5: Source
> 	  Link 0x0200002a: to remote pad 0x1000027 of entity 'neoisp-stats' (V4L2 I/O): Data, Enabled
> 
> Required ioctls:
> 	test MC information (see 'Media Driver Info' above): OK
> 	test VIDIOC_SUDBEV_QUERYCAP: OK
> 	test invalid ioctls: OK
> 
> Allow for multiple opens:
> 	test second /dev/v4l-subdev0 open: OK
> 	test VIDIOC_SUBDEV_QUERYCAP: OK
> 	test for unlimited opens: OK
> 
> Debug ioctls:
> 	test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
> 	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> 	test VIDIOC_ENUMAUDIO: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDIO: OK (Not Supported)
> 	Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
> 	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> 	Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
> 	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> 	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> 	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> 	test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Sub-Device ioctls (Sink Pad 0):
> 	Try Stream 0
> 	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
> 	test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
> 	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> 	Active Stream 0
> 	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
> 	test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
> 	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> 	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
> 
> Sub-Device ioctls (Sink Pad 1):
> 	Try Stream 0
> 	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
> 	test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
> 	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> 	Active Stream 0
> 	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
> 	test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
> 	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> 	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
> 
> Sub-Device ioctls (Sink Pad 2):
> 	Try Stream 0
> 	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
> 	test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
> 	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> 	Active Stream 0
> 	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
> 	test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
> 	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> 	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
> 
> Sub-Device ioctls (Source Pad 3):
> 	Try Stream 0
> 	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
> 	test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
> 	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> 	Active Stream 0
> 	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
> 	test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
> 	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> 	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
> 
> Sub-Device ioctls (Source Pad 4):
> 	Try Stream 0
> 	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
> 	test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
> 	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> 	Active Stream 0
> 	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
> 	test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
> 	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> 	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
> 
> Sub-Device ioctls (Source Pad 5):
> 	Try Stream 0
> 	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
> 	test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
> 	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> 	Active Stream 0
> 	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
> 	test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
> 	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> 	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
> 
> Control ioctls:
> 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
> 	test VIDIOC_QUERYCTRL: OK
> 	test VIDIOC_G/S_CTRL: OK
> 	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
> 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
> 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> 	Standard Controls: 1 Private Controls: 1
> 
> Format ioctls:
> 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
> 	test VIDIOC_G/S_PARM: OK (Not Supported)
> 	test VIDIOC_G_FBUF: OK (Not Supported)
> 	test VIDIOC_G_FMT: OK (Not Supported)
> 	test VIDIOC_TRY_FMT: OK (Not Supported)
> 	test VIDIOC_S_FMT: OK (Not Supported)
> 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> 	test Cropping: OK (Not Supported)
> 	test Composing: OK (Not Supported)
> 	test Scaling: OK (Not Supported)
> 
> Codec ioctls:
> 	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> 	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls:
> 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
> 	test CREATE_BUFS maximum buffers: OK
> 	test VIDIOC_REMOVE_BUFS: OK
> 	test VIDIOC_EXPBUF: OK (Not Supported)
> 	test Requests: OK (Not Supported)
> 
> Total for neoisp device /dev/v4l-subdev0: 88, Succeeded: 88, Failed: 0, Warnings: 0
> 
> Grand Total for neoisp device /dev/media0: 384, Succeeded: 384, Failed: 0, Warnings: 0
> 
> ---
> Antoine Bouyer (11):
>   media: uapi: v4l2-isp: Add v4l2 ISP extensible statistics definitions
>   media: v4l2-isp: Add helper function to compute extended stats size
>   media: Documentation: uapi: Update V4L2 ISP for extensible stats
>   media: Documentation: Add NXP neoisp driver documentation
>   dt-bindings: media: Add nxp neoisp support
>   media: v4l2-ctrls: Add user control base for NXP neoisp controls
>   media: Add meta formats supported by NXP neoisp driver
>   media: uapi: Add NXP NEOISP user interface header file
>   media: platform: Add NXP Neoisp Image Signal Processor
>   media: platform: neoisp: Add debugfs support
>   arm64: dts: freescale: imx95: Add NXP neoisp device tree node
> 
>  .../admin-guide/media/nxp-neoisp-diagram.dot  |   22 +
>  .../admin-guide/media/nxp-neoisp.dot          |   16 +
>  .../admin-guide/media/nxp-neoisp.rst          |  189 ++
>  .../admin-guide/media/v4l-drivers.rst         |    1 +
>  .../devicetree/bindings/media/nxp,neoisp.yaml |   65 +
>  .../userspace-api/media/v4l/meta-formats.rst  |    1 +
>  .../media/v4l/metafmt-nxp-neoisp.rst          |  114 +
>  .../userspace-api/media/v4l/v4l2-isp.rst      |   42 +-
>  MAINTAINERS                                   |    9 +
>  .../boot/dts/freescale/imx95-19x19-evk.dts    |    4 +
>  arch/arm64/boot/dts/freescale/imx95.dtsi      |   11 +
>  drivers/media/platform/nxp/Kconfig            |    1 +
>  drivers/media/platform/nxp/Makefile           |    1 +
>  drivers/media/platform/nxp/neoisp/Kconfig     |   15 +
>  drivers/media/platform/nxp/neoisp/Makefile    |    8 +
>  drivers/media/platform/nxp/neoisp/neoisp.h    |  270 ++
>  .../media/platform/nxp/neoisp/neoisp_ctx.c    | 2798 +++++++++++++++++
>  .../media/platform/nxp/neoisp/neoisp_ctx.h    |   85 +
>  .../platform/nxp/neoisp/neoisp_debugfs.c      |  503 +++
>  .../media/platform/nxp/neoisp/neoisp_fmt.h    |  509 +++
>  drivers/media/platform/nxp/neoisp/neoisp_hw.h |  577 ++++
>  .../media/platform/nxp/neoisp/neoisp_main.c   | 1999 ++++++++++++
>  .../media/platform/nxp/neoisp/neoisp_nodes.h  |   60 +
>  .../media/platform/nxp/neoisp/neoisp_regs.h   | 2501 +++++++++++++++
>  drivers/media/v4l2-core/v4l2-ioctl.c          |    4 +
>  include/media/v4l2-isp.h                      |   13 +
>  include/uapi/linux/media/nxp/nxp_neoisp.h     | 1968 ++++++++++++
>  include/uapi/linux/media/v4l2-isp.h           |   85 +
>  include/uapi/linux/v4l2-controls.h            |    6 +
>  include/uapi/linux/videodev2.h                |    6 +
>  30 files changed, 11880 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/admin-guide/media/nxp-neoisp-diagram.dot
>  create mode 100644 Documentation/admin-guide/media/nxp-neoisp.dot
>  create mode 100644 Documentation/admin-guide/media/nxp-neoisp.rst
>  create mode 100644 Documentation/devicetree/bindings/media/nxp,neoisp.yaml
>  create mode 100644 Documentation/userspace-api/media/v4l/metafmt-nxp-neoisp.rst
>  create mode 100644 drivers/media/platform/nxp/neoisp/Kconfig
>  create mode 100644 drivers/media/platform/nxp/neoisp/Makefile
>  create mode 100644 drivers/media/platform/nxp/neoisp/neoisp.h
>  create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_ctx.c
>  create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_ctx.h
>  create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_debugfs.c
>  create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_fmt.h
>  create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_hw.h
>  create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_main.c
>  create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_nodes.h
>  create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_regs.h
>  create mode 100644 include/uapi/linux/media/nxp/nxp_neoisp.h
> 


