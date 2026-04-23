Return-Path: <linux-media+bounces-59402-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YI4UG4QK6mkzsgIAu9opvQ
	(envelope-from <linux-media+bounces-59402-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 14:03:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5099D451ACF
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 14:03:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A4420301A0A5
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 12:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3D4A3EC2C9;
	Thu, 23 Apr 2026 12:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PlsvOcNe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XMAGIoth"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E9E3ED126
	for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 12:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776945669; cv=none; b=IJjbmS6+1GG0cIO60pn90UoMda6RvDhO0g4OtVvs5TYKW0uZcMaX7Q/rQyqV2mW03NOhtQiscHqqZgmduz1hBW8m/Xu0xRlg2Z9AULzWqqLs9bxNxe1WACkrq/QCT460b8Ni4d0WgxGmXQyuvA8YzQwBe/6WJX3HkbZogxYTqfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776945669; c=relaxed/simple;
	bh=LYwZO2ou7DHYoL0tkPw/Y4um6kGHBm+U1RyH6lTuf80=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sZIX/IfqN5CAwKGHWZCdD9fB2J5wbDQvCo4fHWxLQ94uRxadnp19GWh/ESI/oHK1EwLKR1/h2nyXoIK5EssxYQKy2nkQRIZG5a4HQqgzwUE1iTl9XvqTSr6GBtMP1nMs4MJIxqBTQv+3Bd1DhyEYaMup0vwMRrl2+XC9mqGsRS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PlsvOcNe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XMAGIoth; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N94fhn2319291
	for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 12:01:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hWNO4fG1aSCsYkc2wD8k8eSJ2NDKUAaIuJR5mkEx0AQ=; b=PlsvOcNeaEt6+Dfn
	heTGZZ/VEa7JQbMn3n9B1NLOrNkNknje4NDKuUEbpHpZh3myvSVAtpq5RfLXi2oC
	qkxp7gi+yzlUbxKLwgjrvXDKkcCSAkhIDf1Pi0zuckniZeZ6Pk3lxRx8lQLNAPYK
	oPo/hbnBB7F3u1gnnlZoqGPVKeNJvA9/OUc+PlC529DwJo2D/gsKE56CRY+e22o5
	4cMw8Lg9cD/RDpbirtkJvwZIMFNGfYqhMI1EQ80bQ0RkME8A3IGOwooCuthaJods
	RAaN1S/ueSOcnEJrHa1qFuQc9xGyfpXSplma5QBAffCGNZU5aeA14aU2VzbkZJz1
	Bz+lRQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqgfsrq4a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 12:01:07 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b2497cc190so46918355ad.0
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 05:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776945666; x=1777550466; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hWNO4fG1aSCsYkc2wD8k8eSJ2NDKUAaIuJR5mkEx0AQ=;
        b=XMAGIothxS+6PhCSUq44lGcqU6rGR3Jt50tCUMB5RtHGqbTaIPcYj1GqZpm7K0lEVg
         1hHx0QbA4xlJHmHeclOdXzc9VXJCP1Q6WcZotpSmnkAcTpPyWKLa9xgWlp4Qg7ZaDbnP
         GIXN4uyWDtRjNg1n1oAA1GwiU3cURHstc/yf1ixslprcvZTYm0ApKDM/PFKJwx5J8Agy
         D0UZa0B0sSFFFv+tD3SmAWSJ6y1kGa6lX+82KsoX6aiMunXWHItRMTqIMax3ebptvt4Q
         szxT5+g+oYQEQPBL4DACbvqzfiksQZv9xOcDumgP+B4hL7Z5yajfjFkaGX1WYIlzDSGV
         91sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776945666; x=1777550466;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hWNO4fG1aSCsYkc2wD8k8eSJ2NDKUAaIuJR5mkEx0AQ=;
        b=TfEU/sFtqBgLPkWG76FfGUA2WkB2NInXGJRMhHYbeY41vavjhIHeR8l6UI9QfODiC6
         WNolB0RUuNfjVev6p/gRhKx7Zm+YIUJYz1qhPEM17wSWMl6M8j5g80sJAel2OPFsRRMz
         fTKMHaRHxSPCi3AzB0HCXB2W6D1Wj0X8IB0LBapj1DK8pGuxxsp5SjcpkZNeNMVNp4dQ
         h1XNOr8m8TPdwxoZJFYjxE7LMMEl3OAmFukxaFytDrm8EaXkbaWIG0WvIBYj91ET8AyM
         3/fxdtQFLdSq9LMLkXp0zLc5wynUtxrnZi4YUV+nXDmLr0Wxa6jsAqDW/dDkiD/+K4X3
         lKFA==
X-Gm-Message-State: AOJu0Yy8N9MT5kx2h+aZI7xFSRv10oPR/GdITchjfQ7/IZVhkFihqf/f
	KgIAZxVzlhnPJ5mK+fnBdS7Kq4mczGw5Um7QJ/19RUfLJayiWNmJFee9q/iUqUcUu9aWIr/BatD
	l3dILkfsxxbLwRyvK58C9z5msWfR6YUTV0XqNvLLlxNVdlTGwTJVlz/1DKaP/InebtA==
X-Gm-Gg: AeBDietr88Dgicq1w6i/TRwCKmYS/NhRkl7ynSOBx2AQHvjP9gTWhPXtIUr8zrSmqWV
	+Z0LvuqpPfNR/Nv0eDcxocv1m/aCw8czANIK8W0FR5RIT1idkvMDiBnmshCL8bhQ14rVYLzntRw
	4PX0Fz7UTVQo1QV27cwcTFumM6eP7TWfGGbIK6Ux2REGKwRoXI48Tt9WUygO867WAECVoW+rOh/
	UwXn6knnOVgOINdHiY43JzgKjqfsWXjBrjteTyrm6EIuM1voiLiHeD+aOtwrmUrZXMLk91GSWRa
	ncq4l8AiuMH0GOpgIjo/9dE2+CmYPcIObxWJDP2adnirU/i86eVRQweqyZ+iDVG1wVkzF1l8C2W
	jEUny0AlKzOddm2IzevHV0ztgrSXQE4zX9edBQbSzvKrruNEflJVvIrA0Sgrnl4dIAMrqrg==
X-Received: by 2002:a17:903:1b2b:b0:2b4:6529:7b9e with SMTP id d9443c01a7336-2b5f9e145a1mr234983175ad.12.1776945666133;
        Thu, 23 Apr 2026 05:01:06 -0700 (PDT)
X-Received: by 2002:a17:903:1b2b:b0:2b4:6529:7b9e with SMTP id d9443c01a7336-2b5f9e145a1mr234982205ad.12.1776945665189;
        Thu, 23 Apr 2026 05:01:05 -0700 (PDT)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa4f092sm194790355ad.36.2026.04.23.05.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:01:04 -0700 (PDT)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 17:30:11 +0530
Subject: [PATCH v2 7/7] media: qcom: iris: Make
 iris_destroy_internal_buffer() return void
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-iris-code-improvement-v2-7-9e9cbf00f9c9@oss.qualcomm.com>
References: <20260423-iris-code-improvement-v2-0-9e9cbf00f9c9@oss.qualcomm.com>
In-Reply-To: <20260423-iris-code-improvement-v2-0-9e9cbf00f9c9@oss.qualcomm.com>
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
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776945627; l=5224;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=LYwZO2ou7DHYoL0tkPw/Y4um6kGHBm+U1RyH6lTuf80=;
 b=qzoPRQI/vaFBWmkZPwEdPm0gCzC09Q59QxumJrDtGj3tXtxfoNmW5MbOElbqB9qLWbvXmRhB5
 zwldabj57WUAfkuajHVH7IrxR/TrOtu0m4OCRLqOYkcW21gFhOBEAhb
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-ORIG-GUID: CHCl1XDqLD9r1hqerfa_5M77bvf_hZFh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDExOSBTYWx0ZWRfX8y04Hmg8FTlW
 PK+xUUjfEMgWT4VkEA3yIOGDd272PEUcNfNZ2Hsasddku86nF81CtzLonNDg24rPjUQ7JXju4kz
 KpqKtcbCBT2vFkpU1jN5YttSxBb+qCLflyEtnOBGT7mcxF/hYIHrTWEt/AlNZfIH3dFN55wWmW1
 NS9BA1kbCXpXkbDNmgZFus5j6RM2oB8+R2VW+n9bKPrF54pCmV65eF81j68m+Vr80VhrJ+7POby
 bqDFDK6mGXFT6hC7YF4eCk7MDieTRcPc6T715lkFlRxCD7sunoE/wtDE3ZyZ+sIGy0N6B0AtLp9
 KPF+egTuOWqyT3Q2Jno9l/IZzycUsJUUFLYgZAlJdgTDbeybagCJb0r9bj+R6frIZlu91UmHMFQ
 CC2n6i6m2S6ZiVcxPQwthGolGjOw095vWtC9k2C29V05vPjU23G8TmKs3eRwBFfnLQoP6mWn2LQ
 H81bNgvpfqrfdYMOllA==
X-Authority-Analysis: v=2.4 cv=AvbeGu9P c=1 sm=1 tr=0 ts=69ea0a03 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=CWBAsx5YQZKXPYp8bPkA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: CHCl1XDqLD9r1hqerfa_5M77bvf_hZFh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230119
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59402-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5099D451ACF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

iris_destroy_internal_buffer() is guaranteed to succeed and never
reports an error. Returning an int is misleading and forces callers to
handle a meaningless status value. Convert it to return void to match
its behavior and simplify callers.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c           | 16 ++++------------
 drivers/media/platform/qcom/iris/iris_buffer.h           |  2 +-
 drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c |  2 +-
 .../media/platform/qcom/iris/iris_hfi_gen2_response.c    |  4 +++-
 4 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index 5b31c511da6e735943e2561683016cb9414d760c..390a48d8cf788e17760f901a6a073c5b9e5a9dc9 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -455,7 +455,7 @@ int iris_queue_internal_buffers(struct iris_inst *inst, u32 plane)
 	return 0;
 }
 
-int iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buffer)
+void iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buffer)
 {
 	struct iris_core *core = inst->core;
 
@@ -463,8 +463,6 @@ int iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buf
 	dma_free_attrs(core->dev, buffer->buffer_size, buffer->kvaddr,
 		       buffer->device_addr, buffer->dma_attrs);
 	kfree(buffer);
-
-	return 0;
 }
 
 static int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane, bool force)
@@ -473,7 +471,6 @@ static int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane, bool
 	struct iris_buffers *buffers;
 	const u32 *internal_buf_type;
 	u32 i, len;
-	int ret;
 
 	iris_get_int_buf_tbl(inst, plane, &internal_buf_type, &len);
 
@@ -488,9 +485,7 @@ static int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane, bool
 			if (!force && buf->attr & BUF_ATTR_QUEUED)
 				continue;
 
-			ret = iris_destroy_internal_buffer(inst, buf);
-			if (ret)
-				return ret;
+			iris_destroy_internal_buffer(inst, buf);
 		}
 	}
 
@@ -500,11 +495,8 @@ static int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane, bool
 		else
 			buffers = &inst->buffers[BUF_ARP];
 
-		list_for_each_entry_safe(buf, next, &buffers->list, list) {
-			ret = iris_destroy_internal_buffer(inst, buf);
-			if (ret)
-				return ret;
-		}
+		list_for_each_entry_safe(buf, next, &buffers->list, list)
+			iris_destroy_internal_buffer(inst, buf);
 	}
 
 	return 0;
diff --git a/drivers/media/platform/qcom/iris/iris_buffer.h b/drivers/media/platform/qcom/iris/iris_buffer.h
index 75bb767761824c4c02e0df9b765896cc093be333..ab8e5d953101a786ade20540ee3c3ed226160cbe 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.h
+++ b/drivers/media/platform/qcom/iris/iris_buffer.h
@@ -112,7 +112,7 @@ void iris_get_internal_buffers(struct iris_inst *inst, u32 plane);
 int iris_create_internal_buffers(struct iris_inst *inst, u32 plane);
 int iris_queue_internal_buffers(struct iris_inst *inst, u32 plane);
 int iris_queue_internal_deferred_buffers(struct iris_inst *inst, enum iris_buffer_type buffer_type);
-int iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buffer);
+void iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buffer);
 int iris_destroy_all_internal_buffers(struct iris_inst *inst, u32 plane);
 int iris_destroy_dequeued_internal_buffers(struct iris_inst *inst, u32 plane);
 int iris_alloc_and_queue_persist_bufs(struct iris_inst *inst, enum iris_buffer_type buf_type);
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index e42d17653c2c37f526e6b26c6e29cc45ae29a747..d1114e5ce7788c5e803ac7aec505a6115997eb27 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -442,7 +442,7 @@ static int iris_hfi_gen1_session_unset_buffers(struct iris_inst *inst, struct ir
 
 	ret = iris_wait_for_session_response(inst, false);
 	if (!ret)
-		ret = iris_destroy_internal_buffer(inst, buf);
+		iris_destroy_internal_buffer(inst, buf);
 
 exit:
 	kfree(pkt);
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index 8e19f61bbbf9e427f658471b4502bedb1ad5f616..f5c342f4c926a68b2017006a3c1cfbb251605ae0 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -447,7 +447,9 @@ static int iris_hfi_gen2_handle_release_internal_buffer(struct iris_inst *inst,
 
 	buf->attr &= ~BUF_ATTR_QUEUED;
 
-	return iris_destroy_internal_buffer(inst, buf);
+	iris_destroy_internal_buffer(inst, buf);
+
+	return 0;
 }
 
 static int iris_hfi_gen2_handle_session_stop(struct iris_inst *inst,

-- 
2.34.1


