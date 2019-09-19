Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE22AB73F9
	for <lists+linux-media@lfdr.de>; Thu, 19 Sep 2019 09:22:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731994AbfISHW5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Sep 2019 03:22:57 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:33609 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731332AbfISHW5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Sep 2019 03:22:57 -0400
Received: by mail-ot1-f65.google.com with SMTP id g25so2236163otl.0
        for <linux-media@vger.kernel.org>; Thu, 19 Sep 2019 00:22:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3sG+3s1s6lDcclslDZn6hgAJ4oiqNYT+viVoed7uT0g=;
        b=OeOtuv7woADP7ZByjRKFqSRS5IvjYqnb4VCyTX3MfT0GrIwJuPi29hsIhTXGhxjfgl
         c7WkIC/L60mfm3lhYKrkwz9brCN4A19nZAi6+kRtb+8yBsFsw6Xe1n8FeP8kZlEkel6l
         rXC8ziVXt3KuqMbCa020b6mrQFdfWrAGy5AGorvRxrEkq3WdLAOJVYTh40IV8XBwaI9j
         NCTkV7W0Pe3ZIlfsXx3e4fPN4+GQZtpwTEfd3YQvosKncTmhoyvSTOIxKYgkU4EwfHY0
         F3L77iZWFah3oyWW+dif5Z+YGeV6I9KSszJDgd1bZB/Y/yiw1Gqlr+c+aA2J+2WLxe0s
         Qojw==
X-Gm-Message-State: APjAAAWKqr5kdxlTB5ogUuxDqdJPsZ8cMytVOTjdWgryFRqj1D2ZaP9M
        Qsf0VhjCz3dgjxRHdCffEUQVgHk+NgsmFVbVk1o=
X-Google-Smtp-Source: APXvYqwnGjVAeK3BoOff9zuxt0f65jyCajeOlN4Y8YbB0ntuD7h/XG1+2B/UoqaBx0su9BGY3NzCiwDFK2oWAxvRmrk=
X-Received: by 2002:a9d:5784:: with SMTP id q4mr5331426oth.107.1568877776771;
 Thu, 19 Sep 2019 00:22:56 -0700 (PDT)
MIME-Version: 1.0
References: <156821693963.2951081.11214256396118531359.stgit@dwillia2-desk3.amr.corp.intel.com>
 <434c05bddd2b364e607e565227487910a8dd9793.1568391461.git.mchehab+samsung@kernel.org>
 <20190918123620.GA6306@pendragon.ideasonboard.com> <20190918105728.24e7eb48@coco.lan>
 <20190919065447.GF2959@kadam>
In-Reply-To: <20190919065447.GF2959@kadam>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 19 Sep 2019 09:22:45 +0200
Message-ID: <CAMuHMdU10J5zgQ0r8uoA+LFHRbyLB=AG6xygTmsxwc7T-ffdDw@mail.gmail.com>
Subject: Re: [Ksummit-discuss] [PATCH] media: add a subsystem profile documentation
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        ksummit <ksummit-discuss@lists.linuxfoundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Joe Perches <joe@perches.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 19, 2019 at 8:57 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> On Wed, Sep 18, 2019 at 10:57:28AM -0300, Mauro Carvalho Chehab wrote:
> > > > +Patches for the media subsystem should be sent to the media mailing list
> > > > +at linux-media@vger.kernel.org as plain text only e-mail. Emails with
> > > > +HTML will be automatically rejected by the mail server. There's no need
> > > > +to copy the maintainer or sub-maintainer(s).
> > >
> > > There's too much traffic on mailing lists for me to follow everything, I
> > > much prefer being CC'ed on patches.
> >
> > Well, by using patchwork, the best is to take a look on it at least for
> > the patches that you're interested. You could script something using
> > pwclient in order to make it easier.
> >
> > Anyway, not sure if the other sub-maintainers see the same way. From my side,
> > I prefer not to be c/c, as this is just more noise, as I just rely on
> > patchwork for media patches. What about changing this to:
> >
> >       Patches for the media subsystem should be sent to the media mailing list
> >       at linux-media@vger.kernel.org as plain text only e-mail. Emails with
> >       HTML will be automatically rejected by the mail server. It could be wise
> >       to also copy the sub-maintainer(s).
>
> The documentation should say "Use get_maintainer.pl" and do what it
> says.  Everything else is too complicated.

+1

> When I sent a patch, I use get_maintainer.pl then I add whoever the
> wrote the commit from the Fixes tag.  Then I remove Colin King and Kees
> Cook from the CC list because they worked all over the tree and I know
> them.  I also normally remove LKML if there is another mailing list but
> at least one subsystem uses LKML for patchwork so this isn't safe.
>
> So the safest instructions are "Use get_matainer.pl and add the person
> who wrote the commit in the Fixes tag".

Better: perhaps get_maintainer.pl can be taught to add the author of the
commit pointed to by the Fixes tag, if present?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
