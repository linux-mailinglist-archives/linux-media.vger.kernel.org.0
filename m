Return-Path: <linux-media+bounces-61692-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLZ+FjQNB2oLrAIAu9opvQ
	(envelope-from <linux-media+bounces-61692-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 14:10:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A251554F30B
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 14:10:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DDD3A31FF635
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 11:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7448D48AE13;
	Fri, 15 May 2026 11:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kfHhh1Jj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QRwv7811"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEBF481FAF
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778845705; cv=none; b=KCDL1773JUuMb50zkQI3Gq6+rARqZ9yzI7yhGXNjFGp8h0yBNXD5tVHMFRvdkXkBoqV9MjZnalibds3ln4K9sye/kBg/aoXL6rKmyVz0K5dpL9KW2/Bvia9r5aJq9kQs7O9oIHNFBwQf7ATEQTZTHfETtIzextDRtihSUCoh6AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778845705; c=relaxed/simple;
	bh=H5gjTCkahlz2x03Clh/PysKqV1bvgbU9MHDzqSGjKm0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q7JSxEwYE3wChoRHARZDO8N6t2RfnCGxg2edFPO7OZClWlNCQ5zyqiG4dwhVEovhNl/rCuBb2M4zKVHtTzPeVSCeNe2f8zvGBaekXrVPt405mJNTqROClelnj0bbSTTGQU1lZIFTPeO27kkQ8ljEwqNJZEx7im/j4/HNimWbP60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kfHhh1Jj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QRwv7811; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBN38q3200273
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:48:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7GXhlm42Lq8jhZpNQbWDnVnjUliqMt9PAaqnfp5/6jw=; b=kfHhh1JjbyhqqyxE
	J3y8s8hxF/o3wnr1p++SDbYzh+/yaK5OOpOXjxzjKXuuanffTPNAl1NUvlErNyx5
	z4SBZodGXgR/CoV+GxSWn7A2R1rVdBk8Oq/f8Q0cw9LWRVONx2KjSr6AkM9kaqP9
	KVxtkWIkHqGUCdEmtsWTdF2mIlyUQauD9VbS7apr/NdlvLQM3eijgpTAUaNUytSw
	fZoA4bYd6/2dKzlopkD+hUqfzFhxwHw4Xcx4k7jffefhtpOJAOTRMlQTs1h5NQz6
	5C6I9bv8UGCW3ULrx9YK61OodJ+c0hEnDQBoe1CgQRX1vDclRaM8I12SxJ9Kt/ua
	zFLQdw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1qu26a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:48:19 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50fbc70cfbdso219427611cf.2
        for <linux-media@vger.kernel.org>; Fri, 15 May 2026 04:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778845698; x=1779450498; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7GXhlm42Lq8jhZpNQbWDnVnjUliqMt9PAaqnfp5/6jw=;
        b=QRwv7811J5Ce2gWxqwj++K8tNKVFm0J+CB+zYeLR4kajSsXtmIkaTt8fV8Dc0eZtMB
         tCP84k+24Y51N72L/y3HR3X0dWUgCS8SOkm21G0kK3BlEnZ/BJWIywyIOrnd1h82MEGd
         Ucnyc+Me54xHcGmrmVncGkYCtwy41hYIwbzgozcFbI7rdJ0Kmg+NkohnCnRYWWwpFjCa
         HwDZ64v4TU/goLpTG1SqY/vevKDZDcaxn4I5uvmClOSwNFL/HlmovljJR00TgLGJPsTI
         K9hCwXWN9vSJRMEjKXYXHhcTi42c1OMUpNDkOw6uWANO8Zn1j1VlDZN7QTAHAh83TvcL
         WTzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778845698; x=1779450498;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7GXhlm42Lq8jhZpNQbWDnVnjUliqMt9PAaqnfp5/6jw=;
        b=nbquOD4XThQeadtPAsRoh5WNl6YXcCfdT5oY0oT3uqIoBfTCmnRib7NAfPSVqdiZbM
         jrQ7CPuAzlTogqWaafbRw2HXN+Ueksd1cjX7JH63A4clXbUL0j+BnZHY4xhg6I8wyGpi
         DlZpjh811X8NHIcIo6v0lBrTggInF+tbyBpqP0yaJtq+yPHnx+nToWMbe6seLyG0l/ux
         NVkWWqOHBZPNfGvAyrx/wy0RymMBY5kbUc6IbG3DaF981MK4oS2XZ3CCFrEp++HpA3nx
         ViFTs/h2MhyAaAzZI/JlLEIvaovBjPU1gDze66+bqfbIwviFpT6ndc6ejRUG00RyAOx4
         uPRA==
X-Gm-Message-State: AOJu0YzytKT16YR6u2qJ14/FbHNf9SKYHMHp1Mnuzj/dMAFI5wQUgPSI
	vw5nnbXbHspwhUilBDqwHWliuTMfpVyYPYyg5e3QCPUDs8obxzJ+ogJBeFye95Fu3igEoYIs2ab
	brxzGy524K2bZWXSB8PvbU+t8WldfrnSKUp13315sd3KFpIswm8faeZSXGR6goEMC7Q==
X-Gm-Gg: Acq92OENAPNY7ISXmBCSbcQPFKLglTssjD/YJ+rz3MjCONlfnGNAoKY6b/t33qNNEkX
	KnPu4YC77s4ToMgGY62UDs728eVjbnO+ttxHl/XDHRSr02fk1YMooHcp1TKipK4OXJh46Rv1AOm
	QkbI7m0qbBHaewTTjE5f4c/M8ZDNsW7dc7x7P5F4eP1GiZZ8jgO9LxpXIPQ2KqnG0Fa460/IL8o
	4XssEc5wGkyWQTBfe4NO2LYNfEpjUYL3LJ8D1Cz3kUGeGf89aPkrSV8Q6LJJxdtw44emYgv3bMJ
	XYU9RDQbKG4KVP1rrgCoRQRO13Eq+4TwJurnNqT6Sr01N5W+8CmIJOaFKZdTfHOrMqnyFG+9pW4
	lYZBrFm6SZhr35JyMZianEfyRsWDMmVUJHbWG88LL11WyMbKLE/XoGan7IZ7+uPDn/hDPmoyRzw
	fpzKZ9GIdinqiGlcLSVzOWhIj0lyDiw5WUa2s=
X-Received: by 2002:ac8:7d0c:0:b0:50d:7cd4:4a6d with SMTP id d75a77b69052e-5165a22c1aemr44326441cf.49.1778845698435;
        Fri, 15 May 2026 04:48:18 -0700 (PDT)
X-Received: by 2002:ac8:7d0c:0:b0:50d:7cd4:4a6d with SMTP id d75a77b69052e-5165a22c1aemr44325911cf.49.1778845697887;
        Fri, 15 May 2026 04:48:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a682sm1265079e87.31.2026.05.15.04.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:48:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:48:04 +0300
Subject: [PATCH v3 05/16] media: iris: add vpu op hook to disable ARP
 buffer
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-iris-ar50lt-v3-5-df3846e74347@oss.qualcomm.com>
References: <20260515-iris-ar50lt-v3-0-df3846e74347@oss.qualcomm.com>
In-Reply-To: <20260515-iris-ar50lt-v3-0-df3846e74347@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3064;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=1XoxNMQkIKQIwreQUtjXXBpaKx8sVaEKHYTsCNEF0Ak=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBwf0vjk6YO4TwvjY68+1/w5EBPeAI2SLFzuAc
 iDZmqPYb+eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagcH9AAKCRCLPIo+Aiko
 1TyWCAClFlyaXfpWYPebKJ+saiHVwdfm+m5VggAzFLAPMm9f2svECaINvdl2p514KGKrBkuQnAW
 LNLdwZc4BVzdvYZMfKpq5HWfFlkZfI9okrDokyxpCHq0tRr9NrkZFxRu+xkD3jdKcTQs+NvmH1n
 CPilCxTqj0ABQcRLFxnwq5JdArGQIhyzN6vU3gNhQA/+xX6XbGCJunZAG+VO12KiO8uIBBj63EW
 SArvuTdKokFU/Q3cJEz/hDhu5omwmw28qOmlSOoNZMXREUTqQ1GrWNgXMKaMHH5+LEG1GQOjwyG
 4yWcYOSr082e/sCycyMEEJ0MR5+anHuTZLKnzFa1VKpE6nZz
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=HbkkiCE8 c=1 sm=1 tr=0 ts=6a070803 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=vdBeo_PM3xCM7oyOFJQA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: TebVCR3zoHb816iXY8yplNR4ivKmdxJW
X-Proofpoint-ORIG-GUID: TebVCR3zoHb816iXY8yplNR4ivKmdxJW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExOSBTYWx0ZWRfX7TK1GmvbY0Ou
 Ui41cnPH5PKunjeUpTQE9/9OAxILkhklx2QnmvSDf0CleHJNTS34NsFEkhlKrlPqI8p5oMe0YRj
 VQntvxecSZGDDC+EMRWufGgsMpvLhUaLav2Fyd3V2QgzJFP0MmI6jQ1wkS3awLcV0adsftlpdCX
 t7M6/d75bMsxBDPS3yWQICfCVG+fd4QeSEZ4+eaN1KLZ3WV26++lHUkTGZeHAcmZO38DvAYIW/h
 DIL/hc65lal6SP9+qf6ZcusCSQyccp5eIn+JLdE7wcENorn8rSc2NrsP/iw0GClLmnVt6G9CIBC
 BEqPynLuOUJdD2ojhHkhGxbTYQW4QOMlTYiS30cFmKvU9Umxf8yvrGGthD5diGwcH/TxzgA8jiK
 5yE2qV9aNPw4vziwAJyEiZbfXbhCgXdriO81U/e1+OrqX3f+QL7AldZH6BVHRgUPxSxII0wNtcc
 7DQqWlsLvQRIntamIHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150119
X-Rspamd-Queue-Id: A251554F30B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61692-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

On AR50LT platforms AbsolutelyPerfectRouting (ARP) needs to be disabled
so firmware can configure the ARP internal buffer as non-secure for
encoder usage. In preparation of adding support for AR50LT platforms,
add an optional disable_arp callback to the VPU ops and invoke it from
core init and resume paths.

No functional change for existing platforms.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.c       | 4 ++++
 drivers/media/platform/qcom/iris/iris_hfi_common.c | 4 ++++
 drivers/media/platform/qcom/iris/iris_vpu_common.h | 1 +
 3 files changed, 9 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
index 52bf56e517f9..bd22076f3557 100644
--- a/drivers/media/platform/qcom/iris/iris_core.c
+++ b/drivers/media/platform/qcom/iris/iris_core.c
@@ -45,6 +45,7 @@ static int iris_wait_for_system_response(struct iris_core *core)
 
 int iris_core_init(struct iris_core *core)
 {
+	const struct vpu_ops *vpu_ops = core->iris_platform_data->vpu_ops;
 	int ret;
 
 	mutex_lock(&core->lock);
@@ -78,6 +79,9 @@ int iris_core_init(struct iris_core *core)
 	if (ret)
 		goto error_unload_fw;
 
+	if (vpu_ops->disable_arp)
+		vpu_ops->disable_arp(core);
+
 	core->iris_firmware_data->init_hfi_ops(core);
 
 	ret = iris_hfi_core_init(core);
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.c b/drivers/media/platform/qcom/iris/iris_hfi_common.c
index 8769ec61f117..8f04f3793d9a 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.c
@@ -144,6 +144,7 @@ int iris_hfi_pm_suspend(struct iris_core *core)
 
 int iris_hfi_pm_resume(struct iris_core *core)
 {
+	const struct vpu_ops *vpu_ops = core->iris_platform_data->vpu_ops;
 	const struct iris_hfi_sys_ops *ops = core->hfi_sys_ops;
 	int ret;
 
@@ -163,6 +164,9 @@ int iris_hfi_pm_resume(struct iris_core *core)
 	if (ret)
 		goto err_suspend_hw;
 
+	if (vpu_ops->disable_arp)
+		vpu_ops->disable_arp(core);
+
 	ret = ops->sys_interframe_powercollapse(core);
 	if (ret)
 		goto err_suspend_hw;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 9151545065cd..71d96921ed37 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -24,6 +24,7 @@ struct vpu_ops {
 	int (*set_hwmode)(struct iris_core *core);
 	void (*set_preset_registers)(struct iris_core *core);
 	void (*interrupt_init)(struct iris_core *core);
+	void (*disable_arp)(struct iris_core *core);
 };
 
 int iris_vpu_boot_firmware(struct iris_core *core);

-- 
2.47.3


