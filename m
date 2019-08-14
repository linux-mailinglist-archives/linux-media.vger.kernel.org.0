Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38A5D8E0F5
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 00:43:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728397AbfHNWnp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Aug 2019 18:43:45 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57924 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727273AbfHNWnp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Aug 2019 18:43:45 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 604A82B2;
        Thu, 15 Aug 2019 00:43:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1565822623;
        bh=ICpj+cOqcRGmfFUWQfxuOIteGqOdKh0L3iEelT37IRI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Qk99QL3m2JnY5nuIw6NAQURbztsq3TN/Gnyv4QhkXT4JL0ObnTeKeYXEfaxFhdL+1
         0TZcjb5fULoZUp8PGgrydO44c28SiYNfztWkwJK1z+8Dm4vNphz8Mv/oQcAH0Y++o/
         Ef7eN0oHgeOSNbbMZlG/Ft0VC+GfwQuI8FXhTOX0=
Date:   Thu, 15 Aug 2019 01:43:40 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC 2/5] media: v4l2-ctrl: Document V4L2_CID_LOCATION
Message-ID: <20190814224340.GD5015@pendragon.ideasonboard.com>
References: <20190814202815.32491-1-jacopo@jmondi.org>
 <20190814202815.32491-3-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190814202815.32491-3-jacopo@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Wed, Aug 14, 2019 at 10:28:12PM +0200, Jacopo Mondi wrote:
> Add documentation for the V4L2_CID_LOCATION camera control. The newly
> added read-only control reports the camera device mounting position.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  .../media/uapi/v4l/ext-ctrls-camera.rst       | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> index 51c1d5c9eb00..fc0a02eee6d4 100644
> --- a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> +++ b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> @@ -510,6 +510,29 @@ enum v4l2_scene_mode -
>      value down. A value of zero stops the motion if one is in progress
>      and has no effect otherwise.
> 
> +``V4L2_CID_LOCATION (integer)``

Maybe V4L2_CID_CAMERA_SENSOR_LOCATION ? Same for the values below.

> +    This read-only control describes the camera location by reporting its

Here too I would mention camera sensor instead of just camera (or
possibly imaging sensor).

> +    mounting position on the device where the camera is installed. This
> +    control is particularly meaningful for devices which have a well defined
> +    orientation, such as phones, laptops and portable devices as the camera
> +    location is expressed as a position relative to the device intended
> +    usage position. In example, a camera installed on the user-facing side
> +    of a phone device is said to be installed in the ``V4L2_LOCATION_FRONT``
> +    position.

The DT bindings could use such an example :-) I would extend this to
tablets and laptops.

> +
> +
> +

Do we need three blank lines ?

> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +    * - ``V4L2_LOCATION_FRONT``
> +      - The camera device is located on the front side of the device.
> +    * - ``V4L2_LOCATION_BACK``
> +      - The camera device is located on the back side of the device.
> +
> +
> +
>  .. [#f1]
>     This control may be changed to a menu control in the future, if more
>     options are required.

-- 
Regards,

Laurent Pinchart
