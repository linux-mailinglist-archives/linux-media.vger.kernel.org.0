Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E69AE23DCD4
	for <lists+linux-media@lfdr.de>; Thu,  6 Aug 2020 18:57:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729477AbgHFQ4s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Aug 2020 12:56:48 -0400
Received: from mga03.intel.com ([134.134.136.65]:48085 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729341AbgHFQ4r (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 Aug 2020 12:56:47 -0400
IronPort-SDR: jFbv+7mj5SHazwlcVXHpSLvHDQ/Tg+20TdNbWggffn4Xy3TM0dFav2DRBHVGdFqe0B6u0pv1o1
 Cq0JxEm3wyjQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9704"; a="152735480"
X-IronPort-AV: E=Sophos;i="5.75,441,1589266800"; 
   d="scan'208";a="152735480"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2020 04:18:48 -0700
IronPort-SDR: ieMMfsqZx0pTh7/zf3J69mjIyq0ji7rBM+oYHid+tMVHj0mpxXmAW5TwkMAyuRXtxBXWbJT+v0
 nzPzlo13hf6A==
X-IronPort-AV: E=Sophos;i="5.75,441,1589266800"; 
   d="scan'208";a="331196517"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2020 04:18:46 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id A6C592063B; Thu,  6 Aug 2020 01:24:47 +0300 (EEST)
Date:   Thu, 6 Aug 2020 01:24:47 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
        libcamera-devel@lists.libcamera.org
Subject: Re: [PATCH 1/4] media: docs: Describe pixel array properties
Message-ID: <20200805222447.GP13316@paasikivi.fi.intel.com>
References: <20200805105721.15445-1-jacopo@jmondi.org>
 <20200805105721.15445-2-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200805105721.15445-2-jacopo@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thanks for the patchset.

This improves selection documentation quite a bit. Please see my comments
below.

On Wed, Aug 05, 2020 at 12:57:18PM +0200, Jacopo Mondi wrote:
> The V4L2 selection API are also used to access the pixel array
> properties of an image sensor, such as the size and position of active
> pixels and the cropped area of the pixel matrix used to produce images.
> 
> Currently no clear definition of the different areas that compose an
> image sensor pixel array matrix is provided in the specification, and
> the actual meaning of each selection target when applied to an image
> sensor was not provided.
> 
> Provide in the sub-device documentation the definition of the pixel
> matrix properties and the selection target associated to each of them.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  .../userspace-api/media/v4l/dev-subdev.rst    | 81 +++++++++++++++++++
>  1 file changed, 81 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> index 134d2fb909fa4..c47861dff9b9b 100644
> --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> @@ -386,6 +386,87 @@ requests on all selection targets, unless specifically told otherwise.
>  ``V4L2_SEL_FLAG_GE`` and ``V4L2_SEL_FLAG_LE`` flags may be used to round
>  the image size either up or down. :ref:`v4l2-selection-flags`
>  
> +.. _v4l2-subdev-pixel-array-properties:
> +
> +Selection targets for image sensors properties
> +----------------------------------------------
> +
> +The V4L2 selection API can be used on sub-devices that represent an image
> +sensor to retrieve the sensor's pixel array matrix properties by using the
> +:ref:`selection <VIDIOC_SUBDEV_G_SELECTION>` ioctls.
> +
> +Sub-device drivers for image sensor usually register a single source pad, but in
> +the case they expose more, the pixel array properties can be accessed from
> +any of them.

Is this a hypothetical case or are there examples?

Also note that camera sensor drivers may expose more than one sub-devices,
only one of which represents the pixel array.

> +
> +The ``V4L2_SEL_TGT_NATIVE``, ``V4L2_SEL_TGT_CROP_BOUNDS``,
> +``V4L2_SEL_TGT_CROP_DEFAULT`` and ``V4L2_TGT_CROP`` targets are used to retrieve
> +the immutable properties of the several different areas that compose the sensor
> +pixel array matrix. Each area describes a rectangle of logically adjacent pixel
> +units. The logical disposition of pixels is defined by the sensor read-out
> +starting point and direction, and may differ from the physical disposition of
> +the pixel units in the pixel array matrix.
> +
> +Each pixel matrix portion is contained in a larger rectangle, with the most

s/larger\K/ or equal/

s/most//

> +largest being the one that describes the pixel matrix physical size. This
> +defines a hierarchical positional system, where each rectangle is defined

s/,//

> +relatively to the largest available one among the ones exposed by the
> +sub-device driver. Each selection target and the associated pixel array portion
> +it represents are below presented in order from the largest to the smallest one.
> +
> +Pixel array physical size
> +^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +The image sensor chip is composed by a number of physical pixels, not all of
> +them readable by the application processor. Invalid or unreadable lines might
> +not be transmitted on the data bus at all, or in case on CSI-2 capable sensors
> +they might be tagged with an invalid data type (DT) so that the receiver
> +automatically discard them. The size of the whole pixel matrix area is
> +retrieved using the V4L2_SEL_TGT_NATIVE target, which has its top-left corner
> +defined as position (0, 0). All the other selection targets are defined
> +relatively to this, larger, rectangle. The rectangle returned by
> +V4L2_SEL_TGT_NATIVE describes an immutable property of the image sensor, it
> +does not change at run-time and cannot be modified from userspace.
> +
> +Pixel array readable area
> +^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +The V4L2_SEL_TGT_CROP_BOUNDS targets returns size and position of the readable
> +area of the pixel array matrix, including pixels with valid image data and pixel
> +used for calibration purposes, such as optical black pixels. It is not unlikely
> +that valid pixels and optical black pixels are surrounded by non-readable rows
> +and columns of pixels. Those does not concur in the definition of the

How about: "Only pixels that can be read out are included in the
V4L2_SEL_TGT_CROP_BOUNDS rectangle."?

> +V4L2_SEL_TGT_CROP_BOUNDS rectangle. The rectangle returned by
> +V4L2_SEL_TGT_CROP_BOUNDS describes an immutable property of the image sensor, it
> +does not change at run-time and cannot be modified from userspace.
> +
> +Pixel array active area
> +^^^^^^^^^^^^^^^^^^^^^^^
> +
> +The portion of the pixel array which contains valid image data is defined as the
> +active area of the pixel matrix. The active pixel array is is accessed by mean

s/accessed/described/

Another word than "active" here would be great as we already have active
and try contexts for selections.

> +of the V4L2_SEL_TGT_CROP_DEFAULT target, and is contained in the larger

s/the larger//

> +V4L2_SEL_TGT_CROP_BOUNDS rectangle. It represents the largest possible frame
> +resolution the sensor can produce and defines the dimension of the full

s/resolution/size/

> +field-of-view. The rectangle returned by V4L2_SEL_TGT_CROP_BOUNDS describes an

s/-/ /g

> +immutable property of the image sensor, it does not change at run-time and
> +cannot be modified from userspace.
> +
> +Analog crop rectangle
> +^^^^^^^^^^^^^^^^^^^^^
> +
> +The sensor driver might decide, in order to adjust the image resolution to best
> +match the one requested by applications, to only process a part of the active

s/, to\K/ instruct the hardware to/

> +pixel array matrix. The selected area is read-out and processed by the image
> +sensor on-board ISP in order to produce images of the desired size and
> +resolution while possible maintaing the largest possible field-of-view. The

s/size\K[^.]?*\./m

> +cropped portion of the pixel array which is used to produce images is returned

s/produce/read out/
s/returned/configured/

> +by the V4L2_SEL_TGT_CROP target and represent the only information that can

s/by/using/

I'd leave out the rest of the sentence after "target" above.

> +change at runtime as it depends on the currently configured sensor mode and
> +desired image resolution. If the sub-device driver supports that, userspace
> +can set the analog crop rectangle to select which portion of the pixel array
> +to read out.

How about instead:

Register list based drivers generally do not allow setting analogue crop
rectangles.

> +
>  
>  Types of selection targets
>  --------------------------

-- 
Kind regards,

Sakari Ailus
