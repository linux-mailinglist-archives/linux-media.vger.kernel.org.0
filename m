Return-Path: <linux-media+bounces-61443-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDFcOF12BGpOKAIAu9opvQ
	(envelope-from <linux-media+bounces-61443-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 15:02:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DD8533872
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 15:02:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AA3E8322469A
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:54:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAE134B8DD7;
	Wed, 13 May 2026 12:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iPk7rL4R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DMoT1NQX"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6993148122B
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 12:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778676588; cv=none; b=XHke8/3oLEqus0BDFu/y3ZJoI4+R32eihJonRh2gmvVZc4TjVKKyI45COSdJYbRNzeKIyqwZAQoTIiEF7McRsIluKV6nGKQnknt1ZM/qZMlkp6Z4P3ne6k4JbeRjTX0M5h5YYwueHcZnh/6vHtVHfgZGrHmnXbEOzoQBcf2HthM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778676588; c=relaxed/simple;
	bh=1U+PXG9nLo9qUltBrYaeNctURowSep0vzQMqJImDlE0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EMKelXt50zcxyV6M8xljEmGpyFtVsKYDG7FzamnwRLaDsu3ejqcQ4QYomhjhIHWBqms+pFZB/5lSfxlT6Hjcx6uxEEcoJ82Inabdj9E4+/UREmGJiMa4VZo3YuDtbY8U44vqiatb90b0jXbt5Fp4KSnaHK8DKAhkqEN5FMUBXcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iPk7rL4R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DMoT1NQX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8rEDU4082468
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 12:49:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g9e6GbuUhCkLq7seP1dGvQXz0WTCfnuMhV6Ul6jJ9rE=; b=iPk7rL4RjmgTK43W
	+K8XRj2OlaTyPRuoNYCZ5ngeVFAX+WI7UvClRyhdmhlR1K6936UXKcO4nSAhVbM1
	NpdfwcDyi35uiqSUCNtuVLheLA11Y8+mnSLyQxX9UdN1GJSMayHlWXXbdEKyJW0Y
	zGf/Z3dJkRcOIQQ3hBEiOOx0iR6NsCkd1F5FYVXO/A44Dc6d/cTbkMPoezmncrGp
	AuhhtVnz3B0LATVlmCYHhau3uh/jRcd/Ken4lbEtTe8wvlLa3QLHF8C3GdknNbtH
	w2LpIkp3dajw6BeeKMqvdIBeX6kUBKXXXTRQhFaRANj2vZXirfTe0Te9YHE4Y6Jy
	a49o9g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p6e0tq0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 12:49:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51605cf3c60so39908811cf.0
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 05:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778676579; x=1779281379; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g9e6GbuUhCkLq7seP1dGvQXz0WTCfnuMhV6Ul6jJ9rE=;
        b=DMoT1NQXLXUt/UXYPKLaLiS9uQzb1Z0bm035ENLeW6N6TFr7z0fPFxlkM31uKb5bmx
         gJfaBo4fir121829VLkXgZGZIEfWUYFdXOKnpwk89w/ffe+I3lZd64n6WvYrYG0VfZ5h
         86Zhvm6eFaesiZeETyGHtt3anlvG3z1cXTUAXVIvSg0XqqT6Jp8eZt5sE+2t9KooZyY9
         11mS9YcZv563CHRhH7aXsobc5Tof3XcbPlX3ogT7Y6ICEwMCLq63dpnkh12ES/5mXLc+
         XncNvoZ9bfB/sjbMGZ1wLGvyUBhdcrJkqanJhCde4lsCbLVf2LglUiU0WBXxZXIQlSnB
         EG6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778676579; x=1779281379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g9e6GbuUhCkLq7seP1dGvQXz0WTCfnuMhV6Ul6jJ9rE=;
        b=iFkXnj2K5UEOMOcJhkP6xHBbUNHUHEZ7oWpGfr1JZAnjpC79MqUALwxStaQXpQHS9J
         /5rZk9q2Gv211sJKqPwpOXbAWwDSBiPxeyj5K3/hqva3XofI+uUOnX034/NbLnQwOe8w
         +uVY2gNIe5yyuovvbRm0LUK2CRoV/tG8sadETZhu0UVWLFK2jcIKPsTTWhzZEgooJlwO
         yp8HtZOfEeLJ4bzLOw+72z7ielD9ZFQ5QlcSVEgbMr+NZIvMRNX3luImv8vBmu/uGtRE
         VY9M6xxrpS/aW+TZaAUZXUN1pR8I9LS91r3yHlgpJclOqUEjx4JXpvSIO4PvIXJBZUJm
         gECw==
X-Gm-Message-State: AOJu0YxR9ZBGoBbtmBinYhUQicO3hupHx9poF+zbxi+aaxjDCmGyAW6o
	vxNBcl4Co6KMBmW1N02Zw8Bk0YPgkYFEcI7kxqqSgQx7GU+vLyOgfwE5HvvpfXJrDJSVJB0Q4W5
	pN4iqY3EylCFJgTa7FkGWL82iT/uXXXbVHMc4ohsvl9WT3cHmaDI4V7EShTWrPUgQCw==
X-Gm-Gg: Acq92OFAG+wMmlifo1OxL325Y9YgS6GaMGQyxUTjASjdyZwTAVBR9aGtCeYfR/eY6bc
	zLcWvJAEmJhFpv2E8pI/wTZkupZb+1IC+o4dT46LPkMU+GKOyUgvLYasc0bxUCfwoJzrqi+jXyo
	MNJaede3nLGAumSUdqxTC4kj8drGGzsHUFKQ5UjkbSRCV9mPqdavCNmr2Kg1lRyufyVGbwkMye4
	bmRiJC2Lzwa8VCN9iZH7mUuiObJajkd+FM2G+lNLFP2Ab8/3K4r3RAA+/e3HNGkarNln9Z1v2bU
	xc7VWJ3zC9LmttZcIpAjhBQAQ6dJKdxTitUb8VdL5vllyX2Q1JgxdKmo3tVChqPpD04UnLKGUvk
	TulvqiiYVu8oDng8f9hLNX+DKEJbkKDdoJx4ZsxLkBQ6npe4qCqnkjwn5H47RjnyaW3ixj1/kJd
	8TQH1KHJLK9Vj1o8F4UQ6Vg/j4UCXcT2ItaJ4=
X-Received: by 2002:ac8:7d8a:0:b0:50d:7cd4:4a73 with SMTP id d75a77b69052e-5162f677033mr38466661cf.60.1778676578891;
        Wed, 13 May 2026 05:49:38 -0700 (PDT)
X-Received: by 2002:ac8:7d8a:0:b0:50d:7cd4:4a73 with SMTP id d75a77b69052e-5162f677033mr38466311cf.60.1778676578426;
        Wed, 13 May 2026 05:49:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f5f15asm41106841fa.17.2026.05.13.05.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:49:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 13 May 2026 15:45:50 +0300
Subject: [PATCH v2 16/16] media: iris: constify inst_fw_cap_sm8250_dec
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-iris-ar50lt-v2-16-411e5f7bdc4c@oss.qualcomm.com>
References: <20260513-iris-ar50lt-v2-0-411e5f7bdc4c@oss.qualcomm.com>
In-Reply-To: <20260513-iris-ar50lt-v2-0-411e5f7bdc4c@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBHNCHQRAsw3WNId6oX4eo2629HpyjMUF/fqZ8
 9bN/XFdmqyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagRzQgAKCRCLPIo+Aiko
 1eA4CACd8eaQW0JAUbIUttqp0LI+zsoIaH2rHKQ/AQY1ipn5xmRH2Bp4F2ve1+nIif4/EbJ23Lc
 NbBof2z4o3hPEOHOjzR51QsRzUgluKE+NKUTY/tzrZ7fvQTNnDJJhHane1osAtZysLmZv2eYHh5
 nHN1pmYRu4aciD7mOU9GxSdZYQcA0P16PbRTysHARauVkLaQ45o/wkOt9RJB9QPE58OTiEVXW7F
 DmUeoWN7CcPopXSpBcW9vzVlrEWSznl/ie2EziAgD0NSKhNk32zNC3V6so7L5ucFPFSDl/1ubAl
 oLbg1Olu2Xepaf8mN+Hma1HuO8DlnFE5HaPjQtAUooJ91h0c
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: ylN2PUkTWdvEkd48RzzyxMZ9_kJxDNjH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzMiBTYWx0ZWRfX/uSsKRD350IA
 meYlP7j2xCsPgPyijdbgIaybAFKSBeEjYOa0wEGEOrRSSs0ZcLQdvbKmDiRiDZjfZAKi1hby2hA
 jGf/Tep//NCa6k+IsdWxEgUBMkQb4rNI6yhZ9pAleOpeTE7e9z7HUCFlsMYLlkkBvCqZoGzOQsH
 dCpaVYJxEpf3Wanl7Bep/9UOr62/7GELFJ4B4Ssts/Cm22LTGaAQjAcQfsoJTZAwTApKZ/3d7GU
 RS+mj3LXBQ2wwnUO8VeA2PRaP2Q/MLWFdlLtHeoncrvSg3ddr4Q8FdgGKBG0NSVmcrYk7xa/lI8
 U9vOiTFrYuzBU1ve+LgElyUF6RTmcw13AiNAA/eiyu1mU7FyE1eE5Jd/O+irZ6sAniRVPenuB53
 Fg64vetKA0EqBxdmwF0MaFXKrU+ClzSio7zujwSDOd2qaGkZPLwndz2SGHb+FZV1YvqilsvID+1
 1R+N2Xgfy1KtdjbbhyQ==
X-Proofpoint-GUID: ylN2PUkTWdvEkd48RzzyxMZ9_kJxDNjH
X-Authority-Analysis: v=2.4 cv=Wukb99fv c=1 sm=1 tr=0 ts=6a047363 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=aSZcYj2XgHFsS6ESuJkA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130132
X-Rspamd-Queue-Id: 91DD8533872
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-61443-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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


