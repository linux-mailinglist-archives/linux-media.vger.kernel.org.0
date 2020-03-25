Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A245193149
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 20:43:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727541AbgCYTn2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 15:43:28 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:37619 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727236AbgCYTn2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 15:43:28 -0400
Received: by mail-lj1-f194.google.com with SMTP id r24so3885930ljd.4;
        Wed, 25 Mar 2020 12:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=iOneQkgu81OkUpAJwJMMMqvZuhai2Fs8dCS/2N+5OpE=;
        b=sE7Ldf+g5xXUlgrOhgxrUtrz3LrZaBVWTDibYdk5kTO6NfTwat88fMUaLVcScOBqkN
         QUBGdAxU+nRzHoajnAzWCSWNahA1XyJijsxPVgEAuYJZGa+XhR/q7gQIgeS6v++LEDAW
         25uoPaOvtsppD1Q6hM5gtNIRC3nQZ1ergaTjUty3JpfgfKpLQR6ZTkt148Va7wRIbkwS
         QwybV7EuqDmQr74jORTcxNJOgpe6EZSAEh1YwGseMhtBjZQxrcKrX3u2di2HChYKcHSH
         0wd2jWvrhCAUOH+6snkZaF2s/1iJ+zkQkQ1xhGV6Up4HD1/5U1QjjpHd/9FpyFU24umt
         E7eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iOneQkgu81OkUpAJwJMMMqvZuhai2Fs8dCS/2N+5OpE=;
        b=jYQCOIwV5hYi+jl0dpgc5h8hZZL+BapJqyIFxX9f/JHUjMEajetXRhgPFYuLRCOCkc
         mUh2K7MZwQ3HgFf01lJNyYjZLIjLPVvVSgdHBp/STS8sVRVeH09xAYg60xUH7kUdqwwx
         u0wEXQWDiMHBTMYfhZ8UdoYlM3kLuh2jtBvMFRsLYsOjbqN8n/O1hUAwONMJ/yyBdr5D
         DXj3kKLniTuTj9e9aSquF9vM7xIq7+1Og8vZ7jASszGPcUMuAQ9O6nX/SIxJCMfMV4NK
         Y7DNfxW6jlRtXD+i/g+dysnJqvzWxHuWl/9ep+cgxp6yvGi8xiiQDFs5TwVAm71Syj2A
         yr4A==
X-Gm-Message-State: AGi0PuZeaIM/tFGP7QD/YCBSfonjaKP+SI6MHK24e6XocWVFamOVqs6A
        O+GZgnFcK4C2pTRseraepeD7l1tcgYU=
X-Google-Smtp-Source: APiQypJOX/JZ7gyO+5CYBBAesaASBAWWtv+2hbVcKVQZAj1tIg89BvEqhaznZLQjU4PKjLNyuCnS3g==
X-Received: by 2002:a2e:87c5:: with SMTP id v5mr2964473ljj.166.1585165404437;
        Wed, 25 Mar 2020 12:43:24 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id e1sm97237ljo.16.2020.03.25.12.43.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2020 12:43:23 -0700 (PDT)
Subject: Re: [RFC PATCH v5 6/9] media: tegra: Add Tegra210 Video input driver
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, helen.koike@collabora.com
Cc:     sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1584985955-19101-1-git-send-email-skomatineni@nvidia.com>
 <1584985955-19101-7-git-send-email-skomatineni@nvidia.com>
 <8f44e42d-2008-fe53-f4fb-b57502da91a8@gmail.com>
 <5695fc27-6839-dda3-9d06-77ef36ecfd43@nvidia.com>
 <f59eb7fa-5b26-60e4-771f-f6f9ecfa0b5f@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <265b13e7-633f-5fa4-8df9-e461bf7e386a@gmail.com>
Date:   Wed, 25 Mar 2020 22:43:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <f59eb7fa-5b26-60e4-771f-f6f9ecfa0b5f@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

25.03.2020 04:15, Sowjanya Komatineni пишет:
> 
> On 3/24/20 6:08 PM, Sowjanya Komatineni wrote:
>>
>> On 3/24/20 5:34 PM, Dmitry Osipenko wrote:
>>> External email: Use caution opening links or attachments
>>>
>>>
>>> 23.03.2020 20:52, Sowjanya Komatineni пишет:
>>>> +static void tegra_channel_vi_soft_reset(struct tegra_vi_channel *chan)
>>>> +{
>>>> +     /* disable clock gating to enable continuous clock */
>>>> +     tegra_vi_write(chan, TEGRA_VI_CFG_CG_CTRL, 0);
>>>> +     /*
>>>> +      * Soft reset memory client interface, pixel format logic, sensor
>>>> +      * control logic, and a shadow copy logic to bring VI to clean
>>>> state.
>>>> +      */
>>>> +     vi_csi_write(chan, TEGRA_VI_CSI_SW_RESET, 0xf);
>>>> +     usleep_range(100, 200);
>>>> +     vi_csi_write(chan, TEGRA_VI_CSI_SW_RESET, 0x0);
>>> Is it safe to reset MCCIF without blocking and flushing memory requests
>>> at first?
>> Yes to bring VI to clean state on errors its recommended by HW design
>> team.
> BTW, just to be clear this is Software reset.

Ok
