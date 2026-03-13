Return-Path: <linux-media+bounces-55676-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKgOBngPtGlvfwAAu9opvQ
	(envelope-from <linux-media+bounces-55676-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 14:22:00 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C4A283AFA
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 14:21:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6002130882DE
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 13:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25DFB2D63F8;
	Fri, 13 Mar 2026 13:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jQH+UKOX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TD3y2FYa"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B53F314B95
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 13:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773407883; cv=none; b=FI91/ba4GF+gX/9Pv7Sk/X8TOXqNvoPZTEUAD49Tc7wouwCSiiKthUtdN21+a4MUjDPaLJIxRPivt7phc4noZaAmOCy2Lmw4zzOGZORUUrz6RtB7BuI5oDwl4n6J+X/0JnCGX7F7GVy+Vu3LdBrmejDLydoPzUVfiBG2z+JL8fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773407883; c=relaxed/simple;
	bh=yAz6Zfvl2TFWakR7LeU7y69Nidj6N7zp0U2Up5xvNlw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IOfGBhWcBjX7Ym+K3nmYcgiKDxZq4z3zCaL4TZa3F7E/nhSyvek4lC22dVS9Zv/JhwKQf4oZyjJyNZ3SZ1A83i7JSlnI45q+VtwGcSSpSUXqxdxLS6YIub1Q/HHbMkOjyFJEyFYuLylAhEFpSntxkh3kSBYm70z1SX7FjgpmhKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jQH+UKOX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TD3y2FYa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D8v8O7481451
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 13:18:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eqfxHF1SIlH
	AAOLH8LxQeWGvlpwAUi+7vcI5segiUVw=; b=jQH+UKOX3SEaIgbDAVvGE1acM/J
	Q2XeCrYPvfpmPQ7nvPIW6o3FGG0pf6PmPf8Gxxmh/6AzCKmJ7bQI79SsjSAUEYd3
	2o7IoCaV/FGPE8hkjN7Tt7AbQn8VAGU6/n2a6xgL8eAqKSRAXZrqjGTNz5RqgYFF
	bJphDDXRpgb9gL0B/K9nL5D058hAo6jdAgDnsulLOhcnRN6LLjvZcWpiAll8Xvnj
	IMAtP+xtRtSiWgxk4r/Vk8DQBalLHW59ZVyloolmBbylpeN7N5PD21DKDPQn+5R2
	j9wg4BSOO4mJXlsF23k0Q2olqylREApvmmFlgLwg16ZjxCZXmj4Cb56/T5Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvfh7ru93-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 13:18:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd7de0e161so1457001285a.2
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 06:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773407879; x=1774012679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eqfxHF1SIlHAAOLH8LxQeWGvlpwAUi+7vcI5segiUVw=;
        b=TD3y2FYaZzcVlHQyb+CERiL8SZyey+nMFHToSgwhtZjcpSvjLCD04q+yC6f+Dq5fGv
         qgqycCpwZJvfU03bcVjQvwiqG8sRVJpW3JA+mVGL9+cO6TonmFxT4EFUf2rnQs3fvB9v
         aVkZakPAfIXVuFPiEulLs/g0t91X+XuaTyKqTa8Ww3ydwWJJeF4kJYD0q3vcmSCbZ7PS
         MXZdahtKgHT54z6+hcI/2aY0THrlNjCp3nsx1uNqx2ARRH9wYZcuPW4kiMmYGfI6/O50
         c+xV0jGnCj5GfdFWUp1fnqwseA1izP58vJC6N3+jNYh8k7ZjgKi0WzKkmKdmFn7u08K2
         RZgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773407879; x=1774012679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eqfxHF1SIlHAAOLH8LxQeWGvlpwAUi+7vcI5segiUVw=;
        b=NkfJejrH9lVjoD2E6LB/eA00/29jLUZSq5/PFoT3sDOOgJPh20IcFZHi4HQclbi9c1
         BDvjesk/Oeyg1E7vhQlrDs2KcBmM176oJtLSNIfZXeKHMSm7t0QskdqvvlyFfMjIVlO1
         qJyGcVZ6xqOoP+YkAe8Meb0Utq6lrrnIi/qmB5ToL6QGuGZc5E27CYVjTqqJi78LSVHg
         TkgKiWs+T5TA4c6KSj0kRIWiMybw2l/mrqcV0SWsjHC6py+xR5cIp0k0H0evijWWGOAC
         fF6qrikwUbHuCZoUTvOFiX6nDypC6lg4XpX09Z6vdJA7za9elXZxxGb1Z7K8l9yjzgiD
         Gr+w==
X-Gm-Message-State: AOJu0YxMgl32kQqxPc28IEdQ2CY7uw0+Wz5ECVjo39O3VcZqe8AcYp1F
	CPepd5cJxbrhNViJGcXIzd9nltHlYUTzCoWulU7x1RNVFLnvXHiLDlt7ZI8WV4SqqZwtEMlHbm1
	jgA028j28oBTlHdjozGXAUhbM3iE8qReIS2DO/7rl5D7PEkvcA1TwkrmJYfeJzrmNZ4NjzprF7w
	==
X-Gm-Gg: ATEYQzzgmk/MtLZJjEHH7C7fkNN6p6+sf1xd+WQLA6+qHC4/lGST/IGIXhjy7yVqo7l
	Kq2CTbkzFi5C4ejGyE3zOj9Smx/0PUHt8N2kEow+daXhRI9371UPIX66FEU356k1s2M0P/hQCn1
	JxKbIUYJazQ0M1TyZr/vB9fgvXIaowTAH+jIf4nIBWipoGaAnD0oku/NTpZoWF5tXIYTTsCKeBS
	JgDlKNH4eo6dtJfJLA2QZ0P5StrdLBxP+lu4sUjRYYsNmPREhL+F2NEpqrDYxHmTiX0o2soj6Ol
	//e5BYy+T306QORKIfpz7gOu1DpzAAozsBo/H8bUfMpEymQIph0/ZcwkG1G7Wr5CjEobrs2Blp8
	GFOREGNaxVyVTItBdS/hUGct1FubG35yLxpjl4f+6szUJ+9OOoJZtc+rWsStbwTkEBIgDQBgixC
	6EGGO0sqGLWFMm
X-Received: by 2002:a05:620a:7002:b0:8cd:7835:87ff with SMTP id af79cd13be357-8cdb5b7b463mr452176585a.69.1773407879422;
        Fri, 13 Mar 2026 06:17:59 -0700 (PDT)
X-Received: by 2002:a05:620a:7002:b0:8cd:7835:87ff with SMTP id af79cd13be357-8cdb5b7b463mr452172685a.69.1773407878979;
        Fri, 13 Mar 2026 06:17:58 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:830:450:146f:4491:fa7c:17d0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b47145dsm207778265e9.0.2026.03.13.06.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 06:17:57 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v4 1/5] media: qcom: camss: csid-340: Switch to generic CSID_CFG/CTRL registers
Date: Fri, 13 Mar 2026 14:17:46 +0100
Message-Id: <20260313131750.187518-2-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260313131750.187518-1-loic.poulain@oss.qualcomm.com>
References: <20260313131750.187518-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: bKu4rbUg_M0Hv_nQdC3saM0llpUH5GYH
X-Proofpoint-GUID: bKu4rbUg_M0Hv_nQdC3saM0llpUH5GYH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEwNiBTYWx0ZWRfX/vgQbhmbCa9Y
 DcRg1ZUGg4criuw/SWwjzkfvAjWdb5wrCCSB75sX/LGkVz5CAMMDH9IQJcCaRTJ69AOYAMY4M5Z
 m2WWbef+gHzKntfC4KFvz10nFVIkt+YGhhVVkWp+JTnH9UPuZJNBN5phg3m5eIoeaZ4O/mrypbc
 P+MSvrfiC3dycHLBnfqV+T7uwz/Hy/6zj6iWLwnTseGGcJX4Cuj5ekEEVMKDKUHkWIU/waTvSt8
 xQJ0bsfOw95KcpklqIPAoA5dabKpHY9Gk/yRcMtQ1G9EefK6jN2U+RHUTaPCMMPpQkkJgPbKGvV
 2FUSk4aijKLYQ3J+8TlhqUTdqmMuRY/2Iw388CWGV5OL1GmN6QVvd0hp8QrzNwgppWC6eoSqKMX
 VCRkafcY/VKhxZOIE7JE26/juchI9dgWTHVLDNy1Mcy6QF/oallWhrYvWWRaEnjihSuzxheFJI/
 tLiHbZzWQggylJuhwcQ==
X-Authority-Analysis: v=2.4 cv=BpiQAIX5 c=1 sm=1 tr=0 ts=69b40e88 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=LKvSMrVZLPp8S4whDCgA:9 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130106
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55676-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,linaro.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A0C4A283AFA
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


