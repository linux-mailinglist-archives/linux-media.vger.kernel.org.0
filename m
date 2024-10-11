Return-Path: <linux-media+bounces-19424-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E102A99A5DF
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 16:11:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7C957B25446
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 14:10:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D94721A6F3;
	Fri, 11 Oct 2024 14:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NXNP08sf"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3871A219CB7;
	Fri, 11 Oct 2024 14:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728655821; cv=none; b=pPTyRokSj7RTCBq2uqTacYRpSVbC61xSGnjP0yC8+VcjsQ5nAcUYbqJ30BWdcelt8BW2LT8WOydC+wSnPaZROPFyVi5Y1GB6Sp6pbe3yU5OGr7yT/J7GlVNciNIE3J/dxXDkmXXjBOwC+TBIkpx+sDliaFRzalZUi+UVe+zSHn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728655821; c=relaxed/simple;
	bh=V4+aj5BFZILaxLqhLV2OEKBT7M+/SK0eHM6RQD60qbg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XYecsvotPoyR+DPYDRXbz1zQi/hL1XVyxqHo2aHdLUXFNwW7YcRYtyjdo9TkVV/C4Y738D74nMmVt9lcHwKxX1SizE9VBe449/ldxml4I9yLU7D6d+2YA0CtJdLSA7pG4SgcsdeAyTH2x4UirbYERsnCakrkEM2oIWPySKuGFUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NXNP08sf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49BAnUAf005437;
	Fri, 11 Oct 2024 14:10:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oCok2KEHfbpxPZ4SGuFSV2vqPH3+dUQoaWJsB9kcZjM=; b=NXNP08sfAnPi8Dr4
	lkvwQMaAmeQRngCGjg4QRkj6pmYnwzUdxvrqf8fFKLYliDIKVfwjTO+9qDnOGYZR
	bBLvuwTZPhcCtleLvoq7NBDIuVFuueyQOsgHI4EORdQXtGkCkBgrENuWSVBHX/cE
	2ZbLuXq9EsQolIFmEsByA+/jL3uP1Nn5nl98WproGaRdlLrHH5NqhNUViZuT1hlP
	nVMAwK20Fc5w7keIe6aMHntlOjCwTkpESbF0V8TrKUTdz1ga2VUjzVgDiVtjhXT+
	k+XauzFuWHOcKNZRtS+DqPCjniHAmwZxBeHBQ3/fF6okDueWQf26X4SvDqa94T86
	iQKn+w==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 426t7ssyhr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 14:10:09 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49BEA9ff010452
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 14:10:09 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 11 Oct 2024 07:10:00 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <akapatra@quicinc.com>, <hariramp@quicinc.com>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <hverkuil-cisco@xs4all.nl>, <cros-qcom-dts-watchers@chromium.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_vikramsa@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: [PATCH v3 2/8] media: dt-bindings: Add qcs6490-rb3gen2-vision-mezzanine
Date: Fri, 11 Oct 2024 19:39:26 +0530
Message-ID: <20241011140932.1744124-3-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241011140932.1744124-1-quic_vikramsa@quicinc.com>
References: <20241011140932.1744124-1-quic_vikramsa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: VDfP-o051O8Sier4kt4LaUrWPnbApQ6c
X-Proofpoint-ORIG-GUID: VDfP-o051O8Sier4kt4LaUrWPnbApQ6c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 mlxscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410110097

The qcs6490-rb3gen2-vision-mezzanine is a mezz on top of the
qcs6490-rb3gen2 core kit. The vision mezzanine includes the
IMX577 camera sensor.

Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 5de6290cd063..f00851f30d3e 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -390,6 +390,7 @@ properties:
               - fairphone,fp5
               - qcom,qcm6490-idp
               - qcom,qcs6490-rb3gen2
+              - qcom,qcs6490-rb3gen2-vision-mezzanine
               - shift,otter
           - const: qcom,qcm6490
 
-- 
2.25.1


