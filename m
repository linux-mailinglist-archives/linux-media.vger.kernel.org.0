Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26FA57157AE
	for <lists+linux-media@lfdr.de>; Tue, 30 May 2023 09:55:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229677AbjE3HzF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 May 2023 03:55:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229636AbjE3HzC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 May 2023 03:55:02 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA09E1B7
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 00:54:35 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3f60dfc6028so42923445e9.1
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 00:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685433274; x=1688025274;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DA/3B+SHE0fkJ+Wo2f4qsn3tPIj95QnCk0y9raYNCPM=;
        b=wfEH7XNHddNx44QhCziP8DE7gd+9Y6RvtnBPy/Y0eNZ3ULJ0JXblXivpHAFE6oGHqW
         1ua2pYBpR49XCs9IzhubDQU4zAL0cUZkMJJXRznGNeB4UrYvbUOYbSCZR2xNz9lNuxCM
         9TIAp9FZ9jAYv5K/hMSR3MTiCEgHO/RWZor1Y8pIbUo+BIwG51nhgeiPjN98/ROvEyqP
         TvRMmjrUtgTSChCzqHIrCw76xcRPEW+1h5Mh8fitChqjyZwdV8m7B7dIUtZ91Q7d9Q7C
         IlgnAS/sGg14ZeSds9F2evciVcGVHk4L5r05jOfPEZPwLplrYtZLGJnFxVa3bk6VREXb
         3XMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685433274; x=1688025274;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DA/3B+SHE0fkJ+Wo2f4qsn3tPIj95QnCk0y9raYNCPM=;
        b=QoLklGuTf/kPupetNPC3EDYnH4P+xJHIuUr8CprAdgaFA78Jx2oFgP975+sOGb1evz
         n/lqGlOCDg+5+9lFWbspwVwwHwxDqjsDMOq8b8fbh3V8zH/++9naVSJ3usJzdPA4FXd+
         uEBnYyzaJJrZk9ZjmhRxcPaFQF2LOTqUbm3M2jqBgQQ9uz6EpeN037E628AI/wW3v2MM
         ikip7S1sVQJSna1NGd+UJopw758jut7qeKUiSChwK7IzvXIBm1PPAI5ZOkAPWk5thv0C
         6ZuSiXAieyD1XjZus9nDz7sUZ2UGnUFs8eXEvJUAwTboa+Ym4wbuO3Wl9dZoriy9I/lI
         tPcA==
X-Gm-Message-State: AC+VfDxeE1WeRyRS6cKPHaCPM6nBNa7h6KfDgiVm/47F+3DwnJtyG2+X
        QnTJ1ejpj2X+WD0Hx/xOrAiftQ==
X-Google-Smtp-Source: ACHHUZ4XGChBG7YEV6Ww/s5OZEtTPMpvOUU9y6Nm7ba81NxW/r+ynfuDkeRw++SxZBu9uEu4909twg==
X-Received: by 2002:a05:600c:b44:b0:3f2:48dc:5e02 with SMTP id k4-20020a05600c0b4400b003f248dc5e02mr814437wmr.27.1685433273970;
        Tue, 30 May 2023 00:54:33 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:4294:2221:d2df:9e87? ([2a01:e0a:982:cbb0:4294:2221:d2df:9e87])
        by smtp.gmail.com with ESMTPSA id u3-20020a7bc043000000b003f17848673fsm16450709wmc.27.2023.05.30.00.54.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 00:54:33 -0700 (PDT)
Message-ID: <2fbf32db-c013-829e-317b-f17e170ac472@linaro.org>
Date:   Tue, 30 May 2023 09:54:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 0/3] media: rc: meson-ir: support MMIO regmaps to
 access registers
Content-Language: en-US
To:     zelong dong <zelong.dong@amlogic.com>, Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        Qianggui.Song@amlogic.com, Yonghui.Yu@amlogic.com,
        kelvin.zhang@amlogic.com
References: <20230517115635.31565-1-zelong.dong@amlogic.com>
Organization: Linaro Developer Services
In-Reply-To: <20230517115635.31565-1-zelong.dong@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 17/05/2023 13:56, zelong dong wrote:
> From: Zelong Dong <zelong.dong@amlogic.com>
> 
> This patchset add MMIO regmaps to access register in Meson IR driver.
> For defining clearly, sort/rename IR Controller register macros.
> 
> Changes since v1:
> - move the cleanup/rename to a separate patch.
> - use devm_platform_ioremap_resource() instead of platform_get_resource()
>    and devm_ioremap_resource().
> 
> ---
> v1: https://lore.kernel.org/r/20230511034333.26800-1-zelong.dong@amlogic.com
> 
> Zelong Dong (3):
>    media: rc: meson-ir: sort Meson IR Controller register macros
>    media: rc: meson-ir: rename Meson IR Controller register macros
>    media: rc: meson-ir: support MMIO regmaps to access registers
> 
>   drivers/media/rc/meson-ir.c | 125 ++++++++++++++++++------------------
>   1 file changed, 64 insertions(+), 61 deletions(-)
> 

Patch 2 & 3 doesn't apply cleanly on v6.4-rc1, please rebase on the latest -rc1 kernel.

Neil
