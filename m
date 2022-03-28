Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F6F14E9BF6
	for <lists+linux-media@lfdr.de>; Mon, 28 Mar 2022 18:09:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241205AbiC1QJJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Mar 2022 12:09:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238285AbiC1QJI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Mar 2022 12:09:08 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18E104EA2E
        for <linux-media@vger.kernel.org>; Mon, 28 Mar 2022 09:07:28 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7FEB52F7;
        Mon, 28 Mar 2022 18:07:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1648483646;
        bh=j0G8aK0Hes8SZwzWroJkQ5QMaPmx5A7SJuHzjpmdZaA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YiRWb4RMCkuv/lLrk9d4DHk/zbYva1oshtXV36oMJzkn3tbAPAmDwjHV37WWASUAZ
         +AL1XoSqP0aR6Wa0Koa5cVDbIDazfznwPVqsu0YH6sOo9WWseSQgc5nbf3bYHUoTQc
         WZiAm7lt+9B0a0YVQWDytw/IviCiNEPADUd+EPaQ=
Date:   Mon, 28 Mar 2022 19:07:24 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl
Subject: Re: [PATCH] media-ctl: Add MEDIA_BUS_FMT_JPEG_1X8
Message-ID: <YkHdPFOdlX2fJL8E@pendragon.ideasonboard.com>
References: <20220328135628.96966-1-jacopo@jmondi.org>
 <YkHZ0uP5uLNOP2Wh@pendragon.ideasonboard.com>
 <20220328160159.kesxqrowhkkqn6y3@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220328160159.kesxqrowhkkqn6y3@uno.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Mar 28, 2022 at 06:01:59PM +0200, Jacopo Mondi wrote:
> On Mon, Mar 28, 2022 at 06:52:50PM +0300, Laurent Pinchart wrote:
> > On Mon, Mar 28, 2022 at 03:56:28PM +0200, Jacopo Mondi wrote:
> > > Add the "JPEG" identifier to enable setting MEDIA_BUS_FMT_JPEG_1X8
> > > media bus code.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > > ---
> > >  utils/media-ctl/libv4l2subdev.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/utils/media-ctl/libv4l2subdev.c b/utils/media-ctl/libv4l2subdev.c
> > > index eb9e1cc43b7e..0f9ccc0a1552 100644
> > > --- a/utils/media-ctl/libv4l2subdev.c
> > > +++ b/utils/media-ctl/libv4l2subdev.c
> > > @@ -1084,6 +1084,7 @@ static const struct {
> > >  	{ "RBG24", MEDIA_BUS_FMT_RBG888_1X24 },
> > >  	{ "RGB32", MEDIA_BUS_FMT_RGB888_1X32_PADHI },
> > >  	{ "ARGB32", MEDIA_BUS_FMT_ARGB8888_1X32 },
> > > +	{ "JPEG", MEDIA_BUS_FMT_JPEG_1X8 },
> >
> > I've just realized that media-ctl already supports JPEG, with the
> > "JPEG_1X8" format name. It looks like adding a shorter name isn't
> > needed.
> 
> $ git remote -v | grep origin
> origin	git://linuxtv.org/v4l-utils.git (fetch)
> 
> $ git grep JPEG origin/master  -- utils/media-ctl/
> origin/master:utils/media-ctl/libv4l2subdev.c:  { "jpeg", V4L2_COLORSPACE_JPEG },
> 
> What am I missing ?

#include "media-bus-format-names.h"

in utils/media-ctl/libv4l2subdev.c. That header is generated
automatically from the kernel headers.

> > >  };
> > >
> > >  const char *v4l2_subdev_pixelcode_to_string(enum v4l2_mbus_pixelcode code)

-- 
Regards,

Laurent Pinchart
