Return-Path: <linux-media+bounces-30487-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D917A923A9
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 19:15:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D5BB46649F
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 17:14:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D73C125525F;
	Thu, 17 Apr 2025 17:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="nXSVEy3/"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC012550C8;
	Thu, 17 Apr 2025 17:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744910077; cv=none; b=FaMjkMNhQWt4ckANDHaXn1s1TyY3lnAvAEiyO5gmwXwjfUG5Wsa5P4h+95XruUcVrURSjC0O9G72LsL8LyTNbxvGsdHmWhYeFIsS895qd8wx9U8lXFrV6lYkx+njMgGDgFNDWo7SMBLiksrjHsXV7MvVuoK99mS5KbKq7Hm+9IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744910077; c=relaxed/simple;
	bh=8stjwvG17SDE3Vcc/yWwu9Y1l5pRenfQYcjhF4Bsf4Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tlrKicBCWLn6wI3aSNX8iThs3ECLrAViToPD6jZknSyviQQBp7mqg4Plqd5KHFCFlyMy82DofRAu8qkrVXS3SszyrFN7SanpZ5VNIxU9BwDlX5qcpzf9B0CgmWCZMyjdn5fImtX4FWnP4k0YAcLVCSjvJM6J0rdE15wwCCPN2Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=nXSVEy3/; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744910072;
	bh=8stjwvG17SDE3Vcc/yWwu9Y1l5pRenfQYcjhF4Bsf4Q=;
	h=From:Subject:Date:To:Cc:From;
	b=nXSVEy3/X+80ng3jwKsy9BzBRd1c4HbZvf+s5wJFyoeBaXbiBgEaxaMFctR+etF1r
	 HZmJ+CKPRV+HnXiiU43ic0b043awQEKGD56zu9vrVelBeKG9RYwokcnSs9Ga0vjcLB
	 gDKpD9RMM10hi/IQhkNa+Yx8+TwKLR+HxWkmJxunKVE5kRgy2ynnVHarEVytURLoEI
	 bCk+VCI2yCDkqGFIbnrncj3qqvren77W5ecwg1aSZPDaPzMl/BTncbNHb+4qTmnMaO
	 KGCaVac2QjPY8fM2QYNrcOlilvTzIQc2UZKYdzaDC3vN6Qc9MAocHKOzyzUAley+cr
	 XaMkciMLxv93g==
Received: from [192.168.13.3] (unknown [IPv6:2606:6d00:15:9913::c73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C4E3C17E00F0;
	Thu, 17 Apr 2025 19:14:30 +0200 (CEST)
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH v8 0/3] media: rkvdec: Add H.264 High 10 and 4:2:2 profile
 support
Date: Thu, 17 Apr 2025 13:14:22 -0400
Message-Id: <20250417-b4-rkvdec_h264_high10_and_422_support-v8-0-423fe0a2ee7e@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO42AWgC/x3NQQrCMBBA0auUWRvIjGksXkUkxGZsBiENEy1C6
 d0NLt/m/x0aq3CD67CD8iZN1tIxnQaYcywLG0ndQJZG69CbhzP62hLPIZN3IcuS0YZYUnBEoX1
 qXfVtzhPGi8MR0RP0VlV+yvf/ud2P4wcciHEAdwAAAA==
X-Change-ID: 20250416-b4-rkvdec_h264_high10_and_422_support-381a74151162
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, kernel@collabora.com, 
 Sebastian Fricke <sebastian.fricke@collabora.com>, 
 Jonas Karlman <jonas@kwiboo.se>, 
 Christopher Obbard <christopher.obbard@linaro.org>
X-Mailer: b4 0.14.2

This series add H.264 High 10 and 4:2:2 profile support to the Rockchip
Video Decoder driver.

Patch 1 limits the minimum profile to constrained baseline due to
unsupported features in the full baseline profile.

Patch 2 refactors code to support filtering of CAPTURE formats based
on the image format returned from a new get_image_fmt() ops.

Patch 3 adds final bits to support H.264 High 10 and 4:2:2 profiles.

Tested with Fluster on a Libre Computer Renegade Elite (RK3399).

Decoder:                        GStreamer
Commit:                         8c7ad20e4e82296ed9916f53c201e110c629f0f5
JVT-AVC_V1:                     129/135
JVT-FR-EXT:                     65/69
JVT-Professional_profiles:      12/38
JVT-MVC:                        0/20 (not supported)
JVT-SCV:                        38/185 (temporal only)

In summary, all tests that are 4:2:2 sub-sampled are now passing with
the exception of the following that display some unexplained artifacts.

 - Hi422FREXT17_SONY_A
 - Hi422FREXT19_SONY_A

This score also includes 4:2:0 10bit tests, that may have been reported
as failing due to lack of userspace support for NV15 format. It also
includes results from test suite that did not exists before (Pro, MVC
and SVC).

Changes in v8:
- Removed patches that got applied from v7
- Move the constrained-baseline fix first
- Move the format checks into s_ctrl only
- Simplify the checks
- Retest against a newer GStreamer version with NV16 and NV20 support.
- Test against the new fluster suite Professions, SVC and MVC.
Link to v7: https://lore.kernel.org/linux-media/20250225-rkvdec_h264_high10_and_422_support-v7-0-7992a68a4910@collabora.com/

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

Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
Jonas Karlman (2):
      media: rkvdec: Add get_image_fmt ops
      media: rkvdec: h264: Support High 10 and 4:2:2 profiles

Sebastian Fricke (1):
      media: rkvdec: h264: Limit minimum profile to constrained baseline

 drivers/staging/media/rkvdec/rkvdec-h264.c | 37 +++++++++----
 drivers/staging/media/rkvdec/rkvdec.c      | 84 +++++++++++++++++++++++++-----
 drivers/staging/media/rkvdec/rkvdec.h      |  5 ++
 3 files changed, 105 insertions(+), 21 deletions(-)
---
base-commit: 14423fc3a4a21fb436dda85450339ec2bf191b36
change-id: 20250416-b4-rkvdec_h264_high10_and_422_support-381a74151162

Best regards,
-- 
Nicolas Dufresne <nicolas.dufresne@collabora.com>


