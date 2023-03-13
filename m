Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCFB76B7FAD
	for <lists+linux-media@lfdr.de>; Mon, 13 Mar 2023 18:49:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230221AbjCMRtB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Mar 2023 13:49:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230131AbjCMRs6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Mar 2023 13:48:58 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2C8D7203A
        for <linux-media@vger.kernel.org>; Mon, 13 Mar 2023 10:48:56 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id k10so51888070edk.13
        for <linux-media@vger.kernel.org>; Mon, 13 Mar 2023 10:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678729735;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LaK08avXalr1PtoSNHT6ZMxzGm2NKQlXYq160RM6SJg=;
        b=dwExWLVQdmufRrRGXvEQQ1J2pk2D/Jdo2kqu0Ua5mZVPG4yiifCsywyW+2AMQkUukA
         b92ORrZwWODHjo2I5wwOYpxAR8AKHud5h/H6Vqrk8gMWQB1ltNR3axJpDwbqRUZDp4IQ
         is3++1C03Np1nMPrK4piGvjmNjsloBC3pux5NSXcc8ELrmfvWOMXXPH71gtEXIbrUAEF
         qnItvDp2niVxcjONCEXYzYH9d2GUJEdfarO4PMknYxY9d6Gh9Ej5TpjoDMOPvpfGR4Kq
         AdGfSbUtN2JtOh35w4ePqu2Dwhz52a3ABv/TxVTxAV43OjBchWT7oPumTKJwG3aEuH+q
         talw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678729735;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LaK08avXalr1PtoSNHT6ZMxzGm2NKQlXYq160RM6SJg=;
        b=AXNTcsCQblKKb4cQkonvWPCREONFagP7gu28jJLMA02h8Z8DsM04jQtxdldp/ep8Qo
         IWT+B4lOfo95YdRieQkxTPchPLWtbwzX6JttDwb7m/Oh5A6i9oYEpoInKvmCh+CdRQfx
         F0RAW6ekdg4yZlwkdwXEOAdtse/+ZceEGF1XNF/QD+a2ZEDSexrzhsmqYUE49fQu2XaH
         XatBPAJVS/UZqdLR6f+SPw50gBbLl0TShmaWfp58ad4lKKFa5CxTeg2GTObwg3yZTuIl
         8ZeScyrHy78JlGLo2A/bguSNo576HBEoM2Px4cZE8FBeQIh1pSMzTwXj1YpNQ4ok3Dee
         lrTQ==
X-Gm-Message-State: AO0yUKUGqBFQWqGu6fdWUx1anJY82W7V2aSImx+sp2LjxRW/atR5RY7a
        bzRwFDhn+rdh7QQs7yGZ2xY=
X-Google-Smtp-Source: AK7set9d2laRnRbapcAd8siE2bZ+imaK9IVIK2D7fOzf13taHY4ft+Z6RvcxkeP2ISZnydG1+yAIxQ==
X-Received: by 2002:a17:906:db0c:b0:909:3c55:a1b3 with SMTP id xj12-20020a170906db0c00b009093c55a1b3mr47469140ejb.38.1678729734897;
        Mon, 13 Mar 2023 10:48:54 -0700 (PDT)
Received: from [192.168.1.45] (hst-221-55.medicom.bg. [84.238.221.55])
        by smtp.gmail.com with ESMTPSA id lg8-20020a170906f88800b008ca8b62cda6sm64827ejb.177.2023.03.13.10.48.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Mar 2023 10:48:54 -0700 (PDT)
Message-ID: <ace4420f-d4fb-df18-60f0-3b698c196250@gmail.com>
Date:   Mon, 13 Mar 2023 19:48:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [GIT FIXES FOR v6.3] Venus fixes
Content-Language: en-US, bg-BG
To:     Linux regressions mailing list <regressions@lists.linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Javier Martinez Canillas <javierm@redhat.com>,
        Vikash Garodia <vgarodia@qti.qualcomm.com>,
        linux-media@vger.kernel.org
References: <20230302060413.67239-1-stanimir.k.varbanov@gmail.com>
 <cb03d97f-ae48-4090-e14b-354373a2ebe3@leemhuis.info>
 <7ef0357c-1bd8-7598-4c4e-9d795b5f0abd@leemhuis.info>
From:   Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
In-Reply-To: <7ef0357c-1bd8-7598-4c4e-9d795b5f0abd@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 13.03.23 г. 16:28 ч., Thorsten Leemhuis wrote:
> On 02.03.23 09:27, Linux regression tracking (Thorsten Leemhuis) wrote:
>> On 02.03.23 07:04, Stanimir Varbanov wrote:
>>>
>>> This pull request includes a fix for regression in venus hardware reset.
>>> The reverted commit has been merged in v6.2.
>>>
>>> Please pull.
> 
> Mauro: any reason why this is still not pulled? It fixes a regression
> that made it into 6.2 and the revert was now posted 34 days ago, hence
> it would be good if this could finally go to Linus, so that it can be
> backported to stable.

I guess the best I can do is to include the revert in the next pull 
request for v6.4.

> 
> BTW, Stan: What...
> 
>>> The following changes since commit 3e62aba8284de0994a669d07983299242e68fe72:
>>>
>>>    media: imx-mipi-csis: Check csis_fmt validity before use (2023-02-26 11:21:33 +0100)
>>>
>>> are available in the Git repository at:
>>>
>>>    git://linuxtv.org/svarbanov/media_tree.git tags/tag-venus-fixes-for-v6.3
>>>
>>> for you to fetch changes up to 1440cfcf24db8c50d929d3c35ab6f87f868fa628:
>>>
>>>    Revert "venus: firmware: Correct non-pix start and end addresses" (2023-03-02 07:52:10 +0200)
>>>
>>> ----------------------------------------------------------------
>>> Venus fixes for v6.3
>>>
>>> ----------------------------------------------------------------
>>> Javier Martinez Canillas (1):
>>>        Revert "venus: firmware: Correct non-pix start and end addresses"
>>
>> Good to see that this finally is heading towards mainline, thx.
>>
>> What about the other venus regression[1] Javier provided this patch for:
>>
>> https://patchwork.kernel.org/project/linux-media/patch/20230210081835.2054482-1-javierm@redhat.com/
> 
> ...about this revert from Feb, 10th? There was some discussion recently,
> but it would to get this finally resolved, too.

I still have doubts about test coverage on db410c and RB3, because the 
firmware there behaves very differently and we can introduce another 
regression. If that happens we have to fix the fix in this patch. I'm 
working on the testing on those two devices.

> 
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> If I did something stupid, please tell me, as explained on that page.
> 
> #regzbot poke
> #regzbot ignore-activity

-- 
regards,
Stan
