Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EFB87A43FB
	for <lists+linux-media@lfdr.de>; Mon, 18 Sep 2023 10:10:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236040AbjIRIJp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Sep 2023 04:09:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240564AbjIRIJQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Sep 2023 04:09:16 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7EDF18C
        for <linux-media@vger.kernel.org>; Mon, 18 Sep 2023 01:08:27 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9AD7ABC4;
        Mon, 18 Sep 2023 10:06:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1695024410;
        bh=cKaUAVhFTyOF9vcNljGmDV0pLsb4cEne8a5K1SwCbAE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Vpamj8m/6btqA1FHevOK+qOOSed758CIPSuF0KJ2y9gmt1+KEU6N6kWF8E8uSf9vn
         XheYyeP5xbRiw6VFvqE+pgcVFQvFqEnV1ROuS27HsPJ/caSaY89A+pr/efreOv2fa8
         cXPRloXpUNVNnlMcTDpVby8tdkhP4pkHS5eDwFyg=
Date:   Mon, 18 Sep 2023 11:08:38 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Martin Kepplinger <martink@posteo.de>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        "Paul J. Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Jimmy Su <jimmy.su@intel.com>,
        Jason Chen <jason.z.chen@intel.com>,
        Arec Kao <arec.kao@intel.com>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Mikhail Rudenko <mike.rudenko@gmail.com>
Subject: Re: [PATCH 01/57] media: v4l2-subdev: Document .s_stream() operation
 requirements
Message-ID: <20230918080838.GB28874@pendragon.ideasonboard.com>
References: <20230914181704.4811-1-laurent.pinchart@ideasonboard.com>
 <20230914181704.4811-2-laurent.pinchart@ideasonboard.com>
 <CAPybu_0mYSPHwi2qQ-bCEJWwDE4rCqBg0WJ5veA1GPbVjTnz+w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPybu_0mYSPHwi2qQ-bCEJWwDE4rCqBg0WJ5veA1GPbVjTnz+w@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

On Mon, Sep 18, 2023 at 09:49:27AM +0200, Ricardo Ribalda Delgado wrote:
> On Thu, Sep 14, 2023 at 8:16 PM Laurent Pinchart wrote:
> >
> > The subdev .s_stream() operation must not be called to start an already
> > started subdev, or stop an already stopped one. This requirement has
> > never been formally documented. Fix it.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  include/media/v4l2-subdev.h | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > index d9fca929c10b..282914ea9d45 100644
> > --- a/include/media/v4l2-subdev.h
> > +++ b/include/media/v4l2-subdev.h
> > @@ -446,7 +446,9 @@ enum v4l2_subdev_pre_streamon_flags {
> >   * @s_stream: start (enabled == 1) or stop (enabled == 0) streaming on the
> >   *     sub-device. Failure on stop will remove any resources acquired in
> >   *     streaming start, while the error code is still returned by the driver.
> > - *     Also see call_s_stream wrapper in v4l2-subdev.c.
> > + *     The caller shall track the subdev state, and refrain from starting or
> 
> What about
> 
> s/refrain/ shall not/ ?
> 
> I refrain (and fail) from eating chocolate, but I shall not eat rat poison :P

I know someone who would tell you chocolate is at least as bad as rat
poison. That's a fairly extreme point of view, I agree with your
suggestion. I'll update this in v2.

> > + *     stopping an already started or stopped subdev. AAlso see call_s_stream
> > + *     wrapper in v4l2-subdev.c.
> 
> s/AAlso/Also/
> 
> >   *
> >   * @g_pixelaspect: callback to return the pixelaspect ratio.
> >   *

-- 
Regards,

Laurent Pinchart
