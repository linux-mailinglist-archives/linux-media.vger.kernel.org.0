Return-Path: <linux-media+bounces-60696-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGeqLBnn+2kZHwAAu9opvQ
	(envelope-from <linux-media+bounces-60696-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 03:12:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD2F4E1E1B
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 03:12:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3739A301E14F
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 01:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D096245008;
	Thu,  7 May 2026 01:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pMvFvXIE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="buB5gxBg"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E86E283FCE
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 01:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778116263; cv=none; b=FDBAP1/Qwc6s3I1WSkx4zaR7NNfTzZunprgWA6jSCf+kavgLVg4shsFqBzCCgDpxs/DnU1feb/KGe+3D/b3rPI7B+bP6AOthiA/g9lkMT/rxeDTDjgnBioGBUKLIqDEfiYYjQrCRFvLUELpgN4RzmfEdCXV5cGme82Roy73e+Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778116263; c=relaxed/simple;
	bh=xVQKhBlnz8hXPbwNoQtAmXq/3flzYc2iyG4Mi3MNz1c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GvB7Dzil/QjH4icNQ40X25a5pVc/X47bhByPB9ML0sh4UzgFIahZgo0vR5wHYF4vBwrly0kB9la3dK1z1oHb2jCRGK70hUeavTu/izVHA2xIVYged5kO8BCLqDWEKUyqaWxPFeuD90NaMd0fEGaB4u4F18FLr1XFR6vzfKTia6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pMvFvXIE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=buB5gxBg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646ML8hl3309018
	for <linux-media@vger.kernel.org>; Thu, 7 May 2026 01:11:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3cbC07/Eo3G+pDdHAs3dopFNLJBtcTLJDOfZanVclgA=; b=pMvFvXIET/A2RnL+
	hzq1xZFQUeIn9C7+c4CtIrTDKU9pi0Fm6isW4hVfYfhZAQc+U2+HSCE1HROibW5S
	ORXrnqbI/2PmqwHpdoqAMBYe8vGixZuGm3jenYWkO88L4GUR1Y0dStdns4+5gWH4
	U6G2zdhkCyaLwkWhiiUbUDdiQUeikLjzJw1JO+Of2IF2jKtyCeReYGZZpNsZDXSf
	tAoyZFZm71bsnQTsdPZmNHnWI0xWYbgxtek1nzgRqV4Yn5ZZLBINOmS9avIlYXtg
	B17rv21IaTH1phor5wRDhOG4OQVrniWCytFXLE4U1dQsJWKl50hyTKVsbdljHMYu
	gcTYoA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e078sj2xt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 07 May 2026 01:11:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d84b5f73bso8918851cf.0
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 18:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778116260; x=1778721060; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3cbC07/Eo3G+pDdHAs3dopFNLJBtcTLJDOfZanVclgA=;
        b=buB5gxBgDEGUfh5T42PfErN5DfYksS7nfpK6MLgLcLbj5bRU1b89IrKt+7IfCT9/qZ
         EE53nzB+m4Qt83jQRhXCSLoaVFkSKf0kE5P3et0dzsR88pAXonTvcAQYGLYQQk36Qm6n
         kYwRn3d2Iu89Hv/2egY0yMirs7027Y+trZStsznDXZp5PPPlD4chwiJ9pvNfH7S9IAsl
         y8EJf2c3O1QCSKUBK8k4jAUNZosVLa/hpi6lLTEsTTWv1hbXhZwDKlAZNtJrGqFIXS27
         dGhilZQ3bqDs4bczhXkFxLI6f/4IFmPzMA8kGeawm4hImpH/5Y5/Tw0OZfTSSkNL86d5
         OtEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778116260; x=1778721060;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3cbC07/Eo3G+pDdHAs3dopFNLJBtcTLJDOfZanVclgA=;
        b=q8GUNhHMWP4TifHrIImpBnR3AE0cQg0mVuy9TF1rcIVFR/H5T2KGy8O1/RpZO97Pfp
         9CZlWe/v7FKuFbRYLtEm80/Z4p+1JLsKl4/7pm+EiS2Xre5hWfYAAVA28xfBb6yrJCC9
         bd5bQSZ9b3FnoyUUvk/BvpOh7SqD2fpioqCk6hyxu4B3Jc3nrb1NovJk9sbHlu1x7wQO
         NnuK9ORJvfGYEBAAYk5KsTxaREByk00AcZa2/Kc28AmjCqXxUOiPHfF2bQo9iK9nUmA5
         RpY/WthQjRYwxA0hcP8LTNlgBe8Yx1d9Y/oKQhyjH093YDKbDIXwaFCEbuR6z4GQl/VT
         o5jg==
X-Forwarded-Encrypted: i=1; AFNElJ+2V7NCeurfe1UiguranrwJSRjCwb1HYEGqlU4wvFV+6iOX1MwAF0r2lNvMw2Wibs2z/re/eWCv34aKoA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPryUN7DEhOCSarFZ1AI6qGvfkyiQQa7IYtUkAUK0DYh8WDAYM
	r3U52BNetJxGeSHSuyiktfJqwCon0u4qYek5G0+yc/wIyZtWTRRJ/laG7q7rImCbyej61syd8pN
	dhL5tgzGZBSTU7tW7grjqNaKxFiYIcPjv5e3/sfRnA/nmkXhfZW/x93unuYZoYC/+hQ==
X-Gm-Gg: AeBDiesbodzo1GzwnfX6E3Fk2zBMr6zBo9wO7+Gr071ubFhaVyED2nxlMG/4RzWi+u6
	XOmARqLFSMyuXjp6/SFitBaNN/A0Z1vwr8vZ1h3CZJ5reK671EKeqNBjul0HQbP0/qsx5MRGjF6
	0ktwfhDoHswMPyzhn/H6ZeTdUptgdUvDGHHfTD4i4Soo0t+aScKcjgZgeF8ZB059jO/TcK5quil
	fyEGrIxJZC1PeVZy5zrqRcZGVG4Mwlkv4EgKF2bkix6dBAROBoOTpe6PgNScA/t1D8d4AsKMgCx
	aCS3CeN3Vw3bj/07HbbyoBsc6dpkddlaCVWmcEvGHfWOwZaxxRLbzYqoRVQN2UoVIK+fj4uOSp1
	7xwhHWuwWTtl3rCKAvoeqZy8BpO+5q+IQ6SeX5wWNphdPqCKPtR++JNmqxqe36FCi3jkAk5Z1Zs
	nYP2jnUrJXbuXKsdyq6RM/oEzAJDwEHe4vfjuSTJ2qSHFDHg==
X-Received: by 2002:a05:622a:5a8d:b0:50f:bb01:9867 with SMTP id d75a77b69052e-51461e6a460mr74665071cf.25.1778116259798;
        Wed, 06 May 2026 18:10:59 -0700 (PDT)
X-Received: by 2002:a05:622a:5a8d:b0:50f:bb01:9867 with SMTP id d75a77b69052e-51461e6a460mr74664661cf.25.1778116259396;
        Wed, 06 May 2026 18:10:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c230e00sm5221967e87.29.2026.05.06.18.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 18:10:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 04:10:44 +0300
Subject: [PATCH v5 5/7] media: iris: don't specify bank_spreading in the
 source code
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-iris-ubwc-v5-5-e9a3aee53c49@oss.qualcomm.com>
References: <20260507-iris-ubwc-v5-0-e9a3aee53c49@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ubwc-v5-0-e9a3aee53c49@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2406;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=xVQKhBlnz8hXPbwNoQtAmXq/3flzYc2iyG4Mi3MNz1c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp++aUF7FROeuRR/ksxFtIZQ49QN/N6a+8IkF/d
 c73wr3U0NeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafvmlAAKCRCLPIo+Aiko
 1XvwB/4l+UjOdCNxWIfry0J6iuUu50dwJCcJTUw3jMhnMlKdt296zh+0eJWfXDCwIMHFzuUjrC7
 oj4iBSmob0UMxpKefeEH2H4Zlmc9VN5LK1lQPmnxcfInL4F6YGuqI1qzPAP6kWTpge0Z7F5RnLl
 F513ockCRmt+gSCZa28UOdPS2aoCQGMxKfl5usnxEQnC8DWOH5YY4/h0KFAOhepZUKgcXIgi8Ro
 C9KWxIsS5ltN+enFnjaQ7BDX9t+wzhauhlOHGC7Y/AJRb0122/9q5ChLPGTsw2a7PFVy49YHgCr
 hVmFynEbrI1m3tVxak70fmTu4GbH96S3mNzVGMyE0G0dd7L7
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Lc8MLDfi c=1 sm=1 tr=0 ts=69fbe6a5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=fFUJnxvTdpzArna8SyMA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDAwOSBTYWx0ZWRfX5uYdnt9WHvzq
 rqWWdsB7Y7OTfPdwmBVh5MpSD+niOLQfGCEX+dOWjIyGNSuLwMoz1eAGJEAQS6e0DFOd8NbpVkX
 svDHe6P6x+dl7mubl5G2fAVo2jaGTKqo2tW368rtAgEXpjtQTu+C4vXrZntoF8z/hDS+QRrDm2z
 TSWcaOD3CFwNGWk+SUZUETh28N9Hb5HX7ImdEDlaR7LNsg9o/TcTg0v3+4ovX5Ic77nkC+7zpwQ
 MnDrksflkGWSs81IiuBWgwsCNa5oiKo8eaWkEoR/tjKrCIdeyXZKjuZD1RaWSLhmxUOi3xJM0Zq
 rPVuPW/YYU0/QYxNsxh12PrCYfN2z5TQ6y16UmA+Y4pvPPz5XPAvj8JbtkQehvil/McKD4xqvlI
 CjhDHrt1bKRKJbEYlm7x7geuCAiYa8d3im2yifOT4ut+ApXvfBwyJFiZl79lbcoYKWWbAWg3hBM
 iWJaogNEMjAGVgVcMMQ==
X-Proofpoint-ORIG-GUID: y4AzQAtmFPEu8RDAk6U1420-UQE7wtWa
X-Proofpoint-GUID: y4AzQAtmFPEu8RDAk6U1420-UQE7wtWa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070009
X-Rspamd-Queue-Id: ABD2F4E1E1B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60696-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The UBWC bank spreading is specified both in the Iris driver and in the
platform UBWC config. Use the platform UBWC configuration instead of
specifying it directly in the source.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 2 +-
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 1 -
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index a4d9efdbb43b..a49394b92768 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -200,7 +200,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->bank_spreading;
+	payload = qcom_ubwc_bank_spread(ubwc);
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_BANK_SPREADING,
 				    HFI_HOST_FLAGS_NONE,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index e217f15ef028..07c58cf3a14a 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -77,7 +77,6 @@ struct tz_cp_config {
 
 struct ubwc_config_data {
 	u32	max_channels;
-	u32	bank_spreading;
 };
 
 struct platform_inst_caps {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 8072f430bd26..4e617176dee4 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -792,7 +792,6 @@ static const char * const sm8550_opp_clk_table[] = {
 
 static struct ubwc_config_data ubwc_config_sm8550 = {
 	.max_channels = 8,
-	.bank_spreading = 1,
 };
 
 static const struct tz_cp_config tz_cp_config_sm8550[] = {

-- 
2.47.3


