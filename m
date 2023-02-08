Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72BF968F499
	for <lists+linux-media@lfdr.de>; Wed,  8 Feb 2023 18:32:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230370AbjBHRcW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Feb 2023 12:32:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231375AbjBHRcV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Feb 2023 12:32:21 -0500
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35E7834308
        for <linux-media@vger.kernel.org>; Wed,  8 Feb 2023 09:32:20 -0800 (PST)
Received: by mail-qk1-x729.google.com with SMTP id ay41so3827911qkb.5
        for <linux-media@vger.kernel.org>; Wed, 08 Feb 2023 09:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ab1RjUdxvP17+YGwr2cWF8s+ENzo57KFBShZI3lUZaA=;
        b=dfxnruPINjNPupZYXweFRu5h9z2HOASWI2s5bsoyRZLaIuhKPy783w+jBOyUYwKL1f
         4ga5HhDOj9gT4nSGM2uFITLBXvsOVfPSdHWvm185EwXzPRVDMDwAzUvvdj07oKl4TopS
         ErRuK9b6kbUv9+HVR7/Yv13SvTzfMv93oUO6BqmnxAL6TJGpbm+f9zTKULXV2guJWx3C
         DmkFMXbsVEUmhc5Iir3S2gY1tMkJxjDFePZWEHLOBIfFNtDbYfLYY/GXvPMVpo/tbB61
         Ffv7lbLzhUCDNhqVf9iteS3AL7aSOjqsiJYzSsyhwaRjdLp6CGHRdgc3HaVdVjsKY7jd
         x5Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ab1RjUdxvP17+YGwr2cWF8s+ENzo57KFBShZI3lUZaA=;
        b=UFR+MkU4GEZmTgXahS3S1xfncrLw9mugdcf99jcPfB6WS3IbodYdvqgFABelJC2QOd
         jrdDOsrZ8mdzQUh7sNIvi0n3H2KgQ0N2FdnHnEDnH1ZhvMp+/7/trsknc7ixmt47eewn
         f04qjKLyrif5aCkWuuHTH3l1ZR2u/wpFCXBHO87nD+hjpKsnLWUUIqiLS0sqYhq80VeJ
         usuru4Q8cSwkpx2XoOzLToOgWP9MLwbt7rapflkq/KAbg3NCx2X/GWG42NuXOxPCgkah
         Ye2Fx+x91mK8bLuLwLEOE0bIvH9fXR9IPv/p7OuSEs+2VibxgbzsNijc3p+Mqk9XdJzl
         O2iQ==
X-Gm-Message-State: AO0yUKUFeUaMGKG3T/YZXhYxr3VElZrUOabe+wmDVjy10Ab6Cam68G6b
        AlXPhyNlhBvZM7gOdjlC99QASRu10tT95i2Zetc=
X-Google-Smtp-Source: AK7set/8yzHFxOA1zz0vOqmp7SOH2rfQnyZiVpjaexktNnocUhy7OEJ4UUxky8bxv3T5hufGAI+Z5ijT9lzJEpFMVVw=
X-Received: by 2002:a37:9a97:0:b0:706:7bf0:3440 with SMTP id
 c145-20020a379a97000000b007067bf03440mr753000qke.9.1675877539199; Wed, 08 Feb
 2023 09:32:19 -0800 (PST)
MIME-Version: 1.0
References: <20230123125205.622152-1-hdegoede@redhat.com> <20230123125205.622152-29-hdegoede@redhat.com>
 <Y+Nw32EZUZtq3esL@pendragon.ideasonboard.com> <CAHp75VcyvON1-yoBsTsZDmjsA-527xyvF+weEXWcXjO3Y2hBrA@mail.gmail.com>
 <Y+PCulPVN7GGz2T7@pendragon.ideasonboard.com> <CAHp75VcEaEwFVyAm1QijXjw0tF+D9JSr2JET0RJUNMea4nGMew@mail.gmail.com>
 <Y+PH7V9vggOLDybV@pendragon.ideasonboard.com>
In-Reply-To: <Y+PH7V9vggOLDybV@pendragon.ideasonboard.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 8 Feb 2023 19:31:43 +0200
Message-ID: <CAHp75VeC8UM8WA-EECB98n+DZQ5J5kgdx5yrxnpYjpBRQjtQ-g@mail.gmail.com>
Subject: Re: [PATCH 28/57] media: Add ovxxxx_16bit_addr_reg_helpers.h
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Feb 8, 2023 at 6:04 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Wed, Feb 08, 2023 at 05:50:26PM +0200, Andy Shevchenko wrote:
> > On Wed, Feb 8, 2023 at 5:41 PM Laurent Pinchart wrote:
> > > On Wed, Feb 08, 2023 at 01:27:37PM +0200, Andy Shevchenko wrote:
> > > > On Wed, Feb 8, 2023 at 11:52 AM Laurent Pinchart wrote:
> > > > > On Mon, Jan 23, 2023 at 01:51:36PM +0100, Hans de Goede wrote:

...

> > > > > > Add a new ovxxxx_16bit_addr_reg_helpers.h header file with static inline
> > > > > > versions of these register access helpers, so that this code duplication
> > > > > > can be removed.
> > > > >
> > > > > Any reason to hand-roll those instead of using regmap ? Also, may I
> > > > > suggest to have a look at drivers/media/i2c/imx290.c
> > > >
> > > > While this is a bit error prone example, a patch is on its way, ...
> > >
> > > The two cleanups are nice, but they're cleanup, not error fixes :-)
> >
> > It depends on which side you look at it. I admit I haven't dug into
> > the code to see if endianess can be an issue there, but the code
> > itself is not written well, esp. when one offers it as an example. So
> > definitely there is a fix on the upper layer.
>
> Did I miss something ? Your two patches replace a tiny amount of code
> with helper functions that don't change any behaviour. It's nicer with
> those helpers, no question about that, but "not written well" is a bit
> of a stretch and feels quite insulting.

Sorry for your feelings, what I meant is the pure educational purposes
of the example. When one takes the mentioned driver as an example and
uses the code in a slightly different environment the endianess issue
may become a real one. That's why we have helpers in kernel to improve
robustness against blind copy'n'paste approach. It does not mean your
code is broken per se.

> Feel free to submit patches that
> add new "well-written" helpers.



-- 
With Best Regards,
Andy Shevchenko
