Return-Path: <linux-media+bounces-67169-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Bu9YBrOoT2qglwIAu9opvQ
	(envelope-from <linux-media+bounces-67169-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 15:57:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74124731D83
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 15:57:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kyS4pocp;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=R748MZuG;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67169-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67169-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E3EE831151E8
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 13:43:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A74F3358C4;
	Thu,  9 Jul 2026 13:42:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30EE331ECF
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 13:42:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783604540; cv=none; b=jxocvfTJm6v6+nOkMCFRaE6GzecW6zSh+csaJO/n9zC4a+3OTVXayPHmauuO7J32Qgqi2qgEDDss6mGFuPiKbGnRyRiczNxmuKW4B6L4R7SXWNmt1MN+GM0QjH77fNAw0osXhbquY2IcI5Z5J7aS4kuM/LjxoxefYjKQntH1Op8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783604540; c=relaxed/simple;
	bh=Z9YVCIn9gOvK6SSCe/yg6Q/JOR3Ghll8qnR7XK1MFPw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rok+VVSgyZb0YQ9EnqspwRR+0RcsDSAxbohY0jBiok4HGpE/U+qDXca5Bn5mbhJwXgoZW6jt0OexE4/OUnzUs+VH1SNWyJj0bHE+183u/yd5+AV9V1LXzII7UhMU16rCIIKW+w6FMDJjNOt6K6OOfrJzlZnkgSPruNbUhQJ/acQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kyS4pocp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R748MZuG; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNQBC1667799
	for <linux-media@vger.kernel.org>; Thu, 9 Jul 2026 13:42:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+IiDXvUnbad5BH0dIQkKVscltsnZRJvuwXHI3L5bnEU=; b=kyS4pocpxExDq3cT
	0B5icKa0By4sqWP9O6TCmghtCiUBlzzlsx3j9O6q127gZKpFKXde21gdban0NTer
	xptbIQxqrycEqQfdJ+GnDjiMJpmCkV2f3PYn5PwBUcUErIWELtiCaJpwcK0uMd7m
	xDQHzWYqZoc3RyPa8w/+TJo6IFG1KkSeLeQihzACqZQ5KwyZIjz9LxFWQXslkml9
	cvKNug4qQVXaLCOfzuR2+NOvLy8MB/VSO0ygCZryGr/i5NDnywpt9TGakVwRG6Uh
	F/k9fjq2hD0antF3m6/nOIljrwF8ppzBVicQoz7+DDrza4XZTYSVNP57Po1S7OOq
	ld17zw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9ug6m1fp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 13:42:17 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-738e5b5ef68so301011137.1
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 06:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783604537; x=1784209337; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+IiDXvUnbad5BH0dIQkKVscltsnZRJvuwXHI3L5bnEU=;
        b=R748MZuG2Q6DtwebJ/9eLkCiqX52+WcTmavWohPGCqwnP14BUja6h3/pzcWFCTtMG4
         bE5qR7+SfHzifnX8Dy0CSR6UY1zGU6PAxSI7LzcF+WE0arnk0XkHk467pNCQYoRrva6H
         orW8c7zImS/fGnbM3mN1eNCHZ5MgQrSc7QIBO086mFyRoAGLjMRP+/19Z/BtfXjN9AuP
         mqmmGFaPNmiYtU1LJgdC3EiS2hvt9UmMVldlJele9reTOSioJwTlKguJXn7K8UC8NzaD
         Rzp2b1O4a+fcTvhPhvVNt0n+Yw95QMdju0ekldefgusRJ5lvtfapapLfd73PdiSdHAVW
         y1Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783604537; x=1784209337;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+IiDXvUnbad5BH0dIQkKVscltsnZRJvuwXHI3L5bnEU=;
        b=LcS1MgHOMJ93bhVADXofM//TRHEbettmv1ayPTLM58TT4vX8aK/uAh7D44lSxCNZzN
         0BbQY1mMHGFeX7WuKS/wRTibex9yn+qeusAjyPTIJdZQoUN5pgV+QzyBfO+WpRXE4827
         +dSMc8qneJPVl0Lprpp7M/rgOxDFqynJydpxoGLlxnxuf1nOmU9I/atRvfkW2tJpJMca
         UU5ovVRb2raXR7fManWcwG9dwhYXFo9n2t/Iqkj9T8CEDPt7ZLuiHKoHQqlPZHikKpSU
         ZyyIeY68RSRk/7/gpYtMfEBDzz6kPRbF6QFV9A7nUKkLYQRXppkSTMws2MDJMbvj9/qh
         J8YA==
X-Gm-Message-State: AOJu0YxW5m6WF/WErimYo5YM/cPchKc/H9IYGCIgBcVTPNSGoSZKbVl9
	omxhllU5LUkmteg9HuWA85oxPRGYf/xM1exObfG6ijniPNpOtnSA3LjtZ2QkLns7sc8vf2pSi7f
	BS3+YnQt4TAYLoSyV4Q6KcZuyqKXWKd2sP+0GSUz/2JDxAi+tsol8PcAzvk8HL7kGYA==
X-Gm-Gg: AfdE7ck0+txhPkupXh2qSF5XAtN1k/UqV3qrx5QvS2JAM/GxDUCTBZ9UImKYISFLLlB
	SS4Ba8uCj/evY5ARMgQGluVDU2zz2xf3pDYrf+qefa7G+LzPrBP9R69EuLn9JuyQMnXm0TW0720
	+nPbZ720E7ZnynRKs0edlEYGuFE+hXnsgTJcWDJb8+FBYB3r8KlWcbDvpi1fcMPTey3TdcSW7Y8
	a6+oiKZrmQA4QrjdnKJ2gPkhprGGObddyKys31meQIs2AA/6dijQEiRN9aDDlgkE55b6q0VrILJ
	T6yrgZls17G6f/0ccBbFVmAhmivl8EtylgTU5hcYikg6SaT2nB2AjBD/yKDkX9vvNZvElpNI/Ns
	OgdTj5xxzVT6vBbPOjSQSB2rLgCVIielzrKqiU0A4cM3wee5HbhqZwKBwaa+CaOqL584nisveI2
	A7olUaRhAWZCF1kDbz5Xge3xF1
X-Received: by 2002:a05:6102:4489:b0:739:4470:d8 with SMTP id ada2fe7eead31-744dff34fc0mr3792989137.26.1783604537147;
        Thu, 09 Jul 2026 06:42:17 -0700 (PDT)
X-Received: by 2002:a05:6102:4489:b0:739:4470:d8 with SMTP id ada2fe7eead31-744dff34fc0mr3792962137.26.1783604536525;
        Thu, 09 Jul 2026 06:42:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c849186e1sm3345151fa.9.2026.07.09.06.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:42:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 16:41:58 +0300
Subject: [PATCH v7 07/18] media: iris: add vpu op hook to disable ARP
 buffer
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-iris-ar50lt-v7-7-76af9dd4d1f6@oss.qualcomm.com>
References: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
In-Reply-To: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3062;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=jj8UzQSoTEypLFxWuTJ9OPEMEGui3AHWwyMxcB4RZ5E=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqT6UkBBsw5WrJ2W+jVIrxke887wis1lYUq7Cp2
 9RdC8yTnKCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak+lJAAKCRCLPIo+Aiko
 1VO3B/4+2TvtE96xk9YU5v5tY8+QZAa7K/m87QiXRZE2O4ZSEWwL+6GZUPN5ug0cC1G6k3zx6jb
 Q8mqKDRLMM2Sg3pGphMr0TRS/O/csc/iwokck0b9i8FEbbmQyjGgrYRYnBcNuv8Fm2poQ66g2a9
 NUzLZ6FpN66dVQi4U8ZDgfqrBtYE7NivVrFZIuAHf6+JLw2dpyN68E9yHLbsvVnB4iZbDq5yp+3
 7bYM+HsJbXmReRYhRTvvlrFpjKjY2mt3YZzJDZFOxeD1LWSD7IKqcEsfQwmqKZWs/WKsgl2l428
 oIj/ZxJ/uDbPHjM3j8Y6z64kUh3J2SQm9ObHdmaKw3B+b0RA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfX5ngdGfuH5sjw
 UK7+FN9Jsoo0PbSG3XLfPFlq0w78DWOtd+/UhX25q5UtLUkZLW8HWxjPF9PlD7efdygrmS+IFga
 0U59UA6FMQC3+He0cHJevypT+FQFotw=
X-Proofpoint-GUID: WcusdLJ5WXckVmF53C-PgyBoBKrP8JPQ
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a4fa539 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=vdBeo_PM3xCM7oyOFJQA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: WcusdLJ5WXckVmF53C-PgyBoBKrP8JPQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfXxskrSrL43sRR
 VQTq3KvXpcQEd5kfFD7PImAOanCW4V+GLMWX/175md6TtE6s2Q9RGPVORxECRuedXrfsQQP9h7l
 pKpIQ2q9oxv2OCGc1s41MrMnRCEeRBTm6mkpjatjrxe/YnYFbU7N7G9sa8rn5KianjGv6jybz9I
 gnceLBMawOXJTjgA+yYb8DxQHZm45vjwNDIlJ60zPPMD0AgFOavST1frvuaALy2X56a3ghf6o10
 j4H0KMGE+qFPEqFOj3BgLgBmAvQd0PbWSUrELR25zVyrYNWMv31NB3+OVefhrUXVD4OZbBFUYsu
 gSSl+hvT8oAZyk+IxU/l2dFqHoAhr75H88DVX4P+Q9+O6cPiVJI00FGBxAPf0jcIfk0IwdxsdUQ
 b7oTT4eq+BxmoYNM8nhKSUagc8C0ohFHLb5D6JI/JRXifvOVYHLIOOKPYl1OTJxLHXtRu6vQbAt
 XPLWrn9l9Hq1bxrccDw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090134
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67169-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 74124731D83

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
index 6dbe18be5b49..526f92575264 100644
--- a/drivers/media/platform/qcom/iris/iris_core.c
+++ b/drivers/media/platform/qcom/iris/iris_core.c
@@ -46,6 +46,7 @@ static int iris_wait_for_system_response(struct iris_core *core)
 
 int iris_core_init(struct iris_core *core)
 {
+	const struct vpu_ops *vpu_ops = core->iris_platform_data->vpu_ops;
 	int ret;
 
 	mutex_lock(&core->lock);
@@ -79,6 +80,9 @@ int iris_core_init(struct iris_core *core)
 	if (ret)
 		goto error_unload_fw;
 
+	if (vpu_ops->disable_arp)
+		vpu_ops->disable_arp(core);
+
 	core->iris_firmware_data->init_hfi_ops(core);
 	iris_session_init_caps(core);
 
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


