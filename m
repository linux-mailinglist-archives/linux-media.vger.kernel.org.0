Return-Path: <linux-media+bounces-58764-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +I+XJraN3mkIFwAAu9opvQ
	(envelope-from <linux-media+bounces-58764-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 20:55:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF363FDDD7
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 20:55:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C8C730B332A
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 18:52:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2134F23D28C;
	Tue, 14 Apr 2026 18:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eeTYb9o8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g0VyXIp2"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AE7267B89
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 18:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776192737; cv=none; b=LqOQBSpMVMTpqPEa962/hhy+WHGIctmYlp4BhT71ek2Vfa7v33xlU93ZCGuxsq15TY2cxbO+q81shRUepDDwcTRs0Ftc0bV07oaQwdNgFctSIaqZNDxHiPwHwMieLTRrBKhLKIvLnjNFFv52GVkL02eGLrgZh5X5Mg41s0jl4mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776192737; c=relaxed/simple;
	bh=nEObWx0ox6E7q7yp6aMQUBCVSkY/BEBkaclKwCkJDoc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kC5lKnP5ZSQlx4B7VPFuW7OmRu9aWVXBG7dJW4I0QE8fmilW5sWbJXLjDPHT4nA27wHLaQAgks17Qk7YUVrtEpoHHpQDntu1N2Jcin3GxUj0GPrRW3hWoqXSzXiP1PSNSkWtcbV+Dss+ti+rEC0VNaQXwA7jfa70P1f97+7nGyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eeTYb9o8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g0VyXIp2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EHba233126770
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 18:52:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CE3tDydUlzx
	CTlk+wyKFVdfFVaTekc/kqzIQHeyJg6c=; b=eeTYb9o85MBHA3RTx07Fteu3TgS
	xdB+oMklRuazJ3VrczbIRSoyVVU1iMbX+W+u7r80UKZ1LXUlns8fm/k+dL/4mUSI
	jzWiMW4yGkd6yTbeN1FFCcO5sT5HSAVbMIMrZpqOTtVPH922aSHyC419gdAFnUiW
	y2Jd4szXcJfgFG0FhMLD71cKu72ytZ0S/beppV5gqf5YGIwnmgFmDxUTgbv+rEfS
	A4aFaPk0ehFeieyu+NtykewSsf+baTm8gSUCTBCOYGBOcIW1XiOvi2Dyg0tKjGi2
	zWHPEW7Mp7BWC4c1LYBD3JDfGWN9QYQxk7eTszr9UBjqn7R7rKF0/88V7ng==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dht56r8t8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 18:52:14 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d76f460b2so152807751cf.2
        for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 11:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776192734; x=1776797534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CE3tDydUlzxCTlk+wyKFVdfFVaTekc/kqzIQHeyJg6c=;
        b=g0VyXIp2Cdhp7530lE2LC+BKhq1knZDFwrvgXHJNm0AQWXj2clnDSQHYSc4k01if+7
         spEiUVF63cKiB39+89wywtVyRN7hxv5WmRSys9fEP53PvVMIO5nT1LGgLjlDjdGu680s
         sBZZGkyeE2NTPg4pUZhb7TAWQNidIG28u73+82bTXUGpZFVJrhrLLVZEwPJp4+IpwFOs
         Hn3dYcTwMCoUXnUOr0IKtvZ+V34w2epS/45ttEmCFZDkZDcAgb/v++NfeXgBepGkTfwS
         3vpie98O0Lkn8E7qUzpBLzsdWTV3LJkPfuOXGozL5RRsxZnyfdeZ3pRw8+EX6OCjix4q
         bNcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776192734; x=1776797534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CE3tDydUlzxCTlk+wyKFVdfFVaTekc/kqzIQHeyJg6c=;
        b=VCMvdDlWyuNFTUQACy7CmrZUAxSPW0hKWMkjVw6ApYCCYI1/0Q7aAJy+aV6PEEksQi
         E/8qUrOKZys9rFzXKeXqfl2pMmLTvJbiu3ePQLeMfPobrwZ2Sb3TtHLHnKMqYUxcNLWx
         dDMZmGyDnztBeXREILOlnEsVfHSCnMsLA0yAO9Qx8hgwfKkt2diaMM3QmZmq8gNazB9J
         ypLnpD7dlHRpG6eVwbho6SgTyK2beEslvVfLe6TR3jIVcJ1QeDhKgVyp56IUG3Fz9732
         xjsw48W0fK8tH1haXzMui4s4R+Mw44QcsHinEz2ua3Ehs1/A+jUc/MxTf2Dn4RihWe3/
         8Vqg==
X-Gm-Message-State: AOJu0YxZGwTdFimyyqaBfuuIujiQiLcbtuLWaU2NZnzEbbNhSgVQKktm
	o8Boxsgcuh0y6WNxw5OF1Vszc4CE0vxFoi/vJCCIphCA/ny10Hi2+F66lQfMkukQfsHtUTqDHaq
	5dqYYsxq8FkTSCEDkoOXriE2NeYmQY5ZnF5U0JJus6is0MK+QYhZ8xL7JWWqRxlgeU69JtvQRVA
	==
X-Gm-Gg: AeBDieuxBziFODDnd2yy9L6oQaOfsIp+kgy6O5Ol5FxWER7zBu3y2wHtNVNIZAYvHRZ
	Tb1Go1jBmPoipdKLM0rsNeuIQQzd3ZjG+rb36OBpb9/VuYrL6tC3WyTzk1e8WCX0mgCB+mS8u7z
	JXSrp2dnGDCwtuvgrjAS60ncU015/b3QoDyPTZ+/MsohLJV7rpJHpZ4z4MndoziCx+B+snDbtHo
	JdKeSeDTOMBy+xs5SrjtF5qnA8GjdjvBbtTKBjhUiyFt6xaWDWudQ+tYdQrr2MGq8kyWfX81Wro
	meZ00TJmmITRGwFpf86ZANXK+xqF7qssacA0LUpPCm8XMyS5q8qCrUllFtBsIJLa/gR5Rj+3+mN
	Ot8sr1pxuq710vx2q9NkViwY+YUiF2vu7kJ3FSt4BVxjOhqcNtKwQg5mswPmoO3zF2RPptPq53H
	4INmnnx/0zEMg=
X-Received: by 2002:a05:622a:1b1e:b0:50d:38d5:c6b1 with SMTP id d75a77b69052e-50dd5b526bamr269840811cf.16.1776192733941;
        Tue, 14 Apr 2026 11:52:13 -0700 (PDT)
X-Received: by 2002:a05:622a:1b1e:b0:50d:38d5:c6b1 with SMTP id d75a77b69052e-50dd5b526bamr269840381cf.16.1776192733501;
        Tue, 14 Apr 2026 11:52:13 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:830:450:f062:40f:6621:e20e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6de97e9esm427647366b.11.2026.04.14.11.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 11:52:12 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v5 3/5] media: qcom: camss: csid-340: Enable PIX interface routing
Date: Tue, 14 Apr 2026 20:52:00 +0200
Message-Id: <20260414185202.2714019-4-loic.poulain@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=LuiiDHdc c=1 sm=1 tr=0 ts=69de8cde cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=-uu0Hre1PwtQhwGgMcEA:9 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE3NCBTYWx0ZWRfX2f9nbFt1Km7F
 BzlqPhu29d/l82Dc9bxCU/9zOZ0/GSmTWp8McU+Kd//37CTZyhLWUqu5VPhoE4pjtOpfHMN0fZg
 e6aZkVMlPjXXGdjocwWR5I7Ien6hgi0QerOMUIh+hgezbUc7pXzBc8ViLTBNM7Y8cMcxwJt2ybM
 vdDiMq7UyhD+TQoANxPAVQbDADkMtbI0J8fkX9EPV7GRrOrZtZK5JGmA3CFTor/O+fb2E6B8QKK
 pRoovf0pN9GL5eHk/YSoLZAycb8dMfbBw3nV5cCEHtVp3NgYnXBtAPcu0CkrRtcfwg1IH2U+z49
 CclXcnn4xDgMoQCG28hyX8R14djjeZvmtQ5vtVcW/xKzZHhV/Mn8P9XUL53GkvwuUZj988sOz+Q
 ri/Y86LfsY5sjh7bzaN+CIzB/vqxwGJUeYMa2BZypk+EqoKeVzHDi+D/3tUJiFqq7oQEhLjl3j6
 yt1+25oRzvsjFbSitwA==
X-Proofpoint-ORIG-GUID: IueUxrwaXVkZYM2qlDshbzV9nQ03vcYL
X-Proofpoint-GUID: IueUxrwaXVkZYM2qlDshbzV9nQ03vcYL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0
 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140174
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58764-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DEF363FDDD7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add PIX path support to the CSID-340 driver. The hardware exposes a
dedicated PIX interface in addition to the existing RDI paths, but
the driver only supported RDI stream configuration so far.

The PIX path is configured similarly to RDI but requires decode-format
to be specified.

The PIX pipeline can subsequently perform further processing,
including scaling, cropping, and statistics.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../platform/qcom/camss/camss-csid-340.c      | 27 ++++++++++---------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-340.c b/drivers/media/platform/qcom/camss/camss-csid-340.c
index 2822b51e72e1..fec95f873e17 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-340.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-340.c
@@ -55,8 +55,6 @@
 #define CSID_CTRL_HALT_AT_FRAME_BOUNDARY		0
 #define CSID_CTRL_RESUME_AT_FRAME_BOUNDARY		1
 
-#define CSID_MAX_RDI_SRC_STREAMS	(MSM_CSID_MAX_SRC_STREAMS - 1)
-
 enum csid_iface {
 	CSID_IFACE_PIX,
 	CSID_IFACE_RDI0,
@@ -64,10 +62,11 @@ enum csid_iface {
 	CSID_IFACE_RDI2,
 };
 
-static enum csid_iface csid_port_iface_map[CSID_MAX_RDI_SRC_STREAMS] = {
+static enum csid_iface csid_port_iface_map[MSM_CSID_MAX_SRC_STREAMS] = {
 	[0] = CSID_IFACE_RDI0,
 	[1] = CSID_IFACE_RDI1,
 	[2] = CSID_IFACE_RDI2,
+	[3] = CSID_IFACE_PIX,
 };
 
 static void __csid_configure_rx(struct csid_device *csid, struct csid_phy_config *phy)
@@ -84,13 +83,14 @@ static void __csid_configure_rx(struct csid_device *csid, struct csid_phy_config
 	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG1);
 }
 
-static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 port, u8 vc)
+static void __csid_configure_stream(struct csid_device *csid, u8 enable, u8 port, u8 vc)
 {
 	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + port];
 	const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
 								   csid->res->formats->nformats,
 								   input_format->code);
 	enum csid_iface iface = csid_port_iface_map[port];
+
 	u8 dt_id;
 	u32 val;
 
@@ -108,7 +108,11 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
 	 */
 	dt_id = port & 0x03;
 
-	val = CSID_CFG0_DECODE_FORMAT_NOP; /* only for RDI path */
+	if (iface == CSID_IFACE_PIX)
+		val = FIELD_PREP(CSID_CFG0_DECODE_FORMAT_MASK, format->decode_format);
+	else /* RDI is raw, no decoding */
+		val = CSID_CFG0_DECODE_FORMAT_NOP;
+
 	val |= FIELD_PREP(CSID_CFG0_DT_MASK, format->data_type);
 	val |= FIELD_PREP(CSID_CFG0_VC_MASK, vc);
 	val |= FIELD_PREP(CSID_CFG0_DTID_MASK, dt_id);
@@ -116,24 +120,23 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
 	if (enable)
 		val |= CSID_CFG0_ENABLE;
 
-	dev_dbg(csid->camss->dev, "CSID%u: Stream %s (dt:0x%x port=%u vc=%u)\n",
+	dev_dbg(csid->camss->dev, "CSID%u: Stream %s (dt:0x%x df=0x%x port=%u vc=%u)\n",
 		csid->id, enable ? "enable" : "disable", format->data_type,
-		port, vc);
+		format->decode_format, port, vc);
 
 	writel_relaxed(val, csid->base + CSID_CFG0(iface));
 	writel_relaxed(enable, csid->base + CSID_CTRL(iface));
 }
 
-static void csid_configure_stream(struct csid_device *csid, u8 enable)
+static void csid_configure_streams(struct csid_device *csid, u8 enable)
 {
 	int i;
 
 	__csid_configure_rx(csid, &csid->phy);
 
-	/* RDIs */
-	for (i = 0; i < CSID_MAX_RDI_SRC_STREAMS; i++) {
+	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++) {
 		if (csid->phy.en_port & BIT(i))
-			__csid_configure_rdi_stream(csid, !!enable, i, 0);
+			__csid_configure_stream(csid, !!enable, i, 0);
 	}
 }
 
@@ -189,7 +192,7 @@ static void csid_subdev_init(struct csid_device *csid) {}
 
 const struct csid_hw_ops csid_ops_340 = {
 	.configure_testgen_pattern = csid_configure_testgen_pattern,
-	.configure_stream = csid_configure_stream,
+	.configure_stream = csid_configure_streams,
 	.hw_version = csid_hw_version,
 	.isr = csid_isr,
 	.reset = csid_reset,
-- 
2.34.1


