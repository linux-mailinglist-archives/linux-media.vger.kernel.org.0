Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 472139E858
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2019 14:50:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729840AbfH0MuQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Aug 2019 08:50:16 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:46198 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726170AbfH0MuQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Aug 2019 08:50:16 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9DE592F0;
        Tue, 27 Aug 2019 14:50:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1566910214;
        bh=Z4DPMdwUTl1Or/yPc04U+aVzWVB0FdbWNbtcx8PNn0A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cqOowlPK8T6v2KwFtX+YaERE7ehfqFG0nKrOInmXL3WhybtBhNYbHvt/quHef+Pn5
         WlqKr50S1fFChgJosBaQrL8FB6S/kC+VjcNfpUhn8m+D2rzMP7sRIE5f5rFEIzjhb0
         8Vrb8hGAK/0YaMG+KV3B3lydBcXlC9rXdwE7YrI8=
Date:   Tue, 27 Aug 2019 15:50:08 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>, tfiga@google.com,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v2 02/10] media: v4l2-ctrl: Document
 V4L2_CID_CAMERA_SENSOR_LOCATION
Message-ID: <20190827125008.GT5054@pendragon.ideasonboard.com>
References: <20190827092339.8858-1-jacopo@jmondi.org>
 <20190827092339.8858-3-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190827092339.8858-3-jacopo@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Tue, Aug 27, 2019 at 11:23:28AM +0200, Jacopo Mondi wrote:
> Add documentation for the V4L2_CID_CAMERA_SENSOR_LOCATION camera
> control. The newly added read-only control reports the camera device
> mounting position.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  .../media/uapi/v4l/ext-ctrls-camera.rst       | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> index 51c1d5c9eb00..ecf151f3f0f4 100644
> --- a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> +++ b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> @@ -510,6 +510,40 @@ enum v4l2_scene_mode -
>      value down. A value of zero stops the motion if one is in progress
>      and has no effect otherwise.
>  
> +``V4L2_CID_CAMERA_SENSOR_LOCATION (integer)``
> +    This read-only control describes the camera sensor location by
> +    reporting its mounting position on the device where the camera is
> +    installed. The control value is constant and not modifiable by software
> +    and its value is retrieved from the firmware interface by parsing the
> +    'location' property.

How the value is known to the driver is irrelevant in this context, I
would drop "and its value ...".

> This control is particularly meaningful for
> +    devices which have a well defined orientation, such as phones, laptops
> +    and portable devices as the camera location is expressed as a position
> +    relative to the device intended usage orientation. In example, a camera

s/In example/For example/

> +    sensor installed on the user-facing side of a phone, a tablet or a
> +    laptop device is said to be installed in the ``V4L2_LOCATION_FRONT``
> +    location while camera sensors installed on the side opposed to the

s/opposed to the front one/opposite the front/

> +    front one are said to be installed in the ``V4L2_LOCATION_BACK``
> +    location. Camera sensors connected to the device by extension cables
> +    which are freely movable regardless of the device orientation, such as
> +    webcams and digital cameras, are said to be have
> +    ``V4L2_LOCATION_EXTERNAL`` location.

Same comment as for the DT bindings regarding cables.

> +
> +
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +    * - ``V4L2_LOCATION_FRONT``
> +      - The camera sensor is located on the front side of the device.
> +    * - ``V4L2_LOCATION_BACK``
> +      - The camera sensor is located on the back side of the device.
> +    * - ``V4L2_LOCATION_EXTERNAL``
> +      - The camera sensor is connected by extension cables to the device and
> +        it's freely movable.

s/it's/is/

> +
> +
> +
>  .. [#f1]
>     This control may be changed to a menu control in the future, if more
>     options are required.

-- 
Regards,

Laurent Pinchart
