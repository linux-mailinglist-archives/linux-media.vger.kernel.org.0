Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C5223B0D8E
	for <lists+linux-media@lfdr.de>; Tue, 22 Jun 2021 21:20:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232416AbhFVTWW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Jun 2021 15:22:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229786AbhFVTWV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Jun 2021 15:22:21 -0400
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com [IPv6:2607:f8b0:4864:20::c36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDEFDC061574
        for <linux-media@vger.kernel.org>; Tue, 22 Jun 2021 12:20:04 -0700 (PDT)
Received: by mail-oo1-xc36.google.com with SMTP id z14-20020a4a984e0000b029024a8c622149so119888ooi.10
        for <linux-media@vger.kernel.org>; Tue, 22 Jun 2021 12:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IXTyvMzccD44HreGd+lTW6UPC/c6n0CNj/56dlhspnE=;
        b=jnrGKCc5k+rj2MWFkDqYwdwLo96z0bMl1L8GBzaSBanYW5s9QkrSoWIBy0C8sqBpiE
         sJp0+r8NksBdwWhFF0jipEeTILNVYlU4GGWVUekaNY/wa/lXH+zpc8tYd9r6p58jVT/q
         Y5HpOmjHxg7Zv+LdXx+OztqFobp4mnwzmSb0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IXTyvMzccD44HreGd+lTW6UPC/c6n0CNj/56dlhspnE=;
        b=gPi8YLOnDjvoODjbV4CO7PcBbPM8XdVj8+N6kk4AOKe3BIWIKej0kxi6iPAzUbwAnT
         7FY8JvTDWAOtubVD4/FwKg1XqbTprA37B5Zwjfrxm5m99f5YXquKbr5ZQIbbLki5ZmD/
         GL6zxbFmHsl/vh5SKW9bd+Fl8dxjzPrdal5B+BgFxaLmazyLECa0mJ0z2eSitjjMAkSP
         v4D7eHlJTfYmkxRS7sIGCAk0gR4J3WAm5Ibe7sL3bh/gINb3lQJFyaDnIunBwOG1sFDL
         2LY8/uKnP15vGJRVoyKKaDBeEWvKa59BEwUjivlQRJC7f6khBRHORXAIB03FfJACTmHo
         ItXQ==
X-Gm-Message-State: AOAM533BYfV767Rws+hklG3O3qD6jA5wAOmaRSLj2c1EIKz/Ql5SzOHv
        jqm35PEBKAmvY8mN8MwV//V2qMfX9tFjBqVB6FFuKQ==
X-Google-Smtp-Source: ABdhPJymCc3vHixvjSqTi5/BbnUPvRWX6NdnjghdlEx76K/WySHKdsKsTkAYb3Xk7+ky8kEKHa35K21lsy/Je7GeXFo=
X-Received: by 2002:a4a:9b99:: with SMTP id x25mr4621885ooj.85.1624389604204;
 Tue, 22 Jun 2021 12:20:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
 <20210622165511.3169559-2-daniel.vetter@ffwll.ch> <YNIw1g5HVCzvmKzP@ravnborg.org>
In-Reply-To: <YNIw1g5HVCzvmKzP@ravnborg.org>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Tue, 22 Jun 2021 21:19:53 +0200
Message-ID: <CAKMK7uE-c7evbXhNs9htsJ2wKWSMVcS=HHauvQ19-+9BT8NwSw@mail.gmail.com>
Subject: Re: [PATCH 01/15] dma-resv: Fix kerneldoc
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 22, 2021 at 8:50 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Daniel,
>
> On Tue, Jun 22, 2021 at 06:54:57PM +0200, Daniel Vetter wrote:
> > Oversight from
> >
> > commit 6edbd6abb783d54f6ac4c3ed5cd9e50cff6c15e9
> > Author: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Date:   Mon May 10 16:14:09 2021 +0200
>
> this is what we uses Fixes: ... for.
>
> It looks wrong to hide it in the description.

I've honestly become a bit vary of using Fixes: for docs/comments
because the stable autoselect bots are _really_ keen on picking up
anything with a Fixes: line in it. And that feels a bit like nonsense.
-Daniel

>
>         Sam
>
> >
> >     dma-buf: rename and cleanup dma_resv_get_excl v3
> >
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> > Cc: linux-media@vger.kernel.org
> > Cc: linaro-mm-sig@lists.linaro.org
> > ---
> >  include/linux/dma-resv.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> > index 562b885cf9c3..e1ca2080a1ff 100644
> > --- a/include/linux/dma-resv.h
> > +++ b/include/linux/dma-resv.h
> > @@ -212,7 +212,7 @@ static inline void dma_resv_unlock(struct dma_resv =
*obj)
> >  }
> >
> >  /**
> > - * dma_resv_exclusive - return the object's exclusive fence
> > + * dma_resv_excl_fence - return the object's exclusive fence
> >   * @obj: the reservation object
> >   *
> >   * Returns the exclusive fence (if any). Caller must either hold the o=
bjects
> > --
> > 2.32.0.rc2



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
