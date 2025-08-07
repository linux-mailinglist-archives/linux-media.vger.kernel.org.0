Return-Path: <linux-media+bounces-39046-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F01B1D76F
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 14:14:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23D8B7E006A
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 12:13:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2416525A347;
	Thu,  7 Aug 2025 12:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="G9OJuT0P"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1A424337B;
	Thu,  7 Aug 2025 12:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754568742; cv=none; b=qobWDZhJdB9M7omYQL+O85r+61X8CP3zXSAPqirltJPPbTcqhoHcmx6shp4iGbsMhgIftt+D0ayPcgY76jSObG+DDr2UolvaAJwSgM94Q/mmTohXw6VHuGkVjXze2mpWquUIxzR4wkGXrOsE2EIcOoLNkXmvomRMJhEWGRTF3HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754568742; c=relaxed/simple;
	bh=CVdIPNP64ljAWGPQF8+rk6+oUs+sw84U/Lmh/9hp6Uc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TvhGBa+0nx8jaRGoef5R1CzCHDJtYSYH+xFPeRDgnULmN11wHsWwqq0DcYD7NyiluSDR57Ya2S/l7HDYzyKryzOnrCOwus4B4zpTSAo4zmMNNQCYawEP2bE0OtIchhms24ivRRfp5ekHdiB/7US30lEBL2G3kEErc1o0xFUnhX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=G9OJuT0P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5779D1s5022553;
	Thu, 7 Aug 2025 12:12:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w4ijHQo2kkVEZ396tAKTupRykvweGenr6CQ+Be4pbQc=; b=G9OJuT0PmCsJO2lN
	uVSik4tajG6SvTEOAvWY10vS+hluvArOEh7euKDAr0qBFxsXe2IF6mNelbjT01UF
	9R/0wEhVx8c4WAtHpm7UjoFQzHdG8n82u1OidGdWuJdM8CRWRejUtGKdQLBjfd4C
	eDRhR4VS+Ah62dKVmptnxeQq7AcYBAI3nlP9Mrn2ufbc3/+OpjIvFOF/5QFXTAS7
	c6ANmOkmihcJG9r5ww0yxChck3t836zyswnJXgy/6hqm+gAwTV27JAINiISGx9hj
	90jDaIL/lTvwFml7dpKLNks8IJUFP2kPOCMrup+RFH60O3W4SaAxwsIkBUyuxNmb
	Jyn5hQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48cs5n8fpt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Aug 2025 12:12:10 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 577CC9Cp024827
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 7 Aug 2025 12:12:09 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 7 Aug 2025 05:12:04 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_svankada@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 8/9] media: qcom: camss: Enumerate resources for SA8775P
Date: Thu, 7 Aug 2025 17:41:04 +0530
Message-ID: <20250807121105.710072-9-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250807121105.710072-1-quic_vikramsa@quicinc.com>
References: <20250807121105.710072-1-quic_vikramsa@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=Q+XS452a c=1 sm=1 tr=0 ts=6894981a cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=SWFg1dtF3-VgytXPzhIA:9 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: AM4JwCImmzz1DQYJgZKYrOCC9DwuJwNA
X-Proofpoint-ORIG-GUID: AM4JwCImmzz1DQYJgZKYrOCC9DwuJwNA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA3MDA2OSBTYWx0ZWRfX27ZbXnLADTWr
 djYCrtZZENQ4Z3eqgeE7LbAKrGH9hbGCPG5mn4R6MFud6fFRcIgGZDShsNKC7KcgQOTl33AqsXO
 J0tO2Ob9sM+Y9M4huiZAmyfVRtEXYdIdSL+sofP3eBZyDNrFPjkenoFfDSWUw1A+tIyViWOviLH
 2ykWmuFDDnVQ/eYH1bE3bT1S5JsggTmoHyoUZqfwvdN0coJHVG8c5Owx1M9MI94cZ+R5mQqPPOU
 Bmz3za2CccxLBC28ffOKHd35lZ2o+KyZZ2JU4Yd5HGF2ZSHs541mfT2aYut2APzM31HT32PgE46
 6qr7G6wwdhzGcbuy8drCD6P+0b31srwPbehVyjZh7Tz5N7zkeNEH1xwDgOovmeFb1/OTdJlAkt0
 OEwLho+m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508070069

Enumerate csiphy, csid and vfe resources for SA8775P.

Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 08763d92f659..020cb2d608b6 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4147,7 +4147,14 @@ static const struct camss_resources msm8996_resources = {
 static const struct camss_resources sa8775p_resources = {
 	.version = CAMSS_8775P,
 	.pd_name = "top",
+	.csiphy_res = csiphy_res_8775p,
+	.csid_res = csid_res_8775p,
+	.csid_wrapper_res = &csid_wrapper_res_sm8550,
+	.vfe_res = vfe_res_8775p,
 	.icc_res = icc_res_sa8775p,
+	.csiphy_num = ARRAY_SIZE(csiphy_res_8775p),
+	.csid_num = ARRAY_SIZE(csid_res_8775p),
+	.vfe_num = ARRAY_SIZE(vfe_res_8775p),
 	.icc_path_num = ARRAY_SIZE(icc_res_sa8775p),
 	.link_entities = camss_link_entities
 };
-- 
2.25.1


