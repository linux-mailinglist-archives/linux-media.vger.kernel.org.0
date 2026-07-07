Return-Path: <linux-media+bounces-66917-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RsZOJGd+TWpi1AEAu9opvQ
	(envelope-from <linux-media+bounces-66917-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 00:32:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D5972017A
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 00:32:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=eh2VFirS;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GeJAIYLH;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66917-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-66917-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F152A3017F2B
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 22:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 090523DCD8D;
	Tue,  7 Jul 2026 22:29:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225F4495510
	for <linux-media@vger.kernel.org>; Tue,  7 Jul 2026 22:29:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783463390; cv=none; b=SLePuRYutuiufSbECDTqGzYXu5tUcHSJPQ3FLd/kc3r+4lusDZoSrFtg8zTuqlhMiekCobTVQvIX2grCzQEHVkR4z7V0NkceRkZ+IwaYKt3pFKJZm+6dxWBQk4JcYutFt0IH/jzBzM/av8EGoKhdAS8KBHl7/Lbw5aW2Q1TH/KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783463390; c=relaxed/simple;
	bh=sUPB9VJRkRZ4see9KcmUKrC+0hNnHbRSIZoFexQREuo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OKMviPv/vPjFxS0bWFmpFAVQMqTfT7VixGI+vZPNZHXtiij7kw60yVusYg7e6iecdALcpsyylJzNqTHw1H49jHYw4BzQkjAEZzSRISM5Pmj5EhRecixJkGauiBI0QoO2xuS3rkoQOcGEHTwvvKS53t6RsOj/J/4wJiqrt7TaI04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eh2VFirS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GeJAIYLH; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667JesZj371587
	for <linux-media@vger.kernel.org>; Tue, 7 Jul 2026 22:29:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U0gyuvkccvtpcfH79fJjPBeyRgK2qdZ/uoYlWvMd7TM=; b=eh2VFirSp8hsmcxN
	kzto/3rotun+g/QFxK8d7kohVfpw85C7xdbmXzOEblFacdX04JTBHcbQ69sl1xGa
	o2kEPRd4KpF62ioyQ6e4li9/k5Zl3Trnh8jr3Vl2rzokkt5oXMpi/XoMnR2jZwEQ
	9bIBOtWGnT9EVFLxEULDwH3vhfWaRDGbUrQrQSmeTZ+v8OzgsG+dcwJZwmZldN/S
	xcafBEbodTlLh+0MauUt5xRaaQRE0CP0yeVEaC9yb7rHNvAmgXJOYC+fwpQXEJcn
	yQmehrUE86gUk+lK7zwUKkoj79IVbcjp3mw2v0GYi3E9birhhdgRQzx2+YbDEah/
	+q1oLg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f97u10hx6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 22:29:48 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6751db2792dso10339137.3
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 15:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783463387; x=1784068187; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U0gyuvkccvtpcfH79fJjPBeyRgK2qdZ/uoYlWvMd7TM=;
        b=GeJAIYLH+5om5P4aqZGy1b3YPijYCTJbJdc1O4HOR2Cxjhj8n1V0AYGWfg6FPvYy2D
         27PrtHrlOJj5H6GcvQzswTWKW7TeeAkAvMzz2ZIz+S+6bNeRn85GZYnRbcE8UssdSXRA
         6d6UO9W79sR5qKWoGYGwyKTegTFRi9FUdWDZZUHXCVCx1EDZuvIK77AusoLNOQY9TNlD
         Ea/oXxHIXKqgGcGtrIHkBcAlDU5VznL5y7SuSWlLG/CxpTcUgmMhhceCfvxQFRb6KHh6
         Zw+cHZY33ZtPIErdMskNPCpFy8BugmeKtRKH0v8FwTECMrzWZ8iVLa57NNbTLYZudkNu
         FC9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783463387; x=1784068187;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U0gyuvkccvtpcfH79fJjPBeyRgK2qdZ/uoYlWvMd7TM=;
        b=mCrngEjStipgY4zhigPuxzQLhtCgIZFvl9JIQKl2ylqEFPNEgopTGSPqf74yOjK0g4
         ir3HIkVK+QBOJlXpaeGi6DONSJv/Ij20qklR9tdo6QWALAMkmlw2e/2DLtdE2gVydFD0
         zIG7I/YgtPhp3/Uqn2d/m+Rs950WDHQcYOTuNLDWxEA7hu2XYai5pIR76QhlCnUO6e3/
         kUUeB8YeLuW3Vg0GFAClwsb4zVXHSBBoBAfoFoiUcg8xXnb0u6i/TdkMRmSQl92TMZnj
         MN+pvW/H07E/VoaBpTN30xKr4mt615HYRcwFNkP5m2VFoE0xjAQCB0O1fIq5SztIjAPO
         xG3g==
X-Gm-Message-State: AOJu0YxEWBx0MojLw8CF5ttc9ybRiZS+up5Ev+Wj0Ni13O7+QJfNxeuU
	4WVXT2cmwvkZLAWIPHwIo2SnAhZAA7pxQ3rniL/EZVzFm5gloaDDwla1Q0eNQQ6MzYpQzcKUbNO
	Vb7QQa5KlLXaC2x52urNBZDF31aXGdhQ+ihfZjevU2JJswy9Wq0QmkWNfx0ws/ANq5N+1sNjCFw
	==
X-Gm-Gg: AfdE7cniH/JBld52eVHqfYzkz8+IKQbllNknXbKa8QkLMwyP2WT+Nw4enOwXxcs7Mk2
	1WfjIr6gS/pLpfHdMhUFMXh6c/b3xquaOAW3KtUawbctfdCzlAXgoh0il2npqjGB3Hcbdht9E3q
	zktCawcuofiR9dkEn0yyIAVvndhcBQGPv3lSwazZXXRun1AaqH0kjnjmbQD8QohmXIT1cGWL3/h
	Yyokyooysi5CyDroNa6z2mMfY6pWX6knr8obIPv56jAFY3VhvbTDqwN0jlm8V6K/EQpFDS4YARs
	IzwnimAHkWUfCr/83zc3x6Dqks9E2K52cBPVVH5Uwv0vbTIdDRbMrXgJoMEYEsUqjqBNQx0s+Cg
	htkLqUWmmVmpe42Uv/wYd2yqjPOLabfvkJHIazQoDHcgxiHJVQCECe7HGytoL662xfAiPB6nE1t
	aab1GUotsEhUPoNuIIdX7B+UwH
X-Received: by 2002:a05:6102:80a2:b0:6a2:b2a1:f16a with SMTP id ada2fe7eead31-744b79e73fdmr4142732137.2.1783463387231;
        Tue, 07 Jul 2026 15:29:47 -0700 (PDT)
X-Received: by 2002:a05:6102:80a2:b0:6a2:b2a1:f16a with SMTP id ada2fe7eead31-744b79e73fdmr4142708137.2.1783463386773;
        Tue, 07 Jul 2026 15:29:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c7312bc25sm1897231fa.40.2026.07.07.15.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 15:29:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 01:28:53 +0300
Subject: [PATCH v6 10/18] media: iris: skip PIPE if it is not supported by
 the platform
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-iris-ar50lt-v6-10-374f0a46c23b@oss.qualcomm.com>
References: <20260708-iris-ar50lt-v6-0-374f0a46c23b@oss.qualcomm.com>
In-Reply-To: <20260708-iris-ar50lt-v6-0-374f0a46c23b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1159;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=sUPB9VJRkRZ4see9KcmUKrC+0hNnHbRSIZoFexQREuo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqTX2pL95t9jQq8lNOF/M+OkbJVqioBQ+JK2X/R
 IN4WGUw0YSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak19qQAKCRCLPIo+Aiko
 1bnnB/99M5CcOuO53dfh5VDAPsQE7i6gYXe90nCIaXeBv6uDxp+Al4Bhx6r0ca8RCoLzi58dvDm
 dXMyaDFuLUfbgFUp6ZDkI0a5LdKjvQU4snIDKC9TGc5lsONjzXy0xrx69am6ucmm3XemoOkZgo3
 ThJM+eZJIQlYB4zq84zA41/gi0rwMbS3XGXSGNy673OlSPdE8UYNEMnHWL+Nmn0mbZuF1GkbJcQ
 wLimCs/T/KuUCZ9lVViYpzpRx7c5yzjRhf9h5/IEiVxcTIEweygqAodcj/4/CV4OSdNXy/eTkEt
 MwLs28u5goB5hgMTwb9RxflEosHqdcp3eYmpIReNYk0WYhzk
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 2_YDMo4Sq7hn2d4J8SSXulXWP5Wz-T86
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDIyMSBTYWx0ZWRfXyB2e3dhWv9lJ
 JJrD6Zx2SFEHslHYDJX96FgCWR30Bit20a3awIk9WFYb6gofyhhloUDNqP152LeYclxALqDB84U
 nNGUEJ0OCGH+/7E+amFwSJ9ErADw2JI=
X-Authority-Analysis: v=2.4 cv=F9JnsKhN c=1 sm=1 tr=0 ts=6a4d7ddc cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=9TuWGWrZIemhly9L:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=DRvvl89rPFtLv9ObwM0A:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: 2_YDMo4Sq7hn2d4J8SSXulXWP5Wz-T86
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDIyMSBTYWx0ZWRfX9Uz7UcZRHWor
 CU53KuNNtyfLU7ddXHwhQYNqKnLJrqpwAHTP19xkGsIuA79q8Wgt0AF4lDpVzfnNpIY+QBrerYV
 kPlpFPz36FxYMNOBDplqnd1AYgB7CIeCsZDbQZGInKoRSxY24v2CUOph9AHjEhcurfoBuqfYs/9
 nqnrdn4rhqzEYLU6JR3/pB2rODqiIc35DmNvhLreAkmrR5A21EDGAjf5MfD6BM9c90lkI3SRUtC
 YAIS8Um5zRyeXDBkmdyesg8DmSzjcvMdxesl3C9QPS/AJhHRb9Nj/KG1yKhMsRRb/K5AXlYDgMT
 RpSGV+x0Wd15XbRpYAd5vm5rehA251Su/b6hdeO0Tw1sUpPhcsHoORqBmEWSPcawsLRFEVWlMKl
 rXpIbvKrwfcDNf8KRrnYvyZyD4M7cm7+M2+r5S05yZ6hR4CKSHBMDSmm6NQ95k45BqjCV+mQonc
 KOJ0xV88ciFBgskq90w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_05,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070221
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66917-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 88D5972017A

AR50Lt doesn't support HFI_PROPERTY_PARAM_WORK_ROUTE. Tables for AR50LT
won't have corresponding entry in the capability tables. Let
iris_set_pipe() silently skip propgramming the property if there is no
corresponding capability.

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 10e33b8a73f6..33a34573391a 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -534,6 +534,9 @@ int iris_set_pipe(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 	u32 work_route = inst->fw_caps[PIPE].value;
 	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
 
+	if (!hfi_id)
+		return 0;
+
 	return hfi_ops->session_set_property(inst, hfi_id,
 					     HFI_HOST_FLAGS_NONE,
 					     iris_get_port_info(inst, cap_id),

-- 
2.47.3


