Return-Path: <linux-media+bounces-64894-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9XV1DMS5L2q0FAUAu9opvQ
	(envelope-from <linux-media+bounces-64894-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 10:37:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 802576849BA
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 10:37:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lv4pIcee;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Isv74LUR;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64894-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64894-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EBBBF302BE23
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 08:35:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 872563A59A3;
	Mon, 15 Jun 2026 08:34:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38113D0925
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 08:34:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781512479; cv=none; b=UAJS0Z/gSAhb32/4b47XPuQ9PH+WKnqkbDrbT75FNEhfiHz4Mw/q+n27ErwvmTvAETLnRmqIagVcjWU+eK8LMunH4TpZ/7hNYRYgm/OP1GFzOaWofjygsxEOKdyQ9EsD4hACNEtwJFBYZH+pM29KtD8vq/Bf0o9t5y8hMiGavEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781512479; c=relaxed/simple;
	bh=dD0P2j8Nr28ZbmLTZrfr3Iys+tRkC7smVwGCVx5OZpM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QTX8nVqPNYRSl+6dUSt6jHdT7kTO/YnhzepmH4ng9xZds+pne0fTE9YjWH68er9EAG7Zol/kXNBzou7yZYQoQUnt3c2Ogc3eb5rbqqImgWurmIFXzwdsOx32/gX5L65Sb9hyfEb5aoxMvbs7akgFa8yvBp6kw5sM2HbTPTEzEao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lv4pIcee; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Isv74LUR; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6KaQS3709685
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 08:34:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+V1+Dvn3cDeatOqG+XJiqlXl0JvB6Pajl2d8bHbdmnE=; b=lv4pIceeNxd5cu48
	UH8gJsf0WLoHM/FTmuj3jRY6xgDwa5DBOTmyukYf3a+eEBOMxwOePZsLFP/suSht
	jSSbgUKDZ8W77L3wahFrUb5CN0bJ/Ws4+cu8CIvvbJTwrIMqn2AOn42x/AEm5+Xr
	RcQmsxVHUy3iI87JvBlCvksPeJBFrcnnEwLpYmRFF+tE+2dJVuf2RyPu/18GjuFS
	XYJpkvcQW8Kv6Jq6dagOiPxAGBMw2gHLNtIhuHG65YfLoR9rCkKzIFvyc3DdprW9
	peGfGV45/U9qJM0oOIABgggJ2lhhBlYaXkRSPwVOaSSRS6onX4YZxeJyclubHUlZ
	TTZCNA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery956eb9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 08:34:30 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bd04e4fe3dso83960685ad.3
        for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 01:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781512470; x=1782117270; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+V1+Dvn3cDeatOqG+XJiqlXl0JvB6Pajl2d8bHbdmnE=;
        b=Isv74LURe8/YRGzEijRXBTk57EEuPOZrxwyfWSUlWuxdrnkeN+/5aa6a7QFiBTEGPN
         wxAw5qa9MT2fsIE0/J+oT+oT5m6wNigWodh+L5iuPaHybOc5HWe/iOOIv4PfSlxnGquF
         WeAUHFpBB6sP2w+BITzvc4jp3zC/GgPgu5IcTz39zs5Ls/YUtJezHjgkeyjW0YA22+RQ
         jGB4rvr0FYgFGQpyDe/icwx2posIV+45tOhAbj9PN+qMTnIU0onUtnXcojZH2XSDB2Zf
         TpxkPHJOkBSJEzuqbYmK6i0VP4UqNBB9/5WMv13nAHogK0xglH27Q5CSGt1WFKVtRyZP
         s6Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781512470; x=1782117270;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+V1+Dvn3cDeatOqG+XJiqlXl0JvB6Pajl2d8bHbdmnE=;
        b=HSyGprR5fM/s3CHGicrCJmgy3WYMRhsseLhbm3IrKPqOEnXhQeFs4TxnE3575R2ZyL
         BCbMYImURG1MadSW1XlwluK90eMLz/5NUd3zR3F/chTnvkNu5diT7b3eGGDdYdHIgtkz
         1MAIMJzpoxtkiPMJUydkDmYMRgjYiJ6atvgZ8zF15INnhM/FaPG41jbywTULZjkyP51V
         9THbgKbwW/M54xpJYE7WC6hAL46lPIlD74lxx0aY603PIBKhHnO5ZhMY+rIPQ2sAFcok
         9d82X26cVLljT81Ifyxps5YfPEIFRPFRzMGQoG6zW91jjfbaR3+VGVInVwwwhrG/JaRK
         sWqg==
X-Forwarded-Encrypted: i=1; AFNElJ8GD4pRaeimBdxUTakElDi+IVw2xnRZ3zRcU+ksT2CcN1LXdA2L1oetTPNX7sG5NgL179sfZAqv9vlDNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSdyqmzRV0kdbIHP/CxJzr2PqW/sH9aa4cKAJcHQyW2EfUD2gU
	8NFXtM63plBldk8sWoOSEQrqLcw2EcAoudhfDsT9dgVSL2y8WXYyybMuq28UqJ2dtCXRmB8auH6
	GJNZkxHwP1f4qCLxwHDDTuzQ8qxCyN+jWcI7FhrTqe26CXV756L85N2IUeHF2w7GjGQ==
X-Gm-Gg: Acq92OEtD0Qb0s3QkXitO8iSGrE03MvQZ8/W8ER/RYVw7AuiGJdvyv2ne4lp0ihg4ng
	QY97H225A8LssDPmUPh0+Qo7tFinGjTkZB9gc6vZ/596bzczT7ZXCcWOj3rRf0bRdXUBPP9HO0S
	VyZVebRHwmJYMY8WwuYj35OitI1bslRo0W3xt48V/R0PEcL6w85GP3Gb3k98LUeVVYn5UuWucnc
	8RGWe5YAk4utNSQbw31vOUIbC6KVEJPkobkg/qPwyIEx04V8tkOxfG9JaixuEBqcu6AP0lxbTBF
	Xblt5P/9It/9lMt48VbWs3V7dA1czMd9yzF+agmgiVSJ42bnlSmqPYZhKqH2Z1XG4BROyo6LdD2
	/h1lfN6IhYCLwl2/gqk6NJ4GTRA1ibbFOq5j65bO2p6iAqdVMkxm6
X-Received: by 2002:a17:902:cf0b:b0:2c0:c262:b917 with SMTP id d9443c01a7336-2c4109ed1b4mr154920905ad.5.1781512469866;
        Mon, 15 Jun 2026 01:34:29 -0700 (PDT)
X-Received: by 2002:a17:902:cf0b:b0:2c0:c262:b917 with SMTP id d9443c01a7336-2c4109ed1b4mr154920495ad.5.1781512469458;
        Mon, 15 Jun 2026 01:34:29 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c70easm122789235ad.25.2026.06.15.01.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:34:29 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 14:03:56 +0530
Subject: [PATCH v4 3/6] arm64: dts: qcom: shikra: Add CCI definitions
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-shikra-camss-review-v4-3-bcb51081735b@oss.qualcomm.com>
References: <20260615-shikra-camss-review-v4-0-bcb51081735b@oss.qualcomm.com>
In-Reply-To: <20260615-shikra-camss-review-v4-0-bcb51081735b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781512439; l=2667;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=dD0P2j8Nr28ZbmLTZrfr3Iys+tRkC7smVwGCVx5OZpM=;
 b=Cniw94I/IeuLlJ+GNuZeIQ0xTcT3NSx88I3wNJU/KukWnT79nHfA3XKcm0P6UDN9oZD8m0CuH
 UxBW8/qf050ANTXNPa8VDLV6JEP4odbMobSTjgfvNB8SJRoaZWqpIQ2
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-ORIG-GUID: qBHosfwy8WzCKPUpF8MJToWy82rNkris
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfXxK7pLVY0CyDw
 AHejIWjj7MlDRzjoTPhhla9DcV6q/h+Xhr8F01L9bJTK5DFU0EvCur/AjzFEeqmchhmMQIHPV+w
 tixAsSlyp5NXCdPGY4TSPR9BSmoLJJU=
X-Proofpoint-GUID: qBHosfwy8WzCKPUpF8MJToWy82rNkris
X-Authority-Analysis: v=2.4 cv=EbP4hvmC c=1 sm=1 tr=0 ts=6a2fb916 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=s9wsCz4ZXjtKvCKk99UA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfX6cNgXn3ULrO7
 2ESM5q0O4JHCoKWLSegR7JaFf6g+8ij7qRwTkhD7+QXOTdUJv9vF7Fe2hbet/RHx8ST8QO4joCl
 infP/JOejE5BFTnTYuTGXsZnLQRaq5LrTk9CuNOXO1OJt4oIkrtZ8/Osow2REuSsn1JVnWnT0e9
 rXx2CT7E15MOjxTqee4BcaRTLGpanDknqhyk1uOaWxUnVjGPwMYeSQmr9KBjZXklSRFKZI42+Mw
 WxkKI4DFTQdj749+Q3U8pGJT6JNNosu7unWHEIe9UDmo9m3hUP7FCit7aO0JPrfOfM+7h29eXWY
 hJnZ70ZjDl2CAJQQIDcA357BrDeE1FcHV7mOF0beRkQd47FpsU6bAVJpvT4MdMPdSsEkwdZrU9b
 H8fDfsECCmwHv7wpY7KsCvOkozbYS7679x5mbod/ke2ZBm+6YMZSyWvjOu20FJr8A1mgp75SIHh
 VWkoMx33/N0yNqOrYQw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150089
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64894-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,oss.qualcomm.com,nxp.com,pengutronix.de,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:andi.shyti@kernel.org,m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:quic_svankada@quicinc.com,m:vikram.sharma@oss.qualcomm.com,m:nihal.gupta@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nihal.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,linaro.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 802576849BA

Qualcomm Shikra SoC has one Camera Control Interface (CCI)
containing two I2C hosts.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 70 ++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index f0e827996609dab2c09834857a1bffd9560155a6..57732804a6c6a114a407a4a541a1cc7af7635ea2 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -348,6 +348,38 @@ tlmm: pinctrl@500000 {
 			gpio-ranges = <&tlmm 0 0 165>;
 			wakeup-parent = <&mpm>;
 
+			cci_i2c0_default: cci-i2c0-default-state {
+				/* SDA, SCL */
+				pins = "gpio36", "gpio37";
+				function = "cci_i2c0";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci_i2c0_sleep: cci-i2c0-sleep-state {
+				/* SDA, SCL */
+				pins = "gpio36", "gpio37";
+				function = "cci_i2c0";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cci_i2c1_default: cci-i2c1-default-state {
+				/* SDA, SCL */
+				pins = "gpio41", "gpio42";
+				function = "cci_i2c1";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci_i2c1_sleep: cci-i2c1-sleep-state {
+				/* SDA, SCL */
+				pins = "gpio41", "gpio42";
+				function = "cci_i2c1";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
 			qup_uart0_default: qup-uart0-default-state {
 				pins = "gpio0", "gpio1";
 				function = "qup0_se0";
@@ -702,6 +734,44 @@ port@1 {
 					reg = <1>;
 				};
 			};
+
+		};
+
+		cci: cci@5c1b000 {
+			compatible = "qcom,shikra-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x05c1b000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 206 IRQ_TYPE_EDGE_RISING 0>;
+
+			clocks = <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+				 <&gcc GCC_CAMSS_CCI_0_CLK>;
+			clock-names = "ahb",
+				      "cci";
+
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;
+
+			pinctrl-0 = <&cci_i2c0_default &cci_i2c1_default>;
+			pinctrl-1 = <&cci_i2c0_sleep &cci_i2c1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
 		};
 
 		qupv3_0: geniqup@4ac0000 {

-- 
2.34.1


