Return-Path: <linux-media+bounces-11244-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 421418C14EE
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 20:41:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 736CA1C21015
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 18:41:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A4E177113;
	Thu,  9 May 2024 18:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="l4O12OvF"
X-Original-To: linux-media@vger.kernel.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624EE7F464;
	Thu,  9 May 2024 18:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715280025; cv=none; b=Mnip7EOASOJopHr8stijz/z4x4YmwNy4AZEGea1vZALcQOyfK7JlqMcG9h6EtSCJDb3QFMMsJNyDLePmdsJ79ACuErrbtKf3qlTUf9Nn7JnXKWnUPhOJ4TzaCjosgH4tCwrImj+FLn2f2QYbK6YVwq0NMLxH0JfolA0LDyzPc+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715280025; c=relaxed/simple;
	bh=KyiYvMhETDO/noTBCSz8ORoc9EKNT/4TwTv3zc5evPk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Rwygd8pF3vNpqomGhsNYqFStct5H3ysvUbCxy1Pp5NvY2XmSMvLKqpndSBNIxQmtRChmocjO8D4szNJ/gCTOSErJVaIQS9FYly1V5AhaUVuBlxFSrJuv+qfS35qWMEDFPKnGeXxrO/Cfq1n8+ozOAg+UGGSknvRuIAqtVj9exSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=l4O12OvF; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 449IeCwH059877;
	Thu, 9 May 2024 13:40:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1715280012;
	bh=aMNcaysqDJDn+h1D5ugEv/Q4TocmhRT2g7o4pHDXixo=;
	h=From:To:CC:Subject:Date;
	b=l4O12OvFcUPsy8dMLaXN0DGXhKBtkvcCCBIzSVNQLeejlbIbypSyde7w63neEf3UN
	 w8MuW4kx4Bvg2A6JnMhOxMW/tk0DZ/P/iDeniKChGtU4oLrfrUPp5ZZqdiH09HpsmK
	 2Wu9xoAL9qCQSQ27Y3i16FP+nfurCTA7iEAc1254=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 449IeCLN070670
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 9 May 2024 13:40:12 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 9
 May 2024 13:40:11 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 9 May 2024 13:40:11 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 449IeBEc006178;
	Thu, 9 May 2024 13:40:11 -0500
From: Devarsh Thakkar <devarsht@ti.com>
To: <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <benjamin.gaignard@collabora.com>, <sebastian.fricke@collabora.com>,
        <p.zabel@pengutronix.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
        <dri-devel@lists.freedesktop.org>
CC: <laurent.pinchart@ideasonboard.com>, <praneeth@ti.com>, <nm@ti.com>,
        <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
        <b-brnich@ti.com>, <detheridge@ti.com>, <p-mantena@ti.com>,
        <vijayp@ti.com>, <devarsht@ti.com>, <andrzej.p@collabora.com>,
        <nicolas@ndufresne.ca>, <akpm@linux-foundation.org>,
        <gregkh@linuxfoundation.org>, <andriy.shevchenko@linux.intel.com>,
        <adobriyan@gmail.com>, <jani.nikula@intel.com>
Subject: [PATCH v7 8/8] gpu: ipu-v3: Use generic macro for rounding to nearest multiple
Date: Fri, 10 May 2024 00:10:10 +0530
Message-ID: <20240509184010.4065359-1-devarsht@ti.com>
X-Mailer: git-send-email 2.39.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Use generic macro round_closest_up for rounding to nearest multiple instead
of using local function.

Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
---
V1->V6 (No change, patch introduced in V7)
---
 drivers/gpu/ipu-v3/ipu-image-convert.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/ipu-v3/ipu-image-convert.c b/drivers/gpu/ipu-v3/ipu-image-convert.c
index 841316582ea9..5192a8b5c02c 100644
--- a/drivers/gpu/ipu-v3/ipu-image-convert.c
+++ b/drivers/gpu/ipu-v3/ipu-image-convert.c
@@ -477,8 +477,6 @@ static int calc_image_resize_coefficients(struct ipu_image_convert_ctx *ctx,
 	return 0;
 }
 
-#define round_closest(x, y) round_down((x) + (y)/2, (y))
-
 /*
  * Find the best aligned seam position for the given column / row index.
  * Rotation and image offsets are out of scope.
@@ -565,7 +563,7 @@ static void find_best_seam(struct ipu_image_convert_ctx *ctx,
 		 * The closest input sample position that we could actually
 		 * start the input tile at, 19.13 fixed point.
 		 */
-		in_pos_aligned = round_closest(in_pos, 8192U * in_align);
+		in_pos_aligned = round_closest_up(in_pos, 8192U * in_align);
 		/* Convert 19.13 fixed point to integer */
 		in_pos_rounded = in_pos_aligned / 8192U;
 
-- 
2.39.1


