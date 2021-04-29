Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8784B36E329
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 04:11:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231564AbhD2CL6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 22:11:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229888AbhD2CL6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 22:11:58 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9477C06138B
        for <linux-media@vger.kernel.org>; Wed, 28 Apr 2021 19:11:12 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id z16so5152728pga.1
        for <linux-media@vger.kernel.org>; Wed, 28 Apr 2021 19:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DIdG6Lz2kEpg5NKcoGZBAk5pKgJCN9++IFEeS+jkB8Y=;
        b=nV1VDP7D0fkmAv7URjqvpDoBkCxck/ewhTOImJWqLjQigPiL8TNMBYM4pQzbh73Sku
         OmkEDCoPqvRL8PRt+c5OTIp//dlWDTSwVjyfXf6QjXtTU1ReJRzcRoSKQe/gd+AaGEV/
         sKIuZjHh8hi+I32SQIInB9HNJ995nbjDADqnkwVZci1USBLITKy9tsj+w+cZGHw8GvDF
         HFVF0HGKLszmJMNZ8twhP4btUB5chFqP0YJVUiPFCNkeUSdfggGTFWlTsEi/HkiLc9RX
         qWFTTAtrpMHMZ3bidhLLTcgHOVSSo4ZcTBHYUDbmcypRPPRgPxoTPeqypFXCnlIiqgv2
         /vkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DIdG6Lz2kEpg5NKcoGZBAk5pKgJCN9++IFEeS+jkB8Y=;
        b=hA6Rv050uDIBcyBbmWCyZ+vvwi3TT+eqz9Y4pO7l/eNZ7W3JfLtU1+darnoYG38Bjb
         NB2l4cRkEEh0TYoYP8yMO+4+yHDu4KA47iKq79DbjGvE6wz1L5PuQrND7HhQaFsApmAC
         Qw5YsZQfmZ4+kvhLwbuZ+A42h5jfYGoC7vjhOGwLQG+UGRRIPiyeR1Ls+HgLvTGJcA1I
         mPUjs5UIF8spSC1bi4EuBZplA3FJC0R82T4W/ngTodMmGvxk8Ct7BNHrny2AKUkLrF9F
         bDpAZCGxpVLUM6+wnb90Cm9h1hA47MeKsjietL4ukYiuvzIZrHs4pI9JLnpuAPjYIKcN
         SIYw==
X-Gm-Message-State: AOAM530e/qw1WcYfHljB5usne3qN/HRc+alAer0uNCMgNF4ZSJZ/QMK8
        s3pZ8nDmEFiTCo59Gjb0zeJNGztA6tFVsoLn63M=
X-Google-Smtp-Source: ABdhPJyYF8YuwZlVdXo+WQoAIiRbQZ930NgC9D7vXNdELA8T20v7CeD708HEizVEUpQCvZWtlDC+UvolJAfGo7CMt7Q=
X-Received: by 2002:a63:f957:: with SMTP id q23mr8007099pgk.430.1619662272310;
 Wed, 28 Apr 2021 19:11:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210317172227.620584-1-ariel.dalessandro@collabora.com>
 <20210317172227.620584-3-ariel.dalessandro@collabora.com> <7096f897-1e48-c1e5-5503-008fff60d2b2@googlemail.com>
 <e9dc1ebd-9a68-adc6-2a61-5555d622ccf3@collabora.com>
In-Reply-To: <e9dc1ebd-9a68-adc6-2a61-5555d622ccf3@collabora.com>
From:   Rosen Penev <rosenp@gmail.com>
Date:   Wed, 28 Apr 2021 19:11:19 -0700
Message-ID: <CAKxU2N_b8758FUKF=MoWRny59NxAZ6qSWETH4_6OhQpAP0OBTQ@mail.gmail.com>
Subject: Re: [v4l-utils v4 2/5] Add support for meson building
To:     "Ariel D'Alessandro" <ariel.dalessandro@collabora.com>
Cc:     Gregor Jasny <gjasny@googlemail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, Sean Young <sean@mess.org>,
        p.zabel@pengutronix.de, laurent.pinchart@ideasonboard.com,
        ezequiel@collabora.com, nicolas@ndufresne.ca,
        kieran.bingham@ideasonboard.com, xavier.claessens@collabora.com,
        nicolas.dufresne@collabora.com, user.vdr@gmail.com,
        sakari.ailus@iki.fi
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Apr 23, 2021 at 2:03 PM Ariel D'Alessandro
<ariel.dalessandro@collabora.com> wrote:
>
> Hi Gregor,
>
> Following up on this patchset after some time.
>
> On 3/20/21 1:56 PM, Gregor Jasny wrote:
> > Hello,
> >
> > Thank you again for these patches. Building v4l-utils has never been so
> > fast and easy. It will accelerate my Debian / Ubuntu packaging and
> > really sparks joy!
>
> Happy to see it being useful :-)
>
> >
> > On 17.03.21 18:22, Ariel D'Alessandro wrote:
> >> Supports building libraries and tools found in contrib/, lib/ and
> >> utils/ directories, along with the implemented gettext translations.
> >
> > Here's a patch on top of your tree:
> > https://gitlab.com/gjasny/v4l-utils/-/commit/a9853f79c2675bf08fc3e93f15aa4158c9769bdd
> >
> >
> > I changed the following:
> > * Use pkgconfig to detect libbpf (like configure.ac does)
> > * check for libbpf presence in the keytable subdir (like it's done for
> > libelf
> > * refined the empty rc_keymaps dir hack with something supported by
> > meson: https://github.com/mesonbuild/meson/issues/2904 (your hack
> > stopped working for me with meson on Ubuntu 20.04.2)
> [snip]
> > Tested-by: Gregor Jasny <gjasny@googlemail.com>
>
> Thanks a lot for your changes! LGTM, I'll add these changes, test and
> post a v5 asap.
I recommend adding c_std=gnu99 and cpp_std=gnu++11 to default_options
as otherwise compilation will fail with older compilers.

gnu is needed. the C variants do not work.
>
> Ariel
