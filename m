Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E12065A886
	for <lists+linux-media@lfdr.de>; Sun,  1 Jan 2023 02:22:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232415AbjAABWM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 31 Dec 2022 20:22:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229882AbjAABWL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 31 Dec 2022 20:22:11 -0500
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 901E5634E
        for <linux-media@vger.kernel.org>; Sat, 31 Dec 2022 17:22:09 -0800 (PST)
Received: by mail-ot1-x332.google.com with SMTP id y18-20020a0568301d9200b0067082cd4679so15323101oti.4
        for <linux-media@vger.kernel.org>; Sat, 31 Dec 2022 17:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ww925qDRQMTRBp3kPOnTlPG41aVz0lVhVGJ/nRtnW2A=;
        b=UWnp4aAAiHBfMiJDDDnPa33GKRGmN/cXcSC7AphuuXMDS9zs7ISyH9FFt5b4fd2Clq
         q3LI6/HS1u0S4qCbyoo3GKaziyfPLeCmMpqJy8HLUmFoEJ2xr9fVyHcGwBEXxWOpfi3D
         beeuvoSib65fz68FNf6JQx+Z3hSIQZfSWPE3BwKOKvlA4ThuI3sIr7I96zwiukzF+9J5
         QQeVTwPn3XvxzUqrVFJWQES8Dz727dGDudBd8yFC0NPrXuoG7l/opDPpeihoqiNzXSRn
         iKZFKY5tNB5DPQbf7XD8PkZEXlM//NfjF+dqOKzIi7fSb+MrU6GC7WBrE3pnW4wiurFP
         vDHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ww925qDRQMTRBp3kPOnTlPG41aVz0lVhVGJ/nRtnW2A=;
        b=Q1wuYVE9Q13XpPCqfD/R7fUuFN1/LSpAFSLDJ/JIGyyf7RzF2h2qh7Fg3ZealbDc7M
         X14CuX5q5BPEaF9YIwoG/ONqoSFxCWglSwtCoA9BBveBcLX7zfCZHoX8ZoRhcR50zu23
         HHZ3rbUVk3w4UL29W68a+V6vtzT3AOeuQbs0MDKcuRBfFpR6MJfHvxiLhAYdi2PXMuJI
         3LD0TAdN2kk6fiUNOS2fcQCZbWWbNEvvbAgoVNQqmOcimS/C/TETXM51UN3hxOJqp3mB
         +fVR+vqJElzb7SNZnuhnYc+tv4QbN4SY1085onPIB9C1G61keU+qM4b/XgfViqKcFlOQ
         SuGw==
X-Gm-Message-State: AFqh2kqcIg6/25BC1DI+EI0oQAlkqpwsoZmfwLTLAzOfoIfBccNT4xQO
        xPPLDLhgAQU9fzMiBZle3FJAJA==
X-Google-Smtp-Source: AMrXdXuhn/vwpF7ssORw7RIwqNMPM39cDkAV7IkrYCgooAWtLfVGrcyS2H4EKgsrK8StB/MO/TAaug==
X-Received: by 2002:a9d:7314:0:b0:673:67f8:93ae with SMTP id e20-20020a9d7314000000b0067367f893aemr21342552otk.29.1672536128939;
        Sat, 31 Dec 2022 17:22:08 -0800 (PST)
Received: from [192.168.86.224] ([136.62.38.22])
        by smtp.gmail.com with ESMTPSA id c8-20020a9d6848000000b00670461b8be4sm3150741oto.33.2022.12.31.17.22.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Dec 2022 17:22:08 -0800 (PST)
Message-ID: <397291cd-4953-8b47-6021-228c9eb38361@landley.net>
Date:   Sat, 31 Dec 2022 19:33:53 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: Build regressions/improvements in v6.2-rc1
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-kernel@vger.kernel.org
Cc:     linux-media@vger.kernel.org, kasan-dev@googlegroups.com,
        Linux-sh list <linux-sh@vger.kernel.org>
References: <CAHk-=wgf929uGOVpiWALPyC7pv_9KbwB2EAvQ3C4woshZZ5zqQ@mail.gmail.com>
 <20221227082932.798359-1-geert@linux-m68k.org>
 <alpine.DEB.2.22.394.2212270933530.311423@ramsan.of.borg>
From:   Rob Landley <rob@landley.net>
In-Reply-To: <alpine.DEB.2.22.394.2212270933530.311423@ramsan.of.borg>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/27/22 02:35, Geert Uytterhoeven wrote:
> sh4-gcc11/sh-allmodconfig (ICE = internal compiler error)

What's your actual test config here? Because when I try make ARCH=sh
allmodconfig; make ARCH=sh it dies in arch/sh/kernel/cpu/sh2/setup-sh7619.c with:

./include/linux/sh_intc.h:100:63: error: division 'sizeof (void *) / sizeof
(void)' does not compute the number of array elements [-Werror=sizeof-pointer-div]
  100 | #define _INTC_ARRAY(a) a, __same_type(a, NULL) ? 0 : sizeof(a)/sizeof(*a)

(Which isn't new, lots of configs won't compile off x86 and arm. I'm not sure
allmodconfig is picking a sane/actual cpu/board combo?)

What actual configuration are you trying to build?

Rob

P.S. Also my ssh cross gcc is 9.4 so I may need to build gcc-11 to see the
error, but I thought I'd try to reproduce the easy way first...
