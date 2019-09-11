Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12D5FAFF7D
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2019 17:04:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728313AbfIKPEG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Sep 2019 11:04:06 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:40478 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbfIKPEF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Sep 2019 11:04:05 -0400
Received: by mail-lf1-f65.google.com with SMTP id w18so4822841lfk.7
        for <linux-media@vger.kernel.org>; Wed, 11 Sep 2019 08:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=R3hjZvaM+DqfBI7ToXGlkxrMEzECE/guKaOqtkVBGo4=;
        b=J5D1A4EXLYqMBtdzZQP5PE8Tx++pQmjNIvUpXvcFy4zUcbUiqLFysU+NL8hRL5JiiH
         bGgROAtQ8NF1wkbFuEX5KCKPJkJiIF1ZrYx17bwrHrLAdx6MUof8FGYajaTIpaTb2Ca5
         nZIHLMmX2g6oMkJoaXteyJBZBPcBHKX9GgfW+yILBEBtc3dPn9gwQCiA4Pc5DpLq9GI+
         Nks/aMNaV+U9T8EO1wXQ1PosVzZ5TUn83wRJs1l2qtEyU7ioytOiwgLI/GH5RhKmyOTb
         Kdj8xoG816jbENGNNT2lsajE0CWUA7RUum1pFkAJYjv0gEhcEtdOyhkjp+Jsi9RUlZ4a
         V6mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=R3hjZvaM+DqfBI7ToXGlkxrMEzECE/guKaOqtkVBGo4=;
        b=mpUYfIdiDTQabjrSjoNylNl1QhAhgmSRkaOVn8TKK3yliClxAAbmQJbZ5qabQ8vuxI
         8gAtikWLyWgaq8puD6JW4ENAtb+PmNGlOw+0j0Wl4pR12i1OKPi0vA+xdNxDihAHSkmg
         lIz8+0tK/2sGICN4hXC/ZQwOMPCBclJcdIvLKx6GHEzOdBCy0KUJ3BVfl/PeLOXfauZY
         o7FKCrUt+TEP4ThoRuPv6lsKi7mgMuTbzBItbnj8wnx44E8qrJsncHxwWKV3XUZrjVZ+
         TTlinrUvnrKHrLOqvaH1Gra0EwvWCejdXbACZP5UcU0wNZYGc/52K2fIwYZRtnPf71lX
         AFTw==
X-Gm-Message-State: APjAAAWva4grudgRrwEKinAmrrWW9gNMOOoQ/VqMBkJIIJX7Jjg9/PAe
        5Zs43zIxGQ0ezKtxykW52HJRt4/yjys=
X-Google-Smtp-Source: APXvYqz/tyfE3E/fhKItB9u7dGei2g52UKSn2Nq+SQm+EUjVXvz0TDPTzP2ODGViZBPRuv5FTprvbw==
X-Received: by 2002:a19:14f:: with SMTP id 76mr23833015lfb.92.1568214242888;
        Wed, 11 Sep 2019 08:04:02 -0700 (PDT)
Received: from [192.168.27.209] ([37.157.136.206])
        by smtp.googlemail.com with ESMTPSA id 81sm4953655lje.70.2019.09.11.08.04.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Sep 2019 08:04:01 -0700 (PDT)
Subject: Re: [PATCH] media: venus: core: Fix msm8996 frequency table
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     agross@kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-media@vger.kernel.org
References: <1567591618-22467-1-git-send-email-loic.poulain@linaro.org>
 <92275cdb-870e-8cfe-0b7d-1b35f1a2ff5a@linaro.org>
 <CAMZdPi82ZCJK1QOXHo7hq9iCOq5vzuJF1shq=4ut+zRJ5FfmMw@mail.gmail.com>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <689fba99-a631-8e7e-8d75-d84390f45122@linaro.org>
Date:   Wed, 11 Sep 2019 18:03:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMZdPi82ZCJK1QOXHo7hq9iCOq5vzuJF1shq=4ut+zRJ5FfmMw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 9/11/19 5:40 PM, Loic Poulain wrote:
> On Wed, 11 Sep 2019 at 11:29, Stanimir Varbanov <
> stanimir.varbanov@linaro.org> wrote:
> 
>> Hi Loic,
>>
>> Thanks for the patch!
>>
>> On 9/4/19 1:06 PM, Loic Poulain wrote:
>>> In downstream driver, there are two frequency tables defined,
>>> one for the encoder and one for the decoder:
>>>
>>> /* Encoders /
>>> <972000 490000000 0x55555555>, / 4k UHD @ 30 /
>>> <489600 320000000 0x55555555>, / 1080p @ 60 /
>>> <244800 150000000 0x55555555>, / 1080p @ 30 /
>>> <108000 75000000 0x55555555>, / 720p @ 30 */
>>>
>>> /* Decoders /
>>> <1944000 490000000 0xffffffff>, / 4k UHD @ 60 /
>>> < 972000 320000000 0xffffffff>, / 4k UHD @ 30 /
>>> < 489600 150000000 0xffffffff>, / 1080p @ 60 /
>>> < 244800 75000000 0xffffffff>; / 1080p @ 30 */
>>>
>>> It shows that encoder always needs a higher clock than decoder.
>>>
>>> In current venus driver, the unified frequency table is aligned
>>> with the downstream decoder table which causes performance issues
>>> in decoding scenarios. Fix that by aligning frequency table on
>>
>> s/decoding scenarios/encoding scenarios
>>
>>> worst case (encoding).
>>
>> Did you checked the exact rate from clk_summary? Checking the frequency
>> table for subcore0|1 from mmcc-msm8996.c clock driver shows that the
>> tables are slightly different for higher rates.
>>
>> Otherwise, I'd take the patch but it would be better to align the
>> frequency tables to avoid confusions.
>>
> 
> Thanks, yes I'm going to send a V2 with aligned freqs, note however that
> with my setup (DB820C), debugfs reported clk rates seem to be a bit
> misaligned.
> I get either 75000000, 150000000, 326666666 or 490000000... regardless
> frequency table.

What kernel version is that?

-- 
regards,
Stan
