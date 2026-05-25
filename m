Return-Path: <linux-media+bounces-62714-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wG8NJ/McFGoGJwcAu9opvQ
	(envelope-from <linux-media+bounces-62714-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 11:57:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 086615C8D8C
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 11:57:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C84C230138A1
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 09:57:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11CEC3E834C;
	Mon, 25 May 2026 09:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AfEffcXO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003D43955C8
	for <linux-media@vger.kernel.org>; Mon, 25 May 2026 09:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779703024; cv=none; b=g7i28EU7ai1Q3hteAfaVA04pznmH5QqYFIpg3S1lgEEkAHXejisG4vNAFhy4Fo+4RVr5mwFHTUQ78fNA9UQK9DLEWq1tIO4dVuC/3SJ6qyzbjbU1yRX+YSjyz6CtxR+u96EFZclwZRXahixzCMIHGPjL13uZNlcjyU9y1N6T4sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779703024; c=relaxed/simple;
	bh=MgR93XTU1mq8y2aZ9hWPpI2kctBBCnxVq1k/OqiBpNw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u9xWRIw/oyT/GyKddIl4MIdNEG73U/6RDmlEZ3tZ/3reex6NWvF7VLT6N60yz6fDQ81ypx4dJhxZqvj9k0KIfKnOOC+a55x89VZbMotUCxwxt5YYwEn0OXA+q6tw5nOWWCGXY3bkwahnb9gSjQoLXW4fU8T6KmfnSA7HhsTvmaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AfEffcXO; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43d76dd4ee8so5258912f8f.2
        for <linux-media@vger.kernel.org>; Mon, 25 May 2026 02:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779703021; x=1780307821; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cez/cnYMxxZmQ2yyzCf16xYcrSK3/MCZDkpw9VeqbqI=;
        b=AfEffcXOY2pm+1R4AaZVi6AyUialZbr9D9JNBm1ZI1818u4mp2QkdyjEXCD0R1OgGb
         XF1rPqTYzpDMo7zfOZLssRUwXCLagyGXGELHg+c3m0NW6CnTfEzVEzjd8XLD/c7zC9Vd
         89hmTEK69JJR7Bk5J0xGSBceyw5TUUMHOYBRgjZBvgNGK2WMwEIJ7Rf+FB5GurRPXyht
         jYAdlve99fu1Y0b2tOfpwRQ+YdBAyc+ZRphJfoHYE6qOUaC/xt7tE+mR0wrBgWjiOk22
         tigmVygaV1VMAsdnEONqwa791+ncG+dnwj/Px+kSy/XRvs4p+pW4vZ2Ksn86BCIwfAWU
         sL+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779703021; x=1780307821;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cez/cnYMxxZmQ2yyzCf16xYcrSK3/MCZDkpw9VeqbqI=;
        b=e1Bc6aGzl1CD4H9+uTDr7lVAh9OHM60PrWfyGcKieOWHlCdHCu4jsX7pNcyUVBXkKA
         35Bjl7nqBMUU5/BiCq01IIIOWKtTDN7rv275n7ym14zpqo6HPGQxzD/Wz94sjx4fw3lq
         H+r6T+ojLGrQraO3XWHvzH6OP+PUXVBcjH0KwhWI7dRM177B6Y9Cq61tlSAXz8XRNJBY
         UObjtHLJS4aB+acLX2XhPPov4xxDxaKMARR47mp4Jfbz8PIEuiCgj4nSbpulaR9FRVp3
         RFxH4RuLRws8QMbyA099R2fLVCVHHrLzpu8d5tp0AohuMYqXr8K2l9nx9XLAAo01EuvA
         UDiA==
X-Gm-Message-State: AOJu0YyMmBywwIgC+QpksY13U+wjXnmlFj4weWS3ayHyWLArk/v/1RLY
	av3Q3Utrlhv1q8Y3D3pwWvo5ad/qX6DKKFmh6+FqbtC+QIIo3VHiefF2
X-Gm-Gg: Acq92OE3DHeQaSxABMBAhDKuAuEJXIpoWb9TE9i9u6Zj4dFGzhV2g38Gdnz2YrFhvFB
	wkXNgY5gXzsxJILUBfrAYzZk6huNcr24OebMFvAKDvKzzc+t1A6hn9VjuLmEwYwG0NQs8fwEwqn
	Z7epX/QrHYaCvTij7inIdoeHvu1rfvc2HynVTooJ8g0RA5S4ca7kzPLGF76qPQmHB5hKBTgtrd0
	f7Y3mrVfYyfnbMYLfqN0RdYArboUOL32xMT+DPMVhpgK4AyYDt13UjzluMpHr9J7o0bGp1p23EI
	to7WCtJpxIpMcjHUvg6r4kLkcxZoiyma7cRVaAWB/J08sMY2Fy6JuPiN4fdOrUVYBFptnYMvjMh
	IRkN5Y/wuD9nlLb7XYPk86YTf8he5LeyK0mcmBZO9ivqACtBKsZiITWGSMwFXwvumYusk2nznnN
	20TZfyb6yRS2cu5zxP6F2PkunZV87lDNOgtmNpPWDfmtmq5uyuu3xQ6SxzI6bu5M5gdm7YZws=
X-Received: by 2002:a05:6000:401e:b0:44a:247e:67b1 with SMTP id ffacd0b85a97d-45eb36920e5mr23940884f8f.5.1779703021283;
        Mon, 25 May 2026 02:57:01 -0700 (PDT)
Received: from ?IPV6:2a00:f502:160:5a27:4d10:c059:34aa:a542? ([2a00:f502:160:5a27:4d10:c059:34aa:a542])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6cd151asm25354818f8f.13.2026.05.25.02.56.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 02:57:00 -0700 (PDT)
Message-ID: <d8177e27-7cd6-43f2-b88b-2dbce936421b@gmail.com>
Date: Mon, 25 May 2026 12:56:58 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/9] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
To: Taniya Das <taniya.das@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
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
References: <20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com>
 <e7WD-tbtAA7Bx0uDnXgPHto9hACWxgblhI2eitNHX4VYEgxOOceuY0sOS6KQnGiyTaDYaKudZt4k50z_vJVpnw==@protonmail.internalid>
 <20260519-msm8939-venus-rfc-v8-2-542ec7557ebc@gmail.com>
 <608dc53d-17a8-4230-9ebb-48a94bf03675@kernel.org>
 <6ae3a89c-f205-45c5-87c0-5550f78502d6@oss.qualcomm.com>
 <01f9a303-846a-4048-8115-c94b9b78078a@gmail.com>
 <ecaa113a-02d7-48b6-a94e-9299a684b0be@oss.qualcomm.com>
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <ecaa113a-02d7-48b6-a94e-9299a684b0be@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62714-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 086615C8D8C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/25/26 8:51 AM, Taniya Das wrote:
> 
> 
> On 5/22/2026 4:18 PM, Erikas Bitovtas wrote:
>>>>>   static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
>>>>>       .halt_reg = 0x4c02c,
>>>>> +    .halt_check = BRANCH_HALT_SKIP,
>>> please use .halt_check = BRANCH_HALT
>>>
>> If I do that, the clock fails to power on on boot.
>> [   20.324488] ------------[ cut here ]------------
>> [   20.324520] gcc_venus0_core0_vcodec0_clk status stuck at 'off'
>> [   20.324663] WARNING: drivers/clk/qcom/clk-branch.c:88 at
> 
> 
> I am hoping the Venus driver has enabled the GDSC before requesting the
> clock enable.
> 
It does. From 3/9:
+static int vcodec_domains_enable(struct venus_core *core)
+{
+	const struct venus_resources *res = core->res;
+	struct device *pd_dev;
+	int i = 0, ret;
+
+	if (!res->vcodec_pmdomains)
+		return 0;
+
+	for (; i < res->vcodec_pmdomains_num; i++) {
+		pd_dev = core->pmdomains->pd_devs[i];
+		ret = pm_runtime_resume_and_get(pd_dev);
+		if (ret)
+			goto err;
+
+		ret = dev_pm_genpd_set_hwmode(pd_dev, true);
+		if (ret && ret != -EOPNOTSUPP) {
+			pm_runtime_put_sync(pd_dev);
+			goto err;
+		}
+	}

 static void core_put_v1(struct venus_core *core)
@@ -320,11 +410,35 @@ static int core_power_v1(struct venus_core *core,
int on)
 {
 	int ret = 0;

-	if (on == POWER_ON)
+	if (on == POWER_ON) {
+		ret = vcodec_domains_enable(core);
+		if (ret)
+			return ret;
+
 		ret = core_clks_enable(core);
-	else
+		if (ret)
+			goto fail_pmdomains;
+
+		if (!core->res->vcodec_pmdomains)
+			return 0;
+
+		ret = vcodec_clks_enable(core, core->vcodec_clks);
+		if (ret)
+			goto fail_core_clks;
+

