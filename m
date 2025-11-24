Return-Path: <linux-media+bounces-47640-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 454A7C7EE45
	for <lists+linux-media@lfdr.de>; Mon, 24 Nov 2025 04:32:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AEB233A5345
	for <lists+linux-media@lfdr.de>; Mon, 24 Nov 2025 03:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96B3B29BDAE;
	Mon, 24 Nov 2025 03:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TtAeh1Vq"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4D925C80E;
	Mon, 24 Nov 2025 03:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763955155; cv=none; b=sY0a624bBz7T68u3DjSOs9BBTNF0g3n+mSZi9lGW5bKJNfH9bFFioCp8sjhoQhiPDLIsBuDDAAdd9d9anoHITmJLhfHT9bv7wREG3o0mtwW11D8eZaefxShiGz5N7b19cwH1dgZDg9umLT8EB9hvHZjrTObhn+Li5ek54U3Gm7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763955155; c=relaxed/simple;
	bh=Rma4wPqX3YrBdvw49dMz8PSp/KasV1B7VvOywDgOwIk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Shodfg1pvayfd7ztRx+rYZfMWSteXiE9nivTlWLlffqMgVHAZTYHa8f+l/y6DyarKla5oiOb3ePHolJfF8dWblaz/XaonaKfvux96cnLFRC8miKU9XlB7Fum9ugvJsnRCO+T41E/Li0ACOk92/kedPJzjJqIL9O2NzIOAfVU2hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TtAeh1Vq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4FC1FC4CEF1;
	Mon, 24 Nov 2025 03:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763955154;
	bh=Rma4wPqX3YrBdvw49dMz8PSp/KasV1B7VvOywDgOwIk=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=TtAeh1VqibU1tllGZwnvEKRX8AlfTX1Lcd5oOnseMQwXqrn7rpAjgE5uzFqHFlee6
	 AtFBji4ARxH6Pauv5QZCf9qiT2Zq9fxPlqlkrotczOsr2RAMaksJPBcaWPJrfD68v0
	 b70h4SmbPETwpdfDst6/Fg4i7N2N70UWz894PYNRxleJxNGnhUmY7qOFtAGoYlYZLF
	 GGiSCno5JesM7LXCdWEJix5MZd92dKSa6ba6G7TlbK8C4+h1ISAnlFsZUfBgLttJjl
	 7wIXx2QfLxEYsbYHm+sr/GFOWyClXwfkRvBWCl1DGIa/jjgSDVknYFUZmHc7Pm305s
	 qJJSCbOAH/tyw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DA12CFD2F6;
	Mon, 24 Nov 2025 03:32:34 +0000 (UTC)
From: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Subject: [PATCH RFC v2 0/3] Add Amlogic stateless H.264 video decoder for
 S4
Date: Mon, 24 Nov 2025 11:32:16 +0800
Message-Id: <20251124-b4-s4-vdec-upstream-v2-0-bdbbce3f11a6@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMDRI2kC/32NQQ6CMBBFr0Jm7Zi2FCSuTEw8gFvDopQRJrGUt
 NhoCHe34QAu3//5768QKTBFOBcrBEoc2U8Z1KEAO5ppIOQ+MyihKinUCTuNUWPqyeJ7jksg41D
 UorTSaNtoA3k5B3ryZ7c+4H67QpvDkePiw3d/SnKv/kqTRIG1ElrIRpZd1V+Me/mB7dF6B+22b
 T8gusGIvQAAAA==
X-Change-ID: 20251027-b4-s4-vdec-upstream-0603c1a4c84a
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Zhentao Guo <zhentao.guo@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763955152; l=9747;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=Rma4wPqX3YrBdvw49dMz8PSp/KasV1B7VvOywDgOwIk=;
 b=7eiK9AbvnyV9gXLFTpZcAQD4I6wCyibBGhpwhcPp+8k4dMnWbwIHzswp1igFxQQmyeG9NSIv9
 QfpXMUYCY7nBgLow2EsRMwYYDtrmC+VYlZSEyDAZxVsX9DPvTjREHqI
X-Developer-Key: i=zhentao.guo@amlogic.com; a=ed25519;
 pk=5yfDKrjreXwcAoEUsdtWafy6YN500upXp/CgtnXjLVU=
X-Endpoint-Received: by B4 Relay for zhentao.guo@amlogic.com/20251024 with
 auth_id=555
X-Original-From: Zhentao Guo <zhentao.guo@amlogic.com>
Reply-To: zhentao.guo@amlogic.com

Introduce initial driver support for Amlogic's new video acceleration
hardware architecture, designed for video stream decoding.

Compared to the current Amlogic video decoder hardware architecture,
this new implementation eliminates the Esparser hardware component,
enabling direct vb2 buffer input. The driver is designed to support
the V4L2 M2M stateless decoder API. The initial phase includes support
for H.264 decoding on Amlogic S805X2 platform.

The driver is capable of:
- Supporting stateless H.264 decoding up to a resolution 1920x1088(on the S805X2 platform).
- Supporting I/P/B frame handling.
- Supporting vb2 mmap and dma-buf modes.
- Supporting frame-based decode mode. (Note that some H.264 bitstreams require
  DPB reordering to generate reference lists, the stateless decoder driver
  cannot access reordered reference lists in this mode, requiring the driver
  to perform reference list reordering itself)
- Supporting NV12/NV21 output.
- Supporting Annex B start codes.

This driver is tested with Gstreamer.
Example:
gst-launch-1.0 filesrc location=/tmp/video_640x360_mp4_hevc_450kbps_no_b.mp4 !
parsebin ! v4l2slh264dec ! filesink location=/tmp/output.yuv

Retry the compliance test based on kernel 6.18-rc6:
v4l2-compliance 1.30.1, 64 bits, 64-bit time_t

Compliance test for aml-vdec-drv device /dev/video0:

Driver Info:
        Driver name      : aml-vdec-drv
        Card type        : platform:aml-vdec-drv
        Bus info         : platform:fe320000.video-codec
        Driver version   : 6.18.0
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
        Detected Stateless Decoder
Media Driver Info:
        Driver name      : aml-vdec-drv
        Model            : aml-vdec-drv
        Serial           :
        Bus info         : platform:fe320000.video-codec
        Media version    : 6.18.0
        Hardware revision: 0x00000000 (0)
        Driver version   : 6.18.0
Interface Info:
        ID               : 0x0300000c
        Type             : V4L Video
Entity Info:
        ID               : 0x00000001 (1)
        Name             : aml_dev_drv-source
        Function         : V4L2 I/O
        Pad 0x01000002   : 0: Source
          Link 0x02000008: to remote pad 0x1000004 of entity 'aml_dev_drv-proc' (Video Decoder): Data, Enabled, Immutable

Required ioctls:
        test MC information (see 'Media Driver Info' above): OK
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
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 6 Private Controls: 0
        Standard Compound Controls: 4 Private Compound Controls: 0

Format ioctls:
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

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK
        test blocking wait: OK

Fluster test result of JVT-AVC_V1.
Result:
Ran 61/135 tests successfully

- 52 test vectors failed due to interlaced or mbaff clips: The Amlogic stateless
  decoder driver only support bitstreams with frame_mbs_only_flags == 1.
  Test Vectors:
        cabac_mot_fld0_full
        cabac_mot_mbaff0_full
        cabac_mot_picaff0_full
        CABREF3_Sand_D
        CAFI1_SVA_C
        CAMA1_Sony_C
        CAMA1_TOSHIBA_B
        cama1_vtc_c
        cama2_vtc_b
        CAMA3_Sand_E
        cama3_vtc_b
        CAMACI3_Sony_C
        CAMANL1_TOSHIBA_B
        CAMANL2_TOSHIBA_B
        CAMANL3_Sand_E
        CAMASL3_Sony_B
        CAMP_MOT_MBAFF_L30
        CAMP_MOT_MBAFF_L31
        CANLMA2_Sony_C
        CANLMA3_Sony_C
        CAPA1_TOSHIBA_B
        CAPAMA3_Sand_F
        cavlc_mot_fld0_full_B
        cavlc_mot_mbaff0_full_B
        cavlc_mot_picaff0_full_B
        CVCANLMA2_Sony_C
        CVFI1_Sony_D
        CVFI1_SVA_C
        CVFI2_Sony_H
        CVFI2_SVA_C
        CVMA1_Sony_D
        CVMA1_TOSHIBA_B
        CVMANL1_TOSHIBA_B
        CVMANL2_TOSHIBA_B
        CVMAPAQP3_Sony_E
        CVMAQP2_Sony_G
        CVMAQP3_Sony_D
        CVMP_MOT_FLD_L30_B
        CVNLFI1_Sony_C
        CVNLFI2_Sony_H
        CVPA1_TOSHIBA_B
        FI1_Sony_E
        MR6_BT_B
        MR7_BT_B
        MR8_BT_B
        MR9_BT_B
        Sharp_MP_Field_1_B
        Sharp_MP_Field_2_B
        Sharp_MP_Field_3_B
        Sharp_MP_PAFF_1r2
        Sharp_MP_PAFF_2r
        CVMP_MOT_FRM_L31_B
- 3 test vectors failed due to unsupported bitstream.
  num_slice_group_minus1 greater than zero is not supported by the
  hardware.
  Test Vectors:
        FM1_BT_B
        FM1_FT_E
        FM2_SVA_C
- 2 test vectors failed because SP_SLICE type is not supported by the
  hardware.
  Test Vectors:
        SP1_BT_A
        sp2_bt_b

We are working with the remain failures, these failures have the same root cause. 

Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
---
Changes in v2:
- Fixed incorrect generation of the reference lists for some B-frames.
- Rename or get rid of some properties in DTS and dt-binding.
- Remove some useless code or helper functions, (eg. clk helper functions, reg I/O macros, and some superfluous print messages) replace these functions with existing ones.
- Replace all the printk messages with dev_err/dev_info/dev_dbg
- Use the helper functions from the existing meson-canvas driver.
- Use clk_bulk_data to map clocks from DTS.
- Retry the V4L2 Compliance test on 6.18-rc6, fix a newly introduced bug.
- Link to v1: https://lore.kernel.org/r/20251027-b4-s4-vdec-upstream-v1-0-620401813b5d@amlogic.com

---
Zhentao Guo (3):
      media: dt-bindings: Add Amlogic V4L2 video decoder
      decoder: Add V4L2 stateless H.264 decoder driver
      arm64: dts: amlogic: Add video decoder driver support for S4 SOCs

 .../bindings/media/amlogic,s4-vcodec-dec.yaml      |   87 +
 MAINTAINERS                                        |    7 +
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi          |   27 +
 drivers/media/platform/amlogic/Kconfig             |    1 +
 drivers/media/platform/amlogic/Makefile            |    1 +
 drivers/media/platform/amlogic/vdec/Kconfig        |   16 +
 drivers/media/platform/amlogic/vdec/Makefile       |    4 +
 drivers/media/platform/amlogic/vdec/TODO           |    7 +
 drivers/media/platform/amlogic/vdec/aml_vdec.c     |  756 ++++++++
 drivers/media/platform/amlogic/vdec/aml_vdec.h     |   31 +
 drivers/media/platform/amlogic/vdec/aml_vdec_drv.c |  239 +++
 drivers/media/platform/amlogic/vdec/aml_vdec_drv.h |  196 ++
 drivers/media/platform/amlogic/vdec/aml_vdec_hw.c  |  596 ++++++
 drivers/media/platform/amlogic/vdec/aml_vdec_hw.h  |  158 ++
 .../platform/amlogic/vdec/aml_vdec_platform.c      |   37 +
 .../platform/amlogic/vdec/aml_vdec_platform.h      |   62 +
 drivers/media/platform/amlogic/vdec/h264.c         | 1933 ++++++++++++++++++++
 drivers/media/platform/amlogic/vdec/h264.h         |  300 +++
 drivers/media/platform/amlogic/vdec/reg_defines.h  |  177 ++
 19 files changed, 4635 insertions(+)
---
base-commit: 0c1c7a6a83feaf2cf182c52983ffe330ffb50280
change-id: 20251027-b4-s4-vdec-upstream-0603c1a4c84a

Best regards,
-- 
Zhentao Guo <zhentao.guo@amlogic.com>



