Return-Path: <linux-media+bounces-54789-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJi+HIPfqmlqXwEAu9opvQ
	(envelope-from <linux-media+bounces-54789-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 15:06:59 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC222224A9
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 15:06:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF2673153B70
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 14:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDAE83ACA4B;
	Fri,  6 Mar 2026 14:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q99Z9MZY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XmoHR38G"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8603395DAE
	for <linux-media@vger.kernel.org>; Fri,  6 Mar 2026 14:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772805755; cv=none; b=Tx9PVEJDR8gVYuxmi6uP0kudYvwF04kozPkhgjV1ERFKaE/idDywzZ5fbhExvwBSy9o6iBhZZhrSRR1Wk9dlIheQlNkKp39h9mcs8Q0Gef5xv2zns719k8ybT1xWQXh4SbIoko7k9OCa+CiAbXIXhoVneMzoErhCd6edblmyTGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772805755; c=relaxed/simple;
	bh=W3J4GAuE0OkEsIunjDyfXoFWhok1q9IhNxf2/tvxZtg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QFUV/E1PsW5d36LgNefbY7HWEEvkPzuABaS6tm1rheX75qEyUj0bugmYKimv3YZlCFnBAVZ3cge7lDCDEdtmS3bGlDP5UqEdXluPGOSQCUo62T2tbgLsT5jLii1OjIYH01TS4j1BtSy6WV6M6y8iOBfH0TP+0tJ6a4wwmWMImLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q99Z9MZY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XmoHR38G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626BbKcp3257100
	for <linux-media@vger.kernel.org>; Fri, 6 Mar 2026 14:02:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ULJiANy9VcQ
	jrg2p+x3E7lkWPOkdPhmEtKnNZwzpphA=; b=Q99Z9MZYzTbwPgx1J8BQ2n/JIAC
	EFawpSRUbyyVVRqep7QHdz4PL4b3/+1+3RCJL58t595+TV7wrhYm3DU45xasxBz3
	gWL+lPf8kpxo9prR+16C3kQ0qZW7a5GTS9uw402GNFjdvaydjTzLyFc52REnKD8P
	aKkza9VlBMZGHa0VXdbwKv7u5LBD+JHrQXc9rQPdJhS1dZSODBZ6Gvf4UJFCxSlZ
	fAcjCKfXdR6AMaaTEvISxRmFLY2gumgicUwRlgkod1odiu3CAnSGDp7v3jCKubQU
	prOn/KTiJ4BC1GNwJtWVxXtwn4AP0zMYihTG/Fy1bMaq33tD7k4ljeW7wuA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqg09uaan-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 14:02:31 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-94df217d70eso10717608241.2
        for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 06:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772805751; x=1773410551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ULJiANy9VcQjrg2p+x3E7lkWPOkdPhmEtKnNZwzpphA=;
        b=XmoHR38Gc5MGqkZDPsaRpwrbIxaQCP8wAUkxsOLstX3mnov01+1y55ijZfGjPWuf0g
         C/sWr5U5PmSuww1ZAlPXi0eBct2XeacEZtHn8D/CbCcJ2HPh3Bs2xGf4DGdHAjoOXdlR
         zyAfelxKJGliv9r4MsocY6gMk6SmZLEkhzZHBmO+7mrTR5hbeFCQFyOoqIiKyFwuudDS
         1sqRB+8lIiRWE7xVrtIo1qlehv2vjRnb02+u9nZpRS91UbOH/vwPSb/JzwSrCSjrq3Gr
         bv670vBVlmrMo9SDKhxqCyObLG7JkfOUmfVOd5bG4sbziHiE8xrVNKnQZMcpDu5TpyAK
         ZuGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772805751; x=1773410551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ULJiANy9VcQjrg2p+x3E7lkWPOkdPhmEtKnNZwzpphA=;
        b=DrRcxisGmwrmAe2e5qs7jBF/KekBZe5Rt3iBLewAjAV3ynRco9g5lpXCjmJBJECBQT
         pWDP6Zr/pkd2QiA0+1UhOReYelIFXmIBa737YkB66t9HSTIvQEoQmNuFJ6SyHr3ODZXv
         GWBYkmNAuywSKlux93WwZPc1F6sjFsjeTgpMmIYDRJ0vV25dAQckfDR8N1aQE+5C/Imk
         6K5wCgcg+PDsIjPp+zdJeDej5DKzwdVVdhzRV59qp/ZC3h8fmaczlwvp3GCkhxFR9sck
         TDxU6Xv1CK9DQRON1myJnYnb2Uk50t4k8WfdjvNTU+x6bbnClhaEmNrS20FnBuxoZzrr
         NA2g==
X-Gm-Message-State: AOJu0Yyr9D0QcO4OmwObxiVVBoFhOU2IJceHvxbBEpg10eI2Ase95Tut
	ThomP2UbQXeKon3ZnNQv0K0v1EaYL6m+Vvi2PO/0FFjviWFvEMj0NVtSQOWqVtMcrSZu5QQMPTx
	sqf+R6teCYAXTAiweDqmWdsV5IDDWLdVbL3Gxv9ayJThVsgTWiAEHEFaGbZ6ShuH8Ow==
X-Gm-Gg: ATEYQzwTXtUaIcDPUesB622M7ITZwGxVGOkZVef0VN+6Uag34kitlKwGOJKlUFj5WIg
	8BNTF7DzpPi1waPVApolzzOwv3r6eU7rHm9AVZEIS84/RF/TFeHV59kAT5Y3yw5GHPMthwJi8oQ
	GYMwNWzBT/0qGw1i/oK9L+bwfy9gtaVFTKVt3U7LmC8LhJ9iBeCTPuxqGsCNsgzjyuZSSEBbLEn
	5Z+4H3Ch0hAG7W8/HJjCxVhHMscXYAKC6/ASQ1i1vX0KCcba+A05peCZOryFM9z0H51+8KAa+6v
	rjZcETFojUMsTZHRqoHaoiJE7bOKre8sCiu6P9FMoGHquE2I7whtQqYJhx6KGANmpJXXtSb8DLA
	FtkwCTR4QPOf9yT8OZ4HJF2NSuot4ZSALSyosEYoj6pdVx/wPTdVGAodzGRdqDJ6Y2O1Z/Vu2bU
	1hUWJSXWqc768V5pI/rxvgLOavJJnjU0MBlWGYPYs//w==
X-Received: by 2002:a05:6102:26d5:b0:5ff:be25:8934 with SMTP id ada2fe7eead31-5ffe5ef4af2mr636946137.8.1772805749395;
        Fri, 06 Mar 2026 06:02:29 -0800 (PST)
X-Received: by 2002:a05:6102:26d5:b0:5ff:be25:8934 with SMTP id ada2fe7eead31-5ffe5ef4af2mr636878137.8.1772805748603;
        Fri, 06 Mar 2026 06:02:28 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485237f2d2bsm20171425e9.4.2026.03.06.06.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 06:02:27 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v3 1/5] media: qcom: camss: csid-340: Switch to generic CSID_CFG/CTRL registers
Date: Fri,  6 Mar 2026 15:02:16 +0100
Message-Id: <20260306140220.1512341-2-loic.poulain@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: Ss_wNKIokrUUHdDcTNPLYcqThh3nzqbe
X-Authority-Analysis: v=2.4 cv=b/u/I9Gx c=1 sm=1 tr=0 ts=69aade77 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=LKvSMrVZLPp8S4whDCgA:9 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: Ss_wNKIokrUUHdDcTNPLYcqThh3nzqbe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDEzNCBTYWx0ZWRfX1kAt1VnnxxvC
 cBD1wq/zrRTpm6j0I7prm/6Y+KEZ2ZfQ57lyTfb4lDsWqh+bPJ2Dw0vRa3Cbb6+5XdVoiBefeUs
 fm+i5EqiIq5Jhyc0Y6gXwVt5/tRmgf/QoYkVChtubLH5qPnN+/SMWODJz+qvMJqqtEUx+Go5MqJ
 Mi3wi7ha58F5cWBDdieT+dS87U65ImJ1xAxHqYWWQ1jHr/a/QuN/HtZ1z+ITRYDJG8nrfq6dHeY
 SxTuwt/4bMKtUgcffxiZ932rbgz6fqT4EpEZMy+2QogJbP+EJFxIjBe3JOd8IqKsJljO8Qs+lof
 bmwcsK1YZykUtCeHeqQEvrEhhGNrlKK/kwPs1a+3Vp3pTeZgpRmVKFfSA+elw6iMFrBB52fq8Va
 LKwwyoX0T4LxOyzr0bjH8bntsUZfMhfQhzAJMu+AUAvY99yhrT+I3ulNVN11Xoqz7wkQ2jB5aag
 1vVxA/d0FpbCN+1D+wQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060134
X-Rspamd-Queue-Id: ECC222224A9
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
	TAGGED_FROM(0.00)[bounces-54789-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The former RDI-specific register definitions (CSID_RDI_CFG0/CTRL) are
renamed to unified CSID_CFG0/CSID_CTRL variants, as their layout is
interface agnostic. This refactoring provides the foundation for
extending csid-340 with missing PIX interface/path support.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../platform/qcom/camss/camss-csid-340.c      | 43 ++++++++++---------
 1 file changed, 22 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-340.c b/drivers/media/platform/qcom/camss/camss-csid-340.c
index 2b50f9b96a34..adcbe3e01d62 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-340.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-340.c
@@ -41,19 +41,20 @@
 #define		CSI2_RX_CFG1_MISR_EN			BIT(6)
 #define		CSI2_RX_CFG1_CGC_MODE			BIT(7)
 
-#define CSID_RDI_CFG0(rdi)					(0x300 + 0x100 * (rdi))
-#define		CSID_RDI_CFG0_BYTE_CNTR_EN		BIT(0)
-#define		CSID_RDI_CFG0_TIMESTAMP_EN		BIT(1)
-#define		CSID_RDI_CFG0_DECODE_FORMAT_MASK	GENMASK(15, 12)
-#define		CSID_RDI_CFG0_DECODE_FORMAT_NOP		CSID_RDI_CFG0_DECODE_FORMAT_MASK
-#define		CSID_RDI_CFG0_DT_MASK			GENMASK(21, 16)
-#define		CSID_RDI_CFG0_VC_MASK			GENMASK(23, 22)
-#define		CSID_RDI_CFG0_DTID_MASK			GENMASK(28, 27)
-#define		CSID_RDI_CFG0_ENABLE			BIT(31)
-
-#define CSID_RDI_CTRL(rdi)					(0x308 + 0x100 * (rdi))
-#define CSID_RDI_CTRL_HALT_AT_FRAME_BOUNDARY		0
-#define CSID_RDI_CTRL_RESUME_AT_FRAME_BOUNDARY		1
+#define CSID_CFG0(iface)					(0x300 + 0x100 * (iface))
+#define		CSID_CFG0_BYTE_CNTR_EN			BIT(0)
+#define		CSID_CFG0_TIMESTAMP_EN			BIT(1)
+#define		CSID_CFG0_DECODE_FORMAT_MASK		GENMASK(15, 12)
+#define		CSID_CFG0_DECODE_FORMAT_NOP		CSID_CFG0_DECODE_FORMAT_MASK
+#define		CSID_CFG0_DT_MASK			GENMASK(21, 16)
+#define		CSID_CFG0_VC_MASK			GENMASK(23, 22)
+#define		CSID_CFG0_DTID_MASK			GENMASK(28, 27)
+#define		CSID_CFG0_ENABLE			BIT(31)
+
+#define CSID_CTRL(iface)					(0x308 + 0x100 * (iface))
+#define CSID_CTRL_HALT_AT_FRAME_BOUNDARY		0
+#define CSID_CTRL_RESUME_AT_FRAME_BOUNDARY		1
+
 
 static void __csid_configure_rx(struct csid_device *csid, struct csid_phy_config *phy)
 {
@@ -71,7 +72,7 @@ static void __csid_configure_rx(struct csid_device *csid, struct csid_phy_config
 
 static void __csid_ctrl_rdi(struct csid_device *csid, int enable, u8 rdi)
 {
-	writel_relaxed(!!enable, csid->base + CSID_RDI_CTRL(rdi));
+	writel_relaxed(!!enable, csid->base + CSID_CTRL(rdi));
 }
 
 static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 vc)
@@ -88,7 +89,7 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
 	 * the four least significant bits of the five bit VC
 	 * bitfield to generate an internal CID value.
 	 *
-	 * CSID_RDI_CFG0(vc)
+	 * CSID_CFG0(vc)
 	 * DT_ID : 28:27
 	 * VC    : 26:22
 	 * DT    : 21:16
@@ -97,18 +98,18 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
 	 */
 	dt_id = vc & 0x03;
 
-	val = CSID_RDI_CFG0_DECODE_FORMAT_NOP; /* only for RDI path */
-	val |= FIELD_PREP(CSID_RDI_CFG0_DT_MASK, format->data_type);
-	val |= FIELD_PREP(CSID_RDI_CFG0_VC_MASK, vc);
-	val |= FIELD_PREP(CSID_RDI_CFG0_DTID_MASK, dt_id);
+	val = CSID_CFG0_DECODE_FORMAT_NOP; /* only for RDI path */
+	val |= FIELD_PREP(CSID_CFG0_DT_MASK, format->data_type);
+	val |= FIELD_PREP(CSID_CFG0_VC_MASK, vc);
+	val |= FIELD_PREP(CSID_CFG0_DTID_MASK, dt_id);
 
 	if (enable)
-		val |= CSID_RDI_CFG0_ENABLE;
+		val |= CSID_CFG0_ENABLE;
 
 	dev_dbg(csid->camss->dev, "CSID%u: Stream %s (dt:0x%x vc=%u)\n",
 		csid->id, enable ? "enable" : "disable", format->data_type, vc);
 
-	writel_relaxed(val, csid->base + CSID_RDI_CFG0(vc));
+	writel_relaxed(val, csid->base + CSID_CFG0(vc));
 }
 
 static void csid_configure_stream(struct csid_device *csid, u8 enable)
-- 
2.34.1


