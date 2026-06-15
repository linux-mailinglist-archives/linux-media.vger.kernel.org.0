Return-Path: <linux-media+bounces-64880-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PTIaOSGmL2o/EAUAu9opvQ
	(envelope-from <linux-media+bounces-64880-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 09:13:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C126868413F
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 09:13:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=P87njQv5;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=e01lGXZc;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64880-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-64880-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B66333006692
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 07:13:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48FA43BC69E;
	Mon, 15 Jun 2026 07:13:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABE43BBFB5
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 07:13:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781507606; cv=none; b=gqwQr4DFDzBukj6/5iM9hIB4WwEGZ55HRs9sWA3n0HvZHwM/L7/ntpsPEjKFw9sBwoGlf5Vh9Sy+ItmjzUs+oNzdxXWd0CZqc2s1ARkduoI/UNOpYSQyVlumpqfv87+kQSOR7RKsxaoK0AmgHAQZOlffQRUvklXQ7OdZwip9OTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781507606; c=relaxed/simple;
	bh=E7CeGzLsAvE26qPQBzedfdcKyXCu72MrhvI0MBEY7vc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RvPVexjjGftYMss11Pok9T3O6AzLh3MuUQqUWkS0zgUc8BuBpKEgdE5DB936xFM/rW3m6GmacZjgqQvM1PjhZuxM9PUSYIvyCAK1v5+orHCpIOkf70xpXCPXSe05Y8GboHLa2gzBIcd4AreAR5J1E7Uhhyr29T64+D2p4b3desw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P87njQv5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e01lGXZc; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6IvqG3332580
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 07:13:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O+okVD8ssr3GgTvCo7FatLeqFw/vAJdaEkp9FFWDQmE=; b=P87njQv5UEc1WKHe
	s3z+N3dUD6NF8urUymNCpqs9uVD2rQZ0aOwAgwUXKReywS5LIl9Bi3UwZ6A5M9Ic
	Xl4UwkhXLuXbuJScwtmkLXTE6ODQHdgg8cZF/hLfzs3h6TFFrDQkkCxvCRkCgPJk
	baczb0d0fp4INeV6r5ZzkoYCU+mGr8Gyjm+5t3CNTq2nDr7F5L7+9JVVYFfymYYp
	jhkJl5h4XfFDEkhALeERoIjyZs3pFRukl5Qhd/rIMJnQawcDkHVFTTqwAjQs88eI
	hG7Ezwpd1akez6qlFa3650EmxMWsqjEJnMfCh+ry0mis0SK7AClbe1fm1VIZ0Y9o
	c+l4Rg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4erye16648-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 07:13:24 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36b7f696b40so2364134a91.1
        for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 00:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781507604; x=1782112404; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O+okVD8ssr3GgTvCo7FatLeqFw/vAJdaEkp9FFWDQmE=;
        b=e01lGXZcH+v08YzertelMT+/e6Xi4UoztTiBE/aYkoJy/XIDWoLa7JIZfkabBTMdrH
         cUiCnutE2t7mP/1c+1DFs1pHPsK5oo9NTxhAVnJwK8M3QVIn2bFzqaxoO2hTmzxURO44
         JGVoyfrR9waJUUflOVLsvxVG9CgpEEyT5S6fLkhz4bUp1D2UYPjnMgAsB2G/nXgVz0Bu
         pTEQ+n1yGcw8v6YmWHF73Hdwknv+cZQ88C0gcqMWbNg5YzkF0VPbUyK9dK78JJddE1Sz
         1/qHgsZsyOGDo4+rtzajdOIC3XKnbUnp7bBdZqyBWc8bbYcrvYqWp48pPaXsk40ZuC3N
         n6Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781507604; x=1782112404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O+okVD8ssr3GgTvCo7FatLeqFw/vAJdaEkp9FFWDQmE=;
        b=ZTn245vjby08MIoCwLapgu444KuV0q81MVWfmXMJfrZVYhpRXpO7uGgVX+nVEEXj5r
         qv/K4WU+J0D9uDWBwWVbTwRBjWaVezLyNv3Ba8KJrEjMNHQQnxyvb6OdenCPUaXLcpWr
         CmgxYOjL8EZhjhht3EwRbc13sB4B+PFLBPmlC9Tjn3G1nvOOyGXdgTnVlIOv5nPx+djS
         8tdnXtWQeUHIcqEHJNkKNQKJkGzsRyUjdC1ZL5I8mMzq555wP/MgKLQ9/qwQIe53S8og
         4QyJj4WnmEC/AkJ8sGBXzC4AnEkqx4kom9Rv2bnv+SY7aJqGlnBEdPr1H9hlVH824rMn
         4K2A==
X-Forwarded-Encrypted: i=1; AFNElJ9glzT6XKHv9auEiryi40C4/P7UGjfuuK6X8N3jqYDQZU0cND6aMr2hOE1fLBn0bR8VozzCfN2eGoDRlQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlDHCyBj4IPN6NjiTSABGgkkzRB2o8nl28n5s/M2XWBnykz7Se
	yadCB/ef5Igo5Q8GTfhFpxGuw7zC0voJTESBQ+WjBZ6telk/jbbJEYJWEPLLtBPypzDoL4qA/Pr
	appq1PKUSPyFeOPTo0UV3WPKeDKA5ZopDFPyb0FT2ET+FHALoZroixGFQVR01aWUI/w==
X-Gm-Gg: Acq92OGUmQf2OvFyWzShKLctM0ysn7MZ1X2YrX7DvNqoYFmSGT912DlDA44tLVwQwwc
	dYRSGghYGReMVEZt3DWKRTjsFFS3Y9/TGS0jOf1FC/eKKpKkhpPahQhTB8NqsTaGhLD2FAMh27x
	VPYzhKoYug83uYdGgsUzLS/kwdKDbcR56WHHUJGGvjQqo1x0FTdyFniUtWNb6NStqlgkn0ElA+d
	GH65TNVXu2iLfgTLSDZ642UgN8KARl7k33ALk09svGJ7d1VpR3ivl9NBcy0azXfJ/owf4LERGV0
	Vy4Y57NRnbuQlt53EqTAlSSQakfkqnUuIl9DhYeB+UDzPZlmg6gRB0D7+MpSL73EQ9PRY+EKZFP
	be5TPNVQT433UX+G/wT8lRyo1pl9c8CYIVoV8EwW0LYJgjjQ1zuR9
X-Received: by 2002:a17:90b:5627:b0:36b:9835:cf96 with SMTP id 98e67ed59e1d1-37a01e2fbecmr13427010a91.2.1781507603869;
        Mon, 15 Jun 2026 00:13:23 -0700 (PDT)
X-Received: by 2002:a17:90b:5627:b0:36b:9835:cf96 with SMTP id 98e67ed59e1d1-37a01e2fbecmr13426964a91.2.1781507603363;
        Mon, 15 Jun 2026 00:13:23 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a2668cce5sm14867474a91.16.2026.06.15.00.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 00:13:22 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 12:42:17 +0530
Subject: [PATCH v3 6/6] arm64: dts: qcom: shikra-iqs-evk-imx577-camera: Add
 DT overlay
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-shikra-camss-review-v3-6-8183481f48d0@oss.qualcomm.com>
References: <20260615-shikra-camss-review-v3-0-8183481f48d0@oss.qualcomm.com>
In-Reply-To: <20260615-shikra-camss-review-v3-0-8183481f48d0@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781507551; l=3663;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=E7CeGzLsAvE26qPQBzedfdcKyXCu72MrhvI0MBEY7vc=;
 b=oKXbX4Mg1Z1NzqLOxWaXB5EB9ZWK+zefxeRcBA11wXCYJh2Mou0lDq4j8rzw55rUHdS5kfQV1
 Rkuxe7ZJBiaCyHJpuvEcVQ1DPWHtTQU0PZzr6rG8QibNPAM/OQeIPt9
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: GbGdU25TJFVZCuXw_oC5Hr8kQG7MvAw-
X-Authority-Analysis: v=2.4 cv=MNlQXsZl c=1 sm=1 tr=0 ts=6a2fa614 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=OGCdAuOInqFJiNoUztwA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA3NCBTYWx0ZWRfXyHinjcWb7gjM
 mrzQySoKPlO+gD27aJt6TCpAdhUbN2iUthtlxGbPrni384HMr/rP4JlLEW2lqXsa4y/qW3YwYs1
 4Nyy7FiesoYKtUtFsjZHViyO0Bt1pac=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA3NCBTYWx0ZWRfX45tEqnhH0JEF
 08hM9l31eWbuF17WCTg4tT4/4ipIsT52E6uYWwqqr9pfqL4Gd67rwHOkthSlT0Vzarle49h/ixF
 3A9tICre+YB/fquIilSQJOatu1tjFbjelsxnG6bkBIg72f73SMpXEXfX/hBDdtR0FCbk3+TZ3Xc
 KYQ+CJfoz5aPKXDmb4scQaowe9P0M4S6nXq69Pxhs9lzedmB95QIRZTU5JcoXXkLQrx1UKcuQCq
 KUbcL+1YqB+w0+RYfIKVSfa4JrXjuCFF8TJfhgVRQbQqlx2lMeIoDXxMMF0E69xhOEqoRLh5Rju
 Hy+yhiltDOAtYyhj7ncw1H/WAed+RjrJNcC341Y4LEEoPsuFUhQfSOQYv1lyYaTVV7fmKoZfp7c
 WgxDUcspI0ORmW112kCB8aN1ebagxgebB/O7vtG0XV0Bwqa5qo1ldfu7h8ehSLj88EXITVkwVRe
 II7+rfv3SojJ0vWUXdQ==
X-Proofpoint-ORIG-GUID: GbGdU25TJFVZCuXw_oC5Hr8kQG7MvAw-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0
 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150074
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64880-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,oss.qualcomm.com,nxp.com,pengutronix.de,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:andi.shyti@kernel.org,m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:quic_svankada@quicinc.com,m:vikram.sharma@oss.qualcomm.com,m:nihal.gupta@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nihal.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,linaro.org:email];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nihal.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C126868413F

Shikra IQS is an industrial-grade variant using PM8150 PMIC, requiring
different CSIPHY and sensor supply rails compared to the retail boards
(CQM and CQS) which use PM4125.

Add a dedicated overlay for optional IMX577 integration via CSIPHY1.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  2 +
 .../dts/qcom/shikra-iqs-evk-imx577-camera.dtso     | 79 ++++++++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 76b8f144983827f4905a72935e8d5291a227dc97..09f2318d1c12c4239a6a7bac4ecbca38eb65ffa2 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -340,9 +340,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
 
 shikra-cqm-evk-imx577-camera-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
 shikra-cqs-evk-imx577-camera-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
+shikra-iqs-evk-imx577-camera-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-imx577-camera.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-imx577-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-imx577-camera.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-imx577-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..d806fd9f520e9ca4b854714bbf746d049bcb7f9a
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/qcom,shikra-gcc.h>
+#include <dt-bindings/gpio/gpio.h>
+
+&camss {
+	vdd-csiphy-1p2-supply = <&pm8150_l11>;
+	vdd-csiphy-1p8-supply = <&pm8150_l12>;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			csiphy1_ep: endpoint {
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&imx577_ep1>;
+			};
+		};
+	};
+};
+
+&cci {
+	status = "okay";
+};
+
+&cci_i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	camera@1a {
+		compatible = "sony,imx577";
+		reg = <0x1a>;
+
+		reset-gpios = <&tlmm 33 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam_mclk1_default &cam1_reset_default>;
+		pinctrl-names = "default";
+
+		clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
+		assigned-clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		/*
+		 * avdd and dvdd are supplied by on-board regulators on the
+		 * IMX577 module from the connector's 3.3 V rail; they are
+		 * not SoC-controlled. dovdd (1.8 V) powers the carrier board
+		 * level-shifter that translates CCI I2C and reset lines
+		 * between the SoC and the connector.
+		 */
+		dovdd-supply = <&pm8150_l15>;
+
+		port {
+			imx577_ep1: endpoint {
+				link-frequencies = /bits/ 64 <600000000>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&csiphy1_ep>;
+			};
+		};
+	};
+};
+
+&tlmm {
+	cam1_reset_default: cam1-reset-default-state {
+		pins = "gpio33";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};

-- 
2.34.1


