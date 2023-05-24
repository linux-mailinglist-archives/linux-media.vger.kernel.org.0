Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89D9B70F3D1
	for <lists+linux-media@lfdr.de>; Wed, 24 May 2023 12:12:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230208AbjEXKMM convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 24 May 2023 06:12:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbjEXKML (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 May 2023 06:12:11 -0400
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4D189B;
        Wed, 24 May 2023 03:12:09 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-561a33b6d63so10587397b3.1;
        Wed, 24 May 2023 03:12:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684923129; x=1687515129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fzIYJdXJYFzRWwRJm6KBdsbSfa7cBnqDw0QU1i0FO6g=;
        b=iNh8T4MpBuFztBU776pbxLxBFkmhnvTBmpk2X7AmeMfY32HmfNBE5bL86jYEKrofot
         ggiIz+DthM5oydIuHy99PkuLE8hHwiytWk3tGOomxBe5Z5/OfpiuYE0S6hx7EFbbv5tP
         C/QiO/Yen66uqMeEnV5sw0y0OZHpbENW/03oqI2rGwp+eUHAMYqTmhwjngg1AkFxIrEG
         SpSOAcz+SuN60rpG0F5E58wx75AykSGYhZG+9J1UMk2cLad6amTq0YoNl5RalQBuriAI
         d8+UBnSHuPP3rkI1RI3JHzRUAya/+XK3EdYDZ60qYj1cazWuzvv6glF/s3kqqF4m30Fo
         EeDQ==
X-Gm-Message-State: AC+VfDxfj9tXNfZYxM2FbC1j/+nKQDUtaDlic8rkMuNg2z34toUQKyap
        5ghgW+E9q2LRGUMK/DxFjU/8FTe6qFimMQ==
X-Google-Smtp-Source: ACHHUZ6PdD/Ohisne0l1T+yRZKS3jI4LJMPFF1crG8NlJrHijoxvEDyT5IUEP38umfa0Fd+NyO23rw==
X-Received: by 2002:a0d:e60f:0:b0:55a:6f13:dbb4 with SMTP id p15-20020a0de60f000000b0055a6f13dbb4mr17274136ywe.8.1684923128698;
        Wed, 24 May 2023 03:12:08 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id p5-20020a0dff05000000b0054f8b1f21e5sm3608490ywf.85.2023.05.24.03.12.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 03:12:07 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-561a33b6d63so10586737b3.1;
        Wed, 24 May 2023 03:12:07 -0700 (PDT)
X-Received: by 2002:a0d:f404:0:b0:561:8c55:738e with SMTP id
 d4-20020a0df404000000b005618c55738emr19324542ywf.12.1684923126668; Wed, 24
 May 2023 03:12:06 -0700 (PDT)
MIME-Version: 1.0
References: <3d6cbf2cd4398f29379d8d7287b93e8b8ec6c147.1684856457.git.geert+renesas@glider.be>
 <ZG3enBHbEkS//A+H@kekkonen.localdomain>
In-Reply-To: <ZG3enBHbEkS//A+H@kekkonen.localdomain>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 24 May 2023 12:11:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVCj0b_7eHKvb4hL4Uq6G-S9on5O680etauFm4Fjt_mVQ@mail.gmail.com>
Message-ID: <CAMuHMdVCj0b_7eHKvb4hL4Uq6G-S9on5O680etauFm4Fjt_mVQ@mail.gmail.com>
Subject: Re: [PATCH v3] media: renesas: fdp1: Identify R-Car Gen2 versions
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Wed, May 24, 2023 at 11:53 AM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
> On Tue, May 23, 2023 at 05:42:21PM +0200, Geert Uytterhoeven wrote:
> > On R-Car M2-W:
> >
> >     rcar_fdp1 fe940000.fdp1: FDP1 Unidentifiable (0x02010101)
> >     rcar_fdp1 fe944000.fdp1: FDP1 Unidentifiable (0x02010101)
> >
> > Although the IP Internal Data Register on R-Car Gen2 is documented to
> > contain all zeros, the actual register contents seem to match the FDP1
> > version ID of R-Car H3 ES1.*, which has just been removed.
> > Fortunately this version is not used for any other purposes yet.
> >
> > Fix this by re-adding the ID, now using an R-Car Gen2-specific name.
> >
> > Fixes: af4273b43f2bd9ee ("media: renesas: fdp1: remove R-Car H3 ES1.* handling")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> > ---
> > Version register contents verified on R-Car H2 ES1.0, R-Car M2-W ES1.0 &
> > ES3.0, and R-Car E2 ES1.0.  I couldn't get hold of an R-Car M2-N.
> >
> > v3:
> >   - Add Reviewed-by,
>
> V2 is already in my PR to Mauro. I hope that's fine!

Np, I wasn't aware of that. Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
