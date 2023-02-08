Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CD9768EA1E
	for <lists+linux-media@lfdr.de>; Wed,  8 Feb 2023 09:43:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229906AbjBHIn5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Feb 2023 03:43:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbjBHIn5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Feb 2023 03:43:57 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 324551117D
        for <linux-media@vger.kernel.org>; Wed,  8 Feb 2023 00:43:56 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id r8so18512865pls.2
        for <linux-media@vger.kernel.org>; Wed, 08 Feb 2023 00:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NS4IVSq1qNCOV4SCAWWy8InxgC7I2O3FeG5OkoKqBYI=;
        b=lRQPFc/aa5uGG2aajxQ0jFFiWc6LFvK25rzD2LE716Dyggqp0eILu2OhJnMMTGHiw/
         LChSItrFE4UN8VVKhXC5MBk24noCoMH/ug9T00VWoPLGBjsZI6l5gqka+mYCuHrNERk2
         ITI15TDZ4yd6BuofdpY8wCa4MRdAknLlZ/7Smo9WcKqQyp6z9tE+R+d2twTa/W/yWZhe
         E/QRbpWTRac0f27ADOLV7KnG9scVOdhL2MP3CVj8e8Dejq+K+lWXT119sFYwayc0p95Q
         sLrZci/k4Gre+Xqb1S2gxlWDprJccmhx7V+7xNEnmi9k7dzF75VBR8uU3Qu0YswYeW1W
         WycQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NS4IVSq1qNCOV4SCAWWy8InxgC7I2O3FeG5OkoKqBYI=;
        b=AE5RqgnX8SXT3O5Z9WuQNRGRQ0RlcM5iOOKYP7Re7bpsaR20Y/fKqAA4Bg+sEPYrL/
         ZUxYzIPJMz41tGPePMxKuSCFyM4SIlLjnMU2txrRLDKf6RWozWPkqhMF3npN0KJECnSN
         CA89uNIt420tIyItdrJd8xl4/ASJob2zfL4jRxZumiJoCwRvAq6Xv7IMtHPT+NrmlIGd
         j298VQYw8JMFCtwOmYDFuE2thDZ7WGvKeVaGh+pnklaUfXnEvvewPbGDufjIxmKS7eYi
         EWTVB8fjYHtsSDBkGVBA3trAwoxDTV3DpH2ZaUTDnDMb7zljxjymSsy2x1hC84W9OmYx
         b0Ng==
X-Gm-Message-State: AO0yUKUCDattMW6D06vR6qsjW2V63lw9tQM0dor8tBKIvmMebxemFIZN
        fTzjndWmhRGc/89bN4QHJKk=
X-Google-Smtp-Source: AK7set8+U9ZkbS04q8MMl2NOPcO5mkYK0s/1agghaxGWf8Xl51sRM/2C0pce/HikvgBMQc7+mxIeBQ==
X-Received: by 2002:a17:903:446:b0:199:7ad:42f7 with SMTP id iw6-20020a170903044600b0019907ad42f7mr5907617plb.33.1675845835717;
        Wed, 08 Feb 2023 00:43:55 -0800 (PST)
Received: from [192.168.11.9] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id d9-20020a170902aa8900b001991e59fde6sm4954507plr.216.2023.02.08.00.43.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Feb 2023 00:43:55 -0800 (PST)
Message-ID: <5dda1d0b-a132-0a34-b2a0-4ecd29cd9b8a@gmail.com>
Date:   Wed, 8 Feb 2023 17:43:49 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] media: Fix building pdfdocs
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dave Airlie <airlied@redhat.com>,
        Daniel Vetter <daniel@ffwll.ch>
References: <20230208082916.68377-1-tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
From:   Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20230208082916.68377-1-tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed,  8 Feb 2023 10:29:16 +0200, Tomi Valkeinen wrote:
> Commit 8d0e3fc61abd ("media: Add 2-10-10-10 RGB formats") added
> documatation for a few new RGB formats. For some reason these break the
> pdfdocs build, even if the same style seems to work elsewhere in the
> file.
> 
> Remove the trailing empty dash lines, which seems to fix the issue.
> 
> Fixes: 8d0e3fc61abd ("media: Add 2-10-10-10 RGB formats")
> Reported-by: Akira Yokosawa <akiyks@gmail.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Tested-by: Akira Yokosawa <akiyks@gmail.com>

> ---
> 
> Note: the offending patch was merged via drm tree, so we may want to
> apply the fix to the drm tree also.
> 
>  Documentation/userspace-api/media/v4l/pixfmt-rgb.rst | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
> index d330aeb4d3eb..ea545ed1aeaa 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
> @@ -868,7 +868,6 @@ number of bits for each component.
>        - r\ :sub:`4`
>        - r\ :sub:`3`
>        - r\ :sub:`2`
> -      -
>      * .. _V4L2-PIX-FMT-RGBA1010102:
>  
>        - ``V4L2_PIX_FMT_RGBA1010102``
> @@ -909,7 +908,6 @@ number of bits for each component.
>        - r\ :sub:`4`
>        - r\ :sub:`3`
>        - r\ :sub:`2`
> -      -
>      * .. _V4L2-PIX-FMT-ARGB2101010:
>  
>        - ``V4L2_PIX_FMT_ARGB2101010``
> @@ -950,7 +948,6 @@ number of bits for each component.
>        - r\ :sub:`6`
>        - r\ :sub:`5`
>        - r\ :sub:`4`
> -      -
>  
>  .. raw:: latex
>  
