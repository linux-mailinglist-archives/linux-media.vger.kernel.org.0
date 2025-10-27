Return-Path: <linux-media+bounces-45622-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E96C0BD8B
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 06:44:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9563B3BBB94
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 05:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B87FA2D73B1;
	Mon, 27 Oct 2025 05:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qqfsh6Aj"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F229A2D5C74;
	Mon, 27 Oct 2025 05:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761543766; cv=none; b=BMX4bbZxTO2uoOVtxxnZ5WnETGAA+CnKdU8TCBy2T45Ar9zmbYLQuZU0VBQQQm8qQpoVWcJEEg2P4I7FY0A4WMhvZFdmficdfkpNNjcs8D7dja1/fRoCptPnw+l1+k77wlz15O8HAdLOeB5imie5TbkWQPPwH4izS8ifYrUkH14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761543766; c=relaxed/simple;
	bh=q3eRsknbzjnF1yNPt8K3nq4H7MwVuIqmjT6LDXe3dNg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=i0Q4GAvmTdmFGmmbAa24vs6uRtG2z6m/QQae3/zOW+WMjSugCHie4rBPQfXylPNtYclHk/sp5EJK9+2O31q4+dQpabI9TlSh1gzqPVEbePgR8bkXsC+otBwUncpNuXY8KX/iBpUIwNZ3G2A/WLJHrszbx0ZrfXzSKSE6wpH9lWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qqfsh6Aj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 913DCC4CEF1;
	Mon, 27 Oct 2025 05:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761543765;
	bh=q3eRsknbzjnF1yNPt8K3nq4H7MwVuIqmjT6LDXe3dNg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Qqfsh6AjA3+aO0gqNNLMd/ojVQvtbKlqO4JRkW/9H4D2F1P/3pxp45NySMeN7Ql0A
	 rx2QFuTFUs4xKoFncSaBZ0f4BV8AAQKgOXWKsx9lSg6XcFR7PdJxaEUTzSZ4tjK6Ua
	 +jiB1Z48DWRll93laA2ICK6Dt0t1wT6uoXK4XuygCd/3hLeDTf0qBQ88jlhZ+Gj4cf
	 lE6rfQH9WwdnbEFSAX+dCvUUFr4Dv6SATlg5sI+pTd48F+pL3w8MrkhAzi/3qagICw
	 TsIi5oR7K5dHjnSmxd4YGkDaLwTEAcHb476OC+Uoy/IOUOPYvTjlczAtJ/IVoet5Dm
	 p7Rh4Ps6UeW0w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C6D3CCD1A5;
	Mon, 27 Oct 2025 05:42:45 +0000 (UTC)
From: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Subject: [PATCH 0/3] Add Amlogic stateless H.264 video decoder for S4
Date: Mon, 27 Oct 2025 13:42:36 +0800
Message-Id: <20251027-b4-s4-vdec-upstream-v1-0-620401813b5d@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE0G/2gC/x3MSQqAMAxA0atI1gbaWge8irioNWoWDjRaBPHuF
 pdv8f8DQoFJoM0eCBRZeN8SdJ6BX9w2E/KYDEaZUitT42BRLMaRPF6HnIHciqpShdfO+sY6SOU
 RaOL7v3b9+36aHPTfZQAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761543762; l=7400;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=q3eRsknbzjnF1yNPt8K3nq4H7MwVuIqmjT6LDXe3dNg=;
 b=wsZz1zCNtql+4Jfi+Ir97IGwibG5/JIZzB4xm3oujy+6Jp9R+TdHJOjW/a0aBYpd4jFEnOPxO
 qaUB5yT45emA9VHcHXhkEAPvyy+PzKBQJcWd9+AEYypBBRWBGEaLtNv
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

The driver passes v4l2 compliance test, test reports :
v4l2-compliance 1.30.1, 64 bits, 64-bit time_t

Compliance test for aml-vdec-drv device /dev/video0:

Driver Info:
        Driver name      : aml-vdec-drv
        Card type        : platform:aml-vdec-drv
        Bus info         : platform:fe320000.video-codec
        Driver version   : 6.16.0
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
        Media version    : 6.16.0
        Hardware revision: 0x00000000 (0)
        Driver version   : 6.16.0
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

Some Fluster test cases are still failing. We will publish the final results
once all these Fluster test failures have been resolved.

Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
---
Zhentao Guo (3):
      dt-bindings: vdec: Add binding document of Amlogic decoder accelerator
      dts: decoder: Support V4L2 stateless decoder dt node for S4
      decoder: Add V4L2 stateless H.264 decoder driver

 .../bindings/media/amlogic,vcodec-dec.yaml         |   96 ++
 MAINTAINERS                                        |    7 +
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi          |   24 +
 drivers/media/platform/amlogic/Kconfig             |    2 +
 drivers/media/platform/amlogic/Makefile            |    1 +
 drivers/media/platform/amlogic/vdec/Kconfig        |   15 +
 drivers/media/platform/amlogic/vdec/Makefile       |    4 +
 drivers/media/platform/amlogic/vdec/aml_vdec.c     |  759 +++++++++
 drivers/media/platform/amlogic/vdec/aml_vdec.h     |   31 +
 .../platform/amlogic/vdec/aml_vdec_canvas_utils.c  |  154 ++
 .../platform/amlogic/vdec/aml_vdec_canvas_utils.h  |   22 +
 drivers/media/platform/amlogic/vdec/aml_vdec_drv.c |  263 +++
 drivers/media/platform/amlogic/vdec/aml_vdec_drv.h |  194 +++
 drivers/media/platform/amlogic/vdec/aml_vdec_hw.c  |  652 +++++++
 drivers/media/platform/amlogic/vdec/aml_vdec_hw.h  |  182 ++
 .../platform/amlogic/vdec/aml_vdec_platform.c      |   37 +
 .../platform/amlogic/vdec/aml_vdec_platform.h      |   62 +
 drivers/media/platform/amlogic/vdec/h264.c         | 1790 ++++++++++++++++++++
 drivers/media/platform/amlogic/vdec/h264.h         |  300 ++++
 drivers/media/platform/amlogic/vdec/reg_defines.h  |  175 ++
 20 files changed, 4770 insertions(+)
---
base-commit: 72fb0170ef1f45addf726319c52a0562b6913707
change-id: 20251027-b4-s4-vdec-upstream-0603c1a4c84a

Best regards,
-- 
Zhentao Guo <zhentao.guo@amlogic.com>



