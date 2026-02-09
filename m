Return-Path: <linux-media+bounces-52363-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHxnAE85iWmW4gQAu9opvQ
	(envelope-from <linux-media+bounces-52363-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 02:33:03 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A046110AD65
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 02:33:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E35D0300A31D
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 01:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 464C5280A5B;
	Mon,  9 Feb 2026 01:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O2CWsiYL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FuVkpwnm"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB3D25C6EE
	for <linux-media@vger.kernel.org>; Mon,  9 Feb 2026 01:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770600755; cv=none; b=QMZPVkA1t7XVt51Km0LczHvwnwjPjslMLH0MmH/2UR68Dire/hnOXqpeugx08pxWnb0Z17I0Bs4ssRAWjVU/A+0vJafoMt2vjYZBlXT5AWhsKCv6D0xDyAJJdrTvxXIBiwTY/H29V9rUhCjEIhhAd0xtQOOPhDUrF8Sv1GnH9/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770600755; c=relaxed/simple;
	bh=VfRuUvDLNQGtvgiSr1eaiBtwpSSv6JIHemxucUr//rw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d+TJF9JzzJ7bh2IqjGWG82DQAW03Sj8ReLXysYufUDvaGnEi3n3kq4qNX7/wBmzIdTOjb4j++rOy21fzBqeP52z1DT+Tb0mVItxlF8sKF/unGSPvJc/waYztWmymmuYgOa+SpnMvNXIzTFYhZrA5LnoKLJonWTCewa6puIAaC64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O2CWsiYL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FuVkpwnm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 618JOhOn2034068
	for <linux-media@vger.kernel.org>; Mon, 9 Feb 2026 01:32:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F0AY75pLMlp6UqxNfuSclKDOeELGzfL4se7wy8hQYlM=; b=O2CWsiYLh/58+NEY
	v41k9bVGGqDUgmjk1HJeAnKwdNV/deHPhFakOJYzfoCkOvM+vbFCqQqnXXELdIHp
	HU6MnFVf0MO7YYezdZUY2TIb9nk/+F1LQbbwtJQOZzTbtHgjhzRWDXRhknzS00lW
	lawXyNjyiMd7Iwg8Vj+/WwyGtbqDe1ogytb9O11Hxiq1Fx4qQX1u8iPIkFtJI728
	ytqcH2XuosBXv2Uh8NymS4hLkqwvQ/V4KKeysSq20QBgSGawvLGJY2iLMuVOOQ1K
	TKgfT2x1HD8AFluv/TpBVNUyW93M/jp8AYEQsTgAEt82GWWuPsVZs9y3cNNFhL/F
	YlmXlw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xb538rs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 09 Feb 2026 01:32:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c5296c7e57so1013580685a.1
        for <linux-media@vger.kernel.org>; Sun, 08 Feb 2026 17:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770600754; x=1771205554; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F0AY75pLMlp6UqxNfuSclKDOeELGzfL4se7wy8hQYlM=;
        b=FuVkpwnmsZKJoCsBtFFI9tMu3wjLkWMfzfgxPcin3mUIcXQyVjKXUdg6LAg0puuUTS
         4ulCNc8WkPg5Y1VmkVGXY+BdYlDHBdAee8yxOJhQwJ/BZR705FAuB1M4DNYk79++7jy+
         v6EBKh9wpCf6Eevcb7FAwDOJJcmuTyX2u+EyZIJsNEGj4765WBvy+afGP2hTJKKbtuM+
         yq2CCSbwAZyFX4IB1Nrk/AfpFkTX3vqA0Om6pL+If3V/VabHOypHNVbJTVrIpej/7gYe
         HPK0sTeUOEc8LfsIICk7/djRtaxLoLJfrbgw/czmhzxwARreW2mK+DtMauJKhlR/heaC
         LX5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770600754; x=1771205554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F0AY75pLMlp6UqxNfuSclKDOeELGzfL4se7wy8hQYlM=;
        b=louChul+haI/m59n8A0SS26QHUA2jqwxow4QnivzBge7F1Pbhey/zC848xWcR5tRTr
         OM93TfQLwbKJ+mT8fAtDJpO/5F0rtfD0UHixplfNz24INDCy3Mi0yUw/KTDt55wE3Gt+
         n7X1UzL6MixwzH9VPBMHNPZV158HgLhpixaa+2ZuqJx9+JsdJtNcvOk7MXfhBsLBesIs
         zxIfwXQl8nXqSJuMHIpIYrLeN3mLqJNJFK1zgGq1vSfIN8kjiRRidkyop2GtEddKMAUQ
         WMyBbqvzsGCNKVBHU/R6MjVftrxegqzk9x+qAHSKBJH9NLEyUMBwhl7ZIXbcQMkAutRt
         jeiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrLF2i500fUv6KWtMQmZZ1AwurGD+Kvuoqoyg1bzhFZYvB6S046r2P7+wtofxskNDekmdyF6xGrPkj9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ6xALYW8esRDT+1mUHOyYDdpOAW/PyC1ytoV2OYvvnKLF7BMf
	RHi8m+tIFqrUidqUzJOH9BAR+44/8qJkJewl/uefWutoBNS0WiVxYT7KtJZUIV6rYPu9dMhCdPP
	XD0skkEM8eBk+sQe63CXVtO4gOU/eJskaBy560ZIOxrt0bn6ldVRxjFHx+zqrhE+4XA==
X-Gm-Gg: AZuq6aKitGNkVCArhg2KLpEqhy/8KEy7GPast+9il+/drPzKVB4gtJXIct15ofmwlF8
	ZgSkFLT1aJtQjgSsB1ZuL5e1MFUsQdM/ZBf0P9TB9M9jjsg+/L7Rtcns8oGjbZPdn2dI3kq5E/z
	oaE6rXNQZsdUBUW9XEomH3BNg6zgx2ul5wcxjJ7aXgHchZHSFtX8+12Zuf6zJH8lguK9Yj0e6mC
	sa9elE8hN480Qi0QClSKs+QnemhOEINQZYTahFDrgA6phoEyuSRIEI+hiefrn/CyIXbGjIpqauH
	BZpYKJd5OsF2nmQTTyTh14qOsj9uRd4uP8znmQCdQ7CKLVSmycqQJwmsLmBO+dZbwvILHPoIMAT
	E2hRFulgbIBcS1DwhTOtBzWHxBGyQfzXl7zCX4lmtVrFVvXa801jOkntoCNrtvAYLfRChULTDlR
	DzCbsLnY4yMUFS5wfsHJ8XckY=
X-Received: by 2002:a05:620a:4553:b0:8ca:d5cb:6839 with SMTP id af79cd13be357-8caf1308324mr1279865285a.65.1770600754093;
        Sun, 08 Feb 2026 17:32:34 -0800 (PST)
X-Received: by 2002:a05:620a:4553:b0:8ca:d5cb:6839 with SMTP id af79cd13be357-8caf1308324mr1279860885a.65.1770600753615;
        Sun, 08 Feb 2026 17:32:33 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-386b623668asm21688601fa.3.2026.02.08.17.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 17:32:31 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 09 Feb 2026 03:32:17 +0200
Subject: [PATCH v5 2/5] media: iris: scale MMCX power domain on SM8250
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260209-iris-venus-fix-sm8250-v5-2-0a22365d3585@oss.qualcomm.com>
References: <20260209-iris-venus-fix-sm8250-v5-0-0a22365d3585@oss.qualcomm.com>
In-Reply-To: <20260209-iris-venus-fix-sm8250-v5-0-0a22365d3585@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2142;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=VfRuUvDLNQGtvgiSr1eaiBtwpSSv6JIHemxucUr//rw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpiTklEp1SHYK/tMVtAdeEzitep6eKN1Y6AdIHB
 LoWq/Im6c2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaYk5JQAKCRCLPIo+Aiko
 1cY2B/40cnEI4ve3wwu1Wagkpys/40BP9/mRGmvECJ5e8NzY/zJbTTs056nLWUZucUp46/iR/rq
 P+uxvSlrco8sSUpBs6ISCCOLr/zlehSBPF8fCqGoqYkhHocPWLQTr0ehoFMoSYFuA9yjSH4CVmt
 RGt2zvMVVRP3RAyIYIFR6IC+AloYguHbJW/cQmWlEkR4fMu2pR9PGE36lAy5SrkiBdkmUALZX5M
 vVn6Q4b/rccXinbFXw6uitoHmgvgMiB98dVXMi7o4qJIwOU9lQr2DBFMYqrdUrm4muxc1hekb2d
 RrI9c3epVoS0yCug5/7yr04tASuHkv2hivQJI8AV7gFDRwT+
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=QMBlhwLL c=1 sm=1 tr=0 ts=69893933 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=_hdJGhFWpaytJYYtlLsA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: -VANOdYL6E2-k3vM912oAUDtrDE9yUri
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDAxMSBTYWx0ZWRfXzgwR3jhzxtlv
 4KMZ7fANMDa7zCjoBm9lYgOOAA6EAzDDIPNDTvPtXdEJHI/+AtfkDahWli+U0OjquI8DEzgnfM7
 tPpppG2ZoT1by9OaR3kaKuxh7QcU6XcEz83+Js1/kR0lfShjSFOsTPfVgEHtnf0YARRlP+tkOEK
 BsBhTGNOkPD1I5bO+IQS6qvYksly3+OuDII3FFZqstBATHZ7srgoq/ThlEdX16sETRxjhGDU+qM
 7ETxaPwrwGttX5ipEuF/mMvOwgr4W3BM851KL6oJ7qv/Gppn8z1RohTcl+v1a0GRyisJCwAgmnk
 FV9Tg4nTxI9QRdwHZvnODbqByQ3tM9wTYbK4RgFawFcA6sTTRnX06Cos8DxYlR695Or2/bhC0hs
 HOF/DOyuSigmSOtPfSknGgx3kzc4bQoA7j/YtFdbWu/mYLCJREZM6byC29/S9vp7Ib8BJbk+T1y
 i7E7CsJHzcHUPXVPyoA==
X-Proofpoint-ORIG-GUID: -VANOdYL6E2-k3vM912oAUDtrDE9yUri
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602090011
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52363-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.987];
	TAGGED_RCPT(0.00)[linux-media,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A046110AD65
X-Rspamd-Action: no action

On SM8250 most of the video clocks are powered by the MMCX domain, while
the PLL is powered on by the MX domain. Extend the driver to support
scaling both power domains, while keeping compatibility with the
existing DTs, which define only the MX domain.

Fixes: 79865252acb6 ("media: iris: enable video driver probe of SM8250 SoC")
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_platform_gen1.c | 2 +-
 drivers/media/platform/qcom/iris/iris_probe.c         | 7 +++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index df8e6bf9430e..aa71f7f53ee3 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -281,7 +281,7 @@ static const struct bw_info sm8250_bw_table_dec[] = {
 
 static const char * const sm8250_pmdomain_table[] = { "venus", "vcodec0" };
 
-static const char * const sm8250_opp_pd_table[] = { "mx" };
+static const char * const sm8250_opp_pd_table[] = { "mx", "mmcx" };
 
 static const struct platform_clk_data sm8250_clk_table[] = {
 	{IRIS_AXI_CLK,  "iface"        },
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 7b612ad37e4f..74ec81e3d622 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -64,6 +64,13 @@ static int iris_init_power_domains(struct iris_core *core)
 		return ret;
 
 	ret =  devm_pm_domain_attach_list(core->dev, &iris_opp_pd_data, &core->opp_pmdomain_tbl);
+	/* backwards compatibility for incomplete ABI SM8250 */
+	if (ret == -ENODEV &&
+	    of_device_is_compatible(core->dev->of_node, "qcom,sm8250-venus")) {
+		iris_opp_pd_data.num_pd_names--;
+		ret = devm_pm_domain_attach_list(core->dev, &iris_opp_pd_data,
+						 &core->opp_pmdomain_tbl);
+	}
 	if (ret < 0)
 		return ret;
 

-- 
2.47.3


