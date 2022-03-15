Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD7F24D9B30
	for <lists+linux-media@lfdr.de>; Tue, 15 Mar 2022 13:28:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348269AbiCOM3P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Mar 2022 08:29:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235801AbiCOM3J (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Mar 2022 08:29:09 -0400
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::223])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E2A910E2
        for <linux-media@vger.kernel.org>; Tue, 15 Mar 2022 05:27:53 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id A195B60002;
        Tue, 15 Mar 2022 12:27:50 +0000 (UTC)
Date:   Tue, 15 Mar 2022 13:27:48 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        Paul Elder <paul.elder@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH 4/5] media: imx: imx-mipi-csis: Remove duplicated check
Message-ID: <20220315122748.npt244uyzvewqmhw@uno.localdomain>
References: <20220314103941.46021-1-jacopo@jmondi.org>
 <20220314103941.46021-5-jacopo@jmondi.org>
 <YjB4zDdyQxJG6u7U@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YjB4zDdyQxJG6u7U@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Mar 15, 2022 at 01:30:20PM +0200, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Mon, Mar 14, 2022 at 11:39:40AM +0100, Jacopo Mondi wrote:
> > The mipi_csis_log_counters() function already checks for
> > csis->debug.enable, it is not necessary to do the same in the caller.
>
> Does it ? It does only to decide whether or not to print counters that
> have a zero value.
>

Roght, I mis-read the condition there.

What is the usage of the counters logger ? Should we make it
conditional to debug.enable ?

Thanks
  j

> > Compatc the code in the caller as well by removing an empty line.
> >
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >  drivers/media/platform/imx/imx-mipi-csis.c | 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
> >
> > diff --git a/drivers/media/platform/imx/imx-mipi-csis.c b/drivers/media/platform/imx/imx-mipi-csis.c
> > index 4a6152c13d52..4bb469fcb6b3 100644
> > --- a/drivers/media/platform/imx/imx-mipi-csis.c
> > +++ b/drivers/media/platform/imx/imx-mipi-csis.c
> > @@ -913,11 +913,8 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
> >
> >  	if (!enable) {
> >  		v4l2_subdev_call(csis->src_sd, video, s_stream, 0);
> > -
> >  		mipi_csis_stop_stream(csis);
> > -		if (csis->debug.enable)
> > -			mipi_csis_log_counters(csis, true);
> > -
> > +		mipi_csis_log_counters(csis, true);
> >  		pm_runtime_put(csis->dev);
> >
> >  		return 0;
>
> --
> Regards,
>
> Laurent Pinchart
