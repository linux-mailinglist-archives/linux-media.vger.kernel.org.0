Return-Path: <linux-media+bounces-24256-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2D0A01CD8
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 01:26:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 18F437A1767
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 00:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A985E27726;
	Mon,  6 Jan 2025 00:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=timsurber.de header.i=@timsurber.de header.b="uziCZDDS"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2338FB676;
	Mon,  6 Jan 2025 00:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736123195; cv=none; b=ZDbfCnGev0gZsz3M2ZuSz8VNdPIfqYZIbYyNGKn5Jprv7qt5i49BZlEeTEnPdbuV3pvF2dctpMztL/CMkySR/6eOSAL4uxRlWZYoSqe5wTa0yzJb+IW2LlnV6SNMN+4GpvwT7zhfQZNIlql5tubda57k7/cLF0w7gVsEotjsKBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736123195; c=relaxed/simple;
	bh=AK9Tfq4KrDyep+bhfuEORLuVpBGrdI19SZadHpV7PKA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CMHecRxSq8N+SQafqLBNjALkfapiqQ8Na9ZHds+n5tpIavK7LbeCLKqXbmZgjGs4u6uMZ8TVJsT7tbG3fnNIjKyQ18cm0tXcBTps7Vw1YxVmK7houbUy54UBgRxAKzue0sLBXYdC6gAXVx6U9Bwr87ylNuAeKQV5OKwX1k0jkV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=timsurber.de; spf=pass smtp.mailfrom=timsurber.de; dkim=pass (2048-bit key) header.d=timsurber.de header.i=@timsurber.de header.b=uziCZDDS; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=timsurber.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timsurber.de
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4YRFNL74gHz9svW;
	Mon,  6 Jan 2025 01:26:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=timsurber.de;
	s=MBO0001; t=1736123187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E3cYz6N7b3iWDDwpn84JiQntMlRdH334rgEOQ5CT7fY=;
	b=uziCZDDSnVcA4tdMDNJQ5+3SnjcyCsfnXl/eAqHODi3cOGO37AWxiqp9pEC33vJSnxBPFL
	/f+KvDVFpeS4P8gYJ4dds1uRIipujKIsb12P40IqRABfKlETLVbLwbimcW03OizG0e2EPC
	J/4o8JOKH9LMjw7lTVHjArsg0vRF/Xcrk28JQKcyjiSkKq3xbl6G0g3U1fv6DPAnv3KhoB
	xIS1JHuQn8TY5/Q13K6lBcCXQCSIWsX7Zm4yh1mp4g1y9Vt890eqaFIc0T5QSgkY660qnh
	o5vJ6CVHkjcIu9/Gphk+YQtfbYIVaNszXFmBGSvtURPsyCMuoQ0O2VWI8CTnQg==
Message-ID: <c71a3f79-71f3-4fd2-a509-c42b24636a2f@timsurber.de>
Date: Mon, 6 Jan 2025 01:26:21 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [RESEND PATCH v5 0/4] Add Synopsys DesignWare HDMI RX Controller
To: Shreeya Patel <shreeya.patel@collabora.com>, heiko@sntech.de,
 mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 p.zabel@pengutronix.de, jose.abreu@synopsys.com, nelson.costa@synopsys.com,
 shawn.wen@rock-chips.com, nicolas.dufresne@collabora.com,
 hverkuil@xs4all.nl, hverkuil-cisco@xs4all.nl
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dmitry.osipenko@collabora.com
References: <20241210193904.883225-1-shreeya.patel@collabora.com>
Content-Language: en-US
From: Tim Surber <me@timsurber.de>
In-Reply-To: <20241210193904.883225-1-shreeya.patel@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 4YRFNL74gHz9svW



Hi Shreeya,

I applied your patch to rockchip/next on an FriendlyElec CM3588 device 
with arm-trusted-firmware 2.12. This is the same hardware/cable/sources 
I used previously
Sadly I could not get it to work at all.

After connection to a HDMI source I get the following error with all 
devices and resolutions I tested
# dmesg
snps_hdmirx fdee0000.hdmi_receiver: hdmirx_controller_init wait timer 
base lock failed
snps_hdmirx fdee0000.hdmi_receiver: hdmirx_phy_register_write wait cr 
write done failed (repeating multiple times)


# v4l2-ctl --list-devices
[...]
snps_hdmirx (platform:fdee0000.hdmi_receiver):
     /dev/video2


With the source set to 1920x1080, 60hz RGB I get the following output, 
it freezes and creates no file. Notice the wrong resolution

# v4l2-ctl --verbose -d /dev/video2 
--set-fmt-video=width=1920,height=1080,pixelformat='BGR3' 
--stream-mmap=4 --stream-skip=3 --stream-count=100 
--stream-to=hdmiin4k.raw --stream-poll
VIDIOC_QUERYCAP: ok
VIDIOC_G_FMT: ok
VIDIOC_S_FMT: ok
Format Video Capture Multiplanar:
     Width/Height      : 640/480
     Pixel Format      : 'BGR3' (24-bit BGR 8-8-8)
     Field             : None
     Number of planes  : 1
     Flags             :
     Colorspace        : sRGB
     Transfer Function : Default
     YCbCr/HSV Encoding: Default
     Quantization      : Default
     Plane 0           :
        Bytes per Line : 1920
        Size Image     : 921600

Sometimes I could get a very distorted picture with gstreamer
# dmesg
fdee0000.hdmi_receiver: hdmirx_query_dv_timings: signal is not locked
rockchip-rga fdb80000.rga: [CAPTURE] fmt - BGR3 little-endian 
(0x33524742) 1920x1080 (stride 5760, sizeimage 6220800)
rockchip-rga fdb80000.rga: plane[0]: size 6220800, bytesperline 5760


# v4l2-ctl --all -L --list-formats-ext -d /dev/video2
Driver Info:
     Driver name      : snps_hdmirx
     Card type        : snps_hdmirx
     Bus info         : platform:fdee0000.hdmi_receiver
     Driver version   : 6.13.0
     Capabilities     : 0x84201000
         Video Capture Multiplanar
         Streaming
         Extended Pix Format
         Device Capabilities
     Device Caps      : 0x04201000
         Video Capture Multiplanar
         Streaming
         Extended Pix Format
Priority: 2
Video input : 0 (HDMI IN: ok)
DV timings:
     Active width: 640
     Active height: 480
     Total width: 800
     Total height: 525
     Frame format: progressive
     Polarities: -vsync -hsync
     Pixelclock: 25175000 Hz (59.94 frames per second)
     Horizontal frontporch: 16
     Horizontal sync: 96
     Horizontal backporch: 48
     Vertical frontporch: 10
     Vertical sync: 2
     Vertical backporch: 33
     Standards: CTA-861, DMT
     CTA-861 VIC: 1
     Flags: has CTA-861 VIC
DV timings capabilities:
     Minimum Width: 640
     Maximum Width: 4096
     Minimum Height: 480
     Maximum Height: 2160
     Minimum PClock: 20000000
     Maximum PClock: 600000000
     Standards: CTA-861
     Capabilities: Interlaced, Progressive
Format Video Capture Multiplanar:
     Width/Height      : 640/480
     Pixel Format      : 'BGR3' (24-bit BGR 8-8-8)
     Field             : None
     Number of planes  : 1
     Flags             :
     Colorspace        : sRGB
     Transfer Function : Default
     YCbCr/HSV Encoding: Default
     Quantization      : Default
     Plane 0           :
        Bytes per Line : 1920
        Size Image     : 921600

Digital Video Controls

                   power_present 0x00a00964 (bitmask): max=0x00000001 
default=0x00000000 value=1 flags=read-only
       rx_rgb_quantization_range 0x00a00965 (menu)   : min=0 max=2 
default=0 value=0 (Automatic) flags=read-only
                 0: Automatic
                 1: RGB Limited Range (16-235)
                 2: RGB Full Range (0-255)
              rx_it_content_type 0x00a00966 (menu)   : min=0 max=4 
default=4 value=4 (No IT Content) flags=read-only
                 0: Graphics
                 1: Photo
                 2: Cinema
                 3: Game
                 4: No IT Content
ioctl: VIDIOC_ENUM_FMT
     Type: Video Capture Multiplanar

     [0]: 'BGR3' (24-bit BGR 8-8-8)


Best regards,
Tim


On 12/10/24 20:39, Shreeya Patel wrote:
> This series implements support for the Synopsys DesignWare
> HDMI RX Controller, being compliant with standard HDMI 1.4b
> and HDMI 2.0.
> 
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
> ---
> 
> Resending the patch series due to mail server timeout issue
> when sending v5 patchset
> 
> Changes in v5 :-
> - Fix the interrupt IRQ number in the dt-bindings and device tree
> - Add alignment property to ensure hdmi-receiver-cma
>    starts at a 64KB-aligned address
> - Change the MODULE_DESCRIPTION
> - Add VIDEO_SYNOPSYS_HDMIRX as prefix to the default edid config
> - Drop the enabling of default edid in the Kconfig
> - Replace the default EDID with hdmi-4k-300mhz EDID produced
>    by v4l2-ctl tool for better compatibility with various HDMI
>    cables and adapters
> - Rework the write_edid and set_edid functions
> - During format change, retrieve the current pixel format,
>    color depth, and AVI infoframe details instead of only
>    detecting the format
> - Improve the logging mechanism and delays in the
>    hdmirx_wait_signal_lock function
> - Fix the 4K@60 capturing for RGB format
> - Document what hdmirx_check_timing_valid function does
> - Rework the hdmirx_get_detected_timings function
> - Fix the NV16/24 size image value
> - Add the implementation from Benjamin Hoff to expose the
>    ITC type to v4l2
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
>    MAINTAINERS: Add entry for Synopsys DesignWare HDMI RX Driver
>    dt-bindings: media: Document bindings for HDMI RX Controller
>    arm64: dts: rockchip: Add device tree support for HDMI RX Controller
>    media: platform: synopsys: Add support for HDMI input driver
> 
>   .../bindings/media/snps,dw-hdmi-rx.yaml       |  132 +
>   MAINTAINERS                                   |    8 +
>   .../dts/rockchip/rk3588-base-pinctrl.dtsi     |   14 +
>   .../arm64/boot/dts/rockchip/rk3588-extra.dtsi |   57 +
>   drivers/media/platform/Kconfig                |    1 +
>   drivers/media/platform/Makefile               |    1 +
>   drivers/media/platform/synopsys/Kconfig       |    3 +
>   drivers/media/platform/synopsys/Makefile      |    2 +
>   .../media/platform/synopsys/hdmirx/Kconfig    |   27 +
>   .../media/platform/synopsys/hdmirx/Makefile   |    4 +
>   .../platform/synopsys/hdmirx/snps_hdmirx.c    | 2662 +++++++++++++++++
>   .../platform/synopsys/hdmirx/snps_hdmirx.h    |  394 +++
>   .../synopsys/hdmirx/snps_hdmirx_cec.c         |  283 ++
>   .../synopsys/hdmirx/snps_hdmirx_cec.h         |   44 +
>   14 files changed, 3633 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
>   create mode 100644 drivers/media/platform/synopsys/Kconfig
>   create mode 100644 drivers/media/platform/synopsys/Makefile
>   create mode 100644 drivers/media/platform/synopsys/hdmirx/Kconfig
>   create mode 100644 drivers/media/platform/synopsys/hdmirx/Makefile
>   create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
>   create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.h
>   create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx_cec.c
>   create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx_cec.h
> 


