Return-Path: <linux-media+bounces-14707-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 818F092A6A1
	for <lists+linux-media@lfdr.de>; Mon,  8 Jul 2024 18:01:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B3E91F22675
	for <lists+linux-media@lfdr.de>; Mon,  8 Jul 2024 16:01:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B939149C6C;
	Mon,  8 Jul 2024 16:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="GJ+2cbp9"
X-Original-To: linux-media@vger.kernel.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772C1148855;
	Mon,  8 Jul 2024 16:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720454415; cv=none; b=MQ4cf0N90BQccFtHRBcNELGLj+jHyApeJx6exmVPIY7ZrWuYnMxXdiJZfUD2LAzONx6evNvZX2gKCWV5hZVoZbcizffkYIfGqJPMPP/lA7hLK2VM3ZQp6wKS1kGIrosbd+H6n8LhE7Fe9P9siCHFT5xTCR6XGVHLsF9XOZvo0w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720454415; c=relaxed/simple;
	bh=TBwnL3wQbc4QRf7j9akENyB348Gia8jiwKmTJHW1ai0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P7gTOfFV5rVqsMIfM/tf+rL6g10vqzskg+gtAs1i9h2N+/Bopt6CXL3TUz226Qmq1RCtmtfV0Oc72JJQzfS+wVzkGUt9GMuWwJAc1IBP/hJd+XL7Kfp6eWpgA31O71p5HW/xAr1fIrGD638pUxrJxsZoKIUhHSu4gUOmVaithMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=GJ+2cbp9; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 468Fxric046208;
	Mon, 8 Jul 2024 10:59:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1720454393;
	bh=nqty+XynRb9yhSMGja4MzmxCzRnKyzh3bIOszbGtJeg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=GJ+2cbp9poQRrJGgNk55dSebq0oXq4sKCJ2cl7QR+MEG9cuFrua3Af+0+gmJ8262f
	 otMb5PDI8bTk/9ocLrcE+DZwEnTtCXFQF2BsomM07SLWp46OiXm6F/kooHCE5Hen70
	 8omF1YPsYT5Ei6xARLJNeIPPhs1FMqyeC+PmtqK4=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 468FxrVM023160
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 8 Jul 2024 10:59:53 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 8
 Jul 2024 10:59:53 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 8 Jul 2024 10:59:53 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 468Fxqh9103605;
	Mon, 8 Jul 2024 10:59:53 -0500
From: Devarsh Thakkar <devarsht@ti.com>
To: <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sebastian.fricke@collabora.com>, <andriy.shevchenko@linux.intel.com>,
        <jani.nikula@intel.com>, <jirislaby@kernel.org>, <corbet@lwn.net>,
        <broonie@kernel.org>, <rdunlap@infradead.org>,
        <linux-doc@vger.kernel.org>
CC: <laurent.pinchart@ideasonboard.com>, <praneeth@ti.com>, <nm@ti.com>,
        <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
        <b-brnich@ti.com>, <detheridge@ti.com>, <p-mantena@ti.com>,
        <vijayp@ti.com>, <devarsht@ti.com>, <andi.shyti@linux.intel.com>,
        <nicolas@ndufresne.ca>, <davidgow@google.com>, <dlatypov@google.com>
Subject: [PATCH 6/6] media: imagination: Round to closest multiple for cropping region
Date: Mon, 8 Jul 2024 21:29:43 +0530
Message-ID: <20240708155943.2314427-7-devarsht@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20240708155943.2314427-1-devarsht@ti.com>
References: <20240708155943.2314427-1-devarsht@ti.com>
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


