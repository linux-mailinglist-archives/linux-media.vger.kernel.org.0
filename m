Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A02615F74A5
	for <lists+linux-media@lfdr.de>; Fri,  7 Oct 2022 09:23:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229539AbiJGHXj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Oct 2022 03:23:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbiJGHXi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Oct 2022 03:23:38 -0400
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [IPv6:2001:4b98:dc4:8::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C57CC0687
        for <linux-media@vger.kernel.org>; Fri,  7 Oct 2022 00:23:36 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 4FA21240006;
        Fri,  7 Oct 2022 07:23:32 +0000 (UTC)
Date:   Fri, 7 Oct 2022 09:23:31 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 08/10] media: ar0521: Setup controls at s_stream time
Message-ID: <20221007072331.ugocsdzfpu5gt7aw@uno.localdomain>
References: <20221005190613.394277-1-jacopo@jmondi.org>
 <20221005190613.394277-9-jacopo@jmondi.org>
 <CAPY8ntDk1WqDwFRg9jt01tEvpGwpxiCRkP7pw4H6Qwxxz3Fgng@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntDk1WqDwFRg9jt01tEvpGwpxiCRkP7pw4H6Qwxxz3Fgng@mail.gmail.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave

On Thu, Oct 06, 2022 at 04:43:14PM +0100, Dave Stevenson wrote:
> On Wed, 5 Oct 2022 at 20:07, Jacopo Mondi <jacopo@jmondi.org> wrote:
> >
> > Setup all the registered controls at s_stream(1) time instead of
> > manually configure gains.
> >
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
>
> Ah, lovely. I'm surprised it doesn't error out with no s_ctrl handler
> for link_freq when r/w though.
>

I don't have the usual safety "default: return -EINVAL" case in my
s_ctrl handler.

Will fix that!

> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
>
> > ---
> >  drivers/media/i2c/ar0521.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
> > index 26bb1b8f7453..d46a51332964 100644
> > --- a/drivers/media/i2c/ar0521.c
> > +++ b/drivers/media/i2c/ar0521.c
> > @@ -460,7 +460,7 @@ static int ar0521_set_stream(struct ar0521_dev *sensor, bool on)
> >                 if (ret)
> >                         goto err;
> >
> > -               ret = ar0521_set_gains(sensor);
> > +               ret =  __v4l2_ctrl_handler_setup(&sensor->ctrls.handler);
> >                 if (ret)
> >                         goto err;
> >
> > --
> > 2.37.3
> >
