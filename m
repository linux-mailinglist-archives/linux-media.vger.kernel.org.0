Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C65282CC44E
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 18:55:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726488AbgLBRxm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 12:53:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:51254 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726080AbgLBRxm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Dec 2020 12:53:42 -0500
X-Gm-Message-State: AOAM5316FdFtkQBfVlSGGYh3p1U9zWL67KZsxU4V4MS/WvhdGy7PmIUh
        8i6vA4PtYZPXSv93ckg3ES5R0gyptIjRa17vTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606931581;
        bh=LVKMVDOAjpNuHt62uAwO/wYSsfzVQqG/sWfMOmMfkpE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=MHPXplP9fehXJmHvEBCr/sAVnSUWMKpZWtC4akF03m/DqHqexP7J0OaqZmBbTzK/W
         1aek/0CIt5hG6b3zq2jSSwuVu6nDc9qNOP378I8pX6TsmBH855+TIKxibe98Kzgbhv
         JpPigJrwgAMvuDUbWSMhfgWlqYkfeVbfetGlxVzE=
X-Google-Smtp-Source: ABdhPJzk88ElFV8VafliLyUXV3mVYLUgyLvBmMvU2kHeAQkf8pRR+Db7xyzNc53Aj4canxxKhsH42gIi8IUtFBS6ef8=
X-Received: by 2002:a50:f404:: with SMTP id r4mr1133601edm.62.1606931579419;
 Wed, 02 Dec 2020 09:52:59 -0800 (PST)
MIME-Version: 1.0
References: <E1kkTsj-0029fe-8O@www.linuxtv.org> <CAL_JsqL5RQkgGEpVadZC-BOB02sMk81q6LvKevcCt-oqkMK-gA@mail.gmail.com>
 <20201202155210.GA13750@pendragon.ideasonboard.com> <CAL_Jsq+sN6y+LFoPPnBawdMZfK011fQrVaQ3m6BHOLewz1qDWg@mail.gmail.com>
 <20201202174303.GH852@paasikivi.fi.intel.com>
In-Reply-To: <20201202174303.GH852@paasikivi.fi.intel.com>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 2 Dec 2020 10:52:47 -0700
X-Gmail-Original-Message-ID: <CAL_JsqJDaNgyDZg8fEVTgzbvnVEBz1388t-GBQEtfaxbmEtDWA@mail.gmail.com>
Message-ID: <CAL_JsqJDaNgyDZg8fEVTgzbvnVEBz1388t-GBQEtfaxbmEtDWA@mail.gmail.com>
Subject: Re: [git:media_tree/master] media: dt-bindings: media: Use OF graph schema
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linuxtv-commits@linuxtv.org, Jacopo Mondi <jacopo@jmondi.org>,
        Maxime Ripard <mripard@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Dec 2, 2020 at 10:43 AM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Rob, Laurent,
>
> On Wed, Dec 02, 2020 at 09:30:27AM -0700, Rob Herring wrote:
> > On Wed, Dec 2, 2020 at 8:52 AM Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> > >
> > > On Wed, Dec 02, 2020 at 08:45:59AM -0700, Rob Herring wrote:
> > > > On Wed, Dec 2, 2020 at 8:17 AM Mauro Carvalho Chehab
> > > > <mchehab+huawei@kernel.org> wrote:
> > > > >
> > > > > This is an automatic generated email to let you know that the following patch were queued:
> > > > >
> > > > > Subject: media: dt-bindings: media: Use OF graph schema
> > > > > Author:  Rob Herring <robh@kernel.org>
> > > > > Date:    Tue Nov 17 02:39:47 2020 +0100
> > > > >
> > > > > Now that we have a graph schema, rework the media related schemas to
> > > > > use it. Mostly this is adding a reference to graph.yaml and dropping
> > > > > duplicate parts from schemas.
> > > > >
> > > > > Cc: Maxime Ripard <mripard@kernel.org>
> > > > > Cc: Jacopo Mondi <jacopo@jmondi.org>
> > > > > Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > > > Signed-off-by: Rob Herring <robh@kernel.org>
> > > > > Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > >
> > > > Laurent did not ack this. There was discussion on this and it needs a
> > > > v2. Please drop.
>
> I noticed it had been there for a while with some comments from Laurent
> that didn't obviously result in any changes to the patch.

It was probably clearer in the DRM version of the patch I referred to.

> The patch is in Mauro's tree now. I can send a revert if you'd prefer that
> instead of making changes on top of this.

It needs to be removed however you all want. While graph.yaml is in
dtschema, I'm reworking it and things will break when that's
committed.

Rob
