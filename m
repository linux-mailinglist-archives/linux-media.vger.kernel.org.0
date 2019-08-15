Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 707CF8ECDD
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 15:31:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732294AbfHONbF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 09:31:05 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:38627 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730304AbfHONbF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 09:31:05 -0400
Received: from [IPv6:2001:420:44c1:2579:f038:4b04:f67a:276f] ([IPv6:2001:420:44c1:2579:f038:4b04:f67a:276f])
        by smtp-cloud8.xs4all.net with ESMTPA
        id yFqFhvymaDqPeyFqIhYJJF; Thu, 15 Aug 2019 15:31:03 +0200
Subject: Re: [RFC 2/5] media: v4l2-ctrl: Document V4L2_CID_LOCATION
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20190814202815.32491-1-jacopo@jmondi.org>
 <20190814202815.32491-3-jacopo@jmondi.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <02b40da5-c30c-f1f3-2351-c04da932e94a@xs4all.nl>
Date:   Thu, 15 Aug 2019 15:30:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190814202815.32491-3-jacopo@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBdaL9CUlLAxiTYaWce8qe1j1V1MqCdBUtDToW+yQU9QKTKVNpxJlwx/BkbsApxRyqXD/QEXGRYXDHz0vKzuYhtMnrQYsJGkozQB8K8wGvKNNf3aSPfu
 iiO97ULMfRaxQpZPVsBB95BYo9jZuLgU4r/4LT38LxwbgXB/bklxeXkq34Wa/1Rvee6gJhDIzTADF+MNDiUyqpJNYIs2p9VCh3f7xGZ7f2q0yavq21xMKXh5
 mGQOCZAr6TzxcHHy3OOutbszghMX+SqUuOVvRSdrwTBpb7+uUrglV0qX9D3pwTcY9rm1wIIkLrBV/oLGuRv3WffJW6I6Rt4W0/MbcX4XdoLZ05iW4zP8Nl+t
 OEKfsIyWE9ygEZi76JO7GunTub5gDrSPJ0Su2ndxSEqOP+mIi4LLS64EEhLLqwazZY5HMCeYTakddqGRPv9UxK5w6g/QGvOdixlFFKsZSDeYeqDwKWz1VvIv
 XbMBCU2nadJw4hrI
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/14/19 10:28 PM, Jacopo Mondi wrote:
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
> +    This read-only control describes the camera location by reporting its
> +    mounting position on the device where the camera is installed. This
> +    control is particularly meaningful for devices which have a well defined
> +    orientation, such as phones, laptops and portable devices as the camera
> +    location is expressed as a position relative to the device intended
> +    usage position. In example, a camera installed on the user-facing side
> +    of a phone device is said to be installed in the ``V4L2_LOCATION_FRONT``
> +    position.

When should this control be created? If there is only one location (e.g.
all sensors are front-facing) would you still expose this? Or does it depend
on the type of device?

And is the sensor in a digital camera front or back facing? (Just curious
about what you think about that situation!)

Regards,

	Hans

> +
> +
> +
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
> --
> 2.22.0
> 

