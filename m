Return-Path: <linux-media+bounces-52681-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IL5LISKzjmmvDwEAu9opvQ
	(envelope-from <linux-media+bounces-52681-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 06:14:10 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 13327132F4A
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 06:14:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 705C030B67B3
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 05:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36D162749DC;
	Fri, 13 Feb 2026 05:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e7uQYuz0"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CEBB1A9F94;
	Fri, 13 Feb 2026 05:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770959588; cv=none; b=IkOtFz0p1/QDS9/4n7tw0yuewi50bM/gUa5aNgfHFkhmnJ1gFFMkg9ejNHi7QDgBFBF39K5ZrIdiWgEdK/d0m+xa+4snleimUnmocaaj6QCwwuIp0nve0hsH1Vd3WcN/ibZpxp5GYyqaIdprGlPkTPaBFspKe8rQsS9uhyiHf0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770959588; c=relaxed/simple;
	bh=QtyheCxmOuvGDsN1Pbkcqo4Apx5Uh7t3JM+lW/T1IKA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=o+TbCs+MytcnwwvN9qYaR92kEV3+236rL3J/Wyi2BSC0gRxNlASZc5Mq4sa4QQbzXn0bnMDpffAQSOouTxuprYgISRZmFLk8en6QOtUFTqqN+rS7n5hCjCKRnfe7F6WfKSSoIbsAcrlwuXUPBpdElFpzbnaJ6sSPanMWGFmo3JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e7uQYuz0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id F1D32C116C6;
	Fri, 13 Feb 2026 05:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770959588;
	bh=QtyheCxmOuvGDsN1Pbkcqo4Apx5Uh7t3JM+lW/T1IKA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=e7uQYuz0UriYBGOlJ7hCwhD++ovZ8+s1nKtD+Eg22pASMQjrDRpX6wxFHrXKrlT2b
	 WBN2XNKop9gma/YZ8ZEugTIBGROiJ5ev/CF4re3YWvtOa2iLqdT8Quby20JrzI8apu
	 MLOGDR572HHzzxcaO5FPZ3XURdAX7o/egTYfSixyb0UHTw1NyPCincVi7p+PdYtNtY
	 AY/Cm2dirqZm6GscmelnIj8qaKiu4t394hus4yoqwnTlKuVlvgWptM43SjD3JSz/9z
	 SbyILhFavM3CLzR5ZPXqY46CYmd5cGHptNdjeBScZ1Ap+VXJ5ftFzu9rRZUgeHVNXU
	 XQ1WD5jGyRA6A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D05A4EF48C8;
	Fri, 13 Feb 2026 05:13:07 +0000 (UTC)
From: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Subject: [PATCH RFC v4 0/4] Add Amlogic stateless H.264 video decoder for
 S4
Date: Fri, 13 Feb 2026 13:12:37 +0800
Message-Id: <20260213-b4-s4-vdec-upstream-v4-0-c7112d00d662@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMWyjmkC/33NSwoCMRAE0KsMWRtJJ21GXQmCB3ArLvJpNeB8S
 DQoMnc3DIiI4rK66FcPligGSmxZPVikHFLo2hJwUjF3Mu2RePAlMynkDISsuUWekGdPjl/7dIl
 kGi60UA4MujkaVj77SIdwG9Ud227WbF+Op5AuXbyPSxnG6i+agQuupUABc1B25lemOXfH4Kaua
 0Yxy7cCEn8rsijWW+tIHQCM/lbUS9ECJPxWVFEQF9qQU75e0KcyDMMTe0dtnEkBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770959584; l=12260;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=QtyheCxmOuvGDsN1Pbkcqo4Apx5Uh7t3JM+lW/T1IKA=;
 b=DmDzqn6d/fCbHodpHyDSk7lgqrlZ6n9HfRBXULoacWuMcC2SNaRXzuTomuMwb5wQhGBCmw2ry
 /EnnrJTmr6DBjqCV8mqcfNF4bptKydt6Y2L1GPHRzDxgvQo2kaYMuT+
X-Developer-Key: i=zhentao.guo@amlogic.com; a=ed25519;
 pk=5yfDKrjreXwcAoEUsdtWafy6YN500upXp/CgtnXjLVU=
X-Endpoint-Received: by B4 Relay for zhentao.guo@amlogic.com/20251024 with
 auth_id=555
X-Original-From: Zhentao Guo <zhentao.guo@amlogic.com>
Reply-To: zhentao.guo@amlogic.com
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52681-lists,linux-media=lfdr.de,zhentao.guo.amlogic.com];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,baylibre.com,googlemail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[zhentao.guo@amlogic.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 13327132F4A
X-Rspamd-Action: no action

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

Retry the compliance test based on kernel 6.19:
v4l2-compliance 1.30.1, 64 bits, 64-bit time_t

Compliance test for aml-vdec-drv device /dev/video0:

Driver Info:
        Driver name      : aml-vdec-drv
        Card type        : platform:aml-vdec-drv
        Bus info         : platform:fe320000.video-codec
        Driver version   : 6.19.0
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
        Media version    : 6.19.0
        Hardware revision: 0x00000000 (0)
        Driver version   : 6.19.0
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

Total for aml-vdec-drv device /dev/video0: 49, Succeeded: 49, Failed: 0, Warnings: 0

Fluster test result of JVT-AVC_V1.
Result:
Ran 77/135 tests successfully

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

One remain failure is CVFC1_Sony_C, which contains crop information. The md5sum of every decoded YUV indicates that original output from the decoder was correct. The YUV was cropped by gstreamer. The correct cropping method for this bitstream should be to crop 30*2 rows of pixels from both the top and bottom of the image, and 13*2 columns of pixels from both the left and right sides.However, gstreamer cropped 13*4 columns of pixels from the right side and 30*4 rows of pixels from the bottom. We are trying to find out the cause of this. Other failuers mentioned in V1 and V2 were resolved.

Changes in v4:
- Use %pad to print dma_addr_t type instead of using %llx.
- Add initial values to some local variables.
- Link to v3: https://lore.kernel.org/r/20260121-b4-s4-vdec-upstream-v3-0-4496aec3d79e@amlogic.com

Changes in v3:
- Fixed the DT check error:
  arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: video-codec@fe320000 (amlogic,s4-vcodec-dec): 'amlogic,canvas' does not match any of the regexes: '^pinctrl-[0-9]+$' 
  from schema $id: http://devicetree.org/schemas/media/amlogic,vcodec-dec.yaml
- Added DOS reset lines to dtsi and dt-binding.
- Fixed the issue where some B-frames were not decoded correctly(The fluster failures mentioned in patch V1 and V2 were mostly caused by this).
- Fixed the issue where canvas_index leaks occurred during the decoding of some bitstreams.
- Rework the src/dst format storage. Use v4l2_pix_format_mplane to store formats that related to bitstreams into the context. Add the reset format function to reset all the formats to default value. 
- Store decoding parameters related to chip platforms, such as maximum width/height and alignment requirement, organized by chip platform.
- Link to v2: https://lore.kernel.org/r/20251124-b4-s4-vdec-upstream-v2-0-bdbbce3f11a6@amlogic.com

Changes in v2:
- Fixed incorrect generation of the reference lists for some B-frames.
- Rename or get rid of some properties in DTS and dt-binding.
- Remove some useless code or helper functions, (eg. clk helper functions, reg I/O macros, and some superfluous print messages) replace these functions with existing ones.
- Replace all the printk messages with dev_err/dev_info/dev_dbg
- Use the helper functions from the existing meson-canvas driver.
- Use clk_bulk_data to map clocks from DTS.
- Retry the V4L2 Compliance test on 6.18-rc6, fix a newly introduced bug.
- Link to v1: https://lore.kernel.org/r/20251027-b4-s4-vdec-upstream-v1-0-620401813b5d@amlogic.com

To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-amlogic@lists.infradead.org

Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
---
Zhentao Guo (4):
      media: dt-bindings: Add Amlogic V4L2 video decoder
      decoder: Add V4L2 stateless H.264 decoder driver
      arm64: dts: amlogic: Add video decoder driver support for S4 SOCs
      arm64: defconfig: Enable VDEC driver for Amlogic SoCs

 .../bindings/media/amlogic,s4-vcodec-dec.yaml      |   96 +
 MAINTAINERS                                        |    7 +
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi          |   28 +
 arch/arm64/configs/defconfig                       |    1 +
 drivers/media/platform/amlogic/Kconfig             |    1 +
 drivers/media/platform/amlogic/Makefile            |    1 +
 drivers/media/platform/amlogic/vdec/Kconfig        |   16 +
 drivers/media/platform/amlogic/vdec/Makefile       |    4 +
 drivers/media/platform/amlogic/vdec/TODO           |    7 +
 drivers/media/platform/amlogic/vdec/aml_vdec.c     |  734 +++++++
 drivers/media/platform/amlogic/vdec/aml_vdec.h     |   33 +
 drivers/media/platform/amlogic/vdec/aml_vdec_drv.c |  239 +++
 drivers/media/platform/amlogic/vdec/aml_vdec_drv.h |  172 ++
 drivers/media/platform/amlogic/vdec/aml_vdec_hw.c  |  596 ++++++
 drivers/media/platform/amlogic/vdec/aml_vdec_hw.h  |  158 ++
 .../platform/amlogic/vdec/aml_vdec_platform.c      |   85 +
 .../platform/amlogic/vdec/aml_vdec_platform.h      |   50 +
 drivers/media/platform/amlogic/vdec/h264.c         | 2129 ++++++++++++++++++++
 drivers/media/platform/amlogic/vdec/h264.h         |  299 +++
 drivers/media/platform/amlogic/vdec/reg_defines.h  |  177 ++
 20 files changed, 4833 insertions(+)
---
base-commit: 9845cf73f7db6094c0d8419d6adb848028f4a921
change-id: 20251027-b4-s4-vdec-upstream-0603c1a4c84a

Best regards,
-- 
Zhentao Guo <zhentao.guo@amlogic.com>



