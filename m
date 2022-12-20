Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C28DC651CE1
	for <lists+linux-media@lfdr.de>; Tue, 20 Dec 2022 10:10:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229612AbiLTJKF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Dec 2022 04:10:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbiLTJKD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Dec 2022 04:10:03 -0500
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDD1E7661;
        Tue, 20 Dec 2022 01:10:01 -0800 (PST)
Received: by mail-qt1-f178.google.com with SMTP id h26so6616330qtu.2;
        Tue, 20 Dec 2022 01:10:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ZhjR6xVXhmmNThDy/2WcduVvAA5lIhOxqbWgZts2YU=;
        b=Rj5XEgBFaayNCRV8iVcUilP3bw29poWSldD4/kIGm8QZjIebr/ICuiTBU3ZagKTX4y
         uaTgWx4tuQiYN1N2MCNNbssrZRPBeyaXKY1XGhFp6d2Zsj+I5z5feXxabjqDUM7ro9Tp
         iKHtkIalEs8gy0uh9kQZ1AeWf/jU8OqF2FnZqwZiMbNI8lV7kDM2mKW8CdLs/2o+cd7s
         bTLi6UyaduDwZ2HFvkD3xq+BGr9PR4lLyX1+lYq5N/rp4ycITzL+AyxcWP1beGwjOjls
         NRrr6YpyKb/u2b3/R3/5KmiTrPwp9inyVetBT3NENnb2uuh67z8DFtwW+/2T2MWxBPIW
         mXKQ==
X-Gm-Message-State: ANoB5pkSRkXG59fsMvEhzQgGM1+uPdmpZEIAR4TK5kUiQjuA5DajppPF
        1jDJbQg3ysdXaCgYeSjEPw3sObUyW1r4lg==
X-Google-Smtp-Source: AA0mqf7/hLjQxcR2P72YxLZ0jbRxmGG9W/iccVyBzEhS9K/5vtWA65li+sWCU2Jd7G2akWyZ2t6CrA==
X-Received: by 2002:ac8:4a17:0:b0:3a7:e2df:e868 with SMTP id x23-20020ac84a17000000b003a7e2dfe868mr55479215qtq.41.1671527400747;
        Tue, 20 Dec 2022 01:10:00 -0800 (PST)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id u5-20020a05620a430500b006ff8ac9acfdsm8707091qko.49.2022.12.20.01.09.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Dec 2022 01:10:00 -0800 (PST)
Received: by mail-yb1-f176.google.com with SMTP id 203so7707476yby.10;
        Tue, 20 Dec 2022 01:09:59 -0800 (PST)
X-Received: by 2002:a25:7a02:0:b0:6f7:952d:b145 with SMTP id
 v2-20020a257a02000000b006f7952db145mr45769325ybc.604.1671527399695; Tue, 20
 Dec 2022 01:09:59 -0800 (PST)
MIME-Version: 1.0
References: <20221219140139.294245-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20221219140139.294245-8-tomi.valkeinen+renesas@ideasonboard.com>
 <Y6Db2C+JehUPYSQp@pendragon.ideasonboard.com> <2f252958-1bb1-006a-b450-1315be8a3c9f@xs4all.nl>
In-Reply-To: <2f252958-1bb1-006a-b450-1315be8a3c9f@xs4all.nl>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 20 Dec 2022 10:09:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXd7Q1WWdo-rwfad1-BwuuH5vxt9Kx2Zv2Ok2rQLvh_wA@mail.gmail.com>
Message-ID: <CAMuHMdXd7Q1WWdo-rwfad1-BwuuH5vxt9Kx2Zv2Ok2rQLvh_wA@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] drm: rcar-du: Add new formats (2-10-10-10 ARGB, Y210)
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Sakari Ailus <sakari.ailus@iki.fi>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Tue, Dec 20, 2022 at 10:01 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> On 19/12/2022 22:47, Laurent Pinchart wrote:
> > (CC'ing Sakari and Hans)
> >
> > Thank you for the patch.
> >
> > On Mon, Dec 19, 2022 at 04:01:39PM +0200, Tomi Valkeinen wrote:
> >> Add new pixel formats: RGBX1010102, RGBA1010102, ARGB2101010 and Y210.
> >>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >> ---
> >>  drivers/gpu/drm/rcar-du/rcar_du_kms.c | 24 +++++++++++++
> >>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c | 49 +++++++++++++++++++++++++--
> >>  2 files changed, 71 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> >> index 8c2719efda2a..8ccabf5a30c4 100644
> >> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> >> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> >> @@ -259,6 +259,24 @@ static const struct rcar_du_format_info rcar_du_format_infos[] = {
> >>              .bpp = 32,
> >>              .planes = 1,
> >>              .hsub = 1,
> >> +    }, {
> >> +            .fourcc = DRM_FORMAT_RGBX1010102,
> >
> > Ah, here the format makes sense.
> >
> >> +            .v4l2 = V4L2_PIX_FMT_XBGR2101010,
> >
> > But this is horrible :-( Could we use the same names as DRM for new
> > formats, when there is no conflict with existing V4L2 formats ?
> >
> > Sakari, Hans, what do you think ? Please see patch 1/7 in the series for
> > the format definitions.
>
> V4L2 describes pixel formats based on how they appear in memory from the
> lowest to highest memory address.

So that means big endian?

> If I am not mistaken, DRM uses the CPU order. So that explains the difference
> in naming. I don't think we should hide that difference. And V4L2 has been
> quite consistent in following memory ordering in the naming (except possibly
> for some of the really old pixelformats).

DRM uses little endian.

> Departing from that would be more of a hindrance than a help, IMHO.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
