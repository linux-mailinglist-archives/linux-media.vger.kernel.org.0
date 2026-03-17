Return-Path: <linux-media+bounces-56033-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BAaO+wouWkAtAEAu9opvQ
	(envelope-from <linux-media+bounces-56033-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 11:11:56 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 534532A7A07
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 11:11:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D86C30CFE89
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 10:06:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E8D63A63E4;
	Tue, 17 Mar 2026 10:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ehZ09NiQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XS4+DlSB"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04CA3A5E6E
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 10:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773741972; cv=none; b=JKeN99Y+Zox1cDXZZJABZ50XCEdz9GWg1mWYJJfJqSIFHRceI3V38kawqjKr6SMJRQe0lbXH2gZNr3vcsMjS6fmUennZDvzRy+BIYF2vKLvojMmD7c54EYmZ9bqIGHksXGKaCm9YKl+JWbTX6p1qm3rSbBDm+d+rEZ4cCisjMkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773741972; c=relaxed/simple;
	bh=I0ecq1STikLraCQb155YIuV1t+JFsngrrzfAKTkbhz4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cMP7y21vsXUWaTHt+QtsBPVq9HyOeovUGCwa3rqQTB/bRLVvJot45UkQtIjsO4xxu9xprOKPKQSLDN1OjDbGy+wxuQPl5MI5ldqq9GnK20Snse0Vuv0wPoiqE9W9gveHh1ZlKyYz4T1Rhyat56Nao2JbD94YmEntmv3S3LFzFYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ehZ09NiQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XS4+DlSB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H89Idr3295188
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 10:06:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oYWrpozo6WX+xoPZB8Q6oxC4VHt2IErWR9xWnUjGoGg=; b=ehZ09NiQ3/u5oKIN
	78b2rD+VrILlduzxVqY+FKM5mhNEsk5gXFGbgs72dTnMcI7U532rr0qDFKaFQEXc
	NlhCROFuRo2xj4kGXeO/bDHx6bieWsVxcggG0Os6qoCqpxPdMcA/5qb/qBYnRe0X
	nArhy5YbRIJwXRb9RfaKvBVzoMvRTIAXt5pxs8EIqp71wiMiN3ApKuFL13au7bp1
	LGQ/9fpt5uufKp/iqqtitkmW0+qK98LdLVJlQhu3p9iSRLTH4BRXuw0RXNkEs0DZ
	I7JKvO+z54GcQ9o2lPxQCuiHUnn9wQ6VTCvVvh4l9jkDcsmboHfzx2RkexMwvPmI
	q146jA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxkuy3h3p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 10:06:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd827a356aso346359285a.3
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 03:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773741966; x=1774346766; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oYWrpozo6WX+xoPZB8Q6oxC4VHt2IErWR9xWnUjGoGg=;
        b=XS4+DlSB05GyDhkqtWXhPKQu+ueCaxL21xodreWEdG7uC2MFGcC7KqbB9DFllpvmo+
         bwPJ3BUy817ix55hlh94ZzSTYoXDLkbZF22LDVabhVPHXhckE7+oo3xCYBBZFgqyRZQT
         Jjd19QHBOjzI35rA5mGw7H6AKSJ3cVBHTS+23a2XBdeN1mR+yS59BnYuL1xyO9exnTZt
         IEZYD1tds3odKvZxbSZKODqHRwHHPJMw6wwhi0UosG4jpngj2iD7n+QStHj0hYOHz3ht
         3S2oY1M4SassYqVYDSqhM7Jf4LQ8E5MdszQkicbe1b4zwHdOXhD43MfM0DgX6pF2kAsN
         h0ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773741966; x=1774346766;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oYWrpozo6WX+xoPZB8Q6oxC4VHt2IErWR9xWnUjGoGg=;
        b=bYUKfb2xGWMVQFUtieboAzoPTHnZiz79DeZSUapoUbtkw3egRSRtC5owGI3a1xPhXc
         fg+wQsc3KofemyTp1B6fBgYvD8SbD7pnrtnG/Zx31cDg0URpQCt+rwvlCds7gLFbMvD5
         SH2DyfllgRUzwL4eReV3ncTiT5zNnq0o4UuB8mbmPpYgTUDWg5clgGtsXAaGt60mqhSw
         T98MRz/MpZVCW8KTOdLoEVWoSIE1f2tz8GjqKpKH0ORGVkmaXD9cIKk/uZV8Ig/GqsMU
         n2LJW2oIHcokny/E1R6y/63Xj1z0vjaQLtG2phLbNWUw1GL+ZlPp4tFNBSlsYpdmDegh
         7okw==
X-Forwarded-Encrypted: i=1; AJvYcCVOZGwgp5R5D6t9gXtVhPVmtA9FnYMYFzjo/YJsXDWrqy4CQ/lcg96hWQRrjDbRTlOcEOnlWMvX1yEhGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPfpQUCLYuU1NLG2ih23/xNUuzZDyWwNVsI3NPFokmhRgIvE0Y
	xgtO2WpsR8kXhKmQLsPqOqIVXnoYZf90RG5p9q4jTRBgc8i6kegp1ZAMzVnGJeTg1Xe6kyykowk
	zQVvRFnX606Re248+PR0ZXZ1bHu6RwhT8L8d3NuIzqumfnD8BDHgaZl11B9mqb9aj7g==
X-Gm-Gg: ATEYQzzTNQ5xxtb0Z7QUbh+DLCDGDn7cc89qKO8w3ismSkIkPB2mwZIE4VgFvF7yVoK
	caMramJXpq/vgpHNv83dM2yN4liHpZwoPh91nQQ9AjWxxapd5wCnzgvOlDtajwMYsEvdlzy3uy9
	DO3pja/GGcYQpFV2yqzYjffpUHp6WwaRTut3RR1oI9hsQ/zYmPiowQRTomzArurtz9OieEpO1Nq
	58whjz6nWX59wbfhpflNL9YtvEL+9UbHVLmhEYQ+VuEOIDZEqCrYJCIyn8ixwmC71nXxgLr6H1j
	xuMM7RkVFcINYp92KJ9Qp/i7DCOYURl6oWhnLtqt06adgHfXM+cpoifbAdIqDlbbwyWa9zELjJv
	7swgMSeGMYbUZp5WkakA9J0U4gMhKbn0W8+vfT79bPcf4kjcD9n5n6qQLyghxFhfynaXu1pO9Nf
	rAvEPA6cMRFP53
X-Received: by 2002:a05:620a:2802:b0:8cb:2b30:1c82 with SMTP id af79cd13be357-8cdb5a9175fmr2034780885a.36.1773741965719;
        Tue, 17 Mar 2026 03:06:05 -0700 (PDT)
X-Received: by 2002:a05:620a:2802:b0:8cb:2b30:1c82 with SMTP id af79cd13be357-8cdb5a9175fmr2034776685a.36.1773741965231;
        Tue, 17 Mar 2026 03:06:05 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cda1fd9d38sm1375129285a.17.2026.03.17.03.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 03:06:04 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 18:05:46 +0800
Subject: [PATCH v10 2/3] media: qcom: camss: Add link support for TPG
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-camss_tpg-v10-2-b4cfa85c2e1b@oss.qualcomm.com>
References: <20260317-camss_tpg-v10-0-b4cfa85c2e1b@oss.qualcomm.com>
In-Reply-To: <20260317-camss_tpg-v10-0-b4cfa85c2e1b@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773741952; l=8236;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=I0ecq1STikLraCQb155YIuV1t+JFsngrrzfAKTkbhz4=;
 b=JV7wlmETCU8Ses9ukyhfPTDshgVBMgnqQcI5EdJUso3t6QAf9VjwnlwQp2qs6nUSHjA+CMLLC
 VwRixHVyMLtBf3LFdogP2z7sl/O3HzVHxeF+Lu6wsF3oYC/IStNXVSk
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=br1BxUai c=1 sm=1 tr=0 ts=69b9278e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=4PHYSIZUFMs0VUPmZFwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA4OSBTYWx0ZWRfX2mJqNd2mmbaQ
 P3Brlmxt33NhUkD3GxLN7kNR9K7XLwZKeLj/hbuOp68uGLxzQ7gehdpWA5CvAGXBH1mLtajsTFw
 LF21f55aq+dwAxCx+ay1yE1/wr7cwnPzAyO4JWBIooxPWXAFEugGZnsd29hnGa8oTAxJ31FK37I
 2s9lOiB4ULTJgYhyD4VcDldDn7IDC7ZA9GkPZ0dQrjfqu15/Hw9JHwX7302eWLQPFUxDSEpXdWY
 duXbXZZc5Y0T+yogoEuJAGyrR8w4RYjOcmJLGaUxuhl7SdWABUHT4CeZkPLXMkmJNUBva6IrkZ7
 qVEg8quR0ITzI0o2ELk6+QTdZ6oFRIqS/w3vTNS6/t5UtXMljl1EaGaLFPWLFzIsV2oGc9IBZI9
 IBNpAK5KIHzIGJ9064dFX6bK7s1TY5loS0D7f6G8FgnYiHnP8xi5jaXbhI7qb48lZyPHU56JtcT
 4feGeyMbvQv2ucOeM3g==
X-Proofpoint-ORIG-GUID: 8VFpeN6WGx1b0ubUd55hnRQskwZvTTp_
X-Proofpoint-GUID: 8VFpeN6WGx1b0ubUd55hnRQskwZvTTp_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170089
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-56033-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 534532A7A07
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

TPG is connected to the csid as an entity, the link
needs to be adapted.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid.c   | 45 +++++++++++++------
 drivers/media/platform/qcom/camss/camss-csid.h   |  1 +
 drivers/media/platform/qcom/camss/camss-csiphy.c |  1 +
 drivers/media/platform/qcom/camss/camss-csiphy.h |  2 +
 drivers/media/platform/qcom/camss/camss.c        | 55 ++++++++++++++++++++++++
 5 files changed, 90 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index ed1820488c9878df91c173cd4ff0209dfa1e3a8c..48459b46a981bc7504cdde7d6f39fcc4a1e273de 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -35,6 +35,8 @@
 #define		HW_VERSION_REVISION	16
 #define		HW_VERSION_GENERATION	28
 
+#define LANE_CFG_BITWIDTH 4
+
 #define MSM_CSID_NAME "msm_csid"
 
 const char * const csid_testgen_modes[] = {
@@ -1215,18 +1217,22 @@ void msm_csid_get_csid_id(struct media_entity *entity, u8 *id)
 }
 
 /*
- * csid_get_lane_assign - Calculate CSI2 lane assign configuration parameter
- * @lane_cfg - CSI2 lane configuration
+ * csid_get_lane_assign - Calculate lane assign by csiphy/tpg lane num
+ * @lane_cfg: CSI2 lane configuration
+ * @num_lanes: lane num
  *
  * Return lane assign
  */
-static u32 csid_get_lane_assign(struct csiphy_lanes_cfg *lane_cfg)
+static u32 csid_get_lane_assign(struct csiphy_lanes_cfg *lane_cfg, int num_lanes)
 {
 	u32 lane_assign = 0;
+	int pos;
 	int i;
 
-	for (i = 0; i < lane_cfg->num_data; i++)
-		lane_assign |= lane_cfg->data[i].pos << (i * 4);
+	for (i = 0; i < num_lanes; i++) {
+		pos = lane_cfg ? lane_cfg->data[i].pos : i;
+		lane_assign |= pos << (i * LANE_CFG_BITWIDTH);
+	}
 
 	return lane_assign;
 }
@@ -1251,6 +1257,7 @@ static int csid_link_setup(struct media_entity *entity,
 	if ((local->flags & MEDIA_PAD_FL_SINK) &&
 	    (flags & MEDIA_LNK_FL_ENABLED)) {
 		struct v4l2_subdev *sd;
+		struct tpg_device *tpg;
 		struct csid_device *csid;
 		struct csiphy_device *csiphy;
 		struct csiphy_lanes_cfg *lane_cfg;
@@ -1265,18 +1272,28 @@ static int csid_link_setup(struct media_entity *entity,
 			return -EBUSY;
 
 		sd = media_entity_to_v4l2_subdev(remote->entity);
-		csiphy = v4l2_get_subdevdata(sd);
+		if (sd->grp_id == TPG_GRP_ID) {
+			tpg = v4l2_get_subdevdata(sd);
 
-		/* If a sensor is not linked to CSIPHY */
-		/* do no allow a link from CSIPHY to CSID */
-		if (!csiphy->cfg.csi2)
-			return -EPERM;
+			csid->phy.lane_cnt = tpg->res->lane_cnt;
+			csid->phy.csiphy_id = tpg->id;
+			csid->phy.lane_assign = csid_get_lane_assign(NULL, csid->phy.lane_cnt);
+			csid->tpg_linked = true;
+		} else {
+			csiphy = v4l2_get_subdevdata(sd);
 
-		csid->phy.csiphy_id = csiphy->id;
+			/* If a sensor is not linked to CSIPHY */
+			/* do no allow a link from CSIPHY to CSID */
+			if (!csiphy->cfg.csi2)
+				return -EPERM;
 
-		lane_cfg = &csiphy->cfg.csi2->lane_cfg;
-		csid->phy.lane_cnt = lane_cfg->num_data;
-		csid->phy.lane_assign = csid_get_lane_assign(lane_cfg);
+			csid->phy.csiphy_id = csiphy->id;
+
+			lane_cfg = &csiphy->cfg.csi2->lane_cfg;
+			csid->phy.lane_cnt = lane_cfg->num_data;
+			csid->phy.lane_assign = csid_get_lane_assign(lane_cfg, lane_cfg->num_data);
+			csid->tpg_linked = false;
+		}
 	}
 	/* Decide which virtual channels to enable based on which source pads are enabled */
 	if (local->flags & MEDIA_PAD_FL_SOURCE) {
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index aedc96ed84b2fcc3f352160dcfd31554a671d0fc..5296b10f6bac839a3faa1039bdbf0fbbbe9456ac 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -161,6 +161,7 @@ struct csid_device {
 	int num_supplies;
 	struct completion reset_complete;
 	struct csid_testgen_config testgen;
+	bool tpg_linked;
 	struct csid_phy_config phy;
 	struct v4l2_mbus_framefmt fmt[MSM_CSID_PADS_NUM];
 	struct v4l2_ctrl_handler ctrls;
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index 62623393f414494d7d0095aa0efe5673382ec962..69fba36d10ef5d00d0d8e1ae0f5b3646c066d81c 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -789,6 +789,7 @@ int msm_csiphy_register_entity(struct csiphy_device *csiphy,
 	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	snprintf(sd->name, ARRAY_SIZE(sd->name), "%s%d",
 		 MSM_CSIPHY_NAME, csiphy->id);
+	sd->grp_id = CSIPHY_GRP_ID;
 	v4l2_set_subdevdata(sd, csiphy);
 
 	ret = csiphy_init_formats(sd, NULL);
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
index 2d5054819df7f9069611bcdf287846b1d20afc92..9d9657b82f748d02bf6be6139480cfbd0c5001c9 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.h
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -21,6 +21,8 @@
 #define MSM_CSIPHY_PAD_SRC 1
 #define MSM_CSIPHY_PADS_NUM 2
 
+#define CSIPHY_GRP_ID 1
+
 struct csiphy_lane {
 	u8 pos;
 	u8 pol;
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 00b87fd9afbd89871ffaee9cb2b2db6538e1d70d..1de35bcd8e5fc6eaa9dab537960520b2c07dd830 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4501,6 +4501,19 @@ static int camss_init_subdevices(struct camss *camss)
 		}
 	}
 
+	if (camss->tpg) {
+		for (i = 0; i < camss->res->tpg_num; i++) {
+			ret = msm_tpg_subdev_init(camss, &camss->tpg[i],
+						  &res->tpg_res[i], i);
+			if (ret < 0) {
+				dev_err(camss->dev,
+					"Failed to init tpg%d sub-device: %d\n",
+					i, ret);
+				return ret;
+			}
+		}
+	}
+
 	/* note: SM8250 requires VFE to be initialized before CSID */
 	for (i = 0; i < camss->res->vfe_num; i++) {
 		ret = msm_vfe_subdev_init(camss, &camss->vfe[i],
@@ -4589,6 +4602,23 @@ static int camss_link_entities(struct camss *camss)
 		}
 	}
 
+	for (i = 0; i < camss->res->tpg_num; i++) {
+		for (j = 0; j < camss->res->csid_num; j++) {
+			ret = media_create_pad_link(&camss->tpg[i].subdev.entity,
+						    MSM_TPG_PAD_SRC,
+						    &camss->csid[j].subdev.entity,
+						    MSM_CSID_PAD_SINK,
+						    0);
+			if (ret < 0) {
+				camss_link_err(camss,
+					       camss->tpg[i].subdev.entity.name,
+					       camss->csid[j].subdev.entity.name,
+					       ret);
+				return ret;
+			}
+		}
+	}
+
 	if (camss->ispif) {
 		for (i = 0; i < camss->res->csid_num; i++) {
 			for (j = 0; j < camss->ispif->line_num; j++) {
@@ -4693,6 +4723,19 @@ static int camss_register_entities(struct camss *camss)
 		}
 	}
 
+	if (camss->tpg) {
+		for (i = 0; i < camss->res->tpg_num; i++) {
+			ret = msm_tpg_register_entity(&camss->tpg[i],
+						      &camss->v4l2_dev);
+			if (ret < 0) {
+				dev_err(camss->dev,
+					"Failed to register tpg%d entity: %d\n",
+					i, ret);
+				goto err_reg_tpg;
+			}
+		}
+	}
+
 	for (i = 0; i < camss->res->csid_num; i++) {
 		ret = msm_csid_register_entity(&camss->csid[i],
 					       &camss->v4l2_dev);
@@ -4736,6 +4779,13 @@ static int camss_register_entities(struct camss *camss)
 	for (i--; i >= 0; i--)
 		msm_csid_unregister_entity(&camss->csid[i]);
 
+	i = camss->res->tpg_num;
+err_reg_tpg:
+	if (camss->tpg) {
+		for (i--; i >= 0; i--)
+			msm_tpg_unregister_entity(&camss->tpg[i]);
+	}
+
 	i = camss->res->csiphy_num;
 err_reg_csiphy:
 	for (i--; i >= 0; i--)
@@ -4757,6 +4807,11 @@ static void camss_unregister_entities(struct camss *camss)
 	for (i = 0; i < camss->res->csiphy_num; i++)
 		msm_csiphy_unregister_entity(&camss->csiphy[i]);
 
+	if (camss->tpg) {
+		for (i = 0; i < camss->res->tpg_num; i++)
+			msm_tpg_unregister_entity(&camss->tpg[i]);
+	}
+
 	for (i = 0; i < camss->res->csid_num; i++)
 		msm_csid_unregister_entity(&camss->csid[i]);
 

-- 
2.34.1


