Return-Path: <linux-media+bounces-54793-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFz3AETgqmlqXwEAu9opvQ
	(envelope-from <linux-media+bounces-54793-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 15:10:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 681B62225B0
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 15:10:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D3D6319A9CA
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 14:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD9013B4E9C;
	Fri,  6 Mar 2026 14:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h/mhVq0P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B0b+zU/M"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F823ACA53
	for <linux-media@vger.kernel.org>; Fri,  6 Mar 2026 14:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772805775; cv=none; b=KFcejr1WPZjGTdtVddVdSzZUST4l4UPuBPe29o9SXuYgLRQbk+muEcEmSITTWHSXIAgOm32T3y+JejnacuV8XgMJEvUHioZQl9x5gJrFOPet7trIw7w8VWKxLFirHymwVtlLPPabyJw7Nz+PQ1Js74JEzariEfnAy4dK0irJgW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772805775; c=relaxed/simple;
	bh=ctsKjQ8pwXwqej/Qj+cFPJCHHMHgaW3LzO3MUBGDncA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cgkB+MZ4aQr6LR25dK6GIWy7aebZMnwmFWodlPUjUQot9FrGORZM1660PS8IiZDLeWDiKC7kMmC3Rj39p6/niGHpNOSyOahK7xIELzEPtXg/Rf+9lzL5KslLvsmqOyMPnyuJmnA/HTLnZNNq9Ko76CK3JsTWAWAaB44k6/Xs3Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h/mhVq0P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B0b+zU/M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626BbdKP3257833
	for <linux-media@vger.kernel.org>; Fri, 6 Mar 2026 14:02:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sy/C6mL1bqk
	mxcisFCIjaSDenP5o5m7Jb+jd871MGQc=; b=h/mhVq0PwoXa0w8df6nLYD4qUQ2
	YN9biAKyuXvMi1ye54dVXzDbclOZZP3sxdIaqk9i8NTs2IAXwwkEPbJt3mhNAGvX
	pGSpHcQhSjpkhjti++QU/YUwSKicdqnjIYAg2Ibx/0jQTYFnJvjW7DQ1nq9Bp0xp
	oYsV1yjmVuN2NQ4+GE8kizUCEHmWkustPX3QdBhVk5NV8oOODQCOOpQZPT5sMYzh
	EoTFke7AQjSW93EwrG7lhlJhh4tP76zcvrGJYIKpjvVw31T5FVvzd2bJ5afcpwuB
	1Zb+Yj30js/sLuNnv9ML6MrFswPDajPo8jo4BYab0ku6t4+HngEabK3eAvQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqg09uabs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 14:02:51 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-94e02ad7228so66914055241.0
        for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 06:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772805770; x=1773410570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sy/C6mL1bqkmxcisFCIjaSDenP5o5m7Jb+jd871MGQc=;
        b=B0b+zU/MtpzTZjXejb79YaUmZEAS6Io41JEw9HAOOVuAXzIvz3juv4uKInXMkPs4m/
         7CX0dR12G7oxOFnyo8fWwpXEJ7vDW8Qm+h53jdbFYMzBunmseL8WaBN+lxwv7PG+PV4/
         UTxqTUQ5zvY8Yvs8u+fXMp8DMw3xRWbZ7QqPCzYxJvqLPjq83SNTwVIDII1+cZ04IQzK
         5A0jAGnuti/XphVkSApNsfe8iycIPHSUR9okS/E5KmHl+tXvg6VzFPlLpetsrgitJpPU
         Q7G376S2htmKaGPxCMof6TNKgLgLQt4EPtvrIJEgXveaMlwsehPxayjmMzk5eSjB+7cZ
         dvAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772805770; x=1773410570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sy/C6mL1bqkmxcisFCIjaSDenP5o5m7Jb+jd871MGQc=;
        b=hkMFofA2/jHp/bMzK68G7TNUhPBDZ2Y2WIgO1F8UoFTuhRX9ogcvxCqpcGj81bMenh
         +3K2iq9fvvU2WBj0MjUuZB8NzVB3mWtQ5PAAoTuufEi80Zui3Mv3vGoQouUEllGduFRH
         bQOiq4U/Iy5ZkEmruLE9/eHdkUNNgLyhNTqagcTjUvGwzCZJw3+QP5FPbqMkwBt+QpT8
         Xi5KQdJg2J3fOlX6yMiis6XugHLLNvZq3sI1nsMo5DXe9mBgy2PYbR/tKHlTMaHMw05+
         cCTiuaZVY0Z0uhi2wMMLe7CtaWnrx7sO4/Z1h2BE2yqrVaPqRCecaWukBnXgksf8oHQg
         BHaw==
X-Gm-Message-State: AOJu0YzXEumgcQub3zvvAkV0eFb6hQLERxUNCNbHACfu9VprSBoXzV4P
	bM5pBUeC5MfPHFqZwH8w3q0v6Q/C+8Lnzr4+F4qdLrUmce9fAG8zYi3aOcnWFBXTm+MJo2r72i+
	2EVdQsk3BSvDCRrloMBhTOPSxLi++OZFVd3qcJ4izmADhaeRRp4etFQohkCN/JZ/qwQ==
X-Gm-Gg: ATEYQzyX82jCzhO6w0c+9CFNdsKND6DoJ8MxOXoohCW+pzvnXjQ8nxx92afDamDYGaW
	J/0ZTn5vm2CiAAgqo8QzXrSeb8hfhl7sONrtRFUum/cmBj0nEXHmv6LuPw/igCEh6Rq9Gmd6eNM
	P2hKqV/5u/Z/Ik06cNygimdbZMn1EZEtpQ/85GLNsoghYcpl38wP4EERR3oZ3Xkuj0k2jd0jgkD
	dz4ropa0r4ryKk760ayjuYEERZ9efSvSISui6g1USuhqwSPsxufiEhD6uMSA+OQda26zCsqqwiN
	rIHz3l934KL4b5oSu8h6YmngiEI7Sdb7fJqYl9hem+Iow3uI45rayu7SEP+UiFVIes/VZ8EkH4C
	0D3q84DwoMZmPTQIW5J5hAnq2CrQbEXgIKE7hAot2Y2hd2Vbc/8mmtpoWpMhpVf+WWwIk4186EX
	MNMB244E6Rzommr5B4GaJvB7vOJizMkkrf+UHfUw7JOw==
X-Received: by 2002:a05:6102:3e93:b0:5f5:320c:4d36 with SMTP id ada2fe7eead31-5ffe639be56mr739517137.40.1772805763866;
        Fri, 06 Mar 2026 06:02:43 -0800 (PST)
X-Received: by 2002:a05:6102:3e93:b0:5f5:320c:4d36 with SMTP id ada2fe7eead31-5ffe639be56mr738605137.40.1772805755002;
        Fri, 06 Mar 2026 06:02:35 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485237f2d2bsm20171425e9.4.2026.03.06.06.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 06:02:33 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v3 4/5] media: qcom: camss: vfe-340: Proper client handling
Date: Fri,  6 Mar 2026 15:02:19 +0100
Message-Id: <20260306140220.1512341-5-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260306140220.1512341-1-loic.poulain@oss.qualcomm.com>
References: <20260306140220.1512341-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: D4km4nXP2YJ1hBNVq9Wzu38We8T82_1S
X-Authority-Analysis: v=2.4 cv=b/u/I9Gx c=1 sm=1 tr=0 ts=69aade8b cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=h8qAYbA_W9CmfXd5NcUA:9 a=SNiEU36zzXyr6W74:21 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: D4km4nXP2YJ1hBNVq9Wzu38We8T82_1S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDEzNCBTYWx0ZWRfX6YO9WFR85Evt
 vCrI5U6B5+OJn8cYSvsmi7jLTN6puzQeim/CfbPF0c1S2iphDoxro2HBxhcAj5pDGTmo6be0t2B
 hicOp1h1HvXZHcnp7wXpsfWlTUNE0nSxr0+kY51ORwKrYpcfw/RKwDCKqZ4jghqihYR03dUi0m9
 VMsU05OGIuOVoSf5kOcV0dwziejW+Z7yUZqOJq6g5+oHm6yu75NmHL5nbSA74MvzvKgw84rSwqW
 B8eHIA1Pr4eChQdRuoXxErmZEfC23jPQJk4kLG+uMx49byldxZ38sg+CddPoYGNKGvxtFwlaInp
 4ZxDI2xe7B7Pg43yAShYuuXeGT6G4l5d3GQsXgJXT/MHt/yjIyouZllfcLsptv/jHmAFe6czFkd
 7+1hcD5RreTvZn8vLWHQ3Uod3DfQhdDcT2NnyAkYEu4ws3nGYHS9NJeqYEQI7J3ffwfXX544w5U
 OJITmAIqe+T6VWP/fzQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060134
X-Rspamd-Queue-Id: 681B62225B0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54793-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

We need to properly map camss WM index to our internal WM client
instance. Today we only support RDI interfaces with the RDI_WM
macro, introduce a __wm_to_client helper to support any interface.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-vfe-340.c | 94 +++++++++++--------
 1 file changed, 53 insertions(+), 41 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-340.c b/drivers/media/platform/qcom/camss/camss-vfe-340.c
index 30d7630b3e8b..2f8205fa40a4 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-340.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-340.c
@@ -69,24 +69,19 @@
 #define TFE_BUS_FRAMEDROP_CFG_0(c)			BUS_REG(0x238 + (c) * 0x100)
 #define TFE_BUS_FRAMEDROP_CFG_1(c)			BUS_REG(0x23c + (c) * 0x100)
 
-/*
- * TODO: differentiate the port id based on requested type of RDI, BHIST etc
- *
- * TFE write master IDs (clients)
- *
- * BAYER		0
- * IDEAL_RAW		1
- * STATS_TINTLESS_BG	2
- * STATS_BHIST		3
- * STATS_AWB_BG		4
- * STATS_AEC_BG		5
- * STATS_BAF		6
- * RDI0			7
- * RDI1			8
- * RDI2			9
- */
-#define RDI_WM(n)		(7 + (n))
-#define TFE_WM_NUM		10
+enum tfe_client {
+	TFE_CLI_BAYER,
+	TFE_CLI_IDEAL_RAW,
+	TFE_CLI_STATS_TINTLESS_BG,
+	TFE_CLI_STATS_BHIST,
+	TFE_CLI_STATS_AWB_BG,
+	TFE_CLI_STATS_AEC_BG,
+	TFE_CLI_STATS_BAF,
+	TFE_CLI_RDI0,
+	TFE_CLI_RDI1,
+	TFE_CLI_RDI2,
+	TFE_CLI_NUM
+};
 
 enum tfe_iface {
 	TFE_IFACE_PIX,
@@ -108,6 +103,13 @@ enum tfe_subgroups {
 	TFE_SUBGROUP_NUM
 };
 
+static enum tfe_client tfe_wm_client_map[VFE_LINE_NUM_MAX] = {
+	[VFE_LINE_RDI0] = TFE_CLI_RDI0,
+	[VFE_LINE_RDI1] = TFE_CLI_RDI1,
+	[VFE_LINE_RDI2] = TFE_CLI_RDI2,
+	[VFE_LINE_PIX] = TFE_CLI_BAYER,
+};
+
 static enum tfe_iface tfe_line_iface_map[VFE_LINE_NUM_MAX] = {
 	[VFE_LINE_RDI0] = TFE_IFACE_RDI0,
 	[VFE_LINE_RDI1] = TFE_IFACE_RDI1,
@@ -126,6 +128,16 @@ static enum vfe_line_id tfe_subgroup_line_map[TFE_SUBGROUP_NUM] = {
 	[TFE_SUBGROUP_RDI2] = VFE_LINE_RDI2,
 };
 
+static inline enum tfe_client  __wm_to_client(u8 wm)
+{
+	if (wm >= ARRAY_SIZE(tfe_wm_client_map)) {
+		pr_warn("VFE: Invalid WM%u\n", wm);
+		return TFE_CLI_RDI0;
+	}
+
+	return tfe_wm_client_map[wm];
+}
+
 static inline enum tfe_iface  __line_to_iface(enum vfe_line_id line_id)
 {
 	if (line_id <= VFE_LINE_NONE || line_id >= VFE_LINE_NUM_MAX) {
@@ -209,10 +221,10 @@ static irqreturn_t vfe_isr(int irq, void *dev)
 	status = readl_relaxed(vfe->base + TFE_BUS_OVERFLOW_STATUS);
 	if (status) {
 		writel_relaxed(status, vfe->base + TFE_BUS_STATUS_CLEAR);
-		for (i = 0; i < TFE_WM_NUM; i++) {
+		for (i = 0; i < TFE_CLI_NUM; i++) {
 			if (status & BIT(i))
 				dev_err_ratelimited(vfe->camss->dev,
-						    "VFE%u: bus overflow for wm %u\n",
+						    "VFE%u: bus overflow for client %u\n",
 						    vfe->id, i);
 		}
 	}
@@ -235,49 +247,49 @@ static void vfe_enable_irq(struct vfe_device *vfe)
 	       TFE_BUS_IRQ_MASK_0_IMG_VIOL, vfe->base + TFE_BUS_IRQ_MASK_0);
 }
 
-static void vfe_wm_update(struct vfe_device *vfe, u8 rdi, u32 addr,
+static void vfe_wm_update(struct vfe_device *vfe, u8 wm, u32 addr,
 			  struct vfe_line *line)
 {
-	u8 wm = RDI_WM(rdi);
+	u8 client = __wm_to_client(wm);
 
-	writel_relaxed(addr, vfe->base + TFE_BUS_IMAGE_ADDR(wm));
+	writel_relaxed(addr, vfe->base + TFE_BUS_IMAGE_ADDR(client));
 }
 
-static void vfe_wm_start(struct vfe_device *vfe, u8 rdi, struct vfe_line *line)
+static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
 {
 	struct v4l2_pix_format_mplane *pix = &line->video_out.active_fmt.fmt.pix_mp;
 	u32 stride = pix->plane_fmt[0].bytesperline;
-	u8 wm = RDI_WM(rdi);
+	u8 client = __wm_to_client(wm);
 
 	/* Configuration for plain RDI frames */
-	writel_relaxed(TFE_BUS_IMAGE_CFG_0_DEFAULT, vfe->base + TFE_BUS_IMAGE_CFG_0(wm));
-	writel_relaxed(0u, vfe->base + TFE_BUS_IMAGE_CFG_1(wm));
-	writel_relaxed(TFE_BUS_IMAGE_CFG_2_DEFAULT, vfe->base + TFE_BUS_IMAGE_CFG_2(wm));
-	writel_relaxed(stride * pix->height, vfe->base + TFE_BUS_FRAME_INCR(wm));
-	writel_relaxed(TFE_BUS_PACKER_CFG_FMT_PLAIN64, vfe->base + TFE_BUS_PACKER_CFG(wm));
+	writel_relaxed(TFE_BUS_IMAGE_CFG_0_DEFAULT, vfe->base + TFE_BUS_IMAGE_CFG_0(client));
+	writel_relaxed(0u, vfe->base + TFE_BUS_IMAGE_CFG_1(client));
+	writel_relaxed(TFE_BUS_IMAGE_CFG_2_DEFAULT, vfe->base + TFE_BUS_IMAGE_CFG_2(client));
+	writel_relaxed(stride * pix->height, vfe->base + TFE_BUS_FRAME_INCR(client));
+	writel_relaxed(TFE_BUS_PACKER_CFG_FMT_PLAIN64, vfe->base + TFE_BUS_PACKER_CFG(client));
 
 	/* No dropped frames, one irq per frame */
-	writel_relaxed(0, vfe->base + TFE_BUS_FRAMEDROP_CFG_0(wm));
-	writel_relaxed(1, vfe->base + TFE_BUS_FRAMEDROP_CFG_1(wm));
-	writel_relaxed(0, vfe->base + TFE_BUS_IRQ_SUBSAMPLE_CFG_0(wm));
-	writel_relaxed(1, vfe->base + TFE_BUS_IRQ_SUBSAMPLE_CFG_1(wm));
+	writel_relaxed(0, vfe->base + TFE_BUS_FRAMEDROP_CFG_0(client));
+	writel_relaxed(1, vfe->base + TFE_BUS_FRAMEDROP_CFG_1(client));
+	writel_relaxed(0, vfe->base + TFE_BUS_IRQ_SUBSAMPLE_CFG_0(client));
+	writel_relaxed(1, vfe->base + TFE_BUS_IRQ_SUBSAMPLE_CFG_1(client));
 
 	vfe_enable_irq(vfe);
 
 	writel(TFE_BUS_CLIENT_CFG_EN | TFE_BUS_CLIENT_CFG_MODE_FRAME,
-	       vfe->base + TFE_BUS_CLIENT_CFG(wm));
+	       vfe->base + TFE_BUS_CLIENT_CFG(client));
 
-	dev_dbg(vfe->camss->dev, "VFE%u: Started RDI%u width %u height %u stride %u\n",
-		vfe->id, rdi, pix->width, pix->height, stride);
+	dev_dbg(vfe->camss->dev, "VFE%u: Started client %u width %u height %u stride %u\n",
+		vfe->id, client, pix->width, pix->height, client);
 }
 
-static void vfe_wm_stop(struct vfe_device *vfe, u8 rdi)
+static void vfe_wm_stop(struct vfe_device *vfe, u8 wm)
 {
-	u8 wm = RDI_WM(rdi);
+	u8 client = __wm_to_client(wm);
 
-	writel(0, vfe->base + TFE_BUS_CLIENT_CFG(wm));
+	writel(0, vfe->base + TFE_BUS_CLIENT_CFG(client));
 
-	dev_dbg(vfe->camss->dev, "VFE%u: Stopped RDI%u\n", vfe->id, rdi);
+	dev_dbg(vfe->camss->dev, "VFE%u: Stopped client %u\n", vfe->id, client);
 }
 
 static const struct camss_video_ops vfe_video_ops_520 = {
-- 
2.34.1


