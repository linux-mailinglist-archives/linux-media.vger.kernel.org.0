Return-Path: <linux-media+bounces-63222-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HnuAYxJHWpcYgkAu9opvQ
	(envelope-from <linux-media+bounces-63222-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 10:57:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E23A61BEB3
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 10:57:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A908F305AB22
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 08:48:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABBC8349CC2;
	Mon,  1 Jun 2026 08:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pR5oT5Ik"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9F934889F
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 08:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780303709; cv=none; b=Rg3G1J61gSNWn1cwsXGMQhX+/iMfrq/isd7HemDYrCdXpPFhx/a0vdcb1w6XtAqAI/vKGA7eKh4PZgyGQkcZHrID8Ao5Lp8nFo5jAjIL5qO453a+UnzaToCrCvMbyYNsTQtCtjy/MnHoKZn+ovzSqqBrWC5rvRAncDPzPnLnL1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780303709; c=relaxed/simple;
	bh=fk629VZBGTRm9OfLwrzcQ1hhc5VKHeUR7OD/kkF1Kgw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LwlyaxdHDl2brF2Vy5DkNgQ1OV271AnwqZEfQSNZ69ms31YTWySkIeoHNtJzxaT0qIIRQfRjHjUm2ounglswpjEKySx7uw0w+q4PSr4M0rNnVqQ+PbtAcJqakQbbH87CY47VJunGdkWCwkUavS6bVwjzsjTiLpv4UqGHi75sOlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pR5oT5Ik; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45ef616daf6so2418946f8f.3
        for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 01:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780303706; x=1780908506; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e6R97isaU/cFcZ2I9WM2rO8XYaMDHSz/qiNm9k/zmx4=;
        b=pR5oT5IkeJQ4SZNBGG4/EXkm2HmFeONoBn2YSWyyVn3gTy/vfKU7B8bGUv7Wbpq6ts
         PYSFMY0EkGQK8UwXUOk7OWeSSgfP8aBLhFsBpZxDOQMappRG60cGDZE0aysqda65T6UR
         WPhlwTrDG5Qq4j6TmGH8o8xEJliTdM8YYSFOA5qLsOQ5iRJm9MWyWCIP3yM2RbaQ4i5J
         Rdv7kwUjEZEcYl58vN5v0pfP4Wbo4b4lRHZ//NzWdTZkQ25+La7zKWTUpWeafHGAPFPY
         uvbDFZG7601ba+VVAGx/U/l6bQb+/mP5IjACDF/Q2lt2i0GeYYRRH40Ksv1TBGTzIIn2
         SBIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303706; x=1780908506;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e6R97isaU/cFcZ2I9WM2rO8XYaMDHSz/qiNm9k/zmx4=;
        b=mMu8Ma0JFq6B2Am3N0+Jlsi+6/X10gbuOXx6/e2/n7RJ9hUezm78IuhPJdgEVRf8p9
         TV76m46xe+60Jij3CEO4IjBAwajXwbjrbAMgW3MIjB6qvaoHmlvdhG6m3HVKl/T1QQ/C
         aSHtRDfoEzbxLzuUk0B4lhFOjhU1jb0WDKolQNVSJ110+pKJMBjDH35b2aIEbcfKy1qn
         c2XHQ1oF89+n1FH3ZxQd/8yM2yT6QxXu5MXMZqz2H62UAMjJRUnD6JnAgV4d+ysz3ypt
         wpU3ZYNiteNNlXGx6gIXpxCKpGV3vCdwqBYOqkuH5/aqzsHUCSFOVQo6qB6NkxMs06cC
         SMUQ==
X-Gm-Message-State: AOJu0YwoucXEcVUMnQAcyaAnlOpLC18n5IwVqTxrGe2ZdcPAMuxhy6EZ
	26lPtBVGi4qFot413ZpHSYsPueSD1bUlsv9dB5JzZ3hvs4fXSRuhxK6i
X-Gm-Gg: Acq92OG3iK94W/Gr4BSkrkR16wiEV1cMhWLKuIQpoKvuCMjkdVe0CMymQ4RHJZys3zV
	nqacxmGAZt9Jtzs5iq+sBnO0ibID68X5eqtqSzuVQAJDfnoY1sxgbeZQ1ujlo2283auF1xXpBX+
	rTCPUOy2hJYckdNh5rsPoAhSsTJUSgNwJRxe3Uin+gYk5M3G0KHVrV8mlnXEz0Yta0hP8frbSOq
	RwWVZ341OkGCzvvejXuu9lUP7HQvvq2qeBwcwC7wkZGvxE8Z4F3j6FDYAECzMQwT8RXvHi4DRD9
	alZrrmRbc7yZfmJWMG+H83dqM8ka/kT7tagnqahX/3c1CPEqrCY+EBqXjX7Yq097l+dDqYXdqd7
	l94BFMd5XFswyxu41t8qqAxExDsjLx/0dYThSLSIpvoDDYkC8faL2a5ZMZCfeYjCIvNDHk5riKp
	FhgQn934dV5TvtNLX8U7Q6kWp1WmFvBqvn9Ri0A9zu6G+fjTuuloA1aq0F7CQMpo28Rlvtqkt1Z
	otPU0ZYCA==
X-Received: by 2002:a5d:49c2:0:b0:455:7d77:1d25 with SMTP id ffacd0b85a97d-45ef6b75cf8mr13497273f8f.27.1780303705968;
        Mon, 01 Jun 2026 01:48:25 -0700 (PDT)
Received: from ?IPV6:2a00:f502:260:28a1:17cc:dada:92e7:2b6a? ([2a00:f502:260:28a1:17cc:dada:92e7:2b6a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34a0374sm21522883f8f.2.2026.06.01.01.48.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 01:48:25 -0700 (PDT)
Message-ID: <22f344ff-acc4-47f8-935b-d1c3be7073ee@gmail.com>
Date: Mon, 1 Jun 2026 11:48:23 +0300
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
 <4JzpVyRt008YHZIv34VGG-Z_etL_fh9cE8AL30d-uekLUAxGmZNV9os6xkESzPAyzDHFHA9XXyPgWxzBlEfnhQ==@protonmail.internalid>
 <d8177e27-7cd6-43f2-b88b-2dbce936421b@gmail.com>
 <82f7a200-ab07-4ff4-b84e-305351f78460@kernel.org>
 <4ab6aa28-6b0b-436f-95d3-23b54d73a992@oss.qualcomm.com>
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <4ab6aa28-6b0b-436f-95d3-23b54d73a992@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63222-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 0E23A61BEB3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 6/1/26 11:29 AM, Taniya Das wrote:
> 
> 
> On 5/26/2026 4:20 AM, Bryan O'Donoghue wrote:
>> On 25/05/2026 10:56, Erikas Bitovtas wrote:
>>> +    for (; i < res->vcodec_pmdomains_num; i++) {
>>> +        pd_dev = core->pmdomains->pd_devs[i];
>>> +        ret = pm_runtime_resume_and_get(pd_dev);
>>> +        if (ret)
>>> +            goto err;
>>> +
>>> +        ret = dev_pm_genpd_set_hwmode(pd_dev, true);
>>> +        if (ret && ret != -EOPNOTSUPP) {
>>> +            pm_runtime_put_sync(pd_dev);
>>> +            goto err;
>>> +        }
>>> +    }
>>
>> In Iris we do
>>
>> - enable_power_domains
>> - enable_clocks
>> - set hwmode
>>
> 
> This sequence will always ensure clock can be polled as the GDSC is
> still in SW mode.
> 
> 
>> Instead of
>>
>> - enable_power_domains
>> - set hwmode
>> - enable clocks
>>
> 
> This sequence will require the clock to have SKIP or DELAY as the GDSC
> is moved to HW mode and it is not guaranteed to match the SW expectation.
> 
> 
Thank you for the explanation. I fixed the sequence in v9 - clocks are
now enabled before switching to HW mode, not after.

