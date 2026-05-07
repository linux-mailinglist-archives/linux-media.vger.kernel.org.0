Return-Path: <linux-media+bounces-60736-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPESLG81/GldMwAAu9opvQ
	(envelope-from <linux-media+bounces-60736-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 08:47:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B426E4E3AAD
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 08:47:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 25D043036C0A
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 06:43:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58475372EFB;
	Thu,  7 May 2026 06:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A3evxDYd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b1Yy4m8T"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E235934B682
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 06:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778136166; cv=none; b=FDo9yn/CrZgMYo3y7G3uIRTOjb9GKKkZ97iGZMLiGFfExi34UDv46iyzhBEhl6bbPm+Gjnl1dcStADV20hyJTz3B2j0gX4lE1nXcOMi6/z6yWyT1TcbieQ9ErBWfqmhzBeQXLLaAB59eEuIYn7+DpbXlfJXT4L9VEOLpJJSbbiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778136166; c=relaxed/simple;
	bh=7mrNTGNij/w8YmbLMmlhfVsKgE6akwwy6krrm30/cgQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L6L/ryRosUwyvLIqPpTFpy3WYNujYJFs4yh48kqK3xbqGM1TuBVJE+ZJSeq1E4Ahzi+d7+Tjh0QVTFDgH5RteMiso6cS1S4u4xv9cvQxOg2nHNVlI+qIyxlZ23SSN/NlJMFgutvlR3BHq1PqsNMzUoZYopfN2jcNTp+MIdPWz8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A3evxDYd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b1Yy4m8T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475MN6B3157738
	for <linux-media@vger.kernel.org>; Thu, 7 May 2026 06:42:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rZRJ/JIYWoECFHr41NRyA/8b0IVqNJMdaNWLv7doTIA=; b=A3evxDYdy8+kDptb
	0UGC4OLpMKQA2H9Uq7Mi0vbVyCUHdHCLdBOS1j57itIN9DaLYXWcpRveI8IlWwMo
	qhXMj/1Bs51xT8fK6UDulgOeQGFd4ghhdzqS91WiptW1DPlo9uqYD1CInit8G+hy
	WCG1jwV5P+YyZ2/NVuT2DdvZyOkIAFPTDfcHdeZ/6UVXqfXzxmbEwwelXGJqMtSq
	zN0zqJMXVLa4eB165s2p97RGDmDOUqnSTfHRAEU4S+NFH+guptEvGFrXn+5o/zdm
	mbva6WuTkLu+ldvtvxSRUMo9nZi+5YLLsdhpyXtMCYnXF4gYdDVC8eG4DsBa/4MT
	SeoUqQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0mhf08qm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 07 May 2026 06:42:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51009190feeso10524501cf.2
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 23:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778136161; x=1778740961; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rZRJ/JIYWoECFHr41NRyA/8b0IVqNJMdaNWLv7doTIA=;
        b=b1Yy4m8T0CR82CzimcddyercIjc8vONNopKGGxvIfJo5I/KAFmrrUJ7e7tVKtp8J1K
         yaSIRmqIfJe5OYcI4ErNhb6P2Gqc1BXk/rADpU8ldl3Ptk6RBPgKhpw+snij9fsqlTv/
         yfQvI0Q466WrKcF9tQamUgLnQRL0zMUVllGZpSJwBP0lfXx9IhDwEBXti3DOQs6wddEv
         nn2FxGkyOMjohzQTLGb7UDwJCFOiSGRjL0IckynJN6Y7FSsOMcHu6Qz6X8d5KBjoD8QG
         mDcWUUCNCUp3yToyjGCAaY0jH95i/TgrvPjVRmMH2skzM8mTUHXdGYGXHiDVjVHPuNMm
         aZpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778136161; x=1778740961;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rZRJ/JIYWoECFHr41NRyA/8b0IVqNJMdaNWLv7doTIA=;
        b=S6jtVR/vcMQpQOsByy9SqWUGsolqCU66dtkZgTVTY5F2qf4f4gFOeJhOVXKlw841Ob
         15oUuU8FR07SZaGNV6qINTUax8D0Sbh2Hw5cmYuwGwczprRWQ1OgwEYgG12gBlwjWBDN
         OTdctrHgeIMBe+HiJOi0QugM2DKArsGSnscTK7xGBVQShuJtDDWIB/3vUWuf5jL1QtT/
         /UtiTNBU72Zp3K5lBvHUnd84cO5ZwPjvPE6XncWB/ruBsIsryOICKcK5BwDV3jWpiGT1
         2hOchscqt41LlhOi9tNXyAAKiQ3Vje2Op0HGh98j1mjyRKqXPljVHXYiF9SIxfYN9ma8
         LzqQ==
X-Gm-Message-State: AOJu0YzhTpL1fSoPkUYlfjwZmSpY7crEzF3lZCZCdKRa3aHtsDaelsIX
	yIPMaFxOz2JoD902Bw8EMVKvciGgKaZAQgJn55OqStAtAfHfwabXUq8cCnEMAM7s6SG+wObbY/J
	dcfJ5R5XZYHx/91yi5C1r0xrJEqYPuQYiLay4aWlVTUmBwt7CCxNJo0ztNYy9TQtbMg==
X-Gm-Gg: AeBDiesL84DfKE463ZR4/DZsgXGyB1onczWkLYPWjL6hslEvQp7Wat5FpLUV1WadLPy
	nIx+7p/yyCA6OWz44mf0w7p3GZ5lc4WemCOr84UBn2izM6+nkGTy7bWZBptiuWWAMBzCUil1l9y
	ozQ+ph/TTEj5GGle9o2fAz7XumpqCViMGzT1T2t+nRVkiqu+9JwXwj+KeTjM76I3LIwutbtihoH
	mhsN/ONuRIgYX3EnVVcm8oSZB1NHkmxt1oBoFJSnH3zy+CUe4nGjlZC0qFrjPTRc6dNsE3OaQVj
	3TGu20TgWF2F56GDnbJLfWX5uzLU9WJ3le951Gg1rn2ZWsZzVdIKDLWcG0grkyxSnpdx4OuvItI
	CI0RfoaTDpUdyVDri7iZ+IadsI801iZPFtfLsuucMnLszDCiVJfxmei9RGn31czpefDXMM69myf
	jq39rwm/YiZho55sIDalUhKJ3+ucH3jfo23DbHy1HTngpw9ZSRJ+lgpY9v
X-Received: by 2002:a05:622a:1145:b0:50f:bdeb:1e47 with SMTP id d75a77b69052e-51461fcec8cmr89440381cf.44.1778136161151;
        Wed, 06 May 2026 23:42:41 -0700 (PDT)
X-Received: by 2002:a05:622a:1145:b0:50f:bdeb:1e47 with SMTP id d75a77b69052e-51461fcec8cmr89440151cf.44.1778136160682;
        Wed, 06 May 2026 23:42:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8722c2d43sm3334694e87.40.2026.05.06.23.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 23:42:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 09:42:15 +0300
Subject: [PATCH 15/16] media: venus: skip QCM2290 if Iris driver is enabled
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-iris-ar50lt-v1-15-d22cccedc3e2@oss.qualcomm.com>
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1724;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7mrNTGNij/w8YmbLMmlhfVsKgE6akwwy6krrm30/cgQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/DQ/U3gUnLVTXkqjSQKHBGEc8j6q7pFDgsHkN
 sNxehDcuZKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafw0PwAKCRCLPIo+Aiko
 1Wh/B/9FEO/WyAAd+IMryE+i6kwlTRV3hcSbSnW4dadkEowqVHaIIc08JxcIvr7R2ZSed9zBOqd
 2BUX+/f1G/JrmBAZxIK4M3Yg7erurIPCHW0ET6OwjwwOvoaLlH5rhW6N/Kg1I/bH1aAsYA7RTsk
 ZUhjWbwCFvuZPc/EMrsZPIhfkbFYmewwyvIubzP3ftQEEWRoMQfFomdoE4R2oCsP9ol6tJGNvZT
 MzHV5CuklqRZd3uibCip+jbQPMREdd73rFlQoKFM1CHWSC1H6Ej4SgctFh+q64ZWga4OTrnRFDq
 9E6uBnhr3htHnK3/CGl+mc683J4Lpjp36Dvv1lYTjNbny+Sa
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA2MyBTYWx0ZWRfXx8rYE2asnRUj
 Co0y0bDg3VsHTl+UItYr44bXiOUhC49HNDOCAJXtzAdfR1wuiWU9KfCiREN5g+B3liTV7ujhCG3
 VmnFECdw2YKPCtdw6C+KWeEQd8V3TE3pM4qYVCf5LCCWIWwH6pnA6eEG1+vAzCQNbmCWCOYyelf
 ON3oTP/vXVVijhaFNSN357HFA0DbRYQTkHmcoLcs/ixYzt2l91ChJnhRElyOkeyFp78NIIBKsR6
 DovqKB/gdF794ZE4I7fqmm49AwpNSRsKLsNEo1hFDn5Khg0t1k5j1rxvCGZoWFfqHBF0osjhN5P
 NdGtPHtENm1lHzH6dX5DzrU8dwuYRMvH6ulVSnLwdEcsCZ4U+YMzMFsKOSiqNUWMh4k4MmHmWRN
 tMru8VLLVy/tMfHxAvk+Hzjblu6VTtIbAz9kUrFA0s72x9i7YpAjRFnDNPoO6D3yt9nWc8bp8/9
 6AWs16FmXNWCFUmnR0g==
X-Proofpoint-ORIG-GUID: DSpScwj_0BOoenwyhMNFOQYBPB1DQKfw
X-Authority-Analysis: v=2.4 cv=SuagLvO0 c=1 sm=1 tr=0 ts=69fc3461 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=TAcc6fXARiqENDJ69lsA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: DSpScwj_0BOoenwyhMNFOQYBPB1DQKfw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070063
X-Rspamd-Queue-Id: B426E4E3AAD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-60736-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,0.0.0.30:email,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

As the Iris driver now supports the QCM2290 hardware too, there is a
race between Venus and Iris drivers on binding to the corresponding
device. Follow the approach used by other platforms and skip QCM2290 in
the Venus driver if Iris is enabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 247fb54bc00e..ea67e713a810 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -1074,7 +1074,6 @@ static const struct venus_resources sc7280_res = {
 	.dec_nodename = "video-decoder",
 	.enc_nodename = "video-encoder",
 };
-#endif
 
 static const struct bw_tbl qcm2290_bw_table_dec[] = {
 	{ 352800, 597000, 0, 746000, 0 }, /* 1080p@30 + 720p@30 */
@@ -1125,12 +1124,15 @@ static const struct venus_resources qcm2290_res = {
 	.enc_nodename = "video-encoder",
 	.min_fw = &min_fw,
 };
+#endif
 
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
 	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
+#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
 	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },
+#endif
 	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
 #if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
 	{ .compatible = "qcom,sc7280-venus", .data = &sc7280_res, },

-- 
2.47.3


