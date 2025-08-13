Return-Path: <linux-media+bounces-39722-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 05277B24061
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 07:40:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56E677AF4DC
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 05:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8A782C326D;
	Wed, 13 Aug 2025 05:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hOdICp6z"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F032C17A3;
	Wed, 13 Aug 2025 05:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755063515; cv=none; b=lquGrLlwRWo2jh5CATMEJ1gJWOd/tpHOEhamI/wiVQGqmFbPGpeNki2ye88+0GNK4LlClPnxJBMknbjb8+AFenBfQus7dUqf0nQM0zJ9dFaWYs4S9id3iTdwQL40H/gpVD6X19eW0wEBwkqU54UCMSZDXtU0TfUCTkViiVi+i6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755063515; c=relaxed/simple;
	bh=HqaUDcCVJt6Gxb0bVWilSWqUWPnpPgBm4kF9+H8qExU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cKyT1IPWTfghcEYl1dmwGxesV1v+X39o8aCgQDLXn3+A2xCnOWrn3B1CMAEfwI+7MdkGgc+tmFKnJjFNXhUy571AzBQB13pMRV9PRvPnekwUznGpiRQjuD126+mNBxBI7dwJF0wdO1DwR4UrE3U2kfUiJY8HQibxCZ7UYC14lo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hOdICp6z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D3o4cv022391;
	Wed, 13 Aug 2025 05:38:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rIsk7bFT0PQfbbPX5ez5s+X0vx+VjCm7K4HT/zCa7U4=; b=hOdICp6zL7zgmkEj
	lK+5rfXpdavt/FVpvRbG2BIE2H79yiHGGxUbytEQQw19PGH7vJXWlXk9Cfd+TqLo
	WT4dsBVuRw+JpyUj0LjayjNVB6Kz0o8X5ubpi5Pn6VQ78eensdCRgMOOmJ065Luh
	rttLJadWBGBBDQ+0bUOfZxpLMgmZQPULHwWPNRd6O2710+BK0E99gwrpfBA91xOU
	SPyT7mYprIP3IdizCF4i7cIR+xAcSCjuUqwQ+Ayt+3Wkf5h+WqqqhAEAtwEM7Orq
	oDr0asm+TYE+dTrLpJJziaYBGC0KzQnEXzY/MPDfcDVU4mnFoq3eqcY8z7b2KkFS
	uYA7zA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxdv2hk0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 05:38:24 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57D5cNM8025621
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 05:38:23 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 12 Aug 2025 22:38:18 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_vikramsa@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 4/7] media: qcom: camss: enable csid 690 for qcs8300
Date: Wed, 13 Aug 2025 11:07:21 +0530
Message-ID: <20250813053724.232494-5-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250813053724.232494-1-quic_vikramsa@quicinc.com>
References: <20250813053724.232494-1-quic_vikramsa@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=689c24d0 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=U-p9drRfr8RQgJDSKZ8A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: eF6lv80CF4cQe0H3AvkQRZFVmcj0jp_a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfXwlYZ+ahMbinP
 J8nhDc483FTH3aZdwO45WLpCYGUoUrHH75nqsebBJcQMCyINzEm/t7mRMVEs3m3KfTKGscTPrDv
 cXU+Ufg3F37z4FU28xjGwPh1XiaDKGJ6wcJxf7RAhElDkf9Kt7IFFGB9wwYD+KPIo8YnoGOJfAg
 qMnkQgIXIpc5BinL7dEJhKi//vRjj8LSZxI24hf4zBXsJ1phkAjNZjhmpIFR/Fv83tHmzhkllq9
 PlwDS9VAX9b8FxCbuT5gYkDfxKfgUm1iBMo1kR7+y6ji6vsdwpkjMlVdb6sZxDZVE9m4G/LVbmx
 lFwapJ6VGv6oc0UfflJAwZKpjUBgEPZRGPLoav/KW1V6BswXJ+Re9ItQE6KAM3Y5pTgUpolEmc5
 vW1lAWRY
X-Proofpoint-GUID: eF6lv80CF4cQe0H3AvkQRZFVmcj0jp_a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025

The CSID in qcs8300 is version 690, it is same as csid used in
lemans(sa8775p). csid gen3 have support for csid 690.

Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 drivers/media/platform/qcom/camss/camss-csid-gen3.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
index fc6a9787febe..664245cf6eb0 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
@@ -45,7 +45,8 @@
 #define CSID_CSI2_RX_IRQ_CLEAR		0xA4
 #define CSID_CSI2_RX_IRQ_SET		0xA8
 
-#define IS_CSID_690(csid)	(csid->camss->res->version == CAMSS_8775P)
+#define IS_CSID_690(csid)	((csid->camss->res->version == CAMSS_8775P) \
+				 || (csid->camss->res->version == CAMSS_8300))
 #define CSID_BUF_DONE_IRQ_STATUS	0x8C
 #define BUF_DONE_IRQ_STATUS_RDI_OFFSET  (csid_is_lite(csid) ?\
 						1 : (IS_CSID_690(csid) ?\
-- 
2.25.1


