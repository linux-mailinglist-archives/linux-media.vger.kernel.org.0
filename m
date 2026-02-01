Return-Path: <linux-media+bounces-51913-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJPWLNcvf2k8lQIAu9opvQ
	(envelope-from <linux-media+bounces-51913-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Feb 2026 11:49:59 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D6323C597E
	for <lists+linux-media@lfdr.de>; Sun, 01 Feb 2026 11:49:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8FBDE3007A66
	for <lists+linux-media@lfdr.de>; Sun,  1 Feb 2026 10:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FAA4331A55;
	Sun,  1 Feb 2026 10:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oN6PtP+2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J/bo8qBw"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E21732C929
	for <linux-media@vger.kernel.org>; Sun,  1 Feb 2026 10:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769942961; cv=none; b=JZaz47KCx4NGsTRBhMoJWgT0bMshYU+FnuM1vZaDnubjVLca0L+1c3wyWexIPHsNhvkl2+rDEYorCL7yPjUdb18+8F2ZvvKPgFjbqfMsCp8bWZf7ZuA/huKC5dF0YexAYDt005DKVYI+dSsWptwx7+96d4koQ7azbPV8p7PuBUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769942961; c=relaxed/simple;
	bh=6NuffNWnnJdps+Qa/VbgdTchPyycTYPYQqXXf6EKyA0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gK9esUaElNDO813c6zmWEqG0x5ax+2uBYuzL495eBJQ8snBWhQ2z4Gpp7DZ/7ubeUi/KYw5+EVW9v5j+Y4lY5zk2HoZxwaHhVwoSTpHhSMhUgZanaZK+e1ktSHx7LnVnxJ9UBinw52BCAmUe/LciqzNgxVMQZztmeFxyrv6p37s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oN6PtP+2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J/bo8qBw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6117TldV3682307
	for <linux-media@vger.kernel.org>; Sun, 1 Feb 2026 10:49:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1XGvQ7yGrJV4bV5rx0wYu9nGDUQZH8c18eThksaF4dU=; b=oN6PtP+2s+U0HXnh
	61bYVgoieOSchIJK+Dn0r4UAAgEck3X2LZ5TZSBzQp2oUc2TRNOwyzaTel0k/Ion
	TJFG1m+9JLiHIcABg1Xd6QSPRohjHflU2dExg99aCNpKCug9nxVu3tgghj4fBOat
	UJwMwrZgBjJs881zDzEl52uQZy8R3w5FP4GellcZ4OVCUijcO+scR/bWPLHuy62i
	UiPGdwfWZkjmvZA7uzJ3T9BPeRLKBMVcufkLB9Ip8MUontFtBr9NV/XtK+dL+btT
	xS/NLnjWHDp5I8IU0cESNCY3A5o94uUjHeSRvaWUJrrxZMrZY2Xzz5uRMOqCN4jR
	0GIO+Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1arrte7k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 01 Feb 2026 10:49:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-502b155a742so103839561cf.1
        for <linux-media@vger.kernel.org>; Sun, 01 Feb 2026 02:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769942958; x=1770547758; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1XGvQ7yGrJV4bV5rx0wYu9nGDUQZH8c18eThksaF4dU=;
        b=J/bo8qBwSjlAAHDkuPvKrMf80gcpFCKDIqsN4wvgXNdNjz+/u9ApLzyq58v7CIYMh9
         lPh6dho09sH8L+N0JuQdW4RcZIo/bYAPgcS/DP6BOmuoUheToBQxP5d0WzqPgAshJSDl
         50Lg0zOvyJ0Jw/auFjgAfmbBmzJKWrL6JTzVV03ExChW/UwKi+y7Dy+E122z0TEJ0EaU
         07D19gAVQJ/LDdR0k8MKGmPSRE5ujwqlyYPLHCqS53WhRpyG/hhElr5FEzzBAkjT5LgU
         ruheULL7vZl893zx9gDKUSjP+Dk7tnrGOhnkdpZ5IdxzBL+pNjm6xCs1xbUHwYDapXKG
         PiJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769942958; x=1770547758;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1XGvQ7yGrJV4bV5rx0wYu9nGDUQZH8c18eThksaF4dU=;
        b=WcW1dw0Jh5WQI/c63yXGIqSc82cRQN5u6aoTKQsaJN/MBlVD4LaO7F26jKW6FWGDUV
         rAhauWuztXAJJ25fcGe6h0wm3gX4ifg33GMuXc7XlgklQyt3Al07zJ9HYiRT1MZCGb65
         atbx6FeQoWNDI1wO3oHFu8L3erHiS9V0RoB9b7rsNT/q2qv/7p6qh9/yagOl6KHfu3ht
         7vS+r1QWvBJzBGEqGn3fVolEUtVg709Hf949/L5cpHf72gorK711CUPxLUorwVBSl1TO
         t2jH6dJ1l0CpLnJMgUlEQFtUi/n49yPGEELFy6VlUFarif5IUJF71tdkwksba3oONhqx
         yj8w==
X-Forwarded-Encrypted: i=1; AJvYcCXOmhUMk07oi4p9RDKFNh3a8zJro0MsfKyEqDahBjPSDcAbzLRVtDod2QM3Zkpw64S4kZT6bxW3nyWoew==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlTAY1dSMdn4f0XRWrq6gnzzOV7n8e/tobtbGXxo3OsATe9pct
	1hpdt4Q5kxF5DkGMGKmUCLvCLbuGljN5f9uK/kz/qu7No9o4VsHDW853bDXRa/LW0N5iYLqZBcO
	leBXJaC1KxM1Y7vk8SlWNZhBPoBtPHBVEG1n9potLmtLSXjFXIGImKxvc8kv0X5MK+Q==
X-Gm-Gg: AZuq6aLIVrR5uYdPLnuj2Nd7x9uc4JeHuORTHZPF3uAl8dMJJOTtCbn+IH9ibqm7FHB
	ECTFiC1jvtns9cqccGF5rsuaF3pvt5z4TQ9AZ8oQjPnCwj6hP3qWxSWky6abGk09dcHy2B8JTa/
	PjAEUX5E6Fe60FHhxbshH2/f4rGz+ZDJrLcg2503Tss3GFlN1RxmriMNl8/iJZkh6+MWGjiuG5O
	R41VGiwotIIqHKxXzbb1VZB+hVeC1OT5tX41nkWDxc45R5NICsKwqBFXAI9eHEkkKnK0+/hrPhq
	2ISPwpMwQDhGoFpbb/fYT/bUE6jJ3HvIflbxI61qeaVe5FLKRjNiA+GAFzzKmOrQ2KE0HKGgBBv
	dvEKfsBZSPDbV03DQ9pBpDhIgVrtyy3XPWxd8ikvnnTF6m9gqYZdwdK047Rs1mAMlCGkZT1AHmv
	V+UMumUqYsOsiP/Aa57RqYPkM=
X-Received: by 2002:a05:620a:bcb:b0:8c9:e98a:d9f7 with SMTP id af79cd13be357-8c9eb26f7bfmr1045806985a.25.1769942958129;
        Sun, 01 Feb 2026 02:49:18 -0800 (PST)
X-Received: by 2002:a05:620a:bcb:b0:8c9:e98a:d9f7 with SMTP id af79cd13be357-8c9eb26f7bfmr1045803785a.25.1769942957675;
        Sun, 01 Feb 2026 02:49:17 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074b7a8csm2835006e87.77.2026.02.01.02.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 02:49:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 01 Feb 2026 12:49:01 +0200
Subject: [PATCH v2 4/8] media: iris: scale MMCX power domain on SM8250
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260201-iris-venus-fix-sm8250-v2-4-6f40d2605c89@oss.qualcomm.com>
References: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
In-Reply-To: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2077;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=6NuffNWnnJdps+Qa/VbgdTchPyycTYPYQqXXf6EKyA0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpfy+lu9qhcFty2QIzhWPlD4ewtU5ybkSHWwKy5
 57y3sCL5qaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaX8vpQAKCRCLPIo+Aiko
 1c+bB/91FST6j2IqsZG5xQ54l4E42G7wu0q6Sky/D3OqlrU0bL1N3hNLQYQVjuSNRLWLox5TQwq
 3aCRZWc5G9RFYqiVJ/j1wou504OeD0g/4erL5Vb+YsGk2NAvuHf/jweydv0YpEmy51CbZh8isBs
 xUOW/HDKUQAcUCbnK3O85QqfWCeOdPM+NfeVLMAyft+h6EU7lxuyE4+ZDwVOJyBtS2UCdT+IPEi
 XXs3G4g0VaekM4kt4fMoSyIuHSyS1x00p8vxfRXIJO6Z8PyrIMI/Ge00vC772lHXkE3cITue2KO
 Twtw+NOcnloK6RgTrApDm9gIwcqZeL3Bebk+NTbGsJTccpBy
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: nmIyNnZVU2j1hJGfG3eaGVIIQOlcfO7d
X-Authority-Analysis: v=2.4 cv=FNYWBuos c=1 sm=1 tr=0 ts=697f2fae cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=_hdJGhFWpaytJYYtlLsA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAxMDA5NCBTYWx0ZWRfX6PCyrzBd/kgQ
 DvN6RsZ8alQCve9+dBEDzGhU9OsH/mT45QFo+l+IG12m+dYa9KQckO0rzmkiTIvz0eEpvyaAf0c
 ZEggtdW1c5NBf5E7YKJy8KnnD7gkHlcEkmTM1vaqd9LlNV9T6GDaZCxDAFTDpa30gLYatGXNp5i
 I9BHCIiUa+J4KUsSECFpoVfw9AmUDjsb6AGup4u9qoM43rjF++WQGZjipl6P9P6oTMR4VLDP2I+
 6xMl+YXXrL4cC62qblNzv7daT7rmzQMwq6R44gFhT/5jSLfZqNr+GPYSds0cz2z5ctL0WK6s6yu
 xs4FK+3S6HgzEdLiCdmZueysceQ/x+Q1REDo2EGbX9IEz27ztGG5gyJXV5W9e6G48JWXMMbKhKc
 BfzwxYX3AKdGo1grQB3pkq7ASzGs9RIK8jrogNzzHpmsateHmd8ljmkacMRhRMmGBDdqXQ+BswV
 aQGOvgFIBMQ+C1PTF0A==
X-Proofpoint-GUID: nmIyNnZVU2j1hJGfG3eaGVIIQOlcfO7d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-01_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602010094
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51913-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D6323C597E
X-Rspamd-Action: no action

On SM8250 most of the video clocks are powered by the MMCX domain, while
the PLL it powered on by the MX domain. Extend the driver to support
scaling both power domains, while keeping compatibitility with the
existing DTs, which define only the MX domain.

Fixes: 79865252acb6 ("media: iris: enable video driver probe of SM8250 SoC")
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


