Return-Path: <linux-media+bounces-13609-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AE590DCC1
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 21:47:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BDC92854A3
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 19:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1344916E88E;
	Tue, 18 Jun 2024 19:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="nocVBP05"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C93B16D4E7
	for <linux-media@vger.kernel.org>; Tue, 18 Jun 2024 19:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718740042; cv=none; b=hL7yX2983ah7ihz3Fq1rJ4DNhka/2DuPAH3KNvtN5xM1ygbnclR6HHJxbViCwzzCQbOJr7RAtL95217ZoNsUGgEKN6MQCipPu2hnnznjqKRJ4xp656IPeyavVdvU/eGhB33SlbbUxArP3dO2CFCKQg093dgHrt9Q5huc8o1qksc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718740042; c=relaxed/simple;
	bh=bIXxso8A/hZp4Oq1/DAIOgmiMrZchGG3V5DivXV6cWs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bPKT31/X1foyMDjaCuJvAR1MLkGDjwSfobQ6WfWnv+94UA0BRL7hLdivauaBuHZHiStXK4ZpLGbhgmVsEKzPjTCHhym0rABCViuHWaCVik8WaMLqxzKjbehZRbGPUFjoCAtTj4S3Rmtg17XjLHkM3ieLo7m80cxCcttnC+y7324=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=nocVBP05; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From; q=dns/txt; s=fe-e1b5cab7be; t=1718740014;
 bh=YAAXxga0MG8jXLgcQK8Lgyj9QF0HIlvekYbBctGFp48=;
 b=nocVBP05S7asK6pRnqkn8o8qM9RmMVgLV2cYvseKoWnDZPwn9xd6hXZwMn4yW8jyHBAr03RID
 pizX3Xww2fY2Ef10PPtIYduUmKcy8Azw4wW4YsiV2d+P8X8D0G4heOkqQG8MMxW1ftQ68oKH4nD
 W/g2cqcu4JrM71OTvb/ZKoKDwLvMABjbEy2cOcD5RJlkxFqlR37MhI8ryHT/4QhuZZgePX8Y4fG
 +b/ORwWh1U0s9sFZK640nW8K8TSdy1fCt8fc+b6qEza7dna/9Kqhc0iPzCIQIsAQIjvn9d+liYi
 42PDruYCIyCLSxEpd716wTVEHOUhmIvmXGebKaoFRIbQ==
From: Jonas Karlman <jonas@kwiboo.se>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Alex Bee <knaerzche@gmail.com>, Nicolas Dufresne
 <nicolas.dufresne@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Sebastian Fricke
 <sebastian.fricke@collabora.com>, Christopher Obbard
 <chris.obbard@collabora.com>, Detlev Casanova
 <detlev.casanova@collabora.com>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v5 00/10] media: rkvdec: Add H.264 High 10 and 4:2:2 profile support
Date: Tue, 18 Jun 2024 19:46:24 +0000
Message-ID: <20240618194647.742037-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-ForwardEmail-ID: 6671e42d64ade33c90059f61

This is a re-revival of an old series [1] now that NV15/NV20/NV30 support
for display driver have landed in linux v6.7.

This series adds H.264 High 10 and 4:2:2 profile support to the Rockchip
Video Decoder driver.

Patch 1 adds helpers for calculating plane bytesperline and sizeimage.
Patch 2 adds two new pixelformats for semi-planer 10-bit 4:2:0/4:2:2 YUV.

Patch 3 change to use bytesperline and buffer height to configure strides.
Patch 4 change to use values from SPS/PPS control to configure the HW.

Patch 5-9 refactor code to support filtering of CAPUTRE formats based
on the image format returned from a get_image_fmt ops.

Patch 10 adds final bits to support H.264 High 10 and 4:2:2 profiles.

Tested on a ROCK Pi 4 (RK3399) and Rock64 (RK3328):

  v4l2-compliance 1.26.1, 64 bits, 64-bit time_t
  ...
  Total for rkvdec device /dev/video3: 47, Succeeded: 47, Failed: 0, Warnings: 0

  Running test suite JVT-FR-EXT with decoder FFmpeg-H.264-V4L2-request
  ...
  Ran 65/69 tests successfully

  Running test suite JVT-AVC_V1 with decoder FFmpeg-H.264-V4L2-request
  ...
  Ran 129/135 tests successfully

Before this series:

  Running test suite JVT-FR-EXT with decoder FFmpeg-H.264-V4L2-request
  ...
  Ran 44/69 tests successfully

Changes in v5:
- Drop Remove SPS validation at streaming start patch
- Move buffer align from rkvdec_fill_decoded_pixfmt to min/step_width
- Use correct profiles for V4L2_CID_MPEG_VIDEO_H264_PROFILE
- Collect r-b and t-b tags
- Fluster test score same as v4, see [4] and [5]
Link to v4: https://lore.kernel.org/linux-media/20231105165521.3592037-1-jonas@kwiboo.se/

Changes in v4:
- Fix failed v4l2-compliance tests related to CAPTURE queue
- Rework CAPTURE format filter anv validate to use an image format
- Run fluster test suite JVT-FR-EXT [4] and JVT-AVC_V1 [5]
Link to v3: https://lore.kernel.org/linux-media/20231029183427.1781554-1-jonas@kwiboo.se/

Changes in v3:
- Drop merged patches
- Use bpp and bpp_div instead of prior misuse of block_w/block_h
- New patch to use values from SPS/PPS control to configure the HW
- New patch to remove an unnecessary call to validate sps at streaming start
- Reworked pixel format validation
Link to v2: https://lore.kernel.org/linux-media/20200706215430.22859-1-jonas@kwiboo.se/

Changes in v2:
- Collect r-b tags
- SPS pic width and height in mbs validation moved to rkvdec_try_ctrl
- New patch to not override output buffer sizeimage
- Reworked pixel format validation
- Only align decoded buffer instead of changing frmsize step_width
Link to v1: https://lore.kernel.org/linux-media/20200701215616.30874-1-jonas@kwiboo.se/

To fully runtime test this series you may need ffmpeg patches from [2],
this series is also available at [3].

[1] https://lore.kernel.org/linux-media/20200706215430.22859-1-jonas@kwiboo.se/
[2] https://github.com/Kwiboo/FFmpeg/commits/v4l2-request-n6.1-dev/
[3] https://github.com/Kwiboo/linux-rockchip/commits/linuxtv-rkvdec-high-10-v5/
[4] https://gist.github.com/Kwiboo/f4ac15576b2c72887ae2bc5d58b5c865
[5] https://gist.github.com/Kwiboo/459a1c8f1dcb56e45dc7a7a29cc28adf

Regards,
Jonas

Alex Bee (1):
  media: rkvdec: h264: Don't hardcode SPS/PPS parameters

Jonas Karlman (9):
  media: v4l2-common: Add helpers to calculate bytesperline and
    sizeimage
  media: v4l2: Add NV15 and NV20 pixel formats
  media: rkvdec: h264: Use bytesperline and buffer height as virstride
  media: rkvdec: Extract rkvdec_fill_decoded_pixfmt into helper
  media: rkvdec: Move rkvdec_reset_decoded_fmt helper
  media: rkvdec: Extract decoded format enumeration into helper
  media: rkvdec: Add image format concept
  media: rkvdec: Add get_image_fmt ops
  media: rkvdec: h264: Support High 10 and 4:2:2 profiles

 .../media/v4l/pixfmt-yuv-planar.rst           | 128 ++++++++++
 drivers/media/v4l2-core/v4l2-common.c         |  80 ++++---
 drivers/media/v4l2-core/v4l2-ioctl.c          |   2 +
 drivers/staging/media/rkvdec/rkvdec-h264.c    |  64 +++--
 drivers/staging/media/rkvdec/rkvdec.c         | 226 +++++++++++++-----
 drivers/staging/media/rkvdec/rkvdec.h         |  18 +-
 include/uapi/linux/videodev2.h                |   2 +
 7 files changed, 399 insertions(+), 121 deletions(-)

-- 
2.45.2


