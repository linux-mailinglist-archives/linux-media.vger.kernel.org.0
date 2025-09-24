Return-Path: <linux-media+bounces-43056-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F2299B99A28
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 13:46:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B4393AA6ED
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 11:46:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BDF82FE57B;
	Wed, 24 Sep 2025 11:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AqF+jkGO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB576275B05
	for <linux-media@vger.kernel.org>; Wed, 24 Sep 2025 11:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758714360; cv=none; b=QwGfOVjxaDnMgQiFt5JOXf8pZb3lCZqisl6WoKxOG6C3HkhyiXuCzBMt7mS4MKez4Inh2hRvlamcfkd7oS7Se2Jpy7ym0hZ8a0ON8Ir8MDLdAs+89hBFlfrk03LEi3rgUFPHEFkH7LEttIsnJINlhQuga9Z9L8dC39EwK21zo94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758714360; c=relaxed/simple;
	bh=zR6LihabC3Wv4it5LXFyiUGVmwdADRolNxlM/tQNwaE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=O8pWhFnh1xIZIoK26Kcub5H2YY1Tp+w+dx8TJ+0IV7LkmfBgsViWfpqwq2LY8jr9xMLJtLqF3cIjnconSPEr+f/HfDMvGfYlbkqoGZ4q8EDc2fJ4Uh+7g5WYnGRncHosNsx8Wq6cTPFWphBx67iLw5Uhn0lmvN9mgOe/1zMrSAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AqF+jkGO; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3ecdf2b1751so4021176f8f.0
        for <linux-media@vger.kernel.org>; Wed, 24 Sep 2025 04:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758714353; x=1759319153; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lbk9b3MeKRBMbNYzRhvPF+/IGzwkiV2gyIypSXzMBrc=;
        b=AqF+jkGOYVYH8J3Qdn1a9KyGc/1Wre4lusUsgU5bo0k20qayChXLyysHwSn1J4LgA8
         lgQaXttrqOA64kzC7umXCVVEsWoqHBrG8mBeJKTkD3e7fPN8I0eSvM74IkEVtFfzWCTD
         kyMI8Wa34S1kq6QAUkGPaS186vfFFyAlyV+37x5gZ0gxbB+s0TkgQliEYS6E3eKDPDMf
         +DaCHuAJWFiHbwFgE7dtWQpyT4I3+TMfah5/osrqu7cdNhl1tYd2P5fa4ulNLLtjyjRa
         NaJ9hzTXeA2XFqTTu742MpwVgVMCHMSce/uEKMhOC2+UJll2P9JsgxC3zXWW8GQ+NuA7
         CGsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758714353; x=1759319153;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lbk9b3MeKRBMbNYzRhvPF+/IGzwkiV2gyIypSXzMBrc=;
        b=TE/ZfKa57/xYUSTNOlBgCYXnfNuewRXW1UBCNZoclEQyjjhZAMblWr3kB8k5McTQkx
         R4HFxI+U/mCOhjc+OSwon4cdYpRa4yaCLSoZ4bh9lkFCvmTnWBb6edJ7SWYy2r1lW+wh
         RS5BfhB2Ke8fviRXqBM5ysGZAR4wAb/dB3qRVbhXP7NXOxm1Pwy9HpJTp4rAsBxPr9Rv
         Hrn4tocQHv6u27X1t8qiPNI0hgb85gtesc0/2dm5wgybV04Z00bn11zRNtQHRmKDcuuW
         fmTJLtfmdV/1vHb0N1F55MSP2V1PMrScRfJskWRU6OBPM2706b+E9VcmZUsoDvlL9Wj9
         l3BA==
X-Forwarded-Encrypted: i=1; AJvYcCUnIbe1eW1R/gp49QtA04oyHP0eBdBHe+ZYm5a0Ed44gmTI+lLTGr+OEjWTExxv3bic34thEfjxaP1nng==@vger.kernel.org
X-Gm-Message-State: AOJu0YxerI5I8Rnhm4HHCImsMOBA552yFqbC2yB0kvj/BUbUaLi6qsqF
	mfMy0uyH/2Tgb2MUZdYRLI/hdT/T7eicZmQNhfWx8AJFg3jWlOoqzzaJsCyiv5L8yaU=
X-Gm-Gg: ASbGncsdhgE41iTTmboh5kMXdf+fynb/HzGFh05UBKydj6xK+6eq2NDeOsXGZdHp3NO
	ma6syDKEFP30BvFB6Oz1S+zLyPchVzVStqeJhm6i7KVVX5s0VMPHOoJU1VUlURTpiyDqdMCQtrm
	9g6Mde1p2P1Cirb+18P+wbPJLA4F+8OktwluWo1eLH29l3Jyc5dKLeQ6zGdpC3rdLXEsZjQ1jd+
	rOQhQYLQrb4c+XsSAMzyX9vR6qxoOcIdF8rfUxR06tSShEcrBG/LC4Wosdn05MF1aJRQ5ET/JEB
	QvclamqHyqk90SURCcHFp5rwQDiLvJtKW4EJYoD1dilcrIWsyxHBKgdgSIci+/4qIGfcZ/zeCZZ
	hy/vBJAGBwczIbomT+DtsrKuKrhaZqX8ezyToeMFGgzwDPS+8tHXhfhahf+Tt8sURVNLByoZvfR
	KzQeOc9zS4oPh6KkEsnlgnPhpgqPRhapQ=
X-Google-Smtp-Source: AGHT+IE3cPx3TMTVsqLh+oq1e+8zS60RR7+NLPr2xnWUb6EFfbP+yRHA9xCQpEEy6EjY/7nB8HKqzg==
X-Received: by 2002:a05:6000:2907:b0:3e7:4719:a024 with SMTP id ffacd0b85a97d-405c46c22e8mr4221655f8f.18.1758714353098;
        Wed, 24 Sep 2025 04:45:53 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e2aad99f8sm30340245e9.17.2025.09.24.04.45.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 04:45:52 -0700 (PDT)
Message-ID: <2568439c-3d0d-4f6e-a4ee-3d1123237ce2@linaro.org>
Date: Wed, 24 Sep 2025 12:45:51 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL FOR 6.18-fixes] Please pull
 platform-qcom-fixes-for-6.18
To: Hans Verkuil <hverkuil+cisco@kernel.org>, bod@kernel.org,
 linux-media@vger.kernel.org
References: <20250924104419.7248-1-bod@kernel.org>
 <582bd5a7-fece-4cb9-b76c-73e536f78475@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <582bd5a7-fece-4cb9-b76c-73e536f78475@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/09/2025 12:22, Hans Verkuil wrote:
> On 24/09/2025 12:43, bod@kernel.org wrote:
>> From: Bryan O'Donoghue <bod@kernel.org>
>>
>> The following changes since commit 40b7a19f321e65789612ebaca966472055dab48c:
>>
>>    media: tuner: xc5000: Fix use-after-free in xc5000_release (2025-09-17 12:15:35 +0200)
>>
>> are available in the Git repository at:
>>
>>    https://gitlab.freedesktop.org/linux-media/users/bodonoghue.git tags/platform-qcom-fixes-for-6.18
>>
>> for you to fetch changes up to 22d0fa7f9507d8e20db956aab5d2eecd55084db6:
>>
>>    dt-bindings: media: camss: Add qcs8300 supplies binding (2025-09-23 00:13:39 +0100)
>>
>> ----------------------------------------------------------------
>> This tag contains three fixes for 6.18
>>
>> - An alignment issue Loic identified in -next for QCM2290
>> - A fix for Venus when OPP tables are missing
>> - A fix for the QCS8300 CAMSS binding.
>>    https://lore.kernel.org/linux-media/61b562ad-eb67-4917-a449-f5556c43ceef@linaro.org
>>    https://lore.kernel.org/linux-media/e72800d4-cb65-443b-be7e-0966a60fa5a9@linaro.org
>>
>> ----------------------------------------------------------------
>> Loic Poulain (1):
>>        media: qcom: camss: vfe: Fix BPL alignment for QCM2290
>>
>> Nihal Kumar Gupta (1):
>>        dt-bindings: media: camss: Add qcs8300 supplies binding
> 
> I am unhappy with this bindings patch: it's missing Acks from the device-tree devs,
> and the commit log is vague:

A revised version of the whole yaml with the supplies has the Ack, 
second link.

I'm not exactly sure what is the right thing to do with a file in -next 
other than rebase swapping the old commit with the new.

i.e. the whole yaml in the second link has the ACK but the yaml minus 
the supplies is already in linux-next.

> "This commit adds in the missing vdda-phy and vdda-pll supplies from
> qcs8300-camss.yaml."
> 
> Did you mean "to" instead of "from"?
> 
> Also mention why they were missing, I assume because it was simply forgotten? Shouldn't
> there be a Fixes tag?

Since its in -next only the Fixes: sha would not work, AFAIU.

> 
> Since this is also a fix for a newly introduced file (hence the lack of Acks), I think it
> is better to handle this as a post-v6.18-rc1 fix. That way the file that is fixed is
> available for the devicetree maintainers, you can add a Fixes tag and update the commit
> message.

That's fine too, so long as no DTS is applied against it until we fixup.

---
bod

