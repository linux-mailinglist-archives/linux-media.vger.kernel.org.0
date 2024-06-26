Return-Path: <linux-media+bounces-14151-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BA4917A10
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 09:48:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E83DD1F2391A
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 07:48:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1379D15DBC1;
	Wed, 26 Jun 2024 07:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oAykEttP"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF76C219FC;
	Wed, 26 Jun 2024 07:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719388092; cv=none; b=Cbv9WjdbIvezq1rMRvEpuzbDjCRnLpL2lV1ZcvM/qz4pq3lGbLRxceUek3pyz7ISoThRGqPhX1QglEunXayH+GkObzCDdmrJSVha+Ied3gxpnTZ4/jauDon/eCdVwXrFhgBg9jh2ZLMUmUei5JJp5NUEl93sYP8w+gktTx6VFu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719388092; c=relaxed/simple;
	bh=kh3XIkAe78xlTGpq70/O9bBlgmnBGzs00y9mYrAHLUY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=G9hNA8stQz3+BMj8cUN/l6/IW+FoywaD4eL2QMOq7j+fNiOOpuOe/T4VXSHx6MZk/furK7631eN0T1dZxjjpR/mz6btCVTI9qLT0ot+6dYWwwEBdS+Ov/E1tDqwupv4SpgckhGFm66GwJDe7AE7LIO+SMivFtSesCa8dHO3U5dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oAykEttP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45Q6j2BO020260;
	Wed, 26 Jun 2024 07:48:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nJPdxVyBuZz0jMRe8YREhT
	3AjF6q63rNLfdzaGpa8yE=; b=oAykEttPZ+m8es7CP2Onqw0jbEsnesrBEfxIBq
	XEOJ8XyoHJfBpr44hw/qnrw618FS1WUe+TGzYw8yXkXrxc5SgIoYyUwdUbUZvOqx
	+QdsEb51uSHiY6hXsOV0MiBc/6GCifCH/0kHpve+oTjVA7hIVaxRKN02KQms4dgm
	la8Q8M0SLtuMr2r17itTPsDD0/buIjTYabn2WoCwXOTuhvRCqzhO44F865Tnj4+7
	2MJ3qGk3LXKNX5ZKfaX0R14ddw+EfDAoSI8cFoEzVBTTBN0IU6hBp4AdHLwJyFoG
	TEha+lg6I89axMEQNegTm/17NiRMIdpMA9P1s+j3ixPULO3g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywp6yrsmb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 07:48:05 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45Q7m3J0018909
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 07:48:03 GMT
Received: from grosikop.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 26 Jun 2024 00:48:00 -0700
From: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <laurent.pinchart@ideasonboard.com>,
        <hverkuil-cisco@xs4all.nl>, <quic_hariramp@quicinc.com>
Subject: [PATCH] media: qcom: camss: Remove unused phy_sel variable in csid gen2
Date: Wed, 26 Jun 2024 10:47:30 +0300
Message-ID: <20240626074730.85-1-quic_grosikop@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: pMiJEF3nteu_p5f78CuuXzSy9smdZKVm
X-Proofpoint-ORIG-GUID: pMiJEF3nteu_p5f78CuuXzSy9smdZKVm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_03,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 phishscore=0 adultscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406260057

The issue is introduced with:

[PATCH v4 0/8] Move camss version related defs in to resources

Signed-off-by: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>
---
 drivers/media/platform/qcom/camss/camss-csid-gen2.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
index 2d8398a91fc2..e1c757933e27 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
@@ -260,17 +260,12 @@ static void __csid_configure_testgen(struct csid_device *csid, u8 enable, u8 vc)
 
 static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 vc)
 {
-	struct csid_testgen_config *tg = &csid->testgen;
-	u32 val;
-	u32 phy_sel = 0;
 	/* Source pads matching RDI channels on hardware. Pad 1 -> RDI0, Pad 2 -> RDI1, etc. */
 	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + vc];
 	const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
 								   csid->res->formats->nformats,
 								   input_format->code);
-
-	if (!tg->enabled)
-		phy_sel = csid->phy.csiphy_id;
+	u32 val;
 
 	/*
 	 * DT_ID is a two bit bitfield that is concatenated with
-- 
2.17.1


