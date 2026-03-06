Return-Path: <linux-media+bounces-54790-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NgZOJDfqmlqXwEAu9opvQ
	(envelope-from <linux-media+bounces-54790-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 15:07:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 788FE2224BF
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 15:07:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C2562315A2E8
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 14:03:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC31B3ACA6B;
	Fri,  6 Mar 2026 14:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CPieP3ov";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JeGZCTVd"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA4D3A8FF6
	for <linux-media@vger.kernel.org>; Fri,  6 Mar 2026 14:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772805757; cv=none; b=p+vg8oXTaYhJsr7lYRg3g71dNEIXnLGebc8aNJz4V6DlkaWJQDj60OS0CYPz9RgAYxMC610pSvQRY+B6aBROHsu5FU9vs2AHt2K0G9AOsWMWq8TwYr7PEzFKQ8txtuHCwQC59bKTuwnvrXkxfcMOsOsPekGGZ/0EvrVAVZDxaoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772805757; c=relaxed/simple;
	bh=sm7EUyCxvaq5NY6t8LS6/a6tDz7jPLwkAccVFNr3oGU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dFYQiYIU/3IS8N1bV6tyGfw9VplDJ0OfkjAJrUeeR/Ag9dYHJgUcsOuLmioaE9O8HfPdF157/EyhLgmVvniDfVFivjA7/57DgKpb1rlrNmULTvT3UPHWtltNESh6O98o8Hf9q4WGM5OAqCnpKGMwH+6yM0r8SLAvxJVEI4NbpM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CPieP3ov; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JeGZCTVd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626BauK53406336
	for <linux-media@vger.kernel.org>; Fri, 6 Mar 2026 14:02:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fm7izIRkYuO
	+LqMnhq/FgbiZNwhFGSbGw/65vuRq+Tc=; b=CPieP3ovovxXyTFoVTHJCYGucSU
	uKOdWjGhd1dZymJbhIF9IUc75mgr7/+ucjgx0mCGkrqhxUf5wFgUTkJiTVluhd8r
	zJ9zp2RXhQwmQO5qJAuLY/l+BL25kWX0aT/daketcGdqmszZlHuxgw98EmMtXj5r
	zgnwK+9WWc4pe+SyTBAgWo0rVUVypddzstdcWKu+TfHqo2UPxxrFywREJno3EbsE
	g2rLTZjMsI1aX9x42UeXalkJ0kmVJ8h/ErtWMlnUHrzJ/31UomQ2dPUlTVRqIM4o
	qKRZnnAs6sLXehzJHFe9azJ/in9Pk95/ZraV5rb7I8DJDCdpLT8GdNYCVRQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv9u8t9p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 14:02:32 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5ffa389eba3so2681138137.0
        for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 06:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772805752; x=1773410552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fm7izIRkYuO+LqMnhq/FgbiZNwhFGSbGw/65vuRq+Tc=;
        b=JeGZCTVdfF+id+RLRdMO2j4ReGArF+C9F9/G4JXaK2uMn68z3IPK/Ft9k5kWtM79yW
         E/Dc/OfxvPF3rcC4H47MjP8j+dIPVFaoJAuqrVadMsOM6XMH51uhW20MzKFXq9wKnwfU
         KC+LaTfKyqAX7Fwxaph77m6gaOLbE8mVHoBc1gz3D/Xe7GVAHSsfNcO3vXHfhwXGhQkw
         WIUs+aWpxt6Zo0V5Pmbuuq5moIqH/MnjAyI48iT5Rm05zMcAayU2KnbVvtiHauxna2O1
         VsrPnaHKlU7XuBwWRcJ+O/Sf5GshZ4p8/8gLjDuaVu1k7Hu9hmE035L6wBwxO87UJLa4
         fixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772805752; x=1773410552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fm7izIRkYuO+LqMnhq/FgbiZNwhFGSbGw/65vuRq+Tc=;
        b=QVr9fjObC0KbvnIi445+vj9ET+itZ/lWKmzs2qx18HFvUvZgjY4ernaHAc1DxOMp4d
         fFD9JDj8n43mJbMYk8tCnRoSqZnabM/SYKO+Ysjx+BB/1tbESTygAd8Txk3LIXbB9iIJ
         n5BFfjpP9hWrZqiGKmcLTIib8DqTQklF66b/3/12YV+wgAER8J4SRZ0aUvd1k2bT3mBN
         6YRz/ZSAueAQ3lAqd8vLKGapLmJhxR5ENIcyDbrgcZnhMPM/C52V+7GSR50m7ZKkrQ9M
         zeFNKXR3m+QfozIWjo1lIRXvjTbb0NVYknspBqsNgofVo/9iq/5tBRDg0WYKijzvmgZC
         egpQ==
X-Gm-Message-State: AOJu0YzRQcVFYTvX3BqfxfvPnmpexVlUJbpQ2queNsZh08NillfdvRN7
	+rpAfhKGyf9T8UD3mA6XZ3qGhH30f1agpLqLRtYSSjsOUd2MoKuBhVtwYR952e+3mmVVqpr9530
	Dw3FTJTwZv7RpG6rzo3vdclqOYUXTfCZmQ/12CZxoWKiC+XjltzhMyWNyy/Oo0FAAmA==
X-Gm-Gg: ATEYQzxhXrFb/VXUKu9d1FtxhwMLtuGnj400ex0pr2VvP5sr9ZzbIVUz6gmpmlONH3+
	1zJ2p2hPvwXgtwb0NeK2IsfP7/DmToegCI7Zka7WcteIv/FFMeTqchG1h2qB7UG592moqsb5Rct
	j6ZIE7mJEzkcMo1Igf8Pis1H16KIce581XGwov8bUKP/TPghH9D8ShVBGLsXPif8bZV668EbJ3n
	QMYdNfey37RZtWkvuAlYcwtq1h9ocISy3Hcerm25a6KMPS72NkY4qOxS2DekOZc4isFb565njcO
	xcR3oyuPsDgOfqYC4TIZp3M6+KOcOB9rntMC/P25JZwGnl2SzpfHUNLAX+DcwX8uKQwiZxtpGB9
	dXq7EiFwdj9VDAQGDLN0BFRFGiiQl08iY4CIKJF0GR3t3HKQzzHuch48qYUD3nOjulXfa+ZjHdx
	qvZ4jjaa0wfHiL1UbWmPkUbQAPLgYl5N2C0/DwJBS44A==
X-Received: by 2002:a05:6102:442a:b0:5fd:ed98:cf0f with SMTP id ada2fe7eead31-5ffe61cfc88mr839494137.34.1772805751962;
        Fri, 06 Mar 2026 06:02:31 -0800 (PST)
X-Received: by 2002:a05:6102:442a:b0:5fd:ed98:cf0f with SMTP id ada2fe7eead31-5ffe61cfc88mr839281137.34.1772805750700;
        Fri, 06 Mar 2026 06:02:30 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485237f2d2bsm20171425e9.4.2026.03.06.06.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 06:02:29 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v3 2/5] media: camss: csid-340: Add VC-to-interface mapping
Date: Fri,  6 Mar 2026 15:02:17 +0100
Message-Id: <20260306140220.1512341-3-loic.poulain@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDEzNCBTYWx0ZWRfX7G5RWAqhaQ54
 Tw95zm8h+Zxrwp+DiagwybsxyyHJF2f1mWBkqHYg3+fedgFmymVic8yA0zKCNHOTADnd2KiOeJb
 nL6E6eiXx2R7aymm35KEa8mHuDNlNDOR95I/xO7fWKwkfkCi14Xm3Vvz6c8+wPDfu+ANP9M3xsi
 DiBsp9F2kYFvSMQbeUiV8x7CcsOjRitBewBbOlqwbW8GQq2qalQy37TXbo4XZ/QnE6tX4RffaXJ
 //uqkcU8p9FkbI8y5V7jAK3t332lO+7UaWitqUABV7+R/6KHTobvzv+xwkGHWEHufRYW70k1/mQ
 ANhZCVm8Thn0CT6E6CzvAotPqop7OIUvhV9Goj8j4aL2fCAfbN4WrQvXHkOb4zhr/PaydITbLgy
 TpDeiWPozgH4r1/7fDYew+1sYWolUDodGzOwh2gfg0AwY3F5ooeYpU/ad7CvRQNTkviU5DtaWiW
 ZmMXHZ8MQPaRPScr9qQ==
X-Proofpoint-ORIG-GUID: JEXNJl_n1kBgUZQMJNMV9v_1JWxg3RV2
X-Proofpoint-GUID: JEXNJl_n1kBgUZQMJNMV9v_1JWxg3RV2
X-Authority-Analysis: v=2.4 cv=eJoeTXp1 c=1 sm=1 tr=0 ts=69aade78 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=KcpIjEZMv6ng1Yh-ZjkA:9 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060134
X-Rspamd-Queue-Id: 788FE2224BF
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
	TAGGED_FROM(0.00)[bounces-54790-lists,linux-media=lfdr.de];
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
---
 .../platform/qcom/camss/camss-csid-340.c      | 43 ++++++++++++-------
 1 file changed, 27 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-340.c b/drivers/media/platform/qcom/camss/camss-csid-340.c
index adcbe3e01d62..9e80408727ee 100644
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
 
@@ -106,23 +116,24 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
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
 
+
 static void csid_configure_stream(struct csid_device *csid, u8 enable)
 {
 	int i;
 
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


