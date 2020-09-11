Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EE7F265ED9
	for <lists+linux-media@lfdr.de>; Fri, 11 Sep 2020 13:36:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725822AbgIKLeq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Sep 2020 07:34:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725710AbgIKLdz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Sep 2020 07:33:55 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35A92C061795;
        Fri, 11 Sep 2020 04:33:31 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id z19so5496415lfr.4;
        Fri, 11 Sep 2020 04:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/QE4i4/aazEggX3dg7wr3FT355FkQudm+5WO62dn5fc=;
        b=ZdBz9q2UwkyiJEi8yLgyEcycOqWOQh+/+A9aVi86GSiibZAQFCBlj/zusrsnNfd1/M
         kXIxwa7mj0oqdG94vSLwToFrvwADr/MCjfq9iIzPsmIiAvkWAGVhdoacywEQadRQXiOb
         opqgQNTOTQ1fzKRNhcsOih1rksULZy3Uyk2df/nXamhviLMFUNEHWM4ZHCTGJHc2pyri
         rRUyZSAHxqEJ0AJ0clqXWmOs6jeY7E7UmV3idy1nrlJ2MMuWcB8USaz+fD97zJoxETSx
         AJMj1tbywhivTv9xRrUCUjKGz8kPfhZZfxqH+YuholrFYr+m73g1ta1H90NoOL/JKQPV
         t+RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/QE4i4/aazEggX3dg7wr3FT355FkQudm+5WO62dn5fc=;
        b=a8mR+vpB5P7+qY5fVVWURKNQUyYhmwv7d5wYexMhpoMsaxkV4XLZw2JXXK7NyKoExs
         W3v/2PZxlFUdn+6xxgDSlWYhv/fGBqZiJgVVDhcTvpDe7TxOqKyTqH1EL1V3Tav5zqs4
         eIGjPbRWUnVWO5M9QDiT1zploG2wzZiqVq6O5DZ1BxS+vWVHOnmMJS8N9EgrpV3AJp2i
         fQK/hwkABMwYe6LK7H3K59j0enkZENaeupCLv2usA8SyRQQhqrNDWLHf53VcyJDE1fj8
         Z9a0BPNG9JSDRLyL046scw/gpUZEtRVzZ4S1BIs8y+rQKis7BSI7mGiCXHZx6rI6ZAfL
         mHJw==
X-Gm-Message-State: AOAM5325qUwxMhmRaIgy1FLilZMAmDOsf2OQf6332YPtTudDud2MGO5v
        zY4D5Si3SFynq4+p+klD6V0=
X-Google-Smtp-Source: ABdhPJymzuhfD89a6kmG9I634PfKHVSojkHULfjgBdUyziy+UxX2lJToqR/e6LdP8duHsigYt6lD9w==
X-Received: by 2002:a05:6512:32b1:: with SMTP id q17mr178582lfe.329.1599824009497;
        Fri, 11 Sep 2020 04:33:29 -0700 (PDT)
Received: from wasted.omprussia.ru ([2a00:1fa0:4890:6188:b7d9:478f:6876:19ba])
        by smtp.gmail.com with ESMTPSA id 189sm483756ljj.54.2020.09.11.04.33.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2020 04:33:29 -0700 (PDT)
Subject: Re: [PATCH] media: Kconfig: Update help description VIDEO_RENESAS_FCP
 config
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>
References: <20200911101046.20200-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <85d326e2-a73b-fa51-a507-eced71346786@gmail.com>
Date:   Fri, 11 Sep 2020 14:33:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200911101046.20200-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello!

On 9/11/20 1:10 PM, Lad Prabhakar wrote:

> rcar-fcp driver is also used on Renesas RZ/G2 SoC's, update the same

    What same, the driver?

> to reflect help description for VIDEO_RENESAS_FCP config.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
> ---
>  drivers/media/platform/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> index bbf32086b607..a5716e9f463a 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -426,8 +426,8 @@ config VIDEO_RENESAS_FCP
>  	help
>  	  This is a driver for the Renesas Frame Compression Processor (FCP).
>  	  The FCP is a companion module of video processing modules in the
> -	  Renesas R-Car Gen3 SoCs. It handles memory access for the codec,
> -	  VSP and FDP modules.
> +	  Renesas R-Car Gen3 and RZ/G2 SoCs. It handles memory access for
> +	  the codec, VSP and FDP modules.
>  
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called rcar-fcp.

MBR, Sergei
