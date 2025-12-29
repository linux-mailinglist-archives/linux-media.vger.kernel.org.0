Return-Path: <linux-media+bounces-49626-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 68247CE608E
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 07:34:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D9A53033D63
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 06:32:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 780C63A1E84;
	Mon, 29 Dec 2025 06:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HkmE7Aug";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e0UsHvOe"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2759F2D060D
	for <linux-media@vger.kernel.org>; Mon, 29 Dec 2025 06:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766989921; cv=none; b=tmrDfRdk0PnzOCnrzya1JXecakkJ2Us77dRCiCkhJrEvo/q3tRkZGGTjhtleiODLWeQuqCu3DHzEAAwN7hscuv4u/lNfsmbZ4iCd0XcvVDqcc9KesdeIUNbxe4kmWcLdnuR0dvs9jRh0myOIuqsd3TbGi7SoCsX9RC68/yZdmq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766989921; c=relaxed/simple;
	bh=v55TNg//wC4XAcaHWZTXoCk9GlnNzZOSKMtmlhh/99s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dm3p8CtC+AtYiSlYL05PQGyGQ4hc46qsLB7qXqYIWHs/Vz7VplUcBXzsUVfJHyyhFmxpE1aMqscmstNsDcm0P5CRPrt0QAZTZ0I26YYBgZ4lcVqIsm4eTjXdNpRREtiOJTCJpdD8ZXqp9TY4CHj0XZdtdu8PWvx0P5fl5pyqZiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HkmE7Aug; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e0UsHvOe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSLxEQG3940292
	for <linux-media@vger.kernel.org>; Mon, 29 Dec 2025 06:31:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aaVi6kTxKFVUUN+LstLP4rB1bASy8KXXeuDqCkR8A3c=; b=HkmE7AugOxT9WlqZ
	z4vMJHPDN1YMVhBrOqgb8GwUUg+VK+8r/aTQ1FKP3T0VI22dWL5Wo+6EznHE/MhS
	7db0ooXdMQQUMGZW8aStYKvEfgk06oQSqZHODoia9XtD2ilmnx5FMq+ujHrdjx+I
	IZBczZbRfI4BdJCeP2kYloStkyiF3DxV2B8QP1Aw++hr559MPncTSDHGt0rO5RVs
	664uCrKTnYSTlpBvsC27EkYEMMUyJolLI6uvr70nyWnFWCrAyg9XGcbOVse/KhH+
	LhloOoHsEnpF5xFVlUmOgCLWkzep1GsYHvuvWbBqAlX+98A3agzdwjUzUDOFMvoB
	YslxLg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba87buja4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 29 Dec 2025 06:31:58 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7b6b194cf71so16889864b3a.3
        for <linux-media@vger.kernel.org>; Sun, 28 Dec 2025 22:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766989917; x=1767594717; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aaVi6kTxKFVUUN+LstLP4rB1bASy8KXXeuDqCkR8A3c=;
        b=e0UsHvOehd9+Y+5Ve9NJF2nBWG4tnZYtNB+VrOVTExW/QEzT01yWVoi4HqBoQ7SNlW
         b32UzqZ0eB1K8VxigcjyMQjcfvfn45vs1vCLsuG0MxPxGtmOKzoDhpt3rPZdI+QUR1Nt
         wDZnIniRm6ES6YMPxtPdcAuoPPT0tZa10Z80zj/zWBbl5pXsQGnbe4VC9ZM/u+0k90xh
         I8FTxkIcNlMHqVdbxHPeiJmREt2IO/D80q8WOj/XVdTbxiZFUD4AYK9mIX0oopRG8JDD
         pOG34VbzcvFCxmrDULF2Uiyg0d7pnDybA2o7IgzT6kcDo2vSRxEuWir1GW4h7IGeXtaw
         kvKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766989917; x=1767594717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aaVi6kTxKFVUUN+LstLP4rB1bASy8KXXeuDqCkR8A3c=;
        b=adz4VQFjI9K5IHEAUhMbVwMk4SnEUO8iw8G0AZ7oj+EUcFuYFBPPHgEfhEVef0LaRs
         SYePL3SJNHFeszKBaeyozMbOsxrAgoQQZVC5vuXjeRsvHk1+yme9g36T9W0cd74k9l2f
         f028Vjc3wyx4ZQ0uTgz2HsMXBr9sWm741vFdVvFIcX/n5SyRd/PF/Kb6y9IHAjpHs6fi
         /4l/6VxvBudgUvcCoSrgU3XgOccwT7R3R7KU59jCZztm3qcMGPw8YLiMmmGgpWIYje+e
         nOmT4GPKCT9kyL4svcNh/9trF5f+dvd93WU6yLE4pgWBNmWWyxQez89FLus3DRamFZGR
         dM6A==
X-Gm-Message-State: AOJu0YxsuK5cw712qCCC+UxeFzRxk21e9NmGckfNmfgl9ZCTynGjCFEX
	CtDEGy6vC7JNbQBZwc8cs8DTUFyTdlkTFGfu/DUVPwW3R2uKTRA7nU+zf7F91LG1RfA2lmwYXAu
	Q9LVkg3XadRd4U4Z1tAOZNLft2KOV6kRJSktxKeZ1qnVhiyYkW04lN6KFodKhjVzJrQ==
X-Gm-Gg: AY/fxX7czMTdnwKNWbulmLg7lKpKc3C23Fr3P3zJn2gn0kR0lBLyjd8wG4GahiT8tMO
	0tKWEEiKO3sDHjjAAkYAz06CqdC7JkLKEo8f2n169YvMQEOKzuIAIfxFraTjXlTcFxkw1ax+XWK
	eWj0CpMgEiTNcug6OzC2QD+gelqo43nz11yVRHLru+IFqfH/xgcKi6ZxZOjs+BMVTpaxPObEqUO
	PymDZYHlWTfXc7MIK/Cl0/Nty46lwqpwnX2ujr97XIBnXhjAC9KZnoyPEX7kAl6w0xt9+4NVbc+
	6J7AakMbcS5qAzTRUwvLfTBa4TC32wARhGZu0947PLRzE50Ow7MD/cPxQDqQfqVS+S4EGLqJNiL
	kbeZsN/iesmqKY508ITBSKzkpST7f2Cl3W9BJSIZ7QrdmTUc=
X-Received: by 2002:a05:6a00:90a2:b0:7e8:4471:ae5c with SMTP id d2e1a72fcca58-7ff67456c12mr24865578b3a.40.1766989917348;
        Sun, 28 Dec 2025 22:31:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFX0ThBZeW+BigEL8dzVjUuDuXkQS9otcnHN3QgmHmuY+Fxw19HAteXH2bjW3/rRGKbh+msgQ==
X-Received: by 2002:a05:6a00:90a2:b0:7e8:4471:ae5c with SMTP id d2e1a72fcca58-7ff67456c12mr24865542b3a.40.1766989916512;
        Sun, 28 Dec 2025 22:31:56 -0800 (PST)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e797ab9sm28308962b3a.59.2025.12.28.22.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 22:31:56 -0800 (PST)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 12:01:24 +0530
Subject: [PATCH v2 5/6] media: iris: gen2: Add sanity check for session
 stop
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251229-iris-fixes-v2-5-6dce2063d782@oss.qualcomm.com>
References: <20251229-iris-fixes-v2-0-6dce2063d782@oss.qualcomm.com>
In-Reply-To: <20251229-iris-fixes-v2-0-6dce2063d782@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766989894; l=1244;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=v55TNg//wC4XAcaHWZTXoCk9GlnNzZOSKMtmlhh/99s=;
 b=56U9/cpxgd6FqwYiSraU5YRmgQlKZvQjxUwJu9bnWBH4JEI/08y9dFRLPfHh/+xjtF+B+JGfa
 NF/6E/wSsUaCkusbqS9QCk8PZnYWdaoDaGsRTI4lYzhdNj5QXhj5WnQ
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-ORIG-GUID: ZX-KlUYg9zhVaX8VH82l1J_Q796IH9ua
X-Proofpoint-GUID: ZX-KlUYg9zhVaX8VH82l1J_Q796IH9ua
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDA1NyBTYWx0ZWRfX8GR3gKliRDx5
 PhJX7vIRLMY9u+NOg30Da4MYfPL+roeoVPLYGPSuVm/siV8pEZBte3S+NurSsJdGiWAbg7MaNxK
 kMmKpeehocviTVA3Etd8Saq/WXc42bVTKKvzw34e9y/gf3WGmdwU+W2X7v5U4R3hwa4fGjgezyF
 v+QFaLNMmrSE2jB6xT1QRjvjfguGt208L61K59ETqxvvZTc4tKevp39Qv25QB1OKPbaejPf3cOh
 I1ViwYyhjfK+D6wVrUtuuQ5O6/DNYCW/zOlvAnQwG5efrFlU13Elil0+JeQwgFG0Emxes1mfZpd
 mvyjQdl6VfwXbbdpdqXeYi6KOAsa8jyRbtCgykz8quti8EU+wO6R4qGyzV2+Vl598+ZDtgU2BK8
 LHg1CePxoph8L+bKk1wEAZZbMBXVo6T+XyHek733xi8f17qtE0O0jhbC69ne7VJo2GJ6czVzfaR
 7AEMpkuBlV3r4tFvuZw==
X-Authority-Analysis: v=2.4 cv=do7Wylg4 c=1 sm=1 tr=0 ts=6952205e cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=hJpQIKcYsydMz8RtK9gA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_01,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290057

In iris_kill_session, inst->state is set to IRIS_INST_ERROR and
session_close is executed, which will kfree(inst_hfi_gen2->packet).
If stop_streaming is called afterward, it will cause a crash.

Add a NULL check for inst_hfi_gen2->packet before sendling STOP packet
to firmware to fix that.

Fixes: 11712ce70f8e ("media: iris: implement vb2 streaming ops")
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 6a772db2ec33fb002d8884753a41dc98b3a8439d..59e41adcce9aadd7c60bb1d369d68a4954f62aef 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -963,6 +963,9 @@ static int iris_hfi_gen2_session_stop(struct iris_inst *inst, u32 plane)
 	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
 	int ret = 0;
 
+	if (!inst_hfi_gen2->packet)
+		return -EINVAL;
+
 	reinit_completion(&inst->completion);
 
 	iris_hfi_gen2_packet_session_command(inst,

-- 
2.34.1


