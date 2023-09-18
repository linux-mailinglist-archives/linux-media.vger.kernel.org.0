Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 234BF7A43F8
	for <lists+linux-media@lfdr.de>; Mon, 18 Sep 2023 10:09:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240446AbjIRIJN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Sep 2023 04:09:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240685AbjIRII6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Sep 2023 04:08:58 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1B2D18F
        for <linux-media@vger.kernel.org>; Mon, 18 Sep 2023 01:07:07 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A8762BB2;
        Mon, 18 Sep 2023 10:05:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1695024329;
        bh=twy1eqAgIAQzbY/nPMqlaipScVfwuZ6G9+vBD+zl+78=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rMT6QEkTKfpNgMcCRGqIQgjD3C75U5jw0NTfjBxoO9Le0qwlir81AIYTjruOPwhgl
         IwyFEhPOSQSydL/gFuCHZhwpq6vFtKgBkjeyaxbdJgNPudYLG0DFRCfIlnZ3ouK3mj
         8Qqa0KYtmWWNg1OvobqorXcnzr6tMfoU1K+oWYWg=
Date:   Mon, 18 Sep 2023 11:07:17 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH 05/57] media: i2c: imx214: Drop check for reentrant
 .s_stream()
Message-ID: <20230918080717.GA28874@pendragon.ideasonboard.com>
References: <20230914181704.4811-1-laurent.pinchart@ideasonboard.com>
 <20230914181704.4811-6-laurent.pinchart@ideasonboard.com>
 <CAPybu_3=V9dGFA+pw-0dm_y650_jDsKc-MvvrX3J=BUZgEK1HQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPybu_3=V9dGFA+pw-0dm_y650_jDsKc-MvvrX3J=BUZgEK1HQ@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

On Mon, Sep 18, 2023 at 09:52:32AM +0200, Ricardo Ribalda Delgado wrote:
> On Thu, Sep 14, 2023 at 8:17 PM Laurent Pinchart wrote:
> >
> > The subdev .s_stream() operation shall not be called to start streaming
> > on an already started subdev, or stop streaming on a stopped subdev.
> > Remove the check that guards against that condition.
> >
> 
> In general I agree with the patch, but I think it would be safer to
> land it in two stages.
> 
> first:
> 
>        if WARN_ON(imx214->streaming == enable)
>                return 0;
> 
> and in the next version replace it completely.

I don't want to send another series of 57 patches to remove the
WARN_ON() in a few kernel versions :-S Fortunately, it seems we have a
better option, I can centralize the check in call_s_stream() !

And, on a side note, how many kernel versions would we need before
removing the WARN_ON() ?

Something I have on my radar is replacing all direct .s_stream() calls
with v4l2_subdev_enable_streams() and v4l2_subdev_disable_streams(), but
that's more work than I can tackle at the moment.

> otherwise
> 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/i2c/imx214.c | 3 ---
> >  1 file changed, 3 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> > index 2f9c8582f940..e2805173f4b1 100644
> > --- a/drivers/media/i2c/imx214.c
> > +++ b/drivers/media/i2c/imx214.c
> > @@ -775,9 +775,6 @@ static int imx214_s_stream(struct v4l2_subdev *subdev, int enable)
> >         struct imx214 *imx214 = to_imx214(subdev);
> >         int ret;
> >
> > -       if (imx214->streaming == enable)
> > -               return 0;
> > -
> >         if (enable) {
> >                 ret = pm_runtime_resume_and_get(imx214->dev);
> >                 if (ret < 0)

-- 
Regards,

Laurent Pinchart
