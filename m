Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 304711B8C94
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2020 07:48:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726156AbgDZFsj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Apr 2020 01:48:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725468AbgDZFsi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Apr 2020 01:48:38 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EA9EC061A0C;
        Sat, 25 Apr 2020 22:48:38 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id e25so14116491ljg.5;
        Sat, 25 Apr 2020 22:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=m7HiNqLn3J/gsFjOdcSAbHc3Y3mwvXU4rS9bPdUqyFs=;
        b=UWcZWOoWYTZwloPgnvhrPXFkv2EvrB8ok4AbuTFc10NPFW/R2DIp5ncu7vn3FzFGuF
         NCZV6xTX++uJrFVmdQ657jFAFP15iyCtqjdW6mzaI5O5Viv7jhpmk8cwCV3Axa07Umck
         mmT3Ft8yfnvN/di8BLoNNxJ8rDU37/siT+aZrwLiHb0U9KkfCC9gAjCfX8vYiDP8UL2N
         D4wcpOCZg1hsa4TQdrUx7r7W0fDzYdE0zJBzgnOMRALIFyyVS9ioLqiwP9bzigq1MHuW
         zTbWW+EuTd3x2EMpGAbYoR8Ke2bDooLkGfULNTALpc+SiePLKdxrpQjsfaD3R+quvOxv
         1Zig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=m7HiNqLn3J/gsFjOdcSAbHc3Y3mwvXU4rS9bPdUqyFs=;
        b=bFQwXlXXbDIjzQqa33G4YyAdiZxZNcypD0C0v1XNoMl3LkPuApDiH83F1+gFA99QHR
         2zYzGp49eonzNCx+nSD9ql9G48llVun70ry9omwcWMWs8FZnpb7nxRjOUuJIn2wmKf/K
         3rjrMInyzvt4LWJUhRF7zRm9Igsu5JZXKpgkKTZ4cvo9heVbArLRLV4yWspIWUFaskeB
         n+iXYpZ4LpIzK5C+uMjJ7e+533jA6nf83UaZdZgtOHEiJuVa2nwb2eRUHeodD8ugUy02
         CAbyKlz8O5VR6EqhnQdfwZdgTLd6WRWJdsYTkpx0D0JaecQW5GKCOj8PEWjKTlV2t2SU
         vd8A==
X-Gm-Message-State: AGi0PuYApccmhvqQ91y8mmQthgd9WWqCp0fmiNmHxeYqeCuVx91nPVb5
        nhn2HXvmdQ5j7h2FeLB/6WK0yZrP
X-Google-Smtp-Source: APiQypKPQ+TZrCqsMJwkrhi4u35tNs8adR9qrOHk+RNlaOJ/nfoyAjazMmKr9ulLiZDeCVKB9KCc2Q==
X-Received: by 2002:a2e:593:: with SMTP id 141mr10060776ljf.271.1587880116541;
        Sat, 25 Apr 2020 22:48:36 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id 14sm8005199lfz.8.2020.04.25.22.48.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Apr 2020 22:48:35 -0700 (PDT)
Subject: Re: [RFC PATCH v10 6/9] media: tegra: Add Tegra210 Video input driver
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, frankc@nvidia.com, sakari.ailus@iki.fi,
        helen.koike@collabora.com
Cc:     sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1587700513-28449-1-git-send-email-skomatineni@nvidia.com>
 <1587700513-28449-7-git-send-email-skomatineni@nvidia.com>
 <6ca93ff9-ca59-544f-767c-4355d01a5c20@gmail.com>
 <62546d1f-eca5-06be-2bc2-e45ccd53830a@xs4all.nl>
 <50fd1016-ca8b-ec5d-e5a8-f257138b152e@gmail.com>
 <658c4232-94d9-3051-8c93-bff7046cf5f2@nvidia.com>
 <03426915-25ea-69b4-bc64-f87f3046d33f@nvidia.com>
 <aabaecc4-3494-0137-7d2b-853304bfa68b@gmail.com>
 <09f20441-fec6-7496-2edc-c69db535e441@nvidia.com>
 <61799fab-858c-8b0d-ba7d-846cd041e044@gmail.com>
 <99a5c82a-bd84-5c80-e6d7-7b6f2858aa78@gmail.com>
 <8c4f5e88-b47a-6b5c-b579-1b28be19feb5@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <01949632-c7e9-2b44-2c52-2d40e1632347@gmail.com>
Date:   Sun, 26 Apr 2020 08:48:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <8c4f5e88-b47a-6b5c-b579-1b28be19feb5@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

26.04.2020 07:23, Sowjanya Komatineni пишет:
> 
> On 4/25/20 7:19 PM, Dmitry Osipenko wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> 26.04.2020 05:10, Dmitry Osipenko пишет:
>> ...
>>>> currently other Tegra host1x driver (drm) also does similar. Single
>>>> module for all Tegra SoCs.
>>> DRM driver has a proper separation of the sub-drivers where sub-driver
>>> won't load on unsupported hardware. The tegra-video driver should do the
>>> same, i.e. VI and CSI should be individual drivers (and not OPS). There
>>> could be a some common core, but for now it's not obvious to me what
>>> that core should be, maybe just the video.c.
>> Maybe video.c csi.c vi.c could be moved into a separate module, somewhat
>> like a common driver framework. Then the individual CSI/VI drivers will
>> use those common helpers.. Just a quick thought.
> 
> structure of driver is based on prior feedback.
> 
> How about instead of re-structuring whole driver again, probably we can
> use conditional compatibles and also corresponding tegra210.o in
> Makefile based on ARCH_TEGRA?
> 
> #if defined(CONFIG_ARCH_TEGRA_210_SOC)
>     { .compatible = "nvidia,tegra210-vi", .data = &tegra210_vi_soc },
> #endif

Yes, allowing user to disable the unneeded code should be good.
