Return-Path: <linux-media+bounces-63042-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGv/MrWmGWptyAgAu9opvQ
	(envelope-from <linux-media+bounces-63042-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 16:46:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC53603DEF
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 16:46:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0B4B0310F055
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 14:38:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E53C3ED3BA;
	Fri, 29 May 2026 14:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XumbYvfp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hj5n04Kx"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D3E3ED3BF
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 14:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780065491; cv=none; b=PJmZvcPabAHOOgFIOdQ0nmO3IupPFha6Lm3mpchVcIbGY/eOqZWPOl1Y4we44zNqVE+/s/o5ctJ5bJTlUMuQrOBvtwdsMSX1kqu0YgUo9pQ4PtSnckABAj+eAEypZWd4fwgEsuqqJZdNc0cF+i0M+blUcKISSuuHLp4aXuVpcp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780065491; c=relaxed/simple;
	bh=AFnhWWqFU62BMrFxqMWtSMxf95nuM8PRRSdLIYVhz38=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cEvN+M2A2sQ6Dzm/2aPgAqpFc3F7ttH3PrHwzNQyO87v05xeRLKUzFvLWzSeiwXe7yAemXTBL5B98hBjfAH43I5S2MQe1LkmC3u4OMPND9g7mZTA5r+kBaHfpxFEBYCari/4Xqni468m5s/KJeZqwc4CbZmo/rEktlqzbm7rquU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XumbYvfp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hj5n04Kx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TDLEMa4050838
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 14:38:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t6MTAoIK6EWQqac2dZPiVOhhInBKbVH5U0kklLKF+5k=; b=XumbYvfpPla5pIQG
	/pyPqGtp03CvFFyUAfFl9kv2t+4xNpdSyTC2H3JSnhL3N//qtoWIQ1fLpvWsbr3A
	kRcRAEDqUPNaDe+gKOjTArBfGQSpUdgDn7b9KTe46UsHQghtW6+7pInrF8OvyHe5
	tWsqz+Acu5TefHHVyk2RfYNg7UQ5tgs+BW45dCTDtryGKLYPuVmsAd8sSbCBrC66
	coldsoejxnaMBvDcHt63LezsqzS8vFYOyqu2LR9awpJPaOxlE+RnqzOFK504qs2r
	eNLGo+0LQhvSsX2yulVm1mdlZx8cROBGRiYDjGoGx5qHwLuBtYSBmFy3UWoAQnMJ
	qnFLkQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eety54h5p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 14:38:09 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-368f2d76b04so13460720a91.3
        for <linux-media@vger.kernel.org>; Fri, 29 May 2026 07:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780065487; x=1780670287; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t6MTAoIK6EWQqac2dZPiVOhhInBKbVH5U0kklLKF+5k=;
        b=hj5n04KxwqhEQbXefTS++nIvuEmtgkRsOtHrjPu1UAGBzHwaBMlHr1ONvgeU67URPO
         z2Vrf9zS4ms/smdoFnaxzP3d5xDta5tIrigyqCkIuEqreBhL4/WGApIY3SewnzTaJAOR
         NGMsC3v4pdNq147LFz6E9s9S3ezbD8BPmKcdp2ovWwJMhmt2E+Bo3IjgJlB2OgJsvrNH
         vMhbVRz0vKl0ykK8/ER/9+nEl6s/Y6WE7i70WBemaAh6qiohCWum/vISpUcF7edY0X4F
         +G7MJjBT8QcKCf3bQHChoLEAKc/F2ZWWQhO6lWqdu6R3SR320mOKOq/gCsFWnVlJZtkt
         U7fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780065487; x=1780670287;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t6MTAoIK6EWQqac2dZPiVOhhInBKbVH5U0kklLKF+5k=;
        b=STJ00aH7zftprRtOAhr1VijaWxWjnLdJmu54MJkdTS0dhsYaPC+hw+b3sUbPScYBZZ
         ANS1r/mhyPJNvZ1+Oyor4pM7J8aO+3rgYhAYwcV8WMlPSvNsH1irIqidB/LHMKDKHxkf
         DA0RYU9ojIzHo1E5sY+l++92wYhasab7qo/t211gUg449ISkfMNTKWZ8qEwx8lqfjN+7
         aTlEy7jiG8cx9nKyy0qgFZg/dpRDBD1MErYRCGkZcdtXjVHJYg40bIBo+OLfQtjeJ5IX
         57LgUBgbXZ5CNuz7qd5IMGZMMLppTKCScF6B8EIFKpYceWrS/9ps0FCGf6hlzUtLhaTA
         Ei+w==
X-Forwarded-Encrypted: i=1; AFNElJ9xLbPDqRlsIeOAwGiITz3sBdLVSCnvi+DwsnitrxVi8Zah/gr8gMvsvoY6yPWoQrRe5M10M5fiA/7W3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9SY+ORZ2GjFtBV0sIEXddPqc82L81Wn0DY2vIcOW0qkZJO9d0
	dck4QiLd4idBXSUaLmCaIcMGO/JKvpzRrof3H9f5a1lmK4X4YFhRLFR5D+q+L2ScoBuUdHdvvKI
	TYgB0z8qUV8WXFP0+NQqAd/sTaRCV5Qx3lmxXqhQco3mJGGjDTg8JJPAzJG8Q3Agwhw==
X-Gm-Gg: Acq92OEs4ruLMI+yVYdWf4a/RTjm7q5yZ7omoNl2WwW3D32FJJUzKNxSUUiA52v+rh5
	U+H5UEhL4PYwjB13ea38NtB54B5IDullfdAC1dnkMNXXrYaRSdv7n8uHsFMpYq6o5ABSVJILwCN
	P5zWdEusvFqrrzgfFEhJsS9EZTg0fuDXRsZ37tvzAyuMuUR9MGwQ/JRBxNBTQIY6DK7RXqdt3UW
	Rt1pOSDxsUcTTwXoCs2kiwfeQdnbkDejx0V1hU7RIYm0So24EWGoc/4KWwZ+ZEMI1lFF1Lekh3n
	g9HlH4wcL/xgiQBqbrkPvmVC+nKZXwhHavRrTwuFBk7cIl9onYIdIutP8wMeSvKH6lzZTsipVNz
	gQhMDlXjwKFQjmGGrR7yKz4FqkFptdYiZwjfJvRbdbtCAhoR1Aqah8dzaFCf1MWbRiA==
X-Received: by 2002:a17:903:1207:b0:2bd:3bfd:7512 with SMTP id d9443c01a7336-2bf368468ddmr666565ad.29.1780065486933;
        Fri, 29 May 2026 07:38:06 -0700 (PDT)
X-Received: by 2002:a17:903:1207:b0:2bd:3bfd:7512 with SMTP id d9443c01a7336-2bf368468ddmr666105ad.29.1780065486483;
        Fri, 29 May 2026 07:38:06 -0700 (PDT)
Received: from hu-vikramsa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85772993c9sm2469394a12.15.2026.05.29.07.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:38:06 -0700 (PDT)
From: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Date: Fri, 29 May 2026 20:07:23 +0530
Subject: [PATCH 3/6] media: qcom: camss: Add Glymur compatible
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-glymur_camss-v1-3-bee535396d22@oss.qualcomm.com>
References: <20260529-glymur_camss-v1-0-bee535396d22@oss.qualcomm.com>
In-Reply-To: <20260529-glymur_camss-v1-0-bee535396d22@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Prashant Shrotriya <pshrotri@qti.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780065463; l=1895;
 i=vikram.sharma@oss.qualcomm.com; s=20240628; h=from:subject:message-id;
 bh=SoZWS8qy+52nFSLk3zZ3aHhqlfTn3tm4mIZq+rTGyxA=;
 b=+H2oSfyzxTsPsAB7SoX+NRPkCfOerarMe0b4VXUr7H8o4ujMJKrcO8kZcG/TcpwLxsNJbKbW9
 BFJIhuPHW0+CDMNLf5KMqbaZLGUvTwb3UcYKsayjEorHNh87hJxiqXQ
X-Developer-Key: i=vikram.sharma@oss.qualcomm.com; a=ed25519;
 pk=vQBkwZr1Hv+VXogAyTAu7AEx8/6bvkOmgrzYFbNGCDI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE0NCBTYWx0ZWRfX0wqAyv/877nl
 e2aNnPa4mrN2gXrX8O6XwvjWN7XsGyUe0LTwrHshjQnqxRUOalvOgU0kyg7/5LGohR6QXr7lJoL
 TcXdFBmKSLqZV6HJ2jaHeIP03puNXTB2FgtaiIDkjUwBaba54CKWgXzE+GGTy/iv54PUhpsAqGZ
 F9FRTsPsbJR8FG6P8i9vzfbJudFG30yaJ5pDk8oJC+HD/o6xId5ZkEWQez5GU4WJ0kElqM0e6+R
 LNsjqbpdDHaXDvxhG4zQPcjqrOtN/X1dqsxjvam6wGCaAbzPeU/2cNVzXiZzQGjkkisyyEMmZW+
 mV0e8Qd/y1n97LImM1SiR9cuw9ajT0+TXhuTGyogNtHdWQ8icTo7PATsr3vIfP3bABGfPjcWVhX
 8CJwCSXrcu5F8FjFWn+FFWF0GAi+c//v/XA2EvE6NiYYFIrDsW8LutkCxjYwWPELRNYU90Sc3uS
 49SJLlk5Fpm57N4dEJg==
X-Proofpoint-GUID: RZ9P_QPY7qpeQxIkNEprkY1wRfX8os0y
X-Authority-Analysis: v=2.4 cv=WaM8rUhX c=1 sm=1 tr=0 ts=6a19a4d1 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=tcYBWJ0pf51xna4_flAA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: RZ9P_QPY7qpeQxIkNEprkY1wRfX8os0y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290144
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-63042-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikram.sharma@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4AC53603DEF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Prashant Shrotriya <pshrotri@qti.qualcomm.com>

Add CAMSS_GLYMUR enum, Glymur compatible and Glymur camss driver
private data, the private data just include some basic information
for now, later changes will enumerate with csiphy, tpg, csid and
vfe resources.

Signed-off-by: Prashant Shrotriya <pshrotri@qti.qualcomm.com>
Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 6 ++++++
 drivers/media/platform/qcom/camss/camss.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2123f6388e3d..c6276d746352 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5507,6 +5507,11 @@ static void camss_remove(struct platform_device *pdev)
 	camss_genpd_cleanup(camss);
 }
 
+static const struct camss_resources glymur_resources = {
+	.version = CAMSS_GLYMUR,
+	.pd_name = "top",
+};
+
 static const struct camss_resources msm8916_resources = {
 	.version = CAMSS_8x16,
 	.csiphy_res = csiphy_res_8x16,
@@ -5740,6 +5745,7 @@ static const struct camss_resources x1e80100_resources = {
 };
 
 static const struct of_device_id camss_dt_match[] = {
+	{ .compatible = "qcom,glymur-camss", .data = &glymur_resources },
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8939-camss", .data = &msm8939_resources },
 	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 93d691c8ac63..31085b3526c5 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -96,6 +96,7 @@ enum camss_version {
 	CAMSS_8550,
 	CAMSS_8650,
 	CAMSS_8775P,
+	CAMSS_GLYMUR,
 	CAMSS_X1E80100,
 };
 

-- 
2.43.0


