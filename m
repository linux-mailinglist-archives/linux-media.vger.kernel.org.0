Return-Path: <linux-media+bounces-55642-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJATJFTks2ktcQAAu9opvQ
	(envelope-from <linux-media+bounces-55642-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 11:17:56 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E8ED22814F7
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 11:17:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 55B9231F5338
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 10:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0622538CFE6;
	Fri, 13 Mar 2026 10:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kEchwO0y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VnnrhJPP"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CB038C433
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 10:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773396809; cv=none; b=l5mun4ZPyX6NMDmEslT9ialeDU9fhzXmVqByS6y2ubozIaNZcU3XNLFEkzN6HbPfD9yh4HESV9VN8L6g0cCHFYjMLIjAxXzaux4D1HrF1X432D1KX6Idw6CEXkf9GZGWnUDwXFzs2XTFmuD46DDA8OG9I8hrYk7qspV6LY10cRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773396809; c=relaxed/simple;
	bh=SWsVvbO0nFlnea0mik5H00U8TmYa85tFxLFq1RRFQm8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZCvMYanGIKyIIFfCR/ppQxLEK7kqo1a8LZGRy/qFNH3HpWjidRHYAgdPnDv7bJRoHNgnyx5WsKP366xY4iA436ansWkvwTGymeZaAAM/1eug7gPtlRkHf6xu6VGgFLUubaB6D21ynLRWh1+v22vBgs5EATJmk8cn79BDJiqRU8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kEchwO0y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VnnrhJPP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tjjE3342938
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 10:13:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TIRP+0//Jsgm1EFb1mfEl7d/1vskBTiIlhSMowMzO1k=; b=kEchwO0yXtcirm9b
	960n2wCDeuzvS2amzzSEMpaG2SuIzD6iY1azBcnf+8+HsJQcGU3Q5Z5Ck4By9G9U
	4P3Mi576bqM0hstTebKiIVwiJz57MekNv1RejubgGuLw/jwBgQyGMOR03O6NhA3r
	D7ojeOW/Tbpd46UQrywp7sMp0ZloZQtUcdDkYk87U+rvO3V3EghJFng5zEpbZIuC
	q1o8KLnmeb2pDvHirEBXi3fM6T/MaaTbNVig8+DGAc2EY7DL80vUShxrNXmfSGpR
	FEkXNAsb35yMdpjWdPel2a3i5UpW9QOXHbURNY4+XTUOq5WOW1+UqprwbhdoRN7j
	n1J9kg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cus9w4bfq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 10:13:26 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89a304f24a2so164339276d6.0
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 03:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773396806; x=1774001606; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TIRP+0//Jsgm1EFb1mfEl7d/1vskBTiIlhSMowMzO1k=;
        b=VnnrhJPPgihrQRXd1rbtWrDZjWUMoX0fo0N1CanueuznY+JnHZ1vGSu6j9+l1tXrqt
         wZZQ7DcevPzGOzZJxy3qM2W+GlyV1pnmGPdqziTW41+QMCjHUCbTvlJ4BswfzJMltTXZ
         rA29vhyFpyts+1Wwt8QykSPCErvLFAtOnk9Zazn7CkN70efe4kN8zpTUMloRZOzwHPk0
         892c4YAobEvjZ4WhUBIrGPg4qlxK32nBqaJHuebVXyFycwR1pBo/JwUcZpYBpGDrCH9a
         Aamzx0kBlMLXtSptC8GzFjxdCrPlvEy7L9U/u5llxHyW0eUdJjDFwblWGol6LU6ecvqI
         Nx7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773396806; x=1774001606;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TIRP+0//Jsgm1EFb1mfEl7d/1vskBTiIlhSMowMzO1k=;
        b=bLXyms6bxDED2AxlKajryG1BZMZRuibmo+fXFd/uua68XrFv6C8GqiyH2NJ7SlXRkI
         iPW94UL1yNqzhdTedC3KEkbDJHW5nTVtXKkn6S6h6fgASkbvXEJ/sdy8VcfxqtVMv2sW
         o1aOYDlgcd8H7YLsj5ZUAekMlMdwudmUR+2Io9zCgUgmDHHMe/Khp3ZJE8y3F59fRfEo
         /0mJLyOAFnOugxxhNEgWyKLKmAahk0Rth0ui/bFe8NScxM6LrvfX1J0AhGY7acvjab/w
         y0DYO/G7MNsWyRYj2EO9iBjerfrhSTL+c29++t9ZBqVaLQnzQdnBqcx7dTCMgwSV9BrP
         e8rg==
X-Gm-Message-State: AOJu0YxqDX49ZSYpuxrqkXx5qAy2CEsOPrIKW1K0JQ0Z3KoY1siL8zla
	EnJyrn1m8TkF4PAflMcAavIyz6tHcFpj/jD0DUXhxSsfAUe7cyBfuZ4mQcdUX9wn9pPA2Bunpu/
	ONM3XLHMp5mVoLAqqiiBU4/llt3t7+G1R5Vt9nVQURhxvRNxOWecdAWOik7GmC8h1EA==
X-Gm-Gg: ATEYQzxJ6PcLB/Ye0witoNsYrJ+mPLAN5WymqpcwLw4/ElC8dJEPbxplAYhNetRJRM9
	ru0lhbEEdpYbjxvzTUmhRJEz/OVYPw7fFoIueE0Cy72CdtW3vSl+AskY09z2kgrjJeffxd0z0Sg
	wNotC+G3Rjx8ujUsVz4pZiV0p9bjxxFqVdHw+/kIKupoIoNOndqHZXccxh2dk9VGJ4cC10u23cg
	tp45ijlPnI1barroiRDVkEgVlKcPtuUt9ZOcj2vApmio2BQnA2azxwEV+BzdaBggcFhUZAVMeHU
	VOiAijEl6IOWGFQgOLU/cJxu74G2olXte1DuCTSucl4PIowWUan1fp8dPWGiDSBlGHGS+/4P5tB
	DnHwO6XnFz3FsOK6aVIRMHNJIeE17zlqCV2exO5Hfn7oekYrGpI3fXZv69ndsgMSZger18VG6dO
	UHqZbiGfkGPwrW
X-Received: by 2002:ad4:5c66:0:b0:89a:870:2e9c with SMTP id 6a1803df08f44-89a81d364a1mr44232246d6.6.1773396806213;
        Fri, 13 Mar 2026 03:13:26 -0700 (PDT)
X-Received: by 2002:ad4:5c66:0:b0:89a:870:2e9c with SMTP id 6a1803df08f44-89a81d364a1mr44232036d6.6.1773396805771;
        Fri, 13 Mar 2026 03:13:25 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a65bd5274sm53628846d6.3.2026.03.13.03.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 03:13:25 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 18:13:04 +0800
Subject: [PATCH v2 3/3] media: qcom: camss: Add missing clocks for VFE lite
 on sa8775p
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-vfelite_fix-v2-3-7014429c8345@oss.qualcomm.com>
References: <20260313-vfelite_fix-v2-0-7014429c8345@oss.qualcomm.com>
In-Reply-To: <20260313-vfelite_fix-v2-0-7014429c8345@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vikram Sharma <quic_vikramsa@quicinc.com>,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Wenmeng Liu <quic_wenmliu@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773396787; l=4359;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=SWsVvbO0nFlnea0mik5H00U8TmYa85tFxLFq1RRFQm8=;
 b=kQKBzSyhNryIoPVD62A67//oNNd8KfVtiQT1GgIjq8bOFiA2JioMImgceKlXbUAx+Us+4TzUJ
 YDSFtVPzDiNAhNXhOwUXqrIvO7dDn9VUy7R8qjYZQW/oaXzCFLsSmIu
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: fzg7ZJw1sImQWa7-L8izonPzfjm_ZHAF
X-Authority-Analysis: v=2.4 cv=IIIPywvG c=1 sm=1 tr=0 ts=69b3e347 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=GdtaQf2j5X7DlKrz3VsA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA3NiBTYWx0ZWRfX2f5qcy/YQiSA
 NTTL0dJkSGvGa3oAUCfchTWoO5h0zHwz3XhANg+h0Qlbn7F9q3z+7Z/Wh4MAo8UQzQWXxc3HIB5
 18o31bXilhPLPWHaRnKKBLhnc6hRj6CZxtZbkM1oRbQullZSpZNxJPIcZ/TIv+hUMy6O9czz3AA
 daQmCck48IsCXb9ltUJsKNbK9uLxue9Yi4KaJh/KABKUoY+Ajz1bEtv1g0FzOeuFVHnvtvc//DX
 g+lUvSvxZ2qlyr+aBdBq3xzYeUtBannseUlWgyImOinwb81lQnBRsvk15uB+zyownSWxH/ykwHF
 sRNepQZZ6Ef+ShJQEgNkJeiVDaWizxPosEqMc75r+UlBHQbK2Xwh3wCwzYbIpkZVIkn9EOSvtf8
 iLSCBZZv73WY8JXlMJXd2IrWS2GrtLV4m/IoYF9sVyABHA2QX5yNa99J/dBxSQSMRmc1deffwTo
 ena/NDoDLfGr+I4g4kQ==
X-Proofpoint-ORIG-GUID: fzg7ZJw1sImQWa7-L8izonPzfjm_ZHAF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130076
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55642-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E8ED22814F7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add missing required clocks (cpas_ahb and camnoc_axi) for VFE lite
instances on sa8775p platform. These clocks are necessary for proper
VFE lite operation:

Fixes: e7b59e1d06fb ("media: qcom: camss: Add support for VFE 690")
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 40 +++++++++++++++++++------------
 1 file changed, 25 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index cb013471898506f483e5b2779cfd4f679dc083e8..9335636d7c4dfc7263af79f0bc8a3f87bd5108d4 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3742,15 +3742,17 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
 	/* VFE2 (lite) */
 	{
 		.regulators = {},
-		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
+		.clock = { "cpas_ahb", "cpas_vfe_lite", "vfe_lite_ahb",
 			   "vfe_lite_csid", "vfe_lite_cphy_rx",
-			   "vfe_lite"},
+			   "vfe_lite", "camnoc_axi"},
 		.clock_rate = {
-			{ 0, 0, 0, 0  },
+			{ 0 },
+			{ 0 },
 			{ 300000000, 400000000, 400000000, 400000000 },
 			{ 400000000, 400000000, 400000000, 400000000 },
 			{ 400000000, 400000000, 400000000, 400000000 },
 			{ 480000000, 600000000, 600000000, 600000000 },
+			{ 400000000 },
 		},
 		.reg = { "vfe_lite0" },
 		.interrupt = { "vfe_lite0" },
@@ -3765,15 +3767,17 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
 	/* VFE3 (lite) */
 	{
 		.regulators = {},
-		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
+		.clock = { "cpas_ahb", "cpas_vfe_lite", "vfe_lite_ahb",
 			   "vfe_lite_csid", "vfe_lite_cphy_rx",
-			   "vfe_lite"},
+			   "vfe_lite", "camnoc_axi"},
 		.clock_rate = {
-			{ 0, 0, 0, 0  },
+			{ 0 },
+			{ 0 },
 			{ 300000000, 400000000, 400000000, 400000000 },
 			{ 400000000, 400000000, 400000000, 400000000 },
 			{ 400000000, 400000000, 400000000, 400000000 },
 			{ 480000000, 600000000, 600000000, 600000000 },
+			{ 400000000 },
 		},
 		.reg = { "vfe_lite1" },
 		.interrupt = { "vfe_lite1" },
@@ -3788,15 +3792,17 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
 	/* VFE4 (lite) */
 	{
 		.regulators = {},
-		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
+		.clock = { "cpas_ahb", "cpas_vfe_lite", "vfe_lite_ahb",
 			   "vfe_lite_csid", "vfe_lite_cphy_rx",
-			   "vfe_lite"},
+			   "vfe_lite", "camnoc_axi"},
 		.clock_rate = {
-			{ 0, 0, 0, 0  },
+			{ 0 },
+			{ 0 },
 			{ 300000000, 400000000, 400000000, 400000000 },
 			{ 400000000, 400000000, 400000000, 400000000 },
 			{ 400000000, 400000000, 400000000, 400000000 },
 			{ 480000000, 600000000, 600000000, 600000000 },
+			{ 400000000 },
 		},
 		.reg = { "vfe_lite2" },
 		.interrupt = { "vfe_lite2" },
@@ -3811,15 +3817,17 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
 	/* VFE5 (lite) */
 	{
 		.regulators = {},
-		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
+		.clock = { "cpas_ahb", "cpas_vfe_lite", "vfe_lite_ahb",
 			   "vfe_lite_csid", "vfe_lite_cphy_rx",
-			   "vfe_lite"},
+			   "vfe_lite", "camnoc_axi"},
 		.clock_rate = {
-			{ 0, 0, 0, 0  },
+			{ 0 },
+			{ 0 },
 			{ 300000000, 400000000, 400000000, 400000000 },
 			{ 400000000, 400000000, 400000000, 400000000 },
 			{ 400000000, 400000000, 400000000, 400000000 },
 			{ 480000000, 600000000, 600000000, 600000000 },
+			{ 400000000 },
 		},
 		.reg = { "vfe_lite3" },
 		.interrupt = { "vfe_lite3" },
@@ -3834,15 +3842,17 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
 	/* VFE6 (lite) */
 	{
 		.regulators = {},
-		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
+		.clock = { "cpas_ahb", "cpas_vfe_lite", "vfe_lite_ahb",
 			   "vfe_lite_csid", "vfe_lite_cphy_rx",
-			   "vfe_lite"},
+			   "vfe_lite", "camnoc_axi"},
 		.clock_rate = {
-			{ 0, 0, 0, 0  },
+			{ 0 },
+			{ 0 },
 			{ 300000000, 400000000, 400000000, 400000000 },
 			{ 400000000, 400000000, 400000000, 400000000 },
 			{ 400000000, 400000000, 400000000, 400000000 },
 			{ 480000000, 600000000, 600000000, 600000000 },
+			{ 400000000 },
 		},
 		.reg = { "vfe_lite4" },
 		.interrupt = { "vfe_lite4" },

-- 
2.34.1


