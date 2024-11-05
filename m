Return-Path: <linux-media+bounces-20874-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4669BC778
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 08:54:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6267E1F22D4F
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 07:54:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2C081FF050;
	Tue,  5 Nov 2024 07:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="SQSUSbUM"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2DC1FEFC5;
	Tue,  5 Nov 2024 07:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730793161; cv=none; b=p+pfg7bthwNYhnLPvb8JosIwP9egxRLPXybpjTRYax15Gl+eXD+lItvawU8wkuo/BtpgDJLyFET9SCu/8Nxvg8tSVed2fNuKa/pn6KTgD/r9YlMZS0BY6KJUtxGLq6hU1rIVdMmfq6Zct21gs7ytCIYlJQVCKktRCAzBmDfpMNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730793161; c=relaxed/simple;
	bh=GOKG+WYlTeedFL3kFxhYDlA0nfvxaCGr7DSSSCv1Y2E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=fqCxX93/lI141IvLs2CedqMFV4WAkOCbEa3EaY4RjZcvOcoROfJchI46JNicKzJtduCm4BpRk2klySFOt5zrVQP+2ah+w6pycxYvQelF9aJixeYG+JfDoZ1lPII98Lw1ZED7sBMsqJOgQfEvBhCaQXWw6HvmWFxyQMjBIPpsqvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=SQSUSbUM; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A53GSeY022439;
	Tue, 5 Nov 2024 08:52:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	UMjisKeEpQSwI1Wvbjb6PN1AjDm43YkTXsgIuNYi82g=; b=SQSUSbUM2zkhZuws
	PBy6S0AJewSp/6u3emy5wgWhSViEBlty0Wa9jCWGWeq3OnZTW+yDBQa5tdKRad+t
	nhL/+BPn1tfwKUS9wVq7Z+5WnGo4lsSqpD1NX63G9FiXDzUIM61z8YTkdYksIgxp
	MISSsopE+EBSc3bAYEArY8UYMiMf5UvK1byNc2zszl27ZiLCo9bvqkgIN/yiD0J5
	DACOi5g36lZdDhU94mHYSYg2nhnO4ja2nWUQ3sxfW3VR6DWCJDKln4ohFJTLLcJ0
	dT6WFF2mrB96vHBBXa5bRk/2av2m0Esa5r/tKbmUHE6V4uR2c6DnKLjO24EBt/UZ
	kA2+bQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42nxh3rnmj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 08:52:27 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D735C40052;
	Tue,  5 Nov 2024 08:50:26 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2DBCA250FA5;
	Tue,  5 Nov 2024 08:49:35 +0100 (CET)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 5 Nov
 2024 08:49:34 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 5 Nov 2024 08:49:14 +0100
Subject: [PATCH v2 11/15] media: stm32: dcmipp: fill media ctl hw_revision
 field
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241105-csi_dcmipp_mp25-v2-11-b9fc8a7273c2@foss.st.com>
References: <20241105-csi_dcmipp_mp25-v2-0-b9fc8a7273c2@foss.st.com>
In-Reply-To: <20241105-csi_dcmipp_mp25-v2-0-b9fc8a7273c2@foss.st.com>
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
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
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
index 50b9b964fbc4674b870189736a49f1d6a02b2503..d2cc19bb40d77f67a1f5fe565bc62f45eff2d266 100644
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


