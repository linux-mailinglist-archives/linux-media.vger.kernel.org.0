Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C73E2CB06D
	for <lists+linux-media@lfdr.de>; Tue,  1 Dec 2020 23:46:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726422AbgLAWpo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Dec 2020 17:45:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:44098 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726179AbgLAWpo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 1 Dec 2020 17:45:44 -0500
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CBFD920C56;
        Tue,  1 Dec 2020 22:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606862703;
        bh=MjFi3HzHtRoQ7yWPkltj0PaW6hHeafIKU/46YJWPzuA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=C0IHlu8113HcToKCOegRoRnuUe3vNGLF6Ao+VkRNZ9bIMl+tUvtXUGtl0e47BaEs/
         OY19AYUbsC+QSQc/4HjZgklGDq7laqBhygKal7ovv+i6bBeaxtuj4yKQHN2s5XWiMq
         2aWxae92eU73owjxuKvClOdsrQQt6z8ZDEUpvezg=
Received: by mail-ed1-f45.google.com with SMTP id k4so6009517edl.0;
        Tue, 01 Dec 2020 14:45:02 -0800 (PST)
X-Gm-Message-State: AOAM5302zVXo7HQlSQTlMUB7lWJqSSh6pGMvFa83O4OclIOOTvSERZoT
        3FF5wp7Zmpzh18qhJOIN4SifATIRl3SdVBEmow==
X-Google-Smtp-Source: ABdhPJxEOhbAED89pMCr6qcettOTSROEj+qFkB90ldvDfBapdNq9bDUNEqCNB1buDZdPf5x9qLEdvBH0ux8JkGXXwLA=
X-Received: by 2002:a05:6402:553:: with SMTP id i19mr5521037edx.194.1606862701279;
 Tue, 01 Dec 2020 14:45:01 -0800 (PST)
MIME-Version: 1.0
References: <20201014142759.726823-1-rmfrfs@gmail.com> <20201014142759.726823-2-rmfrfs@gmail.com>
 <20201015144905.4b23k5uy7ycuhvlo@uno.localdomain> <20201016144204.3viee7spmvwtms5i@arch-thunder.localdomain>
 <20201019203359.GA3550266@bogus> <20201021155204.off4fdyr2heuuhho@uno.localdomain>
In-Reply-To: <20201021155204.off4fdyr2heuuhho@uno.localdomain>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 1 Dec 2020 15:44:48 -0700
X-Gmail-Original-Message-ID: <CAL_JsqKgZ3uDK17UnHoi0_YWBXZytffRRfuZNUzfOL9wf8hgyg@mail.gmail.com>
Message-ID: <CAL_JsqKgZ3uDK17UnHoi0_YWBXZytffRRfuZNUzfOL9wf8hgyg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: ov2680: convert bindings to yaml
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 21, 2020 at 9:52 AM Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> Hi Rob,
>
> On Mon, Oct 19, 2020 at 03:33:59PM -0500, Rob Herring wrote:
> > On Fri, Oct 16, 2020 at 03:42:04PM +0100, Rui Miguel Silva wrote:
> > > Hey Jacopo,
> > > Thanks for the review.
> > >
> > > On Thu, Oct 15, 2020 at 04:49:05PM +0200, Jacopo Mondi wrote:
> > > > Hi Rui,
> > > >
> > > > On Wed, Oct 14, 2020 at 03:27:57PM +0100, Rui Miguel Silva wrote:
> > > > > Convert ov2680 sensor bindings documentation to yaml schema, remove
> > > > > the textual bindings document and update MAINTAINERS entry.
> > > > >
> > > > > Signed-off-by: Rui Miguel Silva <rmfrfs@gmail.com>
> >
> > > > > +  clock-names:
> > > > > +    description:
> > > >
> > > > I'll never get yaml right, doesn't breaking lines require '|' after
> > > > the semicolon ? The validator does not complain, so I guess not.
> > >
> > > I also had that idea, but looking also to other cases, and also in the
> > > examlpe-schema where you have both cases, looks like it is not needed.
> >
> > '|' will preserve line breaks and formatting. For a single line like
> > this it doesn't really matter. Though ruamel's round trip will make it a
> > single line when writing back out.
>
> Thanks for the explanation.
>
> I'll take the occasion to ask the difference between '|', '|-' and
> '-|' as I haven't find it documented anywhere.

https://yaml-multiline.info/

'-|' is not valid AFAIK. Did you mean '- |'?. That's a list entry
which then contains a multi-line string.

Rob
