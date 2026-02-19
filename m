Return-Path: <linux-media+bounces-53097-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MAyGxwsl2kDvgIAu9opvQ
	(envelope-from <linux-media+bounces-53097-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 16:28:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8F8160241
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 16:28:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C99F43045024
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 15:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C950234676D;
	Thu, 19 Feb 2026 15:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tv1eA19G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BcAnr01W"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D133451A7
	for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 15:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771514868; cv=none; b=Ux2b+Q+2gnuKoLQFRtzQqqPg79JaH53bJ8qA29SG28q07tN6GO+HPugc+IO5FrKt6x6DPFPKbYsTB4pB11fh/2oey2vHDFg3645jFNz+IiyQBjiMbrPb1ciqXTUPstjSMRezx0wVRsSFzDCM2psVCZyghr7gcFNcc7uz3vvm7/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771514868; c=relaxed/simple;
	bh=pC1qyo4Rq8V1V8ksxuohx+mj5bzZqoRfvH0fFFMPCHU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NUsIBerHO+GamqwQ0L7HSxzpxiXYW/nh5RGzqU+vdqc5M/+19NTNTHXw9ohXcY+vsSjuXJT761+PMJISyu98hZfSEHJzJQawgUPyK0g18Vtq8fNq8xslalzbS8Iw7d1PEPUeAUiED9KzMWJux4ArvVOgcBqPE9/gSXGA2LID8HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tv1eA19G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BcAnr01W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JBMR8a3564631
	for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 15:27:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3m2rL2geeNz
	YleVmq+9wWjR3H/wGqedw8yvmD8bnLtc=; b=Tv1eA19Gpij/r24Jp/oeibgse9n
	XYc2DBDKcfDouyGjaBBXB/IhOg1bCXDD56rlufXc6UZrcPvke842TRt5ggmkO1Yq
	O3M87gMe4lJgVprLuO5jtV8YIhMwdAW6V/4AioYTGd6CgzxZwx5H28FGdrJ7ofdU
	2c4nB57CPMbmNGgDZP5jgFN01IuFNs3Xe26V9ymA+bOW8Uxz/sQ4e+27wsD8TDfn
	+riBtBQDmqVA9IpTnd3EZWZUXGP4YiYunFjbyO0lt2a9kzT4k8VSMsG6TTXZXtow
	o5d11ywaIxwXoGcBM9tiCKFvZkQ4A4MbIa/FHl7ow8F5sbi5f67NqKG5TMg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ce1k80q4b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 15:27:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70ab7f67fso1262642585a.3
        for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 07:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771514865; x=1772119665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3m2rL2geeNzYleVmq+9wWjR3H/wGqedw8yvmD8bnLtc=;
        b=BcAnr01WFa4/aA8N5yMz68pUsVYwy22FfLhN6UnD8XhYwGN5AXhgKJaqFsNi+hJqPA
         XG0sZzcxwLpd7sy6QaqD/5VwGPkLc7g9lhj4NnfTldQtRrEaSX47pV+OUJC/GkKBFnke
         u45w3ucS4S9vQOYFa6RZXRkKzVHD7CdFrZamuod3Okc0nVw2uBZM2A2cQAr7XfRcEey2
         xxCbAg2AhnZm7eMNtO8KNF4IeeN1ZcPyrEgcL9BKc3r4Et2C1PDNnZZIHJ3LS4tbxMtf
         Ot2sD1DtWZEgX3j/E1K1/XMsDQA94vrIdpXOwz07dU++lH76k8VTgoM2HEWHrAAckrQY
         8DSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771514865; x=1772119665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3m2rL2geeNzYleVmq+9wWjR3H/wGqedw8yvmD8bnLtc=;
        b=Pz+xIIEw57wjiMJVaP4N41cFSLNsj9+JPAkUlYfn4ukYPISP4tHs4FU3wN6Us9AyVc
         O3vFtPkEyjrLFLaEu5AJhNPrDwmWkYDkpim7zWI1CvyZsVdr7EZ3lUeSgIUwnqQGbGVy
         P+cL7WIIrXz9nQAawU38RKPR34gQfzXvivpGnSWNM6ZS54FmyWNl7FLBO5PmNla80vGO
         +xfp/KIw5ZDxijU2LJ+7wgjN0Zt/kT5i/ZAY/U70hXf1Y2mP8oCjweKUp2Qt/XKHZwox
         2gOW0G7Sc88lReP4SY7oInpZpHeH2f5Xquq2su6v08/uANWb9Mws12GCA3RZhNYYIF6U
         0RTg==
X-Gm-Message-State: AOJu0YzG8ibf80vqxg0i2Xyd8NUffSs+yQtpERiI82JYLk8IZEpRkE13
	43ou6Nw02Sj3m3StZjh46wOiIav3wSbxk7U3uwSJ6f9PVpnkM1/9C9yea06UQpz9LhJyw5t2mSD
	yoWIL7FA/I7JzlIcuG+YgHgRrhkvfYKtCBmCH+2t8Z0f0SUzYwumIiAzUt8EQuVSlVg==
X-Gm-Gg: AZuq6aKYdTv5xSTcBecXXvEITIcRxG0MQKHd9EVfVASsyPNknGogEGdldQmEu9b1AZv
	fq6XOXmALCN0TkoYkePPZ0Ga28mS4T9o5+IO+eUKcyNMD2XlLuiP/pTnIr7Tzpg9iObu+MTVvl8
	UtDKkJSxHrKm3RH84HU0FFKwn8O4SWh6QfLEfm+IX52siVZGpoMGr965HA74QSRV6UcJPv8yi2K
	49+bG8VnRSuPNWe5GKCodUVbzm4rvRta/RWUSyh2jsH4EfpEXWXeVXPeAl2ijSAZU5ukLapGll5
	mO3YjRGU7Sf/2rtnVvAu8biK4GJHm87/isCBJ1u4Qv/05qOkBFyEU8f69hBcSqd96g/+FdQBQ+v
	+2sOdWpH88Alc8aTTzu+3JzquWctgrbyda8zC6EWNjkaZEAZn2i+2TdlZz90Up8VgZtsvZiXwbu
	mDeqx+DVDbhJAq
X-Received: by 2002:a05:620a:4487:b0:8ca:f268:c6ec with SMTP id af79cd13be357-8cb4c0143cdmr2119843385a.56.1771514865229;
        Thu, 19 Feb 2026 07:27:45 -0800 (PST)
X-Received: by 2002:a05:620a:4487:b0:8ca:f268:c6ec with SMTP id af79cd13be357-8cb4c0143cdmr2119838485a.56.1771514864591;
        Thu, 19 Feb 2026 07:27:44 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:830:450:38c9:810e:d893:92d5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb2b0ce73fsm2241024785a.11.2026.02.19.07.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 07:27:44 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, rfoss@kernel.org, todor.too@gmail.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, vladimir.zapolskiy@linaro.org,
        johannes.goede@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH 1/3] media: qcom: camss: vfe-340: Proper client handling
Date: Thu, 19 Feb 2026 16:27:35 +0100
Message-Id: <20260219152737.728106-2-loic.poulain@oss.qualcomm.com>
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
X-Proofpoint-GUID: z9HWTf1MjaHuHgSefwFkMsjYjDHERXFw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDE0MCBTYWx0ZWRfX1LXRZ73xvY+c
 yJ94NdkxHyuy5rFQl7DfKyEZNILtglZosAmBku90opu/LPL9vwwVLetgbuL9/yrel3SVEdghOVt
 h6lXDM3v3en4bPKLTZXjVR0g8oT5H1uLO+OCQPer1VwDzYSD5iKW/jgzRqzpvbDbZnjW4sapJXo
 /w6WQETkXvKE06DR6gHuqVUCKh7usqbABf6rdgOURvljaee37rqLk6jYWrL8XiTdttCW9VDP/TD
 R+u9PUOasLKu59skq1AW8O8QpdnVFPb69kkjINxZdcmcCdXbaGj2uQ5BQwuyLkqjYHGa263RGjx
 qUZnv1ZDxbdSdXma1GzOca1V1+6/EzXpq0IIpWuFGGLmGVBDIwXcOCrGjRv0AhzFzoRk8P8vHtu
 2bb1+s1GasfFhzrIlbYbsQI58STGvl8PEtl/VsZ6nsNXtcuXheGExf5ahURQlEtLoR1R8hefYIJ
 3bC5OZWzGkgk3UjKrmQ==
X-Authority-Analysis: v=2.4 cv=cdrfb3DM c=1 sm=1 tr=0 ts=69972bf1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8 a=h8qAYbA_W9CmfXd5NcUA:9
 a=SNiEU36zzXyr6W74:21 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: z9HWTf1MjaHuHgSefwFkMsjYjDHERXFw
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53097-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DB8F8160241
X-Rspamd-Action: no action

We need to properly map camss WM index to our internal WM client
instance. Today we're only support RDI interfaces with the RDI_WM
macro, introduce a __wm_to_client helper to support any interface.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-vfe-340.c | 94 +++++++++++--------
 1 file changed, 53 insertions(+), 41 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-340.c b/drivers/media/platform/qcom/camss/camss-vfe-340.c
index 30d7630b3e8b..c6ea8b6216c2 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-340.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-340.c
@@ -69,24 +69,19 @@
 #define TFE_BUS_FRAMEDROP_CFG_0(c)			BUS_REG(0x238 + (c) * 0x100)
 #define TFE_BUS_FRAMEDROP_CFG_1(c)			BUS_REG(0x23c + (c) * 0x100)
 
-/*
- * TODO: differentiate the port id based on requested type of RDI, BHIST etc
- *
- * TFE write master IDs (clients)
- *
- * BAYER		0
- * IDEAL_RAW		1
- * STATS_TINTLESS_BG	2
- * STATS_BHIST		3
- * STATS_AWB_BG		4
- * STATS_AEC_BG		5
- * STATS_BAF		6
- * RDI0			7
- * RDI1			8
- * RDI2			9
- */
-#define RDI_WM(n)		(7 + (n))
-#define TFE_WM_NUM		10
+enum tfe_client {
+	TFE_CLI_BAYER,
+	TFE_CLI_IDEAL_RAW,
+	TFE_CLI_STATS_TINTLESS_BG,
+	TFE_CLI_STATS_BHIST,
+	TFE_CLI_STATS_AWB_BG,
+	TFE_CLI_STATS_AEC_BG,
+	TFE_CLI_STATS_BAF,
+	TFE_CLI_RDI0,
+	TFE_CLI_RDI1,
+	TFE_CLI_RDI2,
+	TFE_CLI_NUM
+};
 
 enum tfe_iface {
 	TFE_IFACE_PIX,
@@ -108,6 +103,13 @@ enum tfe_subgroups {
 	TFE_SUBGROUP_NUM
 };
 
+static enum tfe_iface tfe_line_iface_map[VFE_LINE_NUM_MAX] = {
+	[VFE_LINE_RDI0] = TFE_CLI_RDI0,
+	[VFE_LINE_RDI1] = TFE_CLI_RDI1,
+	[VFE_LINE_RDI2] = TFE_CLI_RDI2,
+	[VFE_LINE_PIX] = TFE_CLI_BAYER,
+};
+
 static enum tfe_iface tfe_line_iface_map[VFE_LINE_NUM_MAX] = {
 	[VFE_LINE_RDI0] = TFE_IFACE_RDI0,
 	[VFE_LINE_RDI1] = TFE_IFACE_RDI1,
@@ -126,6 +128,16 @@ static enum vfe_line_id tfe_subgroup_line_map[TFE_SUBGROUP_NUM] = {
 	[TFE_SUBGROUP_RDI2] = VFE_LINE_RDI2,
 };
 
+static inline enum tfe_client  __wm_to_client(u8 wm)
+{
+	if (wm >= ARRAY_SIZE(tfe_wm_client_map)) {
+		pr_warn("VFE: Invalid WM%u\n", wm);
+		return TFE_CLI_RDI0;
+	}
+
+	return tfe_wm_client_map[wm];
+}
+
 static inline enum tfe_iface  __line_to_iface(enum vfe_line_id line_id)
 {
 	if (line_id <= VFE_LINE_NONE || line_id >= VFE_LINE_NUM_MAX) {
@@ -209,10 +221,10 @@ static irqreturn_t vfe_isr(int irq, void *dev)
 	status = readl_relaxed(vfe->base + TFE_BUS_OVERFLOW_STATUS);
 	if (status) {
 		writel_relaxed(status, vfe->base + TFE_BUS_STATUS_CLEAR);
-		for (i = 0; i < TFE_WM_NUM; i++) {
+		for (i = 0; i < TFE_CLI_NUM; i++) {
 			if (status & BIT(i))
 				dev_err_ratelimited(vfe->camss->dev,
-						    "VFE%u: bus overflow for wm %u\n",
+						    "VFE%u: bus overflow for client %u\n",
 						    vfe->id, i);
 		}
 	}
@@ -235,49 +247,49 @@ static void vfe_enable_irq(struct vfe_device *vfe)
 	       TFE_BUS_IRQ_MASK_0_IMG_VIOL, vfe->base + TFE_BUS_IRQ_MASK_0);
 }
 
-static void vfe_wm_update(struct vfe_device *vfe, u8 rdi, u32 addr,
+static void vfe_wm_update(struct vfe_device *vfe, u8 wm, u32 addr,
 			  struct vfe_line *line)
 {
-	u8 wm = RDI_WM(rdi);
+	u8 client = __wm_to_client(wm);
 
-	writel_relaxed(addr, vfe->base + TFE_BUS_IMAGE_ADDR(wm));
+	writel_relaxed(addr, vfe->base + TFE_BUS_IMAGE_ADDR(client));
 }
 
-static void vfe_wm_start(struct vfe_device *vfe, u8 rdi, struct vfe_line *line)
+static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
 {
 	struct v4l2_pix_format_mplane *pix = &line->video_out.active_fmt.fmt.pix_mp;
 	u32 stride = pix->plane_fmt[0].bytesperline;
-	u8 wm = RDI_WM(rdi);
+	u8 client = __wm_to_client(wm);
 
 	/* Configuration for plain RDI frames */
-	writel_relaxed(TFE_BUS_IMAGE_CFG_0_DEFAULT, vfe->base + TFE_BUS_IMAGE_CFG_0(wm));
-	writel_relaxed(0u, vfe->base + TFE_BUS_IMAGE_CFG_1(wm));
-	writel_relaxed(TFE_BUS_IMAGE_CFG_2_DEFAULT, vfe->base + TFE_BUS_IMAGE_CFG_2(wm));
-	writel_relaxed(stride * pix->height, vfe->base + TFE_BUS_FRAME_INCR(wm));
-	writel_relaxed(TFE_BUS_PACKER_CFG_FMT_PLAIN64, vfe->base + TFE_BUS_PACKER_CFG(wm));
+	writel_relaxed(TFE_BUS_IMAGE_CFG_0_DEFAULT, vfe->base + TFE_BUS_IMAGE_CFG_0(client));
+	writel_relaxed(0u, vfe->base + TFE_BUS_IMAGE_CFG_1(client));
+	writel_relaxed(TFE_BUS_IMAGE_CFG_2_DEFAULT, vfe->base + TFE_BUS_IMAGE_CFG_2(client));
+	writel_relaxed(stride * pix->height, vfe->base + TFE_BUS_FRAME_INCR(client));
+	writel_relaxed(TFE_BUS_PACKER_CFG_FMT_PLAIN64, vfe->base + TFE_BUS_PACKER_CFG(client));
 
 	/* No dropped frames, one irq per frame */
-	writel_relaxed(0, vfe->base + TFE_BUS_FRAMEDROP_CFG_0(wm));
-	writel_relaxed(1, vfe->base + TFE_BUS_FRAMEDROP_CFG_1(wm));
-	writel_relaxed(0, vfe->base + TFE_BUS_IRQ_SUBSAMPLE_CFG_0(wm));
-	writel_relaxed(1, vfe->base + TFE_BUS_IRQ_SUBSAMPLE_CFG_1(wm));
+	writel_relaxed(0, vfe->base + TFE_BUS_FRAMEDROP_CFG_0(client));
+	writel_relaxed(1, vfe->base + TFE_BUS_FRAMEDROP_CFG_1(client));
+	writel_relaxed(0, vfe->base + TFE_BUS_IRQ_SUBSAMPLE_CFG_0(client));
+	writel_relaxed(1, vfe->base + TFE_BUS_IRQ_SUBSAMPLE_CFG_1(client));
 
 	vfe_enable_irq(vfe);
 
 	writel(TFE_BUS_CLIENT_CFG_EN | TFE_BUS_CLIENT_CFG_MODE_FRAME,
-	       vfe->base + TFE_BUS_CLIENT_CFG(wm));
+	       vfe->base + TFE_BUS_CLIENT_CFG(client));
 
-	dev_dbg(vfe->camss->dev, "VFE%u: Started RDI%u width %u height %u stride %u\n",
-		vfe->id, rdi, pix->width, pix->height, stride);
+	dev_dbg(vfe->camss->dev, "VFE%u: Started client %u width %u height %u stride %u\n",
+		vfe->id, client, pix->width, pix->height, client);
 }
 
-static void vfe_wm_stop(struct vfe_device *vfe, u8 rdi)
+static void vfe_wm_stop(struct vfe_device *vfe, u8 wm)
 {
-	u8 wm = RDI_WM(rdi);
+	u8 client = __wm_to_client(wm);
 
-	writel(0, vfe->base + TFE_BUS_CLIENT_CFG(wm));
+	writel(0, vfe->base + TFE_BUS_CLIENT_CFG(client));
 
-	dev_dbg(vfe->camss->dev, "VFE%u: Stopped RDI%u\n", vfe->id, rdi);
+	dev_dbg(vfe->camss->dev, "VFE%u: Stopped client %u\n", vfe->id, client);
 }
 
 static const struct camss_video_ops vfe_video_ops_520 = {
-- 
2.34.1


