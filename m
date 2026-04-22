Return-Path: <linux-media+bounces-59315-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4B/CKUOv6GlDOwIAu9opvQ
	(envelope-from <linux-media+bounces-59315-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 13:21:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CD8445323
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 13:21:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7581830A3A35
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 11:17:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A493E3CF67C;
	Wed, 22 Apr 2026 11:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aefHxqmC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IsjRgdtD"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0173CF026
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 11:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776856630; cv=none; b=rTr+F/NcKs62U6D55WwtzxH/L96C+uGIrnTTFNNWwmqtQRqCBQHhJICpOktrfV/FqEQzsp0APeKRiwr5cpOt7ncK6oZCH2SffFwRpfOP25hiAbO4yDwLv88Tn6jIF2Otle+G9khqhMcEtcxa9wy4hn6X16IkMtTXZEeKf+MtxIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776856630; c=relaxed/simple;
	bh=wXJ29qJ9nlNpNzyVwmliOL00C7sS3Qrpz+U+LvAc1vg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jytTOUkiyxpo2CF9nFnTYBmh4MGmHTdGgxjklkCRAL0EKJ4mn1U/RXxvHIVczHAsmD3lVA7jZiTk0JDr2AYdP45bVVBDXXDuihDOf7SmGUMOhLAchOTxWcXIlO+RRd70JsdDpjtaS3Lo2hu8Ub//qRlfAJ/FdrGgFhp4fYeIHdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aefHxqmC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IsjRgdtD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MAUpXL976175
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 11:17:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xs04e26vQV7jGpkvJ0zKvXqEfdEH1nMhkt/hhhJhtxo=; b=aefHxqmCZzs77ksX
	1mf6Ed4UoPmmpl7U5DHc2OMIC4cc/5FKfXxK791YNq2j/a0F8jBetoiOdmb0DxfM
	schCHQKPpzQtVgceEIQpFk95y6+UIiFNbNCLPBz5Opy47N6ozzoQchczYloaelCu
	uuqML/EO3OE1ZOl4XyW7lXMdH5i1llz6lhgyy0GaclEZ4yXNKNj6JKBeOsvZs6H5
	3Pts69et3Xc1MkzShP12dZ5i5LX1eEHtaZL0xrPOBNCUm0RFDDll0pGR4WTVvrga
	n+q6VHj/cV1K7Ni4SPr5Hhn1TKeqV0VDYpDPXw1GnA6MsDmfIve9m2scAqhgmbgq
	6uwpKw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpeneb6e2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 11:17:08 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f9aa52c92so5409454b3a.1
        for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 04:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776856628; x=1777461428; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xs04e26vQV7jGpkvJ0zKvXqEfdEH1nMhkt/hhhJhtxo=;
        b=IsjRgdtDq+mYrErGJHQjYkQwSMAmWsh0UKXFrx3sNbcQNTj0Gt/2qt1F3R5TpaVgUP
         07g4deUaFBjqRgIWA2oSwDz1GQJl3oxmeZ6hC+lm0OZ63DFgf9IVvYRWiVNh8kE9AR+c
         OBad7rCF5oe9DMTcVv+mheu5aUtUzJ65BmWxa108wmkZv5RUL/2JBD/6NG50mmULcxXH
         DUvEvnTCbB4mZIEXXWTLYt/lrRHhbHw4PRa64N+HoQ4c5qULmFzmHg4+n0agOeRzyX8p
         sHpuhoqcZErXLmgCxd2F78kIh0fT7hSrZSdfz0uDprKfugz6zyc5UCZ6S/LYYk3NJYev
         6RUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776856628; x=1777461428;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xs04e26vQV7jGpkvJ0zKvXqEfdEH1nMhkt/hhhJhtxo=;
        b=P6g6SFgBpeo46BqBvVLGQk0wA7V7HHq8sietwF2egYaV/IVUeSG7swpWCKnJmmdvsX
         5meMCXk1EdVZhX2ToaP5+bLxUhx4wxxB8gMYXxB9T/hqmh9sWqCWIPs0sJQe3GcBMc2S
         Mx62ylc6L4Y/Cvr4jCGrO9PcL3RcZrfK0/CnRduaMatSbZlSfcQMgkpTwrKJ0swgre0T
         Zce1wWMY5CjOVfkjeA4/JUaBFbI5oM3pvQ0heVSe5UzDaq2FZyQNItM3psNslbWED9t7
         kLlH2bDEmZDfyfHbozFAj7vIv1/G3S8HcGTYMdSOBBic8drtGs2acSqDCN4vcxc5nqog
         53AQ==
X-Gm-Message-State: AOJu0YxA7PIFIQWJgk2XkJtzxwwKlASLWK0kj2BRRmg2vayRODv2yJtB
	kdqHNkhUZ6kvejsJVUYGrJyCtME9y26qsQ5qgk61KJTwMBiOyl6+Tw3eUeMuQjXvmq2CnycKUXe
	OIsrmvGdNIZOzU9iDwbgec6VqXUkuIE4pFcowQyDX/4Btk+1muc5AgyAenralo/j70Q==
X-Gm-Gg: AeBDietuv7VmEThtFD2f0zrlEJYEynNNBJ84/Axregi97pw4RKMuA1ioTER5loVORdC
	lL1Y2CcP/U1AQoTF2zeqqL/bLulEsZxLOLRDZaJeiFP8rLSkYkfs1lNmPqBkfGuFoyF5FElqPfx
	+7R1CrEfKF4EVxALd6yZ/i6sFZ+84Z1hDFj/8Wrfa4vD+EwdzJaIHm/MjJgC0d7dIaioH05+Uja
	B1T6XzF2xTd9Nr7iSphxdxnR6xplQHjMH9JAvpT4o6OECNPe/mk8kbZpfpDM7ABRtVIvne67nsx
	eZc3ZI7QAZu/Q0NuoEAt2lW36H88Za+AiEjphZlQ052cD+d1WCgtU8lAsndIssCWItyn9DNUXrG
	qWzcPcgoNRPPKsxREDT673FrPPKAnVw8R+yWYhbBj8Cy/w9EPObcQLvpDof0FFpOq+MwbUA==
X-Received: by 2002:a05:6a00:418b:b0:82c:7383:3745 with SMTP id d2e1a72fcca58-82f8c834458mr24017236b3a.19.1776856627650;
        Wed, 22 Apr 2026 04:17:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:418b:b0:82c:7383:3745 with SMTP id d2e1a72fcca58-82f8c834458mr24017201b3a.19.1776856627215;
        Wed, 22 Apr 2026 04:17:07 -0700 (PDT)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe901csm21100782b3a.48.2026.04.22.04.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 04:17:06 -0700 (PDT)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 16:46:37 +0530
Subject: [PATCH 4/7] media: qcom: iris: Remove dead assignment in
 iris_hfi_gen2_set_tier()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-iris-code-improvement-v1-4-8e150482212d@oss.qualcomm.com>
References: <20260422-iris-code-improvement-v1-0-8e150482212d@oss.qualcomm.com>
In-Reply-To: <20260422-iris-code-improvement-v1-0-8e150482212d@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776856606; l=1385;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=wXJ29qJ9nlNpNzyVwmliOL00C7sS3Qrpz+U+LvAc1vg=;
 b=HEE9b1ozEQ5M3v70/DrPcmLmew3bbzldxzNVN4qPr5xTc6TuKxySSJy59Uj9Ipc1K8v24GIxd
 WTMlfSpg62wCT0RBX8rTG6OxqfoUkt1OYpT329WLi1s4IZu8bfM/GUZ
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEwOCBTYWx0ZWRfX9Ta8rIMtRvQo
 s5Dk2h1aXk2Wu4t4OfQj/PjHmCwzvnt59HcRJqD60R2swALkyBj9r0eXoZTCdzZej73t6+OX8ZB
 Rt8/7y4B1wVrHCZABQ1iRSyTkaijBArGOshDK5mcv7LmnhJ55e2vOdbiaUoXgNoZcMjPsXerv1x
 WEGNWYC4Mk2BnI8EC94tNMgXYqg2sBu+Fzvp891yAvVtbqIwtkVT6lJjzUQS4DpzXUTs2Ut8LBx
 wUWyt7IC3P2fgOF/Muc/400sl34zFnKVmT7eRUmUN81uZrGQrHLear0R6ViFAyXdZS6CBEvysz7
 8CZEzaQuBZgJu4jWsoVvn/T3zqsdEAHOd/lT63j8UWEVopiotl49xfNbYSmFZy7CFc3sCVqiazP
 NDSLK88h3kyyPrq58P+Vz9cfpecvZhWR+6gSacWSnrjlIe+BBpQtlxXUqrqVPtWaunmqGVE89t3
 CPyW87Al4GH1/Pl5G3A==
X-Proofpoint-GUID: Jc5oY8GS1rsJ3XBTMCCsMc1ygiQ3l1me
X-Proofpoint-ORIG-GUID: Jc5oY8GS1rsJ3XBTMCCsMc1ygiQ3l1me
X-Authority-Analysis: v=2.4 cv=RoT16imK c=1 sm=1 tr=0 ts=69e8ae34 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=baIckf8PCApkX7IVpfsA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220108
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59315-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 29CD8445323
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fold the ternary initialiser directly into the variable declaration,
removing the dead store that was immediately overwritten.

Fixes: 2af481a459a4 ("media: iris: Define AV1-specific platform capabilities and properties")
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 30bfd90d423ba024caf6ececc827f7102e8f3324..06698fde639ec654ff9ec78a178271ab2284f5f0 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -536,10 +536,9 @@ static int iris_hfi_gen2_set_tier(struct iris_inst *inst, u32 plane)
 {
 	u32 port = iris_hfi_gen2_get_port(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
 	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
-	u32 tier = inst->fw_caps[TIER].value;
-
-	tier = (inst->codec == V4L2_PIX_FMT_AV1) ? inst->fw_caps[TIER_AV1].value :
+	u32 tier = (inst->codec == V4L2_PIX_FMT_AV1) ? inst->fw_caps[TIER_AV1].value :
 							inst->fw_caps[TIER].value;
+
 	inst_hfi_gen2->src_subcr_params.tier = tier;
 
 	return iris_hfi_gen2_session_set_property(inst,

-- 
2.34.1


