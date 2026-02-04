Return-Path: <linux-media+bounces-52153-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGLwD3CagmkzWwMAu9opvQ
	(envelope-from <linux-media+bounces-52153-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 02:01:36 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BC695E0326
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 02:01:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 518CA30F1C3D
	for <lists+linux-media@lfdr.de>; Wed,  4 Feb 2026 01:00:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE49524DD17;
	Wed,  4 Feb 2026 01:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OY3gMuzm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CQug+om+"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043C42405EB
	for <linux-media@vger.kernel.org>; Wed,  4 Feb 2026 01:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770166804; cv=none; b=fi9f8mwD82oP/HSpa0W0/QXpLhM0vU1MJFrgv3UaOF4VHlfwBJxKQLzRL8nSzdNNkrZaGK3PB49A6jDbmFsnjWDqSRnpfZpMqp5gYK3ICn9DKk2XnHhitooAZtoMtiUU47Vyv1Q5Sj7ic2jj3PxpauhGaMazMBxIrJKZWRjavNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770166804; c=relaxed/simple;
	bh=VfRuUvDLNQGtvgiSr1eaiBtwpSSv6JIHemxucUr//rw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lsie9zD/mhjP8a/lBHHHfd/Glj5OmI/iv4IJP5JWNcVvmiUNHFJPtaCiBu28FncljncgoR2z50LEhjp9kq2G6h0WgSgvJtmUAyiGv+4/mcgmqLsBwDpjeZlkzWP4+O1WNdth6L5Yms2iyxxPYCJCACBE6JIiVUjJr6lC2SDTyHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OY3gMuzm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CQug+om+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613Ilpcn2613694
	for <linux-media@vger.kernel.org>; Wed, 4 Feb 2026 01:00:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F0AY75pLMlp6UqxNfuSclKDOeELGzfL4se7wy8hQYlM=; b=OY3gMuzml7IP7Qkq
	7Qk35TR0FHXAcYO36NxNmTrj5PHeUa8DB8m8Q93kXbn7oyafYiWmhhWKuRr+uR8z
	mO+UzSblYNS/fGhxWzsFX48oipYfbOvs0946FK+aiczLZ43doRUp9TFd6HadVTEd
	VWtXjDu1PwnRINwtRzJ4htsofspTw2Zrn/MttPoOKfYnRjv6Qir7/nMa8082D6AD
	0zlfhwB+DWoD9KHfMuVmVyjq7N+RoLNizJE/ZUfoYokPmowky1dDZMYXz/Jx24Ok
	r47MJUMP+bnKge6g18MXHnCQ73hfMfVXJt0ON2a+QVV2wv5xEhORNck/23b7ssHf
	pkEZWQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3h07jca4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 04 Feb 2026 01:00:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70b4b53e4so2755050385a.1
        for <linux-media@vger.kernel.org>; Tue, 03 Feb 2026 17:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770166801; x=1770771601; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F0AY75pLMlp6UqxNfuSclKDOeELGzfL4se7wy8hQYlM=;
        b=CQug+om+6ESlEAFBfG5iWjX75Hc7w2MLeENwElaVbwJjg7xRxFsvqP3OnHJcFqfOmB
         L9QV88OZi1pAw+S+gsieovqZLvSk8D4GRn0cZR0dQ5nokmbvqkjgoqRWCgwUQHVLFxvx
         usP/4KRyLSknIiwhoDZyhvFdbJdxqeGf8J2JLWsE64yu5I3vsSQ8euqs6kEFrQnVMqdy
         yUE9wi2AdXaxBtA2TrYlQ6OWA8BFj8YJuZlfHBWB+o4Pq2lm6k3DYGAKaBmBhW2XX80c
         YUxNYU2vf5fpBaIaWj8YAucp4xKsv9QeQZdOhUPpFma9uPJubHs4AJlBDVqYisAD4j5Z
         U/CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770166801; x=1770771601;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F0AY75pLMlp6UqxNfuSclKDOeELGzfL4se7wy8hQYlM=;
        b=exFjhqwWMFvnwfS70AjhbI1RDM56I+glHxLojgAHi729Dhq6i6mY8/g38PnT1cAIRp
         zw0TwcllunP13gqPX/6osrtGC5rHnvFZIYwEvcOo3PAX2cKj5BlXleL9/234DrUJMC2P
         vGaj3cJYE0pzIN/Cehg6BG15ir8GqIeUEJOKSb9rwe0n77NciOVKIHvV3Sp/L+QyonrX
         qBq2nthPyjgt+ZwWLhSvJUOyWO5pokReLIvcGYq6v0TVkrUEk01G5jEntz7W+8vLaSRh
         tcBeedLX+xbLCdfEmeOY7vd+6T90D1EuCPUUP02uEwIYnsB2HC1fORRQPMdEd0uhZoK0
         Z4lQ==
X-Forwarded-Encrypted: i=1; AJvYcCV93HN36ZF4jfBxQKmjOye3DIPSUYtU14S6Vqkrrh42vexbXAfCJYwND4PBmx71aNsOd9Tl2t+UAj2gEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwftR6BgaL88oWWuzacJjNkXY1jGv0cImGnf9uGl8HtIlbcIpyG
	JtUcWNoniu4oeL18O5lJbMg2Y++kI/WIKjDkbS1katG2/2zg/diF3m/wGL23qzd+U6li9BHoYST
	dH9eWBg51RQ5JGwMqNCmR+31xA7qRRqfqecAV3qAD3GPIDd+m77uvJcl9Kf71ypgpQg==
X-Gm-Gg: AZuq6aJ+hZTin9CEguYr3e80b9Ze1Bc8nb9F70g9zxEuchf5V0JqUp7dB4QkBLB/N44
	KEl5B2hoXrPOzCn+h8leh+puGzUF4YTekiRHvPi3wNNG5Gl8dAStHTK/HPzLtJe0AvDxeOkRGRE
	+aW8oJpICAaddaNnwaaNp0Q3+G3zLWF8p6tjYnhvX6LXrVHmG+2jzij5APnAkqcyxEwvhxq8+eC
	P8ObvCnxRG76VJnjwZDPkoHIL6/0N8upMRsEzHyKmaiHQlpHjHKef/biVOJTjGgSFvvs5lXnNL3
	d/zphjLWIG/QZTsHoAvlpAJtBxQTO1md6aScXSOFtsmvcLOFEndVADTOfEbG7kdf6nWrbrY7fp/
	b5rVCP0uGvu9pSWnUofx+k/d5Q0BBuD+Ty9x5kEulneUOPm3th5RZQ7boqoUO5wd7+KxDuRETUT
	/UXKgqF5Asaw/3G1CVOPcz94o=
X-Received: by 2002:a05:620a:4148:b0:8ca:1107:1214 with SMTP id af79cd13be357-8ca2f80c8b6mr201841185a.7.1770166801345;
        Tue, 03 Feb 2026 17:00:01 -0800 (PST)
X-Received: by 2002:a05:620a:4148:b0:8ca:1107:1214 with SMTP id af79cd13be357-8ca2f80c8b6mr201838685a.7.1770166800833;
        Tue, 03 Feb 2026 17:00:00 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e386ff563sm253405e87.1.2026.02.03.16.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 17:00:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 04 Feb 2026 02:59:51 +0200
Subject: [PATCH v3 3/7] media: iris: scale MMCX power domain on SM8250
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260204-iris-venus-fix-sm8250-v3-3-70fa68e57f96@oss.qualcomm.com>
References: <20260204-iris-venus-fix-sm8250-v3-0-70fa68e57f96@oss.qualcomm.com>
In-Reply-To: <20260204-iris-venus-fix-sm8250-v3-0-70fa68e57f96@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpgpoH69jYaMl9aHZSebvqf/7+KmmazX16JJBMf
 XbNTMQ30MmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaYKaBwAKCRCLPIo+Aiko
 1fQyB/9WdlqfncSawuaEvQr/Y7vMSJ30ptCp+Q6MnsWnr3cxm3NiMiQkGgL4VGujh6za1/xN22x
 kwdizN2RrU+oihEl2FipMI877Fdq52jPDC//ieT7UCIF+PA67GtQPnDGz3mruvvDS0nj924uzEK
 /0xMiLULGUL2uroIdK4T8V68/zT/RYU9xKUNNQWJK0zcSWmZWSsfk0uYz0EztJQEp7FlScHEXGo
 19xZQdUA+Rhb6oD0bmv7kFAXs9XN9pVLfue9YtssMiMAMzXQVc7TfBeJ3DkkI0Tj34j+nPbM1wu
 U/Y6ohg3d3XQ3c7LCUBMzj1ydPICVugRCWj7NXhvR7cPOYfT
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDAwNCBTYWx0ZWRfX13mQZexcsPOh
 U6ua6IOkpwpkFgr5nRbd+4VPEjciJLtTqG8nH3P9n+HQGMdvrdpZUxqB4oT5fBg60RaPh32L/pa
 Z9RINE+OJZys/nvdt4vjCQwcbtzYYeDatjmdhXKtpjnJchKHQk09UngPxTURK9ZdU/2EMPg7eEE
 5ytfQdXKl1wnNGEixfjGrrQzS+a5BVcaxo4gwy9ima2yx4gVeYhO7IUTUnYZEGyPuzaLDuZBdVr
 q/YLJ00wPokqoRjO80bDwb1FaWShx9/chjCpJ1tPxB3fRAMady2vSU3tt+Reic5BMlmSClt2UCt
 OhAwaiJx9b/vCoxWw6ial7V+rLm1L/F0B+CcIs/kxgjyKtj/uAaFRSKOeK1AWjYOcbWFwPB55fw
 Ffwl8iqrmuzAMtFLBk0Kgnt934DCJvKYjCrfu6Ue78iV76ikLdbDUoauCmI/K0gFk/mJ9/r9XPA
 Yrt4L+44g0TGCYhkM0A==
X-Authority-Analysis: v=2.4 cv=CMknnBrD c=1 sm=1 tr=0 ts=69829a12 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=_hdJGhFWpaytJYYtlLsA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: _PD50CFkXxQ_m3NuOI3IPaFyNc53iX7J
X-Proofpoint-GUID: _PD50CFkXxQ_m3NuOI3IPaFyNc53iX7J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040004
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52153-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BC695E0326
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


