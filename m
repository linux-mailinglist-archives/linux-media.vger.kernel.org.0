Return-Path: <linux-media+bounces-67170-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uVr/L2imT2rzlgIAu9opvQ
	(envelope-from <linux-media+bounces-67170-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 15:47:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B183731BE8
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 15:47:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=AHNlYQTf;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=K0HJ8Uy+;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67170-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-67170-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BE3303096083
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 13:43:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E520314D26;
	Thu,  9 Jul 2026 13:42:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7CE3358C6
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 13:42:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783604542; cv=none; b=cm8emovQR1NGlHmk0jVQC30L+dZR0kTg2EYWgk6g6QB5VIwosjAVGaOL+Dp/MWr0dV9J9LC0zgRWBJxcJfZDYDa879vrr3O7aALOmnIVtFjgMPssLMlwp63Gy46rIfsLfFZLDvuo0kTkUoy8BMxVEdqepYXek1k3nxCtwAeMmuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783604542; c=relaxed/simple;
	bh=cPTXXI3mknLotK+Tb+V1ad85mR3WKey4eZTl/ep3O08=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c+YhYOEdg/HkrvcwKZgKVJ78fki/GiyTc0YR2A95Ix4veOoxrGnz4YS2YdrCxQrFHtJlUqX5A8GW06ILDGdueYIRVTRZIFebCBAgChTSMb8O9ysZQYPNW8chZ1mjv93c5uhQVmo4vdLdrSMYYdPb1A7e9+xWJGpRs+zKZ1bjJSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AHNlYQTf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K0HJ8Uy+; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNC9m1575382
	for <linux-media@vger.kernel.org>; Thu, 9 Jul 2026 13:42:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ww3O+xZWHTL3y5Bq6dWUkA7w+aF9j0eNrHZL0WdKA3Y=; b=AHNlYQTfq+YLB02n
	jPF4hH6dtpFyQ0pqebLOr9aMd2/rv3WTrtBp5RsNTgITWPM/PhdklWZeya33yh4R
	u2Lj2CIijI0EOGQPeAvnyZwNIJJygsEXZX+kZn0UoqzR3mdlLXPfSVDu5RR9uAjt
	r2XJ4vgR83zfDZjTmN/zD6PlRXk1kWhTwa9iL+ezn/I86Mup3NjhMVW02xBbNV/w
	kfhSwA0GW0oZ4W9un9BdirUEvcyeKDUEwah3vu8xvjUWxf4Fn15No8f6MzAcFfzp
	jcPHyiUeoSAypdDCK5yejE3HCKth2tRooIC1Tm1iELuHmtiXRaTXN1xZoiuhfnb5
	swR6iw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqwcfv8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 13:42:20 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-744dc532943so762444137.3
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 06:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783604539; x=1784209339; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ww3O+xZWHTL3y5Bq6dWUkA7w+aF9j0eNrHZL0WdKA3Y=;
        b=K0HJ8Uy+aU9C/zeswK8n+7olt6jpelHormnfa1YBnKM0UnQIzpT+Iam4NAb3VV+c2l
         e1asrk2MngV4JRllRMs+bnd9YkMi+UW1OSWb/aq1i1zN8+QNPVuMA/fywiI/3p2j80CC
         M4OL8mIQDy9CusSTH05pFuWTpE4PkJmonV8pdYgTncSCPdd2HXmMAexaYSxNprLeerCB
         6VXeubigJr7JQPkIHYgaOgu4YEjeGpfRkD03VM9we0Nal4ZUQ0rJ58uG7g1DHrKyIEAQ
         qMRLCbHsF2aeIlK3yD//GYzp3dBalDDktxRwVcM28PExpFqWhKZvo8DmcDu0AMyttBbs
         1fRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783604539; x=1784209339;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ww3O+xZWHTL3y5Bq6dWUkA7w+aF9j0eNrHZL0WdKA3Y=;
        b=AvxKL7yLy8INqIuPJCy1J00FQs8nFfoxWBoKEyZ9DFLwaK/9tpZz/DinoMtOfmkVqJ
         DVRo1dr3Yq39OgCNEhggxOFWBUNAC8Y03Al23+J7TPkoXkFjQw4R/2QGbl3N6mwGpZrB
         IOzW6wd/OCkJJ355XMYwyY4lbLeiwb4Gkr7Hn/VRyNaGezboCm8WwEmKtfB5tfPkgUww
         gIJbOZwmxGwtoYyaeHNlUshhA0jjMOD0hr9ssw/S9Mbh3gXTsseAkY6PK3rqs0kPO/YH
         zT6JBojyj3oPUNCHI4JfEp2hTeTWRrmWjLbO360Y/dwHhUC8DW3CpmR5UM0l2sQKh96N
         NGdQ==
X-Gm-Message-State: AOJu0YycqhhZi3mCCb0BelY0Fxur61l534vAl2xj8mG2AUoLDcz2/Sme
	ibBmSapLNFh6WdD4sYGXsE1rsx+LPhcNGEodXI8MEkcdAq1nAdRSEUC2Qs2DRpkqQb/vdwPTlLk
	oOP+SuA6kYGPehHCM1Vs5SFVnMLPHc9yBdb3Tn/Er+YH/f3atSlFJkA2+3gW19JVnKQ==
X-Gm-Gg: AfdE7cnBa8ReEje6buOwzp8NZhY+QvuMyr8OSQyuwZ4hl10lI2WA5PsVT6c7RGRJIoI
	thzZfCNq6Y/Jn6G8q2nvedraQTUsnzvnwdbp4v2NK0iOFflprkAuPT/saVn/x0Vq/orBMyd9uSx
	kgOzB4rnFnJhJqKiFnO+RYHnaM0vFBbRU+JWMFRGEqT7xUWwzDPCKkIxIO2YS5LJP2TI1cF6+bF
	450D230fZuxNnCmFWTS1ByG6DeyXaqrHE4nzNfJy0x+gc0AOIbHkzvipeMbIicwTiLyiR8E7Wux
	eIW32rgFebq2iGrtU/hys6mqqRTQtQkpmbc0Dr2pGcpSELFLLr9VbENQWwcGS3FbAMdD3fe0Cav
	s/JIrlq+e5EfEb0I2MXgswiVy+7FDpYgvyLG8X/IklMcd1AdjAgOEvsso3+T06cjCrojdxpg7W9
	Aaen4RsaHfnMOqhoTV04oxFDdT
X-Received: by 2002:a05:6102:f89:b0:744:cb59:d6e4 with SMTP id ada2fe7eead31-744dff883c1mr4748012137.22.1783604539538;
        Thu, 09 Jul 2026 06:42:19 -0700 (PDT)
X-Received: by 2002:a05:6102:f89:b0:744:cb59:d6e4 with SMTP id ada2fe7eead31-744dff883c1mr4747988137.22.1783604538934;
        Thu, 09 Jul 2026 06:42:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c849186e1sm3345151fa.9.2026.07.09.06.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:42:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 16:41:59 +0300
Subject: [PATCH v7 08/18] media: iris: Add platform data field for watchdog
 interrupt mask
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-iris-ar50lt-v7-8-76af9dd4d1f6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6946;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=KKYwQvV6HfPLmLckhIvkwX1DNxqvTV0Ag1veh8Tp1rA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqT6UlQoHH4h8r9m/1xAdnLQWeWCfpk8+r97P5W
 nwLGSKwxeuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak+lJQAKCRCLPIo+Aiko
 1QRyB/9Ua/8ga0fyfM249+q4hk0FOEFtT0M7eL+v3TZEnjIckdjtWAzRpcU0gl9934IeBTIx5rx
 sItV4XomzcceIYM+FlWZh550XJsk+K8NklHQyIQ/kDfVDIXloXQ7duKWSee4Ck2C9Jm6RxxIH4A
 84kV40saumdvDWT3RIFmrsSXQ+XqxfVPSe24DKOz+A4euIBzbYDFnLHA6exVckn72qI0xPJDCA1
 Xzy+RJGGzuRgVxEZStvN9jll85Z6niwFhAOn98iUQtwosM2/aXDorMfJd4X32IGaf9hZXz3JWW/
 uUAat0Nl7I22dmm8cb87Dd2bio6PCs9x2YJfvbvJpdUZQ4gw
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfXw8Iiy2BIoNZt
 kq7UZyvtj/g4Mcj+5OotFujwF1eGmKYtJ1yWaXgETOGPdkBBTlWgDmxKgGkl22SBhmjyLmxucog
 1JsSL/00ogC/vuM6v8mct+GZvrLg3srsjdCPMqoH/VASLhrFXhCHwXAgNC8yzjoEj6pAAKgSir2
 yvPZRpyanYk6DoEX5stzfmEhzDfZJUezQ1nc66LbfsfrczKc0gOlmPobX2BWZFtZOU81hH4yp15
 lRLuVyYdiK/P8+WgxLMAfyteB46eaKGuY4Gy9YTAN1iplzvq3yXEKLMKng2PUJqeeXG/Oyugie3
 q2e6xF8QBeqHeI7ARu3885wE5SgqSvmTo4lX4n3LR+JYuhxLdLv+IWv01Ksd+PoXvVjoSyidOZk
 igDMxy+/8RKWlz9xwynHFU6LJD7lpYG9q5ItBCpDdHodDzCox6u7qOcmFRfKmOUoYzd9AQlnfXN
 BgkX+i36KqJ41VX836A==
X-Proofpoint-GUID: lLnXsOVNvXUp4NJxHt19ksYyuTJm1GHM
X-Authority-Analysis: v=2.4 cv=fMIJG5ae c=1 sm=1 tr=0 ts=6a4fa53c cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=6vpm4igQ2ooD_hm6sYAA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: lLnXsOVNvXUp4NJxHt19ksYyuTJm1GHM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfX7G9+bMZpbIn/
 8TkgLZjvjQy7ZPYekk7YLLY84u9560YNAj6ji6D2TafYIpsY9o0L1bQ1q5QPLoaQeMfcGVYQuKK
 XzXnxQXY18CxtukKHEDazmIfIwkIvnI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090134
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67170-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4B183731BE8

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

For AR50LT core, the value of WRAPPER_INTR_STATUS_A2HWD_BMASK differs
from the currently supported VPUs. In preparation for adding AR50LT
support in subsequent patches, introduce a platform data field,
wd_intr_mask, to capture the watchdog interrupt bitmask per platform.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_platform_common.h      | 1 +
 drivers/media/platform/qcom/iris/iris_platform_vpu2.c        | 4 ++++
 drivers/media/platform/qcom/iris/iris_platform_vpu3x.c       | 7 +++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.c           | 8 +++++---
 drivers/media/platform/qcom/iris/iris_vpu_register_defines.h | 1 -
 5 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 55a4fa356985..81fcb2854772 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -315,6 +315,7 @@ struct iris_platform_data {
 	u32 tz_cp_config_data_size;
 	u32 num_vpp_pipe;
 	bool no_aon;
+	u32 wd_intr_mask;
 	u32 max_session_count;
 	/* max number of macroblocks per frame supported */
 	u32 max_core_mbpf;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index ba91672df1bb..940daddbafcf 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -16,6 +16,8 @@
 #include "iris_platform_sc7280.h"
 #include "iris_platform_sm8250.h"
 
+#define WRAPPER_INTR_STATUS_A2HWD_BMSK		BIT(3)
+
 static const struct iris_firmware_desc iris_vpu20_p1_gen1_desc = {
 	.firmware_data = &iris_hfi_gen1_data,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
@@ -94,6 +96,7 @@ const struct iris_platform_data sc7280_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu2),
 	.num_vpp_pipe = 1,
 	.no_aon = true,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = 4096 * 2176 / 256 * 2 + 1920 * 1088 / 256,
 	/* max spec for SC7280 is 4096x2176@60fps */
@@ -124,6 +127,7 @@ const struct iris_platform_data sm8250_data = {
 	.tz_cp_config_data = tz_cp_config_vpu2,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu2),
 	.num_vpp_pipe = 4,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index 7098b652c117..eeedde8fc9ce 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -18,6 +18,8 @@
 #include "iris_platform_sm8750.h"
 #include "iris_platform_x1p42100.h"
 
+#define WRAPPER_INTR_STATUS_A2HWD_BMSK		BIT(3)
+
 static const struct iris_firmware_desc iris_vpu30_p4_s6_gen2_desc = {
 	.firmware_data = &iris_hfi_gen2_data,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
@@ -113,6 +115,7 @@ const struct iris_platform_data qcs8300_data = {
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 2,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
 	.max_core_mbps = (((3840 * 2176) / 256) * 120),
@@ -142,6 +145,7 @@ const struct iris_platform_data sm8550_data = {
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -179,6 +183,7 @@ const struct iris_platform_data sm8650_data = {
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -208,6 +213,7 @@ const struct iris_platform_data sm8750_data = {
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -243,6 +249,7 @@ const struct iris_platform_data x1p42100_data = {
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 1,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 375bcd923476..41498f94480e 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -109,11 +109,11 @@ void iris_vpu_raise_interrupt(struct iris_core *core)
 
 void iris_vpu_clear_interrupt(struct iris_core *core)
 {
+	u32 wd_intr_mask = core->iris_platform_data->wd_intr_mask;
 	u32 intr_status, mask;
 
 	intr_status = readl(core->reg_base + WRAPPER_INTR_STATUS);
-	mask = (WRAPPER_INTR_STATUS_A2H_BMSK |
-		WRAPPER_INTR_STATUS_A2HWD_BMSK |
+	mask = (WRAPPER_INTR_STATUS_A2H_BMSK | wd_intr_mask |
 		CTRL_INIT_IDLE_MSG_BMSK);
 
 	if (intr_status & mask)
@@ -124,7 +124,9 @@ void iris_vpu_clear_interrupt(struct iris_core *core)
 
 int iris_vpu_watchdog(struct iris_core *core, u32 intr_status)
 {
-	if (intr_status & WRAPPER_INTR_STATUS_A2HWD_BMSK) {
+	u32 wd_intr_mask = core->iris_platform_data->wd_intr_mask;
+
+	if (intr_status & wd_intr_mask) {
 		dev_err(core->dev, "received watchdog interrupt\n");
 		return -ETIME;
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
index 72168b9ffa73..4fffa094c52f 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
@@ -41,7 +41,6 @@
 #define MSK_CORE_POWER_ON			BIT(1)
 
 #define WRAPPER_INTR_STATUS			(WRAPPER_BASE_OFFS + 0x0C)
-#define WRAPPER_INTR_STATUS_A2HWD_BMSK		BIT(3)
 #define WRAPPER_INTR_STATUS_A2H_BMSK		BIT(2)
 
 #define WRAPPER_INTR_MASK			(WRAPPER_BASE_OFFS + 0x10)

-- 
2.47.3


