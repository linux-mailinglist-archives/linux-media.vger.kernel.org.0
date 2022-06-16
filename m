Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B2C454E312
	for <lists+linux-media@lfdr.de>; Thu, 16 Jun 2022 16:11:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377571AbiFPOLs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jun 2022 10:11:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377558AbiFPOLs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jun 2022 10:11:48 -0400
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A36B949B57
        for <linux-media@vger.kernel.org>; Thu, 16 Jun 2022 07:11:47 -0700 (PDT)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-1016409cf0bso1995099fac.12
        for <linux-media@vger.kernel.org>; Thu, 16 Jun 2022 07:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JrydxXSesVq8pCQz7oDo5X7bLzHcC55FekWVTZaEIDc=;
        b=RUKkE3skRroM8ag/HW5Jy3OOxslfa1jm4JOzG1KXY/JRSY6e4q88a0/tQLw87fx16/
         l5tyoTLWDcrBBXmLJqUgun6oVWgp955TypRJmvrIcbzQu4r/KVs/b0Xwsx4Pbl1iApWp
         dacTQnlehDemD3yEJK8EInAgNS4fvhDdruIOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JrydxXSesVq8pCQz7oDo5X7bLzHcC55FekWVTZaEIDc=;
        b=Qkz0RQb/hXl1Ws1Qaib7psr3+G1yYOIHF3EOMeZ2BJNttcF9MEriTJCHR4P+YD053a
         /7bTJdG6ayaz5Q96HNAm0EYdrgCTlSYk0p6ZZdVE3wELANpuPN8RAFjdLlh3nGQ1Ab8U
         xsWKez1cRf8ZQEdxQ9XvPLhphh+1kylvuUFeD0HfONLA6sj14OpvSPtPFX4dDdYk9yuH
         sNMhNEjzI50/72eoBiiVoojmMaUmjOXgBjrHK3u17rvoxXWjHomY6pZ2JJUcaRDLzXOm
         GrLJhp6R81rjW2W47WtirvGibjY69KbfRq2w5g7XfQAJ2szyRwcUkmr0Pz1Q0j73NJ2j
         l87Q==
X-Gm-Message-State: AJIora+D4m4ZnY6/TM1GzUJDuieb0pAJuIlGDRoGzT000wONp1OUpDc4
        zWhJuT0Nsq9lN77M5ADhCBqFbg==
X-Google-Smtp-Source: AGRyM1two1sy4Lh1Hqt0yIch2Q2CWugQRrG7ULV5/3j4MTAjzmnOTNmcn6cxBSjrzDru/TS5bKH9LQ==
X-Received: by 2002:a05:6870:d1c6:b0:fe:340e:e5fd with SMTP id b6-20020a056870d1c600b000fe340ee5fdmr2762913oac.57.1655388706631;
        Thu, 16 Jun 2022 07:11:46 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id q133-20020aca5c8b000000b00325cda1ff95sm881445oib.20.2022.06.16.07.11.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jun 2022 07:11:46 -0700 (PDT)
Subject: Re: [PATCH v1 2/2 RESEND] media: vimc: documentation for lens
To:     Yunke Cao <yunkec@google.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20220610010111.3418214-1-yunkec@google.com>
 <20220610010111.3418214-3-yunkec@google.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <09466e7d-2a0f-13fb-3010-34c0d1403a3e@linuxfoundation.org>
Date:   Thu, 16 Jun 2022 08:11:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20220610010111.3418214-3-yunkec@google.com>
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

On 6/9/22 7:01 PM, Yunke Cao wrote:
> Signed-off-by: Yunke Cao <yunkec@google.com>
> ---

Please add commit log - describe what this feature adds in a couple
of sentences. It would be helpful to see how this can be invoked or
used.

>   Documentation/admin-guide/media/vimc.dot | 4 ++++
>   Documentation/admin-guide/media/vimc.rst | 3 +++
>   2 files changed, 7 insertions(+)
> 
> diff --git a/Documentation/admin-guide/media/vimc.dot b/Documentation/admin-guide/media/vimc.dot
> index 8e829c164626..92a5bb631235 100644
> --- a/Documentation/admin-guide/media/vimc.dot
> +++ b/Documentation/admin-guide/media/vimc.dot
> @@ -5,9 +5,13 @@ digraph board {
>   	n00000001 [label="{{} | Sensor A\n/dev/v4l-subdev0 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
>   	n00000001:port0 -> n00000005:port0 [style=bold]
>   	n00000001:port0 -> n0000000b [style=bold]
> +	n00000001 -> n00000002
> +	n00000002 [label="{{} | Lens A\n/dev/v4l-subdev5 | {<port0>}}", shape=Mrecord, style=filled, fillcolor=green]
>   	n00000003 [label="{{} | Sensor B\n/dev/v4l-subdev1 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
>   	n00000003:port0 -> n00000008:port0 [style=bold]
>   	n00000003:port0 -> n0000000f [style=bold]
> +	n00000003 -> n00000004
> +	n00000004 [label="{{} | Lens B\n/dev/v4l-subdev6 | {<port0>}}", shape=Mrecord, style=filled, fillcolor=green]
>   	n00000005 [label="{{<port0> 0} | Debayer A\n/dev/v4l-subdev2 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>   	n00000005:port1 -> n00000015:port0
>   	n00000008 [label="{{<port0> 0} | Debayer B\n/dev/v4l-subdev3 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> diff --git a/Documentation/admin-guide/media/vimc.rst b/Documentation/admin-guide/media/vimc.rst
> index 0b07f05dde25..1723eb5ec56a 100644
> --- a/Documentation/admin-guide/media/vimc.rst
> +++ b/Documentation/admin-guide/media/vimc.rst
> @@ -53,6 +53,9 @@ vimc-sensor:
>   
>   	* 1 Pad source
>   
> +vimc-lens:
> +	Ancillary lens for a sensor.
> +

Please add some description on what this does.

>   vimc-debayer:
>   	Transforms images in bayer format into a non-bayer format.
>   	Exposes:
> 

With these fixed

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
