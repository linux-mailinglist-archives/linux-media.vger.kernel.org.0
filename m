Return-Path: <linux-media+bounces-55678-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Gv2LJQOtGlvfwAAu9opvQ
	(envelope-from <linux-media+bounces-55678-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 14:18:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B82EE28396E
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 14:18:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CA3B63008C89
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 13:18:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F8FB3BB40;
	Fri, 13 Mar 2026 13:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dR2sUkDf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ub8lBjn4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17352F619D
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 13:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773407887; cv=none; b=DhaZ73zhYPFfuevappAFQK/pJ0FqgOsW3vE24JlT7sy41nGvTPfXPEs1TZ7iR0dI0aGLwF+kPHv/C2h59RJSwPIFIRAD8PbNGtlr/EkezNDO/2viX2XxDhyE59SUyHOrfR5vhL2du7lNwQIW+SlVugLUffYn8wt0hnCoR+AwIls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773407887; c=relaxed/simple;
	bh=N/QkK6UCM8Riu6U+V5mew0FVCjl1eWGA/XSg0YCWmfE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MpGo0hnqr0LuC9sdYN4Nb0tt50wf7LjqWdufORa5Jdj093GFAwgu2v9ueWGbjlYNKGrtiWZlyGYgswVzaqvFl87p+f6yyWjHk8oQ98U7YyRJM25JHuaAvkJBAQxQp9o7WYHRKwsUZZNQ9md5SV2Et1w800R4socNTlT3A6IEL9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dR2sUkDf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ub8lBjn4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DAsXXa529146
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 13:18:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=twoNpcbDUSs
	Wg4pgFugO3cv89lEgIZg56ry+PpV4chI=; b=dR2sUkDftEUlcwB2mByQplsTgT2
	qefaLKdDf8urYXwJHjI5bCaOgYrjF2KRMgc+KESFB6wbPMEtf3tWR4u//8Ul+Tdm
	4SSZ5blhrP8ydbOKfDvjwityMSN9+ecXsKW7iIvJIBkCF1KiwUPhrZSEZYlrgKqy
	ywKik4gHoaZwXsWk9GZcIigJw1PxUkdlBGBbRzdgd0S66PzZiyTjVcy87zhNpiXF
	6CWs9kXYfuH3aXHAbeOWdteZlOUF3y3iSe/pHBjH00kntG5uY/xMBiYs5A4p5Zuo
	bFgfDF+yOVkeJ+yts2IXZ5TS4iewWVhQnATyOvjWNPkA7C6cQJI68U9tJgQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvh84rdj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 13:18:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb52a9c0eeso2082609285a.2
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 06:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773407884; x=1774012684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=twoNpcbDUSsWg4pgFugO3cv89lEgIZg56ry+PpV4chI=;
        b=Ub8lBjn4l58KoSXGv0dbI0xKlwk4/+Fzo1WUGmCwQX3ECj49IxcOk4GOToEOLH6uL7
         2fFhXtxN5yvjwFh9eCxFhryRbBxOHQ1826uzuuCl/MuDiPNybXvr5QF6TUN+/8KPq7eX
         fJwLH31EYPyX64Qk9Ik3XQ/bFpr3wLPE31pv26D5mEMZac1m39hfwAV0BiD0TM/DoeD/
         G13kyuLjyaje1arTey9VDfjdHvkXizCwj2M7HzsOmAl/tyDWJ404qoSc/PoGIivqhp9h
         w0yhb+YRauAT2UwS7V3I45q+wUSopnfzgLCohOFrzUFQwt4CSMec3TbHwvs82rG3z72o
         dX4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773407884; x=1774012684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=twoNpcbDUSsWg4pgFugO3cv89lEgIZg56ry+PpV4chI=;
        b=LPaAJEqwmSZeyK3sqYKqa1bS51SnRC2GzJDSD7fQHkJRs6QAHJwtgyag9MXnMV5wtR
         2SkCN5wjdwWbkuR4Z27biL/AdAlV6yYif1ZGAdhHSiwLwFjzjoomNeS44m29JQAnAImj
         pXKWt+3tT2deIV1o5mCuq7V9iWQKZtiFNcrbpFefZgYvRHHiDQ9BkdEDFNcASO8H6xz/
         3F2acSMg5M77G5l2cC93UxSIzz5aXZgZHqRW0OgNedt78+As0DVcKsykrdcPEzGTuRsp
         to48layO2t7bKDp7UkPJLiEd1iyP28Nbgb+/o8a1+kAmNPhtexeuyVRQLnRxtwHQXKys
         SBfw==
X-Gm-Message-State: AOJu0Yw15/Q6Gf+VBBTkRcW0W5hMBzA7yfFc7eRiHSlDkVee5arKaDSZ
	/5RmZnF2SiDH8qTkepuB2E6Zkgl6n3UPE26XJ4nkSPNSLTvctLEO4qIVaeZBpCpKHyOA0Rf/MtS
	F3JguRBC3ls7FfWNHCT6RR8tgYwgouAKHUoyStlFiW+bfljkqeE+5L4yRNa7FBZexuw==
X-Gm-Gg: ATEYQzzSL1sfJo9cIf2H5p80BJXg1CSISdLJ6bBFmg6stVVnLU7EBNCemhka5JoGALs
	OT/gHojUPHwtucKXwiDWrBFqUO6XxkCQiBoicAirJaULFh8IqzpzLe5bymHETQwNf5Fx8LoGddt
	kIh0yFOV16VG4rpwGyJ3Mm3fJ7Q0F9kIhKx+xfvDBH7kE2wsfF5udUPEhh1yFBROEWv2i/nsLE4
	NMAH55I+fBepSsekoKP9cobf0fjKGJyowZnI9laLq6BVBEBOxAKkRmaSPjibp0O5SOHt5ykRYjR
	YOFY3SAhrdT91XC7GmhtrCrsfKy84+0hclN18XazSQY0rsoxDyPzAMzHHuZNCVnAP+fS0Kl+SyZ
	IZYHisO9nHBx59FIHFxDSoXGMxeRlfI6Qgke67HK0Rj8RTp1h1MafZbolj5njBKB56QIlrnCUNZ
	fHnw4l2169Dua7
X-Received: by 2002:a05:620a:4627:b0:8b6:1877:3689 with SMTP id af79cd13be357-8cdb5a928fcmr465535985a.35.1773407884055;
        Fri, 13 Mar 2026 06:18:04 -0700 (PDT)
X-Received: by 2002:a05:620a:4627:b0:8b6:1877:3689 with SMTP id af79cd13be357-8cdb5a928fcmr465529785a.35.1773407883538;
        Fri, 13 Mar 2026 06:18:03 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:830:450:146f:4491:fa7c:17d0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b47145dsm207778265e9.0.2026.03.13.06.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 06:18:02 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v4 3/5] media: qcom: camss: csid-340: Enable PIX interface routing
Date: Fri, 13 Mar 2026 14:17:48 +0100
Message-Id: <20260313131750.187518-4-loic.poulain@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=OMoqHCaB c=1 sm=1 tr=0 ts=69b40e8c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=Qlv3vNw1l6VwQTj1CKsA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEwNiBTYWx0ZWRfX5XzKBVBGShAp
 T9Sc8CqSemaFuf0mchm+xCPmvqQD7NhEdZMrQJ2IVk9wwJ5jmE+DNqy2RZoNc6yyr+fvq9+bxC/
 zjZFn9jxb7VBycAHjuhC37ESO6/m1wpBtc/I2GQBbLVTxDNa334i3RHTpQ2LezJ/kcM6GZt6oN8
 Vj88YCvpV6CtWfQEEIEjSP9/raWSHtcKqw5nOaCM7oMpzxFDHL9QtVOnWH7FbTg1NjI1Aeijwrt
 EkT+BUl7Db5OxLM47J7fkzITiLs4kp6Fy4hn+82HJTcRezUl0qSj56IBPJAh3Jo8ZDckEHe0ctL
 z+QC5p3vIaOaa5RYXzRdz21C+RNkQrjVB10Sv2irhoVnVNZsFzWWnD9riXzyNEEWw+01ECMIfyM
 lowbIDbq4dYuvYgBfKBNuJGQ8gMHU0DvYO4It11bz+yubw0b+wF9vVZJjJj5LUmBLGnh3HPOuQb
 KuSbR1L/Oy9KDz6R52Q==
X-Proofpoint-ORIG-GUID: lYaVFQYNzg_0OF2PZtSP6mE92s8Ip8Sd
X-Proofpoint-GUID: lYaVFQYNzg_0OF2PZtSP6mE92s8Ip8Sd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130106
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55678-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B82EE28396E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add PIX path support to the CSID-340 driver. The hardware exposes a
dedicated PIX interface in addition to the existing RDI paths, but
the driver only supported RDI stream configuration so far.

Implements a dedicated __csid_configure_pix_stream() helper. The
PIX path is configured similarly to RDI but uses the primary stream
(VC0/DT0) and the appropriate CSID_CFG0/CSID_CTRL registers. Stream
selection logic is also updated so RDI and PIX paths are configured
independently.

The PIX pipeline can subsequently perform further processing,
including scaling, cropping, and statistics.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../platform/qcom/camss/camss-csid-340.c      | 34 ++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-340.c b/drivers/media/platform/qcom/camss/camss-csid-340.c
index ef13c4c50ab2..094fdd3697ad 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-340.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-340.c
@@ -56,6 +56,8 @@
 #define CSID_CTRL_RESUME_AT_FRAME_BOUNDARY		1
 
 #define CSID_MAX_RDI_SRC_STREAMS	(MSM_CSID_MAX_SRC_STREAMS - 1)
+#define CSID_PIX_SRC_STREAM		CSID_MAX_RDI_SRC_STREAMS
+#define CSID_PIX_SRC_PAD		(MSM_CSID_PAD_FIRST_SRC + CSID_PIX_SRC_STREAM)
 
 enum csid_iface {
 	CSID_IFACE_PIX,
@@ -64,10 +66,11 @@ enum csid_iface {
 	CSID_IFACE_RDI2,
 };
 
-static enum csid_iface csid_vc_iface_map[CSID_MAX_RDI_SRC_STREAMS] = {
+static enum csid_iface csid_vc_iface_map[MSM_CSID_MAX_SRC_STREAMS] = {
 	[0] = CSID_IFACE_RDI0,
 	[1] = CSID_IFACE_RDI1,
 	[2] = CSID_IFACE_RDI2,
+	[3] = CSID_IFACE_PIX,
 };
 
 static void __csid_configure_rx(struct csid_device *csid, struct csid_phy_config *phy)
@@ -123,6 +126,31 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, bool enable, u
 	writel_relaxed(enable, csid->base + CSID_CTRL(iface));
 }
 
+static void __csid_configure_pix_stream(struct csid_device *csid, bool enable)
+{
+	struct v4l2_mbus_framefmt *input_format = &csid->fmt[CSID_PIX_SRC_PAD];
+	const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
+								   csid->res->formats->nformats,
+								   input_format->code);
+	u32 val;
+
+	val = FIELD_PREP(CSID_CFG0_DECODE_FORMAT_MASK, format->decode_format);
+	val |= FIELD_PREP(CSID_CFG0_DT_MASK, format->data_type);
+
+	/* For PIX we use the same VC/DTID as RDI0 (0) to capture the main stream */
+	val |= FIELD_PREP(CSID_CFG0_VC_MASK, 0);
+	val |= FIELD_PREP(CSID_CFG0_DTID_MASK, 0);
+
+	if (enable)
+		val |= CSID_CFG0_ENABLE;
+
+	dev_dbg(csid->camss->dev, "CSID%u: Stream %sable PIX (dt:0x%x df:0x%x)\n",
+		csid->id, enable ? "en" : "dis", format->data_type, format->decode_format);
+
+	writel_relaxed(val, csid->base + CSID_CFG0(CSID_IFACE_PIX));
+	writel_relaxed(enable, csid->base + CSID_CTRL(CSID_IFACE_PIX));
+}
+
 static void csid_configure_stream(struct csid_device *csid, u8 enable)
 {
 	int i;
@@ -134,6 +162,10 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 		if (csid->phy.en_vc & BIT(i))
 			__csid_configure_rdi_stream(csid, !!enable, i);
 	}
+
+	/* PIX */
+	if (csid->phy.en_vc & BIT(CSID_PIX_SRC_STREAM))
+		__csid_configure_pix_stream(csid, !!enable);
 }
 
 static int csid_reset(struct csid_device *csid)
-- 
2.34.1


