Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 974134E9BCD
	for <lists+linux-media@lfdr.de>; Mon, 28 Mar 2022 18:03:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240772AbiC1QDu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Mar 2022 12:03:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238088AbiC1QDo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Mar 2022 12:03:44 -0400
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [IPv6:2001:4b98:dc4:8::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5936162100
        for <linux-media@vger.kernel.org>; Mon, 28 Mar 2022 09:02:03 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 12C9D100003;
        Mon, 28 Mar 2022 16:02:00 +0000 (UTC)
Date:   Mon, 28 Mar 2022 18:01:59 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl
Subject: Re: [PATCH] media-ctl: Add MEDIA_BUS_FMT_JPEG_1X8
Message-ID: <20220328160159.kesxqrowhkkqn6y3@uno.localdomain>
References: <20220328135628.96966-1-jacopo@jmondi.org>
 <YkHZ0uP5uLNOP2Wh@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YkHZ0uP5uLNOP2Wh@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Mon, Mar 28, 2022 at 06:52:50PM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Mon, Mar 28, 2022 at 03:56:28PM +0200, Jacopo Mondi wrote:
> > Add the "JPEG" identifier to enable setting MEDIA_BUS_FMT_JPEG_1X8
> > media bus code.
> >
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >  utils/media-ctl/libv4l2subdev.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/utils/media-ctl/libv4l2subdev.c b/utils/media-ctl/libv4l2subdev.c
> > index eb9e1cc43b7e..0f9ccc0a1552 100644
> > --- a/utils/media-ctl/libv4l2subdev.c
> > +++ b/utils/media-ctl/libv4l2subdev.c
> > @@ -1084,6 +1084,7 @@ static const struct {
> >  	{ "RBG24", MEDIA_BUS_FMT_RBG888_1X24 },
> >  	{ "RGB32", MEDIA_BUS_FMT_RGB888_1X32_PADHI },
> >  	{ "ARGB32", MEDIA_BUS_FMT_ARGB8888_1X32 },
> > +	{ "JPEG", MEDIA_BUS_FMT_JPEG_1X8 },
>
> I've just realized that media-ctl already supports JPEG, with the
> "JPEG_1X8" format name. It looks like adding a shorter name isn't
> needed.

$ git remote -v | grep origin
origin	git://linuxtv.org/v4l-utils.git (fetch)

$ git grep JPEG origin/master  -- utils/media-ctl/
origin/master:utils/media-ctl/libv4l2subdev.c:  { "jpeg", V4L2_COLORSPACE_JPEG },

What am I missing ?

>
> >  };
> >
> >  const char *v4l2_subdev_pixelcode_to_string(enum v4l2_mbus_pixelcode code)
>
> --
> Regards,
>
> Laurent Pinchart
