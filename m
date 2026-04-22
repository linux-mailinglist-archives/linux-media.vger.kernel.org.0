Return-Path: <linux-media+bounces-59318-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMoJOf2v6GldOwIAu9opvQ
	(envelope-from <linux-media+bounces-59318-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 13:24:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A92E4453F3
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 13:24:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 274B830DE318
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 11:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E88333CFF6D;
	Wed, 22 Apr 2026 11:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i2zQ4VB/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="czaKztZO"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C41E3CF660
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 11:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776856643; cv=none; b=lYvP8zM971yQfF3cJFQj6A7CstUGZbfVu1Q6SJI8sSIX1GY/3uVnSVM2us8BmbpvXW9U88WQFEYX2joDyPDqj6DsjEC29dZFKgb5aOZYe0kO76gD1cbO4TbHqBWu9Jfepn7l6fESGCxw2AQFDRjTKYLcuqXg2gguZwUXi2o2w9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776856643; c=relaxed/simple;
	bh=Jbh3ewlZURHGfxOIxegETw5Vx0Yr6tndGi7C/P8xCaQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iMvx9YU/szELbbK4NyypqcvVJE8qiQjxjrX3XUuHBd3PxwlU7d7rNJJWlT0M76gKlMFeOwYU2iUgM5SRvMh4hBrEFf1910qN1CDOlliObAfPEUuYf0YRFzp6prgK+7wzKhPaPTC2+eBn3d4FUUq7X6XzauW87NqXmlXlCAkl6ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i2zQ4VB/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=czaKztZO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M5v4SO2209053
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 11:17:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rKFQPgjt7eYtDdi6D75h2wv4cgPqa3Hgwpc1smHTUzY=; b=i2zQ4VB/HX0Tjxyz
	fAHYm4iwcjXu0FQisdj0mQ4EU01nHSXfoK/Q1Fm54NyO8EeTaaoKS9EmH7fL6Yf7
	BgkHIGz1Z8wWPyT5FPwO0+1/jBBofafFVEy+LQ/sy48HyFa0DRI1f5uv3h8Ls/Vm
	mhY6itvR7Eej5jsYCN14PrPushRx0wZmi4dV+9yUo3MDT6NjqRNXVZa2R/vf2BfV
	N2jMk5a2/9a8dMD8D5H64gh18rXd8QU2btyH2P/Kh/mw1zWyX9dNGoGd7UAY3ZaY
	C1rKLppBCAjzYLuBq9DdlhS4A+51gSxE9Ntfhl+5C5OAn70hNpipocR6hpUym/js
	+1cLMQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpengb2p4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 11:17:21 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f9429f49cso6279656b3a.3
        for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 04:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776856640; x=1777461440; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rKFQPgjt7eYtDdi6D75h2wv4cgPqa3Hgwpc1smHTUzY=;
        b=czaKztZOfzmSZrIjaFQhB1gvj/LrnkOQz90VAhgvGPZ7xd0f8pBk0uvxDfUAbI3/FI
         PDHpUM7FW+rL+K5I+dgeC8MA82Tb/ABDfRC0DHMrZusxrAt7olQR8OT9ZFftIPV4s6zL
         6q4Xgm7zKQKNfGndSHxfXIoqFf0DVOjp9ZEKp82QQBAo7mVtzxHuv807ztbDSchiYD9F
         cTbxKXVeiih2DVJX+Q/ghUTA2+W8dhT+kr59o10Xpli+AwKMj7A9DEFyZuoSyu/ZI6s9
         huAGOuoqIjR27BcFvqgIMwycQKWNVQrG6fXzi9bnRk+iTH24BHdwjZp4ttD69TwkvGkc
         D1Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776856640; x=1777461440;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rKFQPgjt7eYtDdi6D75h2wv4cgPqa3Hgwpc1smHTUzY=;
        b=HNQd8Kc6PzjSnE+IWuv47xPYxGF5wgtibuXZDaM/JHZCkutrVc8zujdEVWUJytz97h
         35NtEsz1GL5cFj+MtHsnVf5LhXOXHAPXEUObtuTjn9zd/9DeSIvRMI72syaDGWYj36aV
         DJ3jQd536kZYzQywgUqFLyyyNqL6HjnJX+WtFvQGIEPJwYUe65ea8A5w+Ycc5sYM6c6J
         tN46EkrRliWhJpDWLBK3llDMZgSj4cwW9yUt4N3VvdHfrlotMkUVkySx7oeKlBNFo3P8
         N8pqAXEvy7UwHo7BxhS182Y+IXlG6pzyE63bAWbISQVCPwVWmmkFB/m3cuMvR3oLin4P
         5n8g==
X-Gm-Message-State: AOJu0YysTPU2TDUoIBXQe/Mo30lUDsXokc/fGiCtST0ay7QCxuCS8jpF
	W19mydyfr8eMKaNnjPMZsdqfOnObiW8+CJCpUPeIGa7T3NCN4SM2jT4rfWAJ89eLYXFZ5DwUt0T
	WmzbVzAyMISFPPC4YDZcRqYvw/3Chy1scbNcKnlfXhGj4w0u1uBFr0fHKGtxX7gNjvg==
X-Gm-Gg: AeBDieuEq6yi889xsXOK+7pWh66zX32lA07BhFCEK3cGw1GeJ7YFqux/8o5YSXMW0Y9
	Kw08eFhT0j8iJwQJRehoWwoSypaUiEbGh22h7jEsPhFoHculvYHRPpdk+MdSohBCNniusLfLNMh
	c71hzqF9N7u2pCqC9mc3/crp8p7CCCLlrNdJY2Hbl5HLaKfEjdoqXhfba46vZ38IJ+mTgKtXjVi
	xNZmeb5xZgOg043fMGxa/1Xh7rWowrLLaam8XA47YrBaTKEsF6cAgrNAl6X1ekQDUn8JUmAY91h
	7LE1kvXo+uKAe9axQNF4sPd+eBqASlt9lQWbtl8Pr/pGpBJgwsgdirX8cTyHJV6xsYYzJJmGtE/
	04OBA6be6H4aWezvsjh/QThZyDXovIBC5Ci97sHTMjOD7wIDZ7yq+E0Nh7lplTfoSl82Gdg==
X-Received: by 2002:a05:6a00:4b54:b0:82f:6e39:d90f with SMTP id d2e1a72fcca58-82f8c93d102mr22724204b3a.39.1776856640115;
        Wed, 22 Apr 2026 04:17:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b54:b0:82f:6e39:d90f with SMTP id d2e1a72fcca58-82f8c93d102mr22724164b3a.39.1776856639622;
        Wed, 22 Apr 2026 04:17:19 -0700 (PDT)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe901csm21100782b3a.48.2026.04.22.04.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 04:17:19 -0700 (PDT)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 16:46:40 +0530
Subject: [PATCH 7/7] media: qcom: iris: Make iris_destroy_internal_buffer()
 return void
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-iris-code-improvement-v1-7-8e150482212d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776856606; l=5103;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=Jbh3ewlZURHGfxOIxegETw5Vx0Yr6tndGi7C/P8xCaQ=;
 b=vhCvl9BVSmEHYFqdsKw/GzOArLPagrdO8KKMygn95x01akdnU5vkj8fZp9z/Ht4AphpqHiu6F
 GlzczV/0n8xADfCdqbKk70jFtL/kiqsq2AT/w8bl8uz/dUuFRen4LsK
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEwOCBTYWx0ZWRfXy23CXA2SEPmK
 VZ8tw3bnezwBOJfq9PlUYapIfmh/J1QxySlf4tHIrsCsfaEi3Uza5opsJNud3E0iehK/86zKpUI
 KTTLvBPrxOzqsT5rLOEi0ogf4Mkkc8BXmrvPTfIkvFHvwsJoNyS9Fo/AsZC6e2S9u0FHnLJD4bI
 p/GibLWXkZs3zyF5g7GzpGskb64384lXIixaPYbLKfbppmzonTS3/b6DVyEL1oHK3b+HLWYljzf
 CVuxrTWPRRGxAmfkMtXgBLd1BNcjvDPe02S+Zlp2FLVzTdoKRTmcl7GKybY3dLHKPuyCKbtVUiq
 els8USRIS8CljVa1DVgZtDqpPSs4TMXYA7UKw1PPkt/anreBxYZstNpGQYhYMUerN4+wrTaovPu
 CmNbcCJG5jH1oi0M56ZPxxyg6UIrVZ+rgTpIGa67ZAUeWLbv3AAx50RbxYXret03OW65PFPAA/C
 L47iXJ3jndu0xtn30AA==
X-Proofpoint-ORIG-GUID: WxAShH5GcyCudNJL6DFkjl7U-3AzjGLJ
X-Authority-Analysis: v=2.4 cv=RYygzVtv c=1 sm=1 tr=0 ts=69e8ae41 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=U2F47QYUfY1_dUrEBYAA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: WxAShH5GcyCudNJL6DFkjl7U-3AzjGLJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220108
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59318-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: 4A92E4453F3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

iris_destroy_internal_buffer() is guaranteed to succeed and never
reports an error. Returning an int is misleading and forces callers to
handle a meaningless status value. Convert it to return void to match
its behavior and simplify callers.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c           | 16 ++++------------
 drivers/media/platform/qcom/iris/iris_buffer.h           |  2 +-
 drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c |  2 +-
 .../media/platform/qcom/iris/iris_hfi_gen2_response.c    |  4 +++-
 4 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index 137a69c99bcc24a72f4f27e516b8fb4d6509c0ad..2da0498843595d3071040d45f1e605f8814f87a2 100644
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


