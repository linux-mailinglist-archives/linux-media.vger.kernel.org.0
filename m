Return-Path: <linux-media+bounces-19221-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28517994692
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 13:22:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE1DC281416
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 11:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F05311D9A6A;
	Tue,  8 Oct 2024 11:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="5VJx59cB"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B801C1C9B99;
	Tue,  8 Oct 2024 11:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728386496; cv=none; b=FUZ5FDTgr/9FmKkK7SEqtWg9XxQfECMocIYsUTn5pZmrhkJ7KjiNKyEnCGtyJP/7VV/QRc3Crg5D5hBuXdMKRIec1MnipJileJKrOm7dL6mFuRJgSNW4QE0QmEMpVoP3H/1UMmVAkM7D25mDCYOd4GK1m552eUtF7x1LGze3KUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728386496; c=relaxed/simple;
	bh=fI+6MPwyx4b9buO6NMvRBRo+kQWzdSCqLxQO8KuhmUE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=gIJ253JFifs+NmExZgfBW8LJfOEYL94+9/n2yiKxFS6qmHNftuqfFQmUHmGifNvHLDf1Bg5UohId3mXlfRSYyr96OWAA9rDSFYL9hxOIgtQ8eKNKEH59Y5ng7u/iIb0Ou/cyC+CMZsG9Wf9cg4thBXSeqlRU0CeZ4yfz8UvJtpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=5VJx59cB; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 498AG3GD021588;
	Tue, 8 Oct 2024 13:21:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	AB65bYfD4fse86sQT6OQvWX1V25gZ71wskrQcCl81cE=; b=5VJx59cBywbvrF8U
	4IJF+XxzIj7/MdfGEu/lWpiXc1ywSjBCTfsf6BuyOwo+FMd4n9AKi1DLp03+dtvM
	0bDhPmOjpHKYw+4ysOiGQ36wJJXd8Mhut16HeYa5YCRQqrChvRvDNpbj+RROazY9
	YFrqw/WCAthIt5swyYytGZjYakfdPenTGa8lFz9Nql5bz9Jd61Aitoaa963ZlzDc
	l9cQG2/1joF85lPsI3lFBmidbsUSUUiyZly2FUWHT5zf64tVNuaZ2q6BrtxVSnti
	iQ60kevHY9T1DqESS8VTBjsg9yzZk16PpoNDRj/CZZqGBiHHsluuo0PWQPt6qms7
	PsWWsw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 422xv760qf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Oct 2024 13:21:20 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2534040046;
	Tue,  8 Oct 2024 13:20:15 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6879F285A07;
	Tue,  8 Oct 2024 13:18:20 +0200 (CEST)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 8 Oct
 2024 13:18:20 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 8 Oct 2024 13:18:13 +0200
Subject: [PATCH 11/15] media: stm32: dcmipp: fill media ctl hw_revision
 field
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241008-csi_dcmipp_mp25-v1-11-e3fd0ed54b31@foss.st.com>
References: <20241008-csi_dcmipp_mp25-v1-0-e3fd0ed54b31@foss.st.com>
In-Reply-To: <20241008-csi_dcmipp_mp25-v1-0-e3fd0ed54b31@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Hans Verkuil
	<hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Alain Volmat <alain.volmat@foss.st.com>
X-Mailer: b4 0.14.0
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

Add hw_revision field information of the media controller so that
application can distinguish between variants of DCMIPP implementations.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
index 50b9b964fbc4..d2cc19bb40d7 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
@@ -87,6 +87,7 @@ struct dcmipp_pipeline_config {
 	size_t num_ents;
 	const struct dcmipp_ent_link *links;
 	size_t num_links;
+	u32 hw_revision;
 };
 
 /* --------------------------------------------------------------------------
@@ -122,11 +123,13 @@ static const struct dcmipp_ent_link stm32mp13_ent_links[] = {
 			MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
 };
 
+#define DCMIPP_STM32MP13_VERR	0x10
 static const struct dcmipp_pipeline_config stm32mp13_pipe_cfg = {
 	.ents		= stm32mp13_ent_config,
 	.num_ents	= ARRAY_SIZE(stm32mp13_ent_config),
 	.links		= stm32mp13_ent_links,
-	.num_links	= ARRAY_SIZE(stm32mp13_ent_links)
+	.num_links	= ARRAY_SIZE(stm32mp13_ent_links),
+	.hw_revision	= DCMIPP_STM32MP13_VERR
 };
 
 #define LINK_FLAG_TO_STR(f) ((f) == 0 ? "" :\
@@ -496,6 +499,7 @@ static int dcmipp_probe(struct platform_device *pdev)
 	/* Initialize media device */
 	strscpy(dcmipp->mdev.model, DCMIPP_MDEV_MODEL_NAME,
 		sizeof(dcmipp->mdev.model));
+	dcmipp->mdev.hw_revision = pipe_cfg->hw_revision;
 	dcmipp->mdev.dev = &pdev->dev;
 	media_device_init(&dcmipp->mdev);
 

-- 
2.25.1


