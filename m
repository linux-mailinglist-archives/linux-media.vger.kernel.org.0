Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 715CE1C53A7
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2020 12:50:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728758AbgEEKux (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 May 2020 06:50:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728180AbgEEKux (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 May 2020 06:50:53 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18BD2C061A0F
        for <linux-media@vger.kernel.org>; Tue,  5 May 2020 03:50:53 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id o7so1565528oif.2
        for <linux-media@vger.kernel.org>; Tue, 05 May 2020 03:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=F65VWy7hIho9W43mv1zezHtBUloedgNrymeLLsNpkNM=;
        b=rsD9H5hOWqp6La7h4ohUkXLhUinYY0sF4oZ52VkZvlEOLTOXAYf+sqFk6oO9E59HMj
         jHIrALwV52TP5ex6QAdOtH3wdHLRT9qFBv5w2IXJ/m2deipFTR40+yp2KLJUOQRJ8pmi
         qaE3FTotfGe1BGcnVSGwXUQ+qdIBSOvp7rek26t5rfgpdtx3N8/cOesYx7DiXXjGxzNs
         BAQ5HY3s2VLJMPlTfZKiVKqRmCKFgfJHZjXJeuYRQg9GDNdLmMBs2NRma3+VZ9wWtANy
         jSIL+32m4qDS/+w7RijQ2Ivz+ykj3WRQzt4NJ5u+xBLaLFEhf94eXLmzl5ROn4cXkB9w
         d8MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F65VWy7hIho9W43mv1zezHtBUloedgNrymeLLsNpkNM=;
        b=NbRhvf+uHTRo8c9u1XRT9giE6/Y9BQUzNa7NrBLt8+ETKjKCyiJkJ/IdD+n5TxG/Xz
         zYSQeN6nK+9aStfcmXXdHOsD3rlluvo8r12EaYlSKJmD9yDwDtX242NCxCq+aQYzUepc
         H9+j35I7kToFKc4V7mL4ZsC1BpyjxNukI71/m/pgALpLyHVYg4QMJlJw0kIsw7e+SqJp
         xZrqc1uycylJR/2hHtjK6518tzgdLIC2foS9a/CxdFbo0wl3dnC5rhaobQjsaUEAQIAK
         +nIf5HvjBl5Qx8pC1myqgAIUebw2Y3AiB8n9CHWLiD6haPd/fJPdjfJWReHL0hunn1A3
         3wrA==
X-Gm-Message-State: AGi0PuYEtDRqQL58QwgOpIdO/xksZRUsnn+P7/Ztp7NAvnG7yH0HsCaq
        tLnJNioPCHgATDOCLeYhGOS/m8Bc9YUdSJukFiDR8Q==
X-Google-Smtp-Source: APiQypIXjnJBKaHKFcWt/2v8uknQ7y7sXhAIXka52T+IIKJk5C5RoNviuJYjUWk/Gpy8dz/DJrvY/7J3pWZe7sCRy3c=
X-Received: by 2002:aca:190e:: with SMTP id l14mr1906618oii.77.1588675852452;
 Tue, 05 May 2020 03:50:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
 <20200504092611.9798-31-laurent.pinchart@ideasonboard.com>
 <ccd8ad49a699d9f8a4d77577eb76b4b281b17843.camel@suse.de> <8e062f07-c151-6273-4c25-e541f6df1bb0@raspberrypi.com>
 <ad81d1a3ce1a5c9c0103bf54313a99c96c91fa9a.camel@suse.de>
In-Reply-To: <ad81d1a3ce1a5c9c0103bf54313a99c96c91fa9a.camel@suse.de>
From:   Phil Elwell <phil@raspberrypi.com>
Date:   Tue, 5 May 2020 11:50:42 +0100
Message-ID: <CAMEGJJ3gWK5GWeR6D2VdWQdNmU5P_5umFR=D-QORpn8ENdM_pA@mail.gmail.com>
Subject: Re: [PATCH v2 30/34] staging: vchiq_arm: Give vchiq children DT nodes
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Naushir Patuck <naush@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nicolas,

On Tue, 5 May 2020 at 11:37, Nicolas Saenz Julienne
<nsaenzjulienne@suse.de> wrote:
>
> On Mon, 2020-05-04 at 20:42 +0100, Phil Elwell wrote:
> > Hi Nicolas,
> >
> > On 04/05/2020 18:12, Nicolas Saenz Julienne wrote:
> > > Hi Phil, Laurent,
> > >
> > > On Mon, 2020-05-04 at 12:26 +0300, Laurent Pinchart wrote:
> > > > From: Phil Elwell <phil@raspberrypi.com>
> > > >
> > > > vchiq kernel clients are now instantiated as platform drivers rather
> > > > than using DT, but the children of the vchiq interface may still
> > > > benefit from access to DT properties. Give them the option of a
> > > > a sub-node of the vchiq parent for configuration and to allow
> > > > them to be disabled.
> > > >
> > > > Signed-off-by: Phil Elwell <phil@raspberrypi.com>
> > > > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > > > ---
> > > >   .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 8 ++++++++
> > > >   1 file changed, 8 insertions(+)
> > > >
> > > > diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > > > b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > > > index dd3c8f829daa..2325ab825941 100644
> > > > --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > > > +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > > > @@ -2734,12 +2734,20 @@ vchiq_register_child(struct platform_device *pdev,
> > > > const char *name)
> > > >           pdevinfo.id = PLATFORM_DEVID_NONE;
> > > >           pdevinfo.dma_mask = DMA_BIT_MASK(32);
> > > >
> > > > + np = of_get_child_by_name(pdev->dev.of_node, name);
> > > > +
> > > > + /* Skip the child if it is explicitly disabled */
> > > > + if (np && !of_device_is_available(np))
> > > > +         return NULL;
> > >
> > > I think this is alright, although I'd reshufle the code a little so it looks
> > > nicer:
> > >
> > > +   /* Skip the child if it is explicitly disabled */
> > > +   np = of_get_child_by_name(pdev->dev.of_node, name);
> > > +   if (np && !of_device_is_available(np))
> > > +           return NULL;
> >
> > I prefer the original.
>
> Fair enough
>
> > > >           child = platform_device_register_full(&pdevinfo);
> > > >           if (IS_ERR(child)) {
> > > >                   dev_warn(&pdev->dev, "%s not registered\n", name);
> > > >                   child = NULL;
> > > >           }
> > > >
> > > > + child->dev.of_node = np;
> > >
> > > Is this really needed? I'd rather have the parent's np (as commented in
> > > patch
> > > 26) as long as this is not a real device-tree defined platform device.
> >
> > Unless the of_node pointer refers to the sub-node for the child, all children
> > would have to share a common set of properties, rather defeating the point of
> > the
> > change.
>
> Sorry I wasn't clear, my main point is that, since manually editing device
> internals is bad a practice, specially after they have been registered (there
> are potential races with dma_configure()/probe()). I want to make sure we need
> it in the first place (i.e. I don't see any further usage of that device node).
>
> If we can get rid of this line, we're better-off.

Thanks - that is much clearer.

> If we actually need the device node further down I propose two things:
> - Use dev.of_node_reused, and do an children lookup anytime you need to get a
>   property. It's a one-liner in the end.
> - Move device registration to DT. There has been some push-back of this in the
>   past, but IMO things like arm's SCMI already set a standard on what firmware
>   devices can do trough DT and it fits this situation.

I much prefer registration via DT - enumerating the children in code rather than
data always felt like a baffling step backwards.

Phil
