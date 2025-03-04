Return-Path: <linux-media+bounces-27513-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2E6A4E9BC
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 18:47:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 603EA164B57
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 17:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 471F529DB9E;
	Tue,  4 Mar 2025 17:18:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84B827CCC2;
	Tue,  4 Mar 2025 17:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741108683; cv=none; b=EDW6lal8alG4FhOc+svPAjdAZO2LEZqLSDCitUKvBXVfUuVKKB2jpZviUqNk7KtrsYHqx9h9M+dIWGQYBKjRm/6rI0ws0x7MCNVb/nK9MO+e1tP67SWszH3fS4s9WG98ar3mDcLfirrt+LSC2oLw6z3S0aeqk9OhhJ2mneWehws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741108683; c=relaxed/simple;
	bh=2mZqrtY3JLjsl3S6t+CXPM7hlE+yjD6qP0yrzYqFkRc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WdwYoeJJxmCbtf9+POk8wnnOhfpPUw2n3OiWg9RDPQZbaxNIyady18qycVSbyphyO1n2oSuZOzMkzVsHYjvenrIU+qGKjc0kJ7ryenoEX0+DmnjIFtTLP19hYCvs+vEkpQuh8GL1+JVB10I6Ir+V6nBRKi55jbxKoCcYJU/7/qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 567ECC4CEED;
	Tue,  4 Mar 2025 17:18:00 +0000 (UTC)
Message-ID: <e2e9b2c2-3bd8-419f-aed2-f6f811bdc486@xs4all.nl>
Date: Tue, 4 Mar 2025 18:17:58 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 0/6] Add Synopsys DesignWare HDMI RX Controller
To: Tim Surber <me@timsurber.de>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Shreeya Patel <shreeya.patel@collabora.com>, Heiko Stuebner
 <heiko@sntech.de>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, jose.abreu@synopsys.com,
 nelson.costa@synopsys.com, shawn.wen@rock-chips.com,
 nicolas.dufresne@collabora.com,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: kernel@collabora.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Diederik de Haas <didi.debian@cknow.org>
References: <20250304085819.108067-1-dmitry.osipenko@collabora.com>
 <78ff36f6-01a7-4df4-b653-c4509fb93af4@timsurber.de>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <78ff36f6-01a7-4df4-b653-c4509fb93af4@timsurber.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/03/2025 17:43, Tim Surber wrote:
> Hi Dmitry,
> 
> it took a while to get my test setup going again. Sadly it does still 
> not sync with AppleTV Device (which should be a standard-compliant 
> HDMI-Device). In a few hours I will post a timing comparision with the 
> vendor kernel. I don't know if this should block the merge or this 
> should be fixed later.

I'll wait until Thursday before making a decision. Hopefully there is some
clarity by then whether or not this is a blocker.

Regards,

	Hans

> 
> Best regards
> Tim
> 
> On 3/4/25 09:58, Dmitry Osipenko wrote:
>> Note RE the MAINTAINERS patch:
>>    Shreeya is currently busy and will be maintaining driver later on.
>>    I'm helping to upstream the driver meantime.
>>
>> This series implements support for the Synopsys DesignWare
>> HDMI RX Controller, being compliant with standard HDMI 1.4b
>> and HDMI 2.0.
>>
>> Features that are currently supported by the HDMI RX driver
>> have been tested on rock5b board using a HDMI to micro-HDMI cable.
>> It is recommended to use a good quality cable as there were
>> multiple issues seen during testing the driver.
>>
>> Please note the below information :-
>> * HDMIRX driver now only works with the opensource TF-A.
>> * We have tested the working of OBS studio with HDMIRX driver and
>> there were no issues seen.
>> * We tested and verified the support for interlaced video.
>> * We tested capturing of YUV formats.
>>
>> To test the HDMI RX Controller driver, following example commands can be used :-
>>
>> root@debian-rockchip-rock5b-rk3588:~#  v4l2-ctl --stream-mmap \
>> --stream-count=100 --stream-to=/home/hdmiin4k.raw
>>
>> root@debian-rockchip-rock5b-rk3588:~# ffmpeg -f rawvideo -vcodec rawvideo \
>> -s 1920x1080 -r 60 -pix_fmt bgr24 -i /home/hdmiin4k.raw output.mkv
>>
>> CEC compliance test results :-
>>
>> * https://gitlab.collabora.com/-/snippets/380
>> * https://gitlab.collabora.com/-/snippets/381
>>
>> Following is the v4l2-compliance test result :-
>>
>> root@debian-rockchip-rock5b-rk3588:~# v4l2-compliance -d /dev/video1
>> v4l2-compliance 1.29.0-5326, 64 bits, 64-bit time_t
>> v4l2-compliance SHA: 77f5df419204 2025-02-07 08:59:59
>>
>> Compliance test for snps_hdmirx device /dev/video1:
>>
>> Driver Info:
>>          Driver name      : snps_hdmirx
>>          Card type        : snps_hdmirx
>>          Bus info         : platform:fdee0000.hdmi_receiver
>>          Driver version   : 6.14.0
>>          Capabilities     : 0x84201000
>>                  Video Capture Multiplanar
>>                  Streaming
>>                  Extended Pix Format
>>                  Device Capabilities
>>          Device Caps      : 0x04201000
>>                  Video Capture Multiplanar
>>                  Streaming
>>                  Extended Pix Format
>>
>> Required ioctls:
>>          test VIDIOC_QUERYCAP: OK
>>          test invalid ioctls: OK
>>
>> Allow for multiple opens:
>>          test second /dev/video1 open: OK
>>          test VIDIOC_QUERYCAP: OK
>>          test VIDIOC_G/S_PRIORITY: OK
>>          test for unlimited opens: OK
>>
>> Debug ioctls:
>>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>          test VIDIOC_LOG_STATUS: OK
>>
>> Input ioctls:
>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMINPUT: OK
>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>          Inputs: 1 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK
>>          test VIDIOC_DV_TIMINGS_CAP: OK
>>          test VIDIOC_G/S_EDID: OK
>>
>> Control ioctls (Input 0):
>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>>          test VIDIOC_QUERYCTRL: OK
>>          test VIDIOC_G/S_CTRL: OK
>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>          Standard Controls: 4 Private Controls: 0
>>
>> Format ioctls (Input 0):
>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>          test VIDIOC_G/S_PARM: OK
>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>          test VIDIOC_G_FMT: OK
>>          test VIDIOC_TRY_FMT: OK
>>          test VIDIOC_S_FMT: OK
>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>          test Cropping: OK (Not Supported)
>>          test Composing: OK (Not Supported)
>>          test Scaling: OK (Not Supported)
>>
>> Codec ioctls (Input 0):
>>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>
>> Buffer ioctls (Input 0):
>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>          test CREATE_BUFS maximum buffers: OK
>>          test VIDIOC_REMOVE_BUFS: OK
>>          test VIDIOC_EXPBUF: OK
>>          test Requests: OK (Not Supported)
>>          test blocking wait: OK
>>
>> Test input 0:
>>
>> Streaming ioctls:
>>          test read/write: OK (Not Supported)
>>          test MMAP (no poll, REQBUFS): OK
>>          test MMAP (select, REQBUFS): OK
>>          test MMAP (epoll, REQBUFS): OK
>>          test MMAP (no poll, CREATE_BUFS): OK
>>          test MMAP (select, CREATE_BUFS): OK
>>          test MMAP (epoll, CREATE_BUFS): OK
>>          test USERPTR (no poll): OK (Not Supported)
>>          test USERPTR (select): OK (Not Supported)
>>          test DMABUF: Cannot test, specify --expbuf-device
>>
>> Total for snps_hdmirx device /dev/video1: 57, Succeeded: 57, Failed: 0, Warnings: 0
>>
>> ---
>>
>> InfoFrame debugfs example output:-
>>
>> # edid-decode -c -I /sys/kernel/debug/v4l2/fdee0000.hdmi_receiver/infoframes/avi
>> edid-decode InfoFrame (hex):
>>
>> 82 02 0d b1 12 28 84 00 00 00 00 00 00 00 00 00
>> 00
>>
>> ----------------
>>
>> HDMI InfoFrame Checksum: 0xb1
>>
>> AVI InfoFrame
>>    Version: 2
>>    Length: 13
>>    Y: Color Component Sample Format: RGB
>>    A: Active Format Information Present: Yes
>>    B: Bar Data Present: Bar Data not present
>>    S: Scan Information: Composed for an underscanned display
>>    C: Colorimetry: No Data
>>    M: Picture Aspect Ratio: 16:9
>>    R: Active Portion Aspect Ratio: 8
>>    ITC: IT Content: IT Content (CN is valid)
>>    EC: Extended Colorimetry: xvYCC601
>>    Q: RGB Quantization Range: Limited Range
>>    SC: Non-Uniform Picture Scaling: No Known non-uniform scaling
>>    YQ: YCC Quantization Range: Limited Range
>>    CN: IT Content Type: Graphics
>>    PR: Pixel Data Repetition Count: 0
>>    Line Number of End of Top Bar: 0
>>    Line Number of Start of Bottom Bar: 0
>>    Pixel Number of End of Left Bar: 0
>>    Pixel Number of Start of Right Bar: 0
>>
>> ----------------
>>
>> edid-decode 1.29.0-5326
>> edid-decode SHA: 77f5df419204 2025-02-07 08:59:59
>>
>> AVI InfoFrame conformity: PASS
>>
>> ---
>>
>> Changes in v13 :-
>> - Removed CEC adapter notifier as it's not used by this driver
>>
>> Changes in v12 :-
>> - Removed legacy wait_finish/prepare() callbacks from vb2_ops,
>>    tested that driver works without them.
>> - Updated and extended driver Kconfig description RE the
>>    LOAD_DEFAULT_EDID option.
>> - Made minor cosmetical improvements to the code
>>
>> Changes in v11 :-
>> - Reverted back defconfig patch by removing LOAD_DEFAULT_EDID=y option
>> - Removed CEC notifier since it's not needed for this driver
>> - Replaced video_unregister_device() with vb2_video_unregister_device()
>> - Added more clarifying comments to the code and updated the timing
>>    sanity-check, borrowing it from a newer downstream driver version.
>>
>> Changes in v10 :-
>> - Replaced cec_unregister_adapter() with cec_notifier_cec_adap_unregister()
>>    in the error unwinding code path of the driver probe, tested that it works
>>    properly.
>> - Changed CEC registration code to propagate original error code to the
>>    driver's probe-failure code path on the CEC registration failure.
>> - Enabled LOAD_DEFAULT_EDID=y in the defconfig patch
>>
>> Changes in v9 :-
>> - Added devm_add_action_or_reset() to free reserved memory properly
>>    on driver probe error
>> - Extra minor code cleanups
>>
>> Changes in v8 :-
>> - Changed HPD logic as was requested by Hans Verkuil. HPD handling
>>    is now decoupled from HDMI plugin/out events and works independently
>>    from 5v status.
>> - Bumped number of EDID blocks from 2 to 4 as was requested by
>>    Hans Verkuil and verified that reading 3/4 EDID blocks from transmitter
>>    works properly.
>> - Made few extra minor cleanup/improvements to the driver code
>>
>> Changes in v7 :-
>> - Changed InfoFrame debugfs to return truncated payload data
>> - Updated cover-letter example stream capture cmdline with a minimized
>>    and cleaned version of the cmdline
>> - Added AVI InfoFrame example output to the cover-letter
>>
>> Changes in v6 :-
>> - Driver now keeps HPD low instead of zeroing EDID when EDID-clearing is
>>    invoked and when default EDID usage is disabled in the kernel config
>> - Added InfoFrame debugfs support
>> - Added another code comment clarifying validation of timing values
>> - Rebased on top of recent media-next tree
>>
>> Changes in v5 :-
>> - Fix the interrupt IRQ number in the dt-bindings and device tree
>> - Add alignment property to ensure hdmi-receiver-cma
>>    starts at a 64KB-aligned address
>> - Change the MODULE_DESCRIPTION
>> - Add VIDEO_SYNOPSYS_HDMIRX as prefix to the default edid config
>> - Drop the enabling of default edid in the Kconfig
>> - Replace the default EDID with hdmi-4k-300mhz EDID produced
>>    by v4l2-ctl tool for better compatibility with various HDMI
>>    cables and adapters
>> - Rework the write_edid and set_edid functions
>> - During format change, retrieve the current pixel format,
>>    color depth, and AVI infoframe details instead of only
>>    detecting the format
>> - Improve the logging mechanism and delays in the
>>    hdmirx_wait_signal_lock function
>> - Fix the 4K@60 capturing for RGB format
>> - Document what hdmirx_check_timing_valid function does
>> - Rework the hdmirx_get_detected_timings function
>> - Fix the NV16/24 size image value
>> - Add the implementation from Benjamin Hoff to expose the
>>    ITC type to v4l2
>> - Remove all the firmware related code
>>
>> Changes in v4 :-
>> - Remove DTS changes included in the device tree patch
>> - Remove the hdmi rx pin info as it's already present
>> in the rk3588-base-pinctrl.dtsi
>> - Create a separate config option for selecting the EDID
>> and enable it by default
>> - Improve the comment related to DV timings and move it
>> to the side of hdmirx_get_detected_timings
>> - Add 100ms delay before pulling the HPD high
>> - Do not return the detected timings from VIDIOC_G_DV_TIMINGS
>> - Drop the bus info from hdmirx_querycap
>> - If *num_planes != 0 then return 0 in hdmirx_queue_setup
>> - Set queue->min_queued_buffers to 1
>> - Drop q->allow_cache_hints = 0; as it's always 0 by default
>> - Add a comment for q->dma_attrs = DMA_ATTR_FORCE_CONTIGUOUS;
>> - Drop .read = vb2_fop_read as it's not supported by driver
>> - Remove redundant edid_init_data_600M
>> - Make HPD low when driver is loaded
>> - Add support for reading AVI Infoframe
>> - Remove msg_len checks from hdmirx_cec_transmit
>> - Add info about the CEC compliance test in the cover letter
>> - Add arbitration lost status
>> - Validate the physical address inside the EDID
>>
>> Changes in v3 :-
>> - Use v4l2-common helpers in the HDMIRX driver
>> - Rename cma node and phandle names
>> - Elaborate the comment to explain 160MiB calculation
>> - Move &hdmi_receiver_cma to the rock5b dts file
>> - Add information about interlaced video testing in the
>> cover-letter
>>
>> Changes in v2 :-
>> - Fix checkpatch --strict warnings
>> - Move the dt-binding include file changes in a separate patch
>> - Add a description for the hardware in the dt-bindings file
>> - Rename resets, vo1 grf and HPD properties
>> - Add a proper description for grf and vo1-grf phandles in the
>> bindings
>> - Rename the HDMI RX node name to hdmi-receiver
>> - Include gpio header file in binding example to fix the
>> dt_binding_check failure
>> - Move hdmirx_cma node to the rk3588.dtsi file
>> - Add an entry to MAINTAINERS file for the HDMIRX driver
>>
>> Sebastian Reichel (2):
>>    arm64: dts: rockchip: Enable HDMI receiver on rock-5b
>>    arm64: defconfig: Enable Synopsys HDMI receiver
>>
>> Shreeya Patel (4):
>>    MAINTAINERS: Add entry for Synopsys DesignWare HDMI RX Driver
>>    dt-bindings: media: Document bindings for HDMI RX Controller
>>    media: platform: synopsys: Add support for HDMI input driver
>>    arm64: dts: rockchip: Add device tree support for HDMI RX Controller
>>
>>   .../bindings/media/snps,dw-hdmi-rx.yaml       |  132 +
>>   MAINTAINERS                                   |    8 +
>>   .../dts/rockchip/rk3588-base-pinctrl.dtsi     |   14 +
>>   .../arm64/boot/dts/rockchip/rk3588-extra.dtsi |   57 +
>>   .../boot/dts/rockchip/rk3588-rock-5b.dts      |   18 +
>>   arch/arm64/configs/defconfig                  |    1 +
>>   drivers/media/platform/Kconfig                |    1 +
>>   drivers/media/platform/Makefile               |    1 +
>>   drivers/media/platform/synopsys/Kconfig       |    3 +
>>   drivers/media/platform/synopsys/Makefile      |    2 +
>>   .../media/platform/synopsys/hdmirx/Kconfig    |   35 +
>>   .../media/platform/synopsys/hdmirx/Makefile   |    4 +
>>   .../platform/synopsys/hdmirx/snps_hdmirx.c    | 2750 +++++++++++++++++
>>   .../platform/synopsys/hdmirx/snps_hdmirx.h    |  394 +++
>>   .../synopsys/hdmirx/snps_hdmirx_cec.c         |  275 ++
>>   .../synopsys/hdmirx/snps_hdmirx_cec.h         |   43 +
>>   16 files changed, 3738 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
>>   create mode 100644 drivers/media/platform/synopsys/Kconfig
>>   create mode 100644 drivers/media/platform/synopsys/Makefile
>>   create mode 100644 drivers/media/platform/synopsys/hdmirx/Kconfig
>>   create mode 100644 drivers/media/platform/synopsys/hdmirx/Makefile
>>   create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
>>   create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.h
>>   create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx_cec.c
>>   create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx_cec.h
>>
> 


