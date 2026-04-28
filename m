Return-Path: <linux-media+bounces-59749-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMGrDYkw8GltPgEAu9opvQ
	(envelope-from <linux-media+bounces-59749-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 05:59:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BE447D427
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 05:59:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0719C305DD21
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 03:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAC7F33554F;
	Tue, 28 Apr 2026 03:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Iz1in51z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iH0g1vC3"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C17333A716
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 03:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777348595; cv=none; b=ZAad+a6sOWVC4jc6I6JF/s+qjxCLJTEyNdTYcdfClAWIMQaXAeeBYITv/BfyGZHy5lppoV4BBKtDnqFQ71G/1l1NKaHJVGRhtquVeDVawFnNpRWfmw5pmWsmRcbldyCJwOdwR0O5EZlS/Ztf3Af4l+/Vt+tVEZZh1zajramL7s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777348595; c=relaxed/simple;
	bh=HB+2dN7dauUgdrMwzh7J5kQuRahuzqqEHBqE2I7xdDA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lK+eCybeJBx5mboeLy5zf+aq5jfh7/uOGu9BLDRaAKpEh068k+Y0R6OCcbH1imo06US/b6i0AX3wMJ7P1bmOD+K0Db7jAS0+rNpoPTQceW37lQSstGu4uWYyeJ0IqNmCeaMxLP4QonUwj9ezZ+CVkLUWIJmYKufWxpwd6b5LonU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Iz1in51z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iH0g1vC3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RMTKg11625050
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 03:56:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yWKLcs6KFXQAtV2FQyw0tlDf/NPaYSspKHLsi0vr58M=; b=Iz1in51zLm2pEO7J
	F3GoHTsi05CRzvHuzP7z1vlvbcyEav7K5qoMLAfZ2vcxiqq8kj5LDBkOt6lmoyIT
	y/pMCC+PoinA/UGZizCrVQLTGJ0a4zt+gaLU7smvukYPCBN4+lDTQ5FkRP4sFXZQ
	C/nnAwl56yw1u9H1ZhlGCQPBC8DTu4+gpNAJGeJcPhSjMCGTS2ncpb3El9wK8deZ
	4eG3DmIBtq3RY49RndFd21xQA7cc901yu+a//+9h1V4Bw/M30htf5WQ8Qfu9Y+Bq
	fDNcOc2U7vrRrkB/5lpY1PzGoC7RdoiiJjoM1OUbrhSyca/Ky47GmrF5STk4GNaQ
	16dOcA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtgms91ja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 03:56:33 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35da1c703d1so12863840a91.1
        for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 20:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777348593; x=1777953393; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yWKLcs6KFXQAtV2FQyw0tlDf/NPaYSspKHLsi0vr58M=;
        b=iH0g1vC3TtxA8dY9h0F4mtBEZBYzfuIOuHnM0wwmAFuKIW7b+nrxn91Y1HWKJZdzXh
         BZSVAuzXfP71PrqC4y6gxy7iNSijjqsX+857Li8VuoMfwn5fsA3jgsnndFXCBW1jIIae
         7aUZzutuUzi4iUIrcW1HhCnLLtGV+kuXnkTa93JeHuP4K+9l0W5ZnuxaburRPMF4nrU1
         tFjvp+466D+zjxz9pdAn5KnhC+YCdF1FOcsJh4DDVMikgNY4WDkx+o67HRGNlF+7R4Op
         7nUyPqqjI/3a5eFsSBXdlq5C0zB3W5tXa6piCZrL8/JcIcsg8GF2ukIfH8a0lnfD6RKy
         NEcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777348593; x=1777953393;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yWKLcs6KFXQAtV2FQyw0tlDf/NPaYSspKHLsi0vr58M=;
        b=O8E3r2pCDWY2KY3YOlgvUjTHeBSeaTQoGapVG7zhqMCEADBeM12ZOtJBCk/YT02vKA
         hUTPEd8xyNNCCoBwnzp7K8YYMwlE+2qjs1FTqEiHEShbzf7PoZFYEJAyc3f/8JQd3zXa
         I/ojeWltBdAKUrK0LyhiT7phPLE6sBP4xh62yR2la9jnjr1R9hAQ4Q76D+KYuk/aI986
         m8hiJQrJW58bGT63b7M3zbATjhfwiOSVPGsBhIHP6fjJ9qPij+4K8p78dWuien4i1y1D
         KHDwuiy24KT+mwqBOoOnkJ4Sjr5pjRUjK3kGcEkicCVT+suYtFv/2oatT3ASHRnLdpIZ
         lsCw==
X-Gm-Message-State: AOJu0Yyy66JzribsAXc7KMqWdc3CBfrMAcPXwOuMfxMW9fO310UBnklk
	fnanwpTCmrGa5H55E879t2XKuvVPO94UPF/GJPYn6zFJ4iLkMk0GCqu2Y4kQAuB7T7k2wEP1MO1
	4t4FlEKp2UbO5/Ge71iGPCJUmzxLAIEf6QPLOwrkI+MPVJTjcHrmb6ZDVtE1bNuWDBg==
X-Gm-Gg: AeBDieskuGr+4wOE647+iqDpAVe+arGFcvlZQFogn1IeVKLOQVv/8zLZfDxs+plgoZJ
	8X3FDSJ6+0rWpX6SAQ+YGvmokoncoaXiey8TYYQVvliOnyVuetASmWLb/hy4gqoOcV3cJ0Sx1l2
	WcRMZo2E4bvOYjdSI86DFSynUWbrZo44B68mp6DIkdU3F+V1EJsams3AiAe+J1Uc3GfCDJKvVOF
	qR5U4gOc3LKUHJGJGylmQOK+57WWlFLndVjycVzF4Y8NYz8VHjjlk+gMf2AY8i6rdUpGJu/7a1+
	kzcp3c5wKIwd1LFl8qKFBaTZHzD76eOxpZ9/iUoLfjVjGFrs3tRrlEg/4tR28UiN0XiZ0K5flrO
	PXviocFRmUgOkH6yzx3fkG2VLNTTkUti1CEI9ye+S3OnYKMZouIa0J6IIkrOj6Z7IKQ==
X-Received: by 2002:a17:90b:3ec1:b0:35f:b69d:7292 with SMTP id 98e67ed59e1d1-3649202efc7mr1409552a91.15.1777348592543;
        Mon, 27 Apr 2026 20:56:32 -0700 (PDT)
X-Received: by 2002:a17:90b:3ec1:b0:35f:b69d:7292 with SMTP id 98e67ed59e1d1-3649202efc7mr1409498a91.15.1777348592040;
        Mon, 27 Apr 2026 20:56:32 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36490905648sm393888a91.4.2026.04.27.20.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 20:56:31 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 09:24:11 +0530
Subject: [PATCH v3 05/12] media: iris: Add context bank hooks for platform
 specific initialization
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-glymur-v3-5-8f28930f47d3@oss.qualcomm.com>
References: <20260428-glymur-v3-0-8f28930f47d3@oss.qualcomm.com>
In-Reply-To: <20260428-glymur-v3-0-8f28930f47d3@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777348550; l=3016;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=HB+2dN7dauUgdrMwzh7J5kQuRahuzqqEHBqE2I7xdDA=;
 b=eH0/Yk+y/GIExJ5JU+BKGEQ7AroZObH05OnbDmYhj+LP/8r5nK4poXvcv8o1f0KNc56zIXkbl
 paiGTgO/pIfDUJMGeIuoxTseODSS+S8kcu2T3U63FwjjNLuGQ4Ug7I/
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: 1WFoHST5qzTq3do9ZxrZDTdsdEbi0RLQ
X-Authority-Analysis: v=2.4 cv=R4gz39RX c=1 sm=1 tr=0 ts=69f02ff1 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=hn6c7xJugPWrWid5T_cA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDAzMyBTYWx0ZWRfXz5Q+EuCbjhbf
 6LmxHOsDSEpyrKVu6D7qeDbYOB5asgila5LLK/BZ4TiehT85020DMzoEQcMKHHIRcFm463E1LJi
 YFwKZr5KskWHC+3Zmyzpmvtg7+iKTrMFALldRDfqSRyeT/bbO8fL3I/kaKd1SUqhdmMAtDhDXY3
 0Yt3RIUjD2pwaDdcC9ExljZJv2YznRcmQ6AGLA9ugl8cao1C9yq2XwWECVY4VMim5NG0P9qlZp6
 7S7PswkQzdXtLOtw+Ab3n0DxX8M3Ha/oSD0UQZkcJpymEbHQdee7bEApJBSPMqeM+SHrUjT7BSW
 eEsrEkZgBfUa7ChpIXb+oMZ/KaN2TxJ22gE+xSAPDwjllnfldo3ubTeSsFk78cEGyxyoDwN/1ZF
 nKu9Q/7Uqq265BuFx4I7PPgalfPIIfdXn95M6DvGLeKWSP0YxewRas77v/RP15uHffdM4SrQILt
 pmjNBBWOhGDLuJkUcZg==
X-Proofpoint-ORIG-GUID: 1WFoHST5qzTq3do9ZxrZDTdsdEbi0RLQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280033
X-Rspamd-Queue-Id: A1BE447D427
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59749-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,linaro.org,gmail.com,8bytes.org,arm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

The Glymur platform requires a dedicated firmware context bank device
which is mapped to the firmware stream ID to load the firmware.

Add init and deinit hooks in the platform data for context bank setup.
These hooks allow platform specific code to initialize and tear down
context banks.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_platform_common.h      |  2 ++
 drivers/media/platform/qcom/iris/iris_probe.c      | 23 +++++++++++++++++++++-
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 5a489917580e..55ff6137d9a9 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -219,6 +219,8 @@ struct iris_platform_data {
 	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 	const struct vpu_ops *vpu_ops;
 	void (*set_preset_registers)(struct iris_core *core);
+	int (*init_cb_devs)(struct iris_core *core);
+	void (*deinit_cb_devs)(struct iris_core *core);
 	const struct icc_info *icc_tbl;
 	unsigned int icc_tbl_size;
 	const struct bw_info *bw_tbl_dec;
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index ddaacda523ec..34751912f871 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -142,6 +142,20 @@ static int iris_init_resources(struct iris_core *core)
 	return iris_init_resets(core);
 }
 
+static int iris_init_cb_devs(struct iris_core *core)
+{
+	if (core->iris_platform_data->init_cb_devs)
+		return core->iris_platform_data->init_cb_devs(core);
+
+	return 0;
+}
+
+static void iris_deinit_cb_devs(struct iris_core *core)
+{
+	if (core->iris_platform_data->deinit_cb_devs)
+		core->iris_platform_data->deinit_cb_devs(core);
+}
+
 static int iris_register_video_device(struct iris_core *core, enum domain_type type)
 {
 	struct video_device *vdev;
@@ -193,6 +207,7 @@ static void iris_remove(struct platform_device *pdev)
 		return;
 
 	iris_core_deinit(core);
+	iris_deinit_cb_devs(core);
 
 	video_unregister_device(core->vdev_dec);
 	video_unregister_device(core->vdev_enc);
@@ -259,11 +274,15 @@ static int iris_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = iris_init_cb_devs(core);
+	if (ret)
+		return ret;
+
 	iris_session_init_caps(core);
 
 	ret = v4l2_device_register(dev, &core->v4l2_dev);
 	if (ret)
-		return ret;
+		goto err_deinit_cb;
 
 	ret = iris_register_video_device(core, DECODER);
 	if (ret)
@@ -298,6 +317,8 @@ static int iris_probe(struct platform_device *pdev)
 	video_unregister_device(core->vdev_dec);
 err_v4l2_unreg:
 	v4l2_device_unregister(&core->v4l2_dev);
+err_deinit_cb:
+	iris_deinit_cb_devs(core);
 
 	return ret;
 }

-- 
2.34.1


