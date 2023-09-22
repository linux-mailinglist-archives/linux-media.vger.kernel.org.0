Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E1107AB296
	for <lists+linux-media@lfdr.de>; Fri, 22 Sep 2023 15:20:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233375AbjIVNUE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Sep 2023 09:20:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbjIVNUD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Sep 2023 09:20:03 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6557E8
        for <linux-media@vger.kernel.org>; Fri, 22 Sep 2023 06:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1695388750;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5RoviINUgh72orMUIhtb21naYrkqWql4YqJ6Jn3iiVs=;
        b=We+fSSEwKuOm1XUvDu8aVHclJM2rgXKZsPtva07X0kngeFaM3ZCtam/a8p6+tx7jswjfB8
        49eL/we2Ot+Cr+WLLpUMk6oWdZhQcRA1tIQRIFNFGMpjvrohdELGSuWZUUP6OteCefIZcR
        uh6bJilhdFRS9Nk7I8EKZXG4Q43mafs=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-158-IaSQzucFPPeOc9pOX2iFhw-1; Fri, 22 Sep 2023 09:19:09 -0400
X-MC-Unique: IaSQzucFPPeOc9pOX2iFhw-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5330c23f72eso1493553a12.1
        for <linux-media@vger.kernel.org>; Fri, 22 Sep 2023 06:19:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695388748; x=1695993548;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5RoviINUgh72orMUIhtb21naYrkqWql4YqJ6Jn3iiVs=;
        b=OpkPLwg3QnqUwa6v+n5iYG9ChfJOa/elLc033A3dROgm70YLeqVvijLEJtAB4jrp/J
         hGhwne62auGVV5JoKcQSC2K52o9NYxKzlch/Uu3KwM5sKC0DG6QnRTW3X7rKKE44tXkA
         maTkmWpjB9a6vrTbLMHnV7tKL73s0GV2jhLkbwJKut3sAZf8l7uQ+ido+UMbgmXB0Jlt
         ZbSGIYPYkQShOH5+JN1XL+yFQVmGEWO70YrPoTwyneRL2j4ll2oYrAqXJKohJUe84nS+
         YWclDiLbt8tYoRfg0UF4bcN01qH7tdTY4VU5GzYI5mVrr6lh5IFPbGTTGt9H2Q1aBIqi
         vnVw==
X-Gm-Message-State: AOJu0YxTEedqXgID9S9dDp/W6xtE8QDgaD+3rFS7zknif4tX09RG0ckD
        yamfyQ/dvQjZaRsnNpRCrQNf4SXiMooMUQa69hdZvlXTmHlXyuB7JP56zCmk2qFb16i6zinvv3d
        eqQEbPnmQ3VWGNXfwHHgVq8o=
X-Received: by 2002:aa7:cd58:0:b0:533:6e1b:3694 with SMTP id v24-20020aa7cd58000000b005336e1b3694mr1705629edw.21.1695388748049;
        Fri, 22 Sep 2023 06:19:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHF2g4+kXAZ2Mjf/0KNLgTP1RGcego0huAsVSR8WGHBApci042unZvBK3yelVsxfDufqLCn/w==
X-Received: by 2002:aa7:cd58:0:b0:533:6e1b:3694 with SMTP id v24-20020aa7cd58000000b005336e1b3694mr1705616edw.21.1695388747771;
        Fri, 22 Sep 2023 06:19:07 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id n19-20020a05640204d300b0052348d74865sm2260035edw.61.2023.09.22.06.19.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Sep 2023 06:19:07 -0700 (PDT)
Message-ID: <5654ee80-1c6c-1f27-3c60-11b624fcc691@redhat.com>
Date:   Fri, 22 Sep 2023 15:19:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/7] media: atomisp: ia_ccs_debug.c: increase enable_info
 buffer
Content-Language: en-US, nl
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     Arnd Bergmann <arnd@kernel.org>
References: <20230922105036.3148784-1-hverkuil-cisco@xs4all.nl>
 <20230922105036.3148784-4-hverkuil-cisco@xs4all.nl>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230922105036.3148784-4-hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 9/22/23 12:50, Hans Verkuil wrote:
> Fixes these compiler warnings:
> 
> drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c: In function 'ia_css_debug_pipe_graph_dump_stage':
> drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:2786:66: warning: '\n' directive output may be truncated writing 2 bytes into a region of size between 0 and 198 [-Wformat-truncation=]
>  2786 |                                                          "%s\\n%s\\n%s",
>       |                                                                  ^~~
> drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:2785:49: note: 'snprintf' output between 5 and 302 bytes into a destination of size 200
>  2785 |                                                 snprintf(enable_info, sizeof(enable_info),
>       |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  2786 |                                                          "%s\\n%s\\n%s",
>       |                                                          ~~~~~~~~~~~~~~~
>  2787 |                                                          enable_info1, enable_info2,
>       |                                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  2788 |                                                          enable_info3);
>       |                                                          ~~~~~~~~~~~~~
> drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:2772:66: warning: '\n' directive output may be truncated writing 2 bytes into a region of size between 0 and 198 [-Wformat-truncation=]
>  2772 |                                                          "%s\\n%s\\n%s",
>       |                                                                  ^~~
> drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:2771:49: note: 'snprintf' output between 5 and 302 bytes into a destination of size 200
>  2771 |                                                 snprintf(enable_info, sizeof(enable_info),
>       |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  2772 |                                                          "%s\\n%s\\n%s",
>       |                                                          ~~~~~~~~~~~~~~~
>  2773 |                                                          enable_info1, enable_info2,
>       |                                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  2774 |                                                          enable_info3);
>       |                                                          ~~~~~~~~~~~~~
> drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:2749:92: warning: 'snprintf' output may be truncated before the last format character [-Wformat-truncation=]
>  2749 |                                         snprintf(enable_info, sizeof(enable_info), "%s\\n%s",
>       |                                                                                            ^
> drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:2749:41: note: 'snprintf' output between 3 and 201 bytes into a destination of size 200
>  2749 |                                         snprintf(enable_info, sizeof(enable_info), "%s\\n%s",
>       |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  2750 |                                                  enable_info1, enable_info2);
>       |                                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Hans de Goede <hdegoede@redhat.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans





> ---
>  .../staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
> index bb6204cb42c5..8b0251073f93 100644
> --- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
> +++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
> @@ -2673,7 +2673,7 @@ ia_css_debug_pipe_graph_dump_stage(
>  		char enable_info1[100];
>  		char enable_info2[100];
>  		char enable_info3[100];
> -		char enable_info[200];
> +		char enable_info[302];
>  		struct ia_css_binary_info *bi = stage->binary_info;
>  
>  		/* Split it in 2 function-calls to keep the amount of

