Return-Path: <linux-media+bounces-63294-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0AknMbGoHWp+cwkAu9opvQ
	(envelope-from <linux-media+bounces-63294-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 17:43:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC671621F34
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 17:43:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8036D301C9C3
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 15:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B42C93DCD9C;
	Mon,  1 Jun 2026 15:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h4voZ2CN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OYUhBx+j"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98F33D9DDC
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 15:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780328545; cv=none; b=sLOB0/eUNB4MGCsqnILXWm1TKuZoq8OskZSAujqIfTTWiddxGZ2v8DOZePIXd6PdhMtKdeWNyzdzh+VxqVnONku36/MDjXfZUFloVBpwxxQA5HsE+DUVPn9UvinskHd8Z/tygUxx0q6mEalB2HJDcnGDWsnybaPKg7lA9OX4Uas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780328545; c=relaxed/simple;
	bh=WMJmbvG3UPc1IPdNbAwP4ZE5xHmhpJuEECJsEbdDars=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XGoRwaDWHVeLVrfGqpr5qzRbRW6F1j60+vYbDqg9Mgvg2APCzOGjz9s5VM1MUPCeEtQy/3LjEni0pw7ZOVf2zZ/V9MY913eNNhWxB6AKBtoDaDYCwuWnraKU78TMFMLSKJnmy1dhXjrHs6Ep0sOj7fswRbAhiMsa5ELfHKPErt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h4voZ2CN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OYUhBx+j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651Cc2FP599934
	for <linux-media@vger.kernel.org>; Mon, 1 Jun 2026 15:42:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xMgkxod0RTJbF2zXR11uV9q7aNgYn1Lh3BSSkMCGu64=; b=h4voZ2CN8t0XKxfi
	faArD9GiIdHdIJ4Gvu0bRaC2H3Tt1V1j7XBHYc82k9/4K5aed6gXAAbAKSquSM7K
	GgdmyKj69LpWq6JUm/Ycuyoa+S5WSrrzg3hkLiGREhDmr44v2M60LJyox93QZHhQ
	Ovh0tS/AOZRkpkOkHkuJ6apQ/5REogTq5F+n+P822X1F0FFgnaG40aeW/6rkWJFi
	wuL+qcHX7/rgpAg3ohBlgCnaKzTdXZ6JhxcAWhCsMH7Ha/ocu2miR0FwtEXslCWk
	xFghtv25m6wMHdXVOgi2EvCCMyl+iLdNanle+CypsSKcsy86xGUZCTmYMxHBxPXb
	sNKmfQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eha8r8tsu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 15:42:22 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-304b8d0ee63so7883940eec.0
        for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 08:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780328542; x=1780933342; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xMgkxod0RTJbF2zXR11uV9q7aNgYn1Lh3BSSkMCGu64=;
        b=OYUhBx+jb0n7LC7sAsxZ084HX1yesPr3kNZShRVCLAOUMz2/JuP71HoibXSLOQxO5U
         Y3ZfmwrP7v4pqehKTjUS6p87vJkMQ70x9EM5uyQZ0MwJyqdGggBRaXEJmWFlwXkKFera
         LbJPFskkVy8S103hatGSrYa2twVTz+q7SQT8gpLPA2nX95BMAlrrt0SQGi/NNlw9Qz2l
         fdJgbPGXiwBjTfUWoTBbbQDbdPq8vK/B/jZ17tqGK3jZNV6MGbd7oCoBx+gJgflbp6/w
         hNbVF3YQxGvist6oJ1rYZJg+Ea0SODQyfDDJMF8jC5fQqec+maKTtqK491/rr3RCARxu
         ymzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780328542; x=1780933342;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xMgkxod0RTJbF2zXR11uV9q7aNgYn1Lh3BSSkMCGu64=;
        b=Fry/jQaDo8nWf3jOywgrPzuxQpbNBxgSz0BYDiy8tyFBVDwd0CEUIFrYfPJD8Y1Rl+
         z8u6VKS/rJetd4RKM0eAEb67EaMXDc0tteBLWuNSHkxx+HM7TeMQ6UPyS5MaNAt0c6Sw
         oHn5lldtAHkGKfoFQ5vBsguhYD85ysYxvlkiZGTShh0Wczfrrt5kFDvEWPjeb1LRBV/L
         qzXW5OPf+psyjlFLysufkqNjIt0lLmlocoNx+F0EKODyj3sXfnEZLhXcewXUuLw04Bjs
         gmn49CPOd503fG1CTCJdz8AqKnj0dqvjQq06GXVz+9BlvAtltTJNrSiveozBKsCt/NLK
         xg+g==
X-Gm-Message-State: AOJu0Yzdx/UN3lZyXSsHsdv+0pWAj6wR4a4fcEMq8ulndlcckceSBy5/
	VTWaADcRUeT6PNqCwOATuDE1oS7ELXX42f6XgELGQPEooZKskD3yTVZ2jlvIzhhLUfn3ZQPmUmW
	VstYqEszRz972joXhcC98rlbcUKSsr542BRO0HfpM8BLfle93bLB8dsdyD2wHyCABDQ==
X-Gm-Gg: Acq92OF9uOBVFdhgW+tPfYuAhzrmnpssK7BpA21SsFpbuC91tTL513iBizWlqb7vWtd
	fqa/FHU3UXRAyBHqYcUVYBrf6ry6jDNVOcr38U9Ha1Ag2txT8bf4AWp7LJvrbYhd+4oaH4jjL8Y
	NghwLM3VaOSao6WZDmGTLSRUKntk6ejZaikz4TQMB/Qlz+BaVH+99FZH3w0WGvJ/Lo2uPrtc6B7
	nGnMOfN4iZ0mfeyNyZEo97IolZamvzv6QpN1d2G9HA7ry3gyo+hQ/F5Qkvah4ePYtVE1DIrO1J3
	BPO9HrRFmnfo6DWp/pwC5JwPOtO4/VYvIrPvCNz2o9lH4u/ouzL921xhu8zcY/mGKwW/ZmQY4rc
	PN7c+Zk/wNgRvY9yrn0rl4KyHrHztKAejAiwk82Iaa57HezxoUc1WvT73wOMiiTMGcrvpGI9Roo
	vIIdSijiU1KjQ=
X-Received: by 2002:a05:693c:2c86:b0:2ed:935:aa33 with SMTP id 5a478bee46e88-304fa49cf07mr5189476eec.5.1780328541538;
        Mon, 01 Jun 2026 08:42:21 -0700 (PDT)
X-Received: by 2002:a05:693c:2c86:b0:2ed:935:aa33 with SMTP id 5a478bee46e88-304fa49cf07mr5189443eec.5.1780328540860;
        Mon, 01 Jun 2026 08:42:20 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed53f002sm9430371eec.18.2026.06.01.08.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 08:42:20 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 08:42:16 -0700
Subject: [PATCH v4 3/5] media: qcom: camss: csiphy: Add support for v2.3.0
 two-phase CSIPHY
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-add-support-for-camss-on-sm8750-v4-3-1eb6f432cfd1@oss.qualcomm.com>
References: <20260601-add-support-for-camss-on-sm8750-v4-0-1eb6f432cfd1@oss.qualcomm.com>
In-Reply-To: <20260601-add-support-for-camss-on-sm8750-v4-0-1eb6f432cfd1@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=aKnAb79m c=1 sm=1 tr=0 ts=6a1da85e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UiSUrLz6K6kVaq6zp58A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: 658d_CiWEfEbkzp8rLCj-BW2fl-M3ypL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE1NyBTYWx0ZWRfXyCGc9Ye8vD+K
 VeMMpbIvTA4DPrERA2RVSkzHVM5InnB+JVFRb/gk015HIrXB4ChuRMAVMh+BzskmyU/IMxTp01k
 g+jbYGT9G5z3MKaqPA9p3Gcl/NXX/Zxvp2CJyi+YivQKIYe3kQB5UnW/pM3deplHS96VY0jNy+U
 koiZCv/APGoyHhKMfCyloVG7fkMDUjn4HWKxF8KUlHpsAyC2mAIZVXb00s8xkL/RLQaGgcK0qbA
 J6Myv/IeEshpHI8dZZNStV5GGeLcESDnRu9idFSMGRzhL0+CHP0YyBBJW2J8kOmSfTwIhn4vMlC
 XX3xaud/Zqg6aTxw41V+mpXf9N5/nSOmF+FECWOjjnzPFvJdUS5kx/BlFNYU3phCB/+G1YH4okW
 Vrwkgz23ZDoD5CGb0jqsRkpfjUqVzmQi4YPVwjTk5I03EIOkJp74p/tVQepHqlMs1GH88TxIgNX
 E2t6z+7GcKwv6cdL4tA==
X-Proofpoint-ORIG-GUID: 658d_CiWEfEbkzp8rLCj-BW2fl-M3ypL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010157
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63294-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hangxiang.ma@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BC671621F34
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add more detailed resource information for CSIPHY devices in the camss
driver along with the support for v2.3.0 in the 2 phase CSIPHY driver
that is responsible for the PHY lane register configuration, module
reset and interrupt handling.

Additionally, generalize the struct name for the lane configuration that
had been added for Kaanapali and use it for SM8750 as well as they share
the settings.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |   5 +-
 drivers/media/platform/qcom/camss/camss.c          | 125 +++++++++++++++++++++
 2 files changed, 129 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index a219fbf0ce3d..bb0290a4bb2d 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -804,7 +804,7 @@ csiphy_lane_regs lane_regs_sm8650[] = {
 	{0x0c10, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
 };
 
-/* 3nm 2PH v 2.4.0 2p5Gbps 4 lane DPHY mode */
+/* 3nm 2PH v 2.3.0/2.4.0 2p5Gbps 4 lane DPHY mode */
 static const struct
 csiphy_lane_regs lane_regs_2_4_0[] = {
 	/* LN 0 */
@@ -1256,6 +1256,7 @@ static bool csiphy_is_gen2(u32 version)
 	case CAMSS_845:
 	case CAMSS_8550:
 	case CAMSS_8650:
+	case CAMSS_8750:
 	case CAMSS_8775P:
 	case CAMSS_KAANAPALI:
 	case CAMSS_X1E80100:
@@ -1377,7 +1378,9 @@ static int csiphy_init(struct csiphy_device *csiphy)
 		regs->lane_regs = &lane_regs_sa8775p[0];
 		regs->lane_array_size = ARRAY_SIZE(lane_regs_sa8775p);
 		break;
+	case CAMSS_8750:
 	case CAMSS_KAANAPALI:
+		/* CSPHY v2.4.0 is backward compatible with v2.3.0 settings */
 		regs->lane_regs = &lane_regs_2_4_0[0];
 		regs->lane_array_size = ARRAY_SIZE(lane_regs_2_4_0);
 		regs->offset = 0x1000;
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 834f6c1a2519..d68d5debe6d6 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4533,6 +4533,129 @@ static const struct resources_icc icc_res_sa8775p[] = {
 	},
 };
 
+static const struct camss_subdev_resources csiphy_res_8750[] = {
+	/* CSIPHY0 */
+	{
+		.regulators = {
+			{ .supply = "vdd-csiphy0-0p9", .init_load_uA = 148000 },
+			{ .supply = "vdd-csiphy0-1p2", .init_load_uA = 14660 }
+		},
+		.clock = { "csiphy0", "csiphy0_timer",
+			   "cpas_ahb", "cpas_fast_ahb" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csiphy0" },
+		.interrupt = { "csiphy0" },
+		.csiphy = {
+			.id = 0,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY1 */
+	{
+		.regulators = {
+			{ .supply = "vdd-csiphy1-0p9", .init_load_uA = 148000 },
+			{ .supply = "vdd-csiphy1-1p2", .init_load_uA = 14660 }
+		},
+		.clock = { "csiphy1", "csiphy1_timer",
+			   "cpas_ahb", "cpas_fast_ahb" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csiphy1" },
+		.interrupt = { "csiphy1" },
+		.csiphy = {
+			.id = 1,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY2 */
+	{
+		.regulators = {
+			{ .supply = "vdd-csiphy2-0p9", .init_load_uA = 148000 },
+			{ .supply = "vdd-csiphy2-1p2", .init_load_uA = 14660 }
+		},
+		.clock = { "csiphy2", "csiphy2_timer",
+			   "cpas_ahb", "cpas_fast_ahb" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csiphy2" },
+		.interrupt = { "csiphy2" },
+		.csiphy = {
+			.id = 2,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY3 */
+	{
+		.regulators = {
+			{ .supply = "vdd-csiphy3-0p9", .init_load_uA = 148000 },
+			{ .supply = "vdd-csiphy3-1p2", .init_load_uA = 14660 }
+		},
+		.clock = { "csiphy3", "csiphy3_timer",
+			   "cpas_ahb", "cpas_fast_ahb" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csiphy3" },
+		.interrupt = { "csiphy3" },
+		.csiphy = {
+			.id = 3,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY4 */
+	{
+		.regulators = {
+			{ .supply = "vdd-csiphy4-0p9", .init_load_uA = 148000 },
+			{ .supply = "vdd-csiphy4-1p2", .init_load_uA = 14660 }
+		},
+		.clock = { "csiphy4", "csiphy4_timer",
+			   "cpas_ahb", "cpas_fast_ahb" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csiphy4" },
+		.interrupt = { "csiphy4" },
+		.csiphy = {
+			.id = 4,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY5 */
+	{
+		.regulators = {
+			{ .supply = "vdd-csiphy5-0p9", .init_load_uA = 148000 },
+			{ .supply = "vdd-csiphy5-1p2", .init_load_uA = 14660 }
+		},
+		.clock = { "csiphy5", "csiphy5_timer",
+			   "cpas_ahb", "cpas_fast_ahb" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csiphy5" },
+		.interrupt = { "csiphy5" },
+		.csiphy = {
+			.id = 5,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+};
+
 static const struct resources_icc icc_res_sm8750[] = {
 	{
 		.name = "ahb",
@@ -6099,7 +6222,9 @@ static const struct camss_resources sm8650_resources = {
 static const struct camss_resources sm8750_resources = {
 	.version = CAMSS_8750,
 	.pd_name = "top",
+	.csiphy_res = csiphy_res_8750,
 	.icc_res = icc_res_sm8750,
+	.csiphy_num = ARRAY_SIZE(csiphy_res_8750),
 	.icc_path_num = ARRAY_SIZE(icc_res_sm8750),
 };
 

-- 
2.34.1


