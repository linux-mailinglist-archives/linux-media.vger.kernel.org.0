Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2A64BB8C4
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2019 17:58:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387599AbfIWP6o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Sep 2019 11:58:44 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:36473 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387555AbfIWP6o (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Sep 2019 11:58:44 -0400
Received: by mail-io1-f66.google.com with SMTP id b136so34713002iof.3
        for <linux-media@vger.kernel.org>; Mon, 23 Sep 2019 08:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fol4ZsNp8Kdo3yO2q1shDBzS/5TjO9ufrtF85Tvjgow=;
        b=AuHOsq9JFSE5Ify7QRYRkbU2pp/wr3ZndsDy6fRR3fze82MYhF7kgsrsTLe+z47AAK
         YhsUYhXAqCQy5Oh4PlGj6lDS0wEhHF+ypGGqhnZBESgJTapMgEypq4cu/aFrqpT6qmtz
         x0VZqOUy4BNlHhiA2hx1YlILYS27L/W8IGf20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fol4ZsNp8Kdo3yO2q1shDBzS/5TjO9ufrtF85Tvjgow=;
        b=C7HWK3aQd9lK9ief9Piy/fGlOqlhmasmAh5hjLzQkFMxgEHAfRB8QGwul/VdlWYqOH
         f/TYCoesiJPDC+w38KlPt67sObWXB9NLvOcXm+atrR7+ccYd1roun6jUPouOYuiDGHf2
         vumyYTaphBUMbdBjZb+I01CcrCEZ27EAy7Ue9QA5jbSFcf1f3RSTu+/XpsRrWlgoMi8O
         lMEcxUfpuvDU8UrNFv7vHl2y0xOG+8rHsT3kS3IE0nczx/lsEtehklQN9RSn4ckcRvKD
         +NGayKLt9eyuXUyucwF+bMF04MNQDW6p65wFjKApMSCVceitLNidW7b23vlkeg0Q6tVh
         Iaig==
X-Gm-Message-State: APjAAAXZNz6I2Jdoce6F8dox0oJc46lLtPivBTeqsrlJZGxjxiLGWkIO
        X14Us8Gdz5ejQKhW63z1NH0wNkanCnA=
X-Google-Smtp-Source: APXvYqxzQDZO+DFXyWer8Sy1jTQFXWfte4y3xR6vlfy5tqDrlFsyWXj50ynDEvLQSBIL0tjT8mKjAA==
X-Received: by 2002:a02:a792:: with SMTP id e18mr72396jaj.125.1569254321540;
        Mon, 23 Sep 2019 08:58:41 -0700 (PDT)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com. [209.85.166.48])
        by smtp.gmail.com with ESMTPSA id x2sm9254873iob.74.2019.09.23.08.58.39
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Sep 2019 08:58:40 -0700 (PDT)
Received: by mail-io1-f48.google.com with SMTP id r26so34627362ioh.8
        for <linux-media@vger.kernel.org>; Mon, 23 Sep 2019 08:58:39 -0700 (PDT)
X-Received: by 2002:a02:1109:: with SMTP id 9mr121098jaf.90.1569254319004;
 Mon, 23 Sep 2019 08:58:39 -0700 (PDT)
MIME-Version: 1.0
References: <156821693963.2951081.11214256396118531359.stgit@dwillia2-desk3.amr.corp.intel.com>
 <434c05bddd2b364e607e565227487910a8dd9793.1568391461.git.mchehab+samsung@kernel.org>
 <20190918123620.GA6306@pendragon.ideasonboard.com> <20190918105728.24e7eb48@coco.lan>
 <20190919065447.GF2959@kadam> <CAMuHMdU10J5zgQ0r8uoA+LFHRbyLB=AG6xygTmsxwc7T-ffdDw@mail.gmail.com>
 <20190920145352.GI12950@pendragon.ideasonboard.com> <CAD=FV=UjTT04pOf3q3H+ZdG9ixr6RWaRJfNs2Dk7xTTEMi-=xw@mail.gmail.com>
 <87k1a2yqmx.fsf@intel.com>
In-Reply-To: <87k1a2yqmx.fsf@intel.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 23 Sep 2019 08:58:28 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XNys5BbzrYNnNFSEXOTUGD1LBxJHeuv8YHCcHmRQs28A@mail.gmail.com>
Message-ID: <CAD=FV=XNys5BbzrYNnNFSEXOTUGD1LBxJHeuv8YHCcHmRQs28A@mail.gmail.com>
Subject: Re: [Ksummit-discuss] [PATCH] media: add a subsystem profile documentation
To:     Jani Nikula <jani.nikula@intel.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        ksummit <ksummit-discuss@lists.linuxfoundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Sat, Sep 21, 2019 at 1:56 AM Jani Nikula <jani.nikula@intel.com> wrote:
>
> On Fri, 20 Sep 2019, Doug Anderson <dianders@chromium.org> wrote:
> > On Fri, Sep 20, 2019 at 7:54 AM Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
> >> And remove Kees Cook and Colin King ? :-) Jokes aside, brushing up
> >> get_maintainer.pl a bit is a good idea. I'm for instance not sure adding
> >> LKML automatically is a good idea if other mailing lists are already
> >> CC'ed, as it's a bit of a /dev/null (albeit with logging, so CC'ing it
> >> when no other mailing list is appropriate certainly makes sense).
> >
> > Please don't do this, as it means the patch won't be findable on the
> > "LKML" patchwork instance at:
> >
> > https://lore.kernel.org/patchwork/project/lkml/list/
> >
> > Having LKML copied on all patches is also nice because it makes it
> > easier to respond to a patch that was posted to a list you didn't
> > subscribe to.  I subscribe to LKML and have it redirected to a folder
> > that I never look at.  Then if I want to find an email thread I can
> > search that folder and easily respond from within my normal email
> > client.
> >
> > Is there any downside to CCing LKML?
>
> I think the question becomes, do we want *everything* posted to LKML?

I swear that I was involved in a conversation in the past where
someone suggested to stop CCing LKML on patches and Jonathan Corbet
jumped in and said that he supported CCing LKML on all patches.  I
searched for that conversation and couldn't find it, so it's possible
I dreamed it.  Maybe he can confirm?


> For example, based on the last 30 days, the kernel the monthly addition
> to LKML traffic from my corner of the kernel would be in this ballpark:
>
> $ notmuch count date:30d.. to:intel-gfx@lists.freedesktop.org or to:dri-devel@lists.freedesktop.org and not to linux-kernel@vger.kernel.org and subject:PATCH
> 96904
>
> OTOH LKML is already a firehose that's impossible to drink from, so not
> much difference there...

Right.  At this point I think LKML is just useful as a dumping ground
and not a place to look for patches or conversations without filters.
It feels fine to keep using it that way.  Having another list (like
ksummit-discuss) for conversations with a higher signal-to-noise ratio
seems like a fine way forward to me.


-Doug
