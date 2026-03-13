Return-Path: <linux-media+bounces-55590-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPvoMM7Cs2mEagAAu9opvQ
	(envelope-from <linux-media+bounces-55590-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 08:54:54 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2361B27F0C0
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 08:54:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4853A312F7C9
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 07:52:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6CD3370D6A;
	Fri, 13 Mar 2026 07:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OgNA9pLo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NqhDLy2E"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6B936495D
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 07:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773388369; cv=none; b=nPrTsO01m+EI/AWq6lDT0DtkHh5t7gcJ/V5wu2rp08VyUfZV1bRN1nxVtbnLaXYhAXZ4Acc65LwoUYUbBSsjjP7A7EzRgXYW3i0kH2N11ytjeTugqXrQ3RgySo8zJtXa/wW1NTmjCl3k2O/3qLwBhKlXhCN3d5tYw5ys/4Qo7AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773388369; c=relaxed/simple;
	bh=oq8rpHKCSOKqM9VKEq685jP8JJci+C1FsX62wc7Er8k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b5wQ0VNC152T0eY3JAkfjWs9zEjkmS4vKF/YZw/HDScjrG1ObQV7EHLl+W6kiplzVjOoefYf9CtnihwZbD+ReRUOR/SoEUBvctzshtGWQgGFXwRVHTV6ye+yCUpvmSOn3n6f7T+E7MVLMFWbPwj1peqnrRhX2wjmRq87RHBL8OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OgNA9pLo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NqhDLy2E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tnno1015133
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 07:52:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZYN4Nx4s1s0PIB6puUMuobQKNmVwqnFdxXEhdm+HsJY=; b=OgNA9pLopAN4HuIW
	vpTkEQWuL1/6ET6uPxEh05CC5yU9GxHp0gSghEi0LThZk16BCoVKmGqTN+t765yI
	pLg2VwaJ3UBFm+35pdHi2BlyaU5vMO8HcC5qoPwhVL6YrAbHAjcpvmT6A4MhE5VM
	C28DeVqDOOVRmvCDybI2I6qIt1QQKOPIJ9cMMoS+VFI3OKOGPP7rDKrdM20BsqKh
	0wNMEQHfidVw/XitCqCuzQq3bCtPaqSFIdgXPSZShEl2hrVMVFc+PMY/ai9sZHpU
	XEMHKcorB+vmqGt63eShEKiaFBTDJbVq9I7ZKMvnHnzOiqRRaxlucuN5wxwwOA36
	TJY5Tw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cumvdmeyq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 07:52:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd7fc27cf7so1053641185a.1
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 00:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773388365; x=1773993165; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZYN4Nx4s1s0PIB6puUMuobQKNmVwqnFdxXEhdm+HsJY=;
        b=NqhDLy2EwKfQ9E+e+VNNe3bYAkO0BbAa4+sTLX+1F/cFvQREVWCmGYuvv8qhV5Z5WP
         zRT12I8pnTqAwhzAoBplIjhwFXDmJL6V0QaE0i2nGTp3Q/8wJ+acbyikPyUPXMigX2B5
         3XAoR73AesypeaBVkewlm3LYKdnwpl+CJl4f+0GSJJCNCSzPPEkuYDYgSLlfi0RZmliy
         /9zONR19v7LwktkykdceEWIijQ4HX+UGwA0v8KfwZZFep5j9d6EXE6rhCk51Mr1CtfIw
         LZNrP0LrJhxE+UObPLYb9nPa7M+ntNR0ZVf0ClR/0Mk4LRjetsskkIw7AA+xqyhAS+Cw
         dxsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773388365; x=1773993165;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZYN4Nx4s1s0PIB6puUMuobQKNmVwqnFdxXEhdm+HsJY=;
        b=qiZqQP2i2+bVFwwmtOtUtvjdBYxmbP16RP+31Qz3YPEkUH4U/9kTOsUHKwUV5upG/O
         ngxrO3KAZ+Gh9DiHUZDC4V/m1Sp+jOsK/jaEn0BsRIIbqxwcxNkkXcSahmDyW+I9Blk2
         +8+VTGCHmuK4pH/fT25Rp3jl8OtjzcapPCUj2qXPxucfG0SRZVwaJYXYfd7fsXv/76bB
         BwmRynUbDN+uvpmLI4oA55ZevQ6svXFLTCqj+eHwF72oNfA5dTOYFlZlETTtrzHk2MpQ
         pqiwTdRAeFzHqSCsmX9INSD1Qnq8GvhqImp3C4cfU3Fe+htBXUUgUcRSJ6qvYfSzXFYr
         9GVA==
X-Gm-Message-State: AOJu0YwnVMiv/NTzC4PkkVelM+sVHIqnY6PeJbGxC/95YDmaIxZ45fYQ
	a94swM1UppVY6frrlWC0/2KhBNHG8Yzw+Dcs1MhzIZE7G3j+o5VZtgIp+t0FVOAWZGWec1QpHpa
	8+Q8F4T2nXPx4TZ9DNbkSFh8WGJNueNXNVxzvVh/KbD+xG2FJMFVn8r/3RHNcN+yydSgrU/TJjw
	==
X-Gm-Gg: ATEYQzxxL9BtYpEwMiNkFAa7/K2v0HNc06RhTBP1z+vMWXKx9ffd4EplkCNRKj3dJlU
	3QfL+IvNf2LmgJVy/afAEtWOJaFp0YwF7M4FHDxbQOoDyNiyVGzQW9vHxBIQ1Po20pNs+YFITkZ
	jkzp4tM+pOk+au5s0kFvFV2KQZFdM6dsTnjuujmTuseXXO2N9zZpxS5fxzOBZR2AVJCVScDdhrm
	2qgz0XT09NUR7ANldjV5b4QgP/KqBAzAEw1dkX3u9thNL9IQl3FUycQ1eAf05Uz7w6/eC+kB3Em
	oBER5VclfYb6KtWB7uG+QDoT6zi3Ajqny+NtRC6FMNZ+xg6L1B4hPhnZaji12A7uqYHr/9VY2ct
	kccX8Gq94Wg8KdR2nndoVjg7nJRuI61Ztmb/7b741OtDENTxx+xlTmqwobXiirtOc59N563TIjc
	nLo4bCaMhSpMh21mh7d79gnm1iPtUCJ4M6l8I=
X-Received: by 2002:a05:620a:40c2:b0:8cd:b33f:e556 with SMTP id af79cd13be357-8cdb5a5c88bmr368264385a.22.1773388364472;
        Fri, 13 Mar 2026 00:52:44 -0700 (PDT)
X-Received: by 2002:a05:620a:40c2:b0:8cd:b33f:e556 with SMTP id af79cd13be357-8cdb5a5c88bmr368261885a.22.1773388363904;
        Fri, 13 Mar 2026 00:52:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a1563775a2sm1347475e87.89.2026.03.13.00.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 00:52:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 09:52:36 +0200
Subject: [PATCH v5 4/8] media: qcom: iris: split HFI session ops from core
 ops
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-iris-platform-data-v5-4-180484af4490@oss.qualcomm.com>
References: <20260313-iris-platform-data-v5-0-180484af4490@oss.qualcomm.com>
In-Reply-To: <20260313-iris-platform-data-v5-0-180484af4490@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=23729;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=oq8rpHKCSOKqM9VKEq685jP8JJci+C1FsX62wc7Er8k=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBps8JCns68V715+lDTnphBS4d5rgm01a4YCbO+x
 YSPtqJujnqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabPCQgAKCRCLPIo+Aiko
 1T+8B/0Y6Yb1qRCOUhJIdYMoPZAYrnAXLkWG/IDh/q3wlS6BXXWbigqRrMR/tJwvM0ccvNqlAKj
 hiGwgOf2Iz8CSyc3eKXuHmtQOiVSeylJz+y8xx1wU2WviJwj8weEHJ8zC3/AsyfKYpMBJKgsOA5
 tIHP+D4X9eOeW4/dOJVXU2fkxBKE4c3RqV/nGVVEUAtQIMnp/bvdAqNOfmwgJvU3IwfnICqntqa
 PdPukf3tKWEsU+C9MENSkoG9+r5HYipR1UvLUKFuMOokjjPcO3LS7G9SXRffFC76fDy67uvCmsi
 8qao8nrwfDXQcAbl8ry6/BGAPkx2ohug7S4TrBmXhp4qJ6R2
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA2MSBTYWx0ZWRfX6wvT95leHDm0
 ivzurqj8zov36nbydj6729yn3JXrAr27SpzdRKPdWN5ON8mzsgUuu+M4FFQjN7Xyd23AcHFqhad
 eNpu6NtR7MRTzpNmiYteeAK/tJwFujyvMj1MSOdFtIy2QdBJWDWNAbo6zuZhcH6zydWGzKJtyq7
 ygCOv0BQcs/Tr+9rRVIt226ademdHTU5OBbROnjAbbsYzamlI5fvEpRDfDIN6FXrFgkIwgd9AT2
 ndDV0nSPjt2930gj6VxWEfNVzxQxHP6SKgnlxCT92LzmO1paOr6uH+MDDVzeXgbC0SVHW6dwu1m
 sK3kKCWhKn5+OpFfrn6ZTm3eGYTw2DpM7I3+L6QDPAv6znp3TMcjGdU61mmu8G1fvNNxdsqOikm
 mIReTpDVV3HO2m01oqG1TgcCQvGpWhWw5abYRG1eATJyq1KecL5J1CL1AAeQFD3ul9PMi/rCa4p
 mZVfi1DBpgSkpHHb6pg==
X-Proofpoint-GUID: 3WJ_jzCn7HV1SPT3n31uExCkTtJc_2C0
X-Proofpoint-ORIG-GUID: 3WJ_jzCn7HV1SPT3n31uExCkTtJc_2C0
X-Authority-Analysis: v=2.4 cv=XsT3+FF9 c=1 sm=1 tr=0 ts=69b3c24d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=GJ9kf5zHVpckMw0GqqUA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603130061
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55590-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2361B27F0C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Calling HFI instance-specific ops should not require double indirection
through the core ops. Split instance-specific ops to a separate struct,
keep a pointer to it in struct iris_inst and set it directly in the
get_instance function.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c     |  4 +-
 drivers/media/platform/qcom/iris/iris_common.c     |  8 ++--
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 46 +++++++++++-----------
 drivers/media/platform/qcom/iris/iris_hfi_common.h |  3 ++
 .../platform/qcom/iris/iris_hfi_gen1_command.c     | 23 ++++++++---
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 17 +++++---
 drivers/media/platform/qcom/iris/iris_instance.h   |  4 ++
 drivers/media/platform/qcom/iris/iris_vb2.c        |  2 +-
 drivers/media/platform/qcom/iris/iris_vdec.c       |  6 +--
 drivers/media/platform/qcom/iris/iris_venc.c       |  4 +-
 drivers/media/platform/qcom/iris/iris_vidc.c       |  2 +-
 11 files changed, 72 insertions(+), 47 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index 9151f43bc6b9..f55b7c608116 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -404,7 +404,7 @@ int iris_create_internal_buffers(struct iris_inst *inst, u32 plane)
 
 int iris_queue_buffer(struct iris_inst *inst, struct iris_buffer *buf)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
 	int ret;
 
 	ret = hfi_ops->session_queue_buf(inst, buf);
@@ -572,7 +572,7 @@ int iris_destroy_dequeued_internal_buffers(struct iris_inst *inst, u32 plane)
 static int iris_release_internal_buffers(struct iris_inst *inst,
 					 enum iris_buffer_type buffer_type)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
 	struct iris_buffers *buffers = &inst->buffers[buffer_type];
 	struct iris_buffer *buffer, *next;
 	int ret;
diff --git a/drivers/media/platform/qcom/iris/iris_common.c b/drivers/media/platform/qcom/iris/iris_common.c
index 7f1c7fe144f7..25836561bcf3 100644
--- a/drivers/media/platform/qcom/iris/iris_common.c
+++ b/drivers/media/platform/qcom/iris/iris_common.c
@@ -48,7 +48,7 @@ void iris_set_ts_metadata(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
 
 int iris_process_streamon_input(struct iris_inst *inst)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
 	enum iris_inst_sub_state set_sub_state = 0;
 	int ret;
 
@@ -90,7 +90,7 @@ int iris_process_streamon_input(struct iris_inst *inst)
 
 int iris_process_streamon_output(struct iris_inst *inst)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
 	enum iris_inst_sub_state clear_sub_state = 0;
 	bool drain_active, drc_active, first_ipsc;
 	int ret = 0;
@@ -189,7 +189,7 @@ static void iris_flush_deferred_buffers(struct iris_inst *inst,
 
 static void iris_kill_session(struct iris_inst *inst)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
 
 	if (!inst->session_id)
 		return;
@@ -200,7 +200,7 @@ static void iris_kill_session(struct iris_inst *inst)
 
 int iris_session_streamoff(struct iris_inst *inst, u32 plane)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
 	enum iris_buffer_type buffer_type;
 	int ret;
 
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 3cec957580f5..5a24aa869b2d 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -399,7 +399,7 @@ static u32 iris_get_port_info(struct iris_inst *inst,
 
 int iris_set_u32_enum(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
 	u32 hfi_value = inst->fw_caps[cap_id].value;
 	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
 
@@ -412,7 +412,7 @@ int iris_set_u32_enum(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
 
 int iris_set_u32(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
 	u32 hfi_value = inst->fw_caps[cap_id].value;
 	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
 
@@ -425,7 +425,7 @@ int iris_set_u32(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 
 int iris_set_stage(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
 	struct v4l2_format *inp_f = inst->fmt_src;
 	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
 	u32 height = inp_f->fmt.pix_mp.height;
@@ -446,7 +446,7 @@ int iris_set_stage(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id
 
 int iris_set_pipe(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
 	u32 work_route = inst->fw_caps[PIPE].value;
 	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
 
@@ -459,7 +459,7 @@ int iris_set_pipe(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 
 int iris_set_profile(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
 	u32 hfi_id, hfi_value;
 
 	if (inst->codec == V4L2_PIX_FMT_H264) {
@@ -479,7 +479,7 @@ int iris_set_profile(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_
 
 int iris_set_level(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
 	u32 hfi_id, hfi_value;
 
 	if (inst->codec == V4L2_PIX_FMT_H264) {
@@ -499,7 +499,7 @@ int iris_set_level(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id
 
 int iris_set_profile_level_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
 	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
 	struct hfi_profile_level pl;
 
@@ -520,7 +520,7 @@ int iris_set_profile_level_gen1(struct iris_inst *inst, enum platform_inst_fw_ca
 
 int iris_set_header_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
 	u32 header_mode = inst->fw_caps[cap_id].value;
 	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
 	u32 hfi_val;
@@ -539,7 +539,7 @@ int iris_set_header_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_
 
 int iris_set_header_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
 	u32 prepend_sps_pps = inst->fw_caps[PREPEND_SPSPPS_TO_IDR].value;
 	u32 header_mode = inst->fw_caps[cap_id].value;
 	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
@@ -561,7 +561,7 @@ int iris_set_header_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_
 
 int iris_set_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
 	u32 entropy_mode = inst->fw_caps[ENTROPY_MODE].value;
 	u32 bitrate = inst->fw_caps[cap_id].value;
 	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
@@ -586,7 +586,7 @@ int iris_set_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_
 
 int iris_set_peak_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
 	u32 rc_mode = inst->fw_caps[BITRATE_MODE].value;
 	u32 peak_bitrate = inst->fw_caps[cap_id].value;
 	u32 bitrate = inst->fw_caps[BITRATE].value;
@@ -613,7 +613,7 @@ int iris_set_peak_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type
 
 int iris_set_bitrate_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
 	u32 bitrate_mode = inst->fw_caps[BITRATE_MODE].value;
 	u32 frame_rc = inst->fw_caps[FRAME_RC_ENABLE].value;
 	u32 frame_skip = inst->fw_caps[FRAME_SKIP_MODE].value;
@@ -640,7 +640,7 @@ int iris_set_bitrate_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap
 
 int iris_set_bitrate_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
 	u32 bitrate_mode = inst->fw_caps[BITRATE_MODE].value;
 	u32 frame_rc = inst->fw_caps[FRAME_RC_ENABLE].value;
 	u32 frame_skip = inst->fw_caps[FRAME_SKIP_MODE].value;
@@ -667,7 +667,7 @@ int iris_set_bitrate_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap
 
 int iris_set_entropy_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
 	u32 entropy_mode = inst->fw_caps[cap_id].value;
 	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
 	u32 hfi_val;
@@ -687,7 +687,7 @@ int iris_set_entropy_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap
 
 int iris_set_entropy_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
 	u32 entropy_mode = inst->fw_caps[cap_id].value;
 	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
 	u32 profile;
@@ -712,7 +712,7 @@ int iris_set_entropy_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap
 
 int iris_set_min_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
 	u32 i_qp_enable = 0, p_qp_enable = 0, b_qp_enable = 0;
 	u32 i_frame_qp = 0, p_frame_qp = 0, b_frame_qp = 0;
 	u32 min_qp_enable = 0, client_qp_enable = 0;
@@ -776,7 +776,7 @@ int iris_set_min_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_i
 
 int iris_set_max_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
 	u32 i_qp_enable = 0, p_qp_enable = 0, b_qp_enable = 0;
 	u32 max_qp_enable = 0, client_qp_enable;
 	u32 i_frame_qp, p_frame_qp, b_frame_qp;
@@ -841,7 +841,7 @@ int iris_set_max_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_i
 
 int iris_set_frame_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
 	u32 i_qp_enable = 0, p_qp_enable = 0, b_qp_enable = 0, client_qp_enable;
 	u32 i_frame_qp, p_frame_qp, b_frame_qp;
 	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
@@ -902,7 +902,7 @@ int iris_set_frame_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
 
 int iris_set_qp_range(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
 	struct hfi_quantization_range_v2 range;
 	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
 
@@ -923,7 +923,7 @@ int iris_set_qp_range(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
 
 int iris_set_rotation(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
 	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
 	u32 hfi_val;
 
@@ -953,7 +953,7 @@ int iris_set_rotation(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
 
 int iris_set_flip(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
 	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
 	u32 hfi_val = HFI_DISABLE_FLIP;
 
@@ -972,7 +972,7 @@ int iris_set_flip(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 
 int iris_set_ir_period(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
 	struct vb2_queue *q = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
 	u32 ir_period = inst->fw_caps[cap_id].value;
 	u32 ir_type = 0;
@@ -998,7 +998,7 @@ int iris_set_ir_period(struct iris_inst *inst, enum platform_inst_fw_cap_type ca
 
 int iris_set_properties(struct iris_inst *inst, u32 plane)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
 	struct platform_inst_fw_cap *cap;
 	int ret;
 	u32 i;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
index 3edb5ae582b4..18684ada78b2 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
@@ -110,6 +110,9 @@ struct iris_hfi_command_ops {
 	int (*sys_image_version)(struct iris_core *core);
 	int (*sys_interframe_powercollapse)(struct iris_core *core);
 	int (*sys_pc_prep)(struct iris_core *core);
+};
+
+struct iris_hfi_session_ops {
 	int (*session_set_config_params)(struct iris_inst *inst, u32 plane);
 	int (*session_set_property)(struct iris_inst *inst,
 				    u32 packet_type, u32 flag, u32 plane, u32 payload_type,
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index e42d17653c2c..a28b0c7ebbad 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -1063,11 +1063,7 @@ static int iris_hfi_gen1_session_set_config_params(struct iris_inst *inst, u32 p
 	return 0;
 }
 
-static const struct iris_hfi_command_ops iris_hfi_gen1_command_ops = {
-	.sys_init = iris_hfi_gen1_sys_init,
-	.sys_image_version = iris_hfi_gen1_sys_image_version,
-	.sys_interframe_powercollapse = iris_hfi_gen1_sys_interframe_powercollapse,
-	.sys_pc_prep = iris_hfi_gen1_sys_pc_prep,
+static const struct iris_hfi_session_ops iris_hfi_gen1_session_ops = {
 	.session_open = iris_hfi_gen1_session_open,
 	.session_set_config_params = iris_hfi_gen1_session_set_config_params,
 	.session_set_property = iris_hfi_gen1_session_set_property,
@@ -1080,6 +1076,13 @@ static const struct iris_hfi_command_ops iris_hfi_gen1_command_ops = {
 	.session_close = iris_hfi_gen1_session_close,
 };
 
+static const struct iris_hfi_command_ops iris_hfi_gen1_command_ops = {
+	.sys_init = iris_hfi_gen1_sys_init,
+	.sys_image_version = iris_hfi_gen1_sys_image_version,
+	.sys_interframe_powercollapse = iris_hfi_gen1_sys_interframe_powercollapse,
+	.sys_pc_prep = iris_hfi_gen1_sys_pc_prep,
+};
+
 void iris_hfi_gen1_command_ops_init(struct iris_core *core)
 {
 	core->hfi_ops = &iris_hfi_gen1_command_ops;
@@ -1087,5 +1090,13 @@ void iris_hfi_gen1_command_ops_init(struct iris_core *core)
 
 struct iris_inst *iris_hfi_gen1_get_instance(void)
 {
-	return kzalloc_obj(struct iris_inst);
+	struct iris_inst *out;
+
+	out = kzalloc_obj(*out);
+	if (!out)
+		return NULL;
+
+	out->hfi_session_ops = &iris_hfi_gen1_session_ops;
+
+	return out;
 }
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index e4f25b7f5d04..ffb70fd9499c 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -1300,11 +1300,7 @@ static int iris_hfi_gen2_session_release_buffer(struct iris_inst *inst, struct i
 					inst_hfi_gen2->packet->size);
 }
 
-static const struct iris_hfi_command_ops iris_hfi_gen2_command_ops = {
-	.sys_init = iris_hfi_gen2_sys_init,
-	.sys_image_version = iris_hfi_gen2_sys_image_version,
-	.sys_interframe_powercollapse = iris_hfi_gen2_sys_interframe_powercollapse,
-	.sys_pc_prep = iris_hfi_gen2_sys_pc_prep,
+static const struct iris_hfi_session_ops iris_hfi_gen2_session_ops = {
 	.session_open = iris_hfi_gen2_session_open,
 	.session_set_config_params = iris_hfi_gen2_session_set_config_params,
 	.session_set_property = iris_hfi_gen2_session_set_property,
@@ -1319,6 +1315,13 @@ static const struct iris_hfi_command_ops iris_hfi_gen2_command_ops = {
 	.session_close = iris_hfi_gen2_session_close,
 };
 
+static const struct iris_hfi_command_ops iris_hfi_gen2_command_ops = {
+	.sys_init = iris_hfi_gen2_sys_init,
+	.sys_image_version = iris_hfi_gen2_sys_image_version,
+	.sys_interframe_powercollapse = iris_hfi_gen2_sys_interframe_powercollapse,
+	.sys_pc_prep = iris_hfi_gen2_sys_pc_prep,
+};
+
 void iris_hfi_gen2_command_ops_init(struct iris_core *core)
 {
 	core->hfi_ops = &iris_hfi_gen2_command_ops;
@@ -1330,6 +1333,10 @@ struct iris_inst *iris_hfi_gen2_get_instance(void)
 
 	/* The allocation is intentionally larger than struct iris_inst. */
 	out = kzalloc_obj(*out);
+	if (!out)
+		return NULL;
+
+	out->inst.hfi_session_ops = &iris_hfi_gen2_session_ops;
 
 	return &out->inst;
 }
diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index 16965150f427..352af99699dd 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -15,6 +15,8 @@
 #define DEFAULT_WIDTH 320
 #define DEFAULT_HEIGHT 240
 
+struct iris_hfi_session_ops;
+
 enum iris_fmt_type_out {
 	IRIS_FMT_H264,
 	IRIS_FMT_HEVC,
@@ -38,6 +40,7 @@ struct iris_fmt {
  * @list: used for attach an instance to the core
  * @core: pointer to core structure
  * @session_id: id of current video session
+ * @hfi_session_ops: iris HFI session ops
  * @ctx_q_lock: lock to serialize queues related ioctls
  * @lock: lock to seralise forward and reverse threads
  * @fh: reference of v4l2 file handler
@@ -80,6 +83,7 @@ struct iris_inst {
 	struct list_head		list;
 	struct iris_core		*core;
 	u32				session_id;
+	const struct iris_hfi_session_ops	*hfi_session_ops;
 	struct mutex			ctx_q_lock;/* lock to serialize queues related ioctls */
 	struct mutex			lock; /* lock to serialize forward and reverse threads */
 	struct v4l2_fh			fh;
diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
index bf0b8400996e..a2ea2d67f60d 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.c
+++ b/drivers/media/platform/qcom/iris/iris_vb2.c
@@ -129,7 +129,7 @@ int iris_vb2_queue_setup(struct vb2_queue *q,
 	if (!inst->once_per_session_set) {
 		inst->once_per_session_set = true;
 
-		ret = core->hfi_ops->session_open(inst);
+		ret = inst->hfi_session_ops->session_open(inst);
 		if (ret) {
 			ret = -EINVAL;
 			dev_err(core->dev, "session open failed\n");
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 719217399a30..ccda3b9fb845 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -374,7 +374,7 @@ int iris_vdec_streamon_input(struct iris_inst *inst)
 
 int iris_vdec_streamon_output(struct iris_inst *inst)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
 	int ret;
 
 	ret = hfi_ops->session_set_config_params(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
@@ -434,7 +434,7 @@ int iris_vdec_qbuf(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
 
 int iris_vdec_start_cmd(struct iris_inst *inst)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
 	enum iris_inst_sub_state clear_sub_state = 0;
 	struct vb2_queue *dst_vq;
 	int ret;
@@ -497,7 +497,7 @@ int iris_vdec_start_cmd(struct iris_inst *inst)
 
 int iris_vdec_stop_cmd(struct iris_inst *inst)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
 	int ret;
 
 	ret = hfi_ops->session_drain(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index aa27b22704eb..aeed756ee9ca 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -581,7 +581,7 @@ int iris_venc_qbuf(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
 
 int iris_venc_start_cmd(struct iris_inst *inst)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
 	enum iris_inst_sub_state clear_sub_state = 0;
 	struct vb2_queue *dst_vq;
 	int ret;
@@ -623,7 +623,7 @@ int iris_venc_start_cmd(struct iris_inst *inst)
 
 int iris_venc_stop_cmd(struct iris_inst *inst)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
 	int ret;
 
 	ret = hfi_ops->session_drain(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index bd38d84c9cc7..7e03d63578e1 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -224,7 +224,7 @@ int iris_open(struct file *filp)
 
 static void iris_session_close(struct iris_inst *inst)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
 	bool wait_for_response = true;
 	int ret;
 

-- 
2.47.3


