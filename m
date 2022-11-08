Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3620E620ACA
	for <lists+linux-media@lfdr.de>; Tue,  8 Nov 2022 09:00:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233605AbiKHIAL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Nov 2022 03:00:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233437AbiKHIAJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Nov 2022 03:00:09 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6568A266C
        for <linux-media@vger.kernel.org>; Tue,  8 Nov 2022 00:00:07 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id j15so19624440wrq.3
        for <linux-media@vger.kernel.org>; Tue, 08 Nov 2022 00:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fGYN+OrKT+Wc9wa2H+f4cBj9a1gnXGucm2/MFJDAUEc=;
        b=KPJ+SqQRh8tNjrsB5SkSC9KV2x2xGFHIyLgZfEOJpdw3Yxoo9TtC6O+xjN83h5XPO4
         ngNCAv2q7dq8xTKelxpfeeNVqwjNIyWc0LYFMi0RQV4BodG1UpieV07QKuLr9D+7u9MS
         TxZ4xxEWfwqoJRwkmNAeUW1QA98LsovE4aSGMV4iHKZqikZQsl2LcmZ36SToHcRwvr8Z
         epetrH3no1C2nkkZwdLIeICANve+uAXLdxAUf3cH1PgULUdLPH458ESTqagA7AFGuTq3
         6Y6ZJIVSlDzHAhjKg8IXR90sYx6ou7iGXiRj286uSJr0MbDlVMHmAv+KKx6RV5PyoN82
         ob+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fGYN+OrKT+Wc9wa2H+f4cBj9a1gnXGucm2/MFJDAUEc=;
        b=WxNfNqcVrD5j0GaYPeefwwU3mHWprk/e3gdks7wvC4YXc5ws4UGgWCunlr5+CdGAvn
         aXBLlNC31JE9lwcWf+kkKL91vjg2LWQCtVLtLI9/mWihWxM/OG7dW2QQhHpBT67x1oXy
         Ixe3vgp/bS+AgPDeTqC2KpFXsoNIETbdjQwt6m1fiUB6+68AXHBwGG6EaAEsxdJcMaZb
         nNg21mls8OeSKyfyQQabq06B/J6OKal2IVTXGo9a5fQlJDHyYH5AbPwom8bj+67encmb
         aJd9ocpow5Lhhp5wH/+DRYx0JczRQvwtsbRwlxokjR0ZYz5H913j7b+3yjIPDUff/gbL
         UoUA==
X-Gm-Message-State: ACrzQf39LDpRae9YXGwsnnUp44hFCZNlolXlk38w1+0qyqPVrI/yyXSL
        TEULMH+lJtxIOTIHFUB7UNgaHg==
X-Google-Smtp-Source: AMsMyM5rSN3xNF9uAe4ahnLY/NH+GZ4LiIgAn2zN32iu4O9cN0kCn8Gk1Tuj7s5Nxk6WIY9DJOxHNg==
X-Received: by 2002:a5d:4ac8:0:b0:236:781a:8d2d with SMTP id y8-20020a5d4ac8000000b00236781a8d2dmr35171464wrs.715.1667894405980;
        Tue, 08 Nov 2022 00:00:05 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:69c1:baa5:e978:60e9? ([2a01:e0a:982:cbb0:69c1:baa5:e978:60e9])
        by smtp.gmail.com with ESMTPSA id h7-20020a05600c314700b003a1980d55c4sm14468146wmo.47.2022.11.08.00.00.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 00:00:05 -0800 (PST)
Message-ID: <64cbcad7-0b71-3bbc-a6d2-08f1cefdfa5e@linaro.org>
Date:   Tue, 8 Nov 2022 09:00:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] staging: media: meson: vdec: use min() for comparison and
 assignment
Content-Language: en-US
To:     Deepak R Varma <drv@mailo.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <Y2lYWWKkDa73gcqm@qemulion>
Organization: Linaro Developer Services
In-Reply-To: <Y2lYWWKkDa73gcqm@qemulion>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 07/11/2022 20:11, Deepak R Varma wrote:
> Use of standard min() helper macro is preferred over using ternary
> operator for logical evaluation and value assignment. This issue is
> identified by coccicheck using the minmax.cocci file.
> 
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
>   drivers/staging/media/meson/vdec/codec_vp9.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)

<snip>

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

