Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C69623ACE5
	for <lists+linux-media@lfdr.de>; Mon,  3 Aug 2020 21:21:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727864AbgHCTVM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Aug 2020 15:21:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726906AbgHCTVL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Aug 2020 15:21:11 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50EA5C061756
        for <linux-media@vger.kernel.org>; Mon,  3 Aug 2020 12:21:11 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id x9so40940269ljc.5
        for <linux-media@vger.kernel.org>; Mon, 03 Aug 2020 12:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=dq93D4eYKRlwEpphUZG+JqVe46lHekIPQvei+XVFGC0=;
        b=kh2E9KHQE/XA0rLX/iC/gPSSg8GAI6bxQ/3ToX/6wlqrLLyzRl/IvlgX8y6idUVwvM
         fXACsuXASck6iTy2GRLvfo30VY5Y45ulGDfEvWdR1+g7mhrIhVG5qg7WH4bhAd4Nz5P1
         yOQmwo3u2cxAj9Z9L34d1ZVkvJG9NaWAH3lpeetGso8HH2W9RSptF3cWB8VEBiPsMaCE
         lAnKtsrxinzo4m+lMMKSUq+0dhGeUjIK6SbXR+dAzd684ycDvPAvUKrhiujO3g5IqTkm
         WqWoyCtBWRCYUK78icUxHyO5wq4xABKyzVPX+g9PSzlkPpMdHLggbswqeoTtW8NXYlDP
         OcYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=dq93D4eYKRlwEpphUZG+JqVe46lHekIPQvei+XVFGC0=;
        b=Dvfe2PnVC04XzVClkDNPdFJhQ9X28dX/88+v4I2XKy3odJo3xBp/e5k9GLQki/6Hc0
         7ssT8VJ4GKu0r+TmFzXwhwyXY16hUaa2cOkqxDPK3PTogbpTA1LJQCO646PZ+2eSKy/W
         oBN8dOaHYAx3MyDJCQZee/r7xsMhndzqak8vHhj8V89nx70c5G81FoGHcu3ZW/3c2BvQ
         bacHPEfhitwH69GAsXORX6bDK6mwrJ9+eoZN+Hi50yeD8RKSNgKlzpEeYr7k9CXhLAlW
         jIWKe/EqgmwzVlJBYvkhHr9XMIKp2Ihy0K4O1bMIX+Gdt9d0UjMeKiNenIq193xSRjRE
         jVlQ==
X-Gm-Message-State: AOAM532C43pU3ydDxa55lj/4TaAQyz2JyltE0KRhFAoeLKp6yBA/ozex
        nvj6YhYrjLq1Vt7DDVshZwa1Ag==
X-Google-Smtp-Source: ABdhPJy3eRvRbj9RoqYJEWqYxIVENlU0mkGG5C5St7U52+cSn1++CTkcOhmFdfcWlotWF3Kw7Eqt8Q==
X-Received: by 2002:a2e:5801:: with SMTP id m1mr8351358ljb.281.1596482469687;
        Mon, 03 Aug 2020 12:21:09 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id v26sm4555934lji.65.2020.08.03.12.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2020 12:21:08 -0700 (PDT)
Date:   Mon, 3 Aug 2020 21:21:08 +0200
From:   Niklas <niklas.soderlund@ragnatech.se>
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-media <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH] media: rcar-vin: Update crop and compose settings for
 every s_fmt call
Message-ID: <20200803192108.GB2297236@oden.dyn.berto.se>
References: <1596187745-31596-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200801090456.GB1379367@oden.dyn.berto.se>
 <CA+V-a8sOHct_JetCsug8Z2BQpMLH2p39hj2XNw_1N5gkBQp1Gg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+V-a8sOHct_JetCsug8Z2BQpMLH2p39hj2XNw_1N5gkBQp1Gg@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Lad, Hans,

On 2020-08-03 19:11:32 +0100, Lad, Prabhakar wrote:
> Hi Hans,
> 
> On Sat, Aug 1, 2020 at 10:04 AM Niklas <niklas.soderlund@ragnatech.se> wrote:
> >
> > Hi Lad,
> >
> > Thanks for your work.
> >
> > On 2020-07-31 10:29:05 +0100, Lad Prabhakar wrote:
> > > The crop and compose settings for VIN in non mc mode werent updated
> > > in s_fmt call this resulted in captured images being clipped.
> > >
> > > With the below sequence on the third capture where size is set to
> > > 640x480 resulted in clipped image of size 320x240.
> > >
> > > high(640x480) -> low (320x240) -> high (640x480)
> > >
> > > This patch makes sure the VIN crop and compose settings are updated.
> >
> > This is clearly an inconsistency in the VIN driver that should be fixed.
> > But I think the none-mc mode implements the correct behavior. That is
> > that S_FMT should not modify the crop/compose rectangles other then make
> > sure they don't go out of bounds. This is an area we tried to clarify in
> > the past but I'm still not sure what the correct answer to.
> >
> What should be the exact behaviour of the bridge driver  for s_fmt
> call. Should the crop/compose settings be updated for every s_fmt
> callback or should they be only updated on s_selection callback.
> Currently the non-mc rcar-vin doesnt update the crop/compose setting
> in s_fmt callback due to which I see the above issue as mentioned.

This is not entirely correct. It does update the crop and compose 
rectangles on s_fmt, it makes sure they are not out-of-bounds for the 
new format if it's accepted by s_fmt. See v4l2_rect_map_inside() calls 
in the snippet bellow.

That being said there is a difference how this is handled in the VIN 
driver between it's MC and non-MC modes and I would love to learn the 
correct mode of operation and seeing VIN being updated to doing it 
correct in both cases. Thanks Lad for dealing with this!

> 
> Cheers,
> Prabhakar
> 
> > >
> > > Fixes: 104464f573d ("media: rcar-vin: Do not reset the crop and compose rectangles in s_fmt")
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > >  drivers/media/platform/rcar-vin/rcar-v4l2.c | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > >
> > > diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > > index f421e25..a9b13d9 100644
> > > --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > > +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > > @@ -319,6 +319,12 @@ static int rvin_s_fmt_vid_cap(struct file *file, void *priv,
> > >       fmt_rect.width = vin->format.width;
> > >       fmt_rect.height = vin->format.height;
> > >
> > > +     vin->crop.top = 0;
> > > +     vin->crop.left = 0;
> > > +     vin->crop.width = vin->format.width;
> > > +     vin->crop.height = vin->format.height;
> > > +     vin->compose = vin->crop;
> > > +
> > >       v4l2_rect_map_inside(&vin->crop, &src_rect);
> > >       v4l2_rect_map_inside(&vin->compose, &fmt_rect);
> > >       vin->src_rect = src_rect;
> > > --
> > > 2.7.4
> > >
> >
> > --
> > Regards,
> > Niklas Söderlund

-- 
Regards,
Niklas Söderlund
