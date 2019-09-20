Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0105B9396
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2019 16:59:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388815AbfITO7a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Sep 2019 10:59:30 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:32832 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388416AbfITO7a (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Sep 2019 10:59:30 -0400
Received: by mail-io1-f65.google.com with SMTP id m11so16931730ioo.0
        for <linux-media@vger.kernel.org>; Fri, 20 Sep 2019 07:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7MWqfk6+lcr5uGGG01MhMZJ03kCPMDZ/BnOM+3NK0mw=;
        b=eSNEL0OajMRxrCCiB/WSHauBh894qG1+JILfEsi/bEs/uK5EDRJdtm7deGAi8d7Wbi
         6BfEWgO9U+kGONqzYZR/FEkjASIZcnN5EFv0WWAmoBnKc7odS/CV3F5bNXexRk3gWjKJ
         s7nTSGD/LsB0Ha/9X82VNTD2nWae7M+Akl8M4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7MWqfk6+lcr5uGGG01MhMZJ03kCPMDZ/BnOM+3NK0mw=;
        b=KJYTDvPZCA3syb2mS7pCmauN/tXH/+qzp23+Cs2n2gHTiHHXzdFvP4sWEOM+nMUFlk
         sCaSZx8/R2yvwWwfKoF7rr8eUnUd2ENu0qYtrWQ9fUM7nM6W4lCat/Fbaw0Yhy7RVJdO
         jUWWUUYAt7eAv7EH+QGGZ5WTjzxQDVfEer+IDql7EK5GxWHQyyoSYGnEVRvQO+si260o
         MvSivPzuZO4dXh7GirLTnCJSjE1/Vz6dP/2dx2cT4smsSUq9NlkIcoEn54GdlWyaXHsr
         TowcBghXAlrDZrtohq1P/zJzGidx8VcUrJmfB9sbbYt1CW7syIvQfGCcDncuWleQ2MKt
         YpuA==
X-Gm-Message-State: APjAAAVbS/logRA7FUCSBZFAunmS1QR7N3u+yW5Q3gnWrFMRkJnLyVpz
        8hSWK34m8InZtcd2YRF5BvujnhecbTQ=
X-Google-Smtp-Source: APXvYqy1PdecaSi69iyttybFLJfwtto+cR11PyNSUl5W9U//L/KJISwOv+0KZE4Xnmx7y2jVUJJqNw==
X-Received: by 2002:a5e:9917:: with SMTP id t23mr20229088ioj.141.1568991568067;
        Fri, 20 Sep 2019 07:59:28 -0700 (PDT)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com. [209.85.166.51])
        by smtp.gmail.com with ESMTPSA id c4sm1874271ioa.70.2019.09.20.07.59.26
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Sep 2019 07:59:27 -0700 (PDT)
Received: by mail-io1-f51.google.com with SMTP id q1so16922966ion.1
        for <linux-media@vger.kernel.org>; Fri, 20 Sep 2019 07:59:26 -0700 (PDT)
X-Received: by 2002:a6b:b704:: with SMTP id h4mr2418021iof.218.1568991566249;
 Fri, 20 Sep 2019 07:59:26 -0700 (PDT)
MIME-Version: 1.0
References: <156821693963.2951081.11214256396118531359.stgit@dwillia2-desk3.amr.corp.intel.com>
 <434c05bddd2b364e607e565227487910a8dd9793.1568391461.git.mchehab+samsung@kernel.org>
 <20190918123620.GA6306@pendragon.ideasonboard.com> <20190918105728.24e7eb48@coco.lan>
 <20190919065447.GF2959@kadam> <CAMuHMdU10J5zgQ0r8uoA+LFHRbyLB=AG6xygTmsxwc7T-ffdDw@mail.gmail.com>
 <20190920145352.GI12950@pendragon.ideasonboard.com>
In-Reply-To: <20190920145352.GI12950@pendragon.ideasonboard.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 20 Sep 2019 07:59:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UjTT04pOf3q3H+ZdG9ixr6RWaRJfNs2Dk7xTTEMi-=xw@mail.gmail.com>
Message-ID: <CAD=FV=UjTT04pOf3q3H+ZdG9ixr6RWaRJfNs2Dk7xTTEMi-=xw@mail.gmail.com>
Subject: Re: [Ksummit-discuss] [PATCH] media: add a subsystem profile documentation
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        ksummit <ksummit-discuss@lists.linuxfoundation.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Fri, Sep 20, 2019 at 7:54 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Thu, Sep 19, 2019 at 09:22:45AM +0200, Geert Uytterhoeven wrote:
> > On Thu, Sep 19, 2019 at 8:57 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > > On Wed, Sep 18, 2019 at 10:57:28AM -0300, Mauro Carvalho Chehab wrote:
> > > > > > +Patches for the media subsystem should be sent to the media mailing list
> > > > > > +at linux-media@vger.kernel.org as plain text only e-mail. Emails with
> > > > > > +HTML will be automatically rejected by the mail server. There's no need
> > > > > > +to copy the maintainer or sub-maintainer(s).
> > > > >
> > > > > There's too much traffic on mailing lists for me to follow everything, I
> > > > > much prefer being CC'ed on patches.
> > > >
> > > > Well, by using patchwork, the best is to take a look on it at least for
> > > > the patches that you're interested. You could script something using
> > > > pwclient in order to make it easier.
> > > >
> > > > Anyway, not sure if the other sub-maintainers see the same way. From my side,
> > > > I prefer not to be c/c, as this is just more noise, as I just rely on
> > > > patchwork for media patches. What about changing this to:
> > > >
> > > >       Patches for the media subsystem should be sent to the media mailing list
> > > >       at linux-media@vger.kernel.org as plain text only e-mail. Emails with
> > > >       HTML will be automatically rejected by the mail server. It could be wise
> > > >       to also copy the sub-maintainer(s).
> > >
> > > The documentation should say "Use get_maintainer.pl" and do what it
> > > says.  Everything else is too complicated.
> >
> > +1
> >
> > > When I sent a patch, I use get_maintainer.pl then I add whoever the
> > > wrote the commit from the Fixes tag.  Then I remove Colin King and Kees
> > > Cook from the CC list because they worked all over the tree and I know
> > > them.  I also normally remove LKML if there is another mailing list but
> > > at least one subsystem uses LKML for patchwork so this isn't safe.
> > >
> > > So the safest instructions are "Use get_matainer.pl and add the person
> > > who wrote the commit in the Fixes tag".
> >
> > Better: perhaps get_maintainer.pl can be taught to add the author of the
> > commit pointed to by the Fixes tag, if present?
>
> And remove Kees Cook and Colin King ? :-) Jokes aside, brushing up
> get_maintainer.pl a bit is a good idea. I'm for instance not sure adding
> LKML automatically is a good idea if other mailing lists are already
> CC'ed, as it's a bit of a /dev/null (albeit with logging, so CC'ing it
> when no other mailing list is appropriate certainly makes sense).

Please don't do this, as it means the patch won't be findable on the
"LKML" patchwork instance at:

https://lore.kernel.org/patchwork/project/lkml/list/

Having LKML copied on all patches is also nice because it makes it
easier to respond to a patch that was posted to a list you didn't
subscribe to.  I subscribe to LKML and have it redirected to a folder
that I never look at.  Then if I want to find an email thread I can
search that folder and easily respond from within my normal email
client.

Is there any downside to CCing LKML?

-Doug
