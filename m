Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3B3860B14D
	for <lists+linux-media@lfdr.de>; Mon, 24 Oct 2022 18:19:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234352AbiJXQSw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Oct 2022 12:18:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234220AbiJXQRI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Oct 2022 12:17:08 -0400
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [IPv6:2001:4b98:dc4:8::240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 070A1B18F0
        for <linux-media@vger.kernel.org>; Mon, 24 Oct 2022 08:04:17 -0700 (PDT)
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id A2C9FC0F35
        for <linux-media@vger.kernel.org>; Mon, 24 Oct 2022 13:11:29 +0000 (UTC)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 81AE5FF804;
        Mon, 24 Oct 2022 13:10:47 +0000 (UTC)
Date:   Mon, 24 Oct 2022 15:10:45 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2 05/10] media: ar0521: Refuse unsupported controls
Message-ID: <20221024131045.jyi3yoqtmpvdaaga@uno.localdomain>
References: <20221022092015.208592-1-jacopo@jmondi.org>
 <20221022092015.208592-6-jacopo@jmondi.org>
 <CAPY8ntBya1-rUkQH9wiERUof-01puoLej7t6BHKAr1ot-iHe9g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntBya1-rUkQH9wiERUof-01puoLej7t6BHKAr1ot-iHe9g@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Ups, trivial mistake sorry

Thanks for spotting

On Mon, Oct 24, 2022 at 02:00:28PM +0100, Dave Stevenson wrote:
> Hi Jacopo
>
> On Sat, 22 Oct 2022 at 11:13, Jacopo Mondi <jacopo@jmondi.org> wrote:
> >
> > Refuse unsupported controls by returning -EINVAL in the s_ctrl
> > operation.
> >
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> >
> > ---
> >  drivers/media/i2c/ar0521.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
> > index e673424880ac..fcd852760750 100644
> > --- a/drivers/media/i2c/ar0521.c
> > +++ b/drivers/media/i2c/ar0521.c
> > @@ -547,6 +547,10 @@ static int ar0521_s_ctrl(struct v4l2_ctrl *ctrl)
> >                 ret = ar0521_write_reg(sensor, AR0521_REG_TEST_PATTERN_MODE,
> >                                        ctrl->val);
> >                 break;
> > +       default:
> > +               dev_err(&sensor->i2c_client->dev,
> > +                       "Unsupported control %x\n", ctrl->id);
> > +               return -EINVAL;
> >         }
> >
> >         pm_runtime_put(&sensor->i2c_client->dev);
>
> In the default case you've returned without doing the pm_runtime_put,
> so pm is going to be unbalanced.
>
> default:
>   dev_err(...)
>   ret = -EINVAL;
>   break;
> would avoid that.
>
>   Dave
>
> > --
> > 2.37.3
> >
