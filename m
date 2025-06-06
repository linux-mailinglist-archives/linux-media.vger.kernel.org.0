Return-Path: <linux-media+bounces-34259-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE88AD0440
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 16:53:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E96B717866A
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 14:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C935F1A76BC;
	Fri,  6 Jun 2025 14:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dI+0Ye+A"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E62F45945;
	Fri,  6 Jun 2025 14:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749221589; cv=none; b=cRTSzoMEBWXkAK/IbMXjrHY2sI8ZIImf6KDT61qxG5ggrnk42gvddYuI+js2N0aY5Uvt+8K6JyhJs+mHGfw1AiPVWpwiBfIqlSLT5HdJuy9Ut90jeh4G8g5Y1Ptvx+YZ0Xv1WE3uIU1yLdDKKJo2lKtV0z07611NLlzOQc5S5+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749221589; c=relaxed/simple;
	bh=TcHbFteQOmLGBTjvX6qik4ZH9aSmoF2gCaV1qnEzHEs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=eqNtqRYh+56WpqTG1RrKJdU9RTqC6qWPKqYkZmYSpJOu/UQbjRfhxUpmOpQQ+5/IIiDJtoT4jmFfkV9e/igIepn743YU/G67FynLDVptQ1nX5UCjIijXvyH+crl8RbTVTz0gl3nZRlRxTdBKRn/jH386gEfa6gj5P6KBK0KqjKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dI+0Ye+A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ED27C4CEEB;
	Fri,  6 Jun 2025 14:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749221588;
	bh=TcHbFteQOmLGBTjvX6qik4ZH9aSmoF2gCaV1qnEzHEs=;
	h=From:Date:Subject:To:Cc:From;
	b=dI+0Ye+AGlZIaH/LY1u7ma22xgJn7KvgemittR6jP5yziMo9nnkajES+zuH79aYo+
	 gpVnmRjPOgcWmWHPYwNZLY49I9zzd40rSPJ/m5qyMCHAabaxWfsE0qsO9rhgFh7zJ7
	 8gv+WuKNH7svThgQ/GeAWVvt2IqakwIkIV/Ucz6lX9XxEwQL1W0BUWkm+jTLmvYmd/
	 hyopqgm+mrSl28br7RKDPRBjt/D4F80WrPG75l938RoJuGq2sy0t/ljYiXof/G60hH
	 MLlNBTky/+Ro44yqw3expGOKqchH1DXLImcKd1EdadqUOj6IGplLMe3A6hz6on8onz
	 N0lrSXJAVki/w==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 06 Jun 2025 16:53:03 +0200
Subject: [PATCH] media: bcm2835-unicam: Remove RGB24 support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250606-rpi-unicam-rgb-bgr-fix-v1-1-9930b963f3eb@kernel.org>
X-B4-Tracking: v=1; b=H4sIAM4AQ2gC/x2MSQqAMAwAvyI5G2hFK/gV8dAl1hyskqIIxb9bP
 M7ATIFMwpRhagoI3Zz5SBV024DfbIqEHCpDp7pBGWVQTsYrsbc7SnToouDKDwbtzNobOw42QI1
 Poar/8by87wcQphAQaAAAAA==
X-Change-ID: 20250606-rpi-unicam-rgb-bgr-fix-d1b6f46a75ad
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Naushir Patuck <naush@raspberrypi.com>, linux-media@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1907; i=mripard@kernel.org;
 h=from:subject:message-id; bh=TcHbFteQOmLGBTjvX6qik4ZH9aSmoF2gCaV1qnEzHEs=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnODBcdQnQ+MO74st7wm4N2jPGUE8frxWuEpXdsn7D88
 bbGp2xXOqawMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBECl4yNhxzmWem2pHb0W8z
 8X/Ay9isuX6arzVjHykLq+0vjZTk423b9+R2ndlZueavVzgfCi6fyVim9C7/7AT/d99+ySU92mx
 mEPD+kpbb9gZPJY5VXTsVLismFtk9q1ooNbnhLH+6hY6cAgA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The RGB24 V4L2 format is defined as a pixel format with 8 bits per
components, with the components being in the red, green, and blue order
from left to right.

The RGB MIPI-CSI2 is defined in the specification (Section 11.3.1,
RGB888) with blue coming first, then green, then red. So the opposite of
what V4L2 means by RGB.

Since the hardware cannot reorder the components, this means that when
selecting the RGB24 format, you get inverted red and blue components
compared to what you'd expect.

The driver already supports BGR24, so we can simply remove the RGB24
format from the driver.

Fixes: 392cd78d495f ("media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface")
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/media/platform/broadcom/bcm2835-unicam.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
index f10064107d543caf867249d0566a0f42d6d8c4c6..1f549019efd53c9aae83193e74f1a3601ebf274d 100644
--- a/drivers/media/platform/broadcom/bcm2835-unicam.c
+++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
@@ -338,15 +338,10 @@ static const struct unicam_format_info unicam_image_formats[] = {
 	/* RGB Formats */
 		.fourcc		= V4L2_PIX_FMT_RGB565, /* gggbbbbb rrrrrggg */
 		.code		= MEDIA_BUS_FMT_RGB565_1X16,
 		.depth		= 16,
 		.csi_dt		= MIPI_CSI2_DT_RGB565,
-	}, {
-		.fourcc		= V4L2_PIX_FMT_RGB24, /* rgb */
-		.code		= MEDIA_BUS_FMT_RGB888_1X24,
-		.depth		= 24,
-		.csi_dt		= MIPI_CSI2_DT_RGB888,
 	}, {
 		.fourcc		= V4L2_PIX_FMT_BGR24, /* bgr */
 		.code		= MEDIA_BUS_FMT_BGR888_1X24,
 		.depth		= 24,
 		.csi_dt		= MIPI_CSI2_DT_RGB888,

---
base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
change-id: 20250606-rpi-unicam-rgb-bgr-fix-d1b6f46a75ad

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>


