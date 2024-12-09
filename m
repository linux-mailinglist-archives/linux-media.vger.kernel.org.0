Return-Path: <linux-media+bounces-22973-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F11AC9EA0F3
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 22:14:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD08A166E15
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 21:14:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25DEC19DF60;
	Mon,  9 Dec 2024 21:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="RrJFY9Ws"
X-Original-To: linux-media@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD7B19ABD4;
	Mon,  9 Dec 2024 21:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733778848; cv=none; b=L/tq06XRLqDFEcoW9mwlVcxkQjRFh5WUTHcG/TBInCIr0refkNEs1PU+u7qfTpKeRj5uNASLYifnikY8QJ7skmUlBSXgTsshqM3iqbQld3P4VTEwH6bo+sFimonlT7MQg9Lt0zoKzV06ha/YXEKfbbvcv7MR0oxfse//jxFpaHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733778848; c=relaxed/simple;
	bh=v13hWBAeUsXPzbKRzFHG+Ifre80g5GY2bTUyOS7DPwY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UUDOxa7mnr+jfMduDcC8p2uo+Xojspm+yrQn1Wqx4T/AAF8umqjvJpLTjZzPNpDJXWfh7LCkzc8NbO+ktFLcj/Turd7BTWMPKDquAcqQePM2vk0u6bu6Lr537xCDd3DtATDkV88TfoQc/OSTTwHPTZAudXLMpuHm/9NIxCV9y0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=RrJFY9Ws; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bJkA2uaWzzyuxWHGQTnVHNl3uYv3Xp1PJZHSFVj4EKo=; b=RrJFY9WspjpAYEUrirIseV4RTk
	qii2UwdUpym3ZQyn1byZda/WFCJ2inhvRt47c2HG92WWtak/rp1hanoOl2zYiRcl1hYwKXMT1rPfA
	brW+a4eIlACE4dcLAz1weMArn5Thp+qod9kEZeoh6DaXCJfx+6PzWli/I9En2aypk4szywp1l9qqq
	AWUztfV3kS/Hkx6kMFlUK6qttEcblo2Qcwn9+tw8EHMxsaB9EXkJxLqk42JAfC2Pkvr0OFIIFLeMu
	AZEdpZoZwnLwurZY6wLYEx6OEea2oDtnbIQgSv/iULilo/3CjjRKEBnk3/Y2sTOaH1UA8Wmvh41Mi
	SrYukEwQ==;
Received: from i53875bc4.versanet.de ([83.135.91.196] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tKl4e-0004K8-Ke; Mon, 09 Dec 2024 22:13:48 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 p.zabel@pengutronix.de, jose.abreu@synopsys.com, nelson.costa@synopsys.com,
 shawn.wen@rock-chips.com, nicolas.dufresne@collabora.com, hverkuil@xs4all.nl,
 hverkuil-cisco@xs4all.nl, Shreeya Patel <shreeya.patel@collabora.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 shreeya.patel@collabora.com, dmitry.osipenko@collabora.com
Subject: Re: [PATCH v5 0/4] Add Synopsys DesignWare HDMI RX Controller
Date: Mon, 09 Dec 2024 22:13:47 +0100
Message-ID: <7197326.aoefvbuG5b@diego>
In-Reply-To:
 <01020193ad025176-f2e8e4fd-41a6-42ef-b3d0-dfa87a6d0abd-000000@eu-west-1.amazonses.com>
References:
 <01020193ad025176-f2e8e4fd-41a6-42ef-b3d0-dfa87a6d0abd-000000@eu-west-1.amazonses.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Shreeya,

Am Montag, 9. Dezember 2024, 21:00:30 CET schrieb Shreeya Patel:
> This series implements support for the Synopsys DesignWare
> HDMI RX Controller, being compliant with standard HDMI 1.4b
> and HDMI 2.0.

could you take a look at your mail-setup please?

This cover-letter came with a message-id of 
01020193ad025176-f2e8e4fd-41a6-42ef-b3d0-dfa87a6d0abd-000000@eu-west-1.amazonses.com

same for patch1 that also got an amazon-message-id and lost its
in-reply-to reference,

while the patches  2-4 have correct message-ids and reference
20241209200120.3228643-1-shreeya.patel@collabora.com

as their parent. So it looks like some amazon service did some
rewriting and broke threading :-( .

Thanks a lot
Heiko

> Features that are currently supported by the HDMI RX driver
> have been tested on rock5b board using a HDMI to micro-HDMI cable.
> It is recommended to use a good quality cable as there were
> multiple issues seen during testing the driver.
> 
> Please note the below information :-
> * HDMIRX driver now only works with the opensource TF-A.
> * We have tested the working of OBS studio with HDMIRX driver and
> there were no issues seen.
> * We also tested and verified the support for interlaced video.
> 
> To test the HDMI RX Controller driver, following example commands can be used :-
> 
> root@debian-rockchip-rock5b-rk3588:~# v4l2-ctl --verbose -d /dev/video0 \
> --set-fmt-video=width=1920,height=1080,pixelformat='BGR3' --stream-mmap=4 \
> --stream-skip=3 --stream-count=100 --stream-to=/home/hdmiin4k.raw --stream-poll
> 
> root@debian-rockchip-rock5b-rk3588:~# ffmpeg -f rawvideo -vcodec rawvideo \
> -s 1920x1080 -r 60 -pix_fmt bgr24 -i /home/hdmiin4k.raw output.mkv
> 
> CEC compliance test results :-
> 
> * https://gitlab.collabora.com/-/snippets/380
> * https://gitlab.collabora.com/-/snippets/381
> 
> Following is the v4l2-compliance test result :-
> 
> root@debian-rockchip-rock5b-rk3588:~# v4l2-compliance -d /dev/video0 
> v4l2-compliance 1.29.0-5278, 64 bits, 64-bit time_t
> v4l2-compliance SHA: 791da13728d9 2024-11-25 10:01:57
> 
> Compliance test for snps_hdmirx device /dev/video0:
> 
> Driver Info:
> 	Driver name      : snps_hdmirx
> 	Card type        : snps_hdmirx
> 	Bus info         : platform:fdee0000.hdmi_receiver
> 	Driver version   : 6.12.0
> 	Capabilities     : 0x84201000
> 		Video Capture Multiplanar
> 		Streaming
> 		Extended Pix Format
> 		Device Capabilities
> 	Device Caps      : 0x04201000
> 		Video Capture Multiplanar
> 		Streaming
> 		Extended Pix Format
> 
> Required ioctls:
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
> 	test VIDIOC_LOG_STATUS: OK
> 
> Input ioctls:
> 	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> 	test VIDIOC_ENUMAUDIO: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMINPUT: OK
> 	test VIDIOC_G/S_AUDIO: OK (Not Supported)
> 	Inputs: 1 Audio Inputs: 0 Tuners: 0
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
> 	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK
> 	test VIDIOC_DV_TIMINGS_CAP: OK
> 	test VIDIOC_G/S_EDID: OK
> 
> Control ioctls (Input 0):
> 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
> 	test VIDIOC_QUERYCTRL: OK
> 	test VIDIOC_G/S_CTRL: OK
> 	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
> 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
> 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> 	Standard Controls: 4 Private Controls: 0
> 
> Format ioctls (Input 0):
> 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> 	test VIDIOC_G/S_PARM: OK
> 	test VIDIOC_G_FBUF: OK (Not Supported)
> 	test VIDIOC_G_FMT: OK
> 	test VIDIOC_TRY_FMT: OK
> 	test VIDIOC_S_FMT: OK
> 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> 	test Cropping: OK (Not Supported)
> 	test Composing: OK (Not Supported)
> 	test Scaling: OK (Not Supported)
> 
> Codec ioctls (Input 0):
> 	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> 	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls (Input 0):
> 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> 	test CREATE_BUFS maximum buffers: OK
> 	test VIDIOC_REMOVE_BUFS: OK
> 	test VIDIOC_EXPBUF: OK
> 	test Requests: OK (Not Supported)
> 	test blocking wait: OK
> 
> Total for snps_hdmirx device /dev/video0: 48, Succeeded: 48, Failed: 0, Warnings: 0
> 
> 
> Changes in v5 :-
> - Fix the interrupt IRQ number in the dt-bindings and device tree
> - Add alignment property to ensure hdmi-receiver-cma
>   starts at a 64KB-aligned address
> - Change the MODULE_DESCRIPTION
> - Add VIDEO_SYNOPSYS_HDMIRX as prefix to the default edid config
> - Drop the enabling of default edid in the Kconfig
> - Replace the default EDID with hdmi-4k-300mhz EDID produced
>   by v4l2-ctl tool for better compatibility with various HDMI
>   cables and adapters
> - Rework the write_edid and set_edid functions
> - During format change, retrieve the current pixel format,
>   color depth, and AVI infoframe details instead of only
>   detecting the format
> - Improve the logging mechanism and delays in the
>   hdmirx_wait_signal_lock function
> - Fix the 4K@60 capturing for RGB format
> - Document what hdmirx_check_timing_valid function does
> - Rework the hdmirx_get_detected_timings function
> - Fix the NV16/24 size image value
> - Add the implementation from Benjamin Hoff to expose the
>   ITC type to v4l2
> - Remove all the firmware related code
> 
> Changes in v4 :-
> - Remove DTS changes included in the device tree patch
> - Remove the hdmi rx pin info as it's already present
> in the rk3588-base-pinctrl.dtsi
> - Create a separate config option for selecting the EDID
> and enable it by default
> - Improve the comment related to DV timings and move it
> to the side of hdmirx_get_detected_timings
> - Add 100ms delay before pulling the HPD high
> - Do not return the detected timings from VIDIOC_G_DV_TIMINGS
> - Drop the bus info from hdmirx_querycap
> - If *num_planes != 0 then return 0 in hdmirx_queue_setup
> - Set queue->min_queued_buffers to 1
> - Drop q->allow_cache_hints = 0; as it's always 0 by default
> - Add a comment for q->dma_attrs = DMA_ATTR_FORCE_CONTIGUOUS;
> - Drop .read = vb2_fop_read as it's not supported by driver
> - Remove redundant edid_init_data_600M
> - Make HPD low when driver is loaded
> - Add support for reading AVI Infoframe
> - Remove msg_len checks from hdmirx_cec_transmit
> - Add info about the CEC compliance test in the cover letter
> - Add arbitration lost status
> - Validate the physical address inside the EDID
> 
> Changes in v3 :-
> - Use v4l2-common helpers in the HDMIRX driver
> - Rename cma node and phandle names
> - Elaborate the comment to explain 160MiB calculation
> - Move &hdmi_receiver_cma to the rock5b dts file
> - Add information about interlaced video testing in the
> cover-letter
> 
> Changes in v2 :-
> - Fix checkpatch --strict warnings
> - Move the dt-binding include file changes in a separate patch
> - Add a description for the hardware in the dt-bindings file
> - Rename resets, vo1 grf and HPD properties
> - Add a proper description for grf and vo1-grf phandles in the
> bindings
> - Rename the HDMI RX node name to hdmi-receiver
> - Include gpio header file in binding example to fix the
> dt_binding_check failure
> - Move hdmirx_cma node to the rk3588.dtsi file
> - Add an entry to MAINTAINERS file for the HDMIRX driver
> 
> Shreeya Patel (4):
>   MAINTAINERS: Add entry for Synopsys DesignWare HDMI RX Driver
>   dt-bindings: media: Document bindings for HDMI RX Controller
>   arm64: dts: rockchip: Add device tree support for HDMI RX Controller
>   media: platform: synopsys: Add support for HDMI input driver
> 
>  .../bindings/media/snps,dw-hdmi-rx.yaml       |  132 +
>  MAINTAINERS                                   |    8 +
>  .../dts/rockchip/rk3588-base-pinctrl.dtsi     |   14 +
>  .../arm64/boot/dts/rockchip/rk3588-extra.dtsi |   57 +
>  drivers/media/platform/Kconfig                |    1 +
>  drivers/media/platform/Makefile               |    1 +
>  drivers/media/platform/synopsys/Kconfig       |    3 +
>  drivers/media/platform/synopsys/Makefile      |    2 +
>  .../media/platform/synopsys/hdmirx/Kconfig    |   27 +
>  .../media/platform/synopsys/hdmirx/Makefile   |    4 +
>  .../platform/synopsys/hdmirx/snps_hdmirx.c    | 2662 +++++++++++++++++
>  .../platform/synopsys/hdmirx/snps_hdmirx.h    |  394 +++
>  .../synopsys/hdmirx/snps_hdmirx_cec.c         |  283 ++
>  .../synopsys/hdmirx/snps_hdmirx_cec.h         |   44 +
>  14 files changed, 3633 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
>  create mode 100644 drivers/media/platform/synopsys/Kconfig
>  create mode 100644 drivers/media/platform/synopsys/Makefile
>  create mode 100644 drivers/media/platform/synopsys/hdmirx/Kconfig
>  create mode 100644 drivers/media/platform/synopsys/hdmirx/Makefile
>  create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
>  create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.h
>  create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx_cec.c
>  create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx_cec.h
> 
> 





