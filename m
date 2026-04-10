Return-Path: <linux-media+bounces-58470-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDHZACF82GlbdwgAu9opvQ
	(envelope-from <linux-media+bounces-58470-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 06:27:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D63F3D20E4
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 06:27:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F1C9304178C
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 04:26:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B9282D97BA;
	Fri, 10 Apr 2026 04:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JDByf0Q6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cCEMTIOP"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C446226C3BD
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 04:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775795160; cv=none; b=qYdoYZr+WM5CtigxYENaaF8YM40GVDEIXmQrUhm/Gbmy/VSQgWDIUb7Tf4o/KmGS9s8klryYqSQA1rNZQ08Ys0DcOQ7SUnizbLaSoaANhKWui0L0CiusDyGvmE0dlm6VxnukO6OQ2RwmV4HbxaHKJwBNn+Kpdt20xWBrq6mVBTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775795160; c=relaxed/simple;
	bh=SnXQQwaniM6wyvtkkYfXYojpha0kiBbHarP+B+jvXpU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cNvJZMWohW5XJe9F5pR8oR1rOcTgzPh4r/weq6lcSJmC2vb9mCJPDFAzAvW5rFHvd+kWKlLZJrT0DWRkl2ZOCIJ/OSWvIusETm8b/qvaVwymTxJ+51SU1lvb4uXeEtpsRcUhCdBFpHQalI2/lMFKmg+2VjXedF1V+Q4NqF+MIQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JDByf0Q6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cCEMTIOP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639LMdEp1972607
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 04:25:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uoSsLItudMRII6zEeDheBQTFmGmnitaPyymYQrLkA5g=; b=JDByf0Q6yMCONpnt
	lEubclF1r+/+JeLVBN4ekMyL9Bnbyacf2p3p0umgwv5KenDquMGmfDnSuZ63g7tf
	tsNHZ8phpn4jjPBbJVjx2DEs/OH0MO2F7Z1Nwp7LDzOwaM3XVNxhhtFT10IzAjMT
	EeTRU+m7La7ZaVUujwhlk630UT2Fad4sNtCHaNjByDl4UdRjI7ucBbdvIDyqcnqo
	SKsWpLsg6S4zK3jsTvCf+JPtbCh2s+hPXh+7g94lHJAa/GPklRO2GUYcHpBnoYjk
	8XfHQg4MGjXkO7OCqa/rn8dCFkHJ1CuZbvfQMYOBZcsgWkUkCMAdX6QaA9YlG6Ik
	3Ou28A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4decms2nvb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 04:25:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cfdc479f68so180854285a.1
        for <linux-media@vger.kernel.org>; Thu, 09 Apr 2026 21:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775795156; x=1776399956; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uoSsLItudMRII6zEeDheBQTFmGmnitaPyymYQrLkA5g=;
        b=cCEMTIOPGqHwV/OZQQumBb3Gt/euYcKlhrsb/q5mLorfNrTT6yWAlMFZV+jiF6Vxoj
         FHb0Tj5OlIkEPGYDv1AZo2fR+yxqre6jJjRRunxVWckox7lW/t4NIsTbEaw22OyrRBoC
         T2Hf54xMlT1v3HHO03yfz86e4zwFrdZG3t5vYBuE4GdKJ3rJzCgctQ9MVi+9AUKhxBlG
         zEhVkoEJNQ1lWQd++kipOhIcA7PsnDQBZH1dnUJvJfn/Lo/j/zVpbYxy9pcsAkMq8ym/
         xS4tqgrRpm4j2ASVyRbzyE8bnIjwZKjvVBh5yGePxdxKS0Jv3UGhEPCAIx4TjZnMyGOQ
         Z0Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775795156; x=1776399956;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uoSsLItudMRII6zEeDheBQTFmGmnitaPyymYQrLkA5g=;
        b=KBVmqjq4cXEuJQcXXTlPiZMeJuKeKG2bh9S6T/z2bO3VjK6CuaOPifTZL60fUQnItl
         eEgGKuCQVctC4y5p4FfuEzT7fuo+WT963JzR6R0Z/1jhtmzXUtty9+tq2hsa10H0seeW
         pzjOSSywwBYCtiKVIMubVeNXda38fYb6+1l3z5lQNizlsy66mtGmXSb6da41P4l8pFF8
         b12kUVjyKA8n33Eqll4XuTVvRd1BglccFxQCcByKEbyG3XHYO4zSmbONs673m7BjroN/
         wnc1rcDOTvEAmXU36fQY/8JOlaSR0hYWZrIZIAKmBqBhM2O+Gx+WdGJsjW+DE1P5bW4k
         M9iA==
X-Gm-Message-State: AOJu0Yw0EwbcSRn4HGyVQjjCHrQkYYb3SQsbL/f/Eug9ZPcl2GySSB+w
	G4Qw2RxSDd4LglrP9Bqfp9ki6W2w5pdSB5Fa9ZBxEP3qGoWTuxs4SEH+SPu5DQY5YNQfikuLYct
	OhDRSfRzYdjU0Wzv12JnvwsSuIpw1Rnbplf3vvBGgmR7yuZWcvjfYGy//6Y9t7AKUbSTjS3HDL5
	ov
X-Gm-Gg: AeBDietXjsqP5J16azOFi6LXC617szx8ErbxmedM81Spy0eoYvlHoDwa1SCNTaG5YZI
	i1ojLGk2IrbAul2v4PvyrZJaCFba3XQr0+PBRFzfUvEzzdmGmyVq8mk3saHZGiW1l2nmbo431Pd
	OaAS2Yx8MYC+7GZZs4yat+qol0eX1oO+aMmLPb+MJ/9On4AzY97oIIiVw30lN7s0jCeD+o9A8XY
	RcZvjcuFCr3kaYReaQl34qX+QCNTE3DrbdGJNRhGfkD2ppYH6MnVGfe09lYR9sSxbuea9SFjJd5
	iQd/F35Dx6rgcLZPOc+fgwp+P/yYk55TXgOmnYo5LbYAaGYsKx0ReIDpMGXqLw9vWnM1bZPw6Di
	qCZ3OV/o9Jl2Qmwf/bqXB6gKIg6OkieSS35Pw7eqgBXLffxZTZRf7K4O3Nsjz/SS8a/F8LLIZnQ
	Jr99qSE0c7+ePh
X-Received: by 2002:a05:620a:4082:b0:8cd:95b4:c521 with SMTP id af79cd13be357-8ddcff969ddmr200998285a.45.1775795155739;
        Thu, 09 Apr 2026 21:25:55 -0700 (PDT)
X-Received: by 2002:a05:620a:4082:b0:8cd:95b4:c521 with SMTP id af79cd13be357-8ddcff969ddmr200995185a.45.1775795155166;
        Thu, 09 Apr 2026 21:25:55 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ddb934d8e9sm121757785a.35.2026.04.09.21.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 21:25:54 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 12:25:32 +0800
Subject: [PATCH 2/4] media: qcom: camss: add support for X1P42100 camss
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-purwa_camss-v1-2-eedcf6d9d8ee@oss.qualcomm.com>
References: <20260410-purwa_camss-v1-0-eedcf6d9d8ee@oss.qualcomm.com>
In-Reply-To: <20260410-purwa_camss-v1-0-eedcf6d9d8ee@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775795138; l=6633;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=SnXQQwaniM6wyvtkkYfXYojpha0kiBbHarP+B+jvXpU=;
 b=YCKpdrZmMf0NPUochfl501JjkNcvAEy+V8SEjYB7tXH+DsfT8LKKa1YfyNbx8riZP4nWi4Qsb
 VC9UdU3FFN2Dl7HcUfR23wsOxuxkoJS+K4htm7sE3V1KPy4eaaWdPy4
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: iNchZZ-g6uZUfI2m_BTxCSW5Auz9FL3s
X-Proofpoint-GUID: iNchZZ-g6uZUfI2m_BTxCSW5Auz9FL3s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDAzOCBTYWx0ZWRfX051QAXT0Kw9W
 r/JuSMN/gJ785zUgR7QHyg7m5Fyfr0Xi0Bl0Ff2+8hZtuejn1x/mtsFCcBDOWBip4pzu3uwBWMP
 sWW/8p1+2xomKTeeklb4Qypn6UQOyQ59yG+7KXBSAWszUezzzOAAAKgJUHI2GsKBE9HT36ViQ2I
 O2uBTL2u4AOPdrqMq82FA6ysU7fNhLylFZk6xiO7nQvVlnpK/KmJL02BTaakJMcQljfpYk2kHz7
 4LSomYQEGgcG/Ofr0COC6/TRTG1UMZCTOhS9azGPbIzCvUfXntBxDi8hQXoOb7XX+q3MbQlPmst
 E+0AuHf1GoIxZfFYBDVHdfKEo7YGsrvXtlpBePzm3kKGOwvmqF+5OzUyuAtQZPDcx505ZnRqzYq
 w6XiV9H3bHf+wtY3kyYgPb1Qtzn1f3jW/gtO1IU3gdlyxyenbliN4w5DTcQWD0XNS+pu05fa6Ap
 REW0WHbLa8zF5mXUqQA==
X-Authority-Analysis: v=2.4 cv=N/sZ0W9B c=1 sm=1 tr=0 ts=69d87bd5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=1RQh02oxwFab6bGosmoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_01,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100038
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58470-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4D63F3D20E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Purwa camera subsystem is a cut-down variant of the Hamoa CAMSS.
Compared to Hamoa, Purwa provides only two CSIPHY instances and does
not include the VFE1.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |   2 +
 drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
 drivers/media/platform/qcom/camss/camss.c          | 109 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 4 files changed, 114 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index 4154832745525972a663809c947a9e9aeca9f944..d37f71de0f42c394b0918a22de2a18836cbfec75 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -1020,6 +1020,7 @@ static bool csiphy_is_gen2(u32 version)
 	case CAMSS_8650:
 	case CAMSS_8775P:
 	case CAMSS_X1E80100:
+	case CAMSS_X1P42100:
 		ret = true;
 		break;
 	}
@@ -1115,6 +1116,7 @@ static int csiphy_init(struct csiphy_device *csiphy)
 		regs->lane_array_size = ARRAY_SIZE(lane_regs_sc8280xp);
 		break;
 	case CAMSS_X1E80100:
+	case CAMSS_X1P42100:
 		regs->lane_regs = &lane_regs_x1e80100[0];
 		regs->lane_array_size = ARRAY_SIZE(lane_regs_x1e80100);
 		regs->offset = 0x1000;
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 5baf0e3d4bc461df28d8dcf97a98dec04fa17ceb..b48dfad5a8a73f81254086e5fc8f5bbc3a45aef3 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -353,6 +353,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 	case CAMSS_8650:
 	case CAMSS_8775P:
 	case CAMSS_X1E80100:
+	case CAMSS_X1P42100:
 		switch (sink_code) {
 		case MEDIA_BUS_FMT_YUYV8_1X16:
 		{
@@ -2012,6 +2013,7 @@ static int vfe_bpl_align(struct vfe_device *vfe)
 	case CAMSS_8650:
 	case CAMSS_8775P:
 	case CAMSS_X1E80100:
+	case CAMSS_X1P42100:
 		ret = 16;
 		break;
 	default:
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 3b092560b5df54513a5d0253dded1527769fcfbe..d2221f968251fc2c1ab7996ff54b087667a8108c 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4158,6 +4158,98 @@ static const struct resources_wrapper csid_wrapper_res_x1e80100 = {
 	.reg = "csid_wrapper",
 };
 
+static const struct camss_subdev_resources csiphy_res_x1p42100[] = {
+	/* CSIPHY0 */
+	{
+		.csiphy = {
+			.id = 0,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY4 */
+	{
+		.csiphy = {
+			.id = 4,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+};
+
+static const struct camss_subdev_resources vfe_res_x1p42100[] = {
+	/* IFE0 */
+	{
+		.regulators = {},
+		.clock = {"camnoc_rt_axi", "camnoc_nrt_axi", "cpas_ahb",
+			  "cpas_fast_ahb", "cpas_vfe0", "vfe0_fast_ahb",
+			  "vfe0" },
+		.clock_rate = { { 400000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 345600000, 432000000, 594000000, 675000000,
+				  727000000 }, },
+		.reg = { "vfe0" },
+		.interrupt = { "vfe0" },
+		.vfe = {
+			.line_num = 4,
+			.pd_name = "ife0",
+			.hw_ops = &vfe_ops_680,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		},
+	},
+	/* IFE_LITE_0 */
+	{
+		.regulators = {},
+		.clock = { "camnoc_rt_axi", "camnoc_nrt_axi", "cpas_ahb",
+			   "vfe_lite_ahb", "cpas_vfe_lite", "vfe_lite",
+			   "vfe_lite_csid" },
+		.clock_rate = { { 400000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 266666667, 400000000, 480000000 },
+				{ 266666667, 400000000, 480000000 }, },
+		.reg = { "vfe_lite0" },
+		.interrupt = { "vfe_lite0" },
+		.vfe = {
+			.is_lite = true,
+			.line_num = 4,
+			.hw_ops = &vfe_ops_680,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		},
+	},
+	/* IFE_LITE_1 */
+	{
+		.regulators = {},
+		.clock = { "camnoc_rt_axi", "camnoc_nrt_axi", "cpas_ahb",
+			   "vfe_lite_ahb", "cpas_vfe_lite", "vfe_lite",
+			   "vfe_lite_csid" },
+		.clock_rate = { { 400000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 266666667, 400000000, 480000000 },
+				{ 266666667, 400000000, 480000000 }, },
+		.reg = { "vfe_lite1" },
+		.interrupt = { "vfe_lite1" },
+		.vfe = {
+			.is_lite = true,
+			.line_num = 4,
+			.hw_ops = &vfe_ops_680,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		},
+	},
+};
+
 /*
  * camss_add_clock_margin - Add margin to clock frequency rate
  * @rate: Clock frequency rate
@@ -5340,6 +5432,22 @@ static const struct camss_resources x1e80100_resources = {
 	.vfe_num = ARRAY_SIZE(vfe_res_x1e80100),
 };
 
+static const struct camss_resources x1p42100_resources = {
+	.version = CAMSS_X1P42100,
+	.pd_name = "top",
+	.csiphy_res = csiphy_res_x1p42100,
+	.tpg_res = tpg_res_x1e80100,
+	.csid_res = csid_res_x1e80100,
+	.vfe_res = vfe_res_x1p42100,
+	.csid_wrapper_res = &csid_wrapper_res_x1e80100,
+	.icc_res = icc_res_x1e80100,
+	.icc_path_num = ARRAY_SIZE(icc_res_x1e80100),
+	.csiphy_num = ARRAY_SIZE(csiphy_res_x1p42100),
+	.tpg_num = ARRAY_SIZE(tpg_res_x1e80100),
+	.csid_num = ARRAY_SIZE(csid_res_x1e80100),
+	.vfe_num = ARRAY_SIZE(vfe_res_x1p42100),
+};
+
 static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8939-camss", .data = &msm8939_resources },
@@ -5358,6 +5466,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
 	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
 	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
+	{ .compatible = "qcom,x1p42100-camss", .data = &x1p42100_resources },
 	{ }
 };
 
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 24ec3ad7990e7c582b06a2c112361128b2358630..c1374033f0b2036458ae6fe31034f183d3041a09 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -94,6 +94,7 @@ enum camss_version {
 	CAMSS_8650,
 	CAMSS_8775P,
 	CAMSS_X1E80100,
+	CAMSS_X1P42100,
 };
 
 enum icc_count {

-- 
2.34.1


