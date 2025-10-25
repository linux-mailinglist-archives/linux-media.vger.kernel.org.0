Return-Path: <linux-media+bounces-45560-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F788C09CE6
	for <lists+linux-media@lfdr.de>; Sat, 25 Oct 2025 19:00:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 976024F14F3
	for <lists+linux-media@lfdr.de>; Sat, 25 Oct 2025 16:33:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36AB730F94C;
	Sat, 25 Oct 2025 16:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OBGfeDcn"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F08F303A1E;
	Sat, 25 Oct 2025 16:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761409562; cv=none; b=TmUjxySngiaplkzUsi7twDrCEWwQVSxjv2/UqGXdJe1Nrwa+QAl0tXN09USVVcAlg2I7f6AiWARty9rbfcHyeXrLrAbwOLyPd69X3lSDeYR/4Mp+MVyzf35Ta4DzRwkHtmUl3hCt7G+rFl4Gu5XPDuOyKbGUmaj7ARtvj6clOo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761409562; c=relaxed/simple;
	bh=+4nRBMjzRvhju8F56vVrgQsretnLSSG21867TLrJj8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IPS2S37DVhfGIWMofFp0bvQytgvNmb9XeMJbVex6Q1Hc9I9TLovbbdMWX0480aFu1nEtU5UF+s14IoV4ae1WHVFkYYeAWetOTQOEhu26b+LXVHRdBEBi/e/mcH0qiaEU1MSoxSH90V4ui0zyZr5s1o5wu0o4fMJ+j6SpB7A5xFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OBGfeDcn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93A11C4CEFB;
	Sat, 25 Oct 2025 16:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761409562;
	bh=+4nRBMjzRvhju8F56vVrgQsretnLSSG21867TLrJj8c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OBGfeDcnNrU/AzZmjEzIlVQyBWEeuqQ/RiU+e4gulaSNNzvrCw0jfJZ38oYtV0V4U
	 +nqZPg3yv3ot6x6DrRN813Vr4F8IqdUc5ANN0X+hpDpPr8DN71rzbzx2sUF9Tg1Rs5
	 mN7EP5m7JEp2XEvYBFdR9eZ34+stAAuQhtpIhXvIb9y/q0BeAU60nRIC3zW8XX3aNy
	 rnsMV7sORH613eAZGIl8dFRPX1xtI28a+f5VkvvnJMYL2F5nlfY1ljfBR39wh1C3wY
	 rE9NJhJ64cq99UrOSbtPDGvLatJ4WxmBg3oqbKrRcunh0K+I0hBEaUvl+pkrRVXgbO
	 4ndlqqfqx2VlA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.17-6.1] media: i2c: og01a1b: Specify monochrome media bus format instead of Bayer
Date: Sat, 25 Oct 2025 11:59:58 -0400
Message-ID: <20251025160905.3857885-367-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

[ Upstream commit bfbd5aa5347fbd11ade188b316b800bfb27d9e22 ]

The OmniVision OG01A1B image sensor is a monochrome sensor, it supports
8-bit and 10-bit RAW output formats only.

That said the planar greyscale Y8/Y10 media formats are more appropriate
for the sensor instead of the originally and arbitrary selected SGRBG one,
since there is no red, green or blue color components.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

- Problem fixed: The sensor is monochrome, but the driver advertised a
  Bayer RAW10 bus code. This is incorrect and can cause wrong pipeline
  negotiation and processing (e.g., debayering on a non-CFA stream).
- Precise fix: Three small, contained changes switch the media bus code
  from Bayer to monochrome:
  - Default pad format: `fmt->code = MEDIA_BUS_FMT_Y10_1X10;` in
    `og01a1b_update_pad_format` (drivers/media/i2c/og01a1b.c:685).
  - Advertised code enumeration: `code->code = MEDIA_BUS_FMT_Y10_1X10;`
    in `og01a1b_enum_mbus_code` (drivers/media/i2c/og01a1b.c:827).
  - Frame-size enumeration input check: `fse->code !=
    MEDIA_BUS_FMT_Y10_1X10` (drivers/media/i2c/og01a1b.c:839).
- Scope and risk: The changes are limited to format reporting in this
  sensor subdev; no register programming, timing, or streaming logic is
  touched. The on-wire MIPI CSI-2 data type remains RAW10; this is a
  representational fix, not a hardware/protocol change.
- User impact: Correctly reporting monochrome Y10 avoids erroneous color
  processing and enables proper link validation with components that
  expect grayscale formats. Many bridge/ISP drivers already support
  `MEDIA_BUS_FMT_Y10_1X10`, minimizing regression risk.
- Compatibility: The driver’s single supported mode is 10-bit, and the
  code already reflects 10-bit depth, so Y10 is consistent with current
  capabilities. There’s no API/ABI change visible to V4L2 capture nodes;
  this is subdev pad-format metadata.
- Stable criteria alignment:
  - Important bug fix (wrong format reported for a monochrome sensor).
  - Small, surgical change (three lines).
  - No architectural or cross-subsystem churn.
  - Low regression risk; aligns with established handling of monochrome
    sensors.
  - Confined to one i2c/media driver file
    (`drivers/media/i2c/og01a1b.c`).

Given the correctness improvement, minimal scope, and low risk, this is
a good candidate for stable backport.

 drivers/media/i2c/og01a1b.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/og01a1b.c b/drivers/media/i2c/og01a1b.c
index 78d5d406e4b72..b7d0b677975d5 100644
--- a/drivers/media/i2c/og01a1b.c
+++ b/drivers/media/i2c/og01a1b.c
@@ -682,7 +682,7 @@ static void og01a1b_update_pad_format(const struct og01a1b_mode *mode,
 {
 	fmt->width = mode->width;
 	fmt->height = mode->height;
-	fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
+	fmt->code = MEDIA_BUS_FMT_Y10_1X10;
 	fmt->field = V4L2_FIELD_NONE;
 }
 
@@ -828,7 +828,7 @@ static int og01a1b_enum_mbus_code(struct v4l2_subdev *sd,
 	if (code->index > 0)
 		return -EINVAL;
 
-	code->code = MEDIA_BUS_FMT_SGRBG10_1X10;
+	code->code = MEDIA_BUS_FMT_Y10_1X10;
 
 	return 0;
 }
@@ -840,7 +840,7 @@ static int og01a1b_enum_frame_size(struct v4l2_subdev *sd,
 	if (fse->index >= ARRAY_SIZE(supported_modes))
 		return -EINVAL;
 
-	if (fse->code != MEDIA_BUS_FMT_SGRBG10_1X10)
+	if (fse->code != MEDIA_BUS_FMT_Y10_1X10)
 		return -EINVAL;
 
 	fse->min_width = supported_modes[fse->index].width;
-- 
2.51.0


