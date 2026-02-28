Return-Path: <linux-media+bounces-53820-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id b+ApFGOoomkn4wQAu9opvQ
	(envelope-from <linux-media+bounces-53820-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 09:33:39 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0B71C1689
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 09:33:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EFB39319FD08
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 08:29:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAC843E95AD;
	Sat, 28 Feb 2026 08:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cGUp3WZy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E+SFQZPi"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3987E3EBF03
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 08:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772267354; cv=none; b=sLO5XcwOA+OkykNqodiAkJcRpRtgsxYUf1TN6ON5/WmlNiJWgvVA8S1l8ZlUmZHwVpUlp44wE6KvvY5TquXuYkJkKr5zWZuaiCj+URBLr7s/FPXhuOwMZiAu8R30qX/5Qbe0fqV/J/0L/8V0AGNTCUwNA0Dqc+48yCTsy8f4/o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772267354; c=relaxed/simple;
	bh=nPWlbPRwsXZVfwQmKm3wZD8OkNXC6N8lxinghO/HpnU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oaSQPDoTiMQ3lZJlCCaBhuCPOosNybKJtGFbKo86j3k7h9byB8Bw8cCCJyCT69BIjw0ktOq13rZmAKhuYWVbgsP8i1lhJvY7PvNVK//Qn49wBmRGBg1hIVD0HkjlT5D2xn84kj0MPbMbOBmdC69xaQnwyxsDG7s1uXjw0zIlAic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cGUp3WZy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E+SFQZPi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61S6NtTG951872
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 08:29:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a8vVHLs9G2VfYXiJO1fa6c8sJ/CO/xLj0FBiqoOTKWk=; b=cGUp3WZyXE0gQTcA
	DCdbQV7f9pC3aQu7YLYbOPUhSGl3edBDjvHawFf84tm2dHmBd41CqVOqxeT/rdlW
	f1l7QPcGNGCSvSyDNP46CN+c+IvT2mLq1F2PKC3Ki6LSPrIfH7voNC2FLrlUlMLi
	3ZwTQzfK1/Afaji3AlFS47QmOzVj4gA4NlWcSBWYhDvnjSsFPk41x0EZOR14sVWi
	1bW5HGGVbbcraCOHZOEeF5YogdI8CFJDkdfd0PHFszBRIni6Sia2cUSwzAqD1hwK
	QXbcmkv+gjYfRXiMqU6k9mqh70GS+CJHLDJWI9w+eC2Rc4Mj9bb3XZvinihKeQEy
	MFq8eg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksn40h5x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 08:29:11 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-506ab115571so252106581cf.0
        for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 00:29:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772267350; x=1772872150; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a8vVHLs9G2VfYXiJO1fa6c8sJ/CO/xLj0FBiqoOTKWk=;
        b=E+SFQZPi/gODwrpUe2JJz94iLf7Do5E0gxAp2O3dq8AqkRMfEWuy19d59xho+R+lqa
         TtEedx/Uv5T5FLWX9pND2SytMcpPklGsaFLT7ZD0lDXzGP8a76LiP36A3qnpOvmHBi7m
         3hcUTtR9skfQGYBx8QPCmWSU/bHMLfC9voPm6twv05l1EGd9blFdxQ3TWgHjkAHW5Hh/
         R+kBQPvMk90dfA5h/J/JgA+KjzMtzbOE2Ku8XHYEwuHAITWvAmOWPTW5VKCUDyYbmQsY
         ABvA5KYkAFdYr0QdITry0bEUooJ99wJiUIgFLqdm31QDfnuYH4dC7ml7q6QcNBIZyNnA
         Tvcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772267350; x=1772872150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a8vVHLs9G2VfYXiJO1fa6c8sJ/CO/xLj0FBiqoOTKWk=;
        b=vMjSU4PTYrsi8t1tpqbZ+EIm4uyef2FDhf3yvunqqxdcZkxraSgpXeL83or5BglZpm
         Objd+osrM1nzpyS0SKaXhsFbUXScqxy3bRPQV59xbjMw/tYM8LG5Tm3PNmPoD6xmqtbv
         +bblEiiH/MkIaQyaXz3XhrjGZAQl8M9u5Gyn9Zr4Og9ZjHTU6lZdromgwQtQ5uGWBTU5
         0zB7KLzGO3kdY6usyNbRVPqQdbLnPp4gAamVr3i6GY1nQeqRsKIIjHe9kTttbs4y75qU
         jweovD7UQEiPIoTYlb7ZsI4xGwyLU6b2SzIJhndNmCfwiLdmMYcAA7y1LGqtstH8jW1a
         a6Rg==
X-Gm-Message-State: AOJu0Yzv01lkXniE8A5Uwynz2AT+RvtCzWmywJE1xKaEC5zcGtxL1Oxl
	QIhhnCczU8WaNgSGhGtksYyiG0piU1s9FQgwsK+/6GmynGFCFhZmi1eeFI2lMVjvEvrVJk93ccz
	HY5L+4iL/k6ViM6YDvwmKxX67KGf96UqFWMMXcDJjdKoO48xAFwCmnzSsPBK7fBfEvQ==
X-Gm-Gg: ATEYQzyEVSpDUizznSd18eqQoHG/wDo0PhOYzdIDoqVtuSiIjLCmMxO30EaFxYh6Gma
	8IvMeyzhWgURc79SrLjrOksypvbZBHzND3j8EzlfVxuynTjGp9ghLeByR5h6OhTnMMPVwmwhzQr
	QCv1zu5xBVSHnNQPWg+t3APKiphfEjGHnVCCeneQuZPUBlH+J1T1aCFDPcGcXOsQ4hzCXDJeCRQ
	2FCJbdAmikE0t6IJ0lGHynXHSLAdV92dg4dGPuXkFjqEL1WyGudgvz9w3gt0YUzNEH/aNwHP+kX
	jRWDGgKMuTr7p6GHQRM0dMRR3bjMavlIzUqD0jkjm1puteKiUXilM3//OvncGSYlZZhmA41y7Sc
	I7BS1bKz8unIM1e1wHUoAq3wB5WmVANlV2LLLSaDOySBR4JB1Ms3Snr9IRdL2VYBrc0fObp3jxp
	p9njnuocRVBFKTqbwQI7kah1Wofxq0LyBLXaQ=
X-Received: by 2002:a05:620a:1905:b0:8cb:b22c:90f8 with SMTP id af79cd13be357-8cbc8de8614mr733235485a.49.1772267350177;
        Sat, 28 Feb 2026 00:29:10 -0800 (PST)
X-Received: by 2002:a05:620a:1905:b0:8cb:b22c:90f8 with SMTP id af79cd13be357-8cbc8de8614mr733234085a.49.1772267349652;
        Sat, 28 Feb 2026 00:29:09 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f2f4b158sm17970711fa.6.2026.02.28.00.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 00:29:07 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 28 Feb 2026 10:28:52 +0200
Subject: [PATCH 07/11] media: qcom: iris: split HFI session ops from core
 ops
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260228-iris-platform-data-v1-7-c2c53539f948@oss.qualcomm.com>
References: <20260228-iris-platform-data-v1-0-c2c53539f948@oss.qualcomm.com>
In-Reply-To: <20260228-iris-platform-data-v1-0-c2c53539f948@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=23213;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=nPWlbPRwsXZVfwQmKm3wZD8OkNXC6N8lxinghO/HpnU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpoqdA1vg89LxwCBfBr9WrmMyIs6ZtVptniqTfE
 akv+HEea5GJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaaKnQAAKCRCLPIo+Aiko
 1QnbB/4uWziJ4UYeFr10goVdkbweV5Uah1ENFJR5l3Fmc+xYEsjNa1igvLPdQnSuhtzxx2D1t0w
 kvrXndNCB5FGFDxQdd5cKRgSvVJEtqnvV+oUt0h4Um1U6+oOyHamnx3xSB/BzM458kVz/yXvEsA
 qE+37vSR4i6ev/lqfmQ9FHVjdnvApc0HkQdyCxJS0a3gRntI++7k6imWxUZE5u59D481NgOg8vK
 mGmrMbhZssBqjfupaLcsQme+Yt/52ZNbbqrf9Pjr9TpRt8jV3gQu9nhfexpGytuoQqoU+kLaoS4
 aTIlM69sOOMPyBnW8JSQWcI45smrVWduLG5brvovSt3oTcHd
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Tq3rRTXh c=1 sm=1 tr=0 ts=69a2a757 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=47BYzmHmuV1SJ7SkGigA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: dDqndF-qJk9Jidwp1xOJnBnoisC0NKUQ
X-Proofpoint-GUID: dDqndF-qJk9Jidwp1xOJnBnoisC0NKUQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDA3NyBTYWx0ZWRfX58aVbuJBQFU3
 wn9eLaziiqpZoEQlLASsQ2ptSbE+OuSm8SEK66GPWvj8kXUfMoPkvHhxylb7apZxmHnJQfzJlEh
 GDPWuWiJlqYOrUMWnB/ifVB3Flip6KgQPxBJ7ph/Ol8NHYevUC6FcLUSFQfpGxoo3T6wW+e851w
 AM2OGA+dI691tf+6Pr/QLALF5RXHhOrDi+qtvd6vo/gbCxDQIikmQSV8ATRfLBtK9o0RT+uv5sk
 nMaBnpWk22t3+ejYCiG1AGYQahDTTg+IDEO4nY5Zo1k0Jm9Kkmdjkp1+NY1UKn+cTUfO9knEEqa
 ggYWezU2wr4B2P63xUXnkDj93FArd8KH9HEQuHr9ymT+BJywVr3iDoiL2iYnJ7H6Q5xVoWcFRf1
 oJqJbCbX3l+yUoIpQwjLGvUjZO/zoQEyWg2t1EVd7sWXR6meV2RMvPoJUrsPOr91fBy591qGI5Y
 mxP1isk4ZAnznbYoC7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602280077
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53820-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 9E0B71C1689
X-Rspamd-Action: no action

Calling HFI instance-specific ops should not require double indirection
through the core ops. Split instance-specific ops to a separate struct,
keep a pointer to it in struct iris_inst and set it directly in the
get_instance function.

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
index 9151f43bc6b9..915096b21279 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -404,7 +404,7 @@ int iris_create_internal_buffers(struct iris_inst *inst, u32 plane)
 
 int iris_queue_buffer(struct iris_inst *inst, struct iris_buffer *buf)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
 	int ret;
 
 	ret = hfi_ops->session_queue_buf(inst, buf);
@@ -572,7 +572,7 @@ int iris_destroy_dequeued_internal_buffers(struct iris_inst *inst, u32 plane)
 static int iris_release_internal_buffers(struct iris_inst *inst,
 					 enum iris_buffer_type buffer_type)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
 	struct iris_buffers *buffers = &inst->buffers[buffer_type];
 	struct iris_buffer *buffer, *next;
 	int ret;
diff --git a/drivers/media/platform/qcom/iris/iris_common.c b/drivers/media/platform/qcom/iris/iris_common.c
index 7f1c7fe144f7..69748e5764f3 100644
--- a/drivers/media/platform/qcom/iris/iris_common.c
+++ b/drivers/media/platform/qcom/iris/iris_common.c
@@ -48,7 +48,7 @@ void iris_set_ts_metadata(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
 
 int iris_process_streamon_input(struct iris_inst *inst)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
 	enum iris_inst_sub_state set_sub_state = 0;
 	int ret;
 
@@ -90,7 +90,7 @@ int iris_process_streamon_input(struct iris_inst *inst)
 
 int iris_process_streamon_output(struct iris_inst *inst)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
 	enum iris_inst_sub_state clear_sub_state = 0;
 	bool drain_active, drc_active, first_ipsc;
 	int ret = 0;
@@ -189,7 +189,7 @@ static void iris_flush_deferred_buffers(struct iris_inst *inst,
 
 static void iris_kill_session(struct iris_inst *inst)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
 
 	if (!inst->session_id)
 		return;
@@ -200,7 +200,7 @@ static void iris_kill_session(struct iris_inst *inst)
 
 int iris_session_streamoff(struct iris_inst *inst, u32 plane)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
 	enum iris_buffer_type buffer_type;
 	int ret;
 
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 3cec957580f5..f5032c5eb5a5 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -399,7 +399,7 @@ static u32 iris_get_port_info(struct iris_inst *inst,
 
 int iris_set_u32_enum(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
 	u32 hfi_value = inst->fw_caps[cap_id].value;
 	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
 
@@ -412,7 +412,7 @@ int iris_set_u32_enum(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
 
 int iris_set_u32(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
 	u32 hfi_value = inst->fw_caps[cap_id].value;
 	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
 
@@ -425,7 +425,7 @@ int iris_set_u32(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 
 int iris_set_stage(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
 	struct v4l2_format *inp_f = inst->fmt_src;
 	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
 	u32 height = inp_f->fmt.pix_mp.height;
@@ -446,7 +446,7 @@ int iris_set_stage(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id
 
 int iris_set_pipe(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
 	u32 work_route = inst->fw_caps[PIPE].value;
 	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
 
@@ -459,7 +459,7 @@ int iris_set_pipe(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 
 int iris_set_profile(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
 	u32 hfi_id, hfi_value;
 
 	if (inst->codec == V4L2_PIX_FMT_H264) {
@@ -479,7 +479,7 @@ int iris_set_profile(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_
 
 int iris_set_level(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
 	u32 hfi_id, hfi_value;
 
 	if (inst->codec == V4L2_PIX_FMT_H264) {
@@ -499,7 +499,7 @@ int iris_set_level(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id
 
 int iris_set_profile_level_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
 	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
 	struct hfi_profile_level pl;
 
@@ -520,7 +520,7 @@ int iris_set_profile_level_gen1(struct iris_inst *inst, enum platform_inst_fw_ca
 
 int iris_set_header_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
 	u32 header_mode = inst->fw_caps[cap_id].value;
 	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
 	u32 hfi_val;
@@ -539,7 +539,7 @@ int iris_set_header_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_
 
 int iris_set_header_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
 	u32 prepend_sps_pps = inst->fw_caps[PREPEND_SPSPPS_TO_IDR].value;
 	u32 header_mode = inst->fw_caps[cap_id].value;
 	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
@@ -561,7 +561,7 @@ int iris_set_header_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_
 
 int iris_set_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
 	u32 entropy_mode = inst->fw_caps[ENTROPY_MODE].value;
 	u32 bitrate = inst->fw_caps[cap_id].value;
 	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
@@ -586,7 +586,7 @@ int iris_set_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_
 
 int iris_set_peak_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
 	u32 rc_mode = inst->fw_caps[BITRATE_MODE].value;
 	u32 peak_bitrate = inst->fw_caps[cap_id].value;
 	u32 bitrate = inst->fw_caps[BITRATE].value;
@@ -613,7 +613,7 @@ int iris_set_peak_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type
 
 int iris_set_bitrate_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
 	u32 bitrate_mode = inst->fw_caps[BITRATE_MODE].value;
 	u32 frame_rc = inst->fw_caps[FRAME_RC_ENABLE].value;
 	u32 frame_skip = inst->fw_caps[FRAME_SKIP_MODE].value;
@@ -640,7 +640,7 @@ int iris_set_bitrate_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap
 
 int iris_set_bitrate_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
 	u32 bitrate_mode = inst->fw_caps[BITRATE_MODE].value;
 	u32 frame_rc = inst->fw_caps[FRAME_RC_ENABLE].value;
 	u32 frame_skip = inst->fw_caps[FRAME_SKIP_MODE].value;
@@ -667,7 +667,7 @@ int iris_set_bitrate_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap
 
 int iris_set_entropy_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
 	u32 entropy_mode = inst->fw_caps[cap_id].value;
 	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
 	u32 hfi_val;
@@ -687,7 +687,7 @@ int iris_set_entropy_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap
 
 int iris_set_entropy_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
 	u32 entropy_mode = inst->fw_caps[cap_id].value;
 	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
 	u32 profile;
@@ -712,7 +712,7 @@ int iris_set_entropy_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap
 
 int iris_set_min_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
 	u32 i_qp_enable = 0, p_qp_enable = 0, b_qp_enable = 0;
 	u32 i_frame_qp = 0, p_frame_qp = 0, b_frame_qp = 0;
 	u32 min_qp_enable = 0, client_qp_enable = 0;
@@ -776,7 +776,7 @@ int iris_set_min_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_i
 
 int iris_set_max_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
 	u32 i_qp_enable = 0, p_qp_enable = 0, b_qp_enable = 0;
 	u32 max_qp_enable = 0, client_qp_enable;
 	u32 i_frame_qp, p_frame_qp, b_frame_qp;
@@ -841,7 +841,7 @@ int iris_set_max_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_i
 
 int iris_set_frame_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
 	u32 i_qp_enable = 0, p_qp_enable = 0, b_qp_enable = 0, client_qp_enable;
 	u32 i_frame_qp, p_frame_qp, b_frame_qp;
 	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
@@ -902,7 +902,7 @@ int iris_set_frame_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
 
 int iris_set_qp_range(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
 	struct hfi_quantization_range_v2 range;
 	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
 
@@ -923,7 +923,7 @@ int iris_set_qp_range(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
 
 int iris_set_rotation(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
 	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
 	u32 hfi_val;
 
@@ -953,7 +953,7 @@ int iris_set_rotation(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
 
 int iris_set_flip(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
 	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
 	u32 hfi_val = HFI_DISABLE_FLIP;
 
@@ -972,7 +972,7 @@ int iris_set_flip(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 
 int iris_set_ir_period(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
 	struct vb2_queue *q = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
 	u32 ir_period = inst->fw_caps[cap_id].value;
 	u32 ir_type = 0;
@@ -998,7 +998,7 @@ int iris_set_ir_period(struct iris_inst *inst, enum platform_inst_fw_cap_type ca
 
 int iris_set_properties(struct iris_inst *inst, u32 plane)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
 	struct platform_inst_fw_cap *cap;
 	int ret;
 	u32 i;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
index 3edb5ae582b4..4f26b010249a 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
@@ -110,6 +110,9 @@ struct iris_hfi_command_ops {
 	int (*sys_image_version)(struct iris_core *core);
 	int (*sys_interframe_powercollapse)(struct iris_core *core);
 	int (*sys_pc_prep)(struct iris_core *core);
+};
+
+struct iris_hfi_inst_ops {
 	int (*session_set_config_params)(struct iris_inst *inst, u32 plane);
 	int (*session_set_property)(struct iris_inst *inst,
 				    u32 packet_type, u32 flag, u32 plane, u32 payload_type,
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index b7aafda1d99e..fde8219309b0 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -1015,11 +1015,7 @@ static int iris_hfi_gen1_session_set_config_params(struct iris_inst *inst, u32 p
 	return ret;
 }
 
-static const struct iris_hfi_command_ops iris_hfi_gen1_command_ops = {
-	.sys_init = iris_hfi_gen1_sys_init,
-	.sys_image_version = iris_hfi_gen1_sys_image_version,
-	.sys_interframe_powercollapse = iris_hfi_gen1_sys_interframe_powercollapse,
-	.sys_pc_prep = iris_hfi_gen1_sys_pc_prep,
+static const struct iris_hfi_inst_ops iris_hfi_gen1_inst_ops = {
 	.session_open = iris_hfi_gen1_session_open,
 	.session_set_config_params = iris_hfi_gen1_session_set_config_params,
 	.session_set_property = iris_hfi_gen1_session_set_property,
@@ -1032,6 +1028,13 @@ static const struct iris_hfi_command_ops iris_hfi_gen1_command_ops = {
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
@@ -1039,5 +1042,13 @@ void iris_hfi_gen1_command_ops_init(struct iris_core *core)
 
 struct iris_inst *iris_hfi_gen1_get_instance(void)
 {
-	return kzalloc_obj(struct iris_inst);
+	struct iris_inst *out;
+
+	out = kzalloc_obj(*out);
+	if (!out)
+		return NULL;
+
+	out->hfi_ops = &iris_hfi_gen1_inst_ops;
+
+	return out;
 }
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 93ce7ac3a19c..502767f1593d 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -1390,11 +1390,7 @@ static int iris_hfi_gen2_session_release_buffer(struct iris_inst *inst, struct i
 					inst_hfi_gen2->packet->size);
 }
 
-static const struct iris_hfi_command_ops iris_hfi_gen2_command_ops = {
-	.sys_init = iris_hfi_gen2_sys_init,
-	.sys_image_version = iris_hfi_gen2_sys_image_version,
-	.sys_interframe_powercollapse = iris_hfi_gen2_sys_interframe_powercollapse,
-	.sys_pc_prep = iris_hfi_gen2_sys_pc_prep,
+static const struct iris_hfi_inst_ops iris_hfi_gen2_inst_ops = {
 	.session_open = iris_hfi_gen2_session_open,
 	.session_set_config_params = iris_hfi_gen2_session_set_config_params,
 	.session_set_property = iris_hfi_gen2_session_set_property,
@@ -1409,6 +1405,13 @@ static const struct iris_hfi_command_ops iris_hfi_gen2_command_ops = {
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
@@ -1420,6 +1423,10 @@ struct iris_inst *iris_hfi_gen2_get_instance(void)
 
 	/* The allocation is intentionally larger than struct iris_inst. */
 	out = kzalloc_obj(*out);
+	if (!out)
+		return NULL;
+
+	out->inst.hfi_ops = &iris_hfi_gen2_inst_ops;
 
 	return &out->inst;
 }
diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index 16965150f427..c58e8ec24c62 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -15,6 +15,8 @@
 #define DEFAULT_WIDTH 320
 #define DEFAULT_HEIGHT 240
 
+struct iris_hfi_inst_ops;
+
 enum iris_fmt_type_out {
 	IRIS_FMT_H264,
 	IRIS_FMT_HEVC,
@@ -38,6 +40,7 @@ struct iris_fmt {
  * @list: used for attach an instance to the core
  * @core: pointer to core structure
  * @session_id: id of current video session
+ * @hfi_ops: iris HFI instance ops
  * @ctx_q_lock: lock to serialize queues related ioctls
  * @lock: lock to seralise forward and reverse threads
  * @fh: reference of v4l2 file handler
@@ -80,6 +83,7 @@ struct iris_inst {
 	struct list_head		list;
 	struct iris_core		*core;
 	u32				session_id;
+	const struct iris_hfi_inst_ops	*hfi_ops;
 	struct mutex			ctx_q_lock;/* lock to serialize queues related ioctls */
 	struct mutex			lock; /* lock to serialize forward and reverse threads */
 	struct v4l2_fh			fh;
diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
index bf0b8400996e..104910419dd1 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.c
+++ b/drivers/media/platform/qcom/iris/iris_vb2.c
@@ -129,7 +129,7 @@ int iris_vb2_queue_setup(struct vb2_queue *q,
 	if (!inst->once_per_session_set) {
 		inst->once_per_session_set = true;
 
-		ret = core->hfi_ops->session_open(inst);
+		ret = inst->hfi_ops->session_open(inst);
 		if (ret) {
 			ret = -EINVAL;
 			dev_err(core->dev, "session open failed\n");
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 719217399a30..a48771687c10 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -374,7 +374,7 @@ int iris_vdec_streamon_input(struct iris_inst *inst)
 
 int iris_vdec_streamon_output(struct iris_inst *inst)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
 	int ret;
 
 	ret = hfi_ops->session_set_config_params(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
@@ -434,7 +434,7 @@ int iris_vdec_qbuf(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
 
 int iris_vdec_start_cmd(struct iris_inst *inst)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
 	enum iris_inst_sub_state clear_sub_state = 0;
 	struct vb2_queue *dst_vq;
 	int ret;
@@ -497,7 +497,7 @@ int iris_vdec_start_cmd(struct iris_inst *inst)
 
 int iris_vdec_stop_cmd(struct iris_inst *inst)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
 	int ret;
 
 	ret = hfi_ops->session_drain(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index aa27b22704eb..ffa7d5a91d15 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -581,7 +581,7 @@ int iris_venc_qbuf(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
 
 int iris_venc_start_cmd(struct iris_inst *inst)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
 	enum iris_inst_sub_state clear_sub_state = 0;
 	struct vb2_queue *dst_vq;
 	int ret;
@@ -623,7 +623,7 @@ int iris_venc_start_cmd(struct iris_inst *inst)
 
 int iris_venc_stop_cmd(struct iris_inst *inst)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
 	int ret;
 
 	ret = hfi_ops->session_drain(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index bd38d84c9cc7..eddf2694e759 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -224,7 +224,7 @@ int iris_open(struct file *filp)
 
 static void iris_session_close(struct iris_inst *inst)
 {
-	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
 	bool wait_for_response = true;
 	int ret;
 

-- 
2.47.3


