Return-Path: <linux-media+bounces-56314-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JwDDyLBu2n1ngIAu9opvQ
	(envelope-from <linux-media+bounces-56314-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 10:25:54 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F6A2C89AF
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 10:25:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EFAB73003998
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 09:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D3D93BC675;
	Thu, 19 Mar 2026 09:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LGwcjYPz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hXaOZi2U"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047EE3BADBA
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 09:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773912267; cv=none; b=Ys/SFxNNyiJO+AYevgwRG7vb4L35UYwn+WIcHYy0IYDAtGCeryJBBiB8UynQ7iwndDJMvhBSyMjiDv8xKanMZwJQhiVdurwEix+vxH9dAuGTO4sqrJTsNgrpNVI5ZLBYQ9ZC6epY3SwH2Eq8JTNAunTzdeSBWIB5kFN4rDxV+9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773912267; c=relaxed/simple;
	bh=gfxLWwfF2AKQXalU+rumQ0ieO0pXnHY/iN5+ExVE2gI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O/rujVr/Mc26qF7kR89WzWUD+IbjyHO7uAxePxopogKNN4FMGXhlGTtOvb2N3Yf0AQ09aHWlTyHLwRKbA0Y2rLPtGz1COOEl236DWwe28ZwMCGLF/Y9WhdMB+k/G+quQC/lo9m0Vb2OST2dnlcI+XynvTzNpqN/S2mcCymF1ryc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LGwcjYPz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hXaOZi2U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J746xL770726
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 09:24:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qYRdTdLgVsmr83zB2UHBMMXbgW5Q/MM7kZAYJiw4tzE=; b=LGwcjYPzGYdExa05
	os/yi4ARGz7AYyMXHKIXA7CmAPO5cCf9LDqBa8ApMx8JSdsz/LbGIxPAu25sjwFS
	yiRYENtCcewS+9SIZCjtbQWpZcaRtOsd9wzlNQn1KgLNgNKhoN1s7d6Riggw5Cph
	o0qF37MvevbriycObxEVfyw5hGYr1ZpnS7HbsR9tO6nbvj9JmlrOjpGZk99CIVuW
	mO4F7NZcQmWO8IR8yUc5/9gCjdeFSDge1M1B/ayAnFUTJS6NgA0AdHNeFQXz6JWo
	lXoYT/8MOsTEAHCUlmum9FvrkPeMEUE01rSVL9oYlqnjHZrJ+eIkXuIeRjVTbe92
	ihisww==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d00egam83-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 09:24:25 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b069bfa817so11786375ad.3
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 02:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773912264; x=1774517064; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qYRdTdLgVsmr83zB2UHBMMXbgW5Q/MM7kZAYJiw4tzE=;
        b=hXaOZi2U18QFEolcs7D5tI88J7SdQURc/EEG3S2Uf75lhopU4lSyNQZFLuXohvMB8d
         0BQ/DnCQeMyErNU75tD3ojfJIWxKhNqeHEbNV1xlok5FgUFI++QwisrZEvZqfl7wu/XZ
         7o5aW3U7yJ6gldJbIIrmpR3z2pAEQPieAUTQovhe19SP1B0sD5rYOCWklHYmAz1i9MsO
         nDWaxw+BFcCtI6UEj14fkD+DAkxAjtser3SDrJCmhUiQ9IYvGE1QrO9/sLr5LuhHGMgn
         3CuaQRHb5EAX7f7V9+6FsFPAg5zgj2lsHCKNtCKk8RsxTZRAF9gxQ5+N4DGBVNrmTIuy
         ozfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773912264; x=1774517064;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qYRdTdLgVsmr83zB2UHBMMXbgW5Q/MM7kZAYJiw4tzE=;
        b=VDsW3I2PE8rCfPtjEB0uoKo2r8fATjp6Uw9QjXNEpCIFi+0BXEVffKikRvhFjgenGX
         SNB/yziwE6ryc4dSfXWMRUHI+aVSHpUodBD2Zlvd7yj4BY72poyQJwPsXarfRq0zIoVs
         yS2cQxqJMWHit1+vG6cav4HPEDhW/Ek9yzJ2rncqexEqBAIgGO3YjS3U5EtnGJzD7trA
         a3CvXlx9SrezqpA9kRXlvFbEWSoMIGihg2/v+nloFTBABZc5sK+HGpE/8jlnpdnTpmIe
         PqWbGTPacwNYeudM3cevgc87osVkve5tnM4/yPkWqWgRsMjFcuetJtp4M86EukbydwZp
         ra2w==
X-Gm-Message-State: AOJu0YwTrTvxZ+HTUAW785V5wMSBZFBXt23hj4lqzbjt/mUIdIWBzLg+
	vnD7ElN9EfgHhf6Q2q9tpGf7hX65MVTghx61CoORj8SGp0QrOOgNGMxg+Vh3qKJ/HaDfNrxqEEr
	liLsdKhdN4gRL3PbFI50oPYEH0UD7FCC+PvJQxmpzzSg6pga1I8mSsdzU+Odf1zcEywjFZ6Ps4u
	aZ
X-Gm-Gg: ATEYQzyciXTb274CB/bDjOTg8fPZ/Xx8v7vQw79NI+XdRHZPGFXanE+pQrTgf5prVnN
	RpmjN1JuIGCosf2KAZEjP/slPG/FjqK2GmcOhbEw0abiRVTsNTT4qhH8Y97KSX6LnWg2gNNm7h+
	FZatJOi8tTjlDGXufsmGENNaHfrQRE/aiX5+sPf4nu7+F3wdnBnyj3X4YVr9APYYPEKP7Fs5xcT
	d089cYVg6z7INOha2U7cL2fZR3uV0s/sF3HsT5cHMSRsY1praBD+GWCzgEitLoZijX8gdiBreD3
	p7lnkyLQYqYtUNPj1rJG5E98uZhLQOENRxO6bPRPCkyfA9/nDPleaN11ByKZY694URUJ/zo+Mmk
	WydOz6fLwoJv30TXHQKVq1KDmSFpF+MfK4QI7DSm23FU8HV1uo2hYayrD/q/7zMzwgqtC6buzCn
	hrNK81+PzAwxJ1U950fLcr
X-Received: by 2002:a17:902:cf11:b0:2b0:6e8f:8e73 with SMTP id d9443c01a7336-2b06e8f918fmr57167055ad.44.1773912264538;
        Thu, 19 Mar 2026 02:24:24 -0700 (PDT)
X-Received: by 2002:a17:902:cf11:b0:2b0:6e8f:8e73 with SMTP id d9443c01a7336-2b06e8f918fmr57166715ad.44.1773912264060;
        Thu, 19 Mar 2026 02:24:24 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0704ccc67sm48391035ad.15.2026.03.19.02.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 02:24:23 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 17:23:57 +0800
Subject: [PATCH v3 5/5] arm64: dts: qcom: purwa-iot-som: enable video
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-enable_iris_on_purwa-v3-5-bf8f3e9a8c9c@oss.qualcomm.com>
References: <20260319-enable_iris_on_purwa-v3-0-bf8f3e9a8c9c@oss.qualcomm.com>
In-Reply-To: <20260319-enable_iris_on_purwa-v3-0-bf8f3e9a8c9c@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773912238; l=797;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=gfxLWwfF2AKQXalU+rumQ0ieO0pXnHY/iN5+ExVE2gI=;
 b=sEuyW/0qqAXh5V31A5N2qELgEK3rgyEUpmvQZkub5l42MXqpM8aIh7ubyIuEYXtYxkSaotBDL
 H/8F6SAdqXPBT0+2wASsAMAtN55Nsx6/q+dG+svxtMwaRb8kxeQHS8s
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=MMNtWcZl c=1 sm=1 tr=0 ts=69bbc0c9 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=lIq5CcVmxYL3PNKvYLcA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: kuQOTJTUdr_NK0583yiEO5_yH8hHHFDg
X-Proofpoint-GUID: kuQOTJTUdr_NK0583yiEO5_yH8hHHFDg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA3NCBTYWx0ZWRfX7ypgP2pWVA5J
 e4yaPZnWJKUj5sObpfYg8jW0e1K+p5mEFg6xrfAcLruQMGykjg1jLbsoooSs8J9tEIgxPAks4sp
 6i4FcwIyMrROoF7CHJwXbd3IMdIGmSWcMZOeEwTlmce+YvOJ9jVE0FMww9uV0D4C8+i658wgsxq
 O+x1BfyerMiOaAhu572nItT6QxY681LhuLvjsK4zks8iffh6DBovB01SboL5GDCV8O/pLm9XkO9
 gB2sym0AyK7KINjFD81IUOYGxwPueCyHUh8TgswFb/xc04cnNfr6AtjQArRuxpNGYBX3AqCFq4P
 yzxvFgNWNcaYJTMncjG39Uk+T96RsyhqeM4mUe+O481EywnNh7qHDSDB7Pdzq6114WhFjJRztUK
 Af7SDYt2XCHb9hdJCig3FfRSrBX4uqlCv8mgBByZqRmtWjsZwfoSE50+Pr4Vcum3MtKyg7UlNpS
 3MbbKT+DS3xI4v/8dEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190074
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-56314-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E0F6A2C89AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable video nodes on the purwa-iot-som board.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
index fb90beb1096f665dab834737b6f4115f56c72977..549fbfa3273270d287bb447b45a7d2f58fa15a47 100644
--- a/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
@@ -389,6 +389,10 @@ &gpu_zap_shader {
 	firmware-name = "qcom/x1p42100/gen71500_zap.mbn";
 };
 
+&iris {
+	status = "okay";
+};
+
 &pcie3 {
 	pinctrl-0 = <&pcie3_default>;
 	pinctrl-names = "default";

-- 
2.43.0


