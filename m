Return-Path: <linux-media+bounces-27438-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3475A4D784
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 10:10:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00EE418847F4
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 09:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16B271FCF68;
	Tue,  4 Mar 2025 09:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="Y24BMuBf"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452F21EEA54;
	Tue,  4 Mar 2025 09:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741078905; cv=pass; b=EDd+rbLo7gp07yIDmQ6++vi9ZgsOHBTjjIeJ8shZ4Vf4sF4XR2hMhgz7kzZfSpuHZeQpxCsweFeS43Q5cTcmzGgLuEd+s06hN56d9OAaQ28XNyZ8RJrenHBVQh3c+6KTy3B7sQhMFwVUXySE8XmQGuHprcYs8ZhJL9CzpLVagSQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741078905; c=relaxed/simple;
	bh=OTow0Is4PmRWlPxteV7blXZqX9+sI/JgDhWM7j3ecUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bxIig3dcZ+/UcszMKH/fUnqf8c4Cjmq7VvnMVyHWhiLNMUL+DaPeX3kQxwnCqSH7KnEiVsEECgfBMQJ/h+XB3c0NclfjesWKLfN96tM4D+Ob6FOI39oW84BXuDvjuTJf7LMLg+Gl/f2H7WCaYyBc9CIwqvzZeu7kioo3Jt+9c+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=Y24BMuBf; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1741078844; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=n1sldY0BEnN1RXcHe2g2iIjR3fwNYSYxVvIJWC7zAY2vaSfrDX18+WjU9bRbvkfUgz27Xxn3eKzL4f6qtgD8jCQ8rWyKEvV3UGZILAgrRwx51nzehjUI7IouRbRpzxaVYBhHTaqhGuSpst4lhGYO7oKiQBSbHsWcxzd9HncJZY4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741078844; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+y0ND+5hxNBpw/KeacJ+YrWVXTTdBWMP0aXhXa3+l5M=; 
	b=OybVdBiWZVxANxQxLGRnA99VUBavydTr7xLPg6S+UB94rZZls0WVBOhBK+wCRAFnn4MKEXEJfyI0esgnTxYznm3eNuyRm6cOWAmoJBjJMz0y4JqKJyG3oD/UKW948Yf1r+ufpcdzlhFReCnigldnXMV5zMouOuZBGbhW4pq+PPQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741078844;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=+y0ND+5hxNBpw/KeacJ+YrWVXTTdBWMP0aXhXa3+l5M=;
	b=Y24BMuBfLC+Bm3QqqgkLJ3ZsKwRXeDC/atIUduBzwiwNg9AZuPNonE5QIoVWE65G
	Lv6YL2z0ZyZKVphbztQYbK1c0enYTRadME4/F6c3rRvaz70V3bijHc9GE97MzP1Xb5g
	qQdSdBlaO5lPKcmzgf7pPb1zrdeCikRVR1XPP/JM=
Received: by mx.zohomail.com with SMTPS id 1741078840135675.212134935874;
	Tue, 4 Mar 2025 01:00:40 -0800 (PST)
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Shreeya Patel <shreeya.patel@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	jose.abreu@synopsys.com,
	nelson.costa@synopsys.com,
	shawn.wen@rock-chips.com,
	nicolas.dufresne@collabora.com,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: kernel@collabora.com,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Tim Surber <me@timsurber.de>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH v13 0/6] Add Synopsys DesignWare HDMI RX Controller
Date: Tue,  4 Mar 2025 11:58:13 +0300
Message-ID: <20250304085819.108067-1-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Note RE the MAINTAINERS patch:
  Shreeya is currently busy and will be maintaining driver later on.
  I'm helping to upstream the driver meantime.

This series implements support for the Synopsys DesignWare
HDMI RX Controller, being compliant with standard HDMI 1.4b
and HDMI 2.0.

Features that are currently supported by the HDMI RX driver
have been tested on rock5b board using a HDMI to micro-HDMI cable.
It is recommended to use a good quality cable as there were
multiple issues seen during testing the driver.

Please note the below information :-
* HDMIRX driver now only works with the opensource TF-A.
* We have tested the working of OBS studio with HDMIRX driver and
there were no issues seen.
* We tested and verified the support for interlaced video.
* We tested capturing of YUV formats.

To test the HDMI RX Controller driver, following example commands can be used :-

root@debian-rockchip-rock5b-rk3588:~#  v4l2-ctl --stream-mmap \
--stream-count=100 --stream-to=/home/hdmiin4k.raw

root@debian-rockchip-rock5b-rk3588:~# ffmpeg -f rawvideo -vcodec rawvideo \
-s 1920x1080 -r 60 -pix_fmt bgr24 -i /home/hdmiin4k.raw output.mkv

CEC compliance test results :-

* https://gitlab.collabora.com/-/snippets/380
* https://gitlab.collabora.com/-/snippets/381

Following is the v4l2-compliance test result :-

root@debian-rockchip-rock5b-rk3588:~# v4l2-compliance -d /dev/video1
v4l2-compliance 1.29.0-5326, 64 bits, 64-bit time_t
v4l2-compliance SHA: 77f5df419204 2025-02-07 08:59:59

Compliance test for snps_hdmirx device /dev/video1:

Driver Info:
        Driver name      : snps_hdmirx
        Card type        : snps_hdmirx
        Bus info         : platform:fdee0000.hdmi_receiver
        Driver version   : 6.14.0
        Capabilities     : 0x84201000
                Video Capture Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04201000
                Video Capture Multiplanar
                Streaming
                Extended Pix Format

Required ioctls:
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video1 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 1 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK
        test VIDIOC_DV_TIMINGS_CAP: OK
        test VIDIOC_G/S_EDID: OK

Control ioctls (Input 0):
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 4 Private Controls: 0

Format ioctls (Input 0):
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls (Input 0):
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 0):
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)
        test blocking wait: OK

Test input 0:

Streaming ioctls:
        test read/write: OK (Not Supported)
        test MMAP (no poll, REQBUFS): OK                  
        test MMAP (select, REQBUFS): OK                   
        test MMAP (epoll, REQBUFS): OK                    
        test MMAP (no poll, CREATE_BUFS): OK              
        test MMAP (select, CREATE_BUFS): OK               
        test MMAP (epoll, CREATE_BUFS): OK                
        test USERPTR (no poll): OK (Not Supported)
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for snps_hdmirx device /dev/video1: 57, Succeeded: 57, Failed: 0, Warnings: 0

---

InfoFrame debugfs example output:-

# edid-decode -c -I /sys/kernel/debug/v4l2/fdee0000.hdmi_receiver/infoframes/avi
edid-decode InfoFrame (hex):

82 02 0d b1 12 28 84 00 00 00 00 00 00 00 00 00
00

----------------

HDMI InfoFrame Checksum: 0xb1

AVI InfoFrame
  Version: 2
  Length: 13
  Y: Color Component Sample Format: RGB
  A: Active Format Information Present: Yes
  B: Bar Data Present: Bar Data not present
  S: Scan Information: Composed for an underscanned display
  C: Colorimetry: No Data
  M: Picture Aspect Ratio: 16:9
  R: Active Portion Aspect Ratio: 8
  ITC: IT Content: IT Content (CN is valid)
  EC: Extended Colorimetry: xvYCC601
  Q: RGB Quantization Range: Limited Range
  SC: Non-Uniform Picture Scaling: No Known non-uniform scaling
  YQ: YCC Quantization Range: Limited Range
  CN: IT Content Type: Graphics
  PR: Pixel Data Repetition Count: 0
  Line Number of End of Top Bar: 0
  Line Number of Start of Bottom Bar: 0
  Pixel Number of End of Left Bar: 0
  Pixel Number of Start of Right Bar: 0

----------------

edid-decode 1.29.0-5326
edid-decode SHA: 77f5df419204 2025-02-07 08:59:59

AVI InfoFrame conformity: PASS

---

Changes in v13 :-
- Removed CEC adapter notifier as it's not used by this driver

Changes in v12 :-
- Removed legacy wait_finish/prepare() callbacks from vb2_ops,
  tested that driver works without them.
- Updated and extended driver Kconfig description RE the
  LOAD_DEFAULT_EDID option.
- Made minor cosmetical improvements to the code

Changes in v11 :-
- Reverted back defconfig patch by removing LOAD_DEFAULT_EDID=y option
- Removed CEC notifier since it's not needed for this driver
- Replaced video_unregister_device() with vb2_video_unregister_device()
- Added more clarifying comments to the code and updated the timing
  sanity-check, borrowing it from a newer downstream driver version.

Changes in v10 :-
- Replaced cec_unregister_adapter() with cec_notifier_cec_adap_unregister()
  in the error unwinding code path of the driver probe, tested that it works
  properly.
- Changed CEC registration code to propagate original error code to the
  driver's probe-failure code path on the CEC registration failure.
- Enabled LOAD_DEFAULT_EDID=y in the defconfig patch

Changes in v9 :-
- Added devm_add_action_or_reset() to free reserved memory properly
  on driver probe error
- Extra minor code cleanups

Changes in v8 :-
- Changed HPD logic as was requested by Hans Verkuil. HPD handling
  is now decoupled from HDMI plugin/out events and works independently
  from 5v status.
- Bumped number of EDID blocks from 2 to 4 as was requested by
  Hans Verkuil and verified that reading 3/4 EDID blocks from transmitter
  works properly.
- Made few extra minor cleanup/improvements to the driver code

Changes in v7 :-
- Changed InfoFrame debugfs to return truncated payload data
- Updated cover-letter example stream capture cmdline with a minimized
  and cleaned version of the cmdline
- Added AVI InfoFrame example output to the cover-letter

Changes in v6 :-
- Driver now keeps HPD low instead of zeroing EDID when EDID-clearing is
  invoked and when default EDID usage is disabled in the kernel config
- Added InfoFrame debugfs support
- Added another code comment clarifying validation of timing values
- Rebased on top of recent media-next tree

Changes in v5 :-
- Fix the interrupt IRQ number in the dt-bindings and device tree
- Add alignment property to ensure hdmi-receiver-cma
  starts at a 64KB-aligned address
- Change the MODULE_DESCRIPTION
- Add VIDEO_SYNOPSYS_HDMIRX as prefix to the default edid config
- Drop the enabling of default edid in the Kconfig
- Replace the default EDID with hdmi-4k-300mhz EDID produced
  by v4l2-ctl tool for better compatibility with various HDMI
  cables and adapters
- Rework the write_edid and set_edid functions
- During format change, retrieve the current pixel format,
  color depth, and AVI infoframe details instead of only
  detecting the format
- Improve the logging mechanism and delays in the
  hdmirx_wait_signal_lock function
- Fix the 4K@60 capturing for RGB format
- Document what hdmirx_check_timing_valid function does
- Rework the hdmirx_get_detected_timings function
- Fix the NV16/24 size image value
- Add the implementation from Benjamin Hoff to expose the
  ITC type to v4l2
- Remove all the firmware related code

Changes in v4 :-
- Remove DTS changes included in the device tree patch
- Remove the hdmi rx pin info as it's already present
in the rk3588-base-pinctrl.dtsi
- Create a separate config option for selecting the EDID
and enable it by default
- Improve the comment related to DV timings and move it
to the side of hdmirx_get_detected_timings
- Add 100ms delay before pulling the HPD high
- Do not return the detected timings from VIDIOC_G_DV_TIMINGS
- Drop the bus info from hdmirx_querycap
- If *num_planes != 0 then return 0 in hdmirx_queue_setup
- Set queue->min_queued_buffers to 1
- Drop q->allow_cache_hints = 0; as it's always 0 by default
- Add a comment for q->dma_attrs = DMA_ATTR_FORCE_CONTIGUOUS;
- Drop .read = vb2_fop_read as it's not supported by driver
- Remove redundant edid_init_data_600M
- Make HPD low when driver is loaded
- Add support for reading AVI Infoframe
- Remove msg_len checks from hdmirx_cec_transmit
- Add info about the CEC compliance test in the cover letter
- Add arbitration lost status
- Validate the physical address inside the EDID

Changes in v3 :-
- Use v4l2-common helpers in the HDMIRX driver
- Rename cma node and phandle names
- Elaborate the comment to explain 160MiB calculation
- Move &hdmi_receiver_cma to the rock5b dts file
- Add information about interlaced video testing in the
cover-letter

Changes in v2 :-
- Fix checkpatch --strict warnings
- Move the dt-binding include file changes in a separate patch
- Add a description for the hardware in the dt-bindings file
- Rename resets, vo1 grf and HPD properties
- Add a proper description for grf and vo1-grf phandles in the
bindings
- Rename the HDMI RX node name to hdmi-receiver
- Include gpio header file in binding example to fix the
dt_binding_check failure
- Move hdmirx_cma node to the rk3588.dtsi file
- Add an entry to MAINTAINERS file for the HDMIRX driver

Sebastian Reichel (2):
  arm64: dts: rockchip: Enable HDMI receiver on rock-5b
  arm64: defconfig: Enable Synopsys HDMI receiver

Shreeya Patel (4):
  MAINTAINERS: Add entry for Synopsys DesignWare HDMI RX Driver
  dt-bindings: media: Document bindings for HDMI RX Controller
  media: platform: synopsys: Add support for HDMI input driver
  arm64: dts: rockchip: Add device tree support for HDMI RX Controller

 .../bindings/media/snps,dw-hdmi-rx.yaml       |  132 +
 MAINTAINERS                                   |    8 +
 .../dts/rockchip/rk3588-base-pinctrl.dtsi     |   14 +
 .../arm64/boot/dts/rockchip/rk3588-extra.dtsi |   57 +
 .../boot/dts/rockchip/rk3588-rock-5b.dts      |   18 +
 arch/arm64/configs/defconfig                  |    1 +
 drivers/media/platform/Kconfig                |    1 +
 drivers/media/platform/Makefile               |    1 +
 drivers/media/platform/synopsys/Kconfig       |    3 +
 drivers/media/platform/synopsys/Makefile      |    2 +
 .../media/platform/synopsys/hdmirx/Kconfig    |   35 +
 .../media/platform/synopsys/hdmirx/Makefile   |    4 +
 .../platform/synopsys/hdmirx/snps_hdmirx.c    | 2750 +++++++++++++++++
 .../platform/synopsys/hdmirx/snps_hdmirx.h    |  394 +++
 .../synopsys/hdmirx/snps_hdmirx_cec.c         |  275 ++
 .../synopsys/hdmirx/snps_hdmirx_cec.h         |   43 +
 16 files changed, 3738 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
 create mode 100644 drivers/media/platform/synopsys/Kconfig
 create mode 100644 drivers/media/platform/synopsys/Makefile
 create mode 100644 drivers/media/platform/synopsys/hdmirx/Kconfig
 create mode 100644 drivers/media/platform/synopsys/hdmirx/Makefile
 create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
 create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.h
 create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx_cec.c
 create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx_cec.h

-- 
2.48.1


