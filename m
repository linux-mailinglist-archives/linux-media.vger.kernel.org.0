Return-Path: <linux-media+bounces-59671-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8APXFkZc72m3AgEAu9opvQ
	(envelope-from <linux-media+bounces-59671-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 14:53:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A3856472D92
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 14:53:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D98D30A77F9
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 12:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 645F73BE145;
	Mon, 27 Apr 2026 12:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G6+nG4/S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vv1g8Tf6"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0B83BC68A
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 12:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777294008; cv=none; b=bSiCvTrbfzjLvB2P9L37khMeN4scPoiKz040/mvLSFZYCAoAk/niSQpY9GTIbdJAiOcRC8Qkru9KlqxGqbAoUS8UMVnLGhXADRzSlvHI/PqKIIEzOmpjgX8BMPv6fAhgU+xCQvXcrR4CEIdg72BEScFrzZu8JMTgD4LU0/0P9oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777294008; c=relaxed/simple;
	bh=20WLnkiYWDQEOKwJiDNPOzP1Og78Nshg+iIm1A20VvE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sgzL2Mh+Z15r0pcdZ2FiS0fvnHzbRf10XWbvjav/mVfTj8yflzMX3X0mLBYaR1a1SGZe6DFDPPAEMuq/hVmoY8TNJyO7JoJ3U0KGZjgok9nVZh7T3K95c1eZHiOVjXTOMMtj9RAVBzWt8PlISfJXfkbNLxRY4uVdU32pbVFboBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G6+nG4/S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vv1g8Tf6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TBd3665650
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 12:46:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0rj2JamDaDnv/s7jI1Vm/rkzZOBtp55LTzg2o5dZC7s=; b=G6+nG4/SWFx3ErrK
	UsnkIxKAviaOcZrqkJhfVlmOmbHoQzjgInzE76+F9jqEJRA18gFD2uktvRJSUQ6C
	4N9Ql9YDNEKkztC1cCidMFzTvuSuhClbSb/nvjjimlVbmXhCpCkr0RKK5VLQGsfF
	j29a1QNebdiFh6bk8yZwvQZZ8axh3iM3XNoya32/60lLGvc4VMG+JhcEQRHWJL26
	Hlwlxb6cbPuvT2SHiR/odV23rSda1dvRxaY3x+2Xlf7mp59M8Gj0GuXPdDv64rva
	qd3+3TTDarwBXBKyGKV5CBtRSapgTvbeBUEDkTBIpMASK2Banbu5An6qfCIqY6Wb
	C0vtGQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt30n1d2x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 12:46:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50fb3c7b989so113825601cf.0
        for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 05:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777294003; x=1777898803; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0rj2JamDaDnv/s7jI1Vm/rkzZOBtp55LTzg2o5dZC7s=;
        b=Vv1g8Tf614rePhjf5rlkqimSv9sOhCtmKzRxPyctx9LuU46ck/2XmGQwGZhIsIs8Ds
         5MquywZMwhSHVml8L0rNJUYF7BW+ZNdrp9Su8Z17RZjqwGFSJGfRH6wABO6jFM8T/xve
         W9WVPHw6IvuAZQwCnJsT9IEKihbH0H3OrWNCWZ4M9ySOhBzS9te8q8Xded6AIiEQVVJb
         Yi4xnoWI0IUBWLrkCnbxn2eJcK4USgh3XCTDyclgK5yvEucf+uLwGNcVTu6Ub+RcW9fH
         fnCVijCTwr/1F8HezX/GgTPzRTuWLBFchP7Pjg20ZsiFscb+VmI0zpPjSinbLt6mndis
         P/Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777294003; x=1777898803;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0rj2JamDaDnv/s7jI1Vm/rkzZOBtp55LTzg2o5dZC7s=;
        b=a/HAfslewd1GHHgZ/oBxskBrouTbRMoAZbyKx8BFkU4CeSVYefTtEYAMnA00P4/kfS
         GUW2PaxpvOg/8Vw4ZPaRejD0aahlGQ/XR/ycnjZmlv3SsiZm3HTvhV5HF/sl7cnYc5/R
         UmbUZnvdsMfiMnppKU9GLUGbtr5pUox1XqoumM5IqRXgN3Gj2MP2PHDTIzdEVhD4OlvZ
         R+s0mAcUWWcpKOIaOHEr5GckkeT8CUYR8vHwMWSjrER8qn9taL1RG8J5rGckbk/TwpMJ
         Fd8D7Agy1yFVKLOcVe4bVqbPPz1m4cwSzb+qYMPqvlmiVu7C/zFgf51sbcgZ2Ax6lZZM
         8wRw==
X-Gm-Message-State: AOJu0YxomLxhNsF0LcGqKcHWqXNWgO+KCCfndvGGmQOXW1mbSlPbkngh
	SwCOQwNOLTnxv51YC+ZJWwqDQC0NjfAveSXaIGpDFQaSIWi5HObQjNRUNrqR1YbJazBD494HIct
	xAOWOtTfDkA9hpFWcd6q6kWCTcjV4+bV+dlH+lXSl/lAF3Pw9+sWh0rl/rsVno2lzdA==
X-Gm-Gg: AeBDietcdlSI9A3KA5IId7cWYwsZJYMhUipSoOk77T9mrIgfb5FcFeBJr2nOm3+TbZK
	vc1BeNhbxbl4bAO0LP6a3/jm9vCBJxoU3N5YKkOKDqJf5Pdl2l4Ypt815CmRiQ2rUXhq1z8VCxf
	rg10mZc3Gga0UtmWRrebvI0LGICpHDc6t7Oh+iINZjypU+gKfcCEAaXO10duXNts3jn4zYWwhlt
	fF6iYNZJIQ6BpDXU1IIrTU3pK6QKqCWD3iL7LFYUTfENDwIoV99lHOPNuwmSHHWES/uSy0WiVGC
	cSptWEUL3cjfuds2slhICqpfAshMD0LSProAisrXGxrrvNoQLkddSKxnl80m8gY+BIv3dOLRnoS
	QYexXOsKmN5A12AkM/Pxs1zG/MPNjPq9rJG/ilC+3KLwYEpd3UjYh6QaGqRq8eBPFwcR+3g1ypH
	fLDBI9tO41BjRIeNHNBdB2y9YS3Aw=
X-Received: by 2002:a05:622a:2615:b0:50d:8792:b6d1 with SMTP id d75a77b69052e-50e36c122efmr629758901cf.38.1777294002724;
        Mon, 27 Apr 2026 05:46:42 -0700 (PDT)
X-Received: by 2002:a05:622a:2615:b0:50d:8792:b6d1 with SMTP id d75a77b69052e-50e36c122efmr629758091cf.38.1777294002214;
        Mon, 27 Apr 2026 05:46:42 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:653f:4d28:6a78:a6ca])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1bd19sm1091496866b.37.2026.04.27.05.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 05:46:41 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 14:43:31 +0200
Subject: [PATCH v2 04/14] media: qcom: camss: Drop top_ahb/axi from QCM2290
 subdevice clocks
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-camss-isp-ope-v2-4-f430e7485009@oss.qualcomm.com>
References: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
In-Reply-To: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
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
        kieran.bingham@ideasonboard.com
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEzNSBTYWx0ZWRfX2ueTWYLSt7Dt
 ZH0p+tGlKd9cyfN2fbYvNo9auV6jv+uC+B+ks4QxH3z81c0ITgdjLlLhLzuB6V1FTS/Nqw6L33S
 hZkExI+c8BxDrywf/niDQUgBB3OADzlPT2mgSxdr2oXsEPZPfgSzAFGha69SExf3slo+YTTTa0q
 Zzsk14E1zMKwwl2yk9r2IOGcTVQ7c8uoUpNrhmG70WfHdYIKwow71qxD3oBz0rIkZH/3MReTalY
 wdSMKGHjOW4sFUMoL9oJ02GuUokWln2xasJhywlazM8VMbGwVcw0ZplHrhG8uQg5MbQLrtRiPkL
 /ZDytalgNb9gHN5ACNVLf2sO5O2Cppvji0qEaW9ln7mcPZfumvcrYuCTULPrt3jf8qV3VpThglM
 2PzeKIXhOaj5DURIhmQ5vpjUTwHa4vVEAsh2nPTcaBhKPNyUawgZA4bmPAFE0jOByTsxFUO15I4
 f2kZUAg4z0+p/22XQMg==
X-Proofpoint-GUID: _PpT1j14x4o4xCcg5mDQDePLu-oZQN4K
X-Authority-Analysis: v=2.4 cv=efANubEH c=1 sm=1 tr=0 ts=69ef5ab6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=yFrQIQtVvbDJ7NVWecMA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: _PpT1j14x4o4xCcg5mDQDePLu-oZQN4K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270135
X-Rspamd-Queue-Id: A3856472D92
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-59671-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

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
index b2b0afc3fb5f597622f9b4ebfee2ec6703bf0890..1fa42565c28a8cd461771821518875a8f468834c 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -664,9 +664,8 @@ static const struct camss_subdev_resources csiphy_res_2290[] = {
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
@@ -681,9 +680,8 @@ static const struct camss_subdev_resources csiphy_res_2290[] = {
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
@@ -700,9 +698,8 @@ static const struct camss_subdev_resources csid_res_2290[] = {
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
@@ -718,9 +715,8 @@ static const struct camss_subdev_resources csid_res_2290[] = {
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
@@ -738,10 +734,8 @@ static const struct camss_subdev_resources vfe_res_2290[] = {
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
@@ -758,10 +752,8 @@ static const struct camss_subdev_resources vfe_res_2290[] = {
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


