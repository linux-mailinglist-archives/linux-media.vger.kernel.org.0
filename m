Return-Path: <linux-media+bounces-67146-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rxZLBr2YT2pgkgIAu9opvQ
	(envelope-from <linux-media+bounces-67146-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 14:49:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 383B973136E
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 14:49:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="EKmmM5z/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bQFAPotp;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67146-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67146-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 124653094A0B
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 12:37:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B259242DFFB;
	Thu,  9 Jul 2026 12:36:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF86C42DA29
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 12:36:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783600609; cv=none; b=UYUCYtCmI+FbxfBpx/7OqVShrSJYoyz7E1AH1c4y2P2+cVCcydvVEakSY39m4Gbo91fEizdScsJsY5Q+mIyn7Or/G9741VthULCXwmONwd5Q3T8sHotglFsJhYLHEePM7oFzjLGp7kjdTJxbuo7tDWwfMfZgaU/4AMl1R5HUJYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783600609; c=relaxed/simple;
	bh=yPFkUy4rClsc+9LggMJMWVqmm4xkKrVlyLYHtQNUdMg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oupL42ABA/5SYkPPiM3BTlCRvyX78doeWGaTpMJOS46SwnnReXiCSXKQC41nfTzLWhtfiy81NyzNKR9RbCWeZNeQan1YxnzOXFzThWKPDDDlR2aEj4vXHSWAC95gnzubSPytCutAFNcg+Sk0LYrMo12sG2K7hXlS1zCFt5zobTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EKmmM5z/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bQFAPotp; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNSb61672676
	for <linux-media@vger.kernel.org>; Thu, 9 Jul 2026 12:36:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ah/q3f2/72g9Yf4GtDTxCVoCkcHLCjiym/vkufEEaMs=; b=EKmmM5z/l5mgrh4r
	3T2RbeDjZGrfWHwOchgCleQFQGHXmLYHN1fSnFcRgmtPzp1YUDcANlsTQlwnfqjg
	I9PFgQurRaMbArkVvYLqJjqaBNxytJ2+QzOYhUiKl28GkkPWYsBAbVjDup7apLZ3
	7uNrxBpEGvBtuKN1J6slSzt0CGr3ooXzJZfcR9dGsjfEf6ZRJsqsBEjPFfU4oLVD
	t1Huo+PPiXA78NucDqdq0RNE9wmfjZbAxh9jtTs+CcFx9LMR3pOlFSNSZDeRmrsN
	dV5xSmdikJebz+pmTJ2y9o0ctG1gndfGFflrXwNcNYDiWC27MeBpkf8uh8Cbmg80
	NUZfFQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqsc8wj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 12:36:46 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88ad1558f4so2017812a12.2
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 05:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783600606; x=1784205406; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ah/q3f2/72g9Yf4GtDTxCVoCkcHLCjiym/vkufEEaMs=;
        b=bQFAPotpXEv1AV6Ws6OHM9G6FqC8JzODLzWOT1kz2iAbbkC7f7NRr9mhJjGXwGTM9y
         iMy0Chz+TeWwG8JVatlVjs2uwqoi6wuPmDKv1MrAOaKsD8VBDB5cjOzVL40yvZaTwCrG
         QT/hBVwN1LMtUkTqvdPcJJcCOjQQ59wa1x68W5RFePGSZOMLyx+qPA/vIh6yi+dSmHYa
         aWbFz2YJLLkF31m6aGCTyW4XwKPpe8DhWtQSIadIntiajoFvtg1McRsdwvYPID5HcdDs
         dgzfgbBaYLASlBaC9JbIpffIfhC19KQaGJwO9m1iOYfjPH/41LgFrPoZHAwZj9Niy6j3
         1E+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783600606; x=1784205406;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ah/q3f2/72g9Yf4GtDTxCVoCkcHLCjiym/vkufEEaMs=;
        b=Di1Z8wq0W+20qoQJAD62/lD7rPZO/PA+3Lb9cLYtlHbVlxhkMGnUqVUiZfs+zELEw5
         OJDj7OzhrK9RXtC1h5ePexp4yd+3ZYXijdlc15L9/7W+Mgoyww07V9KX9D6EYTGY0gfD
         jO+hKh5QrY8jCjyRHzDZ/QJi+kXoc8pyiCB4MJnsY+UEc3iIT8J6Wcjcv6Z5pz+ZyrCB
         JLGBHMsnMW0WgwORzVe8GEEgPx/NiPvdCqpr6d3ozVzGUAnAfpxNjVzIDXjRn/o0YKTD
         bk3WYOAx5VxWG0FAiAxcU5E9d2uUnv7Ux4MeNOWHYlKYyMe/qNNQ9uCKXO+EhWZpeMF1
         Bb3w==
X-Gm-Message-State: AOJu0YwGuxcGA/lxWFW3T/KhxPNw4llRHhgGIGGu5Fh0a4v7Fnb2yvWx
	POISbt9lBN2vJcpx8Szey5ME65hRSIeL/FmfqtH8+1YIQT237fbgmebaumgRv04ls1MObNaN9V6
	6AVtOcQ4WydTmAjtxDimtb8Eigx0LiWTfrDippe905KPbdl1EI1EWj4AoIS69jnTbjBAe4v5tTQ
	==
X-Gm-Gg: AfdE7ckBqtT0iiffDNdNRaEmMoTgB2/+eb0+IfN8OkzJiFnmb4+enc642mOF1/vcVU0
	b4xfcEiL8ObpqiLJ4MG3EImIvKlAbUQfhPKrpLbnKu69ex1G8f+VACuWDOWT9ewoMDB0VPA6WtM
	OABEFdSjrbMSDjl7UB/6zLY1sej2kiJ8HYnbxsT/NkNx3/Ypq9BXX47GMTnxUsdj87m/4YIze+p
	XBM/2uneFtRI4Ow3Zri/lX0Bs82Efb2MHSW74c9Kw0KoCqWH2VqJExGVaztEpug2waEZvOL9vL1
	Ll+6D2Wr3rB2jje1//6LaDQn0pr4O6/jRwlE+7xGDwWKqoX+9V0rfur8sYPmc5PejqR87Upj6+b
	kIoDHs+5tZ7U5ODxk0bkEKREwa+/F8ZDoAmIus2JdENqWgw==
X-Received: by 2002:a05:6a20:1446:b0:3c0:9c19:6592 with SMTP id adf61e73a8af0-3c0bd02dd1bmr8749458637.76.1783600605640;
        Thu, 09 Jul 2026 05:36:45 -0700 (PDT)
X-Received: by 2002:a05:6a20:1446:b0:3c0:9c19:6592 with SMTP id adf61e73a8af0-3c0bd02dd1bmr8749429637.76.1783600605221;
        Thu, 09 Jul 2026 05:36:45 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117483941csm31456029eec.7.2026.07.09.05.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 05:36:44 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 18:05:52 +0530
Subject: [RFC PATCH 06/11] media: iris: Add hooks for pixel and non-pixel
 context banks
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-vpu_iommu_iova_handling-v1-6-72bb62cb2dfd@oss.qualcomm.com>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
In-Reply-To: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783600568; l=6372;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=yPFkUy4rClsc+9LggMJMWVqmm4xkKrVlyLYHtQNUdMg=;
 b=oL+rLWzh0+QeGqGkgZuhxldrOQFGYQaUNyH9u/1mke0RXP3A9ZMNOsnGkul/linV+otYx3aw+
 YS/UropUxfmAeR7R4C4IQYwXSJJAxDeyDoAMHkD28Wq9jnEouaEwcaK
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEyMiBTYWx0ZWRfXxaz2DF2H+D6p
 chORikV5zNbOEMaVymb6Lsb13Cfqt+jD4ZBT6tE6TNXhCpevlIAJoQqAKo7/2++1t7lsJD92hK9
 hj9y9sy7eBaMpgjytUHydzPwNhWSQxw=
X-Proofpoint-GUID: Nydg3hlT4-ANH8p0IeD4qo_TZ1kcLHRm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEyMiBTYWx0ZWRfXzSUV6SCRDgal
 4Yhl/W2D0ADnrcWWkC7sVaATwTCFhOJo62I8Xs1/Eaog76KRHRCOF5R/Zj1sfotQTNZvBeE7F90
 6iC3dqfVr8FnOTCviHeN2awBBOIQCDLiII8FGrZ2adTp4Djj2VH4g8tu3HC8cICwmDlNd9QayrI
 dh1DbT8lJ7cY0BeAPm4vdCh2hJOo1am4VfNVYYei8ll+qq4TQmMs9qo1NwpidWY9hZ0LHAmAxf3
 Xr3yywfyOVU/W3HkRdKCsIZpUH4tn1pvSFP/FOPO3qNDjvmRgcfcOCVpxlcoMmJAOuxrYWU9vx4
 8nv1IhIGU6mhBj8Or+azAU3gtNBk3HK8BxkIs+Oh2UiJxfrO9hpmFVWX1DTFcuAVvcEIp8wQ+RD
 bw9Vgjqbn0rqpvAA1g1kDq0XtmR64SvFbjNrDU+VT0yQitLpdB8To5xHe/PIv/0lW+LNuH9Xjfx
 zrXuwCIyK/UF5BhyHvg==
X-Authority-Analysis: v=2.4 cv=Sv2gLvO0 c=1 sm=1 tr=0 ts=6a4f95de cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=cngMLrDN_LyZJSMpijwA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: Nydg3hlT4-ANH8p0IeD4qo_TZ1kcLHRm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090122
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67146-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:vikash.garodia@oss.qualcomm.com,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 383B973136E

Iris platforms use separate context-bank devices for the pixel and
non-pixel domains. Add platform hooks to create and destroy those
subdevices, and wire them up for the affected platforms.

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Makefile          |  1 +
 .../platform/qcom/iris/iris_platform_sm8550.c      | 71 ++++++++++++++++++++++
 .../platform/qcom/iris/iris_platform_sm8550.h      | 24 ++------
 .../media/platform/qcom/iris/iris_platform_vpu3x.c |  4 ++
 4 files changed, 80 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 48e415cbc4390bc596f6239fefa2a2ad2cd3a2bb..fd6bfe7e786be3f8a4885296fb11ba430ded6fd1 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -12,6 +12,7 @@ qcom-iris-objs += iris_buffer.o \
              iris_hfi_gen2_packet.o \
              iris_hfi_gen2_response.o \
              iris_hfi_queue.o \
+             iris_platform_sm8550.o \
              iris_platform_vpu2.o \
              iris_platform_vpu3x.o \
              iris_power.o \
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
new file mode 100644
index 0000000000000000000000000000000000000000..bea904a9249bafe1dfa11ff39155d1930402bf7c
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include "iris_core.h"
+#include "iris_platform_common.h"
+#include "iris_platform_sm8550.h"
+
+const char * const sm8550_clk_reset_table[] = { "bus" };
+
+const struct platform_clk_data sm8550_clk_table[] = {
+	{IRIS_AXI_CLK,  "iface"        },
+	{IRIS_CTRL_CLK, "core"         },
+	{IRIS_HW_CLK,   "vcodec0_core" },
+};
+
+struct platform_inst_caps platform_inst_cap_sm8550 = {
+	.min_frame_width = 96,
+	.max_frame_width = 8192,
+	.min_frame_height = 96,
+	.max_frame_height = 8192,
+	.max_mbpf = (8192 * 4352) / 256,
+	.mb_cycles_vpp = 200,
+	.mb_cycles_fw = 489583,
+	.mb_cycles_fw_vpp = 66234,
+	.max_frame_rate = MAXIMUM_FPS,
+	.max_operating_rate = MAXIMUM_FPS,
+};
+
+static int sm8550_init_cb_devs(struct iris_core *core)
+{
+	struct device *dev;
+
+	dev = iris_create_cb_dev(core, "non-pixel");
+	if (IS_ERR(dev))
+		return PTR_ERR(dev);
+
+	core->np_dev = dev;
+
+	dev = iris_create_cb_dev(core, "pixel");
+	if (IS_ERR(dev))
+		goto unreg_np_dev;
+
+	core->p_dev = dev;
+
+	return 0;
+
+unreg_np_dev:
+	if (core->np_dev)
+		platform_device_unregister(to_platform_device(core->np_dev));
+	core->np_dev = NULL;
+
+	return PTR_ERR(dev);
+}
+
+static void sm8550_deinit_cb_devs(struct iris_core *core)
+{
+	if (core->p_dev)
+		platform_device_unregister(to_platform_device(core->p_dev));
+	if (core->np_dev)
+		platform_device_unregister(to_platform_device(core->np_dev));
+
+	core->p_dev = NULL;
+	core->np_dev = NULL;
+}
+
+const struct iris_context_bank_ops sm8550_cb_ops = {
+	.init = sm8550_init_cb_devs,
+	.deinit = sm8550_deinit_cb_devs,
+};
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.h b/drivers/media/platform/qcom/iris/iris_platform_sm8550.h
index 3c9dae995bb248f66e200075021b3231b456300a..7205c9e27b1c56acd5a88a861df8eb75517d5a2b 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.h
@@ -6,25 +6,9 @@
 #ifndef __IRIS_PLATFORM_SM8550_H__
 #define __IRIS_PLATFORM_SM8550_H__
 
-static const char * const sm8550_clk_reset_table[] = { "bus" };
-
-static const struct platform_clk_data sm8550_clk_table[] = {
-	{IRIS_AXI_CLK,  "iface"        },
-	{IRIS_CTRL_CLK, "core"         },
-	{IRIS_HW_CLK,   "vcodec0_core" },
-};
-
-static struct platform_inst_caps platform_inst_cap_sm8550 = {
-	.min_frame_width = 96,
-	.max_frame_width = 8192,
-	.min_frame_height = 96,
-	.max_frame_height = 8192,
-	.max_mbpf = (8192 * 4352) / 256,
-	.mb_cycles_vpp = 200,
-	.mb_cycles_fw = 489583,
-	.mb_cycles_fw_vpp = 66234,
-	.max_frame_rate = MAXIMUM_FPS,
-	.max_operating_rate = MAXIMUM_FPS,
-};
+extern const char * const sm8550_clk_reset_table[1];
+extern const struct platform_clk_data sm8550_clk_table[3];
+extern struct platform_inst_caps platform_inst_cap_sm8550;
+extern const struct iris_context_bank_ops sm8550_cb_ops;
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index 2c63adbc55791d5253b14096f9c3ce515f934a4e..68a021c3140eacbf72e63045d39f9b9b8d0e5d97 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -91,6 +91,7 @@ static const struct tz_cp_config tz_cp_config_vpu3[] = {
  */
 const struct iris_platform_data qcs8300_data = {
 	.firmware_desc = &iris_vpu30_p4_s6_gen2_desc,
+	.cb_ops = &sm8550_cb_ops,
 	.vpu_ops = &iris_vpu3_ops,
 	.icc_tbl = iris_icc_info_vpu3x,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
@@ -120,6 +121,7 @@ const struct iris_platform_data qcs8300_data = {
 
 const struct iris_platform_data sm8550_data = {
 	.firmware_desc = &iris_vpu30_p4_gen2_desc,
+	.cb_ops = &sm8550_cb_ops,
 	.vpu_ops = &iris_vpu3_ops,
 	.icc_tbl = iris_icc_info_vpu3x,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
@@ -155,6 +157,7 @@ const struct iris_platform_data sm8550_data = {
  */
 const struct iris_platform_data sm8650_data = {
 	.firmware_desc = &iris_vpu33_p4_gen2_desc,
+	.cb_ops = &sm8550_cb_ops,
 	.vpu_ops = &iris_vpu33_ops,
 	.icc_tbl = iris_icc_info_vpu3x,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
@@ -221,6 +224,7 @@ const struct iris_platform_data sm8750_data = {
  */
 const struct iris_platform_data x1p42100_data = {
 	.firmware_desc = &iris_vpu30_p1_gen2_desc,
+	.cb_ops = &sm8550_cb_ops,
 	.vpu_ops = &iris_vpu3_ops,
 	.icc_tbl = iris_icc_info_vpu3x,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),

-- 
2.34.1


