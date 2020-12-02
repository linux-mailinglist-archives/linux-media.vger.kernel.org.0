Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13D462CC256
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 17:31:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728496AbgLBQbY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 11:31:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:49734 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726871AbgLBQbX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Dec 2020 11:31:23 -0500
X-Gm-Message-State: AOAM532BA/Ab54XaaQ0y+JymL6iqHs1nsp/6B5+VYQXiJrJ4WLTl3O0c
        +9C0gHn93ouA0JCfiDTK5qvj5u2Horck8MTN6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606926641;
        bh=GnIQ0wQFC95s825pHwCOe+c0BGxcWoU33LUhjlQ1gcY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=vL+Nl/ioa1RZ9S+WiNBwgz/nhHzsRqMI91v8CRcd3+rdk/rmPH7je/yl8FjAFvo4a
         NjQO7DNOAG/ZhddHCrjBr0a8CL5cSphS0CnUMIylZ0FVjm1v1/LTG/zRRaxeJG14lM
         9ZN4zoRHpKUZtXVrgyh1uBRERKS1srQUpyzaH3E4=
X-Google-Smtp-Source: ABdhPJxGy5MI9ByIpdlmCDa/vdyM8Sbq58VgVqv7+DKgOWTnyX/7yIqCcOgBF6gR4FS4+N8Y2dAIHaxS/F3/iOsH6k0=
X-Received: by 2002:aa7:d154:: with SMTP id r20mr745796edo.258.1606926639582;
 Wed, 02 Dec 2020 08:30:39 -0800 (PST)
MIME-Version: 1.0
References: <E1kkTsj-0029fe-8O@www.linuxtv.org> <CAL_JsqL5RQkgGEpVadZC-BOB02sMk81q6LvKevcCt-oqkMK-gA@mail.gmail.com>
 <20201202155210.GA13750@pendragon.ideasonboard.com>
In-Reply-To: <20201202155210.GA13750@pendragon.ideasonboard.com>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 2 Dec 2020 09:30:27 -0700
X-Gmail-Original-Message-ID: <CAL_Jsq+sN6y+LFoPPnBawdMZfK011fQrVaQ3m6BHOLewz1qDWg@mail.gmail.com>
Message-ID: <CAL_Jsq+sN6y+LFoPPnBawdMZfK011fQrVaQ3m6BHOLewz1qDWg@mail.gmail.com>
Subject: Re: [git:media_tree/master] media: dt-bindings: media: Use OF graph schema
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        linuxtv-commits@linuxtv.org, Jacopo Mondi <jacopo@jmondi.org>,
        Maxime Ripard <mripard@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Dec 2, 2020 at 8:52 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Wed, Dec 02, 2020 at 08:45:59AM -0700, Rob Herring wrote:
> > On Wed, Dec 2, 2020 at 8:17 AM Mauro Carvalho Chehab
> > <mchehab+huawei@kernel.org> wrote:
> > >
> > > This is an automatic generated email to let you know that the following patch were queued:
> > >
> > > Subject: media: dt-bindings: media: Use OF graph schema
> > > Author:  Rob Herring <robh@kernel.org>
> > > Date:    Tue Nov 17 02:39:47 2020 +0100
> > >
> > > Now that we have a graph schema, rework the media related schemas to
> > > use it. Mostly this is adding a reference to graph.yaml and dropping
> > > duplicate parts from schemas.
> > >
> > > Cc: Maxime Ripard <mripard@kernel.org>
> > > Cc: Jacopo Mondi <jacopo@jmondi.org>
> > > Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > Signed-off-by: Rob Herring <robh@kernel.org>
> > > Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >
> > Laurent did not ack this. There was discussion on this and it needs a
> > v2. Please drop.
>
> I told Sakari in an IRC conversation I was fine with the patches, and he
> asked if that meant an ack. I said yes, but didn't realize he wanted to
> apply your v1. Sorry about the confusion :-S

Thinking about this some more, I think video-interfaces.txt is going
to need to be converted first as well. Otherwise, it's going to be 2
rounds of whack-a-mole. Also consider that everything applied after
this needs to be converted with whatever we end up with. Folks will
need to respin their patches, the maintainer has to do it, or we'll
need another round. So consider when is the best time in the cycle to
apply?

Rob
