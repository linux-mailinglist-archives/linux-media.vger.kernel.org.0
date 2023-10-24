Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 220367D5481
	for <lists+linux-media@lfdr.de>; Tue, 24 Oct 2023 16:57:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343651AbjJXO5B convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 24 Oct 2023 10:57:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234469AbjJXO5A (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Oct 2023 10:57:00 -0400
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B58EE8;
        Tue, 24 Oct 2023 07:56:55 -0700 (PDT)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-6cd33d51852so3023775a34.2;
        Tue, 24 Oct 2023 07:56:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698159415; x=1698764215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OfKu34kdtOKhfx7YdMUZjS0/Dm/XegFB8rQ/XeKhU/U=;
        b=COvrZAuJ+ehm7jBcPU6uUrzhN99liB35f80oMt3tE/YgZsQinunwVOJqukO7ObGFML
         nSljR1spat0AeCzm8RRRU9KGxz8whkEhWEKONSGHbcU5WuM3WYJ2ip6is8x/1YF/z2qg
         JcHI+3POOi69lup+mSHEiBioUbE4iIbEeY/z7WqjI1mxPihMPMHx6uXJoHmZY2DKsdHg
         wHTzCzu4hhe+Lo5fUplv1jPK4ZgN3Pz0y5CP1DSf+SHrkb8RaDxakzZjn6qDvAyuik5E
         2hACUxV5C0qGCGaLSXIttTKxxOL7if8i67ibGTOuViTGK5A4BfrMX+VXqlCuleoefuRp
         go+Q==
X-Gm-Message-State: AOJu0YwH47bN7mHq+a//lN6IZLuD2LNPL33Oi1/q6gx06YHZrmp4B8+m
        fwfxNppR//sr1CH5IHNy8COcC3CzeJ/Wcg==
X-Google-Smtp-Source: AGHT+IFZOw+g3SZTPsJkgfmnscFLy0vPhGAcFc4HXH2sj9go3w66jM/ngrqAe2DqFv/JGLIH5QjX8w==
X-Received: by 2002:a05:6830:4407:b0:6b9:e35e:8dd with SMTP id q7-20020a056830440700b006b9e35e08ddmr15683804otv.2.1698159414687;
        Tue, 24 Oct 2023 07:56:54 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id z65-20020a814c44000000b005a8eadbadbesm399547ywa.19.2023.10.24.07.56.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Oct 2023 07:56:54 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-d9caf5cc948so4250895276.0;
        Tue, 24 Oct 2023 07:56:54 -0700 (PDT)
X-Received: by 2002:a25:25c9:0:b0:da0:478a:940 with SMTP id
 l192-20020a2525c9000000b00da0478a0940mr1687254ybl.41.1698159413978; Tue, 24
 Oct 2023 07:56:53 -0700 (PDT)
MIME-Version: 1.0
References: <20231024142522.29658-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20231024142522.29658-1-laurent.pinchart+renesas@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 24 Oct 2023 16:56:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXfn__=z9RQgxo_Rnmm3x5CbNxvqp1+g+vcQZZQggO=Zg@mail.gmail.com>
Message-ID: <CAMuHMdXfn__=z9RQgxo_Rnmm3x5CbNxvqp1+g+vcQZZQggO=Zg@mail.gmail.com>
Subject: Re: [PATCH] media: vsp1: Remove unbalanced .s_stream(0) calls
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Tue, Oct 24, 2023 at 4:25 PM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> The VSP1 driver uses the subdev .s_stream() operation to stop WPF
> instances, without a corresponding call to start them. The V4L2 subdev
> core started warning about unbalanced .s_stream() calls in commit
> 009905ec5043 ("media: v4l2-subdev: Document and enforce .s_stream()
> requirements"), causing a regression with this driver.
>
> Fix the problem by replacing the .s_stream() operation with an explicit
> function call for WPF instances. This allows sharing an additional data
> structure between RPF and WPF instances.
>
> Fixes: 009905ec5043 ("media: v4l2-subdev: Document and enforce .s_stream() requirements")
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Closes: https://lore.kernel.org/linux-media/2221395-6a9b-9527-d697-e76aebc6af@linux-m68k.org/
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks for your patch!

The warning splat is gone, so
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
