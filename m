Return-Path: <linux-media+bounces-58765-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGEIFuaM3mkIFwAAu9opvQ
	(envelope-from <linux-media+bounces-58765-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 20:52:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8623B3FDD6E
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 20:52:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BCEAA3008988
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 18:52:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9233243956;
	Tue, 14 Apr 2026 18:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P+GUrJm1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dct7m+a/"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA39256C6D
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 18:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776192739; cv=none; b=HzgD6GMyJYCLUP5vh0eRGhpXEOuMAkV6uLBiF/zEkMY6Q558ojxXE4Aiywy5UAEtC7CKiO3pEaM7d9zjrpg9XQjZ7oAIud4s0RKxVfynGXCkFRg4QLqONg5zqS1qy8JhY1b/4MTCFaueZ5+2km9HoCrPGNXC8lhp4L4DkHUC3mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776192739; c=relaxed/simple;
	bh=41LvelB3Dy4guB3M350KtxQCMur3c2nxHitY+kM6BwE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WDruT4W4w/iU4dMYd4Fv3FGkj20V0a3Uw1xAISVb4ip9nQKzIr/8L5xkHW+kaJTDC33HtnP5PE3+sWnFUa7vwlMI4xDVpNzao6h+JCnH0mIEBaK70pQx6pmt+plIudZdApEqHk98Ac4ie+sXNfDTj28C1RgTIAE0FTSr/W26E6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P+GUrJm1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dct7m+a/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EG4Uoo2005529
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 18:52:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/CNyjT/H25b
	52bUAaCWWCIF4/kawI3jaNIwboVxFtxo=; b=P+GUrJm1S+1I3lTAzVe094pmZHI
	/VxE7Cll1h/tuYNBU+8VSpoXCGRBBCFE1AJTKp249lQ3GILx+WK81EA8BmtzlKWH
	46L42nwqhoB0FhFlcRvRgBAaJJ1yEueIiqBzS5uq6TXPlXCYtStE+7uL01iZUnTA
	jxOjYKuFmqfRe/X+cgmXDQa4MGVb1KuzSQb4CTHyoo5Hn76c1eWrbIaIyg4/BpE2
	wvQkvFZyjK+gAonid03Fn2jAEA5+w57t1vsq5bNkuOgxxffxAxB/uxc44m+dpy2z
	Eha0/0V3ZUZf2UGZLNNN7YUF/8W50IW3xhcV+4VS9ES52bs+fHDNz3hvnrg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhrsjrntp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 18:52:16 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4ca7e7c2so116880511cf.3
        for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 11:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776192736; x=1776797536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/CNyjT/H25b52bUAaCWWCIF4/kawI3jaNIwboVxFtxo=;
        b=dct7m+a/aM/gNdG1W4qXFPTZprgYEvMnEW0QN5Fs9Sv2ltKVWZ0KxMeonrN0KH4nHd
         /ChhuUfakhv15Rp/CM5TLZPaWha6yaIYhtjb4BuiSFUOZZEFvkNXPtr7kwnqehNVrdlT
         VXvIhU1gsvakzv2CZcxlE9558gtQufozeffHxiiTvg88H7XNemjAyq67gcyNBq54OPnq
         K3mf40aV89KtKS3aVmzRsoJ8Rd+s5YLgn7ELMIYiOb9g0JLRhH8c6KwKSqwTwNbNQJZZ
         KdCvtK2vXoJUynY0kG3+0932pU0KOO2Yg+khzAXuImQrQP5Oe9YYrJeP4arUWlkGP8MG
         Aflw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776192736; x=1776797536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/CNyjT/H25b52bUAaCWWCIF4/kawI3jaNIwboVxFtxo=;
        b=g0o9C2+QU6jy59Rl7RQfms+zTytIdyPlk62Q0rpqW7Q7h6wfEds7Zx5gfZIUbMwf05
         wsQHh4D6JOrX3Lw5Lj+YdXdJViZjmG8GslnTjVTkizW/27kjoeGTOsor/Qgs4xwCSli1
         SOG5OKMJESnMVfZCkD3ZBIPE0k/3BzHFopb5OHAzVE3tLl9Qtxb9lBIj63opBCFz+w8M
         e93h+RVJ2JDiGfk3BRj/ZIa0ScQenMIKOawDsrFUmoDNOqWYGIGJVNOwFk/Piv2OFkL8
         jVn/pc0OKDZ+dzYp6lwyOlL9XXBxkZmrw+Hn9VCzt6hYrt2YcRIznotM6SX4zbKF0Sow
         Z0/A==
X-Gm-Message-State: AOJu0Yy9kn5QF4BFpbT7BBablgDTKE66NFqTkbtVj9KzumDuQJnfz+DJ
	uzlsLH3SNBixVGRtglpL9ikJQtT0lra5AXA4k0I1auwhdQkySecrDZ14bbhW/DSlb4m338hnbas
	rezqZYkh23Svl32jgFiJKv2RoxJsy3VZyxMgYoCSc1OJAbMGWubfF1RrYr/Eajr622w==
X-Gm-Gg: AeBDiestcq5P1EokOzpGh1b50lHZO2vcf6qJryqOsZjA5eT8kP6KKE6vRk7SrN/VyLG
	DXPVm+nSwLKgAGzOxagjqeZ9P8K+5JZlOexf3/VJx9GjjQp8aSNLP4fqrRxBzSeBHzTrij7YnfC
	IY1j3McFTT4V8URmRr9EHSBUcOlMp3Ijip92M736xGFgA8426dQ9GfOd9aO9KSJKGmelJAmcBoR
	8sogz5V7pgx3O9YJgLNMJRG7WDrQB0dpXEy/KkNaE61ZOTd2dKMuEHHXqqdqpIEFM7RTVRL2JTF
	XKTNAYD6McxdnbmcqO8xmWfAr/V94VvqKYhMdlraastl7m1ClFxEMm8RSUldT6EHpYgDK02pXlF
	bRmn8rdhy+aJgkycx3pZrqIf4cXJHC7PhxmEv4aO7H+z+b1X2VulWF0rcwG19ekQPQMuTaMX9sQ
	ZL5czuZfGpsIc=
X-Received: by 2002:a05:622a:7b8a:b0:509:1b76:e9b2 with SMTP id d75a77b69052e-50dd5cafd39mr247028311cf.55.1776192736104;
        Tue, 14 Apr 2026 11:52:16 -0700 (PDT)
X-Received: by 2002:a05:622a:7b8a:b0:509:1b76:e9b2 with SMTP id d75a77b69052e-50dd5cafd39mr247027861cf.55.1776192735530;
        Tue, 14 Apr 2026 11:52:15 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:830:450:f062:40f:6621:e20e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6de97e9esm427647366b.11.2026.04.14.11.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 11:52:14 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v5 4/5] media: qcom: camss: vfe-340: Proper client handling
Date: Tue, 14 Apr 2026 20:52:01 +0200
Message-Id: <20260414185202.2714019-5-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260414185202.2714019-1-loic.poulain@oss.qualcomm.com>
References: <20260414185202.2714019-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=WKhPmHsR c=1 sm=1 tr=0 ts=69de8ce0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=1p3C7QevpJGBfu06fjUA:9 a=SNiEU36zzXyr6W74:21 a=a_PwQJl-kcHnX1M80qC6:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: gd6wmPP89sPyCwQZL4nEX5IvR5UXk-u0
X-Proofpoint-GUID: gd6wmPP89sPyCwQZL4nEX5IvR5UXk-u0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE3NCBTYWx0ZWRfX9kvkojn0WzlH
 DR6urnGhKHLr/tm2Pt9/uk/TzU6/9vULi5EFcXvXbiTuiHGs3YhKzzta6+TJ1xrCjkmIaqQmDoQ
 NGDT5bpBIlX13NkTz+rqYIEhQirkzN3bL2U9moFrj427spb/2ZoJmxpIyVHUSW1N84+Wo7U9ZgX
 gzft5+4Ry0b4n60+Yfm4XO3+gGqwRiE7tqjOdyU9n4nP8lfhpo2Hwz8g3RVCFQzeWEUmzhCs2Fm
 EBk7F8DFCErl50GZOjONdSkvtlER2NJAKUuwdPfTweNlMN8UOAU6HPFHGEm175CxYLAfDilU1Xq
 42CU863DAjc6PicRHCvNVK/VztT9r0JmPqD8rWAzMBwqWwRwCFg4/a7GUqGicwiUHBCO/8WZyVj
 w9zDsUmD4WpZG/Kdy8YS5fobBjkD3or2tiwzf+xULFhbNMgbNBwTFF0mGvoIm+zi13jG6UQSGXr
 aE3A7UNABEJH65zujCg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140174
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58765-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:email];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8623B3FDD6E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

We need to properly map camss WM index to our internal WM client
instance. Today we only support RDI interfaces with the RDI_WM
macro, introduce a __wm_to_client helper to support any interface.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../media/platform/qcom/camss/camss-vfe-340.c | 84 ++++++++++---------
 1 file changed, 43 insertions(+), 41 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-340.c b/drivers/media/platform/qcom/camss/camss-vfe-340.c
index 30d7630b3e8b..d129b0d3a6ed 100644
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
@@ -209,10 +211,10 @@ static irqreturn_t vfe_isr(int irq, void *dev)
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
@@ -235,49 +237,49 @@ static void vfe_enable_irq(struct vfe_device *vfe)
 	       TFE_BUS_IRQ_MASK_0_IMG_VIOL, vfe->base + TFE_BUS_IRQ_MASK_0);
 }
 
-static void vfe_wm_update(struct vfe_device *vfe, u8 rdi, u32 addr,
+static void vfe_wm_update(struct vfe_device *vfe, u8 wm, u32 addr,
 			  struct vfe_line *line)
 {
-	u8 wm = RDI_WM(rdi);
+	u8 client = tfe_wm_client_map[wm];
 
-	writel_relaxed(addr, vfe->base + TFE_BUS_IMAGE_ADDR(wm));
+	writel_relaxed(addr, vfe->base + TFE_BUS_IMAGE_ADDR(client));
 }
 
-static void vfe_wm_start(struct vfe_device *vfe, u8 rdi, struct vfe_line *line)
+static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
 {
 	struct v4l2_pix_format_mplane *pix = &line->video_out.active_fmt.fmt.pix_mp;
 	u32 stride = pix->plane_fmt[0].bytesperline;
-	u8 wm = RDI_WM(rdi);
+	u8 client = tfe_wm_client_map[wm];
 
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
+	u8 client = tfe_wm_client_map[wm];
 
-	writel(0, vfe->base + TFE_BUS_CLIENT_CFG(wm));
+	writel(0, vfe->base + TFE_BUS_CLIENT_CFG(client));
 
-	dev_dbg(vfe->camss->dev, "VFE%u: Stopped RDI%u\n", vfe->id, rdi);
+	dev_dbg(vfe->camss->dev, "VFE%u: Stopped client %u\n", vfe->id, client);
 }
 
 static const struct camss_video_ops vfe_video_ops_520 = {
-- 
2.34.1


