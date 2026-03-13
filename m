Return-Path: <linux-media+bounces-55633-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGpJH5Xcs2mzbgAAu9opvQ
	(envelope-from <linux-media+bounces-55633-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 10:44:53 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D3549280B11
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 10:44:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 188DA32045AA
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 09:42:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 814B72D876F;
	Fri, 13 Mar 2026 09:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BdzLscxq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SevPZuLq"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934A537D13E
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 09:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773394959; cv=none; b=oSF2bSaeC+BoVQhY8bXdoNd42r+OYyTqAW34YoK9rUYWU2ckwmy15XJexCzrv6bRUPZcTaONofSBPSOyM36IwZSRusS7P2rYMwO2XeIZiw3NVO880Mrq5TfICp7600iNmej2jao+q1jDcckw20Ol0e4k/GKj9blNCbynjVhxBWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773394959; c=relaxed/simple;
	bh=aYlnAxglJ0SkBe9bSJiNOkAamR+qP8ypBYPxuYyvRpI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u+mgCpD5DeYbbaoX6mQnAr5hCJ5J40jx4mWVt2T1xXMPU/tsS7TKHVEu47FmIm88/HtWB0/yVLbWrqIbfamvdLUROOeBNQ/ZjAY8fO9T2Gu6Y0qxZ8gfRSzss3PWiEeTMLg2KckPcJA4JojxVDnkmzpDmHiKWD0Xw+lh8IntfHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BdzLscxq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SevPZuLq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D7JLGw237799
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 09:42:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oHfZIWnmp6LaCA2VEA5JaOWJpsCwVnOiyXSTn5svMeQ=; b=BdzLscxqJ1m7P/Zi
	2O8gXafIO1PQw1xR/BhO6CiP+eNmq7jro+6wiRkS4FiNb2OxUpZO3RYB/WL34o6l
	8heiR/FN6As9zQqDKIrHUyt43bX0dc6r5kwQnkFoiRmva+8yKo/tW7BOMAqUcZet
	Oeg5T/abwu5ecOtzKegyBE6DHFsmeFKL5CBbcM8RmWcxiNuOkIWBJ5YVq5PCI8dE
	sI2rSDqFkUWWvW8+Qa4R6EZGjdv5/ML21rkJ7oiSUfyQJOgJ+6CeEA7Lu6P8lsVE
	L5604nB3Ifu3FOj5+bgrFnvrfz7uVlZOR0qdMElAj6pRHcLoLN/tn/ppj1MlAyMs
	th4dIw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cve3d8hb7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 09:42:37 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-509044f54aaso145986661cf.1
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 02:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773394957; x=1773999757; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oHfZIWnmp6LaCA2VEA5JaOWJpsCwVnOiyXSTn5svMeQ=;
        b=SevPZuLqELNyN0iSQKbSl95ly3swnvsP55WGNYabAg9QWuP3fJoCKnyLOPEdqTkAzp
         XSJMb8IaFY9nwd1zedib7L+D5/ImU4bRpUt7ZmKxalqw6jczIxLeU1OJKgg3OEIr1UGD
         DF/+lgYEwDDuMVYnNvBSnTzJTOYvZq43cvQIwxb6nerjdiCdjQx7ax2Rs7tJx/KQxakd
         oFeMmj/nmuK6dtO+KwySDouxFPW9LThFjhWyFfxRaYheMqd+/YrYGSdHY3NEqRLPMj/3
         TmDVBfgTDxSvXy7/7dlfz9O5v6kIKunXKP2ticvza+qvBcz4jftKS36+A0S+oGyuJeUb
         Z+PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773394957; x=1773999757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oHfZIWnmp6LaCA2VEA5JaOWJpsCwVnOiyXSTn5svMeQ=;
        b=bBIGIlpxua39v838qu1PkWj/XhyHSnxVoaykpFzoKHA0C/x8MQ2AjWoFLSG6XrvUIe
         C7E5RY5C9qT+6+AbFPx6SQaZTTGGzVckNWzHlSmqnBDoNc3+10jwxkWaR70OOptoC5fu
         ATyOvl5GI4KFLFtq/A95K7ORK2562F37qGli3fVWMutXta6UnYoEheDerYSdYhtoCUvE
         NoQvSzKy7y4Gw21kR2Sn2bEgzOeHUDNnIiPSpnPBEqGsvKYn7d8PqKfFi9UCHdHAt0OH
         uLdQL4asrp8EGeUfh2SbiKqDjFs0yHTY8+waL1phLK17+GuS2f9yOedPNo1Ms290DpUp
         rl2g==
X-Gm-Message-State: AOJu0YyGexbAA82aIcYXzzZu4yvIVcM0fqMVkUjta2HWYK08dZhVCkT2
	xUe6l3wClcEq5j26keKa0tjbmKxs4FkvHq1cTjkajuP9dOzLDGad24cTR3+plYV4Sea/UbVgQlV
	WgJUlcQBvv08X7AamxQDPPTvGAA7KH3DvNTCZlveFTm2NUW29WouJXcRYpDf+U3LagHOVkzi1dg
	==
X-Gm-Gg: ATEYQzxwtyK8TnX3hCRvOPQvgWMmDb/g8R9rfVkMCgVzqW2XYbQn6rqWSZ52xvWfBOk
	oBSMKXjrqZiNudw4lo1jBK8/vjxv23AxAWunl1Fln2IQZbwZZlcOVaN/O80zo4D4uMvL+vQOrvE
	6kqpjn3m4pCbLckQoXpI9IeT9Y7k9DR+m7WN7ToQyKwRoq7mrG2ZYr5QohwxS0NFISivtc7UKXM
	jzLau51mjkF8LzKy/vLZ1OC1YFNcSpeuzXDG8SGnHhy0ymeZqV6j5rNLz3uPhT0yDqMbjnTIt3f
	Dw2INWV/E+mEL/m+9pdakzS1iZoK/D6wdRtJKncXDKXSLxtgAJ+aCbiz0/FI9cHSqJ0bOIGPnTI
	siw871V860EgNeHzcV9xuODc2qSB2MeKilgE5Ff1fRwjxeiq/4O/BkHZu8nJLKKlOnxQVpDP1wl
	sfbFFjeKguCXOm
X-Received: by 2002:ac8:5dd4:0:b0:509:2d7f:b860 with SMTP id d75a77b69052e-50957d54739mr32706291cf.24.1773394956831;
        Fri, 13 Mar 2026 02:42:36 -0700 (PDT)
X-Received: by 2002:ac8:5dd4:0:b0:509:2d7f:b860 with SMTP id d75a77b69052e-50957d54739mr32706071cf.24.1773394956399;
        Fri, 13 Mar 2026 02:42:36 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a65d0a7b6sm54663656d6.44.2026.03.13.02.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 02:42:36 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 17:42:15 +0800
Subject: [PATCH 2/2] media: qcom: camss: Add missing clocks for VFE lite on
 8775p
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-vfelite_fix-v1-2-2ee7de00dee7@oss.qualcomm.com>
References: <20260313-vfelite_fix-v1-0-2ee7de00dee7@oss.qualcomm.com>
In-Reply-To: <20260313-vfelite_fix-v1-0-2ee7de00dee7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773394942; l=4297;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=aYlnAxglJ0SkBe9bSJiNOkAamR+qP8ypBYPxuYyvRpI=;
 b=CsCj2+bQSt+QLfCJ0WGnbEoSvZIahJk8BNhAM3IMXLaFUUeTq6a/aGCRyQr1WwbGYxcAImvXO
 hPRfkgeFgy2ApXOwcIC0ABCv4X4cVxdUkayFS7UqgWJTfNfH8qX9RL8
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: NQ1beMamxIXlTkgfK4RVaJqgpoyYkfXz
X-Authority-Analysis: v=2.4 cv=FLwWBuos c=1 sm=1 tr=0 ts=69b3dc0e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=GdtaQf2j5X7DlKrz3VsA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA3NSBTYWx0ZWRfX4zSskiPv07Ol
 qo0EHTwqeW92dYD+lCxv/dYIIqpcTw4Faq+Fb2Lo2vrBrPQ2sYmnFd3RK5HMuuKcdIzFZ/2qcie
 Th1QXJ67LRqGwlU9PV6np3JiANpggO9cdNc5dGd3EIAzo69JQ69/BS+S7q/Dh9FpBOA4mpbYFov
 DAYhGlcDrkgc7s05jE2CXv9EC17a0fP6o317CXS0FWn5l+uoqrU9nspiJiDlnt5+KhRrQBGvJ0L
 q0lVnm4eKXp8lHcro4tZIiJlQGZk9nrk86O4nc9Agxev74OO39sUf29EBBZMWgj1j6RRVRfMS3s
 1KR9ismR5/D3Gs26nDQr03AN8jjgeSeieBO3xIMDnR6qeEvbB0VlnDQRmsdieyyjiIOcZu2xg8m
 x/XjH2YUMAstRO5xQoNdQj6WRPGDtEzCY7tbxsfzrslDZptmD2uWkhyshf/SsSE1fcfmfSJpVVo
 2lXvgSsoCm5dm6r3R6A==
X-Proofpoint-GUID: NQ1beMamxIXlTkgfK4RVaJqgpoyYkfXz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130075
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55633-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: D3549280B11
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add missing required clocks (cpas_ahb and camnoc_axi) for VFE lite
instances on 8775p platform. These clocks are necessary for proper
VFE lite operation:

Fixes: e7b59e1d06fb ("media: qcom: camss: Add support for VFE 690")
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 40 +++++++++++++++++++------------
 1 file changed, 25 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 4a0bf8acd7645f8cd8c1b4cb9b6ff6f3a54d42e8..d325539defbecc7f4fbcb9d20fb69884e109a459 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3746,15 +3746,17 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
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
@@ -3769,15 +3771,17 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
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
@@ -3792,15 +3796,17 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
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
@@ -3815,15 +3821,17 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
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
@@ -3838,15 +3846,17 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
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


