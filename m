Return-Path: <linux-media+bounces-61702-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CdSKVgMB2porAIAu9opvQ
	(envelope-from <linux-media+bounces-61702-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 14:06:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3029554F110
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 14:06:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8FBA7313DE20
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 11:53:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F33AB480963;
	Fri, 15 May 2026 11:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E5hgCahE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gTHQZ83E"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EDB948C40A
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778845721; cv=none; b=X1GvvndgFwf6ax8coNaLn1AtcCIclcoiqMSxzeJbURodSporxDJ0OtKQlpdQ2jl1vV1c/k99sJxVDIjSGfgx75Ogzm0N4rLtGQ+XcRemMJHZ1+vQa3nxqmnxRjqI/MbKgROfU6OgMpO/LZR2mdEs5QSCTUj2gulBG7ACGufEpao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778845721; c=relaxed/simple;
	bh=1U+PXG9nLo9qUltBrYaeNctURowSep0vzQMqJImDlE0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UvkaE8yXnQDVzywM7ab6Fq8ir+bck2xmVdZk57GYKXo4b9qMkK9CRiSKqFcTJmDBuYVLoskaGMUDKGvXw7em3VfNGPaZkLQlLZX6Ce4BoHMLoS9LqUfqVgNexV0QsAZtXsxaz+J55pndSXr2kGdKouFQDqZR0x+flmaijgx55Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E5hgCahE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gTHQZ83E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FB1r1O3197662
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:48:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g9e6GbuUhCkLq7seP1dGvQXz0WTCfnuMhV6Ul6jJ9rE=; b=E5hgCahEDoP6SxvM
	/01IvCLjZzgvraKWJKFAZJvrlS07BhkPER9mvqRq7hsAzR1Qv88QPBfrd7yfjPAb
	hLD5qxWW7VAe5KxRBwaoATWmh5vp1XsIw9NhG6t3dKVheDonQHsPyhAQvyv3VpwS
	9pKt7dKfRVFPWC3PFAFDeazDQYYohYHpUVcPVeqwc/9UAqzTou113WY5ojGJkCf6
	mzrdy8GBeLBhfyY3nOAWI5pkqq1dMY0j2mDIGWJ6NMqyWOHA9X1FgTQoP/dpJPKd
	1DMrLmGy0n2/AhTRguvLP6mFju6ofAQ65wo+eFyIVH7GaGQ+eAGSjYGOCvNkz8CB
	UbJnxQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1qb3jn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:48:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d812c898cso217228451cf.1
        for <linux-media@vger.kernel.org>; Fri, 15 May 2026 04:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778845717; x=1779450517; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g9e6GbuUhCkLq7seP1dGvQXz0WTCfnuMhV6Ul6jJ9rE=;
        b=gTHQZ83E4ITa8wVrw75bYjVnU+dmvT0CDEIJBurbiDrVcJu0R7fTF8FgeIxRceiCPX
         2H8o498a7WJH4G6e343ERyjvCqHpQwT+FRIwsE5I9z3bapEdGpe1SMfRyPFCAMF1ub0J
         rahA7Z9CRb8wMY2B5nFVcnR0LaLYj6G+6FVcaC+skEDFlWgzS6Ix17I0P1rAQk10swW1
         CjRnPhJvwU+q/YGttYEDGpHOR7enbPZW9P/n4jio0SJV4DZJmhAgSJQ2f63nViQxqkRs
         oq3H34wktYBgK+bNlgtf/kfXzDyl7l6j6HAFEsYaA4Bn/I6SErsa3FAGC5FLJRDB3lfd
         bS+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778845717; x=1779450517;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g9e6GbuUhCkLq7seP1dGvQXz0WTCfnuMhV6Ul6jJ9rE=;
        b=Sx2MWT5REGJlpxm9+VKYto9hjas/yKHuS2bosvMbRFamX49tcTsDVZmYAXfLXBMBn+
         u/ACKujxMx+Cp60vZDZ/sLCn77AOM8ZwdcI7hmuBB2eT5Pvz2F0WDPQKKdUwFdXEug4s
         KxTql8OKFpTBaHMJj/yEKwlvZ9vwrMfk9r6w11EsjTV8ln/aOcK1ht2vbsEr53ZwRzMq
         9ih6cQEUcqlGXOEB8G66dfbfC9aTuoRs1p5sMWJqjVCT0ozedc3Bf5vHR2WXmlU5/ZdG
         ZdFrURltlSzW140QmR/tnSXlHuiAOjdUXjv9NHtGb1s5cMdMqA0INzx7SRen8onk/aFA
         1Qxw==
X-Gm-Message-State: AOJu0YwP1IfWHrkvR/vRQzCf1jNySlmLv1yXFBDiH8cfn/gSxoa6p7cO
	dlolRgMlCxvcBZ1NVqXqtjp10mFPJqlHygVNsUxh+0Q1Zkwfx6S9EF/ghRv6ffwRl+Ma7M/7y50
	QOAHlWXiIGcYzk+Yc867lVd52+ghFTmwojEG4yGEXuk4M3oXbvSkJGFYCxBhxEEp9ASpMppigZQ
	==
X-Gm-Gg: Acq92OHJPNnm4XoeOQ/mN5ldwO/z4ZtD5CpnyKLbGaAjpRT/LCGzZk2mHcAPV1UlBdd
	p0U1WAHhGdEsoWnUEt8HND3BwfLAxhfl7eMiR1HBsVryZ8ZX7y2BPO1OPWG2FYnc7GrFv21P3zJ
	hP0HCEa+GHcxnvt+uflZnEf91eVw/LTDyukcbGZTvFfxfg5YyVOBHy4vY+9BnBn2+f+sB4FWpM5
	JM5604tM4+/DGkv3IFs0iqYJwFFhYgQmlayYmuUrRiwI0AuW8T6rhBmTNBhaebSCLc9frQcew9a
	NXfFH9szJ6yyYnm2NcSAAbrNX4bm84D4DNCZhrgv6z5xUHnG87+KMa39Ndgrg21n4Zdgn/2I7EE
	DC4HoeNMlci7E2VJytrMSEnRH82afyDn1fIXkHhCKq1D9TULHLYMUh9i/uLaD2KGo6Y/PhEyLKk
	nG3xyv8/ZJal94Ksh9TsettEWE8PTkv6wM5QA=
X-Received: by 2002:a05:622a:a6cd:b0:4f0:131f:66fe with SMTP id d75a77b69052e-5165a285292mr38859481cf.59.1778845717133;
        Fri, 15 May 2026 04:48:37 -0700 (PDT)
X-Received: by 2002:a05:622a:a6cd:b0:4f0:131f:66fe with SMTP id d75a77b69052e-5165a285292mr38858911cf.59.1778845716408;
        Fri, 15 May 2026 04:48:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a682sm1265079e87.31.2026.05.15.04.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:48:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:48:15 +0300
Subject: [PATCH v3 16/16] media: iris: constify inst_fw_cap_sm8250_dec
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-iris-ar50lt-v3-16-df3846e74347@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=901;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=1U+PXG9nLo9qUltBrYaeNctURowSep0vzQMqJImDlE0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBwf2j3t0gdyFILDLQFigdxHWQCUaLnsGxp4QO
 ByqT0M/weSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagcH9gAKCRCLPIo+Aiko
 1VOOB/9nmtxijHAo4UEcjqs7xFv/rQMeeSy7v1tyrf71rjd+Gl+sXsx7+Z7hpP20zkoW5frewGr
 bP3o08iyC/7h685GKwAM1K5FIEan1ORH9FDFYI9KEuXiKFyaekiWhekrm6bsn/4bs7wtjPXSbxH
 GpXv8mAK7NlOYvfCO9lID5dJJyaL+yJdMAXSyRM4HjjgcsKZ90qmIMrK7wNlPPlY+PNJzys3Ka2
 JpL3OL6NegAcwygTifvw8tMfjOUUr7RPGfBLvxu6nrHbUXzPVYAhV/dtyiOl4J+119TWRCJo4s2
 wUJsWy3V7oIpeGTCJLeDomY3Q5ZrVuEIah8TMvi37T3JKanB
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: GQbUN8Ow6bqJZs8xPfdKXGEDZDLzqzmP
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a070815 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=aSZcYj2XgHFsS6ESuJkA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExOSBTYWx0ZWRfXzvDeWbljDJ08
 5S2uqMA/od39XQy+LZ3G0tkhW2IQDsbo/y+l2IlnTIJvYz7QUK41nqQTMj6EfE5Px3EUgTRlh1R
 DJop0L2M+EAsVm6lAePZWcM3uHvkCUsRmjrOVOXYecDNeUy1MU3svP4VLspeT7ZhqBzjObVZrXz
 tLcVVKyXeQ1qPXcDzR8NlBba4ei1M9y9NszLI8eTpt+dUl4DuRPGW3YyqqVKXYJwifl8keVha5o
 X9MJlkCP7su5sPjyTq/NURHGAskidGSfsek29sUywy7LXPk8/OEz8Y98lPwKzvsMYQw7ElujFXi
 3OuTVjfeRFUu4dBJme0bqIfGgDyWS9pFQv7larI6WrEp1F8nNQcx7ygfyioyLdJtV+k/XIrmu31
 m2kcnr5TfcgatUS6J52eL0ZLfEZxlvuFRPg6CIYHXItsnr6dmIqlUTRaCcWbCQhCuylJAt5jdDu
 ot/Ru7sPNXCOQOr6/xw==
X-Proofpoint-ORIG-GUID: GQbUN8Ow6bqJZs8xPfdKXGEDZDLzqzmP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150119
X-Rspamd-Queue-Id: 3029554F110
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61702-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Mark inst_fw_cap_sm8250_dec as a const array, the data is read-only.

Suggested-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
index 39e88d5dd6d5..6ec5ecfc7759 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
@@ -13,7 +13,7 @@
 #define BITRATE_MAX		160000000
 #define BITRATE_STEP		100
 
-static struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
+static const struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
 	{
 		.cap_id = PIPE,
 		/* .max, .min and .value are set via platform data */

-- 
2.47.3


