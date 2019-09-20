Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 057D9B9168
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2019 16:09:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387614AbfITOJ4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Sep 2019 10:09:56 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:36746 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727273AbfITOJz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Sep 2019 10:09:55 -0400
Received: by mail-ot1-f65.google.com with SMTP id 67so6318033oto.3
        for <linux-media@vger.kernel.org>; Fri, 20 Sep 2019 07:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6mjOvNkyDJoUSFzKGpJ6UrFxyHGBEfjS8CehN7hW8uc=;
        b=IUsghactGUSl6Ol/d/2VhnjvoAr+YlQHUC/c0qe9PMfYqT/ISK8Di3bYPBxeT7ocb/
         pcyy5OqOHXmhr9Xp8301d0Ue7pRfI3C296ej3asCopooKDJpLTJlUF25tP+Ir04wV3DG
         dxFA5D0I2DSAn/F5tbfQf2htRtrgS7CeFVHgI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6mjOvNkyDJoUSFzKGpJ6UrFxyHGBEfjS8CehN7hW8uc=;
        b=HEYek8RkAsOjr4q/z15Hnvl7/GSYLXcu7qbVqzh6JycvmSKytO89LI3ADRiebgQkXn
         LjYJaUUpg1a9KD4DyDfGCG3BzsVmlhymif3RE4I1GXz7vo4Z78NbXs2MZv1ep5PKoK5x
         tE2ogc7Hc+ZIAjjlqqqdLKvTcUsYYGX3E5C6HHKB2Qn6vRABfsg4KEOMh4iybjLnarGU
         ZxPOEY+r9MjU41RebtGYwP3OvbrAcNNMOBWhvGs+cfnjZ7qrSvLSizxDcpLj5KE+0B/o
         ShwKJ9tpXLZEzrQ1fvSWr8k9COSVadfv4frLuJJKLNIJwihE9nnYE1+jYBjwPdP77Vyp
         X0bg==
X-Gm-Message-State: APjAAAWHnq3ABqM2djWpovGB+Ye7CFR6v1gLaH0Pfp8pUILkoMFm3O0E
        P8A04PfwNegOvRCm05f+yO4JH3SMYk7DkiMuHFoFcDIk
X-Google-Smtp-Source: APXvYqw8acnX2GcC9Dyed1nYa3MJdYIi+Pq96RFyfi7GNbQ3fX6lT8nIXYdzYEjXqDhGkzFqiYjWRtzFCinQgM/+wKA=
X-Received: by 2002:a9d:7006:: with SMTP id k6mr11469082otj.303.1568988595029;
 Fri, 20 Sep 2019 07:09:55 -0700 (PDT)
MIME-Version: 1.0
References: <156821693963.2951081.11214256396118531359.stgit@dwillia2-desk3.amr.corp.intel.com>
 <434c05bddd2b364e607e565227487910a8dd9793.1568391461.git.mchehab+samsung@kernel.org>
 <20190918123620.GA6306@pendragon.ideasonboard.com> <20190918105728.24e7eb48@coco.lan>
 <20190918172705.GC4734@pendragon.ideasonboard.com> <20190918154831.3dd0d040@coco.lan>
 <20190919070856.GG2959@kadam> <cfbe9a092f60f1ce5d1fb3ab5260dd56193bd8fb.camel@perches.com>
In-Reply-To: <cfbe9a092f60f1ce5d1fb3ab5260dd56193bd8fb.camel@perches.com>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Fri, 20 Sep 2019 16:09:43 +0200
Message-ID: <CAKMK7uFrvjMDng7Ko17CPLFfiNhTw5jABi52w7P9v_3qj3350A@mail.gmail.com>
Subject: Re: [Ksummit-discuss] [PATCH] media: add a subsystem profile documentation
To:     Joe Perches <joe@perches.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        ksummit <ksummit-discuss@lists.linuxfoundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Sep 20, 2019 at 1:27 PM Joe Perches <joe@perches.com> wrote:
>
> On Thu, 2019-09-19 at 10:08 +0300, Dan Carpenter wrote:
> > On Wed, Sep 18, 2019 at 03:48:31PM -0300, Mauro Carvalho Chehab wrote:
> > > Em Wed, 18 Sep 2019 20:27:05 +0300
> > > Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:
> > >
> > > > > Anyway, not sure if the other sub-maintainers see the same way. From my side,
> > > > > I prefer not to be c/c, as this is just more noise, as I just rely on
> > > > > patchwork for media patches. What about changing this to:
> > > > >
> > > > >         Patches for the media subsystem should be sent to the media mailing list
> > > > >         at linux-media@vger.kernel.org as plain text only e-mail. Emails with
> > > > >         HTML will be automatically rejected by the mail server. It could be wise
> > > > >         to also copy the sub-maintainer(s).
> > > >
> > > > That works for me. As this is really a personal preference, is there a
> > > > way it could be encoded in MAINTAINERS in a per-person fashion ?
> > > > Something that would allow you to opt-out from CC from linux-media (but
> > > > possibly opt-in for other parts of the kernel), and allow me to opt-in
> > > > for the drivers I maintain ?
> > >
> > > I don't think so. Perhaps we could add, instead, something like that at the
> > > sub-maintainers section of the profile.
> >
> > Of course there is a way to add yourself as a maintainer for a specific
> > .c file...  Maybe people feel like MAINTAINERS is too crowded?
> >
> > We could update get_maintainer.pl to grep the .c files for a specific
> > tag instead of putting everything in a centralized MAINTAINERS file.
>
> Another option is to split the MAINTAINERS file into multiple
> distributed files.  get_maintainer.pl already supports that.
>
> https://lwn.net/Articles/730509/
> https://lore.kernel.org/lkml/1501350403.5368.65.camel@perches.com/

Oh I missed that entirely. Can we roll this out now in subsystems? I'd
really like to move all the gpu related MAINTAINERS entries into
drivers/gpu. The one file in the root is unmangeable big and git blame
takes forever. Ofc splitting it isn't an immediate fix, but long term
should be easier. I thought Linus planned to just do that split (at
least the first level or so) after an -rc1?
-Daniel

> > But it doesn't make sense to try store that information MY BRAIN!  I
> > can't remember anything from one minute to the next so I have no idea
> > who maintains media submodules...
>
> Nor I.  Nor should I have to.
>
>
> _______________________________________________
> Ksummit-discuss mailing list
> Ksummit-discuss@lists.linuxfoundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/ksummit-discuss



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
