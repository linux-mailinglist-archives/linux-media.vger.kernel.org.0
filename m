Return-Path: <linux-media+bounces-23316-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 853D39EE607
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 13:02:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 52A3F18891C4
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 12:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F3132288D2;
	Thu, 12 Dec 2024 11:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kC/Cdf9E"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D252288D7;
	Thu, 12 Dec 2024 11:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734004481; cv=none; b=nANq1FTj0rfUrP5lbwGfQQhXZcGmCAsBp2bRIM2rd/vMOtBf0Vt2Dbd9sALV2gSJw9pynoKHAc4qMcumSYvMjtEbNP48HDkW7i8pxyADyyijsI7xaE5vBUeckyUMkad1vogD0NptLOShOUcbOJC/DYJZQvvFXCv7Mfk/3vtUQjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734004481; c=relaxed/simple;
	bh=eBDCmwdTlXTC+Y75lnbN1GwoIQfWXW30Wh8n3LyP5LY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=PXZuVhUND/hNV5KXeCSXCPFe2rAAcQLBYxujjTclla5IaEh/Nb9BlP7Gldf56Y9BvUlXzvfVeJor9nPP9E1A+GRoFjdsxgGePt7ZJHqkTUPMwnGjJX+4qultA1ftbBgzdg2buftTmDmxptf+b5ZJbBeeNVYMEfOiLyex/1Ivf5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kC/Cdf9E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC9kebe030335;
	Thu, 12 Dec 2024 11:54:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qKyle8CboRI0DuxQ27HpURO0p2KYcGXK7AMIj50d4Ao=; b=kC/Cdf9E+J2rFvTn
	w3BnWdj6QzEf0us6xsU2DS0apD9MiTOCtnT+PlEPPaWIGvH4FKUqwe0S2A4ofFYf
	gTpg1eMYnn0N8AyMAYRWA/QV0r/+QiMLxf+uzdu+GrpiwlVDBTioLV9/0oXvKvR9
	MLzlp5/h0Uz0thym4xVWyqC18aml1ajB40Sn583MKKfFmsZOg5DcpI6B6Bks2Zp2
	xqhFbGN6uIPnhX8GDs4Ept9N6BMTVcVaVQaYcdvBMcYbFzs6WxtXImQrR5s+tvH5
	qex4gxluNMsD3pnC85QSu5TDd7FEb7+/W54NtKCKaOEQGwIHRgA5iPhGTbYa6eXI
	2snDJg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fwgegajr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 11:54:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BCBsVkC016357
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 11:54:31 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 12 Dec 2024 03:54:25 -0800
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Thu, 12 Dec 2024 17:21:50 +0530
Subject: [PATCH v9 28/28] media: MAINTAINERS: add Qualcomm iris video
 accelerator driver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241212-qcom-video-iris-v9-28-e8c2c6bd4041@quicinc.com>
References: <20241212-qcom-video-iris-v9-0-e8c2c6bd4041@quicinc.com>
In-Reply-To: <20241212-qcom-video-iris-v9-0-e8c2c6bd4041@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: Hans Verkuil <hverkuil@xs4all.nl>,
        Sebastian Fricke
	<sebastian.fricke@collabora.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Nicolas Dufresne
	<nicolas@ndufresne.ca>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>,
        Jianhua Lu <lujianhua000@gmail.com>,
        "Stefan
 Schmidt" <stefan.schmidt@linaro.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734004294; l=1189;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=eBDCmwdTlXTC+Y75lnbN1GwoIQfWXW30Wh8n3LyP5LY=;
 b=w3Til+uTOSVuEDrFEnaPWgrypu++Br+rDGSeaE2IjkYw8eGAdFaOWNePLhwa+QgtR/HEwrtbE
 TjWX5Iaby4VD2c+ueQFaiPaO3ErSWyrXWpfQqtpNOiU0XjLom9S7vOA
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 08B-7BiGj9UICbbncfURxwQy4uVx25u2
X-Proofpoint-ORIG-GUID: 08B-7BiGj9UICbbncfURxwQy4uVx25u2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 bulkscore=0 mlxlogscore=978 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120085

Add an entry for iris video decoder accelerator driver.

Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Tested-by: Stefan Schmidt <stefan.schmidt@linaro.org> # x1e80100 (Dell
Reviewed-by: Stefan Schmidt <stefan.schmidt@linaro.org>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7a14891a8fa9..d647e59d9912 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19156,6 +19156,16 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/regulator/vqmmc-ipq4019-regulator.yaml
 F:	drivers/regulator/vqmmc-ipq4019-regulator.c
 
+QUALCOMM IRIS VIDEO ACCELERATOR DRIVER
+M:	Vikash Garodia <quic_vgarodia@quicinc.com>
+M:	Dikshita Agarwal <quic_dikshita@quicinc.com>
+R:	Abhinav Kumar <quic_abhinavk@quicinc.com>
+L:	linux-media@vger.kernel.org
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/qcom,*-iris.yaml
+F:	drivers/media/platform/qcom/iris/
+
 QUALCOMM NAND CONTROLLER DRIVER
 M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
 L:	linux-mtd@lists.infradead.org

-- 
2.34.1


