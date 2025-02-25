Return-Path: <linux-media+bounces-26916-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C50A439EE
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 10:42:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 826463BA0C1
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 09:41:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED83F263C77;
	Tue, 25 Feb 2025 09:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="HkPBfRBn"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E68F262D25;
	Tue, 25 Feb 2025 09:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740476464; cv=pass; b=MhUUZZp7bQ0iGQzaM2bObYT29SRloW/4abUDeme/8iMFaz/eLAcBre2sY7kTY1wtM0HsjyLHVGjwPT0XpX/G2U1q3Mu7RRQhEhQYzPyTxXbSgDv2WDCn8bJmzvhhNEqY0ytqqxQGPa4HrSpempdFWx16xlLjnnx2QeiUj/tLfQw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740476464; c=relaxed/simple;
	bh=Ums4+YJ6/mdB6OJJs/VVAlfEGxXlqH5U5JaUczjzwVo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=R9QXckVeS+kK5D5KdCyMp6k7L7T8J17rc2PAIJkqMd1nHnZyi3jTTffHjXkTKTceKRRuAiKljEoRJIvI9KPQiZYVXpMwcV1I3eWUd8DaG+ysx3Koh9pfrl44zV7Du/9QfF/acWn838xHKuVV7Ft12gT+PhQephmrNckgez43OUY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=HkPBfRBn; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1740476438; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nhN3Rt+pUbXhrV5nTGDXRMtP2Ar3cg1wHU3cPNr1J4ofqZZXDo9z2s/WvKBjqzwJVvW3u12Zno2mh9bXoh19QFXjnneu9h3divVcwLOEc5lchxdikJKkAmoDPjhqVTYN6DN5fqI1u/OuvAp1F3S2uq8syRRdd+MCCuKu4CCgmwA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1740476438; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=6KHN1scQcppw8pT0cPhUgdCDwEZk4zFF85SfonaTG9o=; 
	b=Ko7lqHOuIqf7mRVBVVTH+NDyMfZVwbPrU64AUBvQqJY2WAroSPAE2UIfngczqtdQs0H26kr5TUKbxbFJ+NsFYTCL9zPtm3WyVifywDUrspexgHXZ9v7xxNE9DdgV+iQSExRetvPQMTWC7irVjsJ9ij+RX5KDg8YwvzueFjNti/I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740476438;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=6KHN1scQcppw8pT0cPhUgdCDwEZk4zFF85SfonaTG9o=;
	b=HkPBfRBnlt3LKckhrQ11wmHPMx03H0Ew+5pfzKOQHU2MKRyktJj0SvAB2PwDvl4f
	lNAxwLUMxzydQlNK6Uqy8E5prEX5Kc7wXDvrsCXSaaNRenDv1GH4Wv8CE+UH5LSVsQU
	2ziF2HXMfDmM+6ivvyLIe07nzajc0GspRVEv1eNU=
Received: by mx.zohomail.com with SMTPS id 174047643563359.41477366289905;
	Tue, 25 Feb 2025 01:40:35 -0800 (PST)
From: Sebastian Fricke <sebastian.fricke@collabora.com>
Subject: [PATCH v7 00/12] media: rkvdec: Add H.264 High 10 and 4:2:2
 profile support
Date: Tue, 25 Feb 2025 10:40:21 +0100
Message-Id: <20250225-rkvdec_h264_high10_and_422_support-v7-0-7992a68a4910@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAWQvWcC/zXNTQrDIBBA4asE1zWMg/mxq96jFLFxEm2oBk3TQ
 sjdK4Uuv817O8uUPGV2rnaWaPPZx1DQnSo2OBMm4t4WMwRsQIiWp3mzNGiHrdTOT06ANsFqiaj
 za1liWrnpR7SmN6CoZSW0JBr95ze53orHFJ98dYnMPy1BgRIKG8RaQNd2IDnyRwwmX+a3v8dYZ
 2LH8QVHx3ZArwAAAA==
X-Change-ID: 20250116-rkvdec_h264_high10_and_422_support-a8f2da8a09e6
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Alex Bee <knaerzche@gmail.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>, Jonas Karlman <jonas@kwiboo.se>, 
 Sebastian Fricke <sebastian.fricke@collabora.com>, 
 Christopher Obbard <christopher.obbard@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740476425; l=6209;
 i=sebastian.fricke@collabora.com; s=linux-media; h=from:subject:message-id;
 bh=Ums4+YJ6/mdB6OJJs/VVAlfEGxXlqH5U5JaUczjzwVo=;
 b=vHLchJj5VFzCe3N1yVf2hTKmia00n+p0wa99spFFYTcCB83QjeVgz6KVy4LcQatYwa4YdY9IlKrO
 9SOEYGMvB+tQ5oNpE+8h+aHSldt930GVc1n3iPKgxlH7ZJ2es86j
X-Developer-Key: i=sebastian.fricke@collabora.com; a=ed25519;
 pk=pYXedPwrTtErcj7ERYeo/IpTrpe4QbJuEzSB52fslBg=
X-ZohoMailClient: External

This series add H.264 High 10 and 4:2:2 profile support to the Rockchip
Video Decoder driver.

Patch 1 add helpers for calculating plane bytesperline and sizeimage.
Patch 2 add two new pixelformats for semi-planer 10-bit 4:2:0/4:2:2 YUV.

Patch 3 change to use bytesperline and buffer height to configure strides.
Patch 4 change to use values from SPS/PPS control to configure the HW.

Patch 5-9 refactor code to support filtering of CAPUTRE formats based
on the image format returned from a get_image_fmt ops.

Patch 10 add final bits to support H.264 High 10 and 4:2:2 profiles.

Patch 11 Limit minimum profile to constrained baseline due to
unsupported features in the full baseline profile

Patch 12 add a fix for enumerated frame sizes returned to userspace.

Tested with Fluster on a ROCK Pi 4 (RK3399)

129/135 on JVT-AVC_V1
44/69 on JVT-FR-EXT

Changes in v7:
- Split out the change with the minimum profile
- s/v4l2_format_plane_width/v4l2_format_plane_stride/
- Move V4L2_PIX_FMT_NV15/V4L2_PIX_FMT_NV20 documentation as suggested
- Change return value from int to bool on rkvdec_image_fmt_match
- Add reviewed-by tags
Link to v6: https://lore.kernel.org/linux-media/20240909192522.1076704-1-jonas@kwiboo.se/

Changes in v6:
- Change to use fmt_idx instead of j++ tucked inside a condition (Dan)
- Add patch to fix enumerated frame sizes returned to userspace (Alex)
- Fluster test score is same as v4 and v5, see [4] and [5]
Link to v5: https://lore.kernel.org/linux-media/20240618194647.742037-1-jonas@kwiboo.se/

Changes in v5:
- Drop Remove SPS validation at streaming start patch
- Move buffer align from rkvdec_fill_decoded_pixfmt to min/step_width
- Use correct profiles for V4L2_CID_MPEG_VIDEO_H264_PROFILE
- Collect r-b and t-b tags
- Fluster test score is same as v4, see [4] and [5]
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

To fully runtime test this series you may need FFmpeg patches from [1]
and fluster patches from [2], this series is also available at [3].

[1] https://github.com/Kwiboo/FFmpeg/commits/v4l2request-2024-v2-rkvdec/
[2] https://github.com/Kwiboo/fluster/commits/ffmpeg-v4l2request-rkvdec/
[3] https://github.com/Kwiboo/linux-rockchip/commits/linuxtv-rkvdec-high-10-v6/
[4] https://gist.github.com/Kwiboo/f4ac15576b2c72887ae2bc5d58b5c865
[5] https://gist.github.com/Kwiboo/459a1c8f1dcb56e45dc7a7a29cc28adf

Regards,
Jonas

Alex Bee (1):
  media: rkvdec: h264: Don't hardcode SPS/PPS parameters

Jonas Karlman (10):
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
  media: rkvdec: Fix enumerate frame sizes

 .../media/v4l/pixfmt-yuv-planar.rst           | 128 ++++++++++
 drivers/media/v4l2-core/v4l2-common.c         |  80 +++---
 drivers/media/v4l2-core/v4l2-ioctl.c          |   2 +
 drivers/staging/media/rkvdec/rkvdec-h264.c    |  64 +++--
 drivers/staging/media/rkvdec/rkvdec.c         | 239 +++++++++++++-----
 drivers/staging/media/rkvdec/rkvdec.h         |  18 +-
 include/uapi/linux/videodev2.h                |   2 +
 7 files changed, 410 insertions(+), 123 deletions(-)

--
2.46.0

---
Alex Bee (1):
      media: rkvdec: h264: Don't hardcode SPS/PPS parameters

Jonas Karlman (10):
      media: v4l2-common: Add helpers to calculate bytesperline and sizeimage
      media: v4l2: Add NV15 and NV20 pixel formats
      media: rkvdec: h264: Use bytesperline and buffer height as virstride
      media: rkvdec: Extract rkvdec_fill_decoded_pixfmt into helper
      media: rkvdec: Move rkvdec_reset_decoded_fmt helper
      media: rkvdec: Extract decoded format enumeration into helper
      media: rkvdec: Add image format concept
      media: rkvdec: Add get_image_fmt ops
      media: rkvdec: h264: Support High 10 and 4:2:2 profiles
      media: rkvdec: Fix frame size enumeration

Sebastian Fricke (1):
      media: rkvdec: h264: Limit minimum profile to constrained baseline

 .../userspace-api/media/v4l/pixfmt-yuv-planar.rst  | 128 +++++++++++
 drivers/media/v4l2-core/v4l2-common.c              |  80 +++----
 drivers/media/v4l2-core/v4l2-ioctl.c               |   2 +
 drivers/staging/media/rkvdec/rkvdec-h264.c         |  64 ++++--
 drivers/staging/media/rkvdec/rkvdec.c              | 239 +++++++++++++++------
 drivers/staging/media/rkvdec/rkvdec.h              |  18 +-
 include/uapi/linux/videodev2.h                     |   2 +
 7 files changed, 410 insertions(+), 123 deletions(-)
---
base-commit: c2b96a6818159fba8a3bcc38262da9e77f9b3ec7
change-id: 20250116-rkvdec_h264_high10_and_422_support-a8f2da8a09e6

Best regards,
-- 
Sebastian Fricke <sebastian.fricke@collabora.com>


