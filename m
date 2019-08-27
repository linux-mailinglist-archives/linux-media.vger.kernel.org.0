Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0BD89E85F
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2019 14:51:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728419AbfH0Mvl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Aug 2019 08:51:41 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:46302 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbfH0Mvl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Aug 2019 08:51:41 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 387B52F0;
        Tue, 27 Aug 2019 14:51:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1566910299;
        bh=go8NFj8f7RVIKCC/3QPqlNsiDlnTjHZEUgld0n57A8M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=U+RKS+7kPbbtmnpWjfXBF746EmSYKJ3jmC5aFQxXIQRrLxXXl6elK90C2WECHrzC8
         x6oQFs+IB+4r/dg0q1S5DcfzM43vsdTI1ziRWlXsJLsQZBXbe8Ob7IlwAe25vxIMW0
         kq4mA/7AxrQ2q4kS0pZ3cAhjMsaMUgpIsa5l9nz4=
Date:   Tue, 27 Aug 2019 15:51:32 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>, tfiga@google.com,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v2 03/10] media: v4l2-ctrl: Document
 V4L2_CID_CAMERA_SENSOR_ROTATION
Message-ID: <20190827125132.GU5054@pendragon.ideasonboard.com>
References: <20190827092339.8858-1-jacopo@jmondi.org>
 <20190827092339.8858-4-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190827092339.8858-4-jacopo@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Tue, Aug 27, 2019 at 11:23:29AM +0200, Jacopo Mondi wrote:
> Add documentation for the V4L2_CID_CAMERA_SENSOR_ROTATION camera
> control. The newly added read-only control reports the camera device
> mounting rotation.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  Documentation/media/uapi/v4l/ext-ctrls-camera.rst | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> index ecf151f3f0f4..03d1c23d18f7 100644
> --- a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> +++ b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> @@ -544,6 +544,15 @@ enum v4l2_scene_mode -
>  
>  
>  
> +``V4L2_CID_CAMERA_SENSOR_ROTATION (integer)``
> +    This read-only control describes the camera sensor orientation by
> +    reporting its mounting rotation in respect to the device intended usage
> +    orientation, expressed in counter clockwise degrees. The control value is

Counter clockwise relative to what ? :-)

> +    constant and not modifiable by software and its value is retrieved from the
> +    firmware interface by parsing the 'rotation' property. Typical values are 0
> +    degrees for upright mounted sensors and 180 degrees for sensors mounted
> +    upside down.

Same comment as for 02/10 regarding how the value is known to the
driver.

> +
>  .. [#f1]
>     This control may be changed to a menu control in the future, if more
>     options are required.

-- 
Regards,

Laurent Pinchart
