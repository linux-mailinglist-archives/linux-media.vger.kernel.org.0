Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60429651D77
	for <lists+linux-media@lfdr.de>; Tue, 20 Dec 2022 10:34:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233329AbiLTJei (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Dec 2022 04:34:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233453AbiLTJeM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Dec 2022 04:34:12 -0500
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF8C6186A5;
        Tue, 20 Dec 2022 01:33:59 -0800 (PST)
Received: by mail-qv1-f41.google.com with SMTP id q10so7913070qvt.10;
        Tue, 20 Dec 2022 01:33:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WpdfPBP970vLU8Qrw/EG17JgG4XDBxab8NOfDbJupFY=;
        b=XXzuzFhc21SmukSlrPRXTTXaXbWecesRICEvGQi1M24PoCRPteA89rz7BI3nFgcE8s
         D/wmVBMPF1m/lbyP7gqeXphhGzkDd5QXiO1hSbMnfOgUY3fyuRn4a6AdAw2EbcYwgIfz
         l2RHcm5dikNF1N1ihoPUUxMrIxoloqa/4g09xrv0Q3prnW2b0UqnTb39/f6l85S0iXvU
         +1Fp6skjUMyYaHHFVAFialu99vp03O7u8TraWMXN6Bt6Trs9wQe414q8vs9nBSyuN2q+
         +l2Q1GNwxBu8mtY8t66OPVKWme89jg9UcD1wgqsbbJazrervai3WEv7QUIYdeVzbPV43
         iUmQ==
X-Gm-Message-State: ANoB5pnB29U/jB0VUI7+Eu/3x06QKQp9QpvEotQNCHWc1x+DfISFagpJ
        KC2+0AWa3mG0c3sscTLAbnLs/ahb/pEgnA==
X-Google-Smtp-Source: AA0mqf5e755f7K6LsHtDF+2TvPguguEg640GTYG+QUTqnKez29W4B6NohvOq44e1nmjIFsKYQVUusA==
X-Received: by 2002:a0c:a951:0:b0:4c7:32b8:c5ba with SMTP id z17-20020a0ca951000000b004c732b8c5bamr63571944qva.45.1671528838889;
        Tue, 20 Dec 2022 01:33:58 -0800 (PST)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id c25-20020a05620a269900b006fc447eebe5sm8689507qkp.27.2022.12.20.01.33.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Dec 2022 01:33:58 -0800 (PST)
Received: by mail-yb1-f179.google.com with SMTP id e141so12322523ybh.3;
        Tue, 20 Dec 2022 01:33:58 -0800 (PST)
X-Received: by 2002:a25:9:0:b0:6f9:29ef:a5ee with SMTP id 9-20020a250009000000b006f929efa5eemr40430651yba.380.1671528837883;
 Tue, 20 Dec 2022 01:33:57 -0800 (PST)
MIME-Version: 1.0
References: <20221219140139.294245-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20221219140139.294245-8-tomi.valkeinen+renesas@ideasonboard.com>
 <Y6Db2C+JehUPYSQp@pendragon.ideasonboard.com> <2f252958-1bb1-006a-b450-1315be8a3c9f@xs4all.nl>
 <CAMuHMdXd7Q1WWdo-rwfad1-BwuuH5vxt9Kx2Zv2Ok2rQLvh_wA@mail.gmail.com> <b503589a-7b82-3335-8ea3-598d467f5d40@xs4all.nl>
In-Reply-To: <b503589a-7b82-3335-8ea3-598d467f5d40@xs4all.nl>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 20 Dec 2022 10:33:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWS+jOeFcHU=gQcaYdOMCk9oruSWiuCX-voXAbx61yYuA@mail.gmail.com>
Message-ID: <CAMuHMdWS+jOeFcHU=gQcaYdOMCk9oruSWiuCX-voXAbx61yYuA@mail.gmail.com>
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
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Tue, Dec 20, 2022 at 10:22 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> On 20/12/2022 10:09, Geert Uytterhoeven wrote:
> > On Tue, Dec 20, 2022 at 10:01 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> >> On 19/12/2022 22:47, Laurent Pinchart wrote:
> >>> (CC'ing Sakari and Hans)
> >>>
> >>> Thank you for the patch.
> >>>
> >>> On Mon, Dec 19, 2022 at 04:01:39PM +0200, Tomi Valkeinen wrote:
> >>>> Add new pixel formats: RGBX1010102, RGBA1010102, ARGB2101010 and Y210.
> >>>>
> >>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >>>> ---
> >>>>  drivers/gpu/drm/rcar-du/rcar_du_kms.c | 24 +++++++++++++
> >>>>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c | 49 +++++++++++++++++++++++++--
> >>>>  2 files changed, 71 insertions(+), 2 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> >>>> index 8c2719efda2a..8ccabf5a30c4 100644
> >>>> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> >>>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> >>>> @@ -259,6 +259,24 @@ static const struct rcar_du_format_info rcar_du_format_infos[] = {
> >>>>              .bpp = 32,
> >>>>              .planes = 1,
> >>>>              .hsub = 1,
> >>>> +    }, {
> >>>> +            .fourcc = DRM_FORMAT_RGBX1010102,
> >>>
> >>> Ah, here the format makes sense.
> >>>
> >>>> +            .v4l2 = V4L2_PIX_FMT_XBGR2101010,
> >>>
> >>> But this is horrible :-( Could we use the same names as DRM for new
> >>> formats, when there is no conflict with existing V4L2 formats ?
> >>>
> >>> Sakari, Hans, what do you think ? Please see patch 1/7 in the series for
> >>> the format definitions.
> >>
> >> V4L2 describes pixel formats based on how they appear in memory from the
> >> lowest to highest memory address.
> >
> > So that means big endian?
>
> Yes.
>
> >> If I am not mistaken, DRM uses the CPU order. So that explains the difference
> >> in naming. I don't think we should hide that difference. And V4L2 has been
> >> quite consistent in following memory ordering in the naming (except possibly
> >> for some of the really old pixelformats).
> >
> > DRM uses little endian.
>
> So not CPU order, but always little endian order? I.e., on a big endian system
> a given DRM_FORMAT_ would have the same memory layout as on a little endian
> system?

Indeed. Big-endian formats must set the DRM_FORMAT_BIG_ENDIAN flag:

    #define DRM_FORMAT_BIG_ENDIAN (1U<<31) /* format is big endian
instead of little endian */

unless the big-endian format has a standard (little-endian) equivalent:

Old PPC drivers may violate that, so there is some quirk handling...

/*
 * DRM formats are little endian.  Define host endian variants for the
 * most common formats here, to reduce the #ifdefs needed in drivers.
 *
 * Note that the DRM_FORMAT_BIG_ENDIAN flag should only be used in
 * case the format can't be specified otherwise, so we don't end up
 * with two values describing the same format.
 */
#ifdef __BIG_ENDIAN
# define DRM_FORMAT_HOST_XRGB1555     (DRM_FORMAT_XRGB1555         |    \
                                       DRM_FORMAT_BIG_ENDIAN)
# define DRM_FORMAT_HOST_RGB565       (DRM_FORMAT_RGB565           |    \
                                       DRM_FORMAT_BIG_ENDIAN)
# define DRM_FORMAT_HOST_XRGB8888     DRM_FORMAT_BGRX8888
# define DRM_FORMAT_HOST_ARGB8888     DRM_FORMAT_BGRA8888
#else
# define DRM_FORMAT_HOST_XRGB1555     DRM_FORMAT_XRGB1555
# define DRM_FORMAT_HOST_RGB565       DRM_FORMAT_RGB565
# define DRM_FORMAT_HOST_XRGB8888     DRM_FORMAT_XRGB8888
# define DRM_FORMAT_HOST_ARGB8888     DRM_FORMAT_ARGB8888
#endif

However, given the number of bugs related to big-endian formats,
I doubt DRM has any real use on big-endian hardware (i.e. not
counting hobbyists trying to migrate from fbdev to DRM ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
