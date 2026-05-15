Return-Path: <linux-media+bounces-61689-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AA7kJkYSB2rgrQIAu9opvQ
	(envelope-from <linux-media+bounces-61689-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 14:32:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBC654F9CB
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 14:32:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 704CB30EAF0B
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 11:51:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90DF9481FD6;
	Fri, 15 May 2026 11:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fuaoj0Vj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WFScml7/"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75CC48032F
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778845701; cv=none; b=l4YaTWrvAVVSGeHzVqt/inAczx2o1GmrkuKiV8apF+zdyHL72BGy+cY+HSyZllqTVR+nXi2HfsrKgg0sAIGMIkbwJPekVs/fAerTuffStTNRbPxdC9RA9JVposUOA581U5oY43I46o1HMQJSGcrRxGKlUYCaWL8SCP/VVGaIohw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778845701; c=relaxed/simple;
	bh=U1WEKcOZrCsXwGbYO3VwEdQBYlx1VxXoS7cDYZcOMmw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l/g0vMTSQ/5XEKXSWfZG5ixzjI5w1d2jbdNWvWbVr/Ia3cOrEnCcrkC/soAPrKI1NzORQakRAmAdTJ1+zPSJeYu/CVle3xHhvBVF+8zNv0FX8D2OETfGNj7/jQbmyYgFi/iAS3xOgpBvP0bAhoZiB7z5/55SQi/Ke9hy48ZE63M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fuaoj0Vj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WFScml7/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBIV9R4008297
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:48:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1UnaLeEw8V9nK1L0PWkD7aEDJHTMmpFjiinW5YLXPuY=; b=Fuaoj0VjJsLnCtKI
	uEVz5BrMPbM66W/D+Qc3/EtBTnRmzH6J8FiLJH0r2G3azUl4lC94a9sLJtHtbogy
	r6COYRNKHr/7d7IquKp0cw6EBo/Thl1/d8ygpnVptXUEGn8D+gK8sIYygkC7fjgJ
	EPnHW5620N9L9fTl7js9puRSxvUk7YW0Wz4w/lpBDcQ9rhc2q4CVpa9p68N4VOEi
	faakD5pYHC0GoO999im5vSJE0rVj5fBoes/rzdt4mdtb9WXlHdHIivvCTbzhJnfU
	YfDhXaYga0Xgilkp2DTula3q6VYbDdI1tfpYQMGKx03+v/thNifMOUwTBza+5zeA
	EGVvAQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1su4cc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:48:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-514551d5f2aso250573361cf.2
        for <linux-media@vger.kernel.org>; Fri, 15 May 2026 04:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778845694; x=1779450494; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1UnaLeEw8V9nK1L0PWkD7aEDJHTMmpFjiinW5YLXPuY=;
        b=WFScml7/LNs/YWivu1pkWihQmR8+12jv1boa7ONkm07apGYOaxPkWMOIQ5uKo1HFkc
         GCnNJ6JPTqx7+vC2CvBwpjtwAuW95MrHrPClLwFG1pe3u8aipNOmO/tkDTIVoxSMxQjG
         zkWxXQKJXcvvfFKas+hN31CEk9kIuhFSW4PKBLXUTa5c41fri9hKSktG/pIb4IHKv+rN
         lk+9yzrNJtN+Dz0WEJMqzIKjcSI7bhLZQMjNU/VUbFwpp0n++GlZ4AeTqm2obgP0Szdw
         U9SO/u01ix5DtT7Dl4PU2UZYqxxCH6h9Jt+73gK/FR+LPHufZb3RE51YGsZQlgWHMHLe
         0XIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778845694; x=1779450494;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1UnaLeEw8V9nK1L0PWkD7aEDJHTMmpFjiinW5YLXPuY=;
        b=AOCdyWf7pwY/PXzsZuUuyfVLVnT9sX0iH/YVji8tFExRtkU6PNINGY7O2Ze8gh/v7A
         bJYC+cOo1pjNAOy9ZcLrj5El7Z2BgVURbGQ43htuXzT3hRT1I+ZxDFTR2OoSDcaOwTxc
         ljn5cAP8iHFtlyksc/IsF+8vJWDJ9UoKC++lqfFFemyjpd3IrKC0jiKo5PHOI3iAkBxA
         VILMkyyb+QkTeAHoivW6QLqgoiAcyKbJHyqbd7VVOndoRCo2WnxOqoo8inJqFh8hU9pC
         8zDRAwo0nRWeZx7d6J9o+tt4ZOU0PUznp44ZDRXtxZcUVukzBEIAyVoWrafrNHRdfJC5
         ku3w==
X-Gm-Message-State: AOJu0YyK7gYR7zjJ7E9gLzFTOgvpeBh2EMDRfo3NGyXJmZiWIKu1fKCK
	2FjGwkZND7yux4ZMFm9mWWr+9qJayPeroVsBujI96FdERcGsG0xhBpciAxtdpNn6FTEncAEHZGr
	kXqTDQ/wY0umKVxie2Ej1Pktj9sEWIDI5DIPmkyA6xji5AnhB16FzKU5Wd71kXVvdTA==
X-Gm-Gg: Acq92OH4hkwmHKC+8sN4otoh+fQvp5gck82y1j8I0HzdbcEm+BxL6vHGTXb0OM1Tzxr
	90llUTQhk7+xC6nemhrJQSwh5p2wlgS2rqt6o9ux42+1dV2JQ8IQp4pMrRxGHwd6CBSpXQvT/Lz
	qcF0YiPw/kEzkgbwpxxy9vhAa7OogCRJH3L6sbW6RuCTUvIs7kxAS5yUPfDj0tJO/1S9AO7YFgL
	gbKWgz1NPKPPE918gBbsQWt7b7zpO1rFosnr5Dd7OknHD4E5kOOuqGbnxXtAhqJ1MosFD31jO0E
	ML+AasowxORBkOjFJ+nyn5V6rL9RLw6ozFXgE7KkVvVsbxdygAjGGNeKLaTs/GlcZDBUxslYp2I
	uMdkk8toKDrMxMjBoStLIYWKvQfa9iWX0IDt+8Hge3AHqpClcT1wAjUWM/2/szftzGdtSY3jfuc
	DXTTpsWW3Celi9lhbnMG6MrHFH+8VXrJnd4AKruJY3c0+7/A==
X-Received: by 2002:a05:622a:6201:b0:516:4fc0:27ac with SMTP id d75a77b69052e-5165a1f4f2emr48630491cf.50.1778845693977;
        Fri, 15 May 2026 04:48:13 -0700 (PDT)
X-Received: by 2002:a05:622a:6201:b0:516:4fc0:27ac with SMTP id d75a77b69052e-5165a1f4f2emr48629731cf.50.1778845693441;
        Fri, 15 May 2026 04:48:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a682sm1265079e87.31.2026.05.15.04.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:48:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:48:01 +0300
Subject: [PATCH v3 02/16] media: iris: Filter UBWC raw formats based on
 hardware capabilities
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-iris-ar50lt-v3-2-df3846e74347@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4536;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=X3Z4HL3UZoUysuTz1/xwzlwJPOeZfHAr2V3R4DT1iDI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBwf04u5V7a0CdPnHXhbzU/0YX52imldiIFn1O
 kYXoLv07n6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagcH9AAKCRCLPIo+Aiko
 1cDnB/oCbahHR8DTH5mvvr0QxrSYVV7jmC0bmzbKIciGzaTBCM/aEWD6NYHsk68PQWPwQwsMg5z
 cpMDawc2ggvLXXAt75KifTOgQHa5Pr8i4O9QNNy+4xwKlFNd/59PUHfZIXCmehjIb/pLsXgHu4e
 zdZc+AmihXWrx8vrUSSzTVb8cwdQqSNOua3MnJ7pW1JDdEqrw0SeBWk7+CWRG18Px3q8wcFcitJ
 s0uPFKYMBuDaFRYvLXnFwrNNWlpILB/TogopKSnH8/hYGQu3eOrUpB8SX/EnnAwrQ/UICtY16K/
 RmdtrlscllzooaTtkUK+SfuSf7KxkQEDgvYFKIifKpsKUpVA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: UI9l-_yrZg81X9kEHG7_4AhKZw3OaMkE
X-Proofpoint-GUID: UI9l-_yrZg81X9kEHG7_4AhKZw3OaMkE
X-Authority-Analysis: v=2.4 cv=cZPiaHDM c=1 sm=1 tr=0 ts=6a0707fe cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=HWmRtQhKy1KQUjwlQEkA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExOSBTYWx0ZWRfX7fO9t+9QS/CR
 WLsmUmgX4Nn5ZfTslMIjoGodcGIA0Hz4LqUn3yZNExYOXd8LCt22Z7RzNJ2uC3ADYrjCrMKlns4
 f0YZ4nZxVQuWJqptc9G1YBdsXK58llYObyfXhOWbjEiDFgkhfN78l3LaWXIlKoWidbvRcfPlWJo
 j5F5JAmYC+XyccW9aUIv/cfbBNVYAvc7RZPmZR9MtLoGnc+ZstkEGoHEkIj+o9nO/PmfnL6R+3G
 Vkvyn3NPYV53Yxfzeb2VhpToT5cgVX8NLrmiMU5SKkjKMM/xBn2/LHGEQ21/GSsK2CRaDnDYZqe
 IxP8WL6WI7dh9hD8TePcDgXR82afWR/S2i8NzK9UuN6katfGCoTjT/f2vAxJpQJCwBK5DiH5qkJ
 JX+rbM1tq8ar6ygAtaL54sWUCXP4jnjPiDv1RJmhAGXYjiuTco9utPM4hB38+0smWZnqvj/McCp
 RCE1R8SisHK55LMYZPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150119
X-Rspamd-Queue-Id: 9CBC654F9CB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61689-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

The raw formats supported by Iris were previously advertised
unconditionally, assuming UBWC support on all platforms. However, some
platforms do not support UBWC which results in incorrect format
capability exposure.

Use the UBWC configuration provided by the platform to dynamically
filter raw formats at runtime. If UBWC is not supported, UBWC-based
formats are omitted from the advertised capability list, while linear
formats remain available.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vdec.c | 9 +++++++++
 drivers/media/platform/qcom/iris/iris_venc.c | 9 +++++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index ff8d664558af..bd44e6437480 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <linux/soc/qcom/ubwc.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
 
@@ -74,6 +75,7 @@ static const u32 iris_vdec_formats_cap[] = {
 
 static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
 	unsigned int size, i;
 	const u32 *fmt;
 
@@ -85,6 +87,9 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		fmt = iris_vdec_formats_cap;
 		size = ARRAY_SIZE(iris_vdec_formats_cap);
+		/* Last format is UBWC; drop it if UBWC is unsupported */
+		if (!ubwc->ubwc_enc_version)
+			size--;
 		break;
 	default:
 		return false;
@@ -100,6 +105,7 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 
 static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
 	unsigned int size;
 	const u32 *fmt;
 
@@ -111,6 +117,9 @@ static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		fmt = iris_vdec_formats_cap;
 		size = ARRAY_SIZE(iris_vdec_formats_cap);
+		/* Last format is UBWC; drop it if UBWC is unsupported */
+		if (!ubwc->ubwc_enc_version)
+			size--;
 		break;
 	default:
 		return 0;
diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index 2398992d0596..c41f4103ccc3 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <linux/soc/qcom/ubwc.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
 
@@ -97,6 +98,7 @@ static const u32 iris_venc_formats_out[] = {
 
 static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
 	unsigned int size, i;
 	const u32 *fmt;
 
@@ -104,6 +106,9 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
 		fmt = iris_venc_formats_out;
 		size = ARRAY_SIZE(iris_venc_formats_out);
+		/* Last format is UBWC; drop it if UBWC is unsupported */
+		if (!ubwc->ubwc_enc_version)
+			size--;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		fmt = iris_venc_formats_cap;
@@ -123,6 +128,7 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 
 static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
 	unsigned int size;
 	const u32 *fmt;
 
@@ -130,6 +136,9 @@ static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
 		fmt = iris_venc_formats_out;
 		size = ARRAY_SIZE(iris_venc_formats_out);
+		/* Last format is UBWC; drop it if UBWC is unsupported */
+		if (!ubwc->ubwc_enc_version)
+			size--;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		fmt = iris_venc_formats_cap;

-- 
2.47.3


