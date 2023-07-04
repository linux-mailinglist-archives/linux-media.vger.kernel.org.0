Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFD13746E7E
	for <lists+linux-media@lfdr.de>; Tue,  4 Jul 2023 12:24:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230427AbjGDKYO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jul 2023 06:24:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230316AbjGDKYM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jul 2023 06:24:12 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 713D7184
        for <linux-media@vger.kernel.org>; Tue,  4 Jul 2023 03:24:10 -0700 (PDT)
Received: from ideasonboard.com (85-160-42-71.reb.o2.cz [85.160.42.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 57082D4A;
        Tue,  4 Jul 2023 12:23:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1688466204;
        bh=+xnzcMT0yR8YNwizRU8SnoSbPkAnhResjgUp147Fe8M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BN+Xz4A1gnHtO4X4TQZM9f/P/rd4Tko+xqGdJeYfPU7mHuqELpE6IJIejqBIMM5f0
         V8pMOlNbDTA27riV9eAtToX1qNaOsxJJDX+93piU6F0gQ/685PXhWwlTDW7/VGEVbh
         OY2oj/06gFnKPhOU+P6SKtPsTcJ0i+ZYzm3+MP/Y=
Date:   Tue, 4 Jul 2023 12:24:04 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 1/2] Documentation: v4l: Flip handling for RAW sensors
Message-ID: <bnk6t3td26dlrik54gw4jf33anajvfpgah4qut6nn4bstxd6zu@b2ajma7t4hf5>
References: <20230703202910.31142-1-jacopo.mondi@ideasonboard.com>
 <20230703202910.31142-2-jacopo.mondi@ideasonboard.com>
 <CAPY8ntAqOtabsfju53cmcZoogL67N=a2YYy_-yG8j7D87yKZKw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntAqOtabsfju53cmcZoogL67N=a2YYy_-yG8j7D87yKZKw@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,
   thanks for the comments

On Tue, Jul 04, 2023 at 10:58:11AM +0100, Dave Stevenson wrote:
> Hi Jacopo
>
> Thanks for adding documentation.
> Sorry I couldn't be at your presentation, but I'll find the slides
> (and recording if there is one).
>

videos and slides should be already available for attendees. If not I
can send you the slide deck, but trust me, there is nothing new for
you there.

> On Mon, 3 Jul 2023 at 21:29, Jacopo Mondi <jacopo.mondi@ideasonboard.com> wrote:
> >
> > Document the requirement of notifying to userspace the possible
> > re-ordering of the color sample components when a vertical or horizontal
> > flip is applied to a RAW camera sensor.
> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> >  Documentation/driver-api/media/camera-sensor.rst | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
> > index 93f4f2536c25..ee4a7fe5f72a 100644
> > --- a/Documentation/driver-api/media/camera-sensor.rst
> > +++ b/Documentation/driver-api/media/camera-sensor.rst
> > @@ -173,3 +173,19 @@ V4L2_CID_VFLIP controls with the values programmed by the register sequences.
> >  The default values of these controls shall be 0 (disabled). Especially these
> >  controls shall not be inverted, independently of the sensor's mounting
> >  rotation.
> > +
> > +Flip handling for raw camera sensors
> > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Possibly "for colour raw camera sensors".
> Mono sensors are still raw in that they need processing for black
> level, lens shading, etc, but they won't change the colour ordering.
>

Thanks, good point

> > +
> > +Applying vertical and horizontal flips on raw camera sensors inverts the color
> > +sample reading direction on the sensor's pixel array. This causes the
> > +re-ordering of the color samples on the sensor's output frame.
>
> This *may* cause the re-ordering....
>
> Not all sensors do. Some shift the readout by one line/column to keep
> the Bayer order the same, and technically should update the selection.
> OnSemi sensors in particular seem to do this, as do the Sony
> IMX327/290/462 family.
>

Is it the driver doing the shift or is it the sensor automatically
adjusting ?

> > As an example, a
> > +raw camera sensor with a Bayer pattern color filter array and a native RGGB
> > +Bayer order will produce frames with GRBG component ordering when a vertical
> > +flip is applied.
>
> Vertical flip of RGGB would be GBRG as the RG and GB get swapped, not
> GRBG (which would be horizontal flip).

I clearly mean horizontal sorry. I'll fix.

Thanks
   j

>
>   Dave
>
> > Camera sensor drivers where inverting the reading order
> > +direction causes a re-ordering of the color components are requested to register
> > +the ``V4L2_CID_VFLIP`` and ``V4L2_CID_HFLIP`` controls with the
> > +``V4L2_CTRL_FLAG_MODIFY_LAYOUT`` flag enabled to notify userspace that enabling
> > +a flip can potentially change the output buffer content layout. Flips should
> > +also be taken into account when enumerating and handling media bus formats
> > +on the camera sensor source pads.
> > --
> > 2.40.1
> >
