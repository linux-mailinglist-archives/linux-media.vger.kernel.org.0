Return-Path: <linux-media+bounces-17058-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE37963474
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 00:14:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1F541C22A6D
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 22:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD5231AC446;
	Wed, 28 Aug 2024 22:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=timsurber.de header.i=@timsurber.de header.b="sHSfcnU2"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC55C16B388;
	Wed, 28 Aug 2024 22:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724883240; cv=none; b=gASobSpmrrOWQo3Bue6DRCY8KjHXJLKaB6E1KvdU6axenPBoJN9y/SruH2BYckHHE3vBUNbjtYzqG2jXuFejaZ0tVwxdIQ4REEXtcxyek9E/SPQsv6LXgT6AtX9rNpGMnentcoponNdkx/LV1e2Ex8znGirOU3c3tTG8j8W3eDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724883240; c=relaxed/simple;
	bh=qHmKktuPhs8Dy4M1TkSPEen65p1uFS09lJhvAiQXkOM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YtBQyxbmZr3FiAXJln4/UItsjseH8WR6nVngQ8FKpvLV6eyAQxXpYS67v8qaI0Z4ajIVxWGN+hEndhaQ2hpfjO42C8/zkDK0z+OVf4/n70tVMUHrlrCk52RRI2PtSEqz40BtoKAzOm5BkYVPbBjncyedvp1/yo18leyz64yAu58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=timsurber.de; spf=pass smtp.mailfrom=timsurber.de; dkim=pass (2048-bit key) header.d=timsurber.de header.i=@timsurber.de header.b=sHSfcnU2; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=timsurber.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timsurber.de
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4WvJbF5bnpz9sFb;
	Thu, 29 Aug 2024 00:13:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=timsurber.de;
	s=MBO0001; t=1724883225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MQV+YGqcydJ5jlIKsihEwvsyXo2JQb+LIHXD9xmYv2A=;
	b=sHSfcnU2OMIprmwW0Mz6rVXbfOf06aIqvlJVvC4h0xHqeP4XN/FRQtbpgnEg3g2/OuJDwU
	i/BS/xHstpBfQE7Xd3wCjyazMaio4jJ3HyPaLnoE+0o4eS+Yh+w31ylDEoYGSGflQ9+FMT
	9jdQfAZ6vORRqaCPNy8zqjpveptC1Is+raBw/8MZK8PDH9058bjcTtw59XCTyW9jZZSc2I
	ciEnkLm01OU95R0jGI5k6Ky8oui6dxlm/HvkAMr11jvEhuuh78vbQJ/WTt/EeXt9W34YAH
	+N7iH9KyA8uuEUOQXJnjUhTA8k/MDrWoBUnztogkXJgkpfE7zDv+zaFyCJ7rxA==
Message-ID: <74850340-b662-4a58-b5eb-a4e352c5002c@timsurber.de>
Date: Thu, 29 Aug 2024 00:13:40 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 0/4] Add Synopsys DesignWare HDMI RX Controller
To: Shreeya Patel <shreeya.patel@collabora.com>
Cc: heiko <heiko@sntech.de>, mchehab <mchehab@kernel.org>,
 robh <robh@kernel.org>, krzk+dt <krzk+dt@kernel.org>,
 conor+dt <conor+dt@kernel.org>, mturquette <mturquette@baylibre.com>,
 sboyd <sboyd@kernel.org>, "p.zabel" <p.zabel@pengutronix.de>,
 "jose.abreu" <jose.abreu@synopsys.com>,
 "nelson.costa" <nelson.costa@synopsys.com>,
 "shawn.wen" <shawn.wen@rock-chips.com>,
 "nicolas.dufresne" <nicolas.dufresne@collabora.com>,
 hverkuil <hverkuil@xs4all.nl>, hverkuil-cisco <hverkuil-cisco@xs4all.nl>,
 kernel <kernel@collabora.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 linux-media <linux-media@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-rockchip <linux-rockchip@lists.infradead.org>
References: <20240719124032.26852-1-shreeya.patel@collabora.com>
 <6f5c4ebb-84ab-4b65-9817-ac5f6158911f@timsurber.de>
 <19150697f90.11f343d091099757.4301715823219222254@collabora.com>
Content-Language: en-US
From: Tim Surber <me@timsurber.de>
In-Reply-To: <19150697f90.11f343d091099757.4301715823219222254@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4WvJbF5bnpz9sFb

Hi Shreeya,

another hint:

Changing the EDID like you described fixed the 4k60fps BGR3 input.

But still for NV16/NV24 (I can't output NV12 for some reason) there is 
the error which Nicolas described.

The output from v4l2-ctl for NV16/NV24 is:

Plane 0           :
        Bytes per Line : 3840
        Size Image     : 8294400

According to Nicolas there should be an additional plane/more memory 
reserved.

This leads to errors when trying to read the device using for example 
gstreamer:

  gst_memory_resize: assertion 'size + mem->offset + offset <= 
mem->maxsize' failed


This seems to always happen using the  NV16/NV24 formats regardless of 
resolution/fps.


Best regards,

Tim

On 14.08.24 12:22, Shreeya Patel wrote:
>   ---- On Sun, 04 Aug 2024 05:27:08 +0530  Tim Surber  wrote ---
>   > Hi Shreeya,
>   >
>
> Hi Tim,
>
>
>   > I tested your patch and noticed problems when using 3840x2160 resolution
>   > at  60fps.
>   >
>   > For my testing I connected an HDMI source and set it to 4k60fps. I
>   > verified that this source and the cables work on a screen at this
>   > resolution.
>   >
>   > Using
>   > 'v4l2-ctl --verbose -d /dev/video1
>   > --set-fmt-video=width=3840,height=2160,pixelformat='NV12'
>   > --stream-mmap=4 --stream-skip=3 --stream-count=100 --stream-poll'
>   > I get the video format output, but not the periodic output which shows
>   > the fps.
>   >
>   > Using
>   > 'GST_DEBUG=4 gst-launch-1.0 -v v4l2src device=/dev/video1 !
>   > fpsdisplaysink text-overlay=false video-sink="fakevideosink"'
>   > I get the following error message:
>   >
>   > (gst-launch-1.0:3231): GStreamer-CRITICAL **: 01:34:39.137:
>   > gst_memory_resize: assertion 'size + mem->offset + offset <=
>   > mem->maxsize' failed
>   > 0:00:03.489382529  3231 0xffffa0000b90 WARN  v4l2bufferpool
>   > gstv4l2bufferpool.c:2209:gst_v4l2_buffer_pool_process:
>   > Dropping truncated buffer, this is likely a driver bug.
>   > 0:00:03.489421906  3231 0xffffa0000b90 WARN  bufferpool
>   > gstbufferpool.c:1252:default_reset_buffer: Buffer
>   > 0xffff98008e80 without the memory tag has maxsize (8294400) that is
>   > smaller than the configured buffer pool size (12441600). The buffer will
>   > be not be reused. This is most likely a bug in this GstBufferPool subclass
>   >
>   >
>   > Everything works with 4k30fps or 1080p 60fps. The hardware should
>   > support 4k60fps.
>   >
>
>
> Sorry for the delayed response, I've been trying to reproduce this on my side
> and to also fix it.
>
> It seems you are right, 4K@60 fps doesn't work with the latest version of HDMIRX.
> We found out that it could be because of the current EDID which shows some failures.
>
> Though I wasn't able to test the following on my side since my device doesn't support
> 4K, one of my colleague tried to replace the EDID and 4K@60 fps worked fine after that.
>
> If you'd like to try it yourself then following is the command to get the new EDID
>
> v4l2-ctl --show-edid type=hdmi-4k-600mhz
>
> You will have to replace the EDID in the driver with the EDID you get the from the above
> command in HEX format.
>
> Thanks for reporting this, I will soon send v5 with this change included in it.
>
>
> Thanks,
> Shreeya Patel
>
>
>   > Best regards,
>   > Tim
>   >
>   > On 19.07.24 14:40, Shreeya Patel wrote:
>   > > This series implements support for the Synopsys DesignWare
>   > > HDMI RX Controller, being compliant with standard HDMI 1.4b
>   > > and HDMI 2.0.
>   > >
>   > > Features that are currently supported by the HDMI RX driver
>   > > have been tested on rock5b board using a HDMI to micro-HDMI cable.
>   > > It is recommended to use a good quality cable as there were
>   > > multiple issues seen during testing the driver.
>   > >
>   > > Please note the below information :-
>   > > * While testing the driver on rock5b we noticed that the binary BL31
>   > > from Rockchip contains some unknown code to get the HDMI-RX PHY
>   > > access working without any errors.
>   > > With TF-A BL31, the HDMI-RX PHY also works fine but there were no
>   > > interrupts seen for rk_hdmirx-hdmi leading to some errors when
>   > > loading the driver [0]. It doesn't affect the functionality of the
>   > > driver though.
>   > > * We have tested the working of OBS studio with HDMIRX driver and
>   > > there were no issues seen.
>   > > * We also tested and verified the support for interlaced video.
>   > >
>   > > [0] https://gitlab.collabora.com/hardware-enablement/rockchip-3588/trusted-firmware-a/-/issues/1
>   > >
>   > > To test the HDMI RX Controller driver, following example commands can be used :-
>   > >
>   > > root@debian-rockchip-rock5b-rk3588:~# v4l2-ctl --verbose -d /dev/video0 \
>   > > --set-fmt-video=width=1920,height=1080,pixelformat='BGR3' --stream-mmap=4 \
>   > > --stream-skip=3 --stream-count=100 --stream-to=/home/hdmiin4k.raw --stream-poll
>   > >
>   > > root@debian-rockchip-rock5b-rk3588:~# ffmpeg -f rawvideo -vcodec rawvideo \
>   > > -s 1920x1080 -r 60 -pix_fmt bgr24 -i /home/hdmiin4k.raw output.mkv
>   > >
>   > > CEC compliance test results :-
>   > >
>   > > * https://gitlab.collabora.com/-/snippets/381
>   > > * https://gitlab.collabora.com/-/snippets/380
>   > >
>   > > Following is the v4l2-compliance test result :-
>   > >
>   > > root@debian-rockchip-rock5b-rk3588:~# v4l2-compliance -d /dev/video0
>   > > v4l2-compliance 1.27.0-5220, 64 bits, 64-bit time_t
>   > > v4l2-compliance SHA: 8387e3673837 2024-07-01 11:09:32
>   > >
>   > > Compliance test for snps_hdmirx device /dev/video0:
>   > >
>   > > Driver Info:
>   > >     Driver name      : snps_hdmirx
>   > >     Card type        : snps_hdmirx
>   > >     Bus info         : platform:fdee0000.hdmi-receiver
>   > >     Driver version   : 6.10.0
>   > >     Capabilities     : 0x84201000
>   > >         Video Capture Multiplanar
>   > >         Streaming
>   > >         Extended Pix Format
>   > >         Device Capabilities
>   > >     Device Caps      : 0x04201000
>   > >         Video Capture Multiplanar
>   > >         Streaming
>   > >         Extended Pix Format
>   > >
>   > > Required ioctls:
>   > >     test VIDIOC_QUERYCAP: OK
>   > >     test invalid ioctls: OK
>   > >
>   > > Allow for multiple opens:
>   > >     test second /dev/video0 open: OK
>   > >     test VIDIOC_QUERYCAP: OK
>   > >     test VIDIOC_G/S_PRIORITY: OK
>   > >     test for unlimited opens: OK
>   > >
>   > > Debug ioctls:
>   > >     test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>   > >     test VIDIOC_LOG_STATUS: OK
>   > >
>   > > Input ioctls:
>   > >     test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>   > >     test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>   > >     test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>   > >     test VIDIOC_ENUMAUDIO: OK (Not Supported)
>   > >     test VIDIOC_G/S/ENUMINPUT: OK
>   > >     test VIDIOC_G/S_AUDIO: OK (Not Supported)
>   > >     Inputs: 1 Audio Inputs: 0 Tuners: 0
>   > >
>   > > Output ioctls:
>   > >     test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>   > >     test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>   > >     test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>   > >     test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>   > >     test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>   > >     Outputs: 0 Audio Outputs: 0 Modulators: 0
>   > >
>   > > Input/Output configuration ioctls:
>   > >     test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>   > >     test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK
>   > >     test VIDIOC_DV_TIMINGS_CAP: OK
>   > >     test VIDIOC_G/S_EDID: OK
>   > >
>   > > Control ioctls (Input 0):
>   > >     test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>   > >     test VIDIOC_QUERYCTRL: OK
>   > >     test VIDIOC_G/S_CTRL: OK
>   > >     test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>   > >     test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>   > >     test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>   > >     Standard Controls: 3 Private Controls: 0
>   > >
>   > > Format ioctls (Input 0):
>   > >     test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>   > >     test VIDIOC_G/S_PARM: OK
>   > >     test VIDIOC_G_FBUF: OK (Not Supported)
>   > >     test VIDIOC_G_FMT: OK
>   > >     test VIDIOC_TRY_FMT: OK
>   > >     test VIDIOC_S_FMT: OK
>   > >     test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>   > >     test Cropping: OK (Not Supported)
>   > >     test Composing: OK (Not Supported)
>   > >     test Scaling: OK (Not Supported)
>   > >
>   > > Codec ioctls (Input 0):
>   > >     test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>   > >     test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>   > >     test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>   > >
>   > > Buffer ioctls (Input 0):
>   > >     test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>   > >     test CREATE_BUFS maximum buffers: OK
>   > >     test VIDIOC_REMOVE_BUFS: OK
>   > >     test VIDIOC_EXPBUF: OK
>   > >     test Requests: OK (Not Supported)
>   > >
>   > > Total for snps_hdmirx device /dev/video0: 47, Succeeded: 47, Failed: 0, Warnings: 0
>   > >
>   > > Changes in v4 :-
>   > >    - Remove DTS changes included in the device tree patch
>   > >    - Remove the hdmi rx pin info as it's already present
>   > >      in the rk3588-base-pinctrl.dtsi
>   > >    - Create a separate config option for selecting the EDID
>   > >      and enable it by default
>   > >    - Improve the comment related to DV timings and move it
>   > >      to the side of hdmirx_get_detected_timings
>   > >    - Add 100ms delay before pulling the HPD high
>   > >    - Do not return the detected timings from VIDIOC_G_DV_TIMINGS
>   > >    - Drop the bus info from hdmirx_querycap
>   > >    - If *num_planes != 0 then return 0 in hdmirx_queue_setup
>   > >    - Set queue->min_queued_buffers to 1
>   > >    - Drop q->allow_cache_hints = 0; as it's always 0 by default
>   > >    - Add a comment for q->dma_attrs = DMA_ATTR_FORCE_CONTIGUOUS;
>   > >    - Drop .read = vb2_fop_read as it's not supported by driver
>   > >    - Remove redundant edid_init_data_600M
>   > >    - Make HPD low when driver is loaded
>   > >    - Add support for reading AVI Infoframe
>   > >    - Remove msg_len checks from hdmirx_cec_transmit
>   > >    - Add info about the CEC compliance test in the cover letter
>   > >    - Add arbitration lost status
>   > >    - Validate the physical address inside the EDID
>   > >
>   > > Changes in v3 :-
>   > >    - Use v4l2-common helpers in the HDMIRX driver
>   > >    - Rename cma node and phandle names
>   > >    - Elaborate the comment to explain 160MiB calculation
>   > >    - Move &hdmi_receiver_cma to the rock5b dts file
>   > >    - Add information about interlaced video testing in the
>   > >      cover-letter
>   > >
>   > > Changes in v2 :-
>   > >    - Fix checkpatch --strict warnings
>   > >    - Move the dt-binding include file changes in a separate patch
>   > >    - Add a description for the hardware in the dt-bindings file
>   > >    - Rename resets, vo1 grf and HPD properties
>   > >    - Add a proper description for grf and vo1-grf phandles in the
>   > >      bindings
>   > >    - Rename the HDMI RX node name to hdmi-receiver
>   > >    - Include gpio header file in binding example to fix the
>   > >      dt_binding_check failure
>   > >    - Move hdmirx_cma node to the rk3588.dtsi file
>   > >    - Add an entry to MAINTAINERS file for the HDMIRX driver
>   > >
>   > > Shreeya Patel (4):
>   > >    MAINTAINERS: Add entry for Synopsys DesignWare HDMI RX Driver
>   > >    dt-bindings: media: Document bindings for HDMI RX Controller
>   > >    arm64: dts: rockchip: Add device tree support for HDMI RX Controller
>   > >    media: platform: synopsys: Add support for hdmi input driver
>   > >
>   > >   .../bindings/media/snps,dw-hdmi-rx.yaml       |  132 +
>   > >   MAINTAINERS                                   |    8 +
>   > >   .../dts/rockchip/rk3588-base-pinctrl.dtsi     |   14 +
>   > >   .../arm64/boot/dts/rockchip/rk3588-extra.dtsi |   56 +
>   > >   drivers/media/platform/Kconfig                |    1 +
>   > >   drivers/media/platform/Makefile               |    1 +
>   > >   drivers/media/platform/synopsys/Kconfig       |    3 +
>   > >   drivers/media/platform/synopsys/Makefile      |    2 +
>   > >   .../media/platform/synopsys/hdmirx/Kconfig    |   27 +
>   > >   .../media/platform/synopsys/hdmirx/Makefile   |    4 +
>   > >   .../platform/synopsys/hdmirx/snps_hdmirx.c    | 2763 +++++++++++++++++
>   > >   .../platform/synopsys/hdmirx/snps_hdmirx.h    |  394 +++
>   > >   .../synopsys/hdmirx/snps_hdmirx_cec.c         |  285 ++
>   > >   .../synopsys/hdmirx/snps_hdmirx_cec.h         |   44 +
>   > >   14 files changed, 3734 insertions(+)
>   > >   create mode 100644 Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
>   > >   create mode 100644 drivers/media/platform/synopsys/Kconfig
>   > >   create mode 100644 drivers/media/platform/synopsys/Makefile
>   > >   create mode 100644 drivers/media/platform/synopsys/hdmirx/Kconfig
>   > >   create mode 100644 drivers/media/platform/synopsys/hdmirx/Makefile
>   > >   create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
>   > >   create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.h
>   > >   create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx_cec.c
>   > >   create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx_cec.h
>   > >
>   >

