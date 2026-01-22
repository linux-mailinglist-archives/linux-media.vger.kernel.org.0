Return-Path: <linux-media+bounces-51338-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHM3M7MBcmmvZwAAu9opvQ
	(envelope-from <linux-media+bounces-51338-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 11:53:39 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4282B658C0
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 11:53:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7363E880284
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 10:45:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A13B44279FE;
	Thu, 22 Jan 2026 10:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m0QEvOtz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ok5tPoav"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0171B42B749
	for <linux-media@vger.kernel.org>; Thu, 22 Jan 2026 10:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769078508; cv=none; b=GuPxuJb7BuJQuQ8nX1DJwi7dpfh4Xcd8K1j12I4rSRDcu3cFrrKTTFcemXFMWoXE1z89eImncGyCdoyyPDMWzBMMNJvdWFZQWQw5TrmbWIDuL8WW3+idX+sVo5yB9M22OrXtMCNCqD1CKyYTwwsLhHhgkLZRczsaHD8AYiORE6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769078508; c=relaxed/simple;
	bh=t5OG46p4ljnSn6Ugt7/7Wx2T2LZF7712SOUc7lxrUEc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cixu0IayVJF/B4e3yJzeRVZPTeMEi42UND7LPTNqk/K2wxjmnLj4iEMFOruEo0LhFW+hYaTjBvw0I1VLZUXa7lJJxO7rGOvb+ouq42tov1vIiw8Vc5RidMunP7xFjJz7TQd5PxukuLI+3i8Pljms9+URT/qaLRNk57XgT0Jxrmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m0QEvOtz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ok5tPoav; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M84gri791167
	for <linux-media@vger.kernel.org>; Thu, 22 Jan 2026 10:41:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hgRWl7dvcHPI/iM3lLLq/fDWsyOLgllUFc6gqOMV6G8=; b=m0QEvOtzDYFZji+V
	YmKfUTj2q1Otp1mzrvY1xBBwnc5brRdiH4A35CJ6lRGECohlj+C2tciAkwyWYYk6
	hO6hxZrQMwFO/gVx6S7IPp+nX1vulSSGfU7KLSest8L6svN9gAD2QcvEWBhx4uGA
	6FI1bmpeix+nDNZM/Ijfl0rb5/vM6W9YBb4mgJX2hrk54ZAHKq7c6OE2RWwi5j/d
	fxtpqcmqRDE1QWD5h2jtoezT02vJUJypah/VjXJ9R6/Q7IR+d0EH9k5zlH2uEW1v
	sU+Z7XfpVhuBaa02pSGpu2Qjtun50eBheFJlClPawnrfzzayxDWladmTUfT31BtV
	ysIxZg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu6p1j3wp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 22 Jan 2026 10:41:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c5e166fb75so202449085a.0
        for <linux-media@vger.kernel.org>; Thu, 22 Jan 2026 02:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769078504; x=1769683304; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hgRWl7dvcHPI/iM3lLLq/fDWsyOLgllUFc6gqOMV6G8=;
        b=Ok5tPoavwEkfkq2rUrDONh07DYJUf49/7kTxguSVRPw9eZvEvc9+TlcExQSrOxOip4
         3oIdTrCn82NsStSghtMWsgU03h/vMRZcj6BuneD+FxX5jz9fdTSRGy+9xLqplXVJ0Wrt
         +7ol/MNrSAfT8ltF/OQWYv9C+KimLJ3rLpLUgTf0ebbEANTSgbRyBBdzerXNk8N4nctI
         LrBvFGgwW/M4kynXFjAz1ROUe54iLBP75X8Be+xk9yNPmUKTE2GTL1jsEDMH7HuHeM7+
         wVChoh5ExLZo20Gp8M9QHtNv80YrkEUNQV9uXuSZkUZILxGONroUklpq+nVmhhOOhL8z
         z7eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769078504; x=1769683304;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hgRWl7dvcHPI/iM3lLLq/fDWsyOLgllUFc6gqOMV6G8=;
        b=Q6rHCry3L+SWDsaPva7b8248VpmFlCM8SMj94xMWymHgLRPD8nHVjeAieia3zLh6uZ
         RhBvyHFrKPaKJ9ea8h4+gnEsZuZvv/Swg2GkoxhNHj7zoBqr7p1tfx6xLP/HTki+MWS7
         IGQO5GzVaruMoyBH8y8jP/6RX/qsNBU1NCLfWiZftxtR/FzTuYX5p9+Are9wvXg2o1NO
         +zcWMvntLeyfNe6vzvyhnX9qTboRBRelykii96L10EgAq+oER6bJ2ZC9ODu1qAMV8rxR
         ahIzsurX/VDxkqrZcqIYb8E5NoIJRiUBk7wZvJfI05OZT5h2ulwwg2LMZ49w6dH9zvTx
         IPEQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9agu8bDrWjK/EVqhndnNByPUtIP6cDYH1J3X5hGKV8Qr0Pl80p5+TyPmbcYvX1a9pCfN9RqaGr14NjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxme0mliPiC5d50RCjZCBfx8/D3T59MfoKauei7QlyGmh1OHWC
	OyAW9wcxnIQaAsE+XinPtwC+TExAUb8U+JCvUkswd24kocQJ6oBiVxXClWh+4lyNgbXnPLUkRre
	pofMydgrJ9NjnPKj6r5vcebxibK5Bl872cmkV8JoMbf4sSTP4KuBjh97ANj8k2F9HKQ==
X-Gm-Gg: AZuq6aLZp99SXiEBG7u3fHGpaFktm34RvY+5QrsmzkDc5HZ5h1gqCuBdgQx9SAp2FOn
	vnAC54vhAhFksYAKnu8RkYUuQS+CP5Otplc2wCTjdyJF3t460IGeKxc2FbU0NIFuyqzUGwP6dOi
	ooW8qK0vTvMSglYElfhJ64jFlVL1g5+tzgGr+Ja0Bu6DG0zt+zRUCp24VnUVMIDAiZLOJ3MfUp8
	oip9cHYyGhtX44KN8fYmaK4vP8IL21lxws5rr2OuCXeD1NW8SLjv/3Xk6S5s0Ff5wSOK8Bemum2
	ue4mMpcz0tzpCeYtgWQRkmbousbyg9nYftWIinNhlZIgMBtwA95dXWLLQIAtWCoVGyMtzfl1iSp
	jb+XP8cXKCRhQE0eQ6THbToZmgpAq4gxGvTCsQtTjgH03c8TXDo1ZzuoN15FRKRCQw1ABtPa6Jf
	/i
X-Received: by 2002:a05:620a:3910:b0:8c5:38f2:810e with SMTP id af79cd13be357-8c6a67a411emr2605787585a.82.1769078503724;
        Thu, 22 Jan 2026 02:41:43 -0800 (PST)
X-Received: by 2002:a05:620a:3910:b0:8c5:38f2:810e with SMTP id af79cd13be357-8c6a67a411emr2605785685a.82.1769078503284;
        Thu, 22 Jan 2026 02:41:43 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a7260229sm1387868685a.42.2026.01.22.02.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 02:41:42 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 18:40:50 +0800
Subject: [PATCH v4 5/5] arm64: dts: qcom: talos-evk-camera: Add DT overlay
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-sm6150_evk-v4-5-a908d49892e7@oss.qualcomm.com>
References: <20260122-sm6150_evk-v4-0-a908d49892e7@oss.qualcomm.com>
In-Reply-To: <20260122-sm6150_evk-v4-0-a908d49892e7@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769078453; l=3019;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=t5OG46p4ljnSn6Ugt7/7Wx2T2LZF7712SOUc7lxrUEc=;
 b=n986DyQp3CsKwqwcFIuFzEWA3NaquONuV/voJTXw9fQ2RNi8BCnuw6M5vTv6vfYrct4IBiw01
 XcK3Aznm7QFBudn4AHwfEtODiasgAacyDuP/OgV5lAl0gYRNYY+fCyR
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: MCfMk98NDzFuDyCwUloYNVxzWWhNUG5G
X-Authority-Analysis: v=2.4 cv=N7ck1m9B c=1 sm=1 tr=0 ts=6971fee8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=G5RPoKDYpsqj7oBEIzsA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: MCfMk98NDzFuDyCwUloYNVxzWWhNUG5G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA3NiBTYWx0ZWRfX93EBz9efNWS/
 P1qQCJJeZM9H86dSEKy3O8Wt8qiFfls0BGvLR9hAK/vnxZWiYlBqyKFYcowH/Ayvnu6H3HfIYSE
 Wr8/D7Lnv4W6i2FCh5rJr+35kjr4Zb9O6a86YO+rePOSRH48fxUgkxQ7A3yj4sF3ig1ObmpgKBc
 ix9TpSMd8rRfs3WETf+I1Ypbjm2WX0hEhRZ8g+wYuHvVmK7ttsf9F4tF/zO6IGIz0LLiAIFV/4O
 CFF/3z/4t92RvTIplelHr1lIOnh3vo8vMdB26otOvkht8uE8+9AtRqeCSrONHhkow9cuuL3a/Xn
 Gg7cAda5cIyUaVH+sONz+6FSkjcpFKX3KtEK2cVepzCOqXsEMNxM6Z2rYJnBxHF4iYycZRV4bZ2
 a/sG6cvJb0OczNktGVO+/3iK+hA7scSRjTrao8Cp7ArhJwrmrGiFp3ohhmCtvIQsrp/7tKYIH/b
 QNVhDLPgBthzjS+VNpg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220076
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	TAGGED_FROM(0.00)[bounces-51338-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org,pengutronix.de];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,linaro.org:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,0.0.0.1:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4282B658C0
X-Rspamd-Action: no action

Enable IMX577 via CCI on Taloss EVK Core Kit.

The Talos EVK board does not include a camera sensor
by default, this DTSO has enabled the Arducam 12.3MP
IMX577 Mini Camera Module on the CSI-1 interface.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  3 ++
 .../boot/dts/qcom/talos-evk-camera-imx577.dtso     | 63 ++++++++++++++++++++++
 2 files changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index a2e48b58323c10735c8b98996cee6669e4f918e7..b505b5b1aa2feaaae691977b35a2d872751c4a46 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -349,8 +349,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-camera-imx577.dtbo
+talos-evk-camera-imx577-dtbs	:= talos-evk.dtb talos-evk-camera-imx577.dtbo
 talos-evk-lvds-auo,g133han01-dtbs	:= \
 	talos-evk.dtb talos-evk-lvds-auo,g133han01.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-camera-imx577.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-lvds-auo,g133han01.dtb
 x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
diff --git a/arch/arm64/boot/dts/qcom/talos-evk-camera-imx577.dtso b/arch/arm64/boot/dts/qcom/talos-evk-camera-imx577.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..53006a861878f9112673b9a0ad954bed7a5fdca5
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/talos-evk-camera-imx577.dtso
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/qcom,qcs615-camcc.h>
+#include <dt-bindings/gpio/gpio.h>
+
+&camss {
+	vdd-csiphy-1p2-supply = <&vreg_l11a>;
+	vdd-csiphy-1p8-supply = <&vreg_l12a>;
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
+		reset-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam2_default>;
+		pinctrl-names = "default";
+
+		clocks = <&camcc CAM_CC_MCLK2_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		avdd-supply = <&vreg_s4a>;
+
+		port {
+			imx577_ep1: endpoint {
+				link-frequencies = /bits/ 64 <600000000>;
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&csiphy1_ep>;
+			};
+		};
+	};
+};

-- 
2.34.1


