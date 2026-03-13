Return-Path: <linux-media+bounces-55632-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePs0Fnrcs2mzbgAAu9opvQ
	(envelope-from <linux-media+bounces-55632-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 10:44:26 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC61F280B09
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 10:44:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D97931E8DEC
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 09:42:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3AFB383C74;
	Fri, 13 Mar 2026 09:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U/lAngTI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y2wCnFzc"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C41829B77C
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 09:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773394955; cv=none; b=vFAUWGrnUezk2mcn6yIrJzPuaIscVDB4s1PjVjlenbXWKNEF6gmgOfVG7i3MZQhNTaOyB8EWKoIjhlYrheQ4rtf2SSTzEuiWWcFKgrNQ9Ra2JVKydZr4zENu3w2DGMr3P9sYXE1P5EebLPp8NEMr2zFyHla3IANPHyUK25DLGM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773394955; c=relaxed/simple;
	bh=8C+Bfl5w+ESq4aJnG7TTnkk5YDJVGnCoPOSKfHiEKKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t//Si2Rt9sLLIRmzA6BsWlJCHJiE6cG6MDbrygOmKTIhjS7Ip8Z6xeGC+SAbH5ZnFHao+I6W6Lu2Vk8+dT7vy+4XTOYgg5WXE4uPvfPkDKLbf/y7Hgd53TNWDzXwrUmZ7QDTkCilFfcrkV0cBpjtXQe/D78i8+134fTYW/p+a80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U/lAngTI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y2wCnFzc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D8vCDx481530
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 09:42:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jt5AGeXSm57vPQPDFY6A5jMUvS2MQ9bHne5IvcZiYRQ=; b=U/lAngTIuCb/DWWD
	PiNY4rDJVKALjKH2IPVJDFppjsSdWitsOEu6xLAqaKIyEiP1mIsjNjUP5i1L9XyM
	7TLsBDzo2UG2BQ2QBFVAlER1vsQcyHUFagLpPl8Y3dRuhe+1uJg2Mimg0/WSPc1B
	kcf0W1nn1h7zACGnVRk0ir4jB906zvOOtXv2XzPcmO3SpEy9ZqEWfnyqWPUPIpR+
	FuHHNUTVM0lcyO6QbHGQsmBJnih+VpuLhVJ+BOj6Y0ct5gGZTXyqYehSwL48UfQ+
	qWPqnn+jDKcE+i6vPEikyZpQWQqDXTcA5GPhFnmnmsLAHVEmeOlX5cPDmFS0rtaX
	uXXJIw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvfh7r5sc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 09:42:33 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89a116bf0f8so109686566d6.0
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 02:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773394952; x=1773999752; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jt5AGeXSm57vPQPDFY6A5jMUvS2MQ9bHne5IvcZiYRQ=;
        b=Y2wCnFzcb5W0F3gvUSSc0DAmEWob37JO43FTFejbW5Ymjr4AGDCubqgg2PriaGDoGv
         eNdtVCZ2jq1rF9R/4ZtB6YGJbeOX98h4WwCz/zRJw1P8h0Eeco+E8/1Bs/nrD3Cs+W7z
         OlS3AnqT/MbFvk3Nmx50s4+jGrz9UY0Btx/0xRHY7OaCP3bvVuxUI1hUg7wJ+YsZZf6S
         zEE474zY7J3FjClEqZs5fsvIDNYAuwDVU/mNpyrBOVq+XZGQbQGwjNqraCRipsk6aC7m
         lyp/pw0RA4GNFFx8d0hBWBo853NZpF+qGoUxjetVpiFdfAr9Z2AAEoU5cankUN7aaigB
         4KPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773394952; x=1773999752;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Jt5AGeXSm57vPQPDFY6A5jMUvS2MQ9bHne5IvcZiYRQ=;
        b=tRwFyl0gUbEsVLBQ6al0upnhhYa2CSfB0w1dD9yUd27C6RGxeiKzl7HaAmniUbA89L
         JMFh/Z39wZKx/z3JYbfChZ6WXwdk+KPpXr9bf1Za1mAv4YuaUb7FLfov7+prejEKeVnf
         Y5uStqX7nvXgw9lT4y0mXNvnbrhDvf/LSVtN0dPCM9uWKkYM05aV1AtCXbV+DObRBquA
         NlR4FdsFPpYy6pOtF902qg25MFcSUkh+Dqq46qNlJ1uhC5RmVlzkCBmlmFdOBhe9BwEu
         9/ZROPoIt1A50IfT98BSrIbyfDjG+nam2Yoc8nAxSy6QsbH6MB8iqiNyh351eeUEibf3
         tgcw==
X-Gm-Message-State: AOJu0YxAbOxlkE9FPWSJdm6odk2Fpagg9JH8zAgtT9I4+p5ZA4BdlYDe
	mcV1Dzm2Dt3vLn+7KzYp3fgl3JfAYiyCCHZ4jfPtxaOiZRYSHLost+Wb4p8XVaRCTA024tvNWK1
	XQ6HrAcSuwZYCGDl5uIjZ7wDOrq5/1V86udob4nGmqqAldT236S+O+RhH8Md2cXgFMeL6smQS8g
	==
X-Gm-Gg: ATEYQzx9Q6OjUiQtOGQbgou6uXbSfyT5NZ5XDNcgp1QnIFBbYrBJ/4J+YuyoHk2slj9
	AuhtqEXNmnf2cU3Xjd9kc4TyEHmjnXveFm9NRiLIjFMi19CLLkk9RuLhdBy4f0WmOf9aQRVvRvU
	uCNLshhXgjJNWMHCyBZXU2U7Rh9MHkd+UPa0/mgWDc4qOV8JcLmKHoZAMiWV+4ZTq3EOtsaxgA2
	WzS/eQxcIls4UJ6EMHWEivpf+utLGlfs+dtUkuRapePOsXyaEo0UQG4F6DJL19QQTBmuwJdbtvr
	4pzaZKWaQD1owUiAi0qfoG1vHRMDsecxng4fOtryhTgbQz3lnKrHwZnVmuetue6Fv2mc79TyZAG
	WkcdYhVMUUYSO4uillElGKMbM6hgMFf2Uu2FiJKOuNke1nkUnwdwHJRkxCt5JhgNTH7j3wqiodz
	6vBZcMu4wM87sw
X-Received: by 2002:a05:6214:19c8:b0:899:ff66:8152 with SMTP id 6a1803df08f44-89a81ea6211mr41110276d6.39.1773394952198;
        Fri, 13 Mar 2026 02:42:32 -0700 (PDT)
X-Received: by 2002:a05:6214:19c8:b0:899:ff66:8152 with SMTP id 6a1803df08f44-89a81ea6211mr41110016d6.39.1773394951760;
        Fri, 13 Mar 2026 02:42:31 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a65d0a7b6sm54663656d6.44.2026.03.13.02.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 02:42:31 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 17:42:14 +0800
Subject: [PATCH 1/2] media: qcom: camss: Fix csid clock configuration and
 IRQ offset for 8775p
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-vfelite_fix-v1-1-2ee7de00dee7@oss.qualcomm.com>
References: <20260313-vfelite_fix-v1-0-2ee7de00dee7@oss.qualcomm.com>
In-Reply-To: <20260313-vfelite_fix-v1-0-2ee7de00dee7@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vikram Sharma <quic_vikramsa@quicinc.com>,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Wenmeng Liu <quic_wenmliu@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773394942; l=4548;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=8C+Bfl5w+ESq4aJnG7TTnkk5YDJVGnCoPOSKfHiEKKk=;
 b=2hshOiChSGIgowfhQXkX79N7NUDWsDYFzPEJc4yBZvZTiJ8kERNOfjwYpyXFXUQ9sHl8Ty8MC
 SyZqWlCrVxRCbPLAZvd654I2QMJcDrSWuK+ULgkiSB2Sks3praYlc+2
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: ntpqe2Ot9DLCT3v2S4d1nk-4GTcwSGyh
X-Proofpoint-GUID: ntpqe2Ot9DLCT3v2S4d1nk-4GTcwSGyh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA3NSBTYWx0ZWRfX1wvZnvRCG1VR
 a8r+DPsK5oBQxska9SI4MIHUzub0O9iYkx0POTwCTgdIonStBCjdSZkL1rTJdGPtl4XxoeBH847
 kmK9FAksYTVx/EUG+xe3In5VgZz0hjdgzR+hI6VbtSVJv2g5T+dSOZTafNM3Ju1Q8G+4nXcVC2e
 4w4GzwhBKJsxAfjaVrxZ9TYrhPuiRYsLDliRSdQWoUowJrrLEP1BRtYRU04e49R45LK34KiAqnw
 sNY322aoIEgeRYXhVYNZyAslMeaY1jnWDSQhPjfAA+IFpyyx5GeDnkkJ+IrK8lD32tAoOJ+gl0X
 SwvMf8zumSNIbiyGxTasYfHs7SNs+HBHN0jAtUVyc+QbxMxROFxeZzHuJxTpWQqCVZUqC+LaRgI
 c22nFNDMMb/KrntmUVuIPH6bnFnIyeq2fTtMtph29G4SWd0j5GDOKM9AxilUoV/QDfdWmbcWiw5
 SoAoSy93zduvJiFoA3w==
X-Authority-Analysis: v=2.4 cv=BpiQAIX5 c=1 sm=1 tr=0 ts=69b3dc09 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=st_MFZYYFGq7bypRZrYA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130075
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55632-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EC61F280B09
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fix two issues in csid driver for 8775p platform:

1. Simplify clock configuration for csid lite by removing unused clocks
   and correcting clock rates. Only vfe_lite_csid and vfe_lite_cphy_rx
   clocks are actually needed.
2. Fix BUF_DONE_IRQ_STATUS_RDI_OFFSET calculation for csid lite on
   sa8775p platform. The offset should be 0 for csid lite on sa8775p,

Fixes: ed03e99de0fa ("media: qcom: camss: Add support for CSID 690")
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-csid-gen3.c    |  6 ++--
 drivers/media/platform/qcom/camss/camss.c          | 40 +++++++++-------------
 2 files changed, 20 insertions(+), 26 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
index 664245cf6eb0cac662b02f8b920cd1c72db0aeb2..bd059243790edeb045080905eb76fef3b12caae1 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
@@ -48,9 +48,9 @@
 #define IS_CSID_690(csid)	((csid->camss->res->version == CAMSS_8775P) \
 				 || (csid->camss->res->version == CAMSS_8300))
 #define CSID_BUF_DONE_IRQ_STATUS	0x8C
-#define BUF_DONE_IRQ_STATUS_RDI_OFFSET  (csid_is_lite(csid) ?\
-						1 : (IS_CSID_690(csid) ?\
-						13 : 14))
+#define BUF_DONE_IRQ_STATUS_RDI_OFFSET  (csid_is_lite(csid) ? \
+						((IS_CSID_690(csid) ? 0 : 1)) : \
+						((IS_CSID_690(csid) ? 13 : 14)))
 #define CSID_BUF_DONE_IRQ_MASK		0x90
 #define CSID_BUF_DONE_IRQ_CLEAR		0x94
 #define CSID_BUF_DONE_IRQ_SET		0x98
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 00b87fd9afbd89871ffaee9cb2b2db6538e1d70d..4a0bf8acd7645f8cd8c1b4cb9b6ff6f3a54d42e8 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3598,9 +3598,11 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
 	/* CSID2 (lite) */
 	{
 		.regulators = {},
-		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
-			   "vfe_lite_csid", "vfe_lite_cphy_rx",
-			   "vfe_lite"},
+		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx" },
+		.clock_rate = {
+			{ 400000000, 480000000 },
+			{ 400000000, 480000000 }
+		},
 		.clock_rate = {
 			{ 0, 0, 400000000, 400000000, 0},
 			{ 0, 0, 400000000, 480000000, 0}
@@ -3617,12 +3619,10 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
 	/* CSID3 (lite) */
 	{
 		.regulators = {},
-		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
-			   "vfe_lite_csid", "vfe_lite_cphy_rx",
-			   "vfe_lite"},
+		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx" },
 		.clock_rate = {
-			{ 0, 0, 400000000, 400000000, 0},
-			{ 0, 0, 400000000, 480000000, 0}
+			{ 400000000, 480000000 },
+			{ 400000000, 480000000 }
 		},
 		.reg = { "csid_lite1" },
 		.interrupt = { "csid_lite1" },
@@ -3636,12 +3636,10 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
 	/* CSID4 (lite) */
 	{
 		.regulators = {},
-		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
-			   "vfe_lite_csid", "vfe_lite_cphy_rx",
-			   "vfe_lite"},
+		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx" },
 		.clock_rate = {
-			{ 0, 0, 400000000, 400000000, 0},
-			{ 0, 0, 400000000, 480000000, 0}
+			{ 400000000, 480000000 },
+			{ 400000000, 480000000 }
 		},
 		.reg = { "csid_lite2" },
 		.interrupt = { "csid_lite2" },
@@ -3655,12 +3653,10 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
 	/* CSID5 (lite) */
 	{
 		.regulators = {},
-		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
-			   "vfe_lite_csid", "vfe_lite_cphy_rx",
-			   "vfe_lite"},
+		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx" },
 		.clock_rate = {
-			{ 0, 0, 400000000, 400000000, 0},
-			{ 0, 0, 400000000, 480000000, 0}
+			{ 400000000, 480000000 },
+			{ 400000000, 480000000 }
 		},
 		.reg = { "csid_lite3" },
 		.interrupt = { "csid_lite3" },
@@ -3674,12 +3670,10 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
 	/* CSID6 (lite) */
 	{
 		.regulators = {},
-		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
-			   "vfe_lite_csid", "vfe_lite_cphy_rx",
-			   "vfe_lite"},
+		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx" },
 		.clock_rate = {
-			{ 0, 0, 400000000, 400000000, 0},
-			{ 0, 0, 400000000, 480000000, 0}
+			{ 400000000, 480000000 },
+			{ 400000000, 480000000 }
 		},
 		.reg = { "csid_lite4" },
 		.interrupt = { "csid_lite4" },

-- 
2.34.1


