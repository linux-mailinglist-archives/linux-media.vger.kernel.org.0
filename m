Return-Path: <linux-media+bounces-64193-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ECCSHVLOJmp0kwIAu9opvQ
	(envelope-from <linux-media+bounces-64193-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 16:14:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70884657066
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 16:14:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HbOfu769;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=caH2KRn7;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64193-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64193-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1918E3047FDD
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 14:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8E053C98B3;
	Mon,  8 Jun 2026 14:07:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE7E3CBE80
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 14:07:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780927662; cv=none; b=SYVknAfXMMj0U8Gj8uZ9G79zkSupGmMaO7sv/cjQzDqbv2v4talEPlPU5v/8ZkUK5gmzcDYX1XyFeLvEsCn7asXWnkWzcbajHxcbScntt8wBKJc2SVoWieQPocklhHthDnU6x/y/aVXXO4l2dTii+U5CdZgpiqPCo1wzLNd6Hl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780927662; c=relaxed/simple;
	bh=R5wAzXzZufa2JNL7Pu+bFDchV+HH1sdlIkcQCFcUAKw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZmYXcxb55ULdgPgewIipbMCvWnafk4+QWI2XEC8xrKOorbpG4fBF/fWOvVLUM6b78A0utlLlchvWVc4fUQz9V+NlfQwaMD2ri0vioQwPXwf2HlBmGFqTff6DGRiKlpqMXZYrZxdkc2qrkAO48j1y/AbMbQGVGSwf7VvQbr9jins=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HbOfu769; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=caH2KRn7; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658DR44j3336021
	for <linux-media@vger.kernel.org>; Mon, 8 Jun 2026 14:07:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ptJ4K9XngG1h9g+wzv3R0d5a26qxjwl67BJuxrxeWOk=; b=HbOfu769D6HkdEVu
	TkNMjrgly8wEo1YPnLxmZOOIyBlOqGpLmqh7j9ojuWQeXdVUMCmSVSxw5M+pFF1w
	PS+PMW2u4aZgjNDpOZ+/mzwybopcc4oIyUOyIIyUwwYQ85e8WbY2h+uWIPb+qh1t
	UaWahRyfUeY6CGamWweiSzlgNRz2P9luIwh+bD+HMP9zyvif87ipGLS/OhwPGsFC
	iPrqulvo0Ff/2h1x9C7zPwF7+5Ir54zhzmW0f0zM2uA0LYmuBkFgnQPYOs7p/MAO
	jjMjl74MGTq+J9ll1o9iG6AJHNx5G3ebVFdG9baUyIp4PlJATyhaNPP+oaT5HqZs
	kRA0aA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enun411g0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 08 Jun 2026 14:07:40 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf11699875so44362315ad.1
        for <linux-media@vger.kernel.org>; Mon, 08 Jun 2026 07:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780927660; x=1781532460; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ptJ4K9XngG1h9g+wzv3R0d5a26qxjwl67BJuxrxeWOk=;
        b=caH2KRn7yzupKbZLEESrG+L9qSEcKCREqxxurNSMwmeM5Cm03dMwvPUQHbOGCKSNlO
         sA6SX3FvxYaqH34IJYTUQ318yuiyRSoWyT3IQ2TNbYTjI7T1yc1xf8h4PuzbRo4ngkhr
         7R1ESLo2dzPWTg6cSQo3bAK5F7tq10NxCB+tdYIwVc6PctWUgj9xm1s/0lTbzN1AzioI
         UtfIUT7yxOHeXuX+n3Qg1o8O8iEn6aCgtPOO50czrrhhzTwTWhAfEgVG5LpACei47+aE
         EYmPYfYjTA/FA9fcC9LGtV3DdZui/DZIIq9CixZGd2jlsk+IriKQcI3Utyhsdo/L81Vq
         cZkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780927660; x=1781532460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ptJ4K9XngG1h9g+wzv3R0d5a26qxjwl67BJuxrxeWOk=;
        b=Bl37kGVgmhTdjJH+8ZM3vqU7sJ9tOzbjnaszARmBYDssWUgeyFAMuA2GMtX9J2MpbO
         vLGiqDEy0m1IZ5eUZsfenSU+gZ/vkL7Z41k9Nx9O7bEgsZkxYEf6fQTgn+Q5DsB58TOo
         CnxGR11t0CbSRsyOTY85lTDFXEQO7hJNOk8KJ1TcEt+MIXHnZa3+hVcsALBkbaSPat7b
         HUNuwVcd5Frk/q6hx29Gkmc6CMtE1grUDCvHa3IkTFfYbbEdrc946pqbYInwCmezUIRW
         bvzDsAltjHdkhCcqKMf5g7X/1Kbq6SSq9Tl8LaDe/RiqXbZlxbLQbP0ydfdRluMgrAsL
         Ug7A==
X-Forwarded-Encrypted: i=1; AFNElJ/Uu7MJPt1ggq+/eb6nuQVBykI9f64pgAo5Ztczbf4VTlW1VvyT7r1dPxbgXMH025NCcVTZECb9EL09JQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7tYPhUfOrQkvnunyTfBIVXkKY3Y/NyY5xkNVWdeMxFRRknup6
	xaN0XdLiPv4SZRdQdocc55EBKoIjK56EWjT5QnE8S5SeAI0ZRmQyoIWW70usrbRrq9s2R2mdTOw
	fR0x0/ee3U5tvMHEaMFG5/fdcp6oW9elRcHNCws3SAovwnm0NwP+I44T3rWudYHClVg==
X-Gm-Gg: Acq92OH+huXT4IoNmq4H+pqY01tl2Ypek5WIsJVw3b8Hb0xfPufMnIGmPJ8cKVZUdtb
	DappSsQwvFFMiftwoawlasZHq46c15aMIBEYuV/EufR/YTreIjC8gAZLK6XC8pOgrOzICp95lJa
	SBD5y39D3qOw9XxL/vCozwYig420WgdCuERZlujYEb/XuejtEWmND6UAtKIyMD4VyrsY26xomd+
	+1O2fKDB+hCEwXiiDw3PuNdQe9qEuQfoLGKp4ViolrXhjxTFplbQroSX8u5RWxCZdOmhGAhGtor
	suynQkSF17JlDXLikkxCzjljokeCgTi4pm0kfqag5HAP5Pl3EoaZ6TN2vHfA8tpiu8YFHpN6G13
	HgyBgIzEV+MQLVOcvL02FXuNUOW/VNKSUyqOhb/+1qL8ARFH799+P1WIWYvQptDM=
X-Received: by 2002:a17:902:fc8f:b0:2c0:d29b:34ff with SMTP id d9443c01a7336-2c1ec514e77mr128961475ad.10.1780927659655;
        Mon, 08 Jun 2026 07:07:39 -0700 (PDT)
X-Received: by 2002:a17:902:fc8f:b0:2c0:d29b:34ff with SMTP id d9443c01a7336-2c1ec514e77mr128961025ad.10.1780927658999;
        Mon, 08 Jun 2026 07:07:38 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1646e5c51sm183935955ad.0.2026.06.08.07.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:07:38 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 19:36:43 +0530
Subject: [PATCH v2 6/7] arm64: dts: qcom: shikra-cqm-cqs-evk-imx577-camera:
 Add DT overlay
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-shikra-camss-review-v2-6-ca1936bf1219@oss.qualcomm.com>
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780927607; l=4611;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=R5wAzXzZufa2JNL7Pu+bFDchV+HH1sdlIkcQCFcUAKw=;
 b=NshZi54WeV9a8D97jiR1sB/dyTfMfPfOSFbl4swH1UfFSw1K6lBZdCKTV5R1848lCk9Nm7UxV
 8f5FJ1Q1u61DhgMy9lnbAukPV9ZrbtW5qzd2BJOA5ZlOsZZUZ+Wxxu6
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzMyBTYWx0ZWRfX9nHk1FSQGZQX
 ScJoeh7xv+RPM2JcSYsKvRhWmCNpGihfPFy+KncEFYZ/zO9HJRNTFT4nH4KFl3Z5H6NlSyMD+da
 bXg2RtoPYA3CkamxE71G8ca/nwsJ9C26HGnIUp4XFBFxBPArJPYgzLk4jmfh5SVu08CVyPFrsUt
 7wQdx6Hsdxaldlm+R+Yb3NZz5AMozySN8iiWrZ9qZTOkPQ+fgfoMUlkA2Q8jkb79OlTZHMhM/sG
 xnwe66F0ZTWVlFoBbx5f4A1bomQzk9fR+l4jPhtXa2h6tLx59tv0XlRdwGCyDIQDKUP1A1QkUIl
 Z68+g8pDynYbomUBufd++amwIheUX6QIYUy+ZnYSuEnqIkXbEWtrqRzIOhpsT+2n7JCqSQ6ZJDk
 XC8Hpm/1YiSS4TFjSU/0RZIIgpx3BcAgMjQo3KuHTIYLlq3bvz2xSka3PcMFMhYOu0jwoUmwjcc
 mm5Xa2R/LQvWPCSyq3w==
X-Proofpoint-ORIG-GUID: gY6uUgjXxjw-N-twxvK2X1vHe1HcIEBG
X-Authority-Analysis: v=2.4 cv=ZY4t8MVA c=1 sm=1 tr=0 ts=6a26ccac cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=5a0XiBUjDn2U0RQTkwkA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: gY6uUgjXxjw-N-twxvK2X1vHe1HcIEBG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080133
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64193-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,oss.qualcomm.com,nxp.com,pengutronix.de,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:andi.shyti@kernel.org,m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:quic_svankada@quicinc.com,m:vikram.sharma@oss.qualcomm.com,m:nihal.gupta@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nihal.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
X-Rspamd-Queue-Id: 70884657066

Shikra CQM and CQS are retail variants sharing the same PM4125 PMIC
and identical camera supply rails. The only difference between them
is the integrated modem on CQM, which does not affect camera hardware.

Add a shared overlay for optional IMX577 integration via CSIPHY1,
used by both CQM and CQS EVK boards.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  6 ++
 .../dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso | 70 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts        |  9 +++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts        |  9 +++
 4 files changed, 94 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index a9e9d829fb962386b3975f345ec006504607130a..76b8f144983827f4905a72935e8d5291a227dc97 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -337,6 +337,12 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdx75-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
+
+shikra-cqm-evk-imx577-camera-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
+shikra-cqs-evk-imx577-camera-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-imx577-camera.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-imx577-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso b/arch/arm64/boot/dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..e3dad7c81e5e8aeb1061c784b5b893965f914a6f
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso
@@ -0,0 +1,70 @@
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
+	vdd-csiphy-1p2-supply = <&pm4125_l5>;
+	vdd-csiphy-1p8-supply = <&pm4125_l13>;
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
+		dovdd-supply = <&pm4125_l15>;
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
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index 0a52ab9b7a4c34d371f5ac23efe59d1c9d2723f4..0d5c3e31b1f613157d4d2ec6947c630f1031b73b 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -38,3 +38,12 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&tlmm {
+	cam1_reset_default: cam1-reset-default-state {
+		pins = "gpio33";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index b3f19a64d7aed3121ef092df684b19a4de39b497..515af370ca014a668dc035ff944fb82b6e09ceeb 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -38,3 +38,12 @@ &sdhc_1 {
 
 	status = "okay";
 };
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


