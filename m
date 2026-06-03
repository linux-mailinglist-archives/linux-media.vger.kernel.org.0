Return-Path: <linux-media+bounces-63615-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RkaGN0k6IGqFywAAu9opvQ
	(envelope-from <linux-media+bounces-63615-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 16:29:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D2663895C
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 16:29:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=QlbIpq6A;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WKzCUXjO;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63615-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63615-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9F52E30CE7DD
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 14:23:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9FF2481675;
	Wed,  3 Jun 2026 14:21:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEDA396B68
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 14:21:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780496484; cv=none; b=tBuzIK0+MDP+VwvkdCk8kWziRI10i6b0OiTcGXdDoOOfCvvyUP3BZWAExvZAeU+PQPea4YZpXhOJgLcWBIeO70LeVwRPIL1Df1HRMW7+hZGJcUob25jkDYSupTTpBD70SV8tAakkIkBz39Z7ZNh2RajKsmU9ckgCIDQ/EKNIvjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780496484; c=relaxed/simple;
	bh=2ygx9NZimY6zCjDp9sV1d3+2wjaoIuJcxkAVDAwQaiQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=blYzcQ36c1jVWSUXxX5iMAmw6E3bguSQSFWmLWURGqHik5fJeAzU5/SQ6mP33YIEPtOow3Zjgj6wh7fn/huhnOPlofg7ybDtjaB8I/7RHfdCeqQPqlCJBIbYLgMS3HK5pCZcvWQTq4b8bv6LIOg2L5CQyujrr54K4aQwVOuw7Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QlbIpq6A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WKzCUXjO; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65395rWD780730
	for <linux-media@vger.kernel.org>; Wed, 3 Jun 2026 14:21:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QR5ZUHsGwASAkc6NIwCn+oGb5i6g8gytxT88MUtT7d4=; b=QlbIpq6ATustn21l
	HU7XGjopAzPHFxc14VEQ2b49saAMfnviUUnLhtlJ0EEkuDtj3tSnlgOgodptIk9p
	KDDWRMkaMdTCtvWpokn1Y4lQjV2E5oCUZLKmdqqa4rWuIHq+EwFxvdyQxMCxwobp
	fG1+MtR7VRrudTKcklU7tA6LDFBN5eXC8Olr8B79spAC801OTUAErZGqRxHGslMx
	Mk/3FLM8WcIUQpQvotG+zBba5U4InwQWup++45RMiqZe1JD+B85gC/Q3W9p6e8jM
	IgEWPxuXqoPe7Y80pVPCB80V1PRFzjB/qMEXTB61PRd0vDA3sm4O6t8BTSosnOHZ
	jZymLQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejhbb16tf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 14:21:20 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36d98b6f019so3824313a91.2
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 07:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780496480; x=1781101280; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QR5ZUHsGwASAkc6NIwCn+oGb5i6g8gytxT88MUtT7d4=;
        b=WKzCUXjODLDl3xqbajsP/jWie8wAs1qOUweLROs7CVw7XsO4YCr/SedjUFjR+sewG2
         YSIGJQMHcguM6oOA/+uqleRrDwia5fmAGc8UoqIkGJmujAi81Z5tfdd1Rn0QniYY3dXx
         66OFKeQP0SttJZ9z21hBV243gG2upsLWqqnW8d1gplP0NrZ2VspoO4ZdlqiqgX63tOTx
         2xUGjHt/K1pngbG9dYQP749o3VHWnatYs7lxk3zjjDFPxlHMNZFd1iY4V8DDonNdaLrz
         O2katdQiRWjqxxDJfLORcxG2RjgbbBLaXl5rMr/NS9Gt3FWpuEqpwg2O6M9qsgfBW6AB
         kA5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780496480; x=1781101280;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QR5ZUHsGwASAkc6NIwCn+oGb5i6g8gytxT88MUtT7d4=;
        b=fxmv/mJjgxdQqg1LJI9qIFoLh2FklaJxkHiXaGuOK301moZsYJeJPrfBPKvaceHkZl
         oVtS6ydhKHWhj/8F+e1lDUraQz9XljqlvzppNn4G3AQwOXW5iC2Ua8GzmEcdtrgUfyqj
         ooZYQr1i/RM4Zv/Jt8tWFGH8xjYsxZ9P2jywcFlz8KIPlXWjfNqakG46uoVWVkWlEyjW
         mWzK3DAVEOXeYnnVT2Uy1qwycvTo4+3SCjVomBoUBz2Gh5MoNXb+h/SZD1liMrCOoEk9
         4j+ppAgvjCSexWtrHhBxLQSh70+LHFBYd/49+AeisfKnQ0jiHPUi00g6F3b5uzQvtOOm
         iLzw==
X-Forwarded-Encrypted: i=1; AFNElJ88/bkG9t2YMvg9ahY9eA5EBo/HH2qczKXeLoVPAhTrvnu8QToLfD6NQdwWm0jHvIL1I71TUcdFgaAbUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUc/1b5GHXu/+8hcZUqsL4YHStgK9fdgGSzm+ZznR40E0bKaxW
	dL790ZTBtQ/4TMnx8MHFvf4HKwygxSe0uVrSFu7VMrQKm7wHVNzPMBaig5UnVD7jK9kMTOHu9Jo
	cwUs5gzwABDJKUOpDJBQoVNHO+NIxIVSaRnmW5CsVpEKMa8RBwSvLZ+x5qfC9lYP1mw==
X-Gm-Gg: Acq92OHIElijz/o1gowAy831d+CKaHgEfj4DnvDfnFlIwr3YRzQvBQ+R5Mk04xWOXu7
	6iFGQj5ImCeujvon2zMOZgaKLf5D68etxowLNSmsqmS7IM2FFTrnLY9GcUAPARWOexTMGYBHsYY
	ZuGMe2FRmBOn/ZzQnxnAE8bdoHiNB8ZxLA6M+6pY2HZ2oOGaPiGZniVfiKY+ED44lzf5NVWUC+0
	GzbLfiW/FTPPazsvAoVn7qjOWVnbfk6p8+4KXqCu03in/B7hUBAc+/dUYP8KcLuOcOIxa20wQB3
	bbjmWYWukIrkKVy5mTY5ZSzYrD2dGWLg5jH03IxSlAa7dLfAfokJnWIoIFfR0zJGPQIN/wAN+vp
	9eE4BhwqmXHZ0kOd6RYG36bDnHLB4x1P0m7xqU+Z0GGHSotUT4VeGxhWCWPvLhS/gyQ==
X-Received: by 2002:a17:903:1a10:b0:2c0:cf44:3b60 with SMTP id d9443c01a7336-2c1644d82aemr40772485ad.36.1780496479635;
        Wed, 03 Jun 2026 07:21:19 -0700 (PDT)
X-Received: by 2002:a17:903:1a10:b0:2c0:cf44:3b60 with SMTP id d9443c01a7336-2c1644d82aemr40771905ad.36.1780496479151;
        Wed, 03 Jun 2026 07:21:19 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d37esm41514955ad.9.2026.06.03.07.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:21:18 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 03 Jun 2026 19:48:48 +0530
Subject: [PATCH v7 10/12] media: iris: Add platform data for glymur
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-glymur-v7-10-afaa55d11fe0@oss.qualcomm.com>
References: <20260603-glymur-v7-0-afaa55d11fe0@oss.qualcomm.com>
In-Reply-To: <20260603-glymur-v7-0-afaa55d11fe0@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780496410; l=9865;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=2ygx9NZimY6zCjDp9sV1d3+2wjaoIuJcxkAVDAwQaiQ=;
 b=qXLDvn+QyEoW37KEX9IKHRDZtdv6yRHceTZ/iV4+aVfkBAdWNr73UfJEvg7m3F/y0ayK9gHfy
 WZumILko9hCA336mdhstMkjLlsOnBIOBeeEbxHxVGmJJw0VYTz0Q+Yw
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: -Do2XsAjJSGAUoN7PKSQ5jRV_EVqFTt1
X-Authority-Analysis: v=2.4 cv=R74z39RX c=1 sm=1 tr=0 ts=6a203860 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=p7eJR7UndCQr9EIFI2cA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: -Do2XsAjJSGAUoN7PKSQ5jRV_EVqFTt1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEzNyBTYWx0ZWRfXyD/nMmfwUzsP
 GtqtS3b/F7xy6eA/hTxJNCE7b/dgi58ibCSUVFtu8lKoq6O24k+/Qa99y5NRPtbrxy+pbF/mIdl
 ljSNqot/07tMMF/rDFJLOt+H9+Ci1eLelIx+iXSBY64743stSyBJKk6WvK0naUuNt327moYBol4
 Xnw/jbAxmWl8q7PyAqQx28qpz98QQaRjXdLCpjEV1+58qoJzJy1lP1rrN5vqq+FY+C8SLOIxd0w
 hRUY+K7BZuYsenAEubLBkk0Es1HPLX76IGTGA7gpEexvH5z0V1rYgJlGWlACj3zrpgM1/36XwSP
 ermvpkwkj4SDDzqve3hV/qI1uzbVdcv4+d+GzHPIMt3FXTY7xgRKc8cJyYBbnQh5pIzMnn1Sj7K
 83BUrfmS97mytG2APtGKvRsa9pYo0atFV2QfVkTmby4O6BTTqeLihg5feeL994peFOYe5uBv2G1
 4RUO82K7MmeouRwgMew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030137
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-63615-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:stanimir.k.varbanov@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:stanimirkvarbanov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C3D2663895C

On glymur platform, the iris core shares most properties with the
iris core on the SM8550 platform. The major difference is that glymur
integrates two codec cores (vcodec0 and vcodec1), while SM8550 has only
one. Add glymur specific platform data, reusing SM8550 definitions
wherever applicable.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Makefile          |   1 +
 .../platform/qcom/iris/iris_platform_common.h      |   5 +
 .../platform/qcom/iris/iris_platform_glymur.c      | 106 +++++++++++++++++++++
 .../platform/qcom/iris/iris_platform_glymur.h      |  17 ++++
 .../media/platform/qcom/iris/iris_platform_vpu3x.c |  35 +++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      |   3 +
 7 files changed, 171 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 6deadd531c8e..6c45d4ad13a8 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -12,6 +12,7 @@ qcom-iris-objs += iris_buffer.o \
              iris_hfi_gen2_packet.o \
              iris_hfi_gen2_response.o \
              iris_hfi_queue.o \
+             iris_platform_glymur.o \
              iris_platform_vpu2.o \
              iris_platform_vpu3x.o \
              iris_power.o \
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index ed6b84b9db54..497b43ba0ae8 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -38,6 +38,10 @@ struct iris_inst;
 #define MAX_HEVC_VBR_LAYER_HP_SLIDING_WINDOW	5
 #define MAX_HIER_CODING_LAYER_GEN1		6
 
+#define VIDEO_REGION_SECURE_FW_REGION_ID	0
+#define VIDEO_REGION_VM0_SECURE_NP_ID		1
+#define VIDEO_REGION_VM0_NONSECURE_NP_ID	5
+
 enum stage_type {
 	STAGE_1 = 1,
 	STAGE_2 = 2,
@@ -52,6 +56,7 @@ enum pipe_type {
 extern const struct iris_firmware_data iris_hfi_gen1_data;
 extern const struct iris_firmware_data iris_hfi_gen2_data;
 
+extern const struct iris_platform_data glymur_data;
 extern const struct iris_platform_data qcs8300_data;
 extern const struct iris_platform_data sc7280_data;
 extern const struct iris_platform_data sm8250_data;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_glymur.c b/drivers/media/platform/qcom/iris/iris_platform_glymur.c
new file mode 100644
index 000000000000..c42ac99870ed
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_glymur.c
@@ -0,0 +1,106 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <dt-bindings/media/qcom,glymur-iris.h>
+#include <linux/iris_vpu_bus.h>
+
+#include "iris_core.h"
+#include "iris_platform_common.h"
+#include "iris_platform_glymur.h"
+
+const struct iris_power_domain_data iris_glymur_ctrl_data = {
+	.pd_names = (const char *[]) {
+		"venus",
+	},
+	.pd_cnt = 1,
+	.clk_names = (const char *[]) {
+		"core_iface", "core_freerun", "core",
+	},
+	.clk_cnt = 3,
+};
+
+const struct iris_power_domain_data iris_glymur_vcodec_data[] = {
+	{
+		.pd_names = (const char *[]) {
+			"vcodec0",
+		},
+		.pd_cnt = 1,
+		.clk_names = (const char *[]) {
+			"vcodec0_iface", "vcodec0_core_freerun", "vcodec0_core",
+		},
+		.clk_cnt = 3,
+	},
+	{
+		.pd_names = (const char *[]) {
+			"vcodec1",
+		},
+		.pd_cnt = 1,
+		.clk_names = (const char *[]) {
+			"vcodec1_iface", "vcodec1_core_freerun", "vcodec1_core",
+		},
+		.clk_cnt = 3,
+	},
+};
+
+const char * const iris_glymur_clk_reset_table[] = {
+	"core_bus",
+	"vcodec0_bus",
+	"core",
+	"vcodec0_core",
+	"vcodec1_bus",
+	"vcodec1_core",
+};
+
+const char * const iris_glymur_opp_clk_table[] = {
+	"vcodec0_core",
+	"vcodec1_core",
+	"core",
+	NULL,
+};
+
+const struct tz_cp_config iris_glymur_tz_cp_config[] = {
+	{
+		.cp_start = VIDEO_REGION_SECURE_FW_REGION_ID,
+		.cp_size = 0,
+		.cp_nonpixel_start = 0,
+		.cp_nonpixel_size = 0x1000000,
+	},
+	{
+		.cp_start = VIDEO_REGION_VM0_SECURE_NP_ID,
+		.cp_size = 0,
+		.cp_nonpixel_start = 0x1000000,
+		.cp_nonpixel_size = 0x24800000,
+	},
+	{
+		.cp_start = VIDEO_REGION_VM0_NONSECURE_NP_ID,
+		.cp_size = 0,
+		.cp_nonpixel_start = 0x25800000,
+		.cp_nonpixel_size = 0xda600000,
+	},
+};
+
+int iris_glymur_init_cb_devs(struct iris_core *core)
+{
+	u64 dma_mask = core->iris_platform_data->dma_mask;
+	const u32 fw_fid = IOMMU_FID_IRIS_FIRMWARE;
+	struct device *dev;
+
+	dev = iris_vpu_bus_create_device(core->dev, "iris-firmware", dma_mask, &fw_fid);
+	if (IS_ERR(dev))
+		return PTR_ERR(dev);
+
+	if (device_iommu_mapped(dev))
+		core->fw_dev = dev;
+	else
+		device_unregister(dev);
+
+	return 0;
+}
+
+void iris_glymur_deinit_cb_devs(struct iris_core *core)
+{
+	if (core->fw_dev)
+		device_unregister(core->fw_dev);
+}
diff --git a/drivers/media/platform/qcom/iris/iris_platform_glymur.h b/drivers/media/platform/qcom/iris/iris_platform_glymur.h
new file mode 100644
index 000000000000..1dae5764cb8c
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_glymur.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef __IRIS_PLATFORM_GLYMUR_H__
+#define __IRIS_PLATFORM_GLYMUR_H__
+
+extern const struct iris_power_domain_data iris_glymur_ctrl_data;
+extern const struct iris_power_domain_data iris_glymur_vcodec_data[2];
+extern const char * const iris_glymur_clk_reset_table[6];
+extern const char * const iris_glymur_opp_clk_table[4];
+extern const struct tz_cp_config iris_glymur_tz_cp_config[3];
+int iris_glymur_init_cb_devs(struct iris_core *core);
+void iris_glymur_deinit_cb_devs(struct iris_core *core);
+
+#endif /* __IRIS_PLATFORM_GLYMUR_H__ */
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index 72dd23dbe02a..4049e134c3f0 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -12,6 +12,7 @@
 #include "iris_vpu_buffer.h"
 #include "iris_vpu_common.h"
 
+#include "iris_platform_glymur.h"
 #include "iris_platform_qcs8300.h"
 #include "iris_platform_sm8550.h"
 #include "iris_platform_sm8650.h"
@@ -48,6 +49,12 @@ static const struct iris_firmware_desc iris_vpu35_p4_gen2_desc = {
 	.fwname = "qcom/vpu/vpu35_p4.mbn",
 };
 
+static const struct iris_firmware_desc iris_vpu36_p4_s7_gen2_desc = {
+	.firmware_data = &iris_hfi_gen2_data,
+	.get_vpu_buffer_size = iris_vpu_buf_size,
+	.fwname = "qcom/vpu/vpu36_p4_s7.mbn",
+};
+
 static const u32 iris_fmts_vpu3x_dec[] = {
 	[IRIS_FMT_H264] = V4L2_PIX_FMT_H264,
 	[IRIS_FMT_HEVC] = V4L2_PIX_FMT_HEVC,
@@ -83,6 +90,34 @@ static const struct tz_cp_config tz_cp_config_vpu3[] = {
 	},
 };
 
+const struct iris_platform_data glymur_data = {
+	.firmware_desc = &iris_vpu36_p4_s7_gen2_desc,
+	.vpu_ops = &iris_vpu36_ops,
+	.icc_tbl = iris_icc_info_vpu3x,
+	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
+	.clk_rst_tbl = iris_glymur_clk_reset_table,
+	.clk_rst_tbl_size = ARRAY_SIZE(iris_glymur_clk_reset_table),
+	.bw_tbl_dec = iris_bw_table_dec_vpu3x,
+	.bw_tbl_dec_size = ARRAY_SIZE(iris_bw_table_dec_vpu3x),
+	.ctrl_data = &iris_glymur_ctrl_data,
+	.vcodec_data = iris_glymur_vcodec_data,
+	.opp_pd_tbl = iris_opp_pd_table_vpu3x,
+	.opp_pd_tbl_size = ARRAY_SIZE(iris_opp_pd_table_vpu3x),
+	.opp_clk_tbl = iris_glymur_opp_clk_table,
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xffe00000 - 1,
+	.inst_iris_fmts = iris_fmts_vpu3x_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
+	.inst_caps = &platform_inst_cap_sm8550,
+	.tz_cp_config_data = iris_glymur_tz_cp_config,
+	.tz_cp_config_data_size = ARRAY_SIZE(iris_glymur_tz_cp_config),
+	.num_vpp_pipe = 4,
+	.max_session_count = 16,
+	.num_cores = 2,
+	.max_core_mbpf = NUM_MBS_8K * 2,
+	.max_core_mbps = ((8192 * 4320) / 256) * 60,
+};
+
 /*
  * Shares most of SM8550 data except:
  * - inst_caps to platform_inst_cap_qcs8300
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 681db1da9559..a65b0b8bd37f 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -458,6 +458,10 @@ static const struct dev_pm_ops iris_pm_ops = {
 };
 
 static const struct of_device_id iris_dt_match[] = {
+	{
+		.compatible = "qcom,glymur-iris",
+		.data = &glymur_data,
+	},
 	{
 		.compatible = "qcom,qcs8300-iris",
 		.data = &qcs8300_data,
diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index 9f8dacfa768d..05e0ac73c884 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -8,6 +8,7 @@
 #include <linux/reset.h>
 
 #include "iris_instance.h"
+#include "iris_platform_glymur.h"
 #include "iris_vpu_common.h"
 #include "iris_vpu_register_defines.h"
 
@@ -415,6 +416,8 @@ const struct vpu_ops iris_vpu36_ops = {
 	.program_bootup_registers = iris_vpu36_program_bootup_registers,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu36_set_hwmode,
+	.init_cb_devs = iris_glymur_init_cb_devs,
+	.deinit_cb_devs = iris_glymur_deinit_cb_devs,
 	.check_core_load = iris_vpu36_check_core_load,
 	.get_required_freq = iris_vpu36_get_required_freq,
 };

-- 
2.34.1


