Return-Path: <linux-media+bounces-23630-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F27D79F54FF
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 18:51:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD88116639C
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 17:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D8651FBE8F;
	Tue, 17 Dec 2024 17:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Ci9V3/1a"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184E01F9EAD;
	Tue, 17 Dec 2024 17:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734457315; cv=none; b=bXGrYgF/PjldnDVLzUbpmNuvPgJwUEXd4XsuLjK+Kp8L+6uxyIymrNqIuDxFBXsK/xgEQkw4oz6MvZJUbYNyLBfXFu6edUsrwjOhX2iUNO+V2hOdex2pqRrrzG6BWFS7O+ijS58VQJE1YYkMGDzXm0h6mi9HPB8o5BijEC5dmV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734457315; c=relaxed/simple;
	bh=F1aA4riXIv0Q9S4y2DrfhZV5JLe5bLPLHXIsUombDoU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=j4Y5gJZB1h40Xo17TL9ZuJEB1lrDznJTz2OjxD2QZ6eReTopkTIWFNJfVaBsrb5KRdFhV+yOvxMTaraohBzsc0VdOOkZM42inuUZsR/V0bidmL51hf3ILd9YvVL1RnZ/6MIaGEprVM9PDeHXNx2fr2hZryIuIG5gkvPXlqygB1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Ci9V3/1a; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHD9qtK008410;
	Tue, 17 Dec 2024 18:41:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	MFkZT8NHU7DNuo+LKqsiFwQWUamjVt47LLzELPbysck=; b=Ci9V3/1aAsAA7aIj
	aWxu5NZz8bLqUhpLOMlv5gk9mHTFYpWke9jxnLqKeQbRb46rDQdXB8cwfon2gcnz
	SS9iSoJvO+8bEsAbMyIlZ2gTw3PVt0Tz1pd2vTTEPwlzlVWh9sCxf88sTqDTJ+BW
	dnD/6yAbSqdULOvlPj2URfdeRsERpjKG9nIhrunq2WlEVBhPUDeoSvu5D3uM2Vgk
	v8TqKL37eObGhJm30Hiw8L29oLNgLGJDRSGSeBt4FwchJ7lQ5qOI/WcSPlolkDwM
	u4s4u3LWuLFEv5APdy93NRWm3JzUmID4hn2XOzI/rom/Azvsj1iz4zEjk6rsYqJx
	msNmvA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43k5h9jwaj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 18:41:40 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D403A4004B;
	Tue, 17 Dec 2024 18:40:18 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2CC8E284780;
	Tue, 17 Dec 2024 18:39:25 +0100 (CET)
Received: from localhost (10.252.23.235) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 17 Dec
 2024 18:39:24 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 17 Dec 2024 18:39:18 +0100
Subject: [PATCH 1/9] media: stm32: dcmipp: correct ret type in
 dcmipp_graph_notify_bound
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241217-csi_dcmipp_mp25_enhancements-v1-1-2b432805d17d@foss.st.com>
References: <20241217-csi_dcmipp_mp25_enhancements-v1-0-2b432805d17d@foss.st.com>
In-Reply-To: <20241217-csi_dcmipp_mp25_enhancements-v1-0-2b432805d17d@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Alain Volmat <alain.volmat@foss.st.com>,
        <stable@vger.kernel.org>
X-Mailer: b4 0.14.1
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

The ret variable used within the function dcmipp_graph_notify_bound is
wrongly defined as unsigned int while it can also be signed.

Fixes: 28e0f3772296 ("media: stm32-dcmipp: STM32 DCMIPP camera interface driver")
Cc: stable@vger.kernel.org
Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
index 71acf539e1f3..5a04018a6a9d 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
@@ -296,7 +296,7 @@ static int dcmipp_graph_notify_bound(struct v4l2_async_notifier *notifier,
 				     struct v4l2_async_connection *asd)
 {
 	struct dcmipp_device *dcmipp = notifier_to_dcmipp(notifier);
-	unsigned int ret;
+	int ret;
 	int src_pad, i;
 	struct dcmipp_ent_device *sink;
 	struct v4l2_fwnode_endpoint vep = { 0 };

-- 
2.34.1


