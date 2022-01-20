Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E098494A9E
	for <lists+linux-media@lfdr.de>; Thu, 20 Jan 2022 10:24:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229437AbiATJYu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jan 2022 04:24:50 -0500
Received: from mail-vk1-f171.google.com ([209.85.221.171]:36799 "EHLO
        mail-vk1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358659AbiATJYq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jan 2022 04:24:46 -0500
Received: by mail-vk1-f171.google.com with SMTP id d189so3212106vkg.3;
        Thu, 20 Jan 2022 01:24:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NsnRQRM+YCBewkRwZvBlOs4h+Jkn3gBQiXb2lIyn9KY=;
        b=bZ98OtXYQVeWPIz13DPHStb1vx0GsavFMRoA8WaV1Ze2/V2mvfaurrqKpYu+vfmwFA
         fpGOjyWE6Rk76BvaO/5x46GgvXPGb4dxZEO9jUUVWA3+fMYPYMjNmdf/yMn+kmW/wGLp
         otGUAb7a7ZXvVa3MMo9J+9dNjndsmWHODIK5/sHnhRk+KPN39x66Af5XyO9Yc+cjHk7o
         Vs+AubcUOTFmvwOYzK1WfjqCW2J215clumf5qsaoFT2SBSXbrSeET/YGnj+xsP0T4igO
         KARsFTBs79NuBvhJ9NX0cy/Owp6HQVkpkmaOEWvvUtTbZNfdNwhtVnUe0WKRAlUZ6Txm
         Xn2g==
X-Gm-Message-State: AOAM530EeShLXvcTGwiSdJZWMjI3hBvHjZJ52JW1zr1L+jWYQCxtSLH7
        TJS+smZfyIjj7Ty55EcZ2d+oF4CgZo32xw==
X-Google-Smtp-Source: ABdhPJzxjeio4h4HzZZRcTsdu4KDA65wvqs7cpouavu3OQBP8+wfvMREb6SxOtacoHfYKr5ulSRssQ==
X-Received: by 2002:a1f:f2cf:: with SMTP id q198mr6337689vkh.37.1642670685076;
        Thu, 20 Jan 2022 01:24:45 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id s133sm441789vkh.28.2022.01.20.01.24.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jan 2022 01:24:44 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id l1so7790597uap.8;
        Thu, 20 Jan 2022 01:24:44 -0800 (PST)
X-Received: by 2002:a67:e95a:: with SMTP id p26mr9178069vso.38.1642670684325;
 Thu, 20 Jan 2022 01:24:44 -0800 (PST)
MIME-Version: 1.0
References: <20211216163439.139579-1-jacopo+renesas@jmondi.org> <20211216163439.139579-7-jacopo+renesas@jmondi.org>
In-Reply-To: <20211216163439.139579-7-jacopo+renesas@jmondi.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 20 Jan 2022 10:24:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW5wnfehtSkY-ft0qcCgaZc3=ZQ4xOxT7dY6sHoc2hg6Q@mail.gmail.com>
Message-ID: <CAMuHMdW5wnfehtSkY-ft0qcCgaZc3=ZQ4xOxT7dY6sHoc2hg6Q@mail.gmail.com>
Subject: Re: [PATCH v8 6/7] arm64: dts: renesas: Add GMSL cameras .dtsi
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo, Kieran,

On Thu, Dec 16, 2021 at 5:34 PM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> From: Kieran Bingham <kieran.bingham@ideasonboard.com>
>
> Describe the FAKRA connector available on Eagle and Condor boards that
> allow to connect GMSL camera modules such as IMI RDACM20 and RDACM21.
>
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

LGTM, so will queue in renesas-devel for v5.18 with 4/7 and 5/7, once
the questions for the latter have been answered.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
