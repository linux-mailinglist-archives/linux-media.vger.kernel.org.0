Return-Path: <linux-media+bounces-11298-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A838C1FDD
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 10:38:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B69D1F2224B
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 08:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D71A814B95F;
	Fri, 10 May 2024 08:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="g+QSTavH"
X-Original-To: linux-media@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A5410A3E;
	Fri, 10 May 2024 08:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715330277; cv=none; b=W+yBCc6a5tH6oPEA6nOMsA7HOP4VAYR17/1l6mHQZ/DXUmz1KiWcE/kc8LNVLxJ13WKmAI6cSVerGznWSoKrMqkIOez4lPJGQ+baKR3OfRQhnwQwlcAzoL4wo9C9DYx8+/U/hG2oZmVA/8nn1jxk9R9W6GPZAo/9IWnBVUNJipI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715330277; c=relaxed/simple;
	bh=LnGsKCLtG4HWV/QhMgM9/90EbCEjqHlXW0pCCjWpP/0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o6Kn4g6JZThKGTbKt7AtKaTgm1RHGBy6VXSYPtKnHdSwC3bjnIwgoQzTMSG8Y/1/nXXxhk84jUhypcbaQA9RMn+AkKccPgdYDcEbn5xoM8zlzARsBmATVQttdN38eI8jSZfUpvbdzoCdjTBVdkQQc5s31dqoePUilTWwJE1gnLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=g+QSTavH; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44A8bg35050651;
	Fri, 10 May 2024 03:37:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1715330262;
	bh=6QVqq24uwbSeQ4NfbKqiY+EtSE8IhElBvO4qm2S3v2s=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=g+QSTavHcWEIH6fPtcwj3svXG47fIMkykQVpNTX6EohCRy81FvklQvn8OD8IDZZ/Z
	 BR1Y0NQXuUVMn5NihvdMatxLe7gGB2UTnW8dDjvWj/dKihf7zS2UtxrkO84UH6M3eC
	 Rfg4zbvKsGhWk8J10tf4McF0CqXT7tyEiURmwfgE=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44A8bgA5019755
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 May 2024 03:37:42 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 10
 May 2024 03:37:42 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 10 May 2024 03:37:42 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44A8bf0o107288;
	Fri, 10 May 2024 03:37:42 -0500
From: Devarsh Thakkar <devarsht@ti.com>
To: <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <benjamin.gaignard@collabora.com>, <sebastian.fricke@collabora.com>,
        <dri-devel@lists.freedesktop.org>
CC: <laurent.pinchart@ideasonboard.com>, <praneeth@ti.com>, <nm@ti.com>,
        <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
        <b-brnich@ti.com>, <detheridge@ti.com>, <p-mantena@ti.com>,
        <vijayp@ti.com>, <devarsht@ti.com>, <andrzej.p@collabora.com>,
        <nicolas@ndufresne.ca>, <p.zabel@pengutronix.de>, <airlied@gmail.com>,
        <daniel@ffwll.ch>, <akpm@linux-foundation.org>,
        <gregkh@linuxfoundation.org>, <andriy.shevchenko@linux.intel.com>,
        <adobriyan@gmail.com>, <jani.nikula@intel.com>
Subject: [PATCH RESEND v7 7/8] media: imagination: Round to closest multiple for cropping region
Date: Fri, 10 May 2024 14:07:41 +0530
Message-ID: <20240510083741.1282823-1-devarsht@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20240510082603.1263256-1>
References: <20240510082603.1263256-1>
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

Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
---
V1->V6 (No change, patch introduced in V7)
---
 drivers/media/platform/imagination/e5010-jpeg-enc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/imagination/e5010-jpeg-enc.c b/drivers/media/platform/imagination/e5010-jpeg-enc.c
index 189e2a99c43d..abd66bc9b96c 100644
--- a/drivers/media/platform/imagination/e5010-jpeg-enc.c
+++ b/drivers/media/platform/imagination/e5010-jpeg-enc.c
@@ -517,10 +517,10 @@ static int e5010_s_selection(struct file *file, void *fh, struct v4l2_selection
 
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


