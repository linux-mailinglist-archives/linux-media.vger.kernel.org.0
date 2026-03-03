Return-Path: <linux-media+bounces-54289-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCWMK1Kwpmn9SgAAu9opvQ
	(envelope-from <linux-media+bounces-54289-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 10:56:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EAA01EC2D9
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 10:56:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E106D301CECC
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 09:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 842D638F654;
	Tue,  3 Mar 2026 09:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LsVNi2gX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1A838C408
	for <linux-media@vger.kernel.org>; Tue,  3 Mar 2026 09:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772531784; cv=none; b=cujyk88+DKK2riNHutXqxiSriuX0xYo0PuQ2DXQEFTbuPgVDbv2cP/H9kix4Nfn0MD00QZdwEjfCdvaB6ku84okqzpngA1m5vfl/G7DyXTYpXI26mRtia4pX4FMIGC15tDQWTuIfbV2j7BkP4Ay61GO78AOBQ++d5XQNPwf3Av8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772531784; c=relaxed/simple;
	bh=jAqjFZ1cVljCe046fBFPJ/ldGEkf19iTq1wr8cQMmOY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ShPxBBGGZOJo4/T3e0p3I7gkEZG0zxADWa6QU6CA7X++E3FAW0skkr1wVRMkGcuV1EcEBOsse/XhP5zZpjBEU1ZH10DNHtReGiDQ9j5BGAMScrDjYZTJz5lFx8b3rYuXxDpSfdJ/tgtoawUdAAVYLheal41tndnu0ggNCeBbEgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LsVNi2gX; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4837f27cf2dso48607885e9.2
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 01:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772531781; x=1773136581; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uJ4zYk7rVbgDrmP0BB3MrmvGdOwTNgKEAmJ+HRQXJxs=;
        b=LsVNi2gXhm8X482hlGbVJG4adPpi8k4iZ179m3wjWA7mgIs9QBfJrhXsy1PoPy6wGt
         EfbvSo2tofXgamK4IrasnZboOt4xMYWiDqRe5NkTePs9t3xTrW/NsX0a1LOu8M4hOqCy
         R9kk2I2+Yf5smh/F3A8e4UhdHYoLV1Iwqy7oIdPHwjVlsEOXn+6f6cS8aAKBs/K0G85X
         RiSNNdhMzmZFZjfMte0RzhH+6dGa8qo6dP0oMwcb1NYKzLYZUBC9Ed/LvS/IWWHm8vcp
         4pMly472anrHT+MYHuAUPG+fQrHM5AW85Nq2/YRaCZ36zGZahSqZLSy10wV2xY/utI1w
         FreQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772531781; x=1773136581;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uJ4zYk7rVbgDrmP0BB3MrmvGdOwTNgKEAmJ+HRQXJxs=;
        b=OKwRqsKoxlm/kcAAO2MqF+gq4SUpoPQymVkClsDlHc1fPOB+qc5HE0poTUTeTLogiY
         GaW+N9yzOvtvryvpMIaXhdE4K3y+BUby4GaObMCwKANn97QgHpQsSBQVyGmM77/M9NIt
         pvVUKvpGLpMoK6XhmdCeuzw1LwWpyZMeap0eB/r6P6whmt29MYfuBpMh3e/dZ7Wdh9CI
         anGmWIZLUQ/ag4uFGUNyhqOWFiSC1nshSQkNKx+8MI3k4T2p0+XtQsORTXizrHGFZKMM
         J2j1F01ow4pNlFuVVAN7Oen0MgmkW4S+vpxTW/x/wU9sce2Bh2A6zDAKBB0afYFZ8Yik
         LQKA==
X-Forwarded-Encrypted: i=1; AJvYcCVG+WATKBZ+FRC4aylpZEJs+d6RcVwEm05gVKbkXzQjd/qli/rMoP0GPGNVB38vahF73OA0xZb3EAPDEA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yytz3MtOFdl7FDdc14VukXElMmW+j+ANW3MbCIFbYayyk71wPwV
	6BrtA8cT1KA6mq8+drr8iwK/4QZFWK7O52fnv+vwPcl0vmRF7Ep+aqRHhVRMEhG7Jig=
X-Gm-Gg: ATEYQzxgKHF1viSPuA5X+UFpgWRCJ26SXp+lwTz3cVnDrx2rYstyOTsTaOUh+F2S9cV
	rn5QVuaB5ySiVDkGm4vXI6IPYOMc4neIJgAXTezMPoamBytmqw+Sut/qqFJyNgF6F5MVV0gjuup
	0+t9WH2G6Hk12Tfn1luhqs3F8W5xctrP/L5RhF5hAhbrlSo4EgYf+WeNO6ZMVCAr5KrLuaZMu9o
	r5z2QL/b3eV8O13cjq2JryumBzgL5PJ8vpjIJSvRr9MeKTA+LuzFC+pKcbMUv+u9+bxoSg4zBqV
	Zug6aRXB1gKIcTkyRK/8urYZmiVwDCk02Vz1kEbo5Zuf/nlQaA6fl7DFYpe680UohmzveMzX0dK
	ndPCpLgMRPyFO59xEd757CpepIl9Nsodynhve87rYxuWEn3nhxUzTrDMVfVTbn18f6E32P8SX2j
	D6PKrDtobAFrkrg2X1OkpWViXPxwrX36t3wLlNCiMjayiLvH00fmvChU7dL5BADzc8
X-Received: by 2002:a05:600c:1d0e:b0:483:acd9:bd18 with SMTP id 5b1f17b1804b1-483c9bc55ecmr267450835e9.1.1772531780790;
        Tue, 03 Mar 2026 01:56:20 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851335e1f9sm15442435e9.7.2026.03.03.01.56.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 01:56:20 -0800 (PST)
Message-ID: <4156dea0-924f-4577-bf54-d5d8928f7adf@linaro.org>
Date: Tue, 3 Mar 2026 09:56:18 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v4 7/9] media: qcom: camss: csiphy-3ph: Add Gen2
 v1.2.1 MIPI CSI-2 C-PHY init
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Joel Selvaraj <foss@joelselvaraj.com>, Kieran Bingham <kbingham@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260301-qcom-cphy-v4-0-e53316d2cc65@ixit.cz>
 <20260301-qcom-cphy-v4-7-e53316d2cc65@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260301-qcom-cphy-v4-7-e53316d2cc65@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 7EAA01EC2D9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54289-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[ixit.cz,kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,linaro.org:dkim,linaro.org:email,linaro.org:mid,ixit.cz:email]
X-Rspamd-Action: no action

On 01/03/2026 00:51, David Heidelberg via B4 Relay wrote:
> From: Luca Weiss <luca.weiss@fairphone.com>
> 
> Add a PHY configuration sequence for the sm8250 which uses a Qualcomm
> Gen 2 version 1.2.1 CSI-2 PHY.
> 
> The PHY can be configured as two phase or three phase in C-PHY or D-PHY
> mode. This configuration supports three-phase C-PHY mode.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 112 ++++++++++++++++++++-
>   1 file changed, 111 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index c612192ee727a..e48f5c1290173 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -550,6 +550,113 @@ csiphy_lane_regs lane_regs_qcm2290[] = {
>   	{0x0664, 0x3f, 0x00, CSIPHY_DEFAULT_PARAMS},
>   };
>   
> +/* GEN2 1.2.1 3PH */
> +/* 3 entries: 3 lanes (C-PHY) */
> +static const struct
> +csiphy_lane_regs lane_regs_sm8250_3ph[] = {
> +	{0x0990, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0994, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0998, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0990, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0994, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0998, 0x1a, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x098c, 0xaf, 0x01, CSIPHY_DEFAULT_PARAMS},
> +	{0x015c, 0x46, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0168, 0xa0, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0104, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x010c, 0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x0108, 0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
> +	{0x0114, 0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0150, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0188, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x018c, 0x7f, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0190, 0x7f, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0118, 0x3e, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x011c, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0120, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0124, 0x7f, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0128, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x012c, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0160, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x01cc, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x01dc, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0984, 0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0988, 0x05, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0980, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x09ac, 0x35, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x09b0, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0800, 0x0e, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0884, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +
> +	{0x0a90, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0a94, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0a98, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0a90, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0a94, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0a98, 0x1a, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0a8c, 0xaf, 0x01, CSIPHY_DEFAULT_PARAMS},
> +	{0x035c, 0x46, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0368, 0xa0, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0304, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x030c, 0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x0308, 0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
> +	{0x0314, 0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0350, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0388, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x038c, 0x7f, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0390, 0x7f, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0318, 0x3e, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x031c, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0320, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0324, 0x7f, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0328, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x032c, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0360, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x03cc, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x03dc, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0a84, 0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0a88, 0x05, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0a80, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0aac, 0x35, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0ab0, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0800, 0x0e, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0884, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +
> +	{0x0b90, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0b94, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0b98, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0b90, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0b94, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0b98, 0x1a, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0b8c, 0xaf, 0x01, CSIPHY_DEFAULT_PARAMS},
> +	{0x055c, 0x46, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0568, 0xa0, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0504, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x050c, 0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x0508, 0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
> +	{0x0514, 0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0550, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0588, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x058c, 0x7f, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0590, 0x7f, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0518, 0x3e, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x051c, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0520, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0524, 0x7f, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0528, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x052c, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0560, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x05cc, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x05dc, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0b84, 0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0b88, 0x05, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0b80, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0bac, 0x35, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0bb0, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0800, 0x0e, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0884, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +};
> +
>   /* GEN2 2.1.2 2PH DPHY mode */
>   static const struct
>   csiphy_lane_regs lane_regs_sm8550[] = {
> @@ -1134,7 +1241,10 @@ static int csiphy_lanes_enable(struct csiphy_device *csiphy,
>   		break;
>   	case CAMSS_7280:
>   	case CAMSS_8250:
> -		{
> +		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
> +			regs->lane_regs = &lane_regs_sm8250_3ph[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8250_3ph);
> +		} else {
>   			regs->lane_regs = &lane_regs_sm8250[0];
>   			regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8250);
>   		}
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

