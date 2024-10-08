Return-Path: <linux-media+bounces-19232-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AF69946B3
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 13:24:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 544A01C22632
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 11:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A93F61DF97B;
	Tue,  8 Oct 2024 11:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="iV3mRigt"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1341D358F;
	Tue,  8 Oct 2024 11:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728386514; cv=none; b=cKRItoImAHibEzfT6ocYcWMSdSyLWXieCtAY1wkqNWV7Wd7rba+XtW0BmWRLya+lrh2eLTFELWEne+4nATh65RGV9Pb2plsNzDN85ePnXEkSeHIEhskqxNhX6UfXsLV7FIQbHi7DZGeSl6E4NnzGhr9SrUNBghM1JgdO1ySlEhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728386514; c=relaxed/simple;
	bh=knezES83IUG9tcwAm074qKW1vrkD2U0dqQQR5JUXp3Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=OVCkXLKEiVSsCYNz45t86IZPDWSKhCRGKYpv8YZqRxBweqT2vrX9jfSB5ZUULW8Obs5jRkey6CZ3wsavEoyyXYDjvlTrl1e2s1xQUPggBlsWZdEC8ZDKrzzF38IuhTTxBt5YPSdHRCJYwjFFS1Z9REgf0yq9fMuQIrAuah/n62I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=iV3mRigt; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4989HT5Z006696;
	Tue, 8 Oct 2024 13:21:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	XqYUBtVywuvcRxe/93cJm9jMm8tmQQnRBxjeCA93+qc=; b=iV3mRigtzgGokWH+
	xzC5IUBThAAbJWqaAgNXrdbhvRm3EkPe3tD1jyOTenjOj1oT8yJq3oatwtKrZsZD
	aUTkRkXfxU+LLWwF9U9nYU5cRBnyjnw1EGXR28WxVRzDWBoCZR4nVeE/AoLMSCGU
	O3W5Sjvm+ldyR3u3UVRusn2ZTtzh9kC9vKTfa6UVQlFT2ARAcYobsSFRw9fmPJaB
	KQzXeK3SqGFBii5qcW3migXYHrt311v5TsYFmiLui7pcM96v/OYEEolwnxOL1LBr
	Dcy6bgHDDC3CsmG/Nqel+Jedfp3VEY7MPtn+UHjLIMO3wyMW2kH/aoQ3rihFqTyE
	JqHNUQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 422xs1dyn2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Oct 2024 13:21:40 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D86F640058;
	Tue,  8 Oct 2024 13:20:15 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CC73628519F;
	Tue,  8 Oct 2024 13:18:19 +0200 (CEST)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 8 Oct
 2024 13:18:19 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 8 Oct 2024 13:18:12 +0200
Subject: [PATCH 10/15] media: stm32: dcmipp: avoid duplicated format on
 enum in bytecap
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241008-csi_dcmipp_mp25-v1-10-e3fd0ed54b31@foss.st.com>
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

Avoid duplication of enumerated pixelformat on the bytecap
video capture device.  Indeed, since the bytecap format list
contains both CSI & parallel 16bits formats, ensure that same
pixelformat are not reported twice when performing enumeration
of supported formats.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 .../st/stm32/stm32-dcmipp/dcmipp-bytecap.c         | 42 +++++++++++-----------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
index 99732d19dc4d..8f5f69a3afc4 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
@@ -268,34 +268,34 @@ static int dcmipp_bytecap_enum_fmt_vid_cap(struct file *file, void *priv,
 {
 	const struct dcmipp_bytecap_pix_map *vpix;
 	unsigned int index = f->index;
-	unsigned int i;
+	unsigned int i, prev_pixelformat = 0;
 
-	if (f->mbus_code) {
-		/*
-		 * If a media bus code is specified, only enumerate formats
-		 * compatible with it.
-		 */
-		for (i = 0; i < ARRAY_SIZE(dcmipp_bytecap_pix_map_list); i++) {
-			vpix = &dcmipp_bytecap_pix_map_list[i];
-			if (vpix->code != f->mbus_code)
-				continue;
+	/*
+	 * List up all formats (or only ones matching f->mbus_code), taking
+	 * care of removing duplicated entries (due to support of both
+	 * parallel & csi 16 bits formats
+	 */
+	for (i = 0; i < ARRAY_SIZE(dcmipp_bytecap_pix_map_list); i++) {
+		vpix = &dcmipp_bytecap_pix_map_list[i];
+		/* Skip formats not matching requested mbus code */
+		if (f->mbus_code && vpix->code != f->mbus_code)
+			continue;
 
-			if (index == 0)
-				break;
+		/* Skip duplicated pixelformat */
+		if (vpix->pixelformat == prev_pixelformat)
+			continue;
 
-			index--;
-		}
+		prev_pixelformat = vpix->pixelformat;
 
-		if (i == ARRAY_SIZE(dcmipp_bytecap_pix_map_list))
-			return -EINVAL;
-	} else {
-		/* Otherwise, enumerate all formats. */
-		if (f->index >= ARRAY_SIZE(dcmipp_bytecap_pix_map_list))
-			return -EINVAL;
+		if (index == 0)
+			break;
 
-		vpix = &dcmipp_bytecap_pix_map_list[f->index];
+		index--;
 	}
 
+	if (i == ARRAY_SIZE(dcmipp_bytecap_pix_map_list))
+		return -EINVAL;
+
 	f->pixelformat = vpix->pixelformat;
 
 	return 0;

-- 
2.25.1


