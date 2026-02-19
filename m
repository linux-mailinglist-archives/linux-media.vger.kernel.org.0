Return-Path: <linux-media+bounces-53098-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GE2JSssl2kDvgIAu9opvQ
	(envelope-from <linux-media+bounces-53098-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 16:28:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 09445160257
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 16:28:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 11CBE30333A8
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 15:28:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD5753446CA;
	Thu, 19 Feb 2026 15:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HftWQayX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OHziXaZt"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1380A34252C
	for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 15:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771514870; cv=none; b=g6iqVaCV8kEzMfkluv0DzaoB6+TCVboeaHPmLyJs4F3BGAUu80MTESDv1IBQHQy18eoqk+ySt7zOpD0pQFFIy6Cb4FgWJejkaI78owU2e0rKkbJCVn7gAIKnK4KbL1SEsrhbLkG8Wkl0ODifER2MZ8MYwmvnGYaVgGWILVpkGVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771514870; c=relaxed/simple;
	bh=FxRilQsiiaK2S0QNJj77Xx5RaozkziU0n/G3wKW+ciY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Cof6RZv1hSJx2f2PTW1oL3rSPJd9tD9HCs1GNccWqc/dJRhiyaf/Shzkv8ppuGJ3wEB/uxIyftarkZI7ceGHCBSguln0NvPiJTtvQMYsOxreWHkLN2y9zBUs1MWKtbeU05F5ZADx7iivuyXFFwXwxcFcr10x8NtbNFBKwrAxiCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HftWQayX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OHziXaZt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JBMIGG3564475
	for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 15:27:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1dK157ipCs1
	7IKmJWrLFbReDebLOMpp6OkZOfGd4VLc=; b=HftWQayXKt0NH/AfwDUNt/N+y9r
	7ugTvxO7QagasjR5sNkmKYrKXNvdDRZcvj2snharmtFpvF/GMOcjF7KVE54Fcxns
	yiDFB/xh7vLwwxJdsXa1iC8XztqH6aGpOLXt06c76J+Fqs8xHuUADebpFKNzZVw6
	LsHDSD8nS3urqcHzCU5RgVCEVNLsa7A73D+0Jx4O9rPq3Gpi0r0FBxz2543NK1dr
	tW2GmvCGudTsf9UBN7gTMAknLPtd6cV9TDFHK37u+AdkuOku54/f1IoZFGXzlfNW
	oofwaXtncIbFdpCWvpuuE5AtKtEdewmzv3wZvnzqz5q/Cq7s71yjFGoPCVA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ce1k80q51-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 15:27:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c71655aa11so1038715585a.3
        for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 07:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771514867; x=1772119667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1dK157ipCs17IKmJWrLFbReDebLOMpp6OkZOfGd4VLc=;
        b=OHziXaZtbbFtCU5wmbJaAJ26phqfBg2sd66XyScTQQ8IfO/LOIdMBaCv/5aX8cUWbb
         s7T9WPpqOobt9ALfP8e/G9zxa8x8cir1Hqe0K2GXBVp59qEXIwxOdPky9N6o71FyFOkZ
         rrc4GH/tZsLZqOhurd7BuU+BoITQT9NrKQG0WpUMufNEg9DvEVHqmzZZI0Xo62oXdWPG
         k2psBBzqxIa7GpJRA8fq8QQUx5ajVkQzoHVh8upWHG3Be4OLe8KlP6zPk1kEjRCB3a/l
         P3uC3pnKnCmg97RiWizRWm6Kv5aTJmkSxqURhO/VLc4FQlQiqhMSsMrH5XOuTpKqu4Rt
         UBvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771514867; x=1772119667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1dK157ipCs17IKmJWrLFbReDebLOMpp6OkZOfGd4VLc=;
        b=KzcquSdr5JanqrJVMptTqKAXf7UzIj8AS9ridgPIUVbqiKicjmKmWaa+2qf1W+voN9
         DnA7c0tX+2e6S2fR+svcScQS8ox24DeFPYy9bp2iRAg8mN5FTaT2wvnxMlHOFmz2HdEn
         WYWDMjSKKrwcERnvEcX4nyaxkGLIvLA3unC8552/jWLzr1wauGXzCVlI1EIDulynT6vI
         K+MRMc2fFrwil9y05U54z8VsD4pKS/65jfMGamp9pfYW3hpBfu6MpDa9JOAsYcGZ0OOB
         p7AY54emnEOBhHvsmR7ycgTMMiR+Wgh8uWvYm81aTGiXcyxYjXA1sYYo1tUSoBTylBJm
         6k2g==
X-Gm-Message-State: AOJu0YyEHvD2gtznH2t7YWKYi52gtwIzU2oNWOuE/wTli2Ges8bQm9tP
	kE9q79ky5kTS39GdQmHHHR3VN68ehDGziw1PnFI7gB8kWHFYWbjYAl4uFsXZuM8OuDlr+cqJ/jb
	u6ieVbE4VDL8+mncF39UVX+19rw7rjA5gNEyl/4R2l++SqkUEuHtx+SNgLBoc3T1WHvr2qsUSob
	pb
X-Gm-Gg: AZuq6aK3DlGr6UXMI4eEKy78LfBPSXNENXrcvLpsh8aJYfhrOYRsAriCHaFPRA6Kv86
	18g2d1KuzUVR3UE8KLDR41fOAczb/ddmKA/NdD4DorodBtjSqGkZ/3JV5BYURMqVUnfxlViNGJm
	Ul+W1uPlz++sYW3bI+zh7SVNIBTao1MRz9m3/ZOGeID9B2eEAZJBTcit7QQKY166PvX4pV1TrHz
	y0feLEifppsQ/ZERzf7T5sAfKv3aY5x8uEgpYDam3pyO/Wy5yqYYzqdtWidkF8yrH+/i3vv2Jy/
	9d+TS1j3j6Y64PAsPFX1MKwhFQ005zzLRxTvh/6ZQXcDN6oPaNbb18UpBvC+3ZCtNEqArioaWkA
	u26PtCa+r3fz/GfAshkTNAgB4Mx6DZuhrK10GCTbv+kXRT0b1HqRCqgsVo7Jc0MqzwlPFd1on5K
	UYMJc/mmrOZR9Z
X-Received: by 2002:a05:620a:3943:b0:8cb:2b30:1c82 with SMTP id af79cd13be357-8cb740590c9mr685758285a.36.1771514867295;
        Thu, 19 Feb 2026 07:27:47 -0800 (PST)
X-Received: by 2002:a05:620a:3943:b0:8cb:2b30:1c82 with SMTP id af79cd13be357-8cb740590c9mr685753885a.36.1771514866810;
        Thu, 19 Feb 2026 07:27:46 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:830:450:38c9:810e:d893:92d5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb2b0ce73fsm2241024785a.11.2026.02.19.07.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 07:27:46 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, rfoss@kernel.org, todor.too@gmail.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, vladimir.zapolskiy@linaro.org,
        johannes.goede@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH 2/3] media: qcom: camss: csid-340: Enable PIX path support
Date: Thu, 19 Feb 2026 16:27:36 +0100
Message-Id: <20260219152737.728106-3-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260219152737.728106-1-loic.poulain@oss.qualcomm.com>
References: <20260219152737.728106-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: loI52vwcJh0LX9bTrd7b405JkMYwY-oa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDE0MCBTYWx0ZWRfX/OvOUe5rYCEp
 CBPN4eLPe4ryG6HFwFRqXsHlUTejFX+Bndp8h74cNNT7tgeMNhxFU8/TgOkKfBuURIvCp/rDJUm
 O9F8sQh37b/ALU4zo4vY6pCvxbxzn9jXPIFlXEFJwermCUhD4E0foTQyteHhzdDhPSXjLoZHNlf
 fKCSbknkXUmNn4c2Z/UvYyt24tYM/MMdKDoIJxpV3GXZsswt93FndBOv0ex5UIAL85ed1ar3NZP
 mawa3RsZvv0uiaIOwdOWxSIgZmqkrrzA/SjjVSQNUfbEbFB0/yFeZR702PWmCv3BGbWC/Ujw3aE
 Dw7rXjF4ZS/pZElxtk5d52znluWbk9A8h0eno0rf2IpRQPnGhZgrb6g70O84qm7wRSfC2iJXSiR
 aX0jolgVjppFHcwfF3EzZ6QnXLgjJhQXJwa8ILWKuWYVQYTDweQCdtN+V+mo+HIIkUw9c476lv5
 zwc4E/P6PEu7w1P+fjg==
X-Authority-Analysis: v=2.4 cv=cdrfb3DM c=1 sm=1 tr=0 ts=69972bf3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8 a=mkyXBgowLQxcet6ftzYA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: loI52vwcJh0LX9bTrd7b405JkMYwY-oa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602190140
X-Rspamd-Server: lfdr
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53098-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 09445160257
X-Rspamd-Action: no action

Add support for CSID to PIX interface.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../platform/qcom/camss/camss-csid-340.c      | 85 ++++++++++++-------
 1 file changed, 55 insertions(+), 30 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-340.c b/drivers/media/platform/qcom/camss/camss-csid-340.c
index 2b50f9b96a34..f7b4cb054c55 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-340.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-340.c
@@ -41,19 +41,24 @@
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
+#define CSID_MAX_RDI_SRC_STREAMS	(MSM_CSID_MAX_SRC_STREAMS - 1)
+#define CSID_PIX_SRC_STREAMS		CSID_MAX_RDI_SRC_STREAMS
+
+#define CSID_IFACE_PIX	-1
 
 static void __csid_configure_rx(struct csid_device *csid, struct csid_phy_config *phy)
 {
@@ -69,11 +74,6 @@ static void __csid_configure_rx(struct csid_device *csid, struct csid_phy_config
 	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG1);
 }
 
-static void __csid_ctrl_rdi(struct csid_device *csid, int enable, u8 rdi)
-{
-	writel_relaxed(!!enable, csid->base + CSID_RDI_CTRL(rdi));
-}
-
 static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 vc)
 {
 	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + vc];
@@ -88,7 +88,7 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
 	 * the four least significant bits of the five bit VC
 	 * bitfield to generate an internal CID value.
 	 *
-	 * CSID_RDI_CFG0(vc)
+	 * CSID_CFG0(vc)
 	 * DT_ID : 28:27
 	 * VC    : 26:22
 	 * DT    : 21:16
@@ -97,18 +97,40 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
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
 
-	dev_dbg(csid->camss->dev, "CSID%u: Stream %s (dt:0x%x vc=%u)\n",
+	dev_dbg(csid->camss->dev, "CSID%u: Stream %s RDI (dt:0x%x vc=%u)\n",
 		csid->id, enable ? "enable" : "disable", format->data_type, vc);
 
-	writel_relaxed(val, csid->base + CSID_RDI_CFG0(vc));
+	writel_relaxed(val, csid->base + CSID_CFG0(vc));
+	writel_relaxed(!!enable, csid->base + CSID_CTRL(vc));
+}
+
+static void __csid_configure_pix_stream(struct csid_device *csid, u8 enable)
+{
+	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PADS_NUM - 1];
+	const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
+								   csid->res->formats->nformats,
+								   input_format->code);
+	u32 val;
+
+	val = FIELD_PREP(CSID_CFG0_DECODE_FORMAT_MASK, format->decode_format);
+	val |= FIELD_PREP(CSID_CFG0_DT_MASK, format->data_type);
+
+	if (enable)
+		val |= CSID_CFG0_ENABLE;
+
+	dev_dbg(csid->camss->dev, "CSID%u: Stream %s PIX (dt=0x%x df=0x%x)\n",
+		csid->id, enable ? "enable" : "disable", format->data_type, format->decode_format);
+
+	writel_relaxed(val, csid->base + CSID_CFG0(CSID_IFACE_PIX));
+	writel_relaxed(!!enable, csid->base + CSID_CTRL(CSID_IFACE_PIX));
 }
 
 static void csid_configure_stream(struct csid_device *csid, u8 enable)
@@ -117,12 +139,15 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 
 	__csid_configure_rx(csid, &csid->phy);
 
-	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++) {
-		if (csid->phy.en_vc & BIT(i)) {
+	/* RDIs */
+	for (i = 0; i < CSID_MAX_RDI_SRC_STREAMS; i++) {
+		if (csid->phy.en_vc & BIT(i))
 			__csid_configure_rdi_stream(csid, enable, i);
-			__csid_ctrl_rdi(csid, enable, i);
-		}
 	}
+
+	/* PIX */
+	if (csid->phy.en_vc & BIT(CSID_PIX_SRC_STREAMS))
+		__csid_configure_pix_stream(csid, enable);
 }
 
 static int csid_reset(struct csid_device *csid)
-- 
2.34.1


