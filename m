Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 207A854E365
	for <lists+linux-media@lfdr.de>; Thu, 16 Jun 2022 16:29:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235743AbiFPO3j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jun 2022 10:29:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233439AbiFPO3h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jun 2022 10:29:37 -0400
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com [IPv6:2607:f8b0:4864:20::c32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8469D3B546
        for <linux-media@vger.kernel.org>; Thu, 16 Jun 2022 07:29:35 -0700 (PDT)
Received: by mail-oo1-xc32.google.com with SMTP id o23-20020a4ad497000000b0041bd038b4dbso285645oos.4
        for <linux-media@vger.kernel.org>; Thu, 16 Jun 2022 07:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=tPvMe8FMb39k1iwCY0F3HPLKpyyB4/jfPar8SoJZQQo=;
        b=QZFSbZ/PtB4bh5SDua8SoTioktHMBnLPixzoLoepCV3hGpGKZJckmX9Yy8j63hhZch
         Bc9yIMLsZCS93Ffbq8aUHClszbr9dHf8Ix9LgLgf7ulu00QObxfYUUC80kKrFCCHohFg
         cABKpjAiLaO0d12ySTvFj+wYbZGfZUIsQaSBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tPvMe8FMb39k1iwCY0F3HPLKpyyB4/jfPar8SoJZQQo=;
        b=aRw9FAUltGBw4tdfs4GyDFvqN94uCXFCE1et0d1VSSkrMfs8GabW40+loqcjHKL+6p
         rg3uCz3nUv9c38+XBvR5aKsYYgcNqovLkYBP16TZRSNc/0ZdcPX75C30klrLLUL0E9m6
         JFn1bt9EXsRhr0fi1l+hBdOrpxKbG5+vVOzWtkSRMXKV9UHMcxYo7hswcmeJKXl+glV9
         NYI7ONK/IMIHXbkzxGMSybp2vj5cIlkxyLi3hQ+SYtvgdY8YMgBzV2CFZkWeLG5XDV1U
         UW/9QDDxrv8CBdvjp2JQ89v1t3895pfHcc19RVhgkhM3kPYb49VMWXydhJGHSkz7VjXz
         HJ7A==
X-Gm-Message-State: AJIora9vp3qx91DCTV4s5+RkARqBXTnxfv4ErJEwzsu0rF2KhhA3mW/6
        MJ3Bd0U6yb8kloV/bN3+NiFWaAmTu5kUQg==
X-Google-Smtp-Source: AGRyM1vVL/A4ZwGII9EPqaNsjiiXXyH5Yiub0JE1fR34kbDvO8DsaObNYa6ob/6W+vwbNn/iOzBVpw==
X-Received: by 2002:a4a:e605:0:b0:41b:c825:fe7 with SMTP id f5-20020a4ae605000000b0041bc8250fe7mr2111406oot.74.1655389774557;
        Thu, 16 Jun 2022 07:29:34 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id s24-20020a056808209800b0032e6b8e8aefsm905550oiw.17.2022.06.16.07.29.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jun 2022 07:29:34 -0700 (PDT)
Subject: Re: [PATCH 1/3] media: vimc: expand the names of vimc entity types
To:     Daniel Oakley <daniel.oakley@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20220616100747.48124-1-daniel.oakley@ideasonboard.com>
 <20220616100747.48124-2-daniel.oakley@ideasonboard.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <02e4de58-9de7-56e7-d673-6c01f50da64b@linuxfoundation.org>
Date:   Thu, 16 Jun 2022 08:29:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20220616100747.48124-2-daniel.oakley@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/16/22 4:07 AM, Daniel Oakley wrote:
> When introducing the lens controller, it became apparent that the vimc
> entity type names were hard to understand, e.g. vimc_len_type refers to the
> lens. The names of the vimc entity types have been expanded to make the
> code easier to understand. There is no functional change intended.
> 
> Suggested-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> Signed-off-by: Daniel Oakley <daniel.oakley@ideasonboard.com>
> ---
>   .../media/test-drivers/vimc/vimc-capture.c    | 270 ++++++------
>   drivers/media/test-drivers/vimc/vimc-common.h |  10 +-
>   drivers/media/test-drivers/vimc/vimc-core.c   |  22 +-
>   .../media/test-drivers/vimc/vimc-debayer.c    | 393 +++++++++---------
>   drivers/media/test-drivers/vimc/vimc-lens.c   |  82 ++--
>   drivers/media/test-drivers/vimc/vimc-scaler.c | 216 +++++-----
>   drivers/media/test-drivers/vimc/vimc-sensor.c | 307 +++++++-------
>   7 files changed, 652 insertions(+), 648 deletions(-)
> 

Thank you for the patch to improve code readability. Looks good to me.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
