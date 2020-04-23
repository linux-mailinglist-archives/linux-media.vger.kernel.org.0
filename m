Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 836F61B5AB6
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2020 13:46:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727088AbgDWLqs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 07:46:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728017AbgDWLqs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 07:46:48 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDFD2C035495
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2020 04:46:46 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id z25so5439253otq.13
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2020 04:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=soBENWxtv1Jx6Q4M8NjC2VsgjFKXOfQejEBroBd8f4g=;
        b=NXx4YPgvtOlyiKjB650mQVqamk7mwKi2f5oD1cAMtY5EWRnaThyz0h+QPOfwI1jQ9w
         6Nx1NeQyKFKmVdgwiYV71tS6SUDsNJ+4BS5yWOt41z7u06V3K9qAR9zAsV0eciBZ82NB
         MVwTigSQtl3NWsR6OlpVgGl3p8JXDydOI5XDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=soBENWxtv1Jx6Q4M8NjC2VsgjFKXOfQejEBroBd8f4g=;
        b=QxkKhSvferRUIYH+SHSRd4H5/uREnDov8acYJPNyd5xAqUnAzEgokDYXQtYk7ynH3j
         0cX5m7tKwqGtT4KrCI3KeFoT2c3QHs8kItQ5r0bJMhXS5xTyOhbg9sxFfdBs377AKok1
         K3Lh16CkBJt5jS+T97+GF31EBRRJUXM0viqGcEmxLpLNQYrmkmWTjdfqHSZ7KKpQmLZ/
         sHqlaKb0lXjnchhwWYxSBBixgulpxgHVTL+/9W5dJ7YZNYBZhonDiaSpuT9ZLVeN9Jbc
         s8Adb1EOVPQPHTX0mgFNQPYDNp9LtxW/qnvqTjnx2O4s9PReToDE7wnCy1yv5OAOOKQd
         sS8g==
X-Gm-Message-State: AGi0PuaBh/uAYE2rIYkoVvBmaTxPGun/yusgcCphqEpnjzX9a5jEQQgl
        ToNHrawnsqTYtPisXEYw+byXERk3w5MZm3SrJQ+UlA==
X-Google-Smtp-Source: APiQypKhOGBw+yldUeb3d73cJTyCIRTooxDShKtfsXpDubxWoQUNatT4V7/wpGHO6fgRNhipZQ5IOE3srpPVZe4TbtA=
X-Received: by 2002:a9d:2056:: with SMTP id n80mr3147281ota.281.1587642406180;
 Thu, 23 Apr 2020 04:46:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200420074115.23931-1-galpress@amazon.com> <20200420170059.5a42693e@lwn.net>
 <20200421123837.GZ3456981@phenom.ffwll.local> <20200421103236.4b64155c@lwn.net>
In-Reply-To: <20200421103236.4b64155c@lwn.net>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Thu, 23 Apr 2020 13:46:35 +0200
Message-ID: <CAKMK7uGTP93tbpsZhc1On2ka+YiVhwHk32cWHEdvS5O5DGODTg@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: Couple of documentation typo fixes
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Gal Pressman <galpress@amazon.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Apr 21, 2020 at 6:32 PM Jonathan Corbet <corbet@lwn.net> wrote:
>
> On Tue, 21 Apr 2020 14:38:37 +0200
> Daniel Vetter <daniel@ffwll.ch> wrote:
>
> > On Mon, Apr 20, 2020 at 05:00:59PM -0600, Jonathan Corbet wrote:
> > > On Mon, 20 Apr 2020 10:41:15 +0300
> > > Gal Pressman <galpress@amazon.com> wrote:
> > >
> > > > Fix a couple of typos: "as" -> "has" and "int" -> "in".
> > > >
> > > > Signed-off-by: Gal Pressman <galpress@amazon.com>
> > >
> > > Applied, thanks.
> >
> > Also applied to drm-misc-next, the dma-buf stuff is maintained as part of
> > drm. And maybe I actually get around to doing the doc polish for all
> > things dma-buf that I've been promised to do since months :-)
>
> I actually looked for it in linux-next before applying, but didn't (and
> don't) see it there...?

I only spotted the patch after I've seen your notification, so it was
indeed not there back then. But now it should be there:

commit 776d58823a60c689816972b51100cb322a0834ce (HEAD ->
drm-misc-next, drm-misc/for-linux-next, drm-misc/drm-misc-next)
Author: Gal Pressman <galpress@amazon.com>
Date:   Mon Apr 20 10:41:15 2020 +0300

    dma-buf: Couple of documentation typo fixes

drm-misc/for-linux-next is included in linux-next (we have some
special branches for linux-next because of some different rules than
usual for our committers). Latest linux-next also seems to have it by
now.
-Daniel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
