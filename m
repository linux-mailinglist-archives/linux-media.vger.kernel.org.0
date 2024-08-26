Return-Path: <linux-media+bounces-16840-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC4495F4B9
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 17:10:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9DB74B224EC
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 15:10:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06064197A7B;
	Mon, 26 Aug 2024 15:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ZTtzR/4O"
X-Original-To: linux-media@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3252194A5B;
	Mon, 26 Aug 2024 15:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724684933; cv=none; b=SROLgIh+72yE8d63H77NVhH6cF2+GVakY/7PIIwt7l4Q72tKrrwA8RRdwqJZmRA+vgLSrSQbKJZr0Lv2JIUEiOEGUCvBCEBuR6FHhGv6v90t6JOYIj1SREvvpewG7n5jyPTeyNNLe1fMNlCEQ38fAcfQNu6/sLs6vT5eh0bnpSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724684933; c=relaxed/simple;
	bh=yplzxazRZAO4nYwBHmujSuJgMm5i+g3+TkiqkYYc24w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jY5Flv0HHe1OrV5Hurc9LJWkuYz3O8+O0l5lqOnnF55lNVZSks5JxYVgDLZD3h64dDTflXtGwWsTNxmAtoFCPLy26HU/DrPpvqnb7mZYZ6kTxjueHRX0JkhFkeL0Dinz+MeHnpX2VhaenmTe0lYrCh0Od3ItUgL2T4khZsr7EhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ZTtzR/4O; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47QF8XSL036670;
	Mon, 26 Aug 2024 10:08:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1724684913;
	bh=py24q1XnhiIu1BHQBvjxKKjklYfZsAuYPl8fy17n08E=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ZTtzR/4OqOAGOK4KHiFPr8ehpkqUIRhq3DA4MOJk6kseXWcfYfSP7s7zL6+IK51gD
	 XlmcS3IAQhaS9ORyUtXAZ0usxaIaLgSOvuc50Mmb5KWubFE8UcqE2asyLnwD5Ql66s
	 /ujc2B7dLyulOSya307AMCl7uTfvG8TqjY9os5mc=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47QF8Xet124057
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 26 Aug 2024 10:08:33 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 26
 Aug 2024 10:08:32 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 26 Aug 2024 10:08:32 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 47QF8VIR100898;
	Mon, 26 Aug 2024 10:08:32 -0500
From: Devarsh Thakkar <devarsht@ti.com>
To: <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sebastian.fricke@collabora.com>, <linux-doc@vger.kernel.org>
CC: <praneeth@ti.com>, <nm@ti.com>, <vigneshr@ti.com>, <s-jain1@ti.com>,
        <r-donadkar@ti.com>, <b-brnich@ti.com>, <detheridge@ti.com>,
        <p-mantena@ti.com>, <vijayp@ti.com>, <devarsht@ti.com>,
        <andi.shyti@linux.intel.com>, <nicolas@ndufresne.ca>,
        <andriy.shevchenko@linux.intel.com>, <jirislaby@kernel.org>,
        <davidgow@google.com>, <dlatypov@google.com>, <corbet@lwn.net>,
        <broonie@kernel.org>, <jani.nikula@intel.com>, <rdunlap@infradead.org>,
        <nik.borisov@suse.com>, <Dave.Martin@arm.com>
Subject: [PATCH v2 6/6] media: imagination: Round to closest multiple for cropping region
Date: Mon, 26 Aug 2024 20:38:22 +0530
Message-ID: <20240826150822.4057164-7-devarsht@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20240826150822.4057164-1-devarsht@ti.com>
References: <20240826150822.4057164-1-devarsht@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

If neither of the flags to round down (V4L2_SEL_FLAG_LE) or round up
(V4L2_SEL_FLAG_GE) are specified by the user, then round to nearest
multiple of requested value while updating the crop rectangle coordinates.

Use the rounding macro which gives preference to rounding down in case two
nearest values (high and low) are possible to raise the probability of
cropping rectangle falling inside the bound region.

This complies with the VIDIOC_G_SELECTION, VIDIOC_S_SELECTION ioctl
description as documented in v4l uapi [1] which specifies that driver
should choose crop rectangle as close as possible if no flags are passed by
user-space, as quoted below :

"``0`` - The driver can adjust the rectangle size freely and shall choose a
crop/compose rectangle as close as possible to the requested
 one."

Link: https://www.kernel.org/doc/Documentation/userspace-api/media/v4l/vidioc-g-selection.rst [1]
Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
---
V2: No change
---
 drivers/media/platform/imagination/e5010-jpeg-enc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/imagination/e5010-jpeg-enc.c b/drivers/media/platform/imagination/e5010-jpeg-enc.c
index 187f2d8abfbb..6c3687445803 100644
--- a/drivers/media/platform/imagination/e5010-jpeg-enc.c
+++ b/drivers/media/platform/imagination/e5010-jpeg-enc.c
@@ -514,10 +514,10 @@ static int e5010_s_selection(struct file *file, void *fh, struct v4l2_selection
 
 	switch (s->flags) {
 	case 0:
-		s->r.width = round_down(s->r.width, queue->fmt->frmsize.step_width);
-		s->r.height = round_down(s->r.height, queue->fmt->frmsize.step_height);
-		s->r.left = round_down(s->r.left, queue->fmt->frmsize.step_width);
-		s->r.top = round_down(s->r.top, 2);
+		s->r.width = round_closest_down(s->r.width, queue->fmt->frmsize.step_width);
+		s->r.height = round_closest_down(s->r.height, queue->fmt->frmsize.step_height);
+		s->r.left = round_closest_down(s->r.left, queue->fmt->frmsize.step_width);
+		s->r.top = round_closest_down(s->r.top, 2);
 
 		if (s->r.left + s->r.width > queue->width)
 			s->r.width = round_down(s->r.width + s->r.left - queue->width,
-- 
2.39.1


