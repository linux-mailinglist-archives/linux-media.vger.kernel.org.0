Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4239423FF84
	for <lists+linux-media@lfdr.de>; Sun,  9 Aug 2020 19:32:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726323AbgHIRcX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Aug 2020 13:32:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726175AbgHIRcW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 Aug 2020 13:32:22 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B337EC061756
        for <linux-media@vger.kernel.org>; Sun,  9 Aug 2020 10:32:22 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3EB6FF9;
        Sun,  9 Aug 2020 19:32:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1596994338;
        bh=mJHOhEwbmsrfhw/PQIKMshYf/7jqPTV2GgKbdarle1s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XRJutgNPokcv+w4adKU8gSvuRzOVhb/b4x7YWVah08C+B3Rm+sFrldYBZltH5Mgpv
         ScKJ5KGGL2WQnl4oeWPcP0tiR3oxvjGlpz27cqSddoPjuAQ42nDSayaqZY3ypV4iPJ
         5IoXmKjcV878ksvjY7G6apbIYnPIatTQbvBg3fxs=
Date:   Sun, 9 Aug 2020 20:32:06 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
        libcamera-devel@lists.libcamera.org
Subject: Re: [PATCH 2/4] media: docs: Describe targets for sensor properties
Message-ID: <20200809173206.GD5981@pendragon.ideasonboard.com>
References: <20200805105721.15445-1-jacopo@jmondi.org>
 <20200805105721.15445-3-jacopo@jmondi.org>
 <1896673c-ae91-84c3-9573-5da91fb00f41@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1896673c-ae91-84c3-9573-5da91fb00f41@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo and Hans,

On Thu, Aug 06, 2020 at 10:45:17AM +0200, Hans Verkuil wrote:
> On 05/08/2020 12:57, Jacopo Mondi wrote:
> > Provide a table to describe how the V4L2 selection targets can be used
> > to access an image sensor pixel array properties.
> > 
> > Reference the table in the sub-device documentation.
> > 
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >  .../userspace-api/media/v4l/dev-subdev.rst    |  4 ++
> >  .../media/v4l/v4l2-selection-targets.rst      | 49 +++++++++++++++++++
> >  2 files changed, 53 insertions(+)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > index c47861dff9b9b..2f7da3832f458 100644
> > --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > @@ -467,6 +467,10 @@ desired image resolution. If the sub-device driver supports that, userspace
> >  can set the analog crop rectangle to select which portion of the pixel array
> >  to read out.
> >  
> > +A description of each of the above mentioned targets when used to access the
> > +image sensor pixel array properties is provided by
> > +:ref:`v4l2-selection-targets-image-sensor-table`
> > +
> >  
> >  Types of selection targets
> >  --------------------------
> > diff --git a/Documentation/userspace-api/media/v4l/v4l2-selection-targets.rst b/Documentation/userspace-api/media/v4l/v4l2-selection-targets.rst
> > index 69f500093aa2a..632e6448b784e 100644
> > --- a/Documentation/userspace-api/media/v4l/v4l2-selection-targets.rst
> > +++ b/Documentation/userspace-api/media/v4l/v4l2-selection-targets.rst
> > @@ -76,3 +76,52 @@ of the two interfaces they are used.
> >  	modified by hardware.
> >        - Yes
> >        - No
> > +
> > +
> > +.. _v4l2-selection-targets-image-sensor-table:
> > +
> > +********************************************
> > +Selection Targets For Pixel Array Properties
> > +********************************************
> > +
> > +The V4L2 selection API can be used to retrieve the size and disposition of the
> > +pixel units that compose and image sensor pixel matrix when applied to a video
> > +sub-device that represents an image sensor.
> > +
> > +A description of the properties associated with each of the sensor pixel array
> > +areas is provided by the :ref:`v4l2-subdev-pixel-array-properties` section.
> > +
> > +.. tabularcolumns:: |p{6.0cm}|p{1.4cm}|p{7.4cm}|p(1.4cm)|
> > +
> > +.. flat-table:: Selection target definitions
> > +    :header-rows:  1
> > +    :stub-columns: 0
> > +
> > +    * - Target name
> > +      - id
> > +      - Definition
> > +      - Read/Write
> > +    * - ``V4L2_SEL_TGT_CROP``
> > +      - 0x0000
> > +      - The analog crop rectangle. Represents the portion of the active pixel
> > +        array which is processed to produce images.
> > +      - RW
> > +    * - ``V4L2_SEL_TGT_CROP_DEFAULT``
> > +      - 0x0001
> > +      - The active pixel array rectangle. It includes only active pixels and
> > +        excludes other ones such as optical black pixels. Its width and height
> > +        represent the maximum image resolution an image sensor can produce.
> > +      - RO
> > +    * - ``V4L2_SEL_TGT_CROP_BOUNDS``
> > +      - 0x0002
> > +      - The readable portion of the physical pixel array matrix. It includes
> > +        pixels that contains valid image data and calibration pixels such as the
> > +        optical black ones.
> > +      - RO
> > +    * - ``V4L2_SEL_TGT_NATIVE_SIZE``
> > +      - 0x0003
> > +      - The physical pixel array size, including readable and not readable
> > +        pixels. As pixels that cannot be read from application processor are not
> > +        relevant for calibration purposes, this rectangle is useful to calculate
> > +        the physical properties of the image sensor.
> > +      - RO
> > 
> 
> Hmm, this basically just duplicates the previous patch.
> 
> I think you are documenting things at the wrong place. What you documented in the
> previous patch really belongs here since it is shared between the subdev API and the
> regular V4L2 API. And in dev-subdev.rst you then refer to here.
> 
> Frankly, the selection API documentation is a mess. It's spread out over various sections:
> The VIDIOC_G/S_SELECTION and VIDIOC_SUBDEV_G/S_SELECTION descriptions in the Function Reference,
> section 8 ("Common definitions for V4L2 and V4L2 subdev interfaces"), 1.25 "Cropping, composing
> and scaling – the SELECTION API" and 4.13.3.2-4.13.3.3 "Selections: cropping, scaling and composition".
> 
> In my view section 8 should be moved to section 1.25.2.

Agreed.

> Ideally 1.25 should be rewritten for both
> the V4L2 and V4L2 subdev APIs, but that's a lot of work.

Agreed too.

> I would suggest that you add a first patch that moves section 8 to 1.25.2. Note that I don't like
> the tables for the selection targets and flags: the 'Valid for V4L2/V4L2 subdevs' columns should
> be removed and it should either be mentioned in the definition if a target/flag is invalid for
> an API, or it should be put in a separate table.

Should "1.25.3.1. Configuration of video capture" be moved to "4.1.
Video Capture Interface", and "1.25.3.2. Configuration of video output"
to "4.3. Video Output Interface" ?

I'm not sure where patch 1/4 should be moved to though. As I mentioned
in the review, I think it should create a section specific to camera
sensors. "4.13. Sub-device Interface" isn't a very good candidate as it
describes the interface, it shouldn't document how particular classes of
subdevs are to be handled. Maybe a new top-level section in "Part I -
Video for Linux API" to describe different types of sub-devices ?

> And in 1.25.2 perhaps a new picture can be created for the specific sensor use-case that includes
> the NATIVE_SIZE target.
> 
> Another pet peeve of mine is that section 8 splits the selection targets and flags into separate
> subsections. I'd just keep it in one section.

-- 
Regards,

Laurent Pinchart
