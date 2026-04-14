Return-Path: <linux-media+bounces-58762-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOT7IOaM3mkIFwAAu9opvQ
	(envelope-from <linux-media+bounces-58762-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 20:52:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 778C33FDD6D
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 20:52:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BF79C30210AF
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 18:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 652C823909C;
	Tue, 14 Apr 2026 18:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OoreC44F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W6hN5nPD"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6660923E358
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 18:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776192733; cv=none; b=Md+jzLQyX76Wxcn6URZs8gOMQbzONEy5e2Zlblpn548Eor9fZc+z5D1fYx8u9bzEMXjl/ZArtV2QcPCInL3idBW+sfGDbpgjW+8F2VMm1gj4Q5gjNKVfUrArrT1WQk1T43JzeKFulrPrBPFxVBwQPHHnOZ8oK5N5zlIYDFYY/nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776192733; c=relaxed/simple;
	bh=VpwDVPQ03RkaXVy4J8bdZ6Apy87jR4wAY+Pryfhfg1M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GWtKoHkypgI3NdvrdoXl9wmwgWPGJj1wsRwzWvQjsliIohFAs0lBbY2bP5LJHVpVYr6h3pEVZgO75+7LjNEIwWF1YgAIg7nSKIMR5y9xcUINvsvFJ504lDF9K2PNn2aSG73CXE+WFKxxm1wx/xcy+UZjl1W6229k1lYaUFomVa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OoreC44F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W6hN5nPD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EHvoC43059018
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 18:52:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sj4E+MQP0Tv
	ItPM9B6rj1rMRphn0atK77Z/jJaTVmXs=; b=OoreC44FhBfAdrTBXTbf8meIr7P
	tDJGitJGZb8dbmRd8karCRfrjCWKmvBTN/q7cI9oRQrFs+yLwsRtOFwaarDC2x2h
	fMSaSDd6YZOd+s6JktMWHqPRbJcNyNsGywhrg5Sfaq6Kd/wb62l/HbEYp7Uidxp1
	7JwY95pyefGuPWSpZINiLpABs+kuRaXZ94R7aSbFdy5s4SAZ6fGT/IHiLPscRa7j
	CSvMX9dK26zCxwrW+dS/SaOBgWuQJBfcb0RUIxkAseKBcsX/UuVZYegC8BV7iAuv
	mlVjWp250pujiNMwlFHMxKWAOBdUbr4aQh0zEvJ8Fmy78aOigHZkDJdcUrA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhtepr6he-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 18:52:10 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b220c72bbso138842491cf.1
        for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 11:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776192730; x=1776797530; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sj4E+MQP0TvItPM9B6rj1rMRphn0atK77Z/jJaTVmXs=;
        b=W6hN5nPDz/IWF9c/BmJEZ46eI0FV1ZNdWVISDxWpKuk8rA1pcnBebjBKjRAPVeNgQW
         4e/Iy/SCpX1wSQuEBYyDpS8qArz+7td2HvdCkwOScJvnHrTwQZw3Sb55YvhgjJJEJhxB
         ZiiEP00QxqM+UF1AR4yrPC9eKNRp2rsXf674mVPT9kNa4KP0sTU3MmMfwwxhLjZb6Son
         tFCpe0uLbnxm+NPruL/beoMdIAUMdNQ27Pze/bh1TfY2RSNOEdvxtUOcL0FeruzYvbat
         1ZwFl1nyfCJbunXVvcsVpq2SMB06A9K6VkMhfXQsdJoSiMqP8wgFYQRhJPNuvMIQsokT
         tABQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776192730; x=1776797530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sj4E+MQP0TvItPM9B6rj1rMRphn0atK77Z/jJaTVmXs=;
        b=TB9iLLvQsvHmIpwtOZztmYQl9CSJdKYcn8mtVB1xv1TRhftefYAabgO9EQUs3Mq70q
         0vjBDAvHL/KK/DbtMhnuBLB88ul6o/RGtgCwMFHWeMj+ou42cF1R1OO/MFCHIBbXuEES
         2OM5IcJsxE7YvySWgO673HxXFgKYwIQP/iIa19P/+Xq5EGTMGwSrIYSrF0ojLwFMciSo
         T1ovB89LOVt/AiQmjn9l5CXAUrz2e0SWNiFhZGtU1nyCOq1Uld8GgzKTSo8H3XGYknU9
         Ib7bWgDFqM0aDXITBBys88xXEW+gw9kmteo+bjSoVEHL9pKKH16iIVyVVJkIdWfo/yZ9
         wGTQ==
X-Gm-Message-State: AOJu0Yzq+1kXqe4kHvO18jePUhcroPeCBB8xgSDS3GqR73wqw8AA0g8B
	fonqdDyUAtlQb2JyADOYSNLkzPH4eKaX43bHxfYd5njYDQoMIdBePUjnLCqK/kvE02KTooK1wCT
	HojtKmOVnNeDmtkcoJ/NHWb3ZZfO4lW7/xnTXDOYnwdJ+CiMpyye7tUuJsH87CAiDuw==
X-Gm-Gg: AeBDievEFyDaU9e2YmzVxzyjkpBh6MAp9bM00wzF34Ea3UtOvw4KFl306O6lt7o2bRi
	au6TJ6+lD36JPPMbaf82evsfXpsyedHeWosHHNJU0ZvBzgCazgcoN/shEcP4wqrxDBLrEdYtkV6
	hFtCk5zDyFhN2t0bMDkrl4uFlIcM+axBAt1E4YVXi1UqYsS27Ck9dP/krXmDi2c+vQZGnAgWuFd
	OfAexJzna5sHsCWgagNtrxytfvaj+Q2Jk+BEq5oG/643X51PPs1ZRYndMzGOWPFzQ2vIqN23VjI
	kbyHgCOq63CZhrArigIZPCDfYU8mNl3/MxaCDYi88ZAvxz/rHHWwDzkLncR6+E0sCI79gNylwyx
	4cRm2uEBnaKERwuHsPROXOYUbkFWYfapK/E3u1L4tRHCWPTNVVR9n7h4iy8MOk/acnoyeEvSDlT
	b8plpJpWCONVY=
X-Received: by 2002:ac8:7c56:0:b0:50d:9aff:8b43 with SMTP id d75a77b69052e-50dd5b15965mr284825961cf.10.1776192729919;
        Tue, 14 Apr 2026 11:52:09 -0700 (PDT)
X-Received: by 2002:ac8:7c56:0:b0:50d:9aff:8b43 with SMTP id d75a77b69052e-50dd5b15965mr284825191cf.10.1776192729155;
        Tue, 14 Apr 2026 11:52:09 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:830:450:f062:40f:6621:e20e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6de97e9esm427647366b.11.2026.04.14.11.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 11:52:08 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v5 1/5] media: qcom: camss: csid-340: Switch to generic CSID_CFG/CTRL registers
Date: Tue, 14 Apr 2026 20:51:58 +0200
Message-Id: <20260414185202.2714019-2-loic.poulain@oss.qualcomm.com>
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
X-Proofpoint-GUID: Z_b1SkuN8k-6NKRVzdWkm-zWOsmB9o2N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE3NCBTYWx0ZWRfX0e1zUhCAp5s2
 C8JhAbh5Z2ccljFWqe0lqV7l6UZ5AGZGUAIsbl9DXH5hh3oev/NGSWblElvZrHRJQrAhrSLx0u8
 7bRBjdeKJuBdL57LrosZ+LEfgotaB7Iq/aBGQRzDADo07uMJkF4HnPZqDievfQhw6KGkUCwZZZE
 ZMV97xqpMXfbKQwfyvEV+kjjdFKVZM3ADJMZjVg24xY5a9v5cU6o4yxqIXURYahkcNVwi5LqfCu
 PF3QXlaAD3IBAs7tU991qcioHTpxIEcR/hBE1OykSFiJtKnV5nJhwSpcwX0VVSK67LISRlG/PbW
 xsS2pDI2dLS5qcff/xh9VGKlEO9F2cfxQtOx83MxxFV+xKcqROfBvu+U0UPWUpkbWYFb6KjomU6
 MMqlGKwma3UAfrHsWn0TGWSptPDTu+6rw1wh59K7AGLv5jUjpxE4RtX025ekDlX5GatFjF2TffG
 RDHrzuvt16/JGKNmPQw==
X-Authority-Analysis: v=2.4 cv=CoGPtH4D c=1 sm=1 tr=0 ts=69de8cda cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=LKvSMrVZLPp8S4whDCgA:9 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Z_b1SkuN8k-6NKRVzdWkm-zWOsmB9o2N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140174
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58762-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,linaro.org:email,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 778C33FDD6D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The former RDI-specific register definitions (CSID_RDI_CFG0/CTRL) are
renamed to unified CSID_CFG0/CSID_CTRL variants, as their layout is
interface agnostic. This refactoring provides the foundation for
extending csid-340 with missing PIX interface/path support.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../platform/qcom/camss/camss-csid-340.c      | 43 ++++++++++---------
 1 file changed, 22 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-340.c b/drivers/media/platform/qcom/camss/camss-csid-340.c
index 6827d76bef5d..469b27c10d6c 100644
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
 
 static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 port, u8 vc)
@@ -88,7 +89,7 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
 	 * the four least significant bits of the five bit VC
 	 * bitfield to generate an internal CID value.
 	 *
-	 * CSID_RDI_CFG0(port)
+	 * CSID_CFG0(port)
 	 * DT_ID : 28:27
 	 * VC    : 26:22
 	 * DT    : 21:16
@@ -97,19 +98,19 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
 	 */
 	dt_id = port & 0x03;
 
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
 
 	dev_dbg(csid->camss->dev, "CSID%u: Stream %s (dt:0x%x port=%u vc=%u)\n",
 		csid->id, enable ? "enable" : "disable", format->data_type,
 		port, vc);
 
-	writel_relaxed(val, csid->base + CSID_RDI_CFG0(port));
+	writel_relaxed(val, csid->base + CSID_CFG0(port));
 }
 
 static void csid_configure_stream(struct csid_device *csid, u8 enable)
-- 
2.34.1


