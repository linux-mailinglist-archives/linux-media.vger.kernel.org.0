Return-Path: <linux-media+bounces-57482-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALayAN10yGkNmQUAu9opvQ
	(envelope-from <linux-media+bounces-57482-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 01:39:57 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6160B3505CF
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 01:39:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 400F73024140
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 00:34:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADCA6221FBB;
	Sun, 29 Mar 2026 00:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lQOl7BoF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="folpLkhn"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3071FF1C7
	for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 00:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774744441; cv=none; b=bUPatqX2vVAn0yj+SnkeSw4eDSy7vp7N55i83UsFL/DPDAlags33Xt0vF6cc3efcKxeRIKfb/YqKtkGJKyczaX+Nq5ymUReG0zL+z2Jz43HbvFbT+nLoKwgcn2WyX8DykJPeD2jYfVFKzg2VWfPWIBAWy/uMSnjX6vkej1pxACA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774744441; c=relaxed/simple;
	bh=zh1ftPGxeFGHAkFhmHaCfKwMjNGnY1Er2XhYuU4Xt8E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RYWWvwDB/XaEKAFcLv02pnU3kHOyd0ZZ9gtnzOLYJiftQch7pDPO+UShXz5rsQSySsw12k+PvM1e8qdfEJ++N4goiLyg+ac4nv080NsaQR07Rr2h1jmuk7/ijL+rWHnULmc1hJv44NEM9w8t5QLxlvJiuCBj4hnFSQBwj5yWNoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lQOl7BoF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=folpLkhn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62S4lhNU3556502
	for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 00:33:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J6Tdn/7Z1pLbIgw5i2DyFx+KougHn1YOQ3OOkdYRo/Q=; b=lQOl7BoFK6VR0rE3
	lMvhoiS23PtOSaN4g0jonvaI/k5KQ99jeY87cyWisz0Kwp3JfEORr+BIdBbOseoY
	I2ZvHL9R3fy7Z9sEiw0LAYMWrYwxYZkOZYtVDofsv0fuXhGvTfBJaIdbUAMi68p/
	Relg6+85GEaz1eMnuvgDo+Y4/zVNLTax196NblXn/O4ObpBv2KAf927FeB3YhO4B
	cPa5JNOXGNNNFVtlPm1nDf72LKBSgjFgvlcw6tHMDu7gNhYKlDwGxvPEOKGtVxlt
	1qKbIPKu3uWepiJRoiVT5L9Fg0w1pKjp+BjilU0o9thqN+6XOjY3IJbWh3kI7sQu
	R5i2pw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6898hndf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 00:33:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4987c698so40217791cf.0
        for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 17:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774744438; x=1775349238; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J6Tdn/7Z1pLbIgw5i2DyFx+KougHn1YOQ3OOkdYRo/Q=;
        b=folpLkhn0mdT6lCnHPZU3Ae0Zm3wJ3W2wkvl5nDrdMeIiiE+V/OxEgPi9L/kEHubDg
         WcR/Ohlss7+TAvBormVx/AHuezRdbrhfVE4y9AslGzwQYPI4VpApObmKxBjDqcili8o9
         qOmEcZ1dN6SHujRQMVRLgK/iWQta1Z6vo4BIsyJe3ICLETWEqO+InODKN7lnWKMo797b
         QQeAp1TQJ4IqAhqU9n5WO4icpG73QHRim8twMbRS9tinecbEcNc7bmodWzE3NkXPtEiB
         LgNAlClnI0XXTPJ6yWY7OEAairHD3S4m5LIGbhv54eF9ZMvTF2AMTY/uWXDw+F8wAQ34
         nu5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774744438; x=1775349238;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J6Tdn/7Z1pLbIgw5i2DyFx+KougHn1YOQ3OOkdYRo/Q=;
        b=LEc5+iG/0gq5pQifBlvrKSBGTHa7g/CvN1iuJv7Ms9yfcN4Y9koA7YAWezKB9qJnCW
         sWaBm2G6KweazmdOotAdELozKBsLV2+wuV1gpnDihZDAhIAOpNcXgsvMctKj//+cIgL5
         ZNhyclD5VSjidnZaN/z5u+MmCwhTurk/X02VhFkrR955Zyqoj0ObRoLSOOS41VeRcD/1
         m47VlUDPZIIPojB31bu8zyyGO82aVAwVHN1PYt4YnjGGsJoga4e6bHxu9PMXW78yzBT8
         VawLLzz79Mia+Fy5mdXLx4h3U/CVQ1pqOA+cEwByefhTXcU9upEXCGTP42VvJ7gHVvln
         3duA==
X-Gm-Message-State: AOJu0YyRghdQ7cIxk0PMdJNmysNgMjEZG3IMYDRV3C27I5nM3E88EmTn
	DlLm6zYNUBP8vycS8TGXtnyb67mn2IUq5vxIZrYNnxRCEbDQdmM0/+RmIa6f2jrMaZBO5XpqBhr
	LT5PNbN0uyWpXm43Uj3rK9Ai9qfyUmv2fSRJQUOV/quWz0jTE4IrfQLW+3HxwnyKPqA==
X-Gm-Gg: ATEYQzyxlWjxe6dZpKa29waPxA4LsvukJ9vzRfvhZh6U6awYjhFDeLRLr2zmlTiE4Mo
	e/YwYorXwb7L8eTW3B5qQdAc1glQcz9fNK5PUZ5GmZDVvUEC8/MqyLPkkoY+xsw+mOdYhvhrA0K
	25nkgGEF/HAZCI6ysRk4PvvSRyKXPN4twYnKcpfVsCjya1r5hIWRElQLH3axLj62zuTnOQznbls
	qp7FUjkhoNtPnL7AC0DAUZ9RSM6kJqLdQjfmy7VdPZChdaPMJBLB4YnX9iQ+wq55exDWIzDc7up
	o3mS0IT4T7VvOjFM0P6S7y7J4fASGk1WeQzazL6hB9aKsptNIhx1Q2AmSTOXu/5XPbpEdGVSy5C
	1fG7hkDXMQYiAu2ePlPMM13ITsHM9AYlJcn1PbBESlR1+qhrgfeUaJr5CmwIvHoJOxDsYKD+S0z
	G4TslWPBZLZk1UyMqWWmqimmmjGKx47aEBJPM=
X-Received: by 2002:ac8:5989:0:b0:50b:2dd5:2be with SMTP id d75a77b69052e-50b993dd3fdmr137482691cf.13.1774744438264;
        Sat, 28 Mar 2026 17:33:58 -0700 (PDT)
X-Received: by 2002:ac8:5989:0:b0:50b:2dd5:2be with SMTP id d75a77b69052e-50b993dd3fdmr137482491cf.13.1774744437845;
        Sat, 28 Mar 2026 17:33:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c83892035sm7024731fa.22.2026.03.28.17.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 17:33:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 29 Mar 2026 02:33:11 +0200
Subject: [PATCH v11 10/11] media: qcom: iris: use new firmware name for
 SM8250
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-iris-platform-data-v11-10-eea672b03a95@oss.qualcomm.com>
References: <20260329-iris-platform-data-v11-0-eea672b03a95@oss.qualcomm.com>
In-Reply-To: <20260329-iris-platform-data-v11-0-eea672b03a95@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1239;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=zh1ftPGxeFGHAkFhmHaCfKwMjNGnY1Er2XhYuU4Xt8E=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpyHNJvXRM118Vv8PJKPHr0UF5t7weLzLW/51Lh
 88KyJ1ekEyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCachzSQAKCRCLPIo+Aiko
 1RHgB/0c6o7eWATtK5SqVsYvsvIr/WvvmU005iJohf8vGuZdRS4hXZ7yXPHQlE9zuUOU9KwAuF6
 abyaYr3fxPCopmfM7B1f06+DkO2LpiQfWWU45YO2Ijf2ylTqSnvwTL5/WDUNx0bFhWcYkjWj4Af
 3cf1nr8hZpaKrJ73yX/8I3vWtSeh2nnAGxBpolqC5pPxkxdogwhZhuDrDRCKuzGpcISDB2wRfKL
 1bd55J6JjC6skOz05/nr9AYqVhsi4Z+0aB+zr6p9w4Pvf/dZilvWmnHIERFvwLAuxDzBMF+VNwa
 hapwAFukjAmzEpZ1S+k2EU7MNDgOloq0AJLmnnklhvG0E8gn
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: sn7VXV8kDDZLZ43YtakxyndejssTipZT
X-Authority-Analysis: v=2.4 cv=RtHI7SmK c=1 sm=1 tr=0 ts=69c87377 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=nz9G3-SO7wN5dIpBwN0A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: sn7VXV8kDDZLZ43YtakxyndejssTipZT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDAwMiBTYWx0ZWRfXygX+8Ql3WYAV
 XVz7qHlTowoTVuhmaDx6kbrG3SN+4Tz2CzWFkkxFk359BeeRYm8iW/GrZIkIT3lZiQWdtnRnmEI
 P/3QltKRozKYLwnjfiGL4s5qA5u48UwFmxCQoMsehY1KTicl+n+uMVmJunpgl6rHaOW34G7bCNN
 GjXvLuvmu0hAhALOYN0K0Jsi6K4lkYBbh7Hnq7lQG+Fht5Sl489CXoKhI6fL9fzKgy+LiOtsAFP
 9qZ9Kf3/Jjd8ewj8UKV1q7euuCUsyGQ4INuMfHS6osZtgP5nFTVscp6pslwXyT0R11MYVONjgLf
 pu2YeT4VCFWP/dFZPG1jBcs6GJDIZAcExGpHUoTxi1B0D4vNeBb1NDoi+6VLm3a3uTQ6RVcSx1o
 e1V3POPGS8UwQv6hjIQkmbWGDa6qdgehPLESIZK2H7Y6wSwckqd8pdpRMxorBMAeuGlSghQ84Kb
 Ov+e5MNSIZcQwGqT8pw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-28_03,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290002
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57482-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6160B3505CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The linux-firmware is providing the vpuNN_pM.mbn firmware for SM8250
since August of 2024. Stop using the legacy firmware name
(vpu-1.0/venus.mbn) and switch to the standard firmware name schema
(vpu/vpu20_p4.mbn).

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_platform_vpu2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index ab2a19aa9c36..692fbc2aab56 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -111,7 +111,7 @@ const struct iris_platform_data sm8250_data = {
 	.opp_clk_tbl = sm8250_opp_clk_table,
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
-	.fwname = "qcom/vpu-1.0/venus.mbn",
+	.fwname = "qcom/vpu/vpu20_p4.mbn",
 	.inst_iris_fmts = iris_fmts_vpu2_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu2_dec),
 	.inst_caps = &platform_inst_cap_vpu2,

-- 
2.47.3


