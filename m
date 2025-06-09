Return-Path: <linux-media+bounces-34354-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FEDAD2012
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 15:52:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80802188285E
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 13:50:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7F1F25E80A;
	Mon,  9 Jun 2025 13:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="zhzuFU7k"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406A025D21A;
	Mon,  9 Jun 2025 13:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749476910; cv=none; b=YuLe/ZI1dsUda5+eYCOpN3k8z2FXGX62w+t7U2wFkWCdatSY/zxURDoWnVBkbPryGhIt/eNraz+ygMnAvrOm3KlELTGkU7pEjx8U9wLrleWMs7MT/LKuYBoYSkuzFunocfKichc10B3JFoSV0Hg98ukJHg30Hfs3KqhrXOOOEW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749476910; c=relaxed/simple;
	bh=VMYrJDafF5OYattdOH+NYiw7BERRPtB/um/U7aXkiu4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Xb+hfxzZ7WnwQkHq1rvD9TY3ZN6OoYX/MqQn3AQbUrfLu59sRQyoVp/4jaDIy7maaPwF1MvLMAnSHC4oibxptQhQCpV/y0v0PBxMTGeO06BgII7QVbQdxqs+/WHxk3bqsZukY43KySul31Bknv7txXJb72BBDXl4Tihq1zbEqvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=zhzuFU7k; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559D4TBZ007780;
	Mon, 9 Jun 2025 15:48:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	RzE1e6EzYiHk2X115/bXaks6vvWMqIzMCFxDp2t9+Qo=; b=zhzuFU7keBpsx5Gr
	7vq05eZ9jh/2Ip/wT93HDHi/yVUbxECbScQ8n6CtP6s3VMWT1+/V4YlH/IFDfYtn
	MeJzgy1GeeYdVclYuA5WWccg4WtwDBNZwCoqrPizOGtT/OySUPtefVpk+ab/1u0Z
	BlHHLmshNpP4ckTpO+8s7EZQtFD6N6Xas2GzUclfYgiLIcoAndmtliOIPvOeC+yj
	hmF0Ikf5nDhxziYIy7bOQq5mkerZlqm04OHOEfzjm2fdZ+uMyhUOFxJ4SRawFoJy
	Yhsi48Q31pLhdEI/eMZ+yGqe2DImKB92wzJMv75l3KvGlJkRqwnGp35ZbuZUbGpS
	jfbZ+A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474y04wd9e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Jun 2025 15:48:13 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 20A36400C9;
	Mon,  9 Jun 2025 15:47:20 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B35EEB9F165;
	Mon,  9 Jun 2025 15:46:30 +0200 (CEST)
Received: from localhost (10.130.73.167) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 9 Jun
 2025 15:46:30 +0200
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Date: Mon, 9 Jun 2025 15:46:21 +0200
Subject: [PATCH 1/4] media: i2c: vd55g1: Fix RATE macros not being
 expressed in bps
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250609-fix_vd55g1-v1-1-594f1134e3fb@foss.st.com>
References: <20250609-fix_vd55g1-v1-0-594f1134e3fb@foss.st.com>
In-Reply-To: <20250609-fix_vd55g1-v1-0-594f1134e3fb@foss.st.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Sylvain Petinot
	<sylvain.petinot@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Benjamin
 Mugnier <benjamin.mugnier@foss.st.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-09_01,2025-03-28_01

Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
---
 drivers/media/i2c/vd55g1.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
index 25e2fc88a0367bf6a28bb22d209323ace99299f2..78dd22d9cab03edf4ff3e5a301f8d045e930c997 100644
--- a/drivers/media/i2c/vd55g1.c
+++ b/drivers/media/i2c/vd55g1.c
@@ -129,8 +129,8 @@
 #define VD55G1_FWPATCH_REVISION_MINOR			9
 #define VD55G1_XCLK_FREQ_MIN				(6 * HZ_PER_MHZ)
 #define VD55G1_XCLK_FREQ_MAX				(27 * HZ_PER_MHZ)
-#define VD55G1_MIPI_RATE_MIN				(250 * HZ_PER_MHZ)
-#define VD55G1_MIPI_RATE_MAX				(1200 * HZ_PER_MHZ)
+#define VD55G1_MIPI_RATE_MIN				(250 * MEGA)
+#define VD55G1_MIPI_RATE_MAX				(1200 * MEGA)
 
 static const u8 patch_array[] = {
 	0x44, 0x03, 0x09, 0x02, 0xe6, 0x01, 0x42, 0x00, 0xea, 0x01, 0x42, 0x00,

-- 
2.25.1


