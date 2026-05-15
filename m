Return-Path: <linux-media+bounces-61649-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8G8pMNX0Bmo4pgIAu9opvQ
	(envelope-from <linux-media+bounces-61649-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 12:26:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D70754D4D1
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 12:26:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B93CA3067024
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 10:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A821843E9F9;
	Fri, 15 May 2026 10:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GARs+Lte"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A991428857
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 10:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778839413; cv=none; b=dDmOEHxQBkJTfQMA71mjkNSzdYNPqtXVyiVSTTnOBJWoUM98qXJl+6XvTEh2/ZLp+5rTRYlweuf9pEF4x6CIP1e1PUGlKjFQqdk7nn3d3oIcVaN7T1EHfZ5fwi5O0sIgvmRAx0+rDBY3hpEEVIlPQDVRGYb/FIzqJRO12oyUbho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778839413; c=relaxed/simple;
	bh=aYk715nl6+8kYbgjKWSg4YhfpDONym9S+gEFDi4xdos=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oRwwcpgVQSQZTSjBOs1m3vY20HDdynhom0RgEI6dl1BPhJVuYzyQmvPFAJ5v5j2WGjFWEt5+s8tOWaVafBBZDTMEFmXUZ/IGJIYGd1EkViU66xvcIPjM8KTn96dAfwGRT2mnhIXpehDa5ha+A3iglplV22KgrESdrzKa+fBemks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GARs+Lte; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso79484645e9.3
        for <linux-media@vger.kernel.org>; Fri, 15 May 2026 03:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778839410; x=1779444210; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QVuoueab5Xq5CfW5uFSzOMqQqitlxOrW9pFKGekv6HY=;
        b=GARs+LteYsxvIF6xRzAqywZY77hif8vaduDA0o8g4lma3UxukoYipMx29kgaPsV0+h
         c4mDYpJ4K0yYmEzan+lbmevyg/SbXB8Da9H0Q0VFOoPgPvXQzt/gLvOAaVbFtkqd1GlQ
         7sEGv3ERJJJxThVvauh9sHBIv+79KgMb1NoIB3w33fO3ZsaMtpEa6mcpi2UyawfVul27
         twaECrr2BmJKPgPq5Ewg7/UafBA3bF6H8BMKjCccyJf5KwZo3K4vy2nVeTbYc5/GmS2D
         aqn39hiEjll1lDYNWo9tWEk0mVCalBVh5ijdH/Mj8PVVWfL1UGFj7HEVZpvOOMZVJo13
         0mvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778839410; x=1779444210;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QVuoueab5Xq5CfW5uFSzOMqQqitlxOrW9pFKGekv6HY=;
        b=bRKNLrdZ58VnIqVOVywR6pSVrd6VXBV+9jJHkLebXZSNK0JBZPt++xHpBM68azQZUi
         s1Jbo4J3ODpcSrQMkj5/MbbY95OvRJRYrTYqfgTmYtUkebm35gFugM9bQw5uGd1FcJ/o
         m4E1q6JHrPSY7Z6s3LC6hm1KgBFPIl85LG1A8jKAyPuCiaGBxooJA6GNRkFSDhZq9nu1
         ln5dFV0Wxp3Lt50g2Sj1xhrHwMEoHK7mn6EQVEDcScqhltwyGL+47kK3tepV85OLitQL
         wZIIhZ+2LKO7JLYYU3t3KjZEoKPPY1F16ZOnIb7k9ao2Eg3HVsC+L9jKe0DTP9Vgp5Tu
         jWOw==
X-Gm-Message-State: AOJu0YyU17P9njQmenFkPme3Hx+hpJqMluu3KReHTf714QTIt06fkQjV
	yisfOutuzRGvEXXZBtc+AUJIgAbx0Jf1brzqjRV/Cwwkqb8UroDdEVHCy9BzjOi2UJU=
X-Gm-Gg: Acq92OFE5UpdR/GL/MT2uZVzhSSIjYD0RBu/Sw/RrBPthfAHWJkI5a46OFU4imo2kvJ
	uQnvpA+UBN0GmSkvgdSMhUN2JojW/fqplp9RhVpgkosAqVIKvoFRzbKfskeumsVRsfze+5grESb
	eXmFwCFMxEps4ofs6HCzcQfw5KA59+Kp2+oSKxk5jhxRQzP5F1EF7u6VanPMobStPKpjo1FW0Kx
	5QsXb0rX5+CPNEKMYFV94lSRBveeWU+qidR1+fBcBCnkpRt0IQWDC3LGRQ+WDkhM57VyvkIU2kJ
	6r6V4eu+Jjno8ImxMbofksMmpGy8VHSjIxi4NQH3vA1u8lmc7j8GR4B8dRxLVFzNSuq4pwCStks
	9aMCk25YPXdMDV3AtiqOwmv/9Bu0Jh+yco1A3NrNQXiDfueLpcQD8Mq23kdtw5gZdp5WnrOrc2M
	Z6JHFY251uEOfqEk81PJ7+A8iFZ87md/vvm+Jy
X-Received: by 2002:a05:600c:3e1b:b0:48a:9562:7a30 with SMTP id 5b1f17b1804b1-48fe6515f20mr40353795e9.24.1778839409890;
        Fri, 15 May 2026 03:03:29 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.168.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a1aeafsm13035426f8f.23.2026.05.15.03.03.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 03:03:28 -0700 (PDT)
Message-ID: <b762a6f2-72f6-4edf-9b39-858679ab1088@linaro.org>
Date: Fri, 15 May 2026 11:03:24 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/8] media: qcom: venus: add power domain enable logic
 for Venus cores
To: Erikas Bitovtas <xerikasxx@gmail.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
References: <20260514-msm8939-venus-rfc-v7-0-33c6c6fb9285@gmail.com>
 <KyofAf7-7fHuyrl4e6F6V0PcISdaPnC_KqyHb1MnejRrdC2Zkfj17Gz2_zcC5Z1ZnCvCWxJ0cSrHqzCzqQjxHg==@protonmail.internalid>
 <20260514-msm8939-venus-rfc-v7-6-33c6c6fb9285@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260514-msm8939-venus-rfc-v7-6-33c6c6fb9285@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 1D70754D4D1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com,kernel.org,apitzsch.eu,baylibre.com,redhat.com];
	TAGGED_FROM(0.00)[bounces-61649-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On 13/05/2026 22:24, Erikas Bitovtas wrote:
> +static int vcodec_domains_enable(struct venus_core *core)
> +{
> +	const struct venus_resources *res = core->res;
> +	struct device *pd_dev;
> +	int i = 0, ret;
> +
> +	if (!res->vcodec_pmdomains)
> +		return 0;
> +
> +	for (; i < res->vcodec_pmdomains_num; i++) {
> +		pd_dev = core->pmdomains->pd_devs[i];
> +		ret = pm_runtime_resume_and_get(pd_dev);
> +		if (ret)
> +			goto err;
> +
> +		ret = dev_pm_genpd_set_hwmode(pd_dev, true);
> +		if (ret && ret != -EOPNOTSUPP)
> +			goto err;
> +	}
> +
> +	return 0;
> +err:
> +	while (i--) {
> +		pd_dev = core->pmdomains->pd_devs[i];
> +		dev_pm_genpd_set_hwmode(pd_dev, false);
> +		pm_runtime_put_sync(pd_dev);
> +	}
\n> +	return ret;
> +}
> +

+

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

