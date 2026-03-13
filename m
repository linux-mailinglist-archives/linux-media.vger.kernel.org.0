Return-Path: <linux-media+bounces-55573-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCt6DJCxs2lYZwAAu9opvQ
	(envelope-from <linux-media+bounces-55573-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 07:41:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBB127E3E7
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 07:41:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A81AC3092C99
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 06:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AE91370D68;
	Fri, 13 Mar 2026 06:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kdk8Iq+/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NFDjNut+"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C8C36D9E7
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 06:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773382542; cv=none; b=l4jQFgTArciqgGijll+FdpJY01eIPHyVDtfUuhZ9crEkEyjvry5lXPakbXvy+mXu11QUtwujFbVgaDYtzrqwEW09INYh9lZDgIgy9H6cKA8Z82sua9RKpMK3RZdH3O2jAQd/P0hkXyxNDpRbylRojgng+HTTVlXepdGzri9U5GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773382542; c=relaxed/simple;
	bh=Uuk3nG9vfMEKVYDbuxvwjKzt4Bppq0hLE03g972naTI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hkcTBKifNTY89yQWAQIoHJ3OE3LQbJbrc9HAe6rf0BshHN4ELKatSatU+18gpQZUQOgzoc7UCOFb1h3r6Buu2/0WkbyObtwT4pikOO3QFjsFEiltWJEqObbTS5/nu+hM3L1gtGCffbseZzmWNEuETAjPD0HE+eH68hbB7onuxb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kdk8Iq+/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NFDjNut+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tfdI3844283
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 06:15:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dtHu6Oj1rGaXB92TijyUhPKlGODG6KCekqa+xt6blG0=; b=kdk8Iq+/Mj4Y/R2j
	Ip3+MMFwRUPFLvJfPKV7XkzZEqqRPbEGJdH6T0vJ2/2CUvRAvcN6lniiL1hD/jaC
	EiHUhPrGgmZpazs4lB3NoROBz6IBgK5rNac847o2LGO7QdQdsZ8UQmw0o4JZeSuZ
	46A7mt+RFw4BApaqmmCWGNPtGzquAkCN7akbnxBXI1znBDwHiHpiUcb9aAfYntUQ
	P7N2tNxaIKET3PfH5Sv520xgRzLal6xLl0i1BpgwNZb2TGYNpR0yLSuUzK8T4/y2
	ceg3kkwtU3NjecnWhCutlW8hecRzrGsKaB0JawpZIC8c+PZwopN3gwGZcBYIxTBc
	G+B60w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh54vpr2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 06:15:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd80bea54dso1079319085a.3
        for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 23:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773382538; x=1773987338; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dtHu6Oj1rGaXB92TijyUhPKlGODG6KCekqa+xt6blG0=;
        b=NFDjNut+0IulRbqhw8gmAL9xSq69Tm4kWAf9UHm68Eq7gNVRPKYz32B/qgBHmFqGta
         FjNajaeRqifxzQRVIjl5GYe8rLinfbBq1CtPCOQlutfAVg3AjoqvpdpEuA0cJ0Wypm7F
         PgNdxwuOWR1uD0ty8IxIxDjrNRKbSxpLHvKvGE2LEuHahXH8M9sS55wKl4tsiVfYrB6Y
         wqmVcDlU8AiPV84EsD64KKdaGuqt+b11ZCo/SZ97ic/IMvUIzCN0lFe9xJ2Dw9mX1sy+
         KKpcMaTAPE+Lgk4Y9sS9JlK0tu8Q4+zC1URS7SqIfmBtd3rUzdMgrqtZ59iTIENih7k6
         HY1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773382538; x=1773987338;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dtHu6Oj1rGaXB92TijyUhPKlGODG6KCekqa+xt6blG0=;
        b=hDH6Su+Isn03Sfnve3CHZ9JDEdSpFVzcjyc7JrsxFNzeGsbEuYqARpLfxq/tHflYC5
         9ESVS9xg8aF0XFTuyN8fpZCCOX1XKp47PKImwVjxpo5FBpgSAAIOoAQAajb/kI72iLC2
         GUO/NPmji7TqQ5lcqvWJTyVr3021+h/HaoY+YIGTqZnUAk9UZWgdWdtO8C6iJx78LmK3
         yKp3dXsEEq+XfmXbcPUAFw/PJLjIDYzEa5ShrjxVZ7P+GJEqDNiHVV2uKnOFQmKzo7OJ
         S3ftgxaeM43a1WjFqFgEJ8mVL4sT+0G93NjhUO8KtxosLxWR4S9liYMwP2JFgmD1VbEu
         04Ag==
X-Forwarded-Encrypted: i=1; AJvYcCUmq5GNfa23T8PtRDKS3ALnVyxi5/KU76GLNUQ0fX7agvk8v2kI8golaUQrc0JQ2F64Rv3yZv2onOJnuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiqSp0xnVnztZdF9okYnPkKKwvY/XtK6Exn4kn+T+wfKPDZggR
	5bFohUfxMEVbr5HHchEos4zd+8toqICm2z+U+M/fgP2DzKY4xE1Qs9Ph1xxywrHiGF3xpfQeRoM
	Wcc3f8oMZdsLgQqITDFXrTnrHRvwr1+c8P7vA7vznmpzF2EJUJctaP0eX7ItdXia91g==
X-Gm-Gg: ATEYQzwhYpy2VxfYjw0w7IGjq38m1R90bFDgWXo9PjYh2CMaopkmQS9Xcx2kXm3dP5Q
	7Zqjw8BhiPtmGF0/eHc3683W436J9yaz6InEec3mq/hzLPNHUJjGTKhhDb6iMxJPLaQlT7g/BvK
	fCSWW5oU3GLPRhEaLW5uKacLrkk5xabmmHkhKNX+9jLHSfWI52Qn874zYkfh0PWY1AhZ/UuSP6h
	7HPUGvVhVCFRvsSktn4m1IRAsXS7FKfN1ZiwtzK9O4UF3HouOr+axGmGOn7Mm+6VbHV4g2Q8Qaz
	vABJy5pHba2mhtuQwtV58bdFdECDGdN17cvu/M9XWd250adY3/i2F21+mdBnSoXmk+X0L5+fScu
	+qCJaAho1NHVUQPuxMtsKygd+K/FEsicLNGw0D7vGhKBWJuWRz2DXVCCh2btp2c3Tqs1+tVnmrm
	+hJP+9ihoJ2c0d
X-Received: by 2002:a05:620a:414e:b0:8c9:f9c1:5ed with SMTP id af79cd13be357-8cdb5b7b2cdmr301376385a.63.1773382538046;
        Thu, 12 Mar 2026 23:15:38 -0700 (PDT)
X-Received: by 2002:a05:620a:414e:b0:8c9:f9c1:5ed with SMTP id af79cd13be357-8cdb5b7b2cdmr301374485a.63.1773382537579;
        Thu, 12 Mar 2026 23:15:37 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cda1fc09e4sm502265185a.3.2026.03.12.23.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 23:15:37 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 14:15:06 +0800
Subject: [PATCH v9 3/3] media: qcom: camss: tpg: Add TPG support for
 multiple targets
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-camss_tpg-v9-3-b9095de6525b@oss.qualcomm.com>
References: <20260313-camss_tpg-v9-0-b9095de6525b@oss.qualcomm.com>
In-Reply-To: <20260313-camss_tpg-v9-0-b9095de6525b@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773382521; l=18289;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=Uuk3nG9vfMEKVYDbuxvwjKzt4Bppq0hLE03g972naTI=;
 b=DWmSJW+yhlVEsErfVQpWateK73zTXS2L1MqPASKh/cgwRnAzisDS3guyoR4L9cnZA0xfhGXBh
 /JQCCk3Y0YFCMn/gkhs5VB+5uA8NvFo34O3tX/3Py3g+LTQoJdiDbDo
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: F901VCztkP-ZQ6L5j4zr-zTdoeoi1trk
X-Authority-Analysis: v=2.4 cv=BNG+bVQG c=1 sm=1 tr=0 ts=69b3ab8a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=2NXLIIr8FHgYEdIXSdsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: F901VCztkP-ZQ6L5j4zr-zTdoeoi1trk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA0OCBTYWx0ZWRfX0mBlhKmdO7aT
 aQHF48GQB5jqrUouQ6gRf58l5SPx6mWN/7e3+Dx4tNo4I8x5+uylcsZL6Al4I9MtHtIToCpaN3X
 hoT9po2YM+MYGkcyHkM9xsBvBjMCyXp9W6Yn11AXtdKp1NKqhQfhVmzrWds97f+247qjo6x68YQ
 AyMk4Als/37eY5IcFYThdGVqr6cUte0ZNB7UTz4Of4pK9G+qWN6dedd2v6lsyC6uQJ+mJlgAbKW
 Pnx7WrOCRMFjyIKoI8NZBpcRbIq1RuWS829OEbBuekGAz2wuhaJNLP58hGazZ+/yUSy947WTFwT
 wNr+X0x/LartYDI/Ok00bRQh4vEFF5s6CIDkAIUnuO8eKqf8IYlb2ft/TwgKHwENS25bNReu5UA
 OCSLObOo4h8OXY+GBcHmc2pbPEtDEqbaWbG1p+ZyqjbplvQsaq8ihcxSPJ9oL/dG/LCl7fYA1sk
 jdcL6hdgTOHItVa1pbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_03,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130048
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-55573-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6DBB127E3E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for TPG found on LeMans, Monaco, Hamoa.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/Makefile         |   1 +
 drivers/media/platform/qcom/camss/camss-csid-680.c |  14 +-
 .../media/platform/qcom/camss/camss-csid-gen3.c    |  14 +-
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 231 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.c          | 117 ++++++++++-
 5 files changed, 371 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index d747aa7db3c12ad27d986e0b2b85a44870f89ad3..27898b3cc7d3c8f275567f81f0952e2a0e18f189 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -16,6 +16,7 @@ qcom-camss-objs += \
 		camss-format.o \
 		camss-ispif.o \
 		camss-tpg.o \
+		camss-tpg-gen1.o \
 		camss-vfe.o \
 		camss-vfe-4-1.o \
 		camss-vfe-4-7.o \
diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/drivers/media/platform/qcom/camss/camss-csid-680.c
index 3ad3a174bcfb8c0d319930d0010df92308cb5ae4..2e4547455d229227ba7cc339a13271fb28e103a5 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-680.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
@@ -103,6 +103,8 @@
 #define		CSI2_RX_CFG0_PHY_NUM_SEL			20
 #define		CSI2_RX_CFG0_PHY_SEL_BASE_IDX			1
 #define		CSI2_RX_CFG0_PHY_TYPE_SEL			24
+#define		CSI2_RX_CFG0_TPG_MUX_EN				BIT(27)
+#define		CSI2_RX_CFG0_TPG_MUX_SEL			GENMASK(29, 28)
 
 #define CSID_CSI2_RX_CFG1					0x204
 #define		CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN		BIT(0)
@@ -185,10 +187,20 @@ static void __csid_configure_rx(struct csid_device *csid,
 				struct csid_phy_config *phy, int vc)
 {
 	u32 val;
+	struct camss *camss;
 
+	camss = csid->camss;
 	val = (phy->lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
 	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
-	val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX) << CSI2_RX_CFG0_PHY_NUM_SEL;
+
+	if (camss->tpg && csid->tpg_linked &&
+	    camss->tpg[phy->csiphy_id].testgen.mode != TPG_PAYLOAD_MODE_DISABLED) {
+		val |= FIELD_PREP(CSI2_RX_CFG0_TPG_MUX_SEL, phy->csiphy_id + 1);
+		val |= CSI2_RX_CFG0_TPG_MUX_EN;
+	} else {
+		val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX)
+			<< CSI2_RX_CFG0_PHY_NUM_SEL;
+	}
 
 	writel(val, csid->base + CSID_CSI2_RX_CFG0);
 
diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
index 664245cf6eb0cac662b02f8b920cd1c72db0aeb2..40d79d94068d1ee1c2dfe1c6a01f3c692144e473 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
@@ -66,6 +66,8 @@
 #define		CSI2_RX_CFG0_VC_MODE		3
 #define		CSI2_RX_CFG0_DL0_INPUT_SEL	4
 #define		CSI2_RX_CFG0_PHY_NUM_SEL	20
+#define		CSI2_RX_CFG0_TPG_MUX_EN		BIT(27)
+#define		CSI2_RX_CFG0_TPG_MUX_SEL	GENMASK(29, 28)
 
 #define CSID_CSI2_RX_CFG1		0x204
 #define		CSI2_RX_CFG1_ECC_CORRECTION_EN	BIT(0)
@@ -109,10 +111,20 @@ static void __csid_configure_rx(struct csid_device *csid,
 				struct csid_phy_config *phy, int vc)
 {
 	int val;
+	struct camss *camss;
 
+	camss = csid->camss;
 	val = (phy->lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
 	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
-	val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX) << CSI2_RX_CFG0_PHY_NUM_SEL;
+
+	if (camss->tpg && csid->tpg_linked &&
+	    camss->tpg[phy->csiphy_id].testgen.mode != TPG_PAYLOAD_MODE_DISABLED) {
+		val |= FIELD_PREP(CSI2_RX_CFG0_TPG_MUX_SEL, phy->csiphy_id + 1);
+		val |= CSI2_RX_CFG0_TPG_MUX_EN;
+	} else {
+		val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX)
+			<< CSI2_RX_CFG0_PHY_NUM_SEL;
+	}
 
 	writel(val, csid->base + CSID_CSI2_RX_CFG0);
 
diff --git a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
new file mode 100644
index 0000000000000000000000000000000000000000..4cffa5e4d7058d7c895c97a0b4e808ace4b0bf79
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
@@ -0,0 +1,231 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *
+ * Qualcomm MSM Camera Subsystem - TPG (Test Pattern Generator) Module
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+#include <linux/io.h>
+#include <linux/kernel.h>
+
+#include "camss-tpg.h"
+#include "camss.h"
+
+/* TPG global registers */
+#define TPG_HW_VERSION		0x0
+# define HW_VERSION_STEPPING		GENMASK(15, 0)
+# define HW_VERSION_REVISION		GENMASK(27, 16)
+# define HW_VERSION_GENERATION		GENMASK(31, 28)
+
+#define TPG_HW_VER(gen, rev, step) \
+	(((u32)(gen) << 28) | ((u32)(rev) << 16) | (u32)(step))
+
+#define TPG_HW_VER_2_0_0                TPG_HW_VER(2, 0, 0)
+#define TPG_HW_VER_2_1_0                TPG_HW_VER(2, 1, 0)
+
+#define TPG_HW_STATUS		0x4
+
+#define TPG_CTRL		0x64
+# define TPG_CTRL_TEST_EN		BIT(0)
+# define TPG_CTRL_PHY_SEL		BIT(3)
+# define TPG_CTRL_NUM_ACTIVE_LANES	GENMASK(5, 4)
+# define TPG_CTRL_VC_DT_PATTERN_ID	GENMASK(8, 6)
+# define TPG_CTRL_OVERLAP_SHDR_EN	BIT(10)
+# define TPG_CTRL_NUM_ACTIVE_VC		GENMASK(31, 30)
+
+#define TPG_CLEAR		0x1F4
+
+/* TPG VC-based registers */
+#define TPG_VC_n_GAIN_CFG(n)		(0x60 + (n) * 0x60)
+
+#define TPG_VC_n_CFG0(n)	(0x68 + (n) * 0x60)
+# define TPG_VC_n_CFG0_VC_NUM			GENMASK(4, 0)
+# define TPG_VC_n_CFG0_NUM_ACTIVE_DT		GENMASK(9, 8)
+# define TPG_VC_n_CFG0_NUM_BATCH		GENMASK(15, 12)
+# define TPG_VC_n_CFG0_NUM_FRAMES		GENMASK(31, 16)
+
+#define TPG_VC_n_LSFR_SEED(n)	(0x6C + (n) * 0x60)
+#define TPG_VC_n_HBI_CFG(n)	(0x70 + (n) * 0x60)
+#define TPG_VC_n_VBI_CFG(n)	(0x74 + (n) * 0x60)
+
+#define TPG_VC_n_COLOR_BARS_CFG(n)		(0x78 + (n) * 0x60)
+# define TPG_VC_n_COLOR_BARS_CFG_PIX_PATTERN		GENMASK(2, 0)
+# define TPG_VC_n_COLOR_BARS_CFG_QCFA_EN		BIT(3)
+# define TPG_VC_n_COLOR_BARS_CFG_SPLIT_EN		BIT(4)
+# define TPG_VC_n_COLOR_BARS_CFG_NOISE_EN		BIT(5)
+# define TPG_VC_n_COLOR_BARS_CFG_ROTATE_PERIOD		GENMASK(13, 8)
+# define TPG_VC_n_COLOR_BARS_CFG_XCFA_EN		BIT(16)
+# define TPG_VC_n_COLOR_BARS_CFG_SIZE_X			GENMASK(26, 24)
+# define TPG_VC_n_COLOR_BARS_CFG_SIZE_Y			GENMASK(30, 28)
+
+/* TPG DT-based registers */
+#define TPG_VC_m_DT_n_CFG_0(m, n)		(0x7C + (m) * 0x60 + (n) * 0xC)
+# define TPG_VC_m_DT_n_CFG_0_FRAME_HEIGHT	GENMASK(15, 0)
+# define TPG_VC_m_DT_n_CFG_0_FRAME_WIDTH	GENMASK(31, 16)
+
+#define TPG_VC_m_DT_n_CFG_1(m, n)		(0x80 + (m) * 0x60 + (n) * 0xC)
+# define TPG_VC_m_DT_n_CFG_1_DATA_TYPE		GENMASK(5, 0)
+# define TPG_VC_m_DT_n_CFG_1_ECC_XOR_MASK	GENMASK(13, 8)
+# define TPG_VC_m_DT_n_CFG_1_CRC_XOR_MASK	GENMASK(31, 16)
+
+#define TPG_VC_m_DT_n_CFG_2(m, n)		(0x84 + (m) * 0x60 + (n) * 0xC)
+# define TPG_VC_m_DT_n_CFG_2_PAYLOAD_MODE		GENMASK(3, 0)
+/* v2.0.0: USER[19:4], ENC[23:20] */
+# define TPG_V2_0_0_VC_m_DT_n_CFG_2_USER_SPECIFIED_PAYLOAD		GENMASK(19, 4)
+# define TPG_V2_0_0_VC_m_DT_n_CFG_2_ENCODE_FORMAT			GENMASK(23, 20)
+/* v2.1.0: USER[27:4], ENC[31:28] */
+# define TPG_V2_1_0_VC_m_DT_n_CFG_2_USER_SPECIFIED_PAYLOAD	GENMASK(27, 4)
+# define TPG_V2_1_0_VC_m_DT_n_CFG_2_ENCODE_FORMAT			GENMASK(31, 28)
+
+#define TPG_HBI_PCT_DEFAULT			545	/* 545% */
+#define TPG_VBI_PCT_DEFAULT			10	/* 10% */
+#define PERCENT_BASE				100
+
+/* Default user-specified payload for TPG test generator.
+ * Keep consistent with CSID TPG default: 0xBE.
+ */
+#define TPG_USER_SPECIFIED_PAYLOAD_DEFAULT	0xBE
+#define TPG_LFSR_SEED_DEFAULT			0x12345678
+#define TPG_COLOR_BARS_CFG_STANDARD \
+	FIELD_PREP(TPG_VC_n_COLOR_BARS_CFG_ROTATE_PERIOD, 0xA)
+
+static const char * const testgen_payload_modes[] = {
+	[TPG_PAYLOAD_MODE_DISABLED]		= "Disabled",
+	[TPG_PAYLOAD_MODE_INCREMENTING]		= "Incrementing",
+	[TPG_PAYLOAD_MODE_ALTERNATING_55_AA]	= "Alternating 0x55/0xAA",
+	[TPG_PAYLOAD_MODE_RANDOM]		= "Pseudo-random Data",
+	[TPG_PAYLOAD_MODE_USER_SPECIFIED]	= "User Specified",
+	[TPG_PAYLOAD_MODE_COLOR_BARS]		= "Color bars",
+};
+
+static int tpg_stream_on(struct tpg_device *tpg)
+{
+	struct tpg_testgen_config *tg = &tpg->testgen;
+	struct v4l2_mbus_framefmt *input_format;
+	const struct tpg_format_info *format;
+	u8 payload_mode = (tg->mode > TPG_PAYLOAD_MODE_DISABLED) ?
+			   tg->mode - 1 : 0;
+	u8 lane_cnt = tpg->res->lane_cnt;
+	u8 vc, dt, last_vc = 0;
+	u32 val;
+
+	for (vc = 0; vc <= MSM_TPG_ACTIVE_VC; vc++) {
+		last_vc = vc;
+
+		input_format = &tpg->fmt;
+		format = tpg_get_fmt_entry(tpg->res->formats->formats,
+					   tpg->res->formats->nformats,
+					   input_format->code);
+		if (IS_ERR(format))
+			return -EINVAL;
+
+		/* VC configuration */
+		val = FIELD_PREP(TPG_VC_n_CFG0_NUM_ACTIVE_DT, MSM_TPG_ACTIVE_DT) |
+		      FIELD_PREP(TPG_VC_n_CFG0_NUM_FRAMES, 0);
+		writel(val, tpg->base + TPG_VC_n_CFG0(vc));
+
+		writel(TPG_LFSR_SEED_DEFAULT, tpg->base + TPG_VC_n_LSFR_SEED(vc));
+
+		val = DIV_ROUND_UP(input_format->width * format->bpp * TPG_HBI_PCT_DEFAULT,
+				   BITS_PER_BYTE * lane_cnt * PERCENT_BASE);
+		writel(val, tpg->base + TPG_VC_n_HBI_CFG(vc));
+
+		val = input_format->height * TPG_VBI_PCT_DEFAULT / PERCENT_BASE;
+		writel(val, tpg->base + TPG_VC_n_VBI_CFG(vc));
+
+		writel(TPG_COLOR_BARS_CFG_STANDARD, tpg->base + TPG_VC_n_COLOR_BARS_CFG(vc));
+
+		/* DT configuration */
+		for (dt = 0; dt <= MSM_TPG_ACTIVE_DT; dt++) {
+			val = FIELD_PREP(TPG_VC_m_DT_n_CFG_0_FRAME_HEIGHT,
+					 input_format->height & 0xffff) |
+			      FIELD_PREP(TPG_VC_m_DT_n_CFG_0_FRAME_WIDTH,
+					 input_format->width & 0xffff);
+			writel(val, tpg->base + TPG_VC_m_DT_n_CFG_0(vc, dt));
+
+			val = FIELD_PREP(TPG_VC_m_DT_n_CFG_1_DATA_TYPE, format->data_type);
+			writel(val, tpg->base + TPG_VC_m_DT_n_CFG_1(vc, dt));
+
+			if (tpg->hw_version == TPG_HW_VER_2_0_0) {
+				val = FIELD_PREP(TPG_VC_m_DT_n_CFG_2_PAYLOAD_MODE, payload_mode) |
+				      FIELD_PREP(TPG_V2_0_0_VC_m_DT_n_CFG_2_USER_SPECIFIED_PAYLOAD,
+						 TPG_USER_SPECIFIED_PAYLOAD_DEFAULT) |
+				      FIELD_PREP(TPG_V2_0_0_VC_m_DT_n_CFG_2_ENCODE_FORMAT,
+						 format->encode_format);
+			} else if (tpg->hw_version >= TPG_HW_VER_2_1_0) {
+				val = FIELD_PREP(TPG_VC_m_DT_n_CFG_2_PAYLOAD_MODE, payload_mode) |
+				      FIELD_PREP(TPG_V2_1_0_VC_m_DT_n_CFG_2_USER_SPECIFIED_PAYLOAD,
+						 TPG_USER_SPECIFIED_PAYLOAD_DEFAULT) |
+				      FIELD_PREP(TPG_V2_1_0_VC_m_DT_n_CFG_2_ENCODE_FORMAT,
+						 format->encode_format);
+			}
+			writel(val, tpg->base + TPG_VC_m_DT_n_CFG_2(vc, dt));
+		}
+	}
+
+	/* Global TPG control */
+	val = FIELD_PREP(TPG_CTRL_TEST_EN, 1) |
+	      FIELD_PREP(TPG_CTRL_NUM_ACTIVE_LANES, lane_cnt - 1) |
+	      FIELD_PREP(TPG_CTRL_NUM_ACTIVE_VC, last_vc);
+	writel(val, tpg->base + TPG_CTRL);
+
+	return 0;
+}
+
+static int tpg_reset(struct tpg_device *tpg)
+{
+	writel(0, tpg->base + TPG_CTRL);
+	writel(1, tpg->base + TPG_CLEAR);
+
+	return 0;
+}
+
+static void tpg_stream_off(struct tpg_device *tpg)
+{
+	tpg_reset(tpg);
+}
+
+static int tpg_configure_stream(struct tpg_device *tpg, u8 enable)
+{
+	if (enable)
+		return tpg_stream_on(tpg);
+
+	tpg_stream_off(tpg);
+
+	return 0;
+}
+
+static int tpg_configure_testgen_pattern(struct tpg_device *tpg, s32 val)
+{
+	if (val >= 0 && val <= TPG_PAYLOAD_MODE_COLOR_BARS)
+		tpg->testgen.mode = val;
+
+	return 0;
+}
+
+static u32 tpg_hw_version(struct tpg_device *tpg)
+{
+	u32 hw_version = readl(tpg->base + TPG_HW_VERSION);
+
+	tpg->hw_version = hw_version;
+	dev_dbg(tpg->camss->dev, "tpg HW Version = %u.%u.%u\n",
+		 (u32)FIELD_GET(HW_VERSION_GENERATION, hw_version),
+		 (u32)FIELD_GET(HW_VERSION_REVISION, hw_version),
+		 (u32)FIELD_GET(HW_VERSION_STEPPING, hw_version));
+
+	return hw_version;
+}
+
+static void tpg_subdev_init(struct tpg_device *tpg)
+{
+	tpg->testgen.modes = testgen_payload_modes;
+	tpg->testgen.nmodes = TPG_PAYLOAD_MODE_NUM_SUPPORTED_GEN1;
+}
+
+const struct tpg_hw_ops tpg_ops_gen1 = {
+	.configure_stream = tpg_configure_stream,
+	.configure_testgen_pattern = tpg_configure_testgen_pattern,
+	.hw_version = tpg_hw_version,
+	.reset = tpg_reset,
+	.subdev_init = tpg_subdev_init,
+};
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 1de35bcd8e5fc6eaa9dab537960520b2c07dd830..bb4efeae55ceea2a6e0109b64decd3be11dd26d5 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3559,6 +3559,54 @@ static const struct camss_subdev_resources csiphy_res_8775p[] = {
 	},
 };
 
+static const struct camss_subdev_resources tpg_res_8775p[] = {
+	/* TPG0 */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "csiphy_rx" },
+		.clock_rate = {
+			{ 0 },
+			{ 400000000 },
+		},
+		.reg = { "tpg0" },
+		.tpg = {
+			.lane_cnt = 4,
+			.formats = &tpg_formats_gen1,
+			.hw_ops = &tpg_ops_gen1
+		}
+	},
+	/* TPG1 */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "csiphy_rx" },
+		.clock_rate = {
+			{ 0 },
+			{ 400000000 },
+		},
+		.reg = { "tpg1" },
+		.tpg = {
+			.lane_cnt = 4,
+			.formats = &tpg_formats_gen1,
+			.hw_ops = &tpg_ops_gen1
+		}
+	},
+	/* TPG2 */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "csiphy_rx" },
+		.clock_rate = {
+			{ 0 },
+			{ 400000000 },
+		},
+		.reg = { "tpg2" },
+		.tpg = {
+			.lane_cnt = 4,
+			.formats = &tpg_formats_gen1,
+			.hw_ops = &tpg_ops_gen1
+		}
+	},
+};
+
 static const struct camss_subdev_resources csid_res_8775p[] = {
 	/* CSID0 */
 	{
@@ -3963,6 +4011,54 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	},
 };
 
+static const struct camss_subdev_resources tpg_res_x1e80100[] = {
+	/* TPG0 */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "csid_csiphy_rx" },
+		.clock_rate = {
+			{ 0 },
+			{ 400000000 },
+		},
+		.reg = { "csitpg0" },
+		.tpg = {
+			.lane_cnt = 4,
+			.formats = &tpg_formats_gen1,
+			.hw_ops = &tpg_ops_gen1
+		}
+	},
+	/* TPG1 */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "csid_csiphy_rx" },
+		.clock_rate = {
+			{ 0 },
+			{ 400000000 },
+		},
+		.reg = { "csitpg1" },
+		.tpg = {
+			.lane_cnt = 4,
+			.formats = &tpg_formats_gen1,
+			.hw_ops = &tpg_ops_gen1
+		}
+	},
+	/* TPG2 */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "csid_csiphy_rx" },
+		.clock_rate = {
+			{ 0 },
+			{ 400000000 },
+		},
+		.reg = { "csitpg2" },
+		.tpg = {
+			.lane_cnt = 4,
+			.formats = &tpg_formats_gen1,
+			.hw_ops = &tpg_ops_gen1
+		}
+	},
+};
+
 static const struct camss_subdev_resources csid_res_x1e80100[] = {
 	/* CSID0 */
 	{
@@ -4076,7 +4172,7 @@ static const struct camss_subdev_resources vfe_res_x1e80100[] = {
 		.clock = {"camnoc_rt_axi", "camnoc_nrt_axi", "cpas_ahb",
 			  "cpas_fast_ahb", "cpas_vfe0", "vfe0_fast_ahb",
 			  "vfe0" },
-		.clock_rate = { { 0 },
+		.clock_rate = { { 400000000 },
 				{ 0 },
 				{ 0 },
 				{ 0 },
@@ -4100,7 +4196,7 @@ static const struct camss_subdev_resources vfe_res_x1e80100[] = {
 		.clock = { "camnoc_rt_axi", "camnoc_nrt_axi", "cpas_ahb",
 			   "cpas_fast_ahb", "cpas_vfe1", "vfe1_fast_ahb",
 			   "vfe1"  },
-		.clock_rate = { { 0 },
+		.clock_rate = { { 400000000 },
 				{ 0 },
 				{ 0 },
 				{ 0 },
@@ -4124,7 +4220,7 @@ static const struct camss_subdev_resources vfe_res_x1e80100[] = {
 		.clock = { "camnoc_rt_axi", "camnoc_nrt_axi", "cpas_ahb",
 			   "vfe_lite_ahb", "cpas_vfe_lite", "vfe_lite",
 			   "vfe_lite_csid" },
-		.clock_rate = { { 0 },
+		.clock_rate = { { 400000000 },
 				{ 0 },
 				{ 0 },
 				{ 0 },
@@ -4147,7 +4243,7 @@ static const struct camss_subdev_resources vfe_res_x1e80100[] = {
 		.clock = { "camnoc_rt_axi", "camnoc_nrt_axi", "cpas_ahb",
 			   "vfe_lite_ahb", "cpas_vfe_lite", "vfe_lite",
 			   "vfe_lite_csid" },
-		.clock_rate = { { 0 },
+		.clock_rate = { { 400000000 },
 				{ 0 },
 				{ 0 },
 				{ 0 },
@@ -5030,6 +5126,13 @@ static int camss_probe(struct platform_device *pdev)
 	if (!camss->csiphy)
 		return -ENOMEM;
 
+	if (camss->res->tpg_num > 0) {
+		camss->tpg = devm_kcalloc(dev, camss->res->tpg_num,
+					  sizeof(*camss->tpg), GFP_KERNEL);
+		if (!camss->tpg)
+			return -ENOMEM;
+	}
+
 	camss->csid = devm_kcalloc(dev, camss->res->csid_num, sizeof(*camss->csid),
 				   GFP_KERNEL);
 	if (!camss->csid)
@@ -5219,11 +5322,13 @@ static const struct camss_resources qcs8300_resources = {
 	.version = CAMSS_8300,
 	.pd_name = "top",
 	.csiphy_res = csiphy_res_8300,
+	.tpg_res = tpg_res_8775p,
 	.csid_res = csid_res_8775p,
 	.csid_wrapper_res = &csid_wrapper_res_sm8550,
 	.vfe_res = vfe_res_8775p,
 	.icc_res = icc_res_qcs8300,
 	.csiphy_num = ARRAY_SIZE(csiphy_res_8300),
+	.tpg_num = ARRAY_SIZE(tpg_res_8775p),
 	.csid_num = ARRAY_SIZE(csid_res_8775p),
 	.vfe_num = ARRAY_SIZE(vfe_res_8775p),
 	.icc_path_num = ARRAY_SIZE(icc_res_qcs8300),
@@ -5233,11 +5338,13 @@ static const struct camss_resources sa8775p_resources = {
 	.version = CAMSS_8775P,
 	.pd_name = "top",
 	.csiphy_res = csiphy_res_8775p,
+	.tpg_res = tpg_res_8775p,
 	.csid_res = csid_res_8775p,
 	.csid_wrapper_res = &csid_wrapper_res_sm8550,
 	.vfe_res = vfe_res_8775p,
 	.icc_res = icc_res_sa8775p,
 	.csiphy_num = ARRAY_SIZE(csiphy_res_8775p),
+	.tpg_num = ARRAY_SIZE(tpg_res_8775p),
 	.csid_num = ARRAY_SIZE(csid_res_8775p),
 	.vfe_num = ARRAY_SIZE(vfe_res_8775p),
 	.icc_path_num = ARRAY_SIZE(icc_res_sa8775p),
@@ -5360,12 +5467,14 @@ static const struct camss_resources x1e80100_resources = {
 	.version = CAMSS_X1E80100,
 	.pd_name = "top",
 	.csiphy_res = csiphy_res_x1e80100,
+	.tpg_res = tpg_res_x1e80100,
 	.csid_res = csid_res_x1e80100,
 	.vfe_res = vfe_res_x1e80100,
 	.csid_wrapper_res = &csid_wrapper_res_x1e80100,
 	.icc_res = icc_res_x1e80100,
 	.icc_path_num = ARRAY_SIZE(icc_res_x1e80100),
 	.csiphy_num = ARRAY_SIZE(csiphy_res_x1e80100),
+	.tpg_num = ARRAY_SIZE(tpg_res_x1e80100),
 	.csid_num = ARRAY_SIZE(csid_res_x1e80100),
 	.vfe_num = ARRAY_SIZE(vfe_res_x1e80100),
 };

-- 
2.34.1


