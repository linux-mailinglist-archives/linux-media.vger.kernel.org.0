Return-Path: <linux-media+bounces-31368-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A87D8AA441E
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 09:37:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 875C79A663E
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 07:36:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C128205AD7;
	Wed, 30 Apr 2025 07:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rfRUrHL4"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBEC1D61BB;
	Wed, 30 Apr 2025 07:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745998618; cv=none; b=A6c/7yMmrdIk5SgsANxlo+mae5sUOPFx5qRk/JqQ2kV7Hhvo2C/7nfalXpELaP/IK5h4uyyiV4anmIwn0DCXVlhIMU7Fk+nfkWQwVEXGtnmFq9B5pzK6l5wvVvMHBN3V7T9B4eqhDu707fuE41Ho7aj61uEE2CnX5wazN07ICFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745998618; c=relaxed/simple;
	bh=2Iuc/YvGrIbLNWjU2N2AfmxINjk6Ywe4jzfPpKf5HuM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pdnspK7TY5x/geYG2rNMU4FPfMZaHRSUh3vOTVA0OdYilwrPiucvAH1JU1I+qgSUGjAGfF7C8FwCxklEHBVrbEZiz4TLrKSF7qpjES3JjePHjNZp2h/xWE+0x9tWyQf8oQlZX64s7rL0UmueOcEzKK8qSoKpEVHmQdiK45ltlDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rfRUrHL4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from Monstersaurus.hippo-penny.ts.net (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A7200725;
	Wed, 30 Apr 2025 09:36:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745998607;
	bh=2Iuc/YvGrIbLNWjU2N2AfmxINjk6Ywe4jzfPpKf5HuM=;
	h=From:To:Cc:Subject:Date:From;
	b=rfRUrHL4Tb9pUxOtQgUkJ2Hn/IySHCHUtTomwUKUAZPOdVfIURWlz6fn/sNoqhHks
	 MXUuJsxul4tOi2Rkk/QwuffBwG6UwOFedPcrE3sWDc07ExQ2u60PYHCJgQ9xofFN/b
	 E360+xxB3MkLlxFyZr8PiwHJFsiAtliO+oCbYfuo=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: sakari.ailus@iki.fi,
	linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH] drivers: media: i2c: imx335: Fix frame size enumeration
Date: Wed, 30 Apr 2025 08:36:49 +0100
Message-ID: <20250430073649.1986018-1-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In commit cfa49ff0558a ("media: i2c: imx335: Support 2592x1940 10-bit
mode") the IMX335 driver was extended to support multiple output
bitdepth modes.

This incorrectly extended the frame size enumeration to check against
the supported mbus_codes array instead of the supported mode/frame
array. This has the unwanted side effect of reporting the currently
supported frame size 2592x1944 three times.

Fix the check accordingly to report a frame size for each supported
size, which is presently only a single entry.

Fixes: cfa49ff0558a ("media: i2c: imx335: Support 2592x1940 10-bit mode")
Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---

I expect to post a 2/2 binning mode series on top of this later to then
further extend the supported_mode into an array ...

So I won't dwell on tracking fsize->index against the 'size' or number
of supported modes yet... but this fixes an otherwise annoying glitch
;-)

 drivers/media/i2c/imx335.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
index 0418875e996c..6369bdbd2b09 100644
--- a/drivers/media/i2c/imx335.c
+++ b/drivers/media/i2c/imx335.c
@@ -720,7 +720,8 @@ static int imx335_enum_frame_size(struct v4l2_subdev *sd,
 	struct imx335 *imx335 = to_imx335(sd);
 	u32 code;
 
-	if (fsize->index > ARRAY_SIZE(imx335_mbus_codes))
+	/* Only a single supported_mode available. */
+	if (fsize->index > 0)
 		return -EINVAL;
 
 	code = imx335_get_format_code(imx335, fsize->code);
-- 
2.48.1


