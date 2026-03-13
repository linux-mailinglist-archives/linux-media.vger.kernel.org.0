Return-Path: <linux-media+bounces-55677-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAmqHqAOtGlvfwAAu9opvQ
	(envelope-from <linux-media+bounces-55677-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 14:18:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFD3283985
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 14:18:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A8F2B31DCEB6
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 13:18:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66B89288505;
	Fri, 13 Mar 2026 13:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DSLVS+aX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YQEIPc43"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941423BB40
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 13:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773407884; cv=none; b=ndha0btH99hh+yTUl9QjGyUfuTKQZkfS/o044hP0/UyiF7SswqnQbxnBMKRnQl0d6K5kUV4hhMsfRZ7/32/6mwTPxqtBFVMcGSVpVVZO4hLEO9nyuPNDQzQkLVNilzn++LhUzOLII2QQogdLO+jqxVtMmIsfrt8ni2BImnD9AOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773407884; c=relaxed/simple;
	bh=OM1gxmg0JWx1jl8o1gHWc0VOCOuMtRvWKZiZTcQPUgo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=knBxK/Yeygu/NW99IgGNO2iUyNDY4EHa30W1rsIAysLXcPs9rlD0D1rR0m6VO1RrEhk2zfhxprcwlaANG80lIgTWvd6cp8TGISm2OTYry/l34g1iAkjWHb810J76RRG7W2NS40/WwwkfmSujGf5L6TQvHr2Rc5GH5qRdYpuxgcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DSLVS+aX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YQEIPc43; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DA86t21749485
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 13:18:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=C4NRGGIwl9B
	oZAOUpjKtAbMbjvJkHNs7AMWSEkulpRs=; b=DSLVS+aXTEThVZiuHUwnazaFHJK
	EqLLJc7FPj6jGJWaqvrvW1Vl37JREykFYW9kohrqIhpybr1q+LMr6pSNwQKAVsgr
	+a1vJcrGsTaxAZ/PwqEyQ69qtjI3HwfczVjJyzv+9pH1YdsSpHdd4RhYYpzOZANc
	qYowdFQPDaGzX73q6WSEMysXApgS1Otkmx+aCP51kXU6nHGdAgh5KaXaN6IY2tiO
	49U0Yu4YZmCY7q0imK0w554MUTIUOH23dofuIniAHHGGlVezSm8jILgw+RXUuFxo
	o2TQLTWn/Beym3P+GMlTDLU4YqcgTLBN2gmD7LeZFFPDqO22kB7vPK1cdLA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvgj6gjxc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 13:18:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd7d66afceso1436591385a.3
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 06:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773407882; x=1774012682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C4NRGGIwl9BoZAOUpjKtAbMbjvJkHNs7AMWSEkulpRs=;
        b=YQEIPc43IWwZl8Apd96NX2y3nIVrKi/DN3pVc6zQbnimbrICmGaXXZ5MNtxEucTMlO
         qjarKC06PNrFtMhz7AMh/EBkxBNBPKCGjL8YmIoz8UExtUbEnin6LQG/EGHeRj+OaDOF
         R6NFjl88q7W9wf1wSS33286rgdOB/rL83Ve7bwEjayLgtjTuhkUBC/aBc+qBFVmdL8d4
         H0Qshuf0AiegLra+llNOPxK4Cw06Y/O81J9Fgn/0SjZeYpbzJOHo1RVkcw4JKtv2ABNL
         siIycgGGGnbQIOJxoykFe7pZDPph9rPGJdqCaEvqmijacB/0NR87v/Pzi8874XN6aQPQ
         ehfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773407882; x=1774012682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C4NRGGIwl9BoZAOUpjKtAbMbjvJkHNs7AMWSEkulpRs=;
        b=Q5VJ+HP5YvZXsVkarO15Q5p4V3B8T4nF6KyNoFoHodViErB1XYC4UY8EdSV6MAR/UC
         VGDQjLPS4n5LOvEupNKso3FAzJNTdHCzuwU37lHMfLdC9495sYQOE1UGJPTA94opOPbZ
         V1kpFwrVDl0B9zZntgfs7gYLf1qBndLjJu3NhDYrYRk+96QdUwS4B0pXLGmw4MfA9OGi
         yHPN1xAvgxqpGujORZrO9/84KWkZEhbt+UcOC1FHHXb5NwdTceTyg/h6yBbCXvO5cgN+
         CS/YedQt1vYv8/jN52VLqj4yq+ICz18bT8+9o5eZjc9dd2Eu9/ZdVO7EbXPDizgJC+R2
         co5Q==
X-Gm-Message-State: AOJu0Yy5St7wxZOzsO1ImrNwLwmuh9QHVA6UdKLeEXRt0LzjkbTheLOd
	P3sZTI1QwsO628lmFzunOoDpcso1nhMfOB7CrHysakJkdBly4K5BJiQT45TI6+9lw+ppL8aI1k3
	i0bhJhFvZtGqailwiDrU8DcUtnHjLD17gzN8Oj7OFSMkJU66wa4iGJORHgvOtyfHBNA==
X-Gm-Gg: ATEYQzxWsfgRsv5DBKVt682CAXa5b5uZPS6jXCJPeGMaXcTYCSbSuM6QFsmjj7jIvgy
	hYv8jDzcZnHRsW7KydcZzekHDEA0im//WRWLPqkb69/afOmKqi9JT2Uio8KvSoOym9WbZ7CvQbX
	ZnHI/zJC0NQ7Mhz6gMbDpUGjPtUVcjwYFpiCibw4sj0NiApnFp62xificYZmXMn6799hsQMTZ1u
	x+NqBD3V/7/Cm6mQ5nTV0YVpAb26NkzPtsSqUuAXeduFOwygguPbTmBE21Da5RW2siAIJq2iZEX
	/WxzSPcIi5HPg88M6XGjAT1m8CzxY4p8V7mjGDlF/6wIUWFUw6nnnhgyv19ydbBYFs4jb4BBdaU
	EDlG1j+2+fTgiVFNBIMjBxwhOgCE/DJfNCXsvXYVr11HOllOyANzTje1mxaF4ySQFV5t8sBDZn8
	+9UFOeZSPzxdAA
X-Received: by 2002:a05:620a:711a:b0:8cd:9665:9ef3 with SMTP id af79cd13be357-8cdb5a5543bmr440900785a.19.1773407881708;
        Fri, 13 Mar 2026 06:18:01 -0700 (PDT)
X-Received: by 2002:a05:620a:711a:b0:8cd:9665:9ef3 with SMTP id af79cd13be357-8cdb5a5543bmr440893785a.19.1773407881072;
        Fri, 13 Mar 2026 06:18:01 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:830:450:146f:4491:fa7c:17d0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b47145dsm207778265e9.0.2026.03.13.06.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 06:17:59 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v4 2/5] media: qcom: camss: csid-340: Add VC-to-interface mapping
Date: Fri, 13 Mar 2026 14:17:47 +0100
Message-Id: <20260313131750.187518-3-loic.poulain@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEwNiBTYWx0ZWRfX6Zlj7LZxkakP
 X48/yIB8i/4eXvBN6bSchu/FffGSQmddzbYoHcBF2/WhgxHXphNsuH/Dt0AqPPkPfw/8m2yS9U4
 itRMhCHDT8ojFSMfSu7qiavNwnpZL9Ac9y6VuEXTBt49zmNiE2Xtv1vzPyKDKPCyo5X3DsSZ+tM
 BhJhtOUtnWZwbjV9Tc9T+cF+WpYL6mU/o9is2xoYrWh7Q3rx997fuSxmHJMuQ1c6KtaTBjwR9T+
 FZo0nes/KO5/pn9ak6Zn6IqHB1yteXZ7ESS4bu2VN7rxO74lJFivmp194Phc75XSp+uvcRFOGju
 DGGK/KZ0C5xXKM1Ee8+LqjjOjBieDR68Fe+VMcGchKJMx0iwzJRBfdMd9omaIqDkETL3LNqSRyA
 pmSULM9QDQqzD4c5Ovt5fVm0oZm3Ni3eW/DYMU6bS/fGyII44kMkfW2HBWzvw5XjeO8jdNbwOxa
 g5/ZxIwVE98hnyNKg0g==
X-Proofpoint-GUID: nedx_A4QwqKLLCVXoj3oVPhy7YZuEVKJ
X-Proofpoint-ORIG-GUID: nedx_A4QwqKLLCVXoj3oVPhy7YZuEVKJ
X-Authority-Analysis: v=2.4 cv=H+vWAuYi c=1 sm=1 tr=0 ts=69b40e8a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=-uu0Hre1PwtQhwGgMcEA:9 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130106
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
	TAGGED_FROM(0.00)[bounces-55677-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,linaro.org:email];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EAFD3283985
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The CSID-340 block uses different register offsets for the PIX and RDI
interfaces, but the driver previously indexed these registers directly
with the VC number. This happened to work for RDI because the VC index
matches the RDI register layout, but this assumption breaks with upcoming
PIX interface support

Introduce an explicit VC-to-interface mapping and use the mapped iface
index when programming CSID_CFG0 and CSID_CTRL. This replaces the
standalone __csid_ctrl_rdi() helper and simplifies the RDI stream setup
path.

Also correct the CSID_CFG0/CTRL base offsets and clean up the code in
preparation for full PIX path support.

Like RDI, PIX outputs Bayer frames but can also achieve some image
processing such as scaling, cropping and generating statitics (e.g.
histogram), it also offer more flexebility in term of image alignment
and stride. All of that can then later be leveraged to improve
software or hardware frames post-processing.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../platform/qcom/camss/camss-csid-340.c      | 42 ++++++++++++-------
 1 file changed, 26 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-340.c b/drivers/media/platform/qcom/camss/camss-csid-340.c
index adcbe3e01d62..ef13c4c50ab2 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-340.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-340.c
@@ -41,7 +41,7 @@
 #define		CSI2_RX_CFG1_MISR_EN			BIT(6)
 #define		CSI2_RX_CFG1_CGC_MODE			BIT(7)
 
-#define CSID_CFG0(iface)					(0x300 + 0x100 * (iface))
+#define CSID_CFG0(iface)					(0x200 + 0x100 * (iface))
 #define		CSID_CFG0_BYTE_CNTR_EN			BIT(0)
 #define		CSID_CFG0_TIMESTAMP_EN			BIT(1)
 #define		CSID_CFG0_DECODE_FORMAT_MASK		GENMASK(15, 12)
@@ -51,10 +51,24 @@
 #define		CSID_CFG0_DTID_MASK			GENMASK(28, 27)
 #define		CSID_CFG0_ENABLE			BIT(31)
 
-#define CSID_CTRL(iface)					(0x308 + 0x100 * (iface))
+#define CSID_CTRL(iface)					(0x208 + 0x100 * (iface))
 #define CSID_CTRL_HALT_AT_FRAME_BOUNDARY		0
 #define CSID_CTRL_RESUME_AT_FRAME_BOUNDARY		1
 
+#define CSID_MAX_RDI_SRC_STREAMS	(MSM_CSID_MAX_SRC_STREAMS - 1)
+
+enum csid_iface {
+	CSID_IFACE_PIX,
+	CSID_IFACE_RDI0,
+	CSID_IFACE_RDI1,
+	CSID_IFACE_RDI2,
+};
+
+static enum csid_iface csid_vc_iface_map[CSID_MAX_RDI_SRC_STREAMS] = {
+	[0] = CSID_IFACE_RDI0,
+	[1] = CSID_IFACE_RDI1,
+	[2] = CSID_IFACE_RDI2,
+};
 
 static void __csid_configure_rx(struct csid_device *csid, struct csid_phy_config *phy)
 {
@@ -70,17 +84,13 @@ static void __csid_configure_rx(struct csid_device *csid, struct csid_phy_config
 	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG1);
 }
 
-static void __csid_ctrl_rdi(struct csid_device *csid, int enable, u8 rdi)
-{
-	writel_relaxed(!!enable, csid->base + CSID_CTRL(rdi));
-}
-
-static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 vc)
+static void __csid_configure_rdi_stream(struct csid_device *csid, bool enable, u8 vc)
 {
 	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + vc];
 	const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
 								   csid->res->formats->nformats,
 								   input_format->code);
+	enum csid_iface iface = csid_vc_iface_map[vc];
 	u8 dt_id;
 	u32 val;
 
@@ -106,10 +116,11 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
 	if (enable)
 		val |= CSID_CFG0_ENABLE;
 
-	dev_dbg(csid->camss->dev, "CSID%u: Stream %s (dt:0x%x vc=%u)\n",
-		csid->id, enable ? "enable" : "disable", format->data_type, vc);
+	dev_dbg(csid->camss->dev, "CSID%u: Stream %sable RDI (dt:0x%x vc:%u)\n",
+		csid->id, enable ? "en" : "dis", format->data_type, vc);
 
-	writel_relaxed(val, csid->base + CSID_CFG0(vc));
+	writel_relaxed(val, csid->base + CSID_CFG0(iface));
+	writel_relaxed(enable, csid->base + CSID_CTRL(iface));
 }
 
 static void csid_configure_stream(struct csid_device *csid, u8 enable)
@@ -118,11 +129,10 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 
 	__csid_configure_rx(csid, &csid->phy);
 
-	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++) {
-		if (csid->phy.en_vc & BIT(i)) {
-			__csid_configure_rdi_stream(csid, enable, i);
-			__csid_ctrl_rdi(csid, enable, i);
-		}
+	/* RDIs */
+	for (i = 0; i < CSID_MAX_RDI_SRC_STREAMS; i++) {
+		if (csid->phy.en_vc & BIT(i))
+			__csid_configure_rdi_stream(csid, !!enable, i);
 	}
 }
 
-- 
2.34.1


