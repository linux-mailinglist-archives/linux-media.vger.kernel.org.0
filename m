Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE36B5616C3
	for <lists+linux-media@lfdr.de>; Thu, 30 Jun 2022 11:48:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234509AbiF3Jsg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jun 2022 05:48:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230129AbiF3Jsf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jun 2022 05:48:35 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F4D321E29
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 02:48:33 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 54F8D45F;
        Thu, 30 Jun 2022 11:48:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656582510;
        bh=PdaICH8IuIVDmYd4sKUKxVIxzvrzS28qsic5X9aOuWI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VE/MdTDMPC0J/klZFkDyvO5Yg7oaXKt2kWp/Fi7n0Z2wD1rUXHT/MwQJ94JrEdWG/
         XjP6u1y3v3+ik3Fg1smlE7aevs/GrPY9WIm2phbG8UAvR3S/BuhD6y7IjawIHqXp3q
         vF9qY21WbinmEZI6UjvUNy6JeYRI7t2milpF6Ocw=
Date:   Thu, 30 Jun 2022 12:48:10 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-imx@nxp.com, kernel@pengutronix.de
Subject: Re: [PATCH 4/7] media: v4l2: Make colorspace validity checks more
 future-proof
Message-ID: <Yr1xWpyR37kPcM0c@pendragon.ideasonboard.com>
References: <20220616183656.19089-1-laurent.pinchart@ideasonboard.com>
 <20220616183656.19089-5-laurent.pinchart@ideasonboard.com>
 <1d76d6bf-7809-edca-0d1a-9ab84e0c15ea@xs4all.nl>
 <Yr1w6Pt7mGpz+XWv@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Yr1w6Pt7mGpz+XWv@valkosipuli.retiisi.eu>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 30, 2022 at 12:46:16PM +0300, Sakari Ailus wrote:
> On Wed, Jun 29, 2022 at 03:50:47PM +0200, Hans Verkuil wrote:
> > > @@ -585,8 +585,8 @@ static inline bool v4l2_is_hsv_enc_valid(__u8 hsv_enc)
> > >  
> > >  static inline bool v4l2_is_quant_valid(__u8 quantization)
> > >  {
> > > -	return quantization == V4L2_QUANTIZATION_FULL_RANGE ||
> > > -	       quantization == V4L2_QUANTIZATION_LIM_RANGE;
> > > +	return quantization > V4L2_QUANTIZATION_DEFAULT &&
> > > +	       quantization < V4L2_QUANTIZATION_LAST;
> > 
> > There are only two quantization ranges: full and limited. And I very sincerely
> > hope there will never be a third!
> 
> For consistency of the checks and definitions I prefer it how it's in the
> patch. There's no functional difference though.

I'm ready to send a pull request for this patch once you and Hans agree
on how this should be done :-) I also have a slight preference for
consistency. Hans, what do you think ?

-- 
Regards,

Laurent Pinchart
