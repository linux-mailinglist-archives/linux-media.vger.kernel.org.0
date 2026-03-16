Return-Path: <linux-media+bounces-55965-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJAkMlpTuGmKcAEAu9opvQ
	(envelope-from <linux-media+bounces-55965-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 20:00:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4006029F6E2
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 20:00:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1938B306C457
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 18:55:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 074F33EBF23;
	Mon, 16 Mar 2026 18:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oRDcHOlT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cegmmqCW"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834523E95AD
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 18:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773687304; cv=none; b=ZWebSI9lIXZu3JUS0SnOS+si/DHfzYdKPvgAgAW1cvDJd4BH3irIsb0IBTITOgWr04ax99q24Gw7iVQRhY1sslLKQTJ6G2ggZUM6/Bz22fQP/GW0BjM7A4aKuA+cfPEtYpnaPo0j3JWWnHCN5zFI9wqibGoE02nptDEfu8mTBFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773687304; c=relaxed/simple;
	bh=oq8rpHKCSOKqM9VKEq685jP8JJci+C1FsX62wc7Er8k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pef9RQ5N8vXridmy+5Wrshz2nRyD8uFN1ZH3xJip5VAuKl9EbZ9s70lLJc5MI42vIZumu1VZBJQb/DF510TOOW5h//P4fbE7CnZ5uBpr4yoHIDD/VJ92DU0MvqJ2Fc56niQXrzQzr4L15oW7YJ/KuT98KF3rCjFUqY0btpWmGqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oRDcHOlT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cegmmqCW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GEg9UF3295286
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 18:54:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZYN4Nx4s1s0PIB6puUMuobQKNmVwqnFdxXEhdm+HsJY=; b=oRDcHOlTCMc1CSMQ
	l1R8lfj170GaJqA523vBJ8gd5GghUz7rcfi3uJ9Ma6bPQlAkPtYmbMEt+ix6lyJs
	+kjzlwircm8dNSZyhxqCJQPc5LBfp6pct2qmCwjT3ttoSOvZO9JdfJsbY5nNX92f
	lq7wszjD3wJG75DxiaIK1bUQXF+BnSS4zwBJsfh7v4tBRydRqv27HCr8R+ycxyiQ
	pi4sPmWW6CBzz7xn5uyka162UaNqjE+XQU6tJUIVmHyGlbLbbARL9AYHbsvP1K0F
	K9u90A7I9whDRNnYTZ0BfXCiCnHhY2whiL69Ifu8S1WqB5/EbesXuNN+SYwZAiiX
	iUMH3w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxkuy0vvh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 18:54:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd773dd39bso3819728085a.2
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 11:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773687295; x=1774292095; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZYN4Nx4s1s0PIB6puUMuobQKNmVwqnFdxXEhdm+HsJY=;
        b=cegmmqCWGOAwZRjLRXl1FuRT86J1Xc8FCGj5xSBo60v+LZu47wEjAH845u1jFUSUQk
         Zieod4QBC3rR6npR376qWBE8EtP1+GECXHaPyTxnztmkT73DcbwdTkFdi5rU00MA++bx
         7ZjTcmrZk1YiR3ZFk2ZxRETYyeMh3U69cVTK8fTFNtTP3w+6sz70zyfcSTWrvRI9SLwT
         J8+6pMTcfQeXZZzLs+3JjWsBIYtTj2KzeY6xBwqUB2EIFx8hMuOlv7u5hMiZ4dtpWoGj
         FQMdhgTAZEmg2cpd9DlODlLyZTKmihEG6GW33vCaPEYGOxWgiDa31KwvkKRb6wXZclkF
         TJmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773687295; x=1774292095;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZYN4Nx4s1s0PIB6puUMuobQKNmVwqnFdxXEhdm+HsJY=;
        b=Yyp5JXbqavlVvZ46g/Sh62WTSbclTbYYfYN9cw6R2aaMaWUt2YKLyZWEhGYzjZK/PC
         dGRgYISwaERDbwFkLbfzx4L8fgZ5VhwvXJ8CjyVLETklmy6nVMXn3UmQYmXBBT9KHoRs
         OgVimOm6GDesMde6PU2MtMtJwtWJPE+R0YmuirvhbU5a1wpGNhr2zVq9ZPYJaRhbyBW/
         n9VTPMi+QgKl0i8nUvD8aHvwy//CuZKSOwbvgzqpiay11BbMjsjM9KeK101UaXBM3//0
         PLZRiM+MXkv162+StwSg+158YcHIxn6qBz0FFvmDZKYiPYFBMfOgB/1LOjLYE6BiII/I
         alfw==
X-Gm-Message-State: AOJu0YzwhZjrx8X5qlmh+JI+A+TXJyOuZQgYCjJ66KNOzs5TGHK7q6jR
	710AZYGG7bXJYPlOL7PD0k7hbfDHeEbEXzLhKnTp1NcHkVIuMecV2ekF3LSIoeq6IxEedIri6vx
	ZEz6O3yZRtJchMzDO6Cusr4cTOPfR+sCU8hC7QgC6TvJ89I9klJWAcDwFcTZvpzvlSg==
X-Gm-Gg: ATEYQzxSDkpRjNylMDZ71QEv6Mp7RQ6Oyx4sHB/C8l8II4RW0RqKOyfduBRI6DJTB5n
	Ul2XEoED4XdeVXaGoSZY5C+dHFDZvksgxB7Ky8VaTLzCP7HKpQuPU8d44eyIoubpIRs0CdOCVL8
	1EllGaSS/ZnAzrBobqgB0xsIokNeTuRoEJhpRoRXhd+1Nz4iUJnhEEWEC6+Rttys2SW12apCf8g
	Iz2YwssNxfxk9JCCdfgbciscv8XX31crjIIE7ZMrch+Zmmuxvx8FUFw9PnoV15h+8uYoKC5ZV26
	qkP2LJQcYDK/ju/vBj05bSB3em29tA6hiF2vfmC6RvTywLOD35NuZa4SlzkzAjwULuNTb7rmzWd
	wcvkV6PaX/hjASKxkifVbwjzZ28q4RpWsldL+Kp9A3nJElDBJJWjgFrza0If/vtoZxJqgB817fj
	nqFvFmOy64IPamgcLu+/mtwc6BeKyHubxBesU=
X-Received: by 2002:a05:620a:469e:b0:8ca:90de:43f5 with SMTP id af79cd13be357-8cdb5bb1a98mr1782275185a.63.1773687295261;
        Mon, 16 Mar 2026 11:54:55 -0700 (PDT)
X-Received: by 2002:a05:620a:469e:b0:8ca:90de:43f5 with SMTP id af79cd13be357-8cdb5bb1a98mr1782271785a.63.1773687294689;
        Mon, 16 Mar 2026 11:54:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e6788csm34108041fa.33.2026.03.16.11.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 11:54:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 20:54:42 +0200
Subject: [PATCH v7 4/8] media: qcom: iris: split HFI session ops from core
 ops
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-iris-platform-data-v7-4-fc79f003f51c@oss.qualcomm.com>
References: <20260316-iris-platform-data-v7-0-fc79f003f51c@oss.qualcomm.com>
In-Reply-To: <20260316-iris-platform-data-v7-0-fc79f003f51c@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpuFH0zvGpyA/atztqDIkWFD6Cw+ZmMhgVqv2i8
 vXI8vZ8qh6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabhR9AAKCRCLPIo+Aiko
 1bUwB/9pIpMiD8Ixg5kjm2zWrWEzFQyPzrrY+iUPbk55wMPc4ceD/lE1nl7iNU/WUWrG7s2CaT8
 55iiSLjj/cqFPPvWQ5+f0q9Q97i2lx1Jhk/0GZe9ukqyXpDjleSnEYPAwNedExiY5BXcncu4Omy
 ywu8yUm+brC80B4a2qU8VTPEITcD73hNuRXP1eQ3pr8SRxaNTR5BMjTD1+045qBwAiX8tXzUWFR
 bjYYLOGZBV2QdoT05ZCbwWLGopac6z5Td02G8LF8LYu1uQIhiREwpEaXvsQUnOxEgj+HRYMVEPT
 rTam37J3+yg0bS3Dr5gL343Miv5VxkfimCUNhxdgv0o5nj4j
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=br1BxUai c=1 sm=1 tr=0 ts=69b85200 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=GJ9kf5zHVpckMw0GqqUA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDE1MCBTYWx0ZWRfX52cOsv+LREzB
 cek9ur4QsygDjHaWuCtyhzQIjHUEyd6v5HXgdrJGuGjRswbpG4+iZoxGFY9ukCUZHR6bzTMaPJK
 m6bmALTQv69ePV6Rxeilo/Pi/h1QbmB/909COmx6KgvK7W1YfP/nd+DeULX1JsivqGgckeqx+Y/
 OKUuJZZv6vPwg4Ix7FdbjohAgo6Z1G0DN7I3wrKs9Ah+do75c3xhI/a1FXdSR06QGC39ZevCdU+
 ak8fbVl7gE9/d3+lSJsKfMprFabLlHprM/lxgvxhCmQnNYuTHdwv6crOeSj2Od9Tv6jwBhd3gsH
 nVKlbLXlX747YNB4bJzjHXhRwWYvwWTux8ue8cOvSJvNUf9Peci8cq8BqS0hTI68tVs6u+wm4kl
 mnMduNVWHS0ml5OrJkfqmmf9pZRKQct9DGcK+qsjEurYgOWqeeA7AnceVtlP8ntnqqz/rlSNS5M
 qFw5VAty8hPXrM+wtqw==
X-Proofpoint-ORIG-GUID: 5Af9HFpxbNCnpFqS6mYj07fr7bBVyCXf
X-Proofpoint-GUID: 5Af9HFpxbNCnpFqS6mYj07fr7bBVyCXf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_05,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160150
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55965-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 4006029F6E2
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


