Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83F15643F7D
	for <lists+linux-media@lfdr.de>; Tue,  6 Dec 2022 10:12:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232896AbiLFJL4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Dec 2022 04:11:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233846AbiLFJLt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Dec 2022 04:11:49 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EEF61EAF2;
        Tue,  6 Dec 2022 01:11:47 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id h193so12812427pgc.10;
        Tue, 06 Dec 2022 01:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4Em5Y8OZBwtn4KypUVlGKnjpkQTWcKgB+eFzlk3v4zE=;
        b=NLihRH81YcUPJSrl07naYUHskxaynoAu71OFmEeaRN/usAeC1fgs/VuzUz6S0EE7Cn
         D6+fr/Nycxlt2/JkIPrPQvSEPoVwTPQ71OWO0kv/IZ0AxWzOJjM13R4qMYHmUHIeA5oj
         M7x6hjajDi9EaEQTFeoYnF4oXeuD2JdY0gAHh+omB6NILD8e6yKCTcO9XBpsvjJAFND8
         cbZYAcnogOwHHjxEA7MEQEsp4j+VBSHw8N5fvvUpooHaIB0cpSMq1ZAH7zC5+3XM8ajd
         13Qqbr0hBdWaJ+lMF8oKWBS+YfTS2j7S49i+1vhlfSlhJgnaybf27CbIZNK+y2nupqLa
         jHrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Em5Y8OZBwtn4KypUVlGKnjpkQTWcKgB+eFzlk3v4zE=;
        b=qoV4jrGiT//WlPVbhkewK5kvmPsUAzlzsdvwsO1FR8KYgWvhYC424KeefN8YAHsYK5
         8dbRhtLouemhnHEKXpXKwWTPeUExZooCKIR0hvwDfCFPQJZsnEsw5MqFnIRvLbK5w52w
         F7HHxgBiqYAMPiZO00aEgn+Z3Oj6IOPxsyxEOTqgZD/lLK0BEGcwkzNxOTZvFhZxPKTF
         E+uV8eRfpYHoQLAr6b1nJQ7skb280fq+irw/6vvH2Zv2q/+lDVjTUEXAa0hsYjfD8pS8
         SejW+ImWCr9mR4/XuSH44yUn5FMxYQDVmEJK6gFaV7sAro/37X3qE9EUh42h0YEmjIlB
         83eg==
X-Gm-Message-State: ANoB5pkkryMzDxny4pGO2+zd+Wadhn1Ker0VSfd6DSBWcUnvzL7YcOZ4
        24WuZDQTjDQ5UZB4wf/obQM7hs++C4A=
X-Google-Smtp-Source: AA0mqf4ctB6X7GCwPdzARYHq1W09ADefViQe0wKBtNef5PF7+6meLtzwKAzaktResROPasEKS4nZrg==
X-Received: by 2002:a63:ff20:0:b0:477:a48c:5a7f with SMTP id k32-20020a63ff20000000b00477a48c5a7fmr56939263pgi.62.1670317907028;
        Tue, 06 Dec 2022 01:11:47 -0800 (PST)
Received: from [192.168.43.80] (subs03-180-214-233-3.three.co.id. [180.214.233.3])
        by smtp.gmail.com with ESMTPSA id p9-20020a170902e74900b0018948b0082asm12203300plf.140.2022.12.06.01.11.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Dec 2022 01:11:46 -0800 (PST)
Message-ID: <4a61a875-9ad2-d4d9-ea73-939e7de09d0b@gmail.com>
Date:   Tue, 6 Dec 2022 16:11:43 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [linux-next:master 10545/12617] htmldocs:
 Documentation/output/frontend.h.rst:6: WARNING: undefined label: fec-1-3 (if
 the link has no caption the label must precede a section header)
Content-Language: en-US
To:     Akira Yokosawa <akiyks@gmail.com>
Cc:     oe-kbuild-all@lists.linux.dev,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-doc@vger.kernel.org,
        Randy Dunlap <rdunlap@infradead.org>,
        Robert Schlabbach <robert_s@gmx.net>,
        kernel test robot <lkp@intel.com>
References: <202212041959.Y2fRgy9r-lkp@intel.com>
 <97e37f71-7748-114f-ab96-7d29d81a4155@gmail.com>
 <dfbf1d59-db49-adf8-8b12-bfdaf22af9d2@gmail.com>
From:   Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <dfbf1d59-db49-adf8-8b12-bfdaf22af9d2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/5/22 15:24, Akira Yokosawa wrote:

> JFYI, fixes are queued at:
> 
>   - https://patchwork.linuxtv.org/project/linux-media/patch/20221128054303.3124-1-rdunlap@infradead.org/
>   - https://patchwork.linuxtv.org/project/linux-media/patch/2bff9dd2-e4ef-1b10-e64e-3c62849eb3b0@xs4all.nl/
> 
>         Thanks, Akira
> 

OK, thanks!

-- 
An old man doll... just what I always wanted! - Clara

