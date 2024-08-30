Return-Path: <linux-media+bounces-17183-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6ACB965470
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 03:09:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 941A3285938
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 01:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34EFE225DA;
	Fri, 30 Aug 2024 01:09:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113AC1799D
	for <linux-media@vger.kernel.org>; Fri, 30 Aug 2024 01:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724980184; cv=none; b=LNU+uIj7qXSwHL/9zZaPXg01ztSM9NA1pPYcK6YzQ4ikn/wvxWI62693Yjr0LTORlTmUH2gtoJ9Z06L0KeYI9aJdVZ3vQU5KTfRM5NhwIEgHg2HQKa8GAUttsGsEKgngojKOey9WS3qgKgiAMLeZ3i/SOMl18m4sQjZ3zoXejkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724980184; c=relaxed/simple;
	bh=H9H3WUcsfbc6W3A7CWklkIegXpLk7srbziE63K+WdVk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HyJS5n9+jKFqP0LgOJm2eiFWe1SLZgoFBRmN320yPqzxzQsJj/XW3CBgbSaUTeqOqKZcUvXF7l9aHel2iFMPxKPdfvEI8EBUaGb2BQ586DQQ6aGFzsiMLcwKW6JybmItuoNjSv4Cfs8+pvoV4vhuibYsDDLOx+Pc9jUdaEjWQ90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Ww0PM5Nl3zLqxM;
	Fri, 30 Aug 2024 09:07:35 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id 6666C180105;
	Fri, 30 Aug 2024 09:09:40 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Fri, 30 Aug
 2024 09:09:39 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <hdegoede@redhat.com>, <mchehab@kernel.org>,
	<sakari.ailus@linux.intel.com>, <gregkh@linuxfoundation.org>,
	<topofeverest8848@gmail.com>, <hverkuil-cisco@xs4all.nl>,
	<andriy.shevchenko@linux.intel.com>
CC: <lizetao1@huawei.com>, <linux-media@vger.kernel.org>,
	<linux-staging@lists.linux.dev>
Subject: [PATCH -next 2/2] media: atomisp: use clamp() in compute_coring()
Date: Fri, 30 Aug 2024 09:17:52 +0800
Message-ID: <20240830011752.603433-3-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240830011752.603433-1-lizetao1@huawei.com>
References: <20240830011752.603433-1-lizetao1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemd500012.china.huawei.com (7.221.188.25)

When it needs to get a value within a certain interval, using clamp()
makes the code easier to understand than min(max()).

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 .../pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3.host.c   | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3.host.c
index 70132d955e9b..def2c8fb4b38 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3.host.c
@@ -108,7 +108,7 @@ compute_coring(int coring)
 	 * factor. Clip to [0, isp_scale-1).
 	 */
 	isp_coring = ((coring * isp_scale) + offset) / host_scale;
-	return min(max(isp_coring, 0), isp_scale - 1);
+	return clamp(isp_coring, 0, isp_scale - 1);
 }
 
 /*
@@ -168,15 +168,15 @@ ia_css_xnr3_encode(
 	to->alpha.y0 = alpha_y0;
 	to->alpha.u0 = alpha_u0;
 	to->alpha.v0 = alpha_v0;
-	to->alpha.ydiff = min(max(alpha_ydiff, min_diff), max_diff);
-	to->alpha.udiff = min(max(alpha_udiff, min_diff), max_diff);
-	to->alpha.vdiff = min(max(alpha_vdiff, min_diff), max_diff);
+	to->alpha.ydiff = clamp(alpha_ydiff, min_diff, max_diff);
+	to->alpha.udiff = clamp(alpha_udiff, min_diff, max_diff);
+	to->alpha.vdiff = clamp(alpha_vdiff, min_diff, max_diff);
 
 	/* coring parameters are expressed in q1.NN format */
 	to->coring.u0 = coring_u0;
 	to->coring.v0 = coring_v0;
-	to->coring.udiff = min(max(coring_udiff, min_diff), max_diff);
-	to->coring.vdiff = min(max(coring_vdiff, min_diff), max_diff);
+	to->coring.udiff = clamp(coring_udiff, min_diff, max_diff);
+	to->coring.vdiff = clamp(coring_vdiff, min_diff, max_diff);
 
 	/* blending strength is expressed in q1.NN format */
 	to->blending.strength = blending;
-- 
2.34.1


