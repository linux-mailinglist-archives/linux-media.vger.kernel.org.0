Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0409642483
	for <lists+linux-media@lfdr.de>; Mon,  5 Dec 2022 09:25:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231950AbiLEIZH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Dec 2022 03:25:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231824AbiLEIZC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Dec 2022 03:25:02 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD0861659C;
        Mon,  5 Dec 2022 00:24:58 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id t18so297365pfq.13;
        Mon, 05 Dec 2022 00:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8EI2mS0xOxJf/SHT4ujL43EawkVG3OnGp5jpRAvgBTA=;
        b=emU0LXKfIP1KZ6jPmOAQhxUr3RUHBrb3hijcriGrHgER0leg0Axyv1ONvRgur/fjuj
         Mfgvnx+fmqnWx8/EsVQOy4d6hC0KrcDX/ADCe1r3q9hDRP9Nt0ZhOmW9WSIkytrAIukc
         qxtBOGx5PJs1JJv9jhIMIcD2wJ7SCDdI5Corb/M5SShO7jGRdzIlOkCrmhXSiBJg9csd
         bJGHbHN88sypAUVDbxV6Z9OFDX2u+o+oFZgIw3Z/9neppYqQ8vQxqc//6xJuRbAciug0
         /3FAG10rH0zCCMqooIORlQNmvhI718InoRcoOEP8D1hIss7iMbt3zfh7CrYUjd5QL9sv
         S6ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8EI2mS0xOxJf/SHT4ujL43EawkVG3OnGp5jpRAvgBTA=;
        b=8EjJNbi3m1kViTXTOdWQB2AT21AOvDQ+/VdzentIcTfdCw+5WgTOyiEQY46o1iHZwq
         ktwYV5A2Tltxw2TRXGAf6/PhERJivOI70rEcnAL8hJFEQdrUPJPXbEYEStDieoh5mKyD
         upENIFdXrE2lvd2+lmdfRmWHpKGhKbKp4z9GYufYgScT80SUPknRZ8T0qy7QP/+0rEOp
         rQBsvn/VaTtmN0wjzwpPSSclOFxspxweTUfdy+G239eMZWeV2jhrNyBA7mIbRcx0Oa3f
         J7oiC06If0E8AMRFMR2UlQMX+kO/1393ZcMvg2WLFVEE9VKn/kXpOFqiWNcocgeDgH4T
         vI0Q==
X-Gm-Message-State: ANoB5pli1cAZldFnGkHZfz7ZPuTfmk5LAKLrLnZR6NFmAX2RPpkSQaVk
        NhI1pJ+vuBFrtJLk7tPo3s4=
X-Google-Smtp-Source: AA0mqf73STsxXRSUlSxSR4107jRIGDmSeEq3RGvj7lV7uLENrU+1UlDGui6JBzknLvdg6Gw8yjj+rQ==
X-Received: by 2002:a63:e346:0:b0:478:ac36:8183 with SMTP id o6-20020a63e346000000b00478ac368183mr6036806pgj.153.1670228698242;
        Mon, 05 Dec 2022 00:24:58 -0800 (PST)
Received: from [192.168.11.9] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id h26-20020a63575a000000b0046b2ebb0a52sm7647279pgm.17.2022.12.05.00.24.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 00:24:57 -0800 (PST)
Message-ID: <dfbf1d59-db49-adf8-8b12-bfdaf22af9d2@gmail.com>
Date:   Mon, 5 Dec 2022 17:24:52 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [linux-next:master 10545/12617] htmldocs:
 Documentation/output/frontend.h.rst:6: WARNING: undefined label: fec-1-3 (if
 the link has no caption the label must precede a section header)
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     oe-kbuild-all@lists.linux.dev,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-doc@vger.kernel.org,
        Randy Dunlap <rdunlap@infradead.org>,
        Robert Schlabbach <robert_s@gmx.net>,
        kernel test robot <lkp@intel.com>
References: <202212041959.Y2fRgy9r-lkp@intel.com>
 <97e37f71-7748-114f-ab96-7d29d81a4155@gmail.com>
Content-Language: en-US
From:   Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <97e37f71-7748-114f-ab96-7d29d81a4155@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

[-CC: linux-mm]

On Mon, 5 Dec 2022 11:18:20 +0700, Bagas Sanjaya wrote:
> On 12/4/22 18:52, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>> head:   5be860bfc73408bc1a8af9167955e480ecebba84
>> commit: 6508a50fe84f9858e8b59b53dce3847aaeeab744 [10545/12617] media: dvb: add DVB-C2 and DVB-S2X parameter values
>> reproduce:
>>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=6508a50fe84f9858e8b59b53dce3847aaeeab744
>>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>>         git fetch --no-tags linux-next master
>>         git checkout 6508a50fe84f9858e8b59b53dce3847aaeeab744
>>         make menuconfig
>>         # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
>>         make htmldocs
>>
>> If you fix the issue, kindly add following tag where applicable
>> | Reported-by: kernel test robot <lkp@intel.com>
>>
>> All warnings (new ones prefixed by >>):
>>
>>>> Documentation/output/frontend.h.rst:6: WARNING: undefined label: fec-1-3 (if the link has no caption the label must precede a section header)
>>>> Documentation/output/frontend.h.rst:6: WARNING: undefined label: apsk-8-l (if the link has no caption the label must precede a section header)
>>>> Documentation/output/frontend.h.rst:6: WARNING: undefined label: apsk-64 (if the link has no caption the label must precede a section header)
>>>> Documentation/output/frontend.h.rst:6: WARNING: undefined label: qam-1024 (if the link has no caption the label must precede a section header)
>>>> Documentation/output/frontend.h.rst:6: WARNING: undefined label: guard-interval-1-64 (if the link has no caption the label must precede a section header)
>>>> Documentation/output/frontend.h.rst:6: WARNING: undefined label: rolloff-15 (if the link has no caption the label must precede a section header)
>>>> Documentation/output/frontend.h.rst:6: WARNING: undefined label: sys-dvbc2 (if the link has no caption the label must precede a section header)
>>
>> vim +6 Documentation/output/frontend.h.rst
>>
> 
> My htmldocs build doesn't catch these warnings above, yet it says there
> are 62 warnings...
> 
> Looking at the resulting frontend.h.rst, I didn't see any of these new
> labels.
> 
> Cc'ing Akira and Randy to help sorting out.

JFYI, fixes are queued at:

  - https://patchwork.linuxtv.org/project/linux-media/patch/20221128054303.3124-1-rdunlap@infradead.org/
  - https://patchwork.linuxtv.org/project/linux-media/patch/2bff9dd2-e4ef-1b10-e64e-3c62849eb3b0@xs4all.nl/

        Thanks, Akira

> 
> Thanks anyway.
> 
