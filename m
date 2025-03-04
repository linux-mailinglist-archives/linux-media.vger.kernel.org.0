Return-Path: <linux-media+bounces-27508-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36885A4E8BE
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 18:29:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 799AE3B89C4
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 17:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39177292F82;
	Tue,  4 Mar 2025 16:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=timsurber.de header.i=@timsurber.de header.b="q8NbtrPz"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF60A290BB0;
	Tue,  4 Mar 2025 16:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741106655; cv=none; b=p18PpQ174Sj75A0BCebZ0a6h5gNPPksg8SKGG0v8mlPbYdMbvakc+A6pgQT/Vqpx+9Ksc4rSRmGpHIj6GevoftkqH6nb5+aaIdSEhaOmCrf3EiuoNvLgjmYN33Sz9KP4wpXq6T/mWB77GGSLTjGyx7qNbSwJudrns4eyHWOXdeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741106655; c=relaxed/simple;
	bh=Kfb+W0WDiVkZVyulV9gbdwERifPyoO7MqIesvfXP2pM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JR4WkGYAEUhnzme7xwCdyEx1gnhktg/c3ffw4ASuxr6VQRIbEhCWobqqoWQM46s9bPpPGxUpT/WOHqcrEb51lnRNN7XVpf0RWZfxfkBlnAy5gby9Yt1lkXWRP8rncoXfuI6bjR+iiNqIsaLGatIK2IFIwa6RwEYQE2VsV3HclqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=timsurber.de; spf=pass smtp.mailfrom=timsurber.de; dkim=pass (2048-bit key) header.d=timsurber.de header.i=@timsurber.de header.b=q8NbtrPz; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=timsurber.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timsurber.de
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4Z6hN10cJvz9srJ;
	Tue,  4 Mar 2025 17:44:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=timsurber.de;
	s=MBO0001; t=1741106641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MIOeVDLWE/rEhFAHwAstOitrUGow7kLH1PpjIy7M/mc=;
	b=q8NbtrPz8scVpykDVYSvP4c+5g5eWyCVZyGEm2WRJ8u6xqgtjkE5uW+vKWIi4nc7Bti7J3
	OsSOCi03egF/KXQOCb9MKCTtQpp0poKR88t9cCMHkgiEnLSDE94slJl9EYL0IJ2Y3Y6OyD
	mi4O7KJ+mObWrdZurFAk3UWdvriuahxTCEJDxeGM02U5nTRsDFrIPLwyUvH7ABcuiKXujU
	5tHGIxHVfaWXfw5xAxDQr5pFZ9qm2FFDoRWp4ZwZt1+YA20QqCasFna+7zdfsJXX601Uxt
	fwDtkL9VQ4+AV8u0OUVFGckEnp+h4sNR8bhX+ERmdarTdiAJmcA15cmIvXT/+Q==
Message-ID: <78ff36f6-01a7-4df4-b653-c4509fb93af4@timsurber.de>
Date: Tue, 4 Mar 2025 17:43:54 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v13 0/6] Add Synopsys DesignWare HDMI RX Controller
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Shreeya Patel <shreeya.patel@collabora.com>, Heiko Stuebner
 <heiko@sntech.de>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, jose.abreu@synopsys.com, nelson.costa@synopsys.com,
 shawn.wen@rock-chips.com, nicolas.dufresne@collabora.com,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: kernel@collabora.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Diederik de Haas <didi.debian@cknow.org>
References: <20250304085819.108067-1-dmitry.osipenko@collabora.com>
Content-Language: en-US
From: Tim Surber <me@timsurber.de>
In-Reply-To: <20250304085819.108067-1-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 4Z6hN10cJvz9srJ

Hi Dmitry,

it took a while to get my test setup going again. Sadly it does still 
not sync with AppleTV Device (which should be a standard-compliant 
HDMI-Device). In a few hours I will post a timing comparision with the 
vendor kernel. I don't know if this should block the merge or this 
should be fixed later.

Best regards
Tim

On 3/4/25 09:58, Dmitry Osipenko wrote:
> Note RE the MAINTAINERS patch:
>    Shreeya is currently busy and will be maintaining driver later on.
>    I'm helping to upstream the driver meantime.
> 
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
> * We tested and verified the support for interlaced video.
> * We tested capturing of YUV formats.
> 
> To test the HDMI RX Controller driver, following example commands can be used :-
> 
> root@debian-rockchip-rock5b-rk3588:~#  v4l2-ctl --stream-mmap \
> --stream-count=100 --stream-to=/home/hdmiin4k.raw
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
> root@debian-rockchip-rock5b-rk3588:~# v4l2-compliance -d /dev/video1
> v4l2-compliance 1.29.0-5326, 64 bits, 64-bit time_t
> v4l2-compliance SHA: 77f5df419204 2025-02-07 08:59:59
> 
> Compliance test for snps_hdmirx device /dev/video1:
> 
> Driver Info:
>          Driver name      : snps_hdmirx
>          Card type        : snps_hdmirx
>          Bus info         : platform:fdee0000.hdmi_receiver
>          Driver version   : 6.14.0
>          Capabilities     : 0x84201000
>                  Video Capture Multiplanar
>                  Streaming
>                  Extended Pix Format
>                  Device Capabilities
>          Device Caps      : 0x04201000
>                  Video Capture Multiplanar
>                  Streaming
>                  Extended Pix Format
> 
> Required ioctls:
>          test VIDIOC_QUERYCAP: OK
>          test invalid ioctls: OK
> 
> Allow for multiple opens:
>          test second /dev/video1 open: OK
>          test VIDIOC_QUERYCAP: OK
>          test VIDIOC_G/S_PRIORITY: OK
>          test for unlimited opens: OK
> 
> Debug ioctls:
>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>          test VIDIOC_LOG_STATUS: OK
> 
> Input ioctls:
>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>          test VIDIOC_G/S/ENUMINPUT: OK
>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>          Inputs: 1 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>          Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK
>          test VIDIOC_DV_TIMINGS_CAP: OK
>          test VIDIOC_G/S_EDID: OK
> 
> Control ioctls (Input 0):
>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>          test VIDIOC_QUERYCTRL: OK
>          test VIDIOC_G/S_CTRL: OK
>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>          Standard Controls: 4 Private Controls: 0
> 
> Format ioctls (Input 0):
>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>          test VIDIOC_G/S_PARM: OK
>          test VIDIOC_G_FBUF: OK (Not Supported)
>          test VIDIOC_G_FMT: OK
>          test VIDIOC_TRY_FMT: OK
>          test VIDIOC_S_FMT: OK
>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>          test Cropping: OK (Not Supported)
>          test Composing: OK (Not Supported)
>          test Scaling: OK (Not Supported)
> 
> Codec ioctls (Input 0):
>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls (Input 0):
>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>          test CREATE_BUFS maximum buffers: OK
>          test VIDIOC_REMOVE_BUFS: OK
>          test VIDIOC_EXPBUF: OK
>          test Requests: OK (Not Supported)
>          test blocking wait: OK
> 
> Test input 0:
> 
> Streaming ioctls:
>          test read/write: OK (Not Supported)
>          test MMAP (no poll, REQBUFS): OK
>          test MMAP (select, REQBUFS): OK
>          test MMAP (epoll, REQBUFS): OK
>          test MMAP (no poll, CREATE_BUFS): OK
>          test MMAP (select, CREATE_BUFS): OK
>          test MMAP (epoll, CREATE_BUFS): OK
>          test USERPTR (no poll): OK (Not Supported)
>          test USERPTR (select): OK (Not Supported)
>          test DMABUF: Cannot test, specify --expbuf-device
> 
> Total for snps_hdmirx device /dev/video1: 57, Succeeded: 57, Failed: 0, Warnings: 0
> 
> ---
> 
> InfoFrame debugfs example output:-
> 
> # edid-decode -c -I /sys/kernel/debug/v4l2/fdee0000.hdmi_receiver/infoframes/avi
> edid-decode InfoFrame (hex):
> 
> 82 02 0d b1 12 28 84 00 00 00 00 00 00 00 00 00
> 00
> 
> ----------------
> 
> HDMI InfoFrame Checksum: 0xb1
> 
> AVI InfoFrame
>    Version: 2
>    Length: 13
>    Y: Color Component Sample Format: RGB
>    A: Active Format Information Present: Yes
>    B: Bar Data Present: Bar Data not present
>    S: Scan Information: Composed for an underscanned display
>    C: Colorimetry: No Data
>    M: Picture Aspect Ratio: 16:9
>    R: Active Portion Aspect Ratio: 8
>    ITC: IT Content: IT Content (CN is valid)
>    EC: Extended Colorimetry: xvYCC601
>    Q: RGB Quantization Range: Limited Range
>    SC: Non-Uniform Picture Scaling: No Known non-uniform scaling
>    YQ: YCC Quantization Range: Limited Range
>    CN: IT Content Type: Graphics
>    PR: Pixel Data Repetition Count: 0
>    Line Number of End of Top Bar: 0
>    Line Number of Start of Bottom Bar: 0
>    Pixel Number of End of Left Bar: 0
>    Pixel Number of Start of Right Bar: 0
> 
> ----------------
> 
> edid-decode 1.29.0-5326
> edid-decode SHA: 77f5df419204 2025-02-07 08:59:59
> 
> AVI InfoFrame conformity: PASS
> 
> ---
> 
> Changes in v13 :-
> - Removed CEC adapter notifier as it's not used by this driver
> 
> Changes in v12 :-
> - Removed legacy wait_finish/prepare() callbacks from vb2_ops,
>    tested that driver works without them.
> - Updated and extended driver Kconfig description RE the
>    LOAD_DEFAULT_EDID option.
> - Made minor cosmetical improvements to the code
> 
> Changes in v11 :-
> - Reverted back defconfig patch by removing LOAD_DEFAULT_EDID=y option
> - Removed CEC notifier since it's not needed for this driver
> - Replaced video_unregister_device() with vb2_video_unregister_device()
> - Added more clarifying comments to the code and updated the timing
>    sanity-check, borrowing it from a newer downstream driver version.
> 
> Changes in v10 :-
> - Replaced cec_unregister_adapter() with cec_notifier_cec_adap_unregister()
>    in the error unwinding code path of the driver probe, tested that it works
>    properly.
> - Changed CEC registration code to propagate original error code to the
>    driver's probe-failure code path on the CEC registration failure.
> - Enabled LOAD_DEFAULT_EDID=y in the defconfig patch
> 
> Changes in v9 :-
> - Added devm_add_action_or_reset() to free reserved memory properly
>    on driver probe error
> - Extra minor code cleanups
> 
> Changes in v8 :-
> - Changed HPD logic as was requested by Hans Verkuil. HPD handling
>    is now decoupled from HDMI plugin/out events and works independently
>    from 5v status.
> - Bumped number of EDID blocks from 2 to 4 as was requested by
>    Hans Verkuil and verified that reading 3/4 EDID blocks from transmitter
>    works properly.
> - Made few extra minor cleanup/improvements to the driver code
> 
> Changes in v7 :-
> - Changed InfoFrame debugfs to return truncated payload data
> - Updated cover-letter example stream capture cmdline with a minimized
>    and cleaned version of the cmdline
> - Added AVI InfoFrame example output to the cover-letter
> 
> Changes in v6 :-
> - Driver now keeps HPD low instead of zeroing EDID when EDID-clearing is
>    invoked and when default EDID usage is disabled in the kernel config
> - Added InfoFrame debugfs support
> - Added another code comment clarifying validation of timing values
> - Rebased on top of recent media-next tree
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
> Sebastian Reichel (2):
>    arm64: dts: rockchip: Enable HDMI receiver on rock-5b
>    arm64: defconfig: Enable Synopsys HDMI receiver
> 
> Shreeya Patel (4):
>    MAINTAINERS: Add entry for Synopsys DesignWare HDMI RX Driver
>    dt-bindings: media: Document bindings for HDMI RX Controller
>    media: platform: synopsys: Add support for HDMI input driver
>    arm64: dts: rockchip: Add device tree support for HDMI RX Controller
> 
>   .../bindings/media/snps,dw-hdmi-rx.yaml       |  132 +
>   MAINTAINERS                                   |    8 +
>   .../dts/rockchip/rk3588-base-pinctrl.dtsi     |   14 +
>   .../arm64/boot/dts/rockchip/rk3588-extra.dtsi |   57 +
>   .../boot/dts/rockchip/rk3588-rock-5b.dts      |   18 +
>   arch/arm64/configs/defconfig                  |    1 +
>   drivers/media/platform/Kconfig                |    1 +
>   drivers/media/platform/Makefile               |    1 +
>   drivers/media/platform/synopsys/Kconfig       |    3 +
>   drivers/media/platform/synopsys/Makefile      |    2 +
>   .../media/platform/synopsys/hdmirx/Kconfig    |   35 +
>   .../media/platform/synopsys/hdmirx/Makefile   |    4 +
>   .../platform/synopsys/hdmirx/snps_hdmirx.c    | 2750 +++++++++++++++++
>   .../platform/synopsys/hdmirx/snps_hdmirx.h    |  394 +++
>   .../synopsys/hdmirx/snps_hdmirx_cec.c         |  275 ++
>   .../synopsys/hdmirx/snps_hdmirx_cec.h         |   43 +
>   16 files changed, 3738 insertions(+)
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


