Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 851C55B0420
	for <lists+linux-media@lfdr.de>; Wed,  7 Sep 2022 14:42:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbiIGMmg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Sep 2022 08:42:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbiIGMmf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Sep 2022 08:42:35 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D45CFA99CB
        for <linux-media@vger.kernel.org>; Wed,  7 Sep 2022 05:42:33 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 29so14426398edv.2
        for <linux-media@vger.kernel.org>; Wed, 07 Sep 2022 05:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=gHZvkupGf2IMzQjAYAas5X/BDbEAgms69z4Z4zdPvE8=;
        b=th8JvEz8zt+XKRxLua/qTi0X+Q+tBf0uZ79SoyI6mzhdmybUQiQgFGiOodZ4Fq9JP8
         EX20in76oTMuzydhLnOAvHDhuhunxzSHp8CgP9HX4vqEYIPd9lVUUoohNypvesGUF0XT
         njg0W4/4HRpDURFKGvL4PWm39wCWjEsAHYMnC0YqBJRzjWKtw6oNY2oogY87wrd5FnN9
         FoILVkyo2s9/ibtyf3u+x7lwxauDxGByKpfryfXCMQXtqfOn295tmG6X/r+kbUe0h2Rt
         Jl+IRzmCA7O10zCcXGz5OZWUI1Oz92F7lf0UZo8cGXvyVHwMbWhzoz6oa5P2p1RPCClj
         hzbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=gHZvkupGf2IMzQjAYAas5X/BDbEAgms69z4Z4zdPvE8=;
        b=g2xeYRws12LronNgrNW0akNxwnPWneeBnri9r0TppHwhHYGQqi5K8/INSczPIYZQj7
         Jtu9ztv5iWSgOI8aCy/KSvVImOnaKH7uxOb4S2+LA2Dwmu/mw+o6sHWj9xRVVrnrDq/Z
         F/UW82zGzxp6RVXRn+gexhvo3t4bp3ODrAoWbsLSVXP0o6i9T7ZLcg/afUVExDbgUrdl
         X2FOcs+ocYhcxRlxHWLIpJMI878oDMl9pOndYk5lUmoLRYfFN9kyGjqk5i/qz6cx+HPO
         pmRcei/JrqNTQgeo4WLgC+6SR71A8gUN5LOwmFQxs8k1ba0YASSNhP3vDUw2pstxDi6N
         oN5g==
X-Gm-Message-State: ACgBeo2NjNKajGs1ePWHvycBvaZYk4uaaFycQy6c4E7jgVRw5V1rGNnk
        Q92FsUyDkTK6lHwgfi8IYfyDpJ1GgpsskQja/Z9G7qJoI5AiMA==
X-Google-Smtp-Source: AA6agR7CN65TXwRvdoImgw2hU7a5hw5YV6Vf+AqUs+ogUqfwE5JchU2hvMEZDI8aQF/tbYMCYiP8xWVWjCy2G+AORWA=
X-Received: by 2002:a05:6402:42d3:b0:435:2c49:313d with SMTP id
 i19-20020a05640242d300b004352c49313dmr2926518edc.86.1662554552326; Wed, 07
 Sep 2022 05:42:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAPY8ntBGKkg=KOXaP9bBv6Y8c7Mgut0=w-LTsvKHZac=zzdJDQ@mail.gmail.com>
 <YxeJI8Fwf0ExkMTI@pendragon.ideasonboard.com>
In-Reply-To: <YxeJI8Fwf0ExkMTI@pendragon.ideasonboard.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Wed, 7 Sep 2022 13:42:16 +0100
Message-ID: <CAPY8ntDdgWaFt3DkMHq_V3Uh3XT=smMH3Esgnj9eoiaE4Q+S-Q@mail.gmail.com>
Subject: Re: [Media Summit] Imaging Sensor functionality
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Hidenori Kobayashi <hidenorik@chromium.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Michael Olbrich <m.olbrich@pengutronix.de>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Daniel Scally <djrscally@gmail.com>,
        =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Benjamin MUGNIER <benjamin.mugnier@foss.st.com>,
        Jacopo Mondi <jacopo@jmondi.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Tue, 6 Sept 2022 at 18:53, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Dave,
>
> On Tue, Sep 06, 2022 at 05:14:30PM +0100, Dave Stevenson wrote:
> > Hi All.
> >
> > I realise that I'm in a slightly different position from many mainline
> > Linux-media developers in that I see multiple use cases for the same
> > sensor, rather than a driver predominantly being for one
> > product/platform. I'm therefore wanting to look at generic solutions
> > and fully featured drivers. Users get to decide the use cases, not the
> > hardware designers.
>
> Could you clarify here what you mean by users and hardware designers ?
> Users can be understood as
>
> - Users of the camera sensor, i.e. OEMs designing a product
> - Users of the hardware platform , i.e. software developers writing
>   applications
> - Users of the software, i.e. end-users

Users of the software.

Particularly on the Pi you have people using libcamera apps or Python
bindings that want to be able to choose modes of operation without
having to make kernel driver modifications.
I generally don't mind if that is through userspace or DT, but the
functionality should be exposed.

As an example, when the strobe signals were exposed for IMX477 we had
people hooking up various high intensity strobe devices and other
weird contraptions for synchronised events [1]. Can we replicate that
sort of open-ended functionality in a standardised way within sensor
kernel drivers so that the drivers are not constraining the use cases?

> Hardware designers could then equally mean
>
> - Sensor vendors
> - SoC vendors
> - Board vendors
> - Product vendors

All of the above.

For those Product Vendors designing specific products based on an SoC
and imaging sensor, if there is a defined mechanism that end users can
get to, then they can also use it to configure their specific use
case. Both cases therefore win. Hard coding their product's use case
in a mainline driver limits other use cases.

  Dave

[1] https://forums.raspberrypi.com/viewtopic.php?t=281913

> > The issues I've raised are things that I've encountered and would
> > benefit from a discussion to get views as to the direction that is
> > perceived to be workable. I appreciate that some can not be solved
> > immediately, but want to avoid too much bikeshedding in the first
> > round of patches.
> > What's realistic, and what pitfalls/limitations immediately jump out at people.
> >
> > Slides are at https://drive.google.com/file/d/1vjYJjTNRL1P3j6G4Nx2ZpjFtTBTNdeFG/view?usp=sharing
>
> Thank you, I will review that ASAP.
>
> > See you on Monday.
>
> --
> Regards,
>
> Laurent Pinchart
