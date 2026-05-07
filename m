Return-Path: <linux-media+bounces-60866-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHFPCGsX/WlLXgAAu9opvQ
	(envelope-from <linux-media+bounces-60866-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 00:51:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 259514EFED2
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 00:51:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E3183301B071
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 22:50:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 831182D7DC6;
	Thu,  7 May 2026 22:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mi5j+ZlJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ArQpPrT2"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0753D3D07
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 22:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778194216; cv=none; b=NIPuyWdlG9ucShA0MY7+mYrKpXs6akPPwjA3VqwwLfD5z1fMWKxAe5WSrVTeGLktJ+FSwHQSSbk5n0NfviovpBslp8m1BOliU4ytOizT8NfScVrSb5d5IvexPwC2kyfxj7GqspN1QkJdRsWBwjUmMoqOzjxGKSBH5Hy5RHLeo8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778194216; c=relaxed/simple;
	bh=d6sTldzr20rxqyeexiCHog1RigxMQcbtDegyP5w3YpA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u9OWlUhXdNYttNtCZA+QZBde3nw8OnVnU1oMbHUkRW1sjnbMVPhQ17A8PrdFv9UFYiUxKe8+ZNurcz9yW6UbazDlTTscknwBAizxtr37bnE/ihhf3Rva5qWGxW5faRc7ic1tryPEfi3D2TUj5Ncwfzazdbr58mv9banAWVFzNlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mi5j+ZlJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ArQpPrT2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647JrW652199588
	for <linux-media@vger.kernel.org>; Thu, 7 May 2026 22:50:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dQvxefKofl/MWew8drQPijHpKnkbQHmoKvevMGmHYPQ=; b=mi5j+ZlJdbfKBhd1
	Y6dLOtI2uozcHYMzVfe/0bwdeUBpGEvTuBh1uFUtEEdXlr0kkxbSjrZ0MbxG/Wc/
	2WiCDHULMGVuZe9n6J+HPk+eD1WZ4ycoo3v5d/bGEpJAmQbITKQb4hfRUYsrvfWA
	WYSkjH+OMJNTAfz/V5sjF1flMIS66yv1a06AWW5tTeimaa7FbUZxhubAmwWBbisq
	BEC8Xhipbp2t50SYtGzCtcJ/JgzuG8mF5ZFoPcW+2KPBYcJqaRl9zAhKnz5hUk3P
	Bq64Mit6uPyOUgzklRt6mkfNf6O7U+jDAzXrzMIStmfqAH+79bnQKQsd5g+D6Zz2
	UPJlZQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e119sgg68-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 07 May 2026 22:50:14 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9569b029e1cso1629545241.1
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 15:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778194214; x=1778799014; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dQvxefKofl/MWew8drQPijHpKnkbQHmoKvevMGmHYPQ=;
        b=ArQpPrT2oMGZeCYJKXVyrIkUPhB6yI7Qm/Sze8dFw7bFuc/7albtp+Sj2JtJgjVhSJ
         FKTdh/ouj9RcIL/x95DsDVTNgRW6H+NO11ZVGfHwNC5NEheAqxxico7ws9SsL7/OzJAW
         xglhmxEgxuq2xu3WwhSOJk5BEEM9OV96yxQQ3nAKRBUNWpNgccWTjnVPsAwhQ02HKgjV
         P/koEXgJ28DdCVQYBUkUHl/sQuBGbnTfB1I8NDXOXjqNqDbz0RqlHqkKG4L6PsVoYoWP
         V1Ef8bxPL+3T+4jgxGAu6pZG+N+MzBJG3HM6wuP8CvXtGlLgaY3Tv+A/+ugJqsUQxHBE
         VfLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778194214; x=1778799014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dQvxefKofl/MWew8drQPijHpKnkbQHmoKvevMGmHYPQ=;
        b=AsY18cp6101K6AbX+md1GZgAhl6ttyVimLard9ZoODqO60WMNfuPE4CL2XU+Tblz7/
         opGM1hAtiLURIO0XYFvzbjLDhCDFsRIqmvTSe+xgyAWyhU5In5LgbdSObBMcPHNEHMSy
         GRO54PsF5pi0Fb8sbvymkKIlyotNAQTbykKzd0znOr7V2cDgYgondaaTP3V6PogIH++s
         R0kwQy6GjY/N0XLKJrA1rDN2tKl/O7PSHtPjQ2Nco83A+IgibZHxCB2flCoV+TwZunuo
         dOPfBrOmqvxOSaAu3P/v3Uwspseu4BykTud2iPIWbn4Lb80lLJlUw7MgMWhRtFP7+sYA
         k6rg==
X-Gm-Message-State: AOJu0Yw4KfueuaqpWW2mSmIdHYLwYuGT9e3OzJKF4vDBf5ftDqanXTlI
	vT9nspWB/1V5AGbctALdibLtw3csN9sW5VlSU2FZreWIpiejI4cYAZgxdRZMWcmmMIgtu2raxJ9
	/XYRoA6ER3E8Rn3gyB6XNH9QWjTfd3SrhXlFgI5cm7t0timMKowYkGjP0M5yNXsbrMg==
X-Gm-Gg: AeBDiesDCT2uaoO2O5+JMpiLmLF//yEsdjkNPQEffGuKH8tBb2SCAlrUdi0XadIZJ6M
	deN+j3oweip+iHT8Tez7hyzF164ZCCFFBjktSO1OyHfTiuEKs0Gu7a2ABheog2fAJMIBtGZn/0F
	0rHRGEgT/xlcfW/vM+GoErsyCun6/Vmkdoqt1FsqtGQ504kG/I4L3ODSIfkr9hLEXVZ9569dzJw
	5n4F/Ysdz0WbyAT8jZrQj4ReXnJafvoA6Qc4NHrIOzzfJ+0MB+21zh+Pl/1OR1hEJ5AL+/0bY3x
	GkcpNNJzs4o9ZGp8b4Vlp2LeeaE6qF91k1v0tV03z5pFRsU8eEgIvwxx7QBGBu1B7LtrMkKg5/B
	eNmE5qbE1Jzzj7PFZcZWRhIiA+Z7BuWinuix3/kjh19TkfIVf6js6WTIyFrlENTO+wJKQjADLLh
	XGs6Q7z4mu+EEgiO6s
X-Received: by 2002:a05:6102:b01:b0:631:3b92:9dcc with SMTP id ada2fe7eead31-6313b92aa4emr424412137.27.1778194213784;
        Thu, 07 May 2026 15:50:13 -0700 (PDT)
X-Received: by 2002:a05:6102:b01:b0:631:3b92:9dcc with SMTP id ada2fe7eead31-6313b92aa4emr424408137.27.1778194213371;
        Thu, 07 May 2026 15:50:13 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:b16a:3475:ec42:bcfa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac4359dbesm102466b.48.2026.05.07.15.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 15:50:12 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 08 May 2026 00:49:18 +0200
Subject: [PATCH v3 03/15] media: qcom: camss: Drop top_ahb/axi from QCM2290
 subdevice clocks
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-camss-isp-ope-v3-3-bb1055274603@oss.qualcomm.com>
References: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
In-Reply-To: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, johannes.goede@oss.qualcomm.com
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDIzMSBTYWx0ZWRfXxViQ2jEwhhad
 Sd34XRmVhgbt/nGdI4hrC4BSnE523493/RGW6BxwUWWsEx/WH99j1yTbvZT5IuMBVf4uIGJ8NbJ
 4uoMi1Oqa9VRH4iUIbH5vQaFCpTON2fQFTHINrrO0L0ytqKOFEQVtl9QoDFvOlQOQwFV+p2mewC
 k5siWg4m4K8xr8bxzqqOfuEXSWpoOHvP874bEnQCxYA/PvN20b5TPCJAg+ttsK4NwrYoMZssNru
 MQKPc+ADnwK2Edi5MzeGTItiLQaFp/GyjE1klxhvhsR2xpyERkG1eF/QAz4pSWkQcDwpdHd9XAk
 dSuZ/llmHlmVb6C40NCocA+mZOMxMYjRquAqmSiRetFRmTfvMZAtof4hBJCLUlrKP80DdOY83KV
 KVBIPEUYl49nwojOf6GZRWbxG0XoCRPdTgZ6voBBH8oVvxDsP/f0HXYA9t3q4cmAzuzLeKR2YAP
 ajN5xTrvU0rglEow8Xg==
X-Proofpoint-ORIG-GUID: e-OqYlwmRQPzQSrrZ5F-IxuwtHo_pVQQ
X-Proofpoint-GUID: e-OqYlwmRQPzQSrrZ5F-IxuwtHo_pVQQ
X-Authority-Analysis: v=2.4 cv=Dd4nbPtW c=1 sm=1 tr=0 ts=69fd1726 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=yFrQIQtVvbDJ7NVWecMA:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070231
X-Rspamd-Queue-Id: 259514EFED2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60866-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Remove the top_ahb/axi clocks from QCM2290 subdevice clock lists.
These clocks are now handled centrally as a global CAMSS PM clock
and are automatically enabled when any CAMSS child is active.

This avoids redundant clock references in individual subdevices and
ensures consistent clock management across the CAMSS pipeline.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 3bde26c4750ea932ea69fdbf5c5da9f959e5e5e2..0ceab12d573ee7521d44b77d23ee563930d6aac3 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -663,9 +663,8 @@ static const struct camss_subdev_resources csiphy_res_2290[] = {
 	/* CSIPHY0 */
 	{
 		.regulators = { "vdd-csiphy-1p2", "vdd-csiphy-1p8" },
-		.clock = { "top_ahb", "ahb", "csiphy0", "csiphy0_timer" },
+		.clock = { "ahb", "csiphy0", "csiphy0_timer" },
 		.clock_rate = { { 0 },
-				{ 0 },
 				{ 240000000, 341330000, 384000000 },
 				{ 100000000, 200000000, 268800000 }  },
 		.reg = { "csiphy0" },
@@ -680,9 +679,8 @@ static const struct camss_subdev_resources csiphy_res_2290[] = {
 	/* CSIPHY1 */
 	{
 		.regulators = { "vdd-csiphy-1p2", "vdd-csiphy-1p8" },
-		.clock = { "top_ahb", "ahb", "csiphy1", "csiphy1_timer" },
+		.clock = { "ahb", "csiphy1", "csiphy1_timer" },
 		.clock_rate = { { 0 },
-				{ 0 },
 				{ 240000000, 341330000, 384000000 },
 				{ 100000000, 200000000, 268800000 }  },
 		.reg = { "csiphy1" },
@@ -699,9 +697,8 @@ static const struct camss_subdev_resources csid_res_2290[] = {
 	/* CSID0 */
 	{
 		.regulators = {},
-		.clock = { "top_ahb", "ahb", "csi0", "vfe0_cphy_rx", "vfe0" },
+		.clock = { "ahb", "csi0", "vfe0_cphy_rx", "vfe0" },
 		.clock_rate = { { 0 },
-				{ 0 },
 				{ 192000000, 240000000, 384000000, 426400000 },
 				{ 0 },
 				{ 0 } },
@@ -717,9 +714,8 @@ static const struct camss_subdev_resources csid_res_2290[] = {
 	/* CSID1 */
 	{
 		.regulators = {},
-		.clock = { "top_ahb", "ahb", "csi1", "vfe1_cphy_rx", "vfe1" },
-		.clock_rate = { { 0 },
-				{ 0 },
+		.clock = { "ahb", "csi1", "vfe1_cphy_rx", "vfe1" },
+		.clock_rate = {	{ 0 },
 				{ 192000000, 240000000, 384000000, 426400000 },
 				{ 0 },
 				{ 0 } },
@@ -737,10 +733,8 @@ static const struct camss_subdev_resources vfe_res_2290[] = {
 	/* VFE0 */
 	{
 		.regulators = {},
-		.clock = { "top_ahb", "ahb", "axi", "vfe0", "camnoc_rt_axi", "camnoc_nrt_axi" },
+		.clock = { "ahb", "vfe0", "camnoc_rt_axi", "camnoc_nrt_axi" },
 		.clock_rate = { { 0 },
-				{ 0 },
-				{ 0 },
 				{ 19200000, 153600000, 192000000, 256000000, 384000000, 460800000 },
 				{ 0 },
 				{ 0 }, },
@@ -757,10 +751,8 @@ static const struct camss_subdev_resources vfe_res_2290[] = {
 	/* VFE1 */
 	{
 		.regulators = {},
-		.clock = { "top_ahb", "ahb", "axi", "vfe1", "camnoc_rt_axi", "camnoc_nrt_axi" },
+		.clock = { "ahb", "vfe1", "camnoc_rt_axi", "camnoc_nrt_axi" },
 		.clock_rate = { { 0 },
-				{ 0 },
-				{ 0 },
 				{ 19200000, 153600000, 192000000, 256000000, 384000000, 460800000 },
 				{ 0 },
 				{ 0 }, },

-- 
2.34.1


