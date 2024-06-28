Return-Path: <linux-media+bounces-14372-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9140791C81C
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 23:26:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 332431F23451
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 21:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53D8D7F487;
	Fri, 28 Jun 2024 21:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cZrTCyVj"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458007D3F4
	for <linux-media@vger.kernel.org>; Fri, 28 Jun 2024 21:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719609988; cv=none; b=kmlqmvJUptr1qorlrBXF79mzpdzkZT344N7D2XhXXP4QVBjgPWgkL0jdsuGF7cP5Pvf7a6B3htywOY0ubgSH7oHL1CEEYJC3AHzP83QDWVl1k0+FLGnnJJ1hTdpmVClAdvEzMYhjNwF0um1ZgtHR6AjQ5XPBAe5vaiHcvGrdC8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719609988; c=relaxed/simple;
	bh=goCjZLs9Dp4Ju3TKiZho3aqbXtDuoKMo99EyOs3Eryg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D1VljhcPxvKJJ3bGYLvASq//cPQc8/w4Epat3ha/CI/0VocW7B/Ej9krN8SiOnBVuU7VURdWz0Axkl5GieVUfnRxAkm+uFrCl8sa3aSAbLsy1AR1fAEh51qEG2eEmFj8y2E+GR9VmJVjOTELOdhF/Q56Ies2DbXg2GIJ/A2Cbuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cZrTCyVj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 99A202C5;
	Fri, 28 Jun 2024 23:25:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1719609959;
	bh=goCjZLs9Dp4Ju3TKiZho3aqbXtDuoKMo99EyOs3Eryg=;
	h=From:To:Cc:Subject:Date:From;
	b=cZrTCyVj0qII3iv7d/ioQ3I8xmjmtJH/fMGdWb3GNcp32iJFFNo1c50zAK3qus5M4
	 reNfUPGKnZAf1dT8Cp30PzoTFjua4YGvSY/HtfmFUnEftRUI7Yv8i9L1yyFQT7eoW4
	 uOB6fNsi2TtiUSudmyhlj4ZbRwXhCcoUAjA8qTAo=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH] media: i2c: ccs: Fix link frequency control range update
Date: Sat, 29 Jun 2024 00:26:03 +0300
Message-ID: <20240628212603.5870-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When updating the link frequency control range in response to a format
change, the minimum value passed to the __v4l2_ctrl_modify_range()
function is hardcoded to 0, while there's no guarantee that the first
link frequency in the menu is valid for the selected format. Fix it by
getting using the index of the first bit set in the valid link
frequencies mask.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
I noticed this issue in the CCS driver while working on a different
sensor driver. I haven't tested this patch.
---
 drivers/media/i2c/ccs/ccs-core.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index e1ae0f9fad43..5257dc4912ae 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -2143,6 +2143,7 @@ static int ccs_set_format_source(struct v4l2_subdev *subdev,
 		*old_csi_format = sensor->csi_format;
 	unsigned long *valid_link_freqs;
 	u32 code = fmt->format.code;
+	unsigned int min, max;
 	unsigned int i;
 	int rval;
 
@@ -2179,10 +2180,13 @@ static int ccs_set_format_source(struct v4l2_subdev *subdev,
 		&sensor->valid_link_freqs[sensor->csi_format->compressed
 					  - sensor->compressed_min_bpp];
 
-	__v4l2_ctrl_modify_range(
-		sensor->link_freq, 0,
-		__fls(*valid_link_freqs), ~*valid_link_freqs,
-		__ffs(*valid_link_freqs));
+	min = __ffs(*valid_link_freqs);
+	man = __fls(*valid_link_freqs);
+
+	ret = __v4l2_ctrl_modify_range(sensor->link_freq, min, max,
+				       ~*valid_link_freqs, min);
+	if (ret)
+		return ret;
 
 	return ccs_pll_update(sensor);
 }

base-commit: afcd48134c58d6af45fb3fdb648f1260b20f2326
-- 
Regards,

Laurent Pinchart


