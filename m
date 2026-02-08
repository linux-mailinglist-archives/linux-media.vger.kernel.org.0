Return-Path: <linux-media+bounces-52357-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DurAMIiiWkK3AQAu9opvQ
	(envelope-from <linux-media+bounces-52357-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 00:56:50 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7DB10AAD4
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 00:56:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF006300A121
	for <lists+linux-media@lfdr.de>; Sun,  8 Feb 2026 23:55:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91D1138734E;
	Sun,  8 Feb 2026 23:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xh4O9ZGC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c2bfcsYe"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C359538734D
	for <linux-media@vger.kernel.org>; Sun,  8 Feb 2026 23:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770594945; cv=none; b=rVin9HZdXNkjhR5f3KgM/ZpURpSYz76ACp7aqRG1oZZMPLwx/4Y3NRmDgtymeRZ0rTQU2kfCwVXG+fnQyjXAono4es1JSe4G7qDqQ8cLoQcE+WoZFIG6tOdWuMsUXfea0akGMqMUeNbek722XFsiWaNlvYdO/e3XxmWdP8FAMhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770594945; c=relaxed/simple;
	bh=VfRuUvDLNQGtvgiSr1eaiBtwpSSv6JIHemxucUr//rw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WFgxwoqPT7GqZdBdJQx/5pVi+j2yHlE6ypc1D7oiq6wm2greBuDe8t9EOWiEOWqeJ/Bvmu4tutm7gK0aprmxQfivk+fYq+844H5o3IPMKgn/VaL3okUEsoraCT/t/OrwKsvMXDzK02qdtvJGKTYkehQWjd3VsUtsRNvo/QgKPuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xh4O9ZGC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c2bfcsYe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 618NUJ4S1226742
	for <linux-media@vger.kernel.org>; Sun, 8 Feb 2026 23:55:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F0AY75pLMlp6UqxNfuSclKDOeELGzfL4se7wy8hQYlM=; b=Xh4O9ZGChasx2CjC
	0RYOzst6y3P7Km1mhTbVgbQRJD6DTErQ62rwQHRHq1w0vRr2D9vQihIs4eeaNRI6
	GEtYka3jY63BcIuXajeVuQW5XhXE7BZ9AjLuJKrrZVA8CFk9Ljmqg9ii9q4Fd8Ll
	wYrfjFw37gdTmd5TnsLwMMg83CmC/U8dpu6YoOqjqn7PNG4qDXMGob2zhJtW2Jhm
	AyrR52KqHb2KTUzlCdE3UyW7lk6XkG2gQv+ta7HqxzP9R3OZ0kQhhlpd+f4vETB3
	WRmXnixlKDshxmpNPJgxHzfkZvwCMY3b9UMyr1s5g4IUyUgFAyI+jPKzPHyPjLMU
	1W42kA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xdd339p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 08 Feb 2026 23:55:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c71655aa11so1730965385a.3
        for <linux-media@vger.kernel.org>; Sun, 08 Feb 2026 15:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770594943; x=1771199743; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F0AY75pLMlp6UqxNfuSclKDOeELGzfL4se7wy8hQYlM=;
        b=c2bfcsYe3j1WgzG4zwjClNrvuOF14s2GD+s1XuzVRp+kcm/LcaeN6uwyBTMkPVZhOB
         +i3VW3o2pAiHvEe0NglVFrHPk3d0n8pPUhV57tDzaL8eAvHU9qDB7O+hcOcuBsWdrxM9
         JuUzowzQWYsOXIUZU8mE7Cn4fALFlRPNK2Bc4a/DuGO0FU66Nt99ch41yCEALOBqVtln
         7pGumqe6/3sZ9hWxTQAWl568rX0PGS4TdH1LI8vFTuhyilLAYN7Lk4p6+u1ZXiJquerF
         ixR4mksHJETjz7LBYaEMktgX7aRBElyfTUbHoFBFn7jyR0Qn8lSzQ3byj2BQEJ6VgAj2
         D9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770594943; x=1771199743;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F0AY75pLMlp6UqxNfuSclKDOeELGzfL4se7wy8hQYlM=;
        b=J4tB8TNrtJ63dB8N9qysSJGdlVBJE6+6s5+nlAT6gBKCxcOku6QiSmpUoRy+N4Pftc
         nYwQD5YbXR7BQBz1/58aXZ+fUJSAZmovkOgwQjVv6Z/FrGGMpXvUZfxt9oPsUsziRJqa
         Mikqm5rI2ATHJGRY4NNGF5su8wYC8lyUpo+LBGn8i8aXXOceStVIwqBH16qtzavCVpsB
         bmcCiOHQQHdTNoUvr4t0VPikaUBQok/DefgLuUCe1aFQzcqeoT6krG5rillV8WCQshdT
         ad3jjldXLaPvf7H9y+OezgLYT464YhUOSrYqg6Iii/gG/ChR697qtDwgqLba64eDihm5
         nRZw==
X-Forwarded-Encrypted: i=1; AJvYcCWwPcZgfXfsluxXJH/yYBqpLnJW7ozcfi62idOq6zs3YS+2pkVvqX4b6g+UNbqksjNfu5ASjqGie9V9bw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkKtKqP3tnyTPoXLEQRk53rB3FluueO0Y+w30TL/FmOI3Vl8BI
	ckm1xKTIpJ58ntTxBdG/5ZRF4Kz7UFeP21b3vYh+ZN71wTW+q3NEUP7GoVTyYxFIvy1OPLgTI1t
	ap/+FFPw+It63+pGlCw7uCI4HFZK4HJU5NjiuGKRkdUykJigZnDerkT+/97NWh9iimQ==
X-Gm-Gg: AZuq6aIPRAQxsYM6kw7y43jqleKrlGRUFxaAr31zYXdXxWsVEPzpydvxhVZT5HO484O
	ijj3W1o/N16OCsRMzI8I3Mw5xJQYhjjB6LvT/Y5BcbW+YaoabddXz+tAbOVYBZFrZ3kSUY9vK17
	w2zljmIitDXbhn9o5yWhbcQ7AtNgImCsSEn+/6j52mtJeB7m9WsyCh4/V8iuVEvWLR7eIoowMaR
	t2jf47RVjtSjIvZxVRS4Ql9r8P3p82NAtfIf1HH666M0aNCeqnrMjKtYGj7TmhbGXnvRCCBTI2U
	I3tWw0MzeK56+fKOQPuSzwqXFmAUvCm4VTI5tHXYv6KmJ8lravbErlPHHl7lEkljQSROhXxR+M0
	DBcBO7T/67HQZFm0orAuJqElqIsG5K58dEklKX6dzk6hSN0PXu9OsnCkxD0TbYCFevEi0VjQZaq
	oJFqlc+NBOguLXLtuBI+CdnXs=
X-Received: by 2002:a05:620a:1a04:b0:8ca:4438:b8f4 with SMTP id af79cd13be357-8caf13fedb3mr1330269785a.67.1770594943209;
        Sun, 08 Feb 2026 15:55:43 -0800 (PST)
X-Received: by 2002:a05:620a:1a04:b0:8ca:4438:b8f4 with SMTP id af79cd13be357-8caf13fedb3mr1330266785a.67.1770594942807;
        Sun, 08 Feb 2026 15:55:42 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44cf6ee4sm2188074e87.4.2026.02.08.15.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 15:55:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 09 Feb 2026 01:55:36 +0200
Subject: [PATCH v4 2/5] media: iris: scale MMCX power domain on SM8250
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260209-iris-venus-fix-sm8250-v4-2-9662a0471d82@oss.qualcomm.com>
References: <20260209-iris-venus-fix-sm8250-v4-0-9662a0471d82@oss.qualcomm.com>
In-Reply-To: <20260209-iris-venus-fix-sm8250-v4-0-9662a0471d82@oss.qualcomm.com>
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
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ2anUpXzmn7N58fYTL98WSLiU76G8XPBCyuO6Yk2cRu43
 8u3TazsZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEnmxg/6d9Q9dXSKLAq269
 j/WDSItTa6cbM3u/bzjTGT51ibEOw/bTYjH37YUyj6zwquNbat3ny7q1P8NKkV/g1wQjJjkmaUa
 psOg1d1cYK/tdM/nM9bTKQtFt+wLuN6f//v/aLsZ2RKqOPea8bMqeL9ahLvGWwcfLy754m3dveO
 lzbj37t/7mpBu+T34skan9LhjiaaDGW/Qu+cqCna9Ujkls2dx9Paj07j/WLRP+X79S8Pr6/ZOuo
 RNs5KoSHqZZsbPcsJn8UTFTyLrdN1I799fj/IaWJK5DM17fmP43R53tkdnOZ2110jMWznRXfDOD
 ZaOaeVqMq3JrYuD0Q9G2LA/XdnDy/2ufmLBpp7fGA4dcAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 8pCuWIqaqaR9wi4-aNhENdTFuI-fqYLZ
X-Proofpoint-ORIG-GUID: 8pCuWIqaqaR9wi4-aNhENdTFuI-fqYLZ
X-Authority-Analysis: v=2.4 cv=Rdadyltv c=1 sm=1 tr=0 ts=6989227f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=_hdJGhFWpaytJYYtlLsA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA4MDIwNiBTYWx0ZWRfX31xKlmIXilV6
 vBXToU7czFEQKjeaL5z1UzBCJZJ+uXzpKr8SqsKRygBZbV+tpkVgLrACbTcF0NA70ZqbqnjDYos
 7KhnewyJKe/VLrJZrPmsocjfJOvMPdfuJ402bYgXWWgf3ZXBxu2Ow8QqmkdwRN8kSdvZ/Z8cn2e
 jrgaQhGERlwhF1RHEL9wYgDzoG3cVSGX7JqSiYiMlWOjDfWvBI2wIEw5wl5snIYcB0yHFBvD2Sq
 cGjKbdpFwdImHuk7c9J5766Oupsy82JVJBIMW1jlFNAMMIwVwPdJhlxh8zx8doCAd12szTHonD3
 Aa47ApaWvSEqtdHosxiOVWcQwrbwguhIZ3W6JONPzx9RzVv8NwYwOp8n2OD56M6wCrg1TuTxzdL
 EOpnfvhHRpLL77Ucq3WnlbUS4FuCU2j9KzVTz2eSF+zjJl7boDNnuJ4QS+yx15JGeyNMpN6NnfU
 LMjRUHCpbLi3Ek9LHFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602080206
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52357-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.988];
	TAGGED_RCPT(0.00)[linux-media,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4C7DB10AAD4
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


