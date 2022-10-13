Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 920925FD719
	for <lists+linux-media@lfdr.de>; Thu, 13 Oct 2022 11:30:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229582AbiJMJae (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Oct 2022 05:30:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbiJMJaa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Oct 2022 05:30:30 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B915AC481
        for <linux-media@vger.kernel.org>; Thu, 13 Oct 2022 02:30:26 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EAE9E492;
        Thu, 13 Oct 2022 11:30:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1665653424;
        bh=FWJjWJzZgpDmpqsa8454FJ9WzjFT9ewq0YmTl0N6DIk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VjQ0SnnlOqnVf4oHY/PM9GQQH4fhujQVK8H9ZY7ZAn/Q7TbqGGXhjOgaTaSqz5/Xr
         neTYe2mk2bPMjUBShX3O33dVZl23gT0ZP6K20t+/7hdvfBTWarUozSn/0YPB26Cvn/
         zuQtAamnO4QVoh3J8iZSeyn26r8lYlMSRzRcJMC4=
Date:   Thu, 13 Oct 2022 12:30:17 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH 02/10] media: ar0521: Add V4L2_CID_ANALOG_GAIN
Message-ID: <Y0faqSGcv7ezJqxf@pendragon.ideasonboard.com>
References: <20221005190613.394277-1-jacopo@jmondi.org>
 <20221005190613.394277-3-jacopo@jmondi.org>
 <CAPY8ntB48837t+UN_6k5DJ6QBJvgz0Ohc4w4=7044amrdCy1=A@mail.gmail.com>
 <20221006150015.7p7qlab4dbaldnsg@uno.localdomain>
 <Yz7u0LT2kwhyhc8x@pendragon.ideasonboard.com>
 <m3wn9c5hip.fsf@t19.piap.pl>
 <Yz/hPRyc13LmY3Lh@pendragon.ideasonboard.com>
 <Y0cNfkt4d5dzAN2i@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y0cNfkt4d5dzAN2i@valkosipuli.retiisi.eu>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

(CC'ing Hans for the discussion about the control framework)

On Wed, Oct 12, 2022 at 09:54:54PM +0300, Sakari Ailus wrote:
> On Fri, Oct 07, 2022 at 11:20:13AM +0300, Laurent Pinchart wrote:
> > On Fri, Oct 07, 2022 at 07:28:46AM +0200, Krzysztof Hałasa wrote:
> > > Laurent Pinchart writes:
> > > 
> > > > I'm tempted to drop support for the colour gains really, and turn the
> > > > V4L2_CID_GAIN into V4L2_CID_DIGITAL_GAIN. Digital colour gains can still
> > > > be useful on platforms that have no ISP, but I think we need an array of
> > > > gains in that case, not abusing V4L2_CID_RED_BALANCE and
> > > > V4L2_CID_BLUE_BALANCE. Any objection ?
> > > 
> > > I'm fine with spliting it into analog/digital as long as there is a way
> > > to set individual R/G/B (digital) gain values.
> > 
> > With the controls we have today in V4L2, we could map
> > V4L2_CID_RED_BALANCE and V4L2_CID_BLUE_BALANCE to the red and blue
> > digital gains, with V4L2_CID_DIGITAL_GAIN setting the global digital
> > gain.
> > 
> > I'm tempted to bite the bullet and define a new
> > V4L2_CID_DIGITAL_COLOR_GAINS control that would expose an array of
> > gains, but if we extend the API for that, I think we should also include
> > support for HDR at the same time, with at least T1/T2 sets of gains.
> > 
> > Sakari, any opinion ?
> 
> Would you use multiple controls for that or just a single one?

That's what we need to decide :-)

> The size of a matrix control is not changeable dynamically so I presume the

We now have

    * - ``V4L2_CTRL_FLAG_DYNAMIC_ARRAY``
      - 0x0800
      - This control is a dynamically sized 1-dimensional array. It
        behaves the same as a regular array, except that the number
        of elements as reported by the ``elems`` field is between 1 and
        ``dims[0]``. So setting the control with a differently sized
        array will change the ``elems`` field when the control is
        queried afterwards.

that allows changing a control size dynamically from userspace. It only
works for 1D controls though. The kernel can also change the dimensions
of a control at any time, and that could be done when the HDR control
would be set to dual-gain mode to turn the gain controls into arrays.

> driver would create as large control as needed, and program to hardware as
> much as needed.

That's what we need to decide :-) I'm tempted to go for a single control
that would cover both the multi-channel and multi-gain needs.

V4L2_CID_ANALOG_GAIN control would become an array control of two
elements, one for T1 and one for T2. It may confuse some applications.
For new drivers that could be fine. For existing drivers, an application
that sets the control as if it were a regular V4L2_CID_ANALOG_GAIN of
type V4L2_CTRL_TYPE_INTEGER would break.

This may be fixable in the V4L2 control framework, by only allowing
get/set of a subset of an array control. I'm not sure that't desirable
in the general case though. If the control dimensions were changed by
the driver when turning dual-gain mode on (or off) we would only need (I
think) to update v4l2_s_ctrl() to allow writing array controls when the
array contains a single element, which should be less of a problem.

For the digital gains, V4L2_CID_DIGITAL_GAIN would become a 2D array,
with one dimension covering the colour channels, and the other dimension
covering the T1/T2 gains.

-- 
Regards,

Laurent Pinchart
