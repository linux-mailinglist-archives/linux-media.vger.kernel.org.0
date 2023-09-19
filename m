Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 438187A6CA4
	for <lists+linux-media@lfdr.de>; Tue, 19 Sep 2023 23:02:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233294AbjISVDC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Sep 2023 17:03:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233278AbjISVDB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Sep 2023 17:03:01 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F517BD
        for <linux-media@vger.kernel.org>; Tue, 19 Sep 2023 14:02:55 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1ED5BFA2;
        Tue, 19 Sep 2023 23:01:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1695157277;
        bh=cSeBrBOja1lDgLVdGaLBONasuuOkuYt9/TPyW/Jin+g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FDv2qqizDk5sAWNeDIibnCW9FDSrn0IRkFTzcwbT4abMNPKlzRiC0CcaFi8fZCQYh
         wlYHH6Yi99CD637kVBmtXExUZwldAT335QmoHCiQ5dOQei4XSqTxBucMUxM1bgHsMh
         ePqGS++YNOwtp/qFhHm9LvFBXZ4rJkN6mWfi5/jg=
Date:   Wed, 20 Sep 2023 00:03:06 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org, Ricardo Ribalda <ricardo@ribalda.com>,
        hverkuil@xs4all.nl
Subject: Re: [PATCH] yavta: Format type errors for non x86 arches
Message-ID: <20230919210306.GD24325@pendragon.ideasonboard.com>
References: <20230919140123.6277-1-ricardo@ribalda.com>
 <ZQn/aXrIx7ItvrXI@valkosipuli.retiisi.eu>
 <CANiDSCvX03=dwmE6jDvfSPzFwrhbKwLmVpwkOY-6k4uGbvZBuw@mail.gmail.com>
 <ZQoDIbeg00j3STdW@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZQoDIbeg00j3STdW@valkosipuli.retiisi.eu>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Sep 19, 2023 at 08:22:57PM +0000, Sakari Ailus wrote:
> Hi Ricardo,
> 
> On Tue, Sep 19, 2023 at 10:10:41PM +0200, Ricardo Ribalda wrote:
> > Hi Sakari
> > 
> > On Tue, 19 Sept 2023 at 22:07, Sakari Ailus <sakari.ailus@iki.fi> wrote:
> > >
> > > Hi Ricardo,
> > >
> > > Thanks for the patch.
> > >
> > > On Tue, Sep 19, 2023 at 04:01:23PM +0200, Ricardo Ribalda wrote:
> > > > mipsel64el, ppc64el, ia64, ppc64, sparc64 and x32 have different lenghts
> > > > for long long ints, which result in some compilation errors.
> > > >
> > > > Lets add some castings to help the compiler deal with this.
> > > >
> > > > We cannot use the Format macro constants ffrom inttypes because they
> > > > seem to not be compatible with kernel (__u64 et al) types.
> > > >
> > > > Signed-off-by: Ricardo Ribalda <ricardo@ribalda.com>
> > > > ---
> > > >  yavta.c | 35 +++++++++++++++++++++--------------
> > > >  1 file changed, 21 insertions(+), 14 deletions(-)
> > > >
> > > > diff --git a/yavta.c b/yavta.c
> > > > index d562863..bf54e4f 100644
> > > > --- a/yavta.c
> > > > +++ b/yavta.c
> > > > @@ -1313,7 +1313,8 @@ static void video_query_menu(struct device *dev,
> > > >                       printf("  %u: %.32s%s\n", menu.index, menu.name,
> > > >                              menu.index == value ? " (*)" : "");
> > > >               else
> > > > -                     printf("  %u: %lld%s\n", menu.index, menu.value,
> > > > +                     printf("  %u: %lld%s\n", menu.index,
> > >
> > > Could you instead use PRId64 for this? You can avoid casting to another
> > > type this way. Same for the other cases.
> > 
> > Already tried this:
> > 
> > @@ -1313,7 +1313,7 @@ static void video_query_menu(struct device *dev,
> >                         printf("  %u: %.32s%s\n", menu.index, menu.name,
> >                                menu.index == value ? " (*)" : "");
> >                 else
> > -                       printf("  %u: %lld%s\n", menu.index, menu.value,
> > +                       printf("  %u: %" PRId64 "%s\n", menu.index, menu.value,
> >                                menu.index == value ? " (*)" : "");
> >         };
> >  }
> > 
> > but gcc was not happy:
> > 
> > yavta.c: In function ‘video_query_menu’:
> > yavta.c:1316:11: warning: format ‘%ld’ expects argument of type ‘long
> > int’, but argument 3 has type ‘__s64’ {aka ‘long long int’}
> > [-Wformat=]
> >  1316 |    printf("  %u: %" PRId64 "%s\n", menu.index, menu.value,
> >       |           ^~~~~~~~~                            ~~~~~~~~~~
> >       |                                                    |
> >       |                                                    __s64 {aka
> > long long int}
> > In file included from yavta.c:26:
> > /usr/include/inttypes.h:57:34: note: format string is defined here
> >    57 | # define PRId64  __PRI64_PREFIX "d"
> 
> I guess I should have expected this...
> 
> I'm not sure if it'd be prettier but another option is to use the PRI*
> macros and explicitly cast to a standard type.
> 
> Using the standard types in the V4L2 header would have avoided this issue.
> I wonder if there's anything to be gained by using the kernel types.

The kernel has defined __s64 as signed int int for a long time now, on
all architectures, at least since

commit 0c79a8e29b5fcbcbfd611daf9d500cfad8370fcf
Author: Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu Jan 23 15:53:43 2014 -0800

    asm/types.h: Remove include/asm-generic/int-l64.h

which was merged in v3.14.

According to https://buildd.debian.org/status/package.php?p=yavta,
however, __s64 seems to be defined as long int on some platforms.

/me is puzzled

> Cc Hans, too.
> 
> > So I took the shotgun and fixed it with castings :)
> 
> :-)

-- 
Regards,

Laurent Pinchart
