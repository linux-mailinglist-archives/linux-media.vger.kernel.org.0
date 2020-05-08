Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6ADF31CA8E2
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2020 13:02:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726636AbgEHLCe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 May 2020 07:02:34 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:41019 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726519AbgEHLCd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 8 May 2020 07:02:33 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id X0lvjdrhStKAsX0lyje6yc; Fri, 08 May 2020 13:02:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1588935751; bh=sfB+F30dZUB3AukYrPqyY23lRcTjzwmtOAAxkiLjgLE=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=H45apuXesIGCWiuk9E/4xRY/li2fIB1JnV2ICZ73zdabA48jcDeiFGCdBw45VAX0U
         LoP6uEHuqrUzAHTNu5WluheHsstedxEJd2kiYggQbY6q4U94jtJFy76l9haqz6Ac95
         j7pfbfR35rFnPiMVDUHePZcQmtbvCaJ5fT6ru6lYJ9o4LVhm5a6s6NpAZsiYPvtTK1
         Lz6IbrSp0f0ojaomzDR2IYK6afqyMesIPXKJHO/BRENFO+66ILLwMqH0xKITVcQzyD
         vXZmjU1vVpcsdMWFGGbZ2k3L4iTbHTX9kGdMvsc2N5jQxVWwtC4hNg7dUkgulnlzNE
         XI5qynN0xk2Fg==
Subject: Re: [PATCH v10 04/13] media: v4l2-ctrl: Document
 V4L2_CID_CAMERA_ORIENTATION
To:     Jacopo Mondi <jacopo@jmondi.org>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>, libcamera-devel@lists.libcamera.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     tfiga@google.com, pavel@ucw.cz
References: <20200508100158.3437161-1-jacopo@jmondi.org>
 <20200508100158.3437161-5-jacopo@jmondi.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <eea16d6b-bc58-a78a-c4c8-6f857251a047@xs4all.nl>
Date:   Fri, 8 May 2020 13:02:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200508100158.3437161-5-jacopo@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfEOHUNdSILVOu0C6r1yF0hqH++4oIPLeUKSiC5k1Id9zV361AsBGojv6FmqjHUzf8scQbVwVK3w6mqCLAG2C8xxuNnt5h+GHE7NgLunU09ox7vfLgPgk
 HSEg255j4e8luOOlHHrIJc3Jcv2dc080EH0usmTCMEguD2fhm/WXrPZFgSPBYju8cK6BjxtcUOI/Ram8QKZhlkzkW69fRCH99x/uWxRP0ds/EoFJ791XnIbd
 D9DNo0ZtCIo7waMjF54F8qJWxCkK1lyBQ2GGlZNLpFm4H0HOZRlvGvKWJjLXLnnU1JnUrAgMdpwlT1alY794R89Y1d0tKNziuIwc2X0ZXSSn7mE4FITYCd3D
 KbNYn6LGZM0BfWUS6i1/vSr8g6izg12IM9timuMoXHrET7lBkLMlNRUyyjcgXZ5B21/vF8O9dc7ZrN7lD1LpilxZYpZJqQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 08/05/2020 12:01, Jacopo Mondi wrote:
> Add documentation for the V4L2_CID_CAMERA_ORIENTATION camera
> control. The newly added read-only control reports the camera device
> orientation relative to the usage orientation of the system the camera
> is installed on.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  .../media/v4l/ext-ctrls-camera.rst            | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> index e39f84d2447f8..01e104bab6b3d 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> @@ -510,6 +510,36 @@ enum v4l2_scene_mode -
>      value down. A value of zero stops the motion if one is in progress
>      and has no effect otherwise.
>  
> +``V4L2_CID_CAMERA_ORIENTATION (integer)``

integer -> menu

> +    This read-only control describes the camera orientation by reporting
> +    its mounting position on the device where the camera is installed. The
> +    control value is constant and not modifiable by software. This control is
> +    particularly meaningful for devices which have a well defined orientation,
> +    such as phones, laptops and portable devices since the control is expressed
> +    as a position relative to the device's intended usage orientation.
> +    For example, a camera installed on the user-facing side of a phone,
> +    a tablet or a laptop device is said to be have ``V4L2_ORIENTATION_FRONT``
> +    orientation, while a camera installed on the opposite side of the front one
> +    is said to be have ``V4L2_ORIENTATION_BACK`` orientation. Camera sensors not
> +    directly attached to the device, or attached in a way that allows them to
> +    move freely, such as webcams and digital cameras, are said to have the
> +    ``V4L2_ORIENTATION_EXTERNAL`` orientation.
> +
> +
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +    * - ``V4L2_ORIENTATION_FRONT``

This really should be V4L2_CAMERA_ORIENTATION_FRONT. Yes, it is long, but just
'ORIENTATION' doesn't tell you which orientation is meant, that's too generic.

Regards,

	Hans

> +      - The camera is oriented towards the user facing side of the device.
> +    * - ``V4L2_ORIENTATION_BACK``
> +      - The camera is oriented towards the back facing side of the device.
> +    * - ``V4L2_ORIENTATION_EXTERNAL``
> +      - The camera is not directly attached to the device and is freely movable.
> +
> +
> +
>  .. [#f1]
>     This control may be changed to a menu control in the future, if more
>     options are required.
> 

