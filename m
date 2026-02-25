Return-Path: <linux-media+bounces-53354-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLJqB2AQn2neYgQAu9opvQ
	(envelope-from <linux-media+bounces-53354-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 16:08:16 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DD0199340
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 16:08:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 798743060CD0
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 15:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C80793D5227;
	Wed, 25 Feb 2026 15:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T3CkoNQN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SnUeHBs/"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767B43D411F
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 15:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772031708; cv=none; b=A0+kRSysleRK1tPmWPn4QRelxCrhO8tARho8331OCz3WAhIGm8M8bWXPYZ92BuXJzadSxPjGB/E5Am04HIB+3TVCE4ojBidw4toHeWtU2rUsS2J9g0Dh33G5OPtCsThBEJ8yN44Gym7fTU6cnq1wgE60+m1OYdNqXmS93oQajzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772031708; c=relaxed/simple;
	bh=8oH0CcBNelrfyBEPdCxx6Y2fsNcINvPXmz6A6NuDkyI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uFSnTY+lOh7L3kAtMOhEdLX6wrmlHjoppap7kjc6KL6Uy99x9afXYQyHe941ItNiZLNvH8gyA5wcxY2AqPSW2OM398U+RFcmGGZbCXRJMQzsfWS5OFIm+t+vMTcUZO/7irsmoUI+FJCaAuZxThltpHxtdd/ZWs+4xRa5JVFUPLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T3CkoNQN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SnUeHBs/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P9SpoL229643
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 15:01:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Aw8wohLQMgUcRaUVmeeymttr5jvM6r3f8He9jLfhmSg=; b=T3CkoNQNC1Sj60zm
	RdiZSWZikj63JsA5hnFzF6dGRbVtI4uXLp1QdvGaKNN5Qg/pAoVQR2tquwLQh5hI
	aR5zVZ39ZNgyD+Bt7nvsisEsnl+FCrQ/iyz5Wk/y6WkGLo+82obKihYC44+aR1ma
	m5QDGfj8VZIadobmQaFya1sVl3x526oIiZ+nXtxBFVhjx7i7LiOzVRJMW3iQ5nTa
	dOogVm0eJNuVqpoX1UKn5YG2iMLkK5tWUYgTEoblcrRhsZ7IIRdF5uC14WMTexQS
	Zdmy4k9VhWi0nsc/tRe8VIvwZ3VX6he/hBzwfpYI34kr4XV2NuNtAxl+FYvRcB6n
	3KIk8A==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chg37uktc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 15:01:45 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-679dcff168dso15693960eaf.3
        for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 07:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772031705; x=1772636505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aw8wohLQMgUcRaUVmeeymttr5jvM6r3f8He9jLfhmSg=;
        b=SnUeHBs/M0f5YtuVpRMnfbSpxrLZHiglD+u1Ow+sQNyqdWbpwHFoES4lPARfUhibVm
         EhzOZ3yJvQ1t4LVmHIi6TMRUt7WvbSreL1Teul0yUVAm7O9NJP8jxn3DbAkRvdul7Inw
         u14st75o3r4bI5ClXD5J3NDZervZiKhjKRVWhZ3EtvaHDxddYSf/31r7qAidkyIZRV4c
         dqZC8k9+E8oe/z3sLDFhZ4mIADs0iFYubruwfOSWEnAKjTocLfZHx7rjkk2HMwDZc73F
         GWrN1N8FthlR7szG7fFlvQr2pTBNB8Mv788ELVVmD667W8f630ht3ElGjfJX0s635LqM
         wt7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772031705; x=1772636505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Aw8wohLQMgUcRaUVmeeymttr5jvM6r3f8He9jLfhmSg=;
        b=ZclndUx4B0NaJytJx46nrRYCUOnQ0llwdmVw7HadHednKXi7rJ/7zq95bEBbygMuYx
         NnC8f1JnntFACwUMya7RztlGq2pjiLuSSy4hnupfdLXf3X3xf8q1yy+QNFknwmWg9ajK
         bsE89Ghd184H3QamU2YNG+VexRnKri4gASd6zc6kiJLkg87GQwXbHxXN+1Q69rh+BJs2
         g5ky3xR2pZY2P7924ebeoszmPVv9qe/zUtNSodpPtBQzS339St7bCh7R6u+DMweqw1Zs
         u5/m4hXLilGWGj/u2dd1kwJ4F1WrHSoaPBCYstMO8WwmHlyNlwU8q77zFnOgBmaN8YC/
         ewaA==
X-Gm-Message-State: AOJu0Yysx21outkfpDBZEZSw/zYiWeffJb9ddSx6BtrAec5ECSc5whCe
	tkOilKsh5t1mjZIsM8kHiySGveqW4v3JrltOnFbMrPziwo2rZjqhxJ9wpUk9iJ1JqL2U/AAMF8r
	xU0SpTby2KpfprVJThevfJUX1L0XexbLTbH+1E3nSLTWMGpqO2xo7oBvJBrPVxW6+JqBM7SW3Xn
	f3
X-Gm-Gg: ATEYQzwQV0DuXgI1/hJDbwDbtzoMsKPoVNaqmeM+/5YLJfBm6lZkctYzwjQiJ7agNSC
	jO1yHNU0zXQo4xuokcACk7Qql8zmymnBxsxKJgHshD8BZJDJRD7g36M1RlaSkboP88P0bvBvrAF
	RYwx7qn9fLpQaZafKCgpzdCnsrhkfSJTxtrFwAh93EeDeKenR8hFOnoIJfvFlREvE9eLg6Dlevn
	ixfVTcy94VkQwrinvsabeLrp/s9Y4do/9H0w59den7HR05dbo6TQzM/fMxxACXeB5NrI3eyz7c8
	E6xtuZ+imZcKyOQuyuzeMHqdpk38SRZjEG/Zq8aT1erZYnwYhPps8kMjqnMt9MkFltclmdnkBSl
	7LAMsdAoLD1vgF9H1pUILmrEWuwcpceXqs5M4PZu1a5zNeakPL0Loq/tuh4BuysQsS0liYmiHHG
	km/u8bzbOWE4c=
X-Received: by 2002:a05:6820:4a8c:b0:679:dd8d:1c0b with SMTP id 006d021491bc7-679ef9bec9fmr289204eaf.75.1772031703299;
        Wed, 25 Feb 2026 07:01:43 -0800 (PST)
X-Received: by 2002:a05:6820:4a8c:b0:679:dd8d:1c0b with SMTP id 006d021491bc7-679ef9bec9fmr289165eaf.75.1772031702546;
        Wed, 25 Feb 2026 07:01:42 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:830:450:bd3f:a77b:995:768e])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65eab9a08edsm4306552a12.5.2026.02.25.07.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 07:01:41 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, rfoss@kernel.org, todor.too@gmail.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, vladimir.zapolskiy@linaro.org,
        johannes.goede@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2 1/5] media: qcom: camss: csid-340: Switch to generic CSID_CFG/CTRL registers
Date: Wed, 25 Feb 2026 16:01:18 +0100
Message-Id: <20260225150122.766220-2-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260225150122.766220-1-loic.poulain@oss.qualcomm.com>
References: <20260225150122.766220-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=br1BxUai c=1 sm=1 tr=0 ts=699f0ed9 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=dmmZaP2TfQszSoJftQ4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDE0NCBTYWx0ZWRfXwoI7Zz7jerBa
 pQ8hWYhVi5s3oymVuxRXAqtb/SCQsenWHPNfOPv1PuvZyKozKd8PcjJtYfGRs59csuZF6hmOCzV
 2nehujBXOlfViqym62Lyrth7ggwCwBavZiCd3Z3vG+BQmv/G/4yguEeU4QReahxpRPNuJ4ow14T
 VxVQNS895v6KovY8puAJKBAMowYgi7btaBahpf74Fwb4ErTX7aRiynuu/PzmbZf6u3dkdRA3wcX
 qIT2nMIY0zFZyB2rQTkr5WpDjwdisN1xgozOi5aMO0xt+aeXy3CQq1Q1eTF4NEtdn2kB89dmA+u
 06CJq73Pji/q9wsRcV8ch8ppLuuGaVqjcK39kBnpfH8uRAMebIqDNYQnjElPWoxqiwLOPOIQ66o
 i8YMQKzwkZNuOE8awpip4HAKV/oVxrb1srjDFcq9ywk+Lor7fk2QC5NYdnLAHuanQ+CIBIcVPnS
 z2j0FYmRc0nqZAe3feA==
X-Proofpoint-ORIG-GUID: QR76esp5Iiwzviy5GzALuxbRcB6gLkVA
X-Proofpoint-GUID: QR76esp5Iiwzviy5GzALuxbRcB6gLkVA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_01,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602250144
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-53354-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 84DD0199340
X-Rspamd-Action: no action

The former RDI‑specific register definitions (CSID_RDI_CFG0/CTRL) are
renamed to unified CSID_CFG0/CSID_CTRL variants, as their layout is
interface‑agnostic. This refactoring provides the foundation for
extending csid‑340 with missing PIX interface/path support.

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


