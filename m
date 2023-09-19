Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA6617A6C4A
	for <lists+linux-media@lfdr.de>; Tue, 19 Sep 2023 22:23:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233217AbjISUXJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Sep 2023 16:23:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233218AbjISUXI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Sep 2023 16:23:08 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EC82BA
        for <linux-media@vger.kernel.org>; Tue, 19 Sep 2023 13:23:01 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkzdf0gkyyyyyyyyyyyyt-3.rev.dnainternet.fi [IPv6:2001:14ba:4506:4f15::1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4RqtQB4MBSz49Psw;
        Tue, 19 Sep 2023 23:22:58 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1695154978;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bF8zx/Wz0iEYT9WuIIRQ5G38iRZQkKO5k8XeJDKrCZ0=;
        b=i3E7VYrGpn+3OeGNGpKOvRf0EEE2D/zC4JnhdoYmulDOEf1IANM6lrBEaB2WC2LafxL598
        ysu/D08q4czcr/hOALltN14nPIpT/4WgncHzYUPSig8lAEc1+4sjSjeAe0dW84Wb4eMKtJ
        wddgJ20F1ZUqDC+Go5MU3ApDrShDJiegflVtm+GIqDdUHkp+vDWnDymVkkJAmtcKvoHJGt
        5MKrxPGDR4+YlGZJF/3Q0dZL4vTeV1/yiz+2dF8aPZOY9MbcsD5Z3++M8rACDJjyjN4Y0H
        3uW9W1G1HxM1PLShta/OakGpnzzy7fW0IOiKRsTGJiN8ZtgiFoYQ2m6tRrPONQ==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1695154978; a=rsa-sha256;
        cv=none;
        b=uofM1c8bZtRAGhJfztDp95M58mo9DVx70Zi1sNBskWAWId0fPrtqFURZWKMOajzYo3qyqI
        7G5Z25TqRpUlgU/fs4T3aBd8frMGX7hNNzR81kE0qtvlOMsClZ/tDsMq6t598i1t/a5i+H
        8Zs3IzdvI4ECdh0EKqJbPZAAvxT0gjxVHv0XhF4Hq1ygrM6dDK9hZsghxqdgAs1x1fcc5v
        NJersQkChiYDdXTshgURv08wcswhEybVU+ZazSekQmrl5iuik/ZCBsNPCKM9FE7pLVUYVy
        MA7tm+PwyJC4cW4Dulg+E6msQuoA+jeafMnoaDgAMmFyUagmG/qPn0scYCKrIg==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1695154978;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bF8zx/Wz0iEYT9WuIIRQ5G38iRZQkKO5k8XeJDKrCZ0=;
        b=Zu2KoWLWT46d0iwr0gPpKfhAgI8pahrLvwRMQLCBsVNVIBMr+9/pJaGhFy5U+f0Oagei8G
        DrGuHKdCnjr0nuu5TAT71JRty/73BaZ3JMIRk/7WU4ze9TpvBjudUZHOchtm5C35FDCHni
        21zoGvl3I/T14N8vcIbuxKcWW/3njoSqCbQnfdYM9gGbuwJrIewFGVKTTzsBzT5lfCqPFT
        WIrp8RGVJe9q5ogZzkAGRB2Yq8d9QXWxt7+2tERX5NVIDUk42TDulnqAJWA0CZDlx+9Fc7
        7Qo7oW0N/l8WlIcIepI2bLWG/SArjnb9+AcUvU73khluAsMJXrNq43AL7h4Vaw==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 228FF634C93;
        Tue, 19 Sep 2023 23:22:58 +0300 (EEST)
Date:   Tue, 19 Sep 2023 20:22:57 +0000
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        Ricardo Ribalda <ricardo@ribalda.com>, hverkuil@xs4all.nl
Subject: Re: [PATCH] yavta: Format type errors for non x86 arches
Message-ID: <ZQoDIbeg00j3STdW@valkosipuli.retiisi.eu>
References: <20230919140123.6277-1-ricardo@ribalda.com>
 <ZQn/aXrIx7ItvrXI@valkosipuli.retiisi.eu>
 <CANiDSCvX03=dwmE6jDvfSPzFwrhbKwLmVpwkOY-6k4uGbvZBuw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiDSCvX03=dwmE6jDvfSPzFwrhbKwLmVpwkOY-6k4uGbvZBuw@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

On Tue, Sep 19, 2023 at 10:10:41PM +0200, Ricardo Ribalda wrote:
> Hi Sakari
> 
> On Tue, 19 Sept 2023 at 22:07, Sakari Ailus <sakari.ailus@iki.fi> wrote:
> >
> > Hi Ricardo,
> >
> > Thanks for the patch.
> >
> > On Tue, Sep 19, 2023 at 04:01:23PM +0200, Ricardo Ribalda wrote:
> > > mipsel64el, ppc64el, ia64, ppc64, sparc64 and x32 have different lenghts
> > > for long long ints, which result in some compilation errors.
> > >
> > > Lets add some castings to help the compiler deal with this.
> > >
> > > We cannot use the Format macro constants ffrom inttypes because they
> > > seem to not be compatible with kernel (__u64 et al) types.
> > >
> > > Signed-off-by: Ricardo Ribalda <ricardo@ribalda.com>
> > > ---
> > >  yavta.c | 35 +++++++++++++++++++++--------------
> > >  1 file changed, 21 insertions(+), 14 deletions(-)
> > >
> > > diff --git a/yavta.c b/yavta.c
> > > index d562863..bf54e4f 100644
> > > --- a/yavta.c
> > > +++ b/yavta.c
> > > @@ -1313,7 +1313,8 @@ static void video_query_menu(struct device *dev,
> > >                       printf("  %u: %.32s%s\n", menu.index, menu.name,
> > >                              menu.index == value ? " (*)" : "");
> > >               else
> > > -                     printf("  %u: %lld%s\n", menu.index, menu.value,
> > > +                     printf("  %u: %lld%s\n", menu.index,
> >
> > Could you instead use PRId64 for this? You can avoid casting to another
> > type this way. Same for the other cases.
> 
> Already tried this:
> 
> @@ -1313,7 +1313,7 @@ static void video_query_menu(struct device *dev,
>                         printf("  %u: %.32s%s\n", menu.index, menu.name,
>                                menu.index == value ? " (*)" : "");
>                 else
> -                       printf("  %u: %lld%s\n", menu.index, menu.value,
> +                       printf("  %u: %" PRId64 "%s\n", menu.index, menu.value,
>                                menu.index == value ? " (*)" : "");
>         };
>  }
> 
> but gcc was not happy:
> 
> yavta.c: In function ‘video_query_menu’:
> yavta.c:1316:11: warning: format ‘%ld’ expects argument of type ‘long
> int’, but argument 3 has type ‘__s64’ {aka ‘long long int’}
> [-Wformat=]
>  1316 |    printf("  %u: %" PRId64 "%s\n", menu.index, menu.value,
>       |           ^~~~~~~~~                            ~~~~~~~~~~
>       |                                                    |
>       |                                                    __s64 {aka
> long long int}
> In file included from yavta.c:26:
> /usr/include/inttypes.h:57:34: note: format string is defined here
>    57 | # define PRId64  __PRI64_PREFIX "d"

I guess I should have expected this...

I'm not sure if it'd be prettier but another option is to use the PRI*
macros and explicitly cast to a standard type.

Using the standard types in the V4L2 header would have avoided this issue.
I wonder if there's anything to be gained by using the kernel types.

Cc Hans, too.

> 
> So I took the shotgun and fixed it with castings :)

:-)

-- 
Regards,

Sakari Ailus
