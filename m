Return-Path: <linux-media+bounces-11047-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D6F8BE7DE
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 17:55:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18E641C21ADA
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 15:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A5A6168B08;
	Tue,  7 May 2024 15:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4S0i42gK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24083168AE8
	for <linux-media@vger.kernel.org>; Tue,  7 May 2024 15:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715097313; cv=none; b=SoMtuMGcVStTvVwdv/ooyLVixLKP9QwaR7wd1csFU3CJStJyU/cLm6DdVyHddnFQtBNM4m1PV2mcFZZqT5mpDD+86ww8LsHLrI6v23+16NrxdwMc7YQRg8vDmA1nFxAWXmuXgYf1HHXYa+FpA5QlxF82Go+5QkIjMKD7V7EIUeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715097313; c=relaxed/simple;
	bh=pQm6/UbnhlQ71QOAiSXRcdkBS2j1QGiiSL9FOmgC6gM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=YEoqDqim0r11bfxKhj6b0lxgJWHGIUot+L/4hIiNIp7CEVyAXErQb8HurAZE/Q6JV8J2ju8wzgZr8tMdB0aaMCzaVBAVQ5dcbA2zUol8L4FpCGkSIjZQY5N7q84F7ZYMHIdxtCnm/KWtizCsrvsBq5JbwTu/onoIYz8AFnmfLYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--panikiel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4S0i42gK; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--panikiel.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-416ac21981dso17709615e9.1
        for <linux-media@vger.kernel.org>; Tue, 07 May 2024 08:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715097309; x=1715702109; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RJ47pWXAtCFdZcUV/HEfsVY67B3nHtrNt0g1FksRjBo=;
        b=4S0i42gKd3EeegV5AhTOhEC6lgJPEbZn/elkAHZw61uVnRBOblNRY88bzYz3bN78Kn
         jzwr5OXnwLXC5RzP0BHTAhTSR9TOWe1AU4PyEdZu5Mh9cicRm8GaEZ2MDQSVy+WinQl5
         qzxXGdu6UaNCoECk4NGLX3+/sTGO8k0c37v7ZTvleG3HHVjaDIka7kiO48kB7kLfJBue
         feOwqcXbRLC6StobF0EyIy3fgWpx+cdbX22x51dX4M7XDW4fxl65IOYbGS/fQdXrC3OI
         Xn4uknrkmQUBBwqqk4MyYNNfnRgUumJNOszSy3BP73QwH2uvtoPtYl5qfmhkSz9QqS9b
         6UTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715097309; x=1715702109;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RJ47pWXAtCFdZcUV/HEfsVY67B3nHtrNt0g1FksRjBo=;
        b=eJkxh0Gx5495b62lx6HX3aS0Oicvpq0fL0peLQAwFY8HhUJZo37Wus7c1pzJT9eH5P
         03qszc6obVjVAMhKY2CmMQJYYNfuEsJ48ySyGGQAD2Dc4BoW9FToD3SUQJviuNqGyxQB
         wsXhzhL4cqycvmh2Z2KJqZlvSiCe3j9Itwu7hAe9+BQmIbYQ4o0RpMpnp72Y3RFLwp4Z
         lL9TDG90/AfGyBQwXj7wVxjSIl6JbmzgLrrOHiECD2+G8J4CK12Q2pjcjf1WHO15rj12
         SX0luChJ6ZXEdjbx3k4glylWrXlxGWCKEF+eOD0UTARGd7jfhSIpXA3xCRWHzj/0I4FY
         Cv9w==
X-Forwarded-Encrypted: i=1; AJvYcCUxUANaUkEolAc9Yn6mw6kQk5hsO1jcSWc1LBiWM6/kQavpqpNTI5dbI3GrGhINvfTHc3kQLI79yf56p8WEMJSkCP/MVAb6VTSDtoQ=
X-Gm-Message-State: AOJu0YxOb1FHbU1n9ssV/LY/p8LUQp72/tV5KfOvg5dMwYz/7ZucbPSG
	zY0Tdh3JwoCQYLxFTndZcDIo8qTjTrr0rwA4SeByIcn9ClTWh92+zXTGLComzhoXSrKKgEmXbEa
	KR/TASs4atw==
X-Google-Smtp-Source: AGHT+IH8xn8VWc+XkVkTbMSGWBKDl+TyyuL6M2xFwlfEJnC34wjOlZXzDZDE9agYnoRWzeKbkzLvsId01BSlcg==
X-Received: from szatan.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:2d83])
 (user=panikiel job=sendgmr) by 2002:a05:600c:5103:b0:41e:8543:c5ea with SMTP
 id 5b1f17b1804b1-41f2d44054cmr326105e9.1.1715097309052; Tue, 07 May 2024
 08:55:09 -0700 (PDT)
Date: Tue,  7 May 2024 15:54:03 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
Message-ID: <20240507155413.266057-1-panikiel@google.com>
Subject: [PATCH v3 00/10] Add Chameleon v3 video support
From: "=?UTF-8?q?Pawe=C5=82=20Anikiel?=" <panikiel@google.com>
To: airlied@gmail.com, akpm@linux-foundation.org, conor+dt@kernel.org, 
	daniel@ffwll.ch, dinguyen@kernel.org, hverkuil-cisco@xs4all.nl, 
	krzysztof.kozlowski+dt@linaro.org, maarten.lankhorst@linux.intel.com, 
	mchehab@kernel.org, mripard@kernel.org, robh+dt@kernel.org, 
	tzimmermann@suse.de
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	chromeos-krk-upstreaming@google.com, 
	"=?UTF-8?q?Pawe=C5=82=20Anikiel?=" <panikiel@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Google Chameleon v3 is a testing device capable of emulating multiple
DisplayPort monitors, used for testing purposes.  It is based on an Arria
10 SoCFPGA.  This patchset adds V4L2 drivers for two IP blocks used in the
device's FPGA: the Chameleon v3 video interface, and the Intel DisplayPort
RX IP.  The former is a video capture device that takes video signal and
writes frames into memory, which can be later processed by userspace.
The latter is a DisplayPort receiver IP from Intel, its datasheet can
be found at:
https://www.intel.com/programmable/technical-pdfs/683273.pdf

The video interface driver is a regular v4l2 capture device driver, while
the DP RX driver is a v4l2 subdevice driver. In order to avoid code
duplication, some parts of the DisplayPort code from the DRM subsystem
were put into headers usable by the DP RX driver.

This patchset depends on changes merged into the linux-media tree at:
git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.10d

Here is the output of `v4l2-compliance -s` run on a Chameleon v3 for
/dev/video0 (no attached subdevice):

```
v4l2-compliance 1.27.0-5204, 32 bits, 32-bit time_t
v4l2-compliance SHA: dd049328e528 2024-04-29 13:40:09

Compliance test for chv3-video device /dev/video0:

Driver Info:
	Driver name      : chv3-video
	Card type        : Chameleon v3 video
	Bus info         : platform:c0060500.video
	Driver version   : 6.9.0
	Capabilities     : 0x84200001
		Video Capture
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04200001
		Video Capture
		Streaming
		Extended Pix Format

Required ioctls:
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video0 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

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
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls (Input 0):
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 2 Private Controls: 0

Format ioctls (Input 0):
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
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
	test TIME32/64: OK

Test input 0:

Streaming ioctls:
	test read/write: OK (Not Supported)
	test blocking wait: OK
	test MMAP (no poll): OK
	test MMAP (select): OK
	test MMAP (epoll): OK
	test USERPTR (no poll): OK (Not Supported)
	test USERPTR (select): OK (Not Supported)
	test DMABUF: Cannot test, specify --expbuf-device

Total for chv3-video device /dev/video0: 55, Succeeded: 55, Failed: 0, Warn=
ings: 0
```

Here is the output of `v4l2-compliance -s` run on a Chameleon v3 for
/dev/video4 (attached subdevice):

```
v4l2-compliance 1.27.0-5204, 32 bits, 32-bit time_t
v4l2-compliance SHA: dd049328e528 2024-04-29 13:40:09

Compliance test for chv3-video device /dev/video4:

Driver Info:
	Driver name      : chv3-video
	Card type        : Chameleon v3 video
	Bus info         : platform:c0060600.video
	Driver version   : 6.9.0
	Capabilities     : 0x84200001
		Video Capture
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04200001
		Video Capture
		Streaming
		Extended Pix Format

Required ioctls:
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video4 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

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
	Standard Controls: 2 Private Controls: 0

Format ioctls (Input 0):
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
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
	test TIME32/64: OK

Test input 0:

Streaming ioctls:
	test read/write: OK (Not Supported)
	test blocking wait: OK
	test MMAP (no poll): OK
	test MMAP (select): OK
	test MMAP (epoll): OK
	test USERPTR (no poll): OK (Not Supported)
	test USERPTR (select): OK (Not Supported)
	test DMABUF: Cannot test, specify --expbuf-device

Total for chv3-video device /dev/video4: 55, Succeeded: 55, Failed: 0, Warn=
ings: 0
```

v3 changes:
  - Send v4l2-subdev API changes as a separate patchset
  - Drop chameleonv3/ directory
  - Change capture device name from "framebuffer" to "video interface"
  - Set sensible min and max dv timing caps
  - Set pixelclock to htotal * vtotal * 24Hz (we can't detect the actual va=
lue)
  - Remove enum_framesizes
  - Use v4l2_match_dv_timings()
  - Add V4L2_CID_DV_RX_POWER_PRESENT control
  - Use V4L2_DV_BT_CEA_1920X1080P60 as default timing
  - Use vb2_video_unregister_device()
  - Move subdev pad initialization to probe
  - Change subdev entity function to MEDIA_ENT_F_DV_DECODER
  - Drop dprx 'port' property and always use 'ports' instead
  - Remove legacy-format property and use multiple compats
  - Cleanup notifier only in non-fallback mode
  - Cleanup subdev entity using media_entity_cleanup()
  - Increase HPD pulse length to 500ms (see comment in dprx_set_edid())
  - Pull HPD low before updating EDID
  - Add a DisplayPort media bus type
  - Move receiver properties to port endpoint (data-lanes, link-frequencies=
)

v2 changes:
  - Add missing includes in dt binding examples
  - Add version number to intel,dprx compatible
  - Use generic node names in dts
  - Add and document IP configuration parameters
  - Remove IRQ registers from intel-dprx (they're not a part of the IP)
  - Remove no-endpoint property and check for "port" node instead

Pawe=C5=82 Anikiel (10):
  media: Add Chameleon v3 video interface driver
  drm/dp_mst: Move DRM-independent structures to separate header
  lib: Move DisplayPort CRC functions to common lib
  drm/display: Add mask definitions for DP_PAYLOAD_ALLOCATE_* registers
  media: dt-bindings: video-interfaces: Support DisplayPort MST
  media: v4l2-mediabus: Add support for DisplayPort media bus
  media: intel: Add Displayport RX IP driver
  media: dt-bindings: Add Chameleon v3 video interface
  media: dt-bindings: Add Intel Displayport RX IP
  ARM: dts: chameleonv3: Add video device nodes

 .../bindings/media/google,chv3-video.yaml     |   64 +
 .../devicetree/bindings/media/intel,dprx.yaml |  172 ++
 .../bindings/media/video-interfaces.yaml      |    7 +
 .../socfpga/socfpga_arria10_chameleonv3.dts   |  194 ++
 drivers/gpu/drm/display/Kconfig               |    1 +
 drivers/gpu/drm/display/drm_dp_mst_topology.c |   76 +-
 drivers/media/platform/Kconfig                |    1 +
 drivers/media/platform/Makefile               |    1 +
 drivers/media/platform/google/Kconfig         |   13 +
 drivers/media/platform/google/Makefile        |    3 +
 drivers/media/platform/google/chv3-video.c    |  891 +++++++
 drivers/media/platform/intel/Kconfig          |   12 +
 drivers/media/platform/intel/Makefile         |    1 +
 drivers/media/platform/intel/intel-dprx.c     | 2283 +++++++++++++++++
 drivers/media/v4l2-core/v4l2-fwnode.c         |   38 +
 include/drm/display/drm_dp.h                  |    9 +-
 include/drm/display/drm_dp_mst.h              |  238 ++
 include/drm/display/drm_dp_mst_helper.h       |  232 +-
 include/dt-bindings/media/video-interfaces.h  |    2 +
 include/linux/crc-dp.h                        |   10 +
 include/media/v4l2-fwnode.h                   |    5 +
 include/media/v4l2-mediabus.h                 |   17 +
 lib/Kconfig                                   |    8 +
 lib/Makefile                                  |    1 +
 lib/crc-dp.c                                  |   78 +
 25 files changed, 4053 insertions(+), 304 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/google,chv3-vid=
eo.yaml
 create mode 100644 Documentation/devicetree/bindings/media/intel,dprx.yaml
 create mode 100644 drivers/media/platform/google/Kconfig
 create mode 100644 drivers/media/platform/google/Makefile
 create mode 100644 drivers/media/platform/google/chv3-video.c
 create mode 100644 drivers/media/platform/intel/intel-dprx.c
 create mode 100644 include/drm/display/drm_dp_mst.h
 create mode 100644 include/linux/crc-dp.h
 create mode 100644 lib/crc-dp.c

--=20
2.45.0.rc1.225.g2a3ae87e7f-goog


