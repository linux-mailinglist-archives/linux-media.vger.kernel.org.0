Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEC25500652
	for <lists+linux-media@lfdr.de>; Thu, 14 Apr 2022 08:45:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234960AbiDNGr0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Apr 2022 02:47:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229958AbiDNGrZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Apr 2022 02:47:25 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDDCE3F301
        for <linux-media@vger.kernel.org>; Wed, 13 Apr 2022 23:44:59 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id i20so7730360ybj.7
        for <linux-media@vger.kernel.org>; Wed, 13 Apr 2022 23:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+BHaUPDYjtCk6+KOLAOUy1HXedsH11VqoKXE1Y0HAEw=;
        b=EDNliRwoHPvz6v+LFmGj5znprUw9ee3TKEO08+5vAuG1s8EvHjdga4wBQmxvvZkeu8
         FpVkUp4bAtLkc160jS9UoHVLjZKB3sKZdVGXqoN0Y85zxjoA962aG3seVXUHCtmuOrRN
         wbfiwOciAHU+8ZbDU2xMCFWSX4ME4GHfSIs3KqQSPT/1r9GXSjwr1/LJUc6iwQ0h3p+Z
         Jy27ffjuIHUzjL9mcp5ZZi3wydZNhvjZo9sbke9Tq6wEYYCeQYGhedPRZ11VO6eGxL6u
         5VLn8IT4yc1y3Odgox8mRnghq9sweoqvWUX28vWDNNffDc4RZF58lDlMBoU0GU/9KG1t
         BWYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+BHaUPDYjtCk6+KOLAOUy1HXedsH11VqoKXE1Y0HAEw=;
        b=cqdZngC+Z4RAhfVMd45joxnkrZRdqhkbf+WWjhXE0f4GB3rdI40xhHLaVVQe8P+MaL
         R+63mbdhFUYZfb6nE3MHhWO3yjjhfKcB40Yxs2vir6ZwbQzU9aC4dJRrclbdh0AFP5K2
         1FnAcFt46pOWc4xPW+58QrED3e3s+TUH6Qv+s8DBc7zYc0CLwlghux+6aO2q1Hey5W9g
         rpq4RXKhc/LefG+0qMTes4Un4+MfuJjva+YqcQkK2xthucJSbdeDzko1CUYcBeTpHznn
         mK9C6jvbELVqK1ODm3F0YiqGOHYCyLO4gwN4U2EsSIlYv9Ow7AjG/HmFfFdixv2g4tju
         0IKw==
X-Gm-Message-State: AOAM533TgXtGwDw/TgeEG4XAXHsMAUrbh7/dBtA0fgVXxV9CdSogQfk5
        jVisfD3YU8jmWw9wAZQBuQREZJCh6I7IlvmIGnnF9Q==
X-Google-Smtp-Source: ABdhPJw6l/n+dtT44rmKSrI7ESrZ5C5CHP516tuTqQvmSC89LvxAjsAtOkXegLf141l+bTidHwfoWdDLyEXJ7QHhhDg=
X-Received: by 2002:a25:2ccb:0:b0:641:aa36:b819 with SMTP id
 s194-20020a252ccb000000b00641aa36b819mr778678ybs.332.1649918698984; Wed, 13
 Apr 2022 23:44:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220412062313.1645762-1-yunkec@google.com> <Yle8zUUjbVW392Gc@paasikivi.fi.intel.com>
In-Reply-To: <Yle8zUUjbVW392Gc@paasikivi.fi.intel.com>
From:   Yunke Cao <yunkec@google.com>
Date:   Thu, 14 Apr 2022 15:44:47 +0900
Message-ID: <CANqU6Fd1ixjcTTLG5gfFmkXfd9znvBwmxrni3c4yX-0mP=mS2g@mail.gmail.com>
Subject: Re: [PATCH] media: entity: skip non-data link when removing reverse links
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Daniel Scally <djrscally@gmail.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari!

Thanks for the review. See my reply inline.

On Thu, Apr 14, 2022 at 3:19 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Yunke,
>
> Thanks for the patch.
>
> On Tue, Apr 12, 2022 at 03:23:13PM +0900, Yunke Cao wrote:
> > The original implementation removes reverse links for any input link and
> > assumes the presense of sink/source.
> > It fails when the link is a not a data link.
> > media_entity_remove_links when there's an ancillary link can also fail.
>
> The function's return type is void. Are there other adverse effects from
> this? Looking at the function, it would seem like that the reverse link
> simply isn't found in this case, and so not removed.
>
The function dereferences without any check link->source and link->sink
("link->source->entity == entity" etc.), which is in union.
Ancillary links populate gobj0/gobj1 instead of source/sink.
Calling this function on ancillary links can cause crashes.
> >
> > We only need to remove reverse links for a data link.
>
> Ideally this would not be based on the link flags as it's not a very robust
> way to test whather a backlink needs to be removed.
>
I was mainly trying to make sure link->source and link->sink are
populated by checking the link type.
Currently, only data links need to run this part of the code to remove
reverse links so I feel this is
the easiest way. Let me know if there's any better alternative.
> >
> > Signed-off-by: Yunke Cao <yunkec@google.com>
> > ---
> >  drivers/media/mc/mc-entity.c | 34 +++++++++++++++++++---------------
> >  1 file changed, 19 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> > index 1ff60d411ea9..11f5207f73aa 100644
> > --- a/drivers/media/mc/mc-entity.c
> > +++ b/drivers/media/mc/mc-entity.c
> > @@ -597,26 +597,30 @@ static void __media_entity_remove_link(struct media_entity *entity,
> >       struct media_link *rlink, *tmp;
> >       struct media_entity *remote;
> >
> > -     if (link->source->entity == entity)
> > -             remote = link->sink->entity;
> > -     else
> > -             remote = link->source->entity;
> > +     /* Remove the reverse links for a data link. */
> > +     if ((link->flags & MEDIA_LNK_FL_LINK_TYPE) == MEDIA_LNK_FL_DATA_LINK) {
> > +             if (link->source->entity == entity)
> > +                     remote = link->sink->entity;
> > +             else
> > +                     remote = link->source->entity;
> >
> > -     list_for_each_entry_safe(rlink, tmp, &remote->links, list) {
> > -             if (rlink != link->reverse)
> > -                     continue;
> > +             list_for_each_entry_safe(rlink, tmp, &remote->links, list) {
> > +                     if (rlink != link->reverse)
> > +                             continue;
> >
> > -             if (link->source->entity == entity)
> > -                     remote->num_backlinks--;
> > +                     if (link->source->entity == entity)
> > +                             remote->num_backlinks--;
> >
> > -             /* Remove the remote link */
> > -             list_del(&rlink->list);
> > -             media_gobj_destroy(&rlink->graph_obj);
> > -             kfree(rlink);
> > +                     /* Remove the remote link */
> > +                     list_del(&rlink->list);
> > +                     media_gobj_destroy(&rlink->graph_obj);
> > +                     kfree(rlink);
> >
> > -             if (--remote->num_links == 0)
> > -                     break;
> > +                     if (--remote->num_links == 0)
> > +                             break;
> > +             }
> >       }
> > +
> >       list_del(&link->list);
> >       media_gobj_destroy(&link->graph_obj);
> >       kfree(link);
>
> --
> Kind regards,
>
> Sakari Ailus

Thanks!
Yunke
