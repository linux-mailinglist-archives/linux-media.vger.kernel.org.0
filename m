Return-Path: <linux-media+bounces-64282-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5rHsGU3YJ2r13AIAu9opvQ
	(envelope-from <linux-media+bounces-64282-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 11:09:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9619E65E1E5
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 11:09:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=oltAfdje;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64282-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64282-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4459B301651E
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2026 08:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 178E33EFFB7;
	Tue,  9 Jun 2026 08:57:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE4B3E5A19
	for <linux-media@vger.kernel.org>; Tue,  9 Jun 2026 08:57:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780995440; cv=none; b=ARiMgmriqVIhaSZQU2b1uDzcurq94N2/5QE9WSg+KP1p+WauKsd6edcA5mvrpnJJTw+bevwfQrcf4qvX1org4iV3eYmWYNVRJWZPdA68/m1TEQLR9TRoDVnB+gGBNCUiyFi+Zu0AIJ6iCD3XBTUOt1UhvUu21qWIfLVimY3D2og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780995440; c=relaxed/simple;
	bh=zZCsXnjVimwX+u/Cp9VUCXkd7AOaMc73JPe7POemOaU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VXw9HZT665c+notvWKKPaNkhhYvUGZunkN5eA3FV49RfSVjLizHzkaBfYO14DboVc8XP+0Nw5jcTq2W7kZw2b8F3Oca7EEjq2jbs2GTVCLGXKJ3erop3ADxq4vGwn7Wd4nqDYV11cxuoMhgwhNOSYRsVLTgJWGt80yK2DZsGRN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oltAfdje; arc=none smtp.client-ip=209.85.208.49
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-68bd9fce347so9459130a12.2
        for <linux-media@vger.kernel.org>; Tue, 09 Jun 2026 01:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780995437; x=1781600237; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FPwdVwz7ctVs0k+br7o6SIlRqfvmba+MdXedF8Oh3cc=;
        b=oltAfdjeVuy5VznbfeBBC5mOPKft3ku/XG56RyfIMhCj9OxMeiBWT5J+H3hNYFJ3TF
         hXMMfAq8UZbfz3tqTrKJ9X0kzOp1AhDgdSzZxRnUNAFq13OhkfZBTaJTvXpN8bYoYbDK
         3B08INJbRR/ThPcDSAu7+pWekm2QnJZNJXmkbQ8oDyhtovwNvTKrOYg++d1fCk3KUy3j
         0o13965NX/1wBNtDPtW46JTpntr0m1EAB6BhNXo7EN47TgQSRVre1Do+DaopPgwpkOHd
         ei21yazQVvnOB8d40kbOIGZ/B2WwahcNHkK9RxeX9cpGGJfRma6VxhlD/cyykX0NtQbb
         IkLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780995437; x=1781600237;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FPwdVwz7ctVs0k+br7o6SIlRqfvmba+MdXedF8Oh3cc=;
        b=CxHb7gsVrTmFH98gpW1T1dSEXKXCJN8hYkLjrBFXdr9OcR6KgB3wALiZdVCzVJXjMf
         2A54ZOi54Wrn8g40VInMMq9k/qEk1oJVSVJ1TIhmYoCjI5btqk0mVGhceaoZsZ/sfL0u
         xnD0eOL0e5nkvx045Da889xLJmQxVLvaudvXOEfU+UZGkWx0sR/mpzCBNQxKXbbwlVf7
         mKjEp3cNexCZraH+GB56eyIKUhDwi0XpBDJCqr/iaMuDa9Koh1LPcHQNXw2d68R2phkO
         x0WKYdI4WWTYAx3FBRO6OTiJrZEucg2KWD9rSVcfSxgQIUAAbd37HQXUD3PWIz9NS7kF
         SK2Q==
X-Forwarded-Encrypted: i=1; AFNElJ+8Q2s33eaa74i4donG9orbubN1vlP/WK9gQgQYCNzA7VSIwRJovM8WB5GRpmBQSlYLWUAkcT39ObVDpA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxULdywwJGDBZyaazjE8T6CySIaQvcgmrV/Y4w5dF0VXCbvOwCJ
	83ZVB3HbAEW1kxk6mRcl0KL6lsOOCAsBod12jTAelYOPgmh/OJzYlLbcARfj7yhe4Q8=
X-Gm-Gg: Acq92OE9IxRYyylUOHzGU+WWa86ZWSm86/CyGmSdSEC6X4BiOlO+AJWtcgDILYF+qF2
	UPlMz6JiGbfbv63Uxe9x1v5/neQQ8iqDz3X8QXlNKJga79CuZwfxhE6uWEhDuQQP4a7KpcbpaAG
	G3gaNZ7HXy1+24IpWSux98J/SEfFxTeWjcO5ZAHYFonnRElO0hgkkz8b9nYS5/rmSQLNFc3VD2c
	JmNASAlSqcsBZ/Tfrcyv4NAJgu+VJD4A/wLdR8knjSVhN2thuusJp9vNGgqyGxHup5i1czCwxft
	2s+7neO8/mhwLe/H0+RVKk4XPX+30hPe1s9wvG7oeo3aggoTA00kKkCMiV9WE7F/T4LCO5fIpAC
	U31VplPp46gW6/KtI+STxZYK3U/xZijy1bPQ9K0tWrmP4DvhdOcLUmOvctbn9RvhY9QLpcE0rqC
	KU3GVZ6MKWKNkdXymWeaDHlYkq9e+b1LHyr5VK5kZjGqzE
X-Received: by 2002:a05:6402:4303:b0:688:1d5:44c5 with SMTP id 4fb4d7f45d1cf-692381fb3c7mr835032a12.2.1780995437379;
        Tue, 09 Jun 2026 01:57:17 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.72.26])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65b55d81sm8343493a12.27.2026.06.09.01.57.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 01:57:16 -0700 (PDT)
Message-ID: <c3b9dca7-7297-424c-9ab7-3ea29e9cf914@linaro.org>
Date: Tue, 9 Jun 2026 09:57:12 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] Add CAMSS and IMX577 sensor support for Shikra EVK
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
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
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64282-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linaro.org,nxp.com,pengutronix.de,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:nihal.gupta@oss.qualcomm.com,m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:andi.shyti@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:quic_svankada@quicinc.com,m:vikram.sharma@oss.qualcomm.com,m:wsa+renesas@sang-engineering.com,m:krzk@kernel.org,m:conor@kernel.org,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime,checkpatch.pl:url,vger.kernel.org:from_smtp,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9619E65E1E5

On 08/06/2026 15:06, Nihal Kumar Gupta wrote:
> Shikra EVK is based on the Qualcomm Shikra SoC.
> It lacks a camera sensor in its default configuration.
> This series adds CAMSS driver support, CCI definitions and enables
> the 22-pin IMX577 sensor via CSIPHY1 through device tree overlays.
> 
> We have tested IMX577 Sensor on CCI1 with following commands:
> - media-ctl --reset
> - media-ctl -d /dev/media0 -V '"imx577 1-001a":0[fmt:SRGGB10/4056x3040 field:none]'
> - media-ctl -d /dev/media0 -V '"msm_csiphy1":0[fmt:SRGGB10/4056x3040]'
> - media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
> - media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
> - media-ctl -d /dev/media0 -l '"msm_csiphy1":1->"msm_csid0":0[1]'
> - media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> - yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0
> 
> Used following tools for the sanity check of these changes.
> - make -j32 W=1
> - checkpatch.pl
> - make DT_CHECKER_FLAGS=-m W=1 DT_SCHEMA_FILES=i2c/qcom,i2c-cci.yaml dt_binding_check
> - make DT_CHECKER_FLAGS=-m DT_SCHEMA_FILES=media/qcom,qcm2290-camss.yaml dt_binding_check W=1
> - make CHECK_DTBS=y W=1 qcom/qrb2210-rb1-vision-mezzanine.dtb
> - make CHECK_DTBS=1 W=1 qcom/shikra-cqm-cqs-evk-imx577-camera.dtb
> - make CHECK_DTBS=1 W=1 qcom/shikra-iqs-evk-imx577-camera.dtb
> - make CHECK_DTBS=y W=1 dtbs
> 
> This patch series depends on patch series:
> https://lore.kernel.org/all/20260527-shikra-dt-v4-0-b5ca1fa0b392@oss.qualcomm.com/
> https://lore.kernel.org/all/20260608-shikra-gcc-rpmcc-clks-v5-0-94cefe092ee3@oss.qualcomm.com/
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
> Changes in v2:
> - Drop qcm2390_resources struct and CAMSS_2390 enum; use qcom,qcm2290-camss
>    as fallback compatible string since Shikra CAMSS is register-compatible
>    with QCM2290 (Loic, Bryan)
> - Use oneOf in iommus to describe all valid SID combinations: VFE-only
>    (Shikra) and VFE+CDM+OPE read+OPE write (QCM2290/Agatti); add
>    per-entry descriptions naming each SID (Krzysztof, Bryan)
> - Rename shikra-cqm-evk-imx577-camera overlay to
>    shikra-cqm-cqs-evk-imx577-camera, shared by both CQM and CQS EVK
>    boards which use the same PM4125 PMIC and camera supply rails (Bryan)
> - Add reset-gpios pinctrl state for IMX577 sensor (gpio33, cam1-reset-default-state)
> - Add comment in overlay DTS explaining absent regulators are powered
>    by the daughter board (Bryan)
> - Collect Reviewed-by tags
> - Add reset-gpios pinctrl state for IMX577 sensor.
> - Link to v1: https://lore.kernel.org/r/20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com
> 
> ---
> Nihal Kumar Gupta (7):
>        dt-bindings: media: qcom: Add Shikra CAMSS compatible
>        dt-bindings: i2c: qcom-cci: Document Shikra compatible
>        arm64: dts: qcom: shikra: Add CAMSS node
>        arm64: dts: qcom: shikra: Add CCI definitions
>        arm64: dts: qcom: shikra: Add pin configuration for mclks
>        arm64: dts: qcom: shikra-cqm-cqs-evk-imx577-camera: Add DT overlay
>        arm64: dts: qcom: shikra-iqs-evk-imx577-camera: Add DT overlay
> 
>   .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |   2 +
>   .../bindings/media/qcom,qcm2290-camss.yaml         |  16 +-
>   arch/arm64/boot/dts/qcom/Makefile                  |   8 +
>   .../dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso |  70 ++++++++
>   arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts        |   9 +
>   arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts        |   9 +
>   .../dts/qcom/shikra-iqs-evk-imx577-camera.dtso     |  70 ++++++++
>   arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts        |   9 +
>   arch/arm64/boot/dts/qcom/shikra.dtsi               | 197 +++++++++++++++++++++
>   9 files changed, 387 insertions(+), 3 deletions(-)
> ---
> base-commit: 6e845bcb78c95af935094040bd4edc3c2b6dd784
> change-id: 20260526-shikra-camss-review-cf6f66ac566b
> prerequisite-change-id: 20260511-shikra-dt-d75d97454646:v4
> prerequisite-patch-id: 3a689e8dda5fd2755b689d94d095806b3f2e6eed
> prerequisite-patch-id: 2acc300a68ed8c5364fb5f2f7d28fc0d56ab07bf
> prerequisite-patch-id: 2357cac636e019eaf14d6a493a1c72bca56fe405
> prerequisite-patch-id: 2885f299e711582da312ca9d13983d296a3dd5dc
> prerequisite-patch-id: 91af5f3c01e766a53ce8de69aa21847a2d6bbbf8
> prerequisite-change-id: 20260429-shikra-gcc-rpmcc-clks-2094edfff3b0:v5
> prerequisite-patch-id: 59bb0a7828e41f546f734f127d81da83c0adcda9
> prerequisite-patch-id: 197da6bcb15cadc47869dba88c8020987b25c335
> prerequisite-patch-id: 8ec9c1eb03f052ae232ed54117abed38672c23f6
> prerequisite-patch-id: 350db4f4bcdfc0fad9ed57cd5b1723f85ad44f5d
> 
> Best regards,

I really think you did a good job taking v1 feedback BTW, good work.


For the series.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

