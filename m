Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A956013C21F
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2020 13:58:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729025AbgAOM6H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jan 2020 07:58:07 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:41772 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726440AbgAOM6G (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jan 2020 07:58:06 -0500
Received: by mail-ed1-f65.google.com with SMTP id c26so15390133eds.8
        for <linux-media@vger.kernel.org>; Wed, 15 Jan 2020 04:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=F0IrgxxhrlMpoyesP99y4ED5MN7eSDPKuqKnmmmOfeo=;
        b=bFAWiJ+pTmXySYrLcicW7MkB6MhBhEUBwshS4tMwkyou1BC20ExUM7DAK7PuuSXCaj
         /ceF6SUfCqwX1EcdOv0r1sCwALoYDVm7uBhgIRerOBbzsKDPBV229hlfIimblAJ4LVES
         alo2gwAzcSgPLtE50Z/U+DnVRF4UvH3maoHHIYM/D8oxPy+UeDet79/H7O1neBAjvIxj
         gtFu6rZuL3MZz9tx9Ln7PIyxrOJxDUC8p/I10JEYINuMkOinvXJw+ijulohuFwg/qigE
         VKe7sBoROKmva4wmYNwovuvd8TLoQFMfX3VEm6AYEjneYpmAQTRCJsDcBNgcKn+7D9qI
         R1kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=F0IrgxxhrlMpoyesP99y4ED5MN7eSDPKuqKnmmmOfeo=;
        b=O1fn0vljrBiUf/0F9OG9aK657EdcMzHDJsyqydniSZA2aspngVwaPJSfZ4oMTc4mbU
         LAQdMPoQ5TNFmEt9bvZOhn9d3UePT32dbdc0LyRcgVsZromRCGT7zC0ewyDrA3ivlFHa
         5Qo7Vo0w+S+OKyM+8UZG6HnvgJP/cspjqLrm57b+QbIcTu2bQiCRUGythyKIl4a8NGeZ
         1Die2Q90I1cYCtTTZBRgk//xJy7bh9EcwVP8ZBBjfBM5W6JxdKL9lCgWPSKE9ADxdOxr
         GoSUplsI3QSyyLiCwkYsjCKfp0WH0a5KSHNTYhSyMTB1iJK1teDrz5JDphrCrp3PMgQG
         AVkQ==
X-Gm-Message-State: APjAAAWX7cZNS8vCXC/ybsRE9Ak64dxcdnj5YcVNDKPHViyhRspyX85+
        6OfFHMKQRkgM81LqeF7uXSpBMPZlIUA=
X-Google-Smtp-Source: APXvYqya91DZD5YFx1j3ydML6Pjo32mSGFf+5r0BmBq3aM2hL7ulkBidlAOjHjLqXJXTYaC38uOyvw==
X-Received: by 2002:a17:906:4e46:: with SMTP id g6mr28245019ejw.309.1579093084398;
        Wed, 15 Jan 2020 04:58:04 -0800 (PST)
Received: from [192.168.27.209] ([37.157.136.193])
        by smtp.googlemail.com with ESMTPSA id l11sm670860ejq.4.2020.01.15.04.58.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2020 04:58:03 -0800 (PST)
Subject: Re: [GIT PULL for v5.6] Venus updates
To:     Jenkins <jenkins@linuxtv.org>, mchehab+samsung@kernel.org,
        linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
References: <20200110145511.8772-1-jenkins@linuxtv.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <0e7e8329-15b4-cee6-16cd-ce0dec9e600a@linaro.org>
Date:   Wed, 15 Jan 2020 14:58:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200110145511.8772-1-jenkins@linuxtv.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On 1/10/20 4:55 PM, Jenkins wrote:
> From: builder@linuxtv.org
> 
> Pull request: https://patchwork.linuxtv.org/patch/61112/
> Build log: https://builder.linuxtv.org/job/patchwork/33062/
> Build time: 00:05:03
> Link: https://lore.kernel.org/linux-media/20200110144017.16648-1-stanimir.varbanov@linaro.org
> 
> gpg: Signature made Fri 10 Jan 2020 02:33:09 PM UTC
> gpg:                using RSA key E1558C2497CE3CCC2B5AA30F25B55FC81B7035F2
> gpg: Good signature from "Stanimir Varbanov <stanimir.varbanov@linaro.org>" [unknown]
> gpg: WARNING: This key is not certified with a trusted signature!
> gpg:          There is no indication that the signature belongs to the owner.
> Primary key fingerprint: 34CF E039 8A16 AD93 18FD  D5E8 A6D0 26D8 E358 14D4
>      Subkey fingerprint: E155 8C24 97CE 3CCC 2B5A  A30F 25B5 5FC8 1B70 35F2
> 
> Summary: 6 patches and/or PDF generation with issues, being 0 at build time
> 
> Error/warnings:
> 
> 

I'm not sure how to fix bellow warnings.

I found [1], which seems describe the issue.

[1] https://lore.kernel.org/patchwork/patch/527353/

> Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0003-venus-redesign-clocks-and-pm-domains-control.patch:
> $ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0003-venus-redesign-clocks-and-pm-domains-control.patch
> patches/0003-venus-redesign-clocks-and-pm-domains-control.patch:679: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> 
> Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0007-dt-bindings-media-venus-Convert-msm8916-to-DT-schema.patch:
> $ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0007-dt-bindings-media-venus-Convert-msm8916-to-DT-schema.patch
> patches/0007-dt-bindings-media-venus-Convert-msm8916-to-DT-schema.patch:16: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> 
> Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0008-dt-bindings-media-venus-Convert-msm8996-to-DT-schema.patch:
> $ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0008-dt-bindings-media-venus-Convert-msm8996-to-DT-schema.patch
> patches/0008-dt-bindings-media-venus-Convert-msm8996-to-DT-schema.patch:16: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> 
> Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0009-dt-bindings-media-venus-Convert-sdm845-to-DT-schema.patch:
> $ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0009-dt-bindings-media-venus-Convert-sdm845-to-DT-schema.patch
> patches/0009-dt-bindings-media-venus-Convert-sdm845-to-DT-schema.patch:16: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> 
> Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0010-dt-bindings-media-venus-Add-sdm845v2-DT-schema.patch:
> $ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0010-dt-bindings-media-venus-Add-sdm845v2-DT-schema.patch
> patches/0010-dt-bindings-media-venus-Add-sdm845v2-DT-schema.patch:16: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> 
> Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0012-dt-bindings-media-venus-delete-old-binding-document.patch:
> $ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0012-dt-bindings-media-venus-delete-old-binding-document.patch
> patches/0012-dt-bindings-media-venus-delete-old-binding-document.patch:17: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> patches/0012-dt-bindings-media-venus-delete-old-binding-document.patch:20: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.txt
> 

-- 
regards,
Stan
