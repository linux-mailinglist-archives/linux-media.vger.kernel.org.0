Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 099EE7A80B8
	for <lists+linux-media@lfdr.de>; Wed, 20 Sep 2023 14:40:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235933AbjITMk1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Sep 2023 08:40:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236409AbjITMkJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Sep 2023 08:40:09 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA8EEAD
        for <linux-media@vger.kernel.org>; Wed, 20 Sep 2023 05:40:02 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkzdf0gkyyyyyyyyyyyyt-3.rev.dnainternet.fi [IPv6:2001:14ba:4506:4f15::1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 4RrJ5W0dtPzyZn;
        Wed, 20 Sep 2023 15:39:59 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1695213600;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=79Ei/FRaBoy3rBAVl7+00TgHvZdVKYel1U0Tz+BYqy4=;
        b=SSrP6Km6i9zerIuIH5b2264p8mU0vYxSOLVYtTgVgXtHBU21YU0gPystw+sO/R3N+nK/82
        EpidAFDPUo1pPRhhvIV2qnoj+9QVdMC7r7HhratS267siey/Z4X7Nq6or5h2jTul+0Mgxp
        xzl75ays5u3MtJ58d0y2dZDt5rkuKGg=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1695213600; a=rsa-sha256; cv=none;
        b=ybZoPmbaf7zf6gLtT07hbMH+TGJcy9NQJ5N2h+e3jA4NBsOrQQg5lVmByLWUnWmnfBxxiS
        ZT05f4s8374mnXvg83kCVlXRSRgrxYq/OHDGTeGdqV7nPQI5qxh/29cAWTohFOE6DzPQKN
        oEkmiakIpZ1biZIGIOreSg3k2JovJSo=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1695213600;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=79Ei/FRaBoy3rBAVl7+00TgHvZdVKYel1U0Tz+BYqy4=;
        b=KFSDlJ2a8lTjWWY4qci/asvdCCqVWc8NdhVH7R7VDBxWHkz7C96eka+SaI74jYQEkv+MXO
        qaIdyp+Gm7mkSkAkW+AQOEITXNh/sZSGr47H+O/V/ju8BjZ32c4ouHBcAdSufJBCRKW3wE
        OZfctPYyC3yN1j9yxWjsfLbGi5upUMQ=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 7C775634C93;
        Wed, 20 Sep 2023 15:39:58 +0300 (EEST)
Date:   Wed, 20 Sep 2023 12:39:58 +0000
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, Ricardo Ribalda <ricardo@ribalda.com>,
        hverkuil@xs4all.nl
Subject: Re: [PATCH] yavta: Format type errors for non x86 arches
Message-ID: <ZQroHhGjbOcocsHt@valkosipuli.retiisi.eu>
References: <20230919140123.6277-1-ricardo@ribalda.com>
 <ZQn/aXrIx7ItvrXI@valkosipuli.retiisi.eu>
 <CANiDSCvX03=dwmE6jDvfSPzFwrhbKwLmVpwkOY-6k4uGbvZBuw@mail.gmail.com>
 <ZQoDIbeg00j3STdW@valkosipuli.retiisi.eu>
 <20230919210306.GD24325@pendragon.ideasonboard.com>
 <CANiDSCu6wsoogSd=8MfmyJNkk+Ocs3wfk-b6Yx+G8L1QEHhArw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiDSCu6wsoogSd=8MfmyJNkk+Ocs3wfk-b6Yx+G8L1QEHhArw@mail.gmail.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

On Wed, Sep 20, 2023 at 02:19:54PM +0200, Ricardo Ribalda wrote:
> Hi Laurent, Hi Sakari
> 
> 
> 
> On Tue, 19 Sept 2023 at 23:02, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > On Tue, Sep 19, 2023 at 08:22:57PM +0000, Sakari Ailus wrote:
> > > Hi Ricardo,
> > >
> > > On Tue, Sep 19, 2023 at 10:10:41PM +0200, Ricardo Ribalda wrote:
> > > > Hi Sakari
> > > >
> > > > On Tue, 19 Sept 2023 at 22:07, Sakari Ailus <sakari.ailus@iki.fi> wrote:
> > > > >
> > > > > Hi Ricardo,
> > > > >
> > > > > Thanks for the patch.
> > > > >
> > > > > On Tue, Sep 19, 2023 at 04:01:23PM +0200, Ricardo Ribalda wrote:
> > > > > > mipsel64el, ppc64el, ia64, ppc64, sparc64 and x32 have different lenghts
> > > > > > for long long ints, which result in some compilation errors.
> > > > > >
> > > > > > Lets add some castings to help the compiler deal with this.
> > > > > >
> > > > > > We cannot use the Format macro constants ffrom inttypes because they
> > > > > > seem to not be compatible with kernel (__u64 et al) types.
> > > > > >
> > > > > > Signed-off-by: Ricardo Ribalda <ricardo@ribalda.com>
> > > > > > ---
> > > > > >  yavta.c | 35 +++++++++++++++++++++--------------
> > > > > >  1 file changed, 21 insertions(+), 14 deletions(-)
> > > > > >
> > > > > > diff --git a/yavta.c b/yavta.c
> > > > > > index d562863..bf54e4f 100644
> > > > > > --- a/yavta.c
> > > > > > +++ b/yavta.c
> > > > > > @@ -1313,7 +1313,8 @@ static void video_query_menu(struct device *dev,
> > > > > >                       printf("  %u: %.32s%s\n", menu.index, menu.name,
> > > > > >                              menu.index == value ? " (*)" : "");
> > > > > >               else
> > > > > > -                     printf("  %u: %lld%s\n", menu.index, menu.value,
> > > > > > +                     printf("  %u: %lld%s\n", menu.index,
> > > > >
> > > > > Could you instead use PRId64 for this? You can avoid casting to another
> > > > > type this way. Same for the other cases.
> > > >
> > > > Already tried this:
> > > >
> > > > @@ -1313,7 +1313,7 @@ static void video_query_menu(struct device *dev,
> > > >                         printf("  %u: %.32s%s\n", menu.index, menu.name,
> > > >                                menu.index == value ? " (*)" : "");
> > > >                 else
> > > > -                       printf("  %u: %lld%s\n", menu.index, menu.value,
> > > > +                       printf("  %u: %" PRId64 "%s\n", menu.index, menu.value,
> > > >                                menu.index == value ? " (*)" : "");
> > > >         };
> > > >  }
> > > >
> > > > but gcc was not happy:
> > > >
> > > > yavta.c: In function ‘video_query_menu’:
> > > > yavta.c:1316:11: warning: format ‘%ld’ expects argument of type ‘long
> > > > int’, but argument 3 has type ‘__s64’ {aka ‘long long int’}
> > > > [-Wformat=]
> > > >  1316 |    printf("  %u: %" PRId64 "%s\n", menu.index, menu.value,
> > > >       |           ^~~~~~~~~                            ~~~~~~~~~~
> > > >       |                                                    |
> > > >       |                                                    __s64 {aka
> > > > long long int}
> > > > In file included from yavta.c:26:
> > > > /usr/include/inttypes.h:57:34: note: format string is defined here
> > > >    57 | # define PRId64  __PRI64_PREFIX "d"
> > >
> > > I guess I should have expected this...
> > >
> > > I'm not sure if it'd be prettier but another option is to use the PRI*
> > > macros and explicitly cast to a standard type.
> 
> I would like to avoid
> 
>   printf(" Hello %" PRId64 "\n", (uint64_t) value_s64);
> 
> That looks very bad :)

I actually prefer this. It doesn't look bad either IMO, apart from the PRI*
macros that are always ugly, but most importantly you're explicitly using
64-bit types that work everywhere.

> 
> I believe the current casting is the least of the two evils.
> 
> 
> > >
> > > Using the standard types in the V4L2 header would have avoided this issue.
> > > I wonder if there's anything to be gained by using the kernel types.
> >
> > The kernel has defined __s64 as signed int int for a long time now, on
> > all architectures, at least since
> >
> > commit 0c79a8e29b5fcbcbfd611daf9d500cfad8370fcf
> > Author: Geert Uytterhoeven <geert@linux-m68k.org>
> > Date:   Thu Jan 23 15:53:43 2014 -0800
> >
> >     asm/types.h: Remove include/asm-generic/int-l64.h
> >
> > which was merged in v3.14.
> >
> > According to https://buildd.debian.org/status/package.php?p=yavta,
> > however, __s64 seems to be defined as long int on some platforms.
> >
> > /me is puzzled
> 
> It does not help that __s64 is long long int and PRId64 is "d". I
> guess we can say that inttypes and kernel types do not play along?

I haven't encountered this issue in the past but I also haven't tried
compiling for odd architectures.

> 
> I guess we need kerntypes.h with proper KPRId64 but that is probably
> out of scope here.

This could even depend on the compiler.

I wonder why we aren't using

	typedef uint64_t __u64;

in kernel UAPI headers instead. Including inttypes.h should not be an issue
in 2023 anymore.

This problem is certainly wider in scope than yavta.

-- 
Regards,

Sakari Ailus
