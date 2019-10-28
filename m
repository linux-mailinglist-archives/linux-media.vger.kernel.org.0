Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0CDAE7622
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2019 17:30:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391005AbfJ1QaT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Oct 2019 12:30:19 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:35373 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730711AbfJ1QaS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Oct 2019 12:30:18 -0400
Received: by mail-io1-f67.google.com with SMTP id h9so11457947ioh.2;
        Mon, 28 Oct 2019 09:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V/+YXkmrDex7nEr+gkqIoyiFItObqxb735/pgi9TyOw=;
        b=IEVfVXYqi71X+5wVl3Ese6uVmR7+J/VABWSAUt7H4jonMAuWXEZACHPKzDWU8PaTdQ
         lRfIaqsTOOqdC5QeAI95fcxyC2ALi8O2yrs7v2oszQwXMyqLSeu98BMk8/d4Y4HOTZCW
         Ip3dgukKFPd8Z+K/JVq17v79VV8bhl5POK/5YviTYJ19ZSLcyB1vPkcQbC3dx6E+1Op8
         rxl6p/utkpHicJVLDdRasCAKRULk6rq0gId0DIzIyLkCjkQOmXS+tziKwY5XhuGq6VVm
         /TMxt+tb3v26IeEHYmc44XaG8cjhvOKaMysrOafos6Iyr3V6O8RhD5xbccRIugY0lNxW
         YRbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V/+YXkmrDex7nEr+gkqIoyiFItObqxb735/pgi9TyOw=;
        b=lAlegK43bXiqqDJ/+mdRkMMG03p1L60y4ffqLHscu+ctWKwtZpLyFim/8LG5HhouJj
         LcsGg3WVviR2JK4RrxbZ2SQ5BVnvBhulg5Q5449mVOQXTkXi+8OdV2gVv0mvOi7dP/oS
         WD+jF1889qvC/O9fJJR0887TxuXmndUJtQB5zDOQ+1qxZxlwLi78CScvWKJNzMPwrzuc
         /PwBrliA0x88Xj5PSZhYCEhnfnaMsiRp60+EYAC5FpiS/xbFQ/bGwWm17EASGcB41eLt
         jpeEXLhEQCn5JXYd0OvE++RveCvXPdb3qtvC0UzLpsqO4Itz2198JXx6ewFt++ka1vWE
         J4pg==
X-Gm-Message-State: APjAAAVKH+x4qeIv4oNjpbdvAgdPLzbvkaRSL4fvcmdc5AuaUZ5Ykh3K
        MUQfRMASqIvhP8FB7ndmHn7PXAgHotOa2rNdGeU=
X-Google-Smtp-Source: APXvYqzk/zLyOx63qqddiGsEf2n1A10g0Xbr4HwW628LXscP5JAk3K//9Mo38REgUHJBpGQfWEZeoUeMnJ3rGvH8ZNI=
X-Received: by 2002:a02:330e:: with SMTP id c14mr18313186jae.5.1572280217811;
 Mon, 28 Oct 2019 09:30:17 -0700 (PDT)
MIME-Version: 1.0
References: <20191026042519.29446-1-navid.emamdoost@gmail.com> <d9c04318-586a-bfc2-fce6-6218c6bab1d6@linux.intel.com>
In-Reply-To: <d9c04318-586a-bfc2-fce6-6218c6bab1d6@linux.intel.com>
From:   Navid Emamdoost <navid.emamdoost@gmail.com>
Date:   Mon, 28 Oct 2019 11:30:06 -0500
Message-ID: <CAEkB2EQXmHJoMJJJULHHFy4gp6a=QiCe5SoxkWehnpKWNVw=_A@mail.gmail.com>
Subject: Re: [PATCH] media: aspeed-video: Fix memory leaks in aspeed_video_probe
To:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc:     linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
        Kangjie Lu <kjlu@umn.edu>, openbmc@lists.ozlabs.org,
        Eddie James <eajames@linux.ibm.com>,
        linux-media@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Navid Emamdoost <emamd001@umn.edu>,
        Stephen McCamant <smccaman@umn.edu>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 28, 2019 at 11:27 AM Jae Hyun Yoo
<jae.hyun.yoo@linux.intel.com> wrote:
>
> Hi Navid,
>
> On 10/25/2019 9:25 PM, Navid Emamdoost wrote:
> > In the implementation of aspeed_video_probe() the allocated memory for
> > video should be released in case of failure. Release video if either
> > devm_ioremap_resource() or aspeed_video_init() or
> > aspeed_video_setup_video() fails.
> >
> > Fixes: d2b4387f3bdf ("media: platform: Add Aspeed Video Engine driver")
> > Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
> > ---
> >   drivers/media/platform/aspeed-video.c | 14 ++++++++++----
> >   1 file changed, 10 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> > index eb12f3793062..8c473356132d 100644
> > --- a/drivers/media/platform/aspeed-video.c
> > +++ b/drivers/media/platform/aspeed-video.c
> > @@ -1663,18 +1663,24 @@ static int aspeed_video_probe(struct platform_device *pdev)
> >
> >       video->base = devm_ioremap_resource(video->dev, res);
> >
> > -     if (IS_ERR(video->base))
> > -             return PTR_ERR(video->base);
> > +     if (IS_ERR(video->base)) {
> > +             rc = PTR_ERR(video->base);
> > +             goto free_video;
> > +     }
> >
> >       rc = aspeed_video_init(video);
> >       if (rc)
> > -             return rc;
> > +             goto free_video;
> >
> >       rc = aspeed_video_setup_video(video);
> >       if (rc)
> > -             return rc;
> > +             goto free_video;
> >
> >       return 0;
> > +
> > +free_video:
> > +     kfree(video);
> > +     return rc;
> >   }
> >
> >   static int aspeed_video_remove(struct platform_device *pdev)
> >
>
> Can we simply change kzalloc in aspeed_video_probe with devm_kzalloc
> so that we don't need to take care of freeing of video? I think it would
> be more simpler.

Sounds a neat plan, will send v2.

>
> Cheers,
>
> Jae



-- 
Navid.
