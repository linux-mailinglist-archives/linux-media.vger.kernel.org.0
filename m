Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6A022F5110
	for <lists+linux-media@lfdr.de>; Wed, 13 Jan 2021 18:25:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728162AbhAMRXr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jan 2021 12:23:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728091AbhAMRXr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jan 2021 12:23:47 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3F15C061786
        for <linux-media@vger.kernel.org>; Wed, 13 Jan 2021 09:23:06 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id g21so2802804edy.0
        for <linux-media@vger.kernel.org>; Wed, 13 Jan 2021 09:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4AwPN586eSy4mbXN3tKGamNWI7spdXbsGdw+y/Zgc3E=;
        b=nWlCyj5TF4VhJbErT9LiR9QoH6NTt2uP2bbpbU3bVRsUyL9hE7Yb8n43G/TyYE+YAK
         ETT5zKDsblOwhu+JBn4JC6OmNTbYzIFTkBZ5QK97Uq+LdLR7drY2cEmAk5Du1I5xq/Yk
         f34ENIv6phGTxkBjDU3/xd25hXSDAk4KsZvfOv/643fIkhFSshIk5ugasKpiBsT868D6
         46Em0HZolk9xa7NB2/c5twVrxseqVHVwl6ysgeWqR6LUToRGg1J4ynkkvUEM5g5Vqbp2
         fyYhyz53rZ5e0SlRmGT6qXs395AFF0NydzrQQ9XPtgtQjDVB03y5kQ5gJikyO6wAdvrg
         A9+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4AwPN586eSy4mbXN3tKGamNWI7spdXbsGdw+y/Zgc3E=;
        b=igt/WOr7IA7PIDfrJp0VVq/ZbTaPrdoy+wHCfpzocmEoqGIxuSiTBCsUhwKZjfAKYq
         5Y0ZParfyiC3KvjEzgCf0PzldebQ7lO1MVcRBKjp6jj1M8mJkzQ/I6AJqqd3f5gljexv
         fZmi4TSR+hFF1QoUgUzcU4vRFqCrTGoFQzygdhjeWissZGx+o7xY5tkd/vk8nrkIrNo0
         ICfHhLO+biKkiEXWm4saLMRbDTJi05N37eh5T0ZtyIaqkPb/py6WhGOS/bdBr/KYE3Im
         GIFEpiJVbJwcZ2NNVnI5khrxOJPGPPLspuahObxzAFGOUy7pF7mRMMlhEX6ygVvKfoGN
         RWtQ==
X-Gm-Message-State: AOAM533I8z/dsIxJNRYUQ3BZLHzyzC0gdl+3iUP5w5TOgdi9vdatdan4
        ofZR2EgDTFbP4qPfA8AHyhsb30nQn0uaiih3Y/gnuw==
X-Google-Smtp-Source: ABdhPJywHg1wYzXYJj4cTNqUA6DSMYVdgcXGZDE1A5/kG7PCatw9Ngxgx3Ru0sk7d+ltP1Bi3TVOJZMxaXS91FnY9sY=
X-Received: by 2002:a05:6402:3048:: with SMTP id bu8mr2620460edb.49.1610558585482;
 Wed, 13 Jan 2021 09:23:05 -0800 (PST)
MIME-Version: 1.0
References: <20210113090027.234403-1-tomi.valkeinen@ideasonboard.com> <d3b141f5-7e72-befd-9e09-4fe1ff63effd@ideasonboard.com>
In-Reply-To: <d3b141f5-7e72-befd-9e09-4fe1ff63effd@ideasonboard.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Wed, 13 Jan 2021 14:22:53 -0300
Message-ID: <CAAEAJfAu2ZmGET-nSW20gGfKc8gOLdcSqQhm4Xs6cVE-D8oiBQ@mail.gmail.com>
Subject: Re: [PATCH] media: ti-vpe: cal: fix write to unallocated memory
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Benoit Parrot <bparrot@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media <linux-media@vger.kernel.org>,
        stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 13 Jan 2021 at 06:08, Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> On 13/01/2021 11:00, Tomi Valkeinen wrote:
> > The asd allocated with v4l2_async_notifier_add_fwnode_subdev() must be
> > of size cal_v4l2_async_subdev, otherwise access to
> > cal_v4l2_async_subdev->phy will go to unallocated memory.
> >
> > Fixes: 8fcb7576ad19 ("media: ti-vpe: cal: Allow multiple contexts per subdev notifier")
> > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>
> Ah, I forgot to add:
>
> Cc: stable@vger.kernel.org # 5.9+
>

Nice catch. I missed users of v4l2_async_notifier_add_fwnode_subdev
in my recent cleanup series.

Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>

Thanks,
Ezequiel

> > ---
> >  drivers/media/platform/ti-vpe/cal.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> > index 59a0266b1f39..2eef245c31a1 100644
> > --- a/drivers/media/platform/ti-vpe/cal.c
> > +++ b/drivers/media/platform/ti-vpe/cal.c
> > @@ -406,7 +406,7 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
> >   */
> >
> >  struct cal_v4l2_async_subdev {
> > -     struct v4l2_async_subdev asd;
> > +     struct v4l2_async_subdev asd; /* Must be first */
> >       struct cal_camerarx *phy;
> >  };
> >
> > @@ -472,7 +472,7 @@ static int cal_async_notifier_register(struct cal_dev *cal)
> >               fwnode = of_fwnode_handle(phy->sensor_node);
> >               asd = v4l2_async_notifier_add_fwnode_subdev(&cal->notifier,
> >                                                           fwnode,
> > -                                                         sizeof(*asd));
> > +                                                         sizeof(*casd));
> >               if (IS_ERR(asd)) {
> >                       phy_err(phy, "Failed to add subdev to notifier\n");
> >                       ret = PTR_ERR(asd);
> >
