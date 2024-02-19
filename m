Return-Path: <linux-media+bounces-5432-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A12C285AA09
	for <lists+linux-media@lfdr.de>; Mon, 19 Feb 2024 18:29:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5743D2894CD
	for <lists+linux-media@lfdr.de>; Mon, 19 Feb 2024 17:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01DFA47F55;
	Mon, 19 Feb 2024 17:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OnqHlK7f"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3172045BE0
	for <linux-media@vger.kernel.org>; Mon, 19 Feb 2024 17:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708363702; cv=none; b=We4FBa1JSIMPezWSR7TLywDd4Gw+n89Yzaz0MLS4hLKktcH29w5lyxmzsiBmO+/hztVS3B/tYbheCQY9D1oDOtNV7DEf4FkBB2DkcBreW+J8Dl+75QnhcoYVroxQFVsumcXCjjh1G4QQU8qY7oAy4u1Yh5x8egn7O7w81Ba+wnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708363702; c=relaxed/simple;
	bh=haIBSBv0bm36wjlnGINjQ5Y2OxORVDr1lDOXDMKVln4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WtGgy9rIdDFD/l+bRa0k0fm609ZQR57KfEXDs+HXFNj9ex1XxZSmHCaZHNndQfj4EhAjuvb88/wJIaxW1Vgx2pkkW6/bnFQj4C/uph3Q7BiopMA4sCKARQUr3My3ZGyz+wTSia9jD1WUGf82xbIqJew1Q7C3Sik4jyP05sfkW1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OnqHlK7f; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5640fef9fa6so3566422a12.0
        for <linux-media@vger.kernel.org>; Mon, 19 Feb 2024 09:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708363697; x=1708968497; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O40RkJ6KGAUCQ0TlOqX1I10M2JzEaO50ylxKvsrIulc=;
        b=OnqHlK7fKY5xYxJmzHZ6D5f1X8DxTImSezpgJGjwceQCNFbCmDY/7uMnVmaN8igzOQ
         fC05wUAP2tc7QMy6PD0Nxck3wR7n2d6WuWaBNKqVuACCy5fDlizwYSib9BOTP7hZU1wj
         EMe3CwarTsHGqVI79+BCjiWw5Txyy3uqV08sCBweW9LU5Pr7T4j40YNCfSMuSQ6zzPor
         L+vOEKHYXxbllNMbcd/+00wxSD8R+HZcFMPVGPkLh1agTVNW6zUVCa5SByaIYO97mfAh
         xfjlhdKJ5b6rfEKAi24TEGtiSkMZnHExdGYJFIJIoHV6/4qM+2eOOIyoCO12fuNKkmaa
         74PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708363697; x=1708968497;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O40RkJ6KGAUCQ0TlOqX1I10M2JzEaO50ylxKvsrIulc=;
        b=eOAV0/WLDsUKSpJ6wYGbkPqnqnfyZjFUXJ57ynNrqKh64/yG6C4FNBCiY3ffBH9VU9
         kAwddoYpqN9/22cEm+LXfx5xbuxA+DH7NG6Kfi+IFxAgv5NDRz4FUHjL5Svl7ijl/48P
         Jv5hG7EHqM/8F/2YJIgM7zwceOWzk9K7SwKerTISvwxEBtAh+mghnc0fVZ/KTPl/+jRw
         4VtVNW3FB55ntPTbvRXrVk/oVA8i+dSRNxlHp0gKzyKGHnej2R1k/H6qRVFXfgogW9ZF
         dL+FZ8W5bjx5+LA0yPjKzK+xU4O8rz0Rh/gjmWFxnx0wA+gA8yB3GwWRYXjMy9FiolaY
         LBXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhX3ZmdSpkwdFdLGhjwcjS3jlqTo4TbdnQkjfPNJ6+U+KK0TI1YNASwq6031RP2nr3zsUPNJloymSooXCrXFTKfOIY8O3tfCg0Kic=
X-Gm-Message-State: AOJu0YzUR3jO5yJl2VH089FbAGAnZJ4b6kfhLPhka8UUkayOVa3u+X4S
	ZMkECPY1kSrYxY/S0nvAAbYs78tgfr5vQBnR1qN5B4y97YzQdZ6lIOAypfHit3GhSbWHN7MhQCy
	X
X-Google-Smtp-Source: AGHT+IF/AEzwYVIaapxMfkuJtdd6EoGYlkfrRpnQu8xtlmJn4jmYXS7kyRUG56Enp5VS2Zn5jMPPJg==
X-Received: by 2002:a05:6402:1502:b0:561:ee74:51d9 with SMTP id f2-20020a056402150200b00561ee7451d9mr10247050edw.20.1708363697573;
        Mon, 19 Feb 2024 09:28:17 -0800 (PST)
Received: from [192.168.192.135] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id 14-20020a0564021f4e00b005645961ad39sm1691295edz.47.2024.02.19.09.28.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 09:28:17 -0800 (PST)
Message-ID: <f6e68756-72a1-4c32-968d-3d6adaa153c9@linaro.org>
Date: Mon, 19 Feb 2024 18:28:14 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC WIP PATCH] venus: add qcom,no-low-power property
Content-Language: en-US
To: Marc Gonzalez <mgonzalez@freebox.fr>, DT <devicetree@vger.kernel.org>,
 linux-media <linux-media@vger.kernel.org>,
 MSM <linux-arm-msm@vger.kernel.org>
Cc: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phh@phh.me>
References: <0843621b-386b-4173-9e3c-9538cdb4641d@freebox.fr>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <0843621b-386b-4173-9e3c-9538cdb4641d@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.02.2024 18:18, Marc Gonzalez wrote:
> From: Pierre-Hugues Husson <phhusson@freebox.fr>
> 
> On our msm8998-based device, calling venus_sys_set_power_control()
> breaks playback. Since the vendor kernel never calls it, we assume
> it should not be called for this device/FW combo.
> 
> Signed-off-by: Pierre-Hugues Husson <phhusson@freebox.fr>
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---

FWIW, this is also broken on other SoCs.. 8280/8350 and 6115
to name a couple.

Konrad

