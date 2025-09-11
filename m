Return-Path: <linux-media+bounces-42290-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95529B52E67
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 12:31:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8C1F7BD084
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 10:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7141B311C10;
	Thu, 11 Sep 2025 10:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ieu2KQHP"
X-Original-To: linux-media@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E18B31159E;
	Thu, 11 Sep 2025 10:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757586567; cv=none; b=XjSVxfVm3JpDw/g46w8MyVGDF+kh9WBqVVrlh5yLVnejF8VIA5a29ZWdiE4ncux9IanXBKexF2P5n/Q8WBMLej3S5JiT/VWS0YTaoLXi6+d/Ow2xdJg2FN5iA367BHtSZvZbUTBiSY33XSbAXakhgBvz1F/w17mJ9NBON5dbhfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757586567; c=relaxed/simple;
	bh=1lg+IxVCNbAmPARiuPEFwAN+20mIakKwBhxEotv7hHg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Lo5ksuaS1bhrCXcqOT1a4QpVuqUc/y8B+ju7fwxCaEcQdmQBQB3tWPVyochO6NuYPBTN1qMp3Z4IpIbcQl8W8y9dEQP0//wYdRSb0Xws4J30tMzRioK8CanWTVoheqgzQfLrg/9umwUPlCJXLX2wdRIZfWtEEM/qxNVE1j1APKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ieu2KQHP; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58BASm0I273344;
	Thu, 11 Sep 2025 05:28:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757586528;
	bh=sw+Y9HK+OCX/ewgJm+ovgqlmo96LecCzbzk1/NOhJb0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ieu2KQHPC1VxkwAOxdF+GiOajbNoanjs85kXTO4yYyCpPt9nnVYlkSDzoGoCqs3oF
	 sCZBXmU86HBHl07f1FPBNSN3Fd+ZFNVbSnxf/mxzQVAWHCtYJLZc/9wRz7nN0Kqd6N
	 gDHqrPssjJ5LYnjMo3RJG4YT7psvPdxeAna6zvUM=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58BASmqH1091583
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 11 Sep 2025 05:28:48 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 11
 Sep 2025 05:28:47 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 11 Sep 2025 05:28:47 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58BASXbf1985821;
	Thu, 11 Sep 2025 05:28:41 -0500
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <jai.luthra@linux.dev>, <laurent.pinchart@ideasonboard.com>,
        <mripard@kernel.org>
CC: <r-donadkar@ti.com>, <y-abhilashchandra@ti.com>, <devarsht@ti.com>,
        <s-jain1@ti.com>, <vigneshr@ti.com>, <mchehab@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <p.zabel@pengutronix.de>,
        <conor+dt@kernel.org>, <sakari.ailus@linux.intel.com>,
        <hverkuil-cisco@xs4all.nl>, <tomi.valkeinen@ideasonboard.com>,
        <jai.luthra@ideasonboard.com>, <changhuang.liang@starfivetech.com>,
        <jack.zhu@starfivetech.com>, <sjoerd@collabora.com>,
        <hverkuil+cisco@kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v7 01/16] media: ti: j721e-csi2rx: Remove word size alignment on frame width
Date: Thu, 11 Sep 2025 15:58:17 +0530
Message-ID: <20250911102832.1583440-2-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250911102832.1583440-1-r-donadkar@ti.com>
References: <20250911102832.1583440-1-r-donadkar@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

j721e-csi2rx driver has a limitation of frame width being a multiple
word size. However, there is no such limitation imposed by the
hardware [1].

Remove this limitation from the driver.

Link: https://www.ti.com/lit/pdf/spruj16
Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 23 ++++---------------
 1 file changed, 4 insertions(+), 19 deletions(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index 3992f8b754b7..6a981b5f5d51 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -250,19 +250,12 @@ static void ti_csi2rx_fill_fmt(const struct ti_csi2rx_fmt *csi_fmt,
 			       struct v4l2_format *v4l2_fmt)
 {
 	struct v4l2_pix_format *pix = &v4l2_fmt->fmt.pix;
-	unsigned int pixels_in_word;
-
-	pixels_in_word = PSIL_WORD_SIZE_BYTES * 8 / csi_fmt->bpp;
 
 	/* Clamp width and height to sensible maximums (16K x 16K) */
 	pix->width = clamp_t(unsigned int, pix->width,
-			     pixels_in_word,
-			     MAX_WIDTH_BYTES * 8 / csi_fmt->bpp);
+			     1, MAX_WIDTH_BYTES * 8 / csi_fmt->bpp);
 	pix->height = clamp_t(unsigned int, pix->height, 1, MAX_HEIGHT_LINES);
 
-	/* Width should be a multiple of transfer word-size */
-	pix->width = rounddown(pix->width, pixels_in_word);
-
 	v4l2_fmt->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
 	pix->pixelformat = csi_fmt->fourcc;
 	pix->bytesperline = pix->width * (csi_fmt->bpp / 8);
@@ -360,23 +353,15 @@ static int ti_csi2rx_enum_framesizes(struct file *file, void *fh,
 				     struct v4l2_frmsizeenum *fsize)
 {
 	const struct ti_csi2rx_fmt *fmt;
-	unsigned int pixels_in_word;
 
 	fmt = find_format_by_fourcc(fsize->pixel_format);
 	if (!fmt || fsize->index != 0)
 		return -EINVAL;
 
-	/*
-	 * Number of pixels in one PSI-L word. The transfer happens in multiples
-	 * of PSI-L word sizes.
-	 */
-	pixels_in_word = PSIL_WORD_SIZE_BYTES * 8 / fmt->bpp;
-
 	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
-	fsize->stepwise.min_width = pixels_in_word;
-	fsize->stepwise.max_width = rounddown(MAX_WIDTH_BYTES * 8 / fmt->bpp,
-					      pixels_in_word);
-	fsize->stepwise.step_width = pixels_in_word;
+	fsize->stepwise.min_width = 1;
+	fsize->stepwise.max_width = MAX_WIDTH_BYTES * 8 / fmt->bpp;
+	fsize->stepwise.step_width = 1;
 	fsize->stepwise.min_height = 1;
 	fsize->stepwise.max_height = MAX_HEIGHT_LINES;
 	fsize->stepwise.step_height = 1;
-- 
2.34.1


