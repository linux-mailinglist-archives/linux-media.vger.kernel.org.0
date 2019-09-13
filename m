Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61D03B215A
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2019 15:50:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389604AbfIMNsY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Sep 2019 09:48:24 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:58685 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388860AbfIMNsY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Sep 2019 09:48:24 -0400
Received: from [IPv6:2001:420:44c1:2577:888a:538c:8dda:557b] ([IPv6:2001:420:44c1:2577:888a:538c:8dda:557b])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 8lvuiWyrvV17O8lvyi2xw5; Fri, 13 Sep 2019 15:48:22 +0200
Subject: Re: [PATCH v3 02/11] media: v4l2-ctrl: Document
 V4L2_CID_CAMERA_SENSOR_LOCATION
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com, pavel@ucw.cz
Cc:     "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>
References: <20190912201055.13964-1-jacopo@jmondi.org>
 <20190912201055.13964-3-jacopo@jmondi.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <a5399069-0ecb-6354-2a40-cd366ae181e2@xs4all.nl>
Date:   Fri, 13 Sep 2019 15:48:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190912201055.13964-3-jacopo@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfHjQwMsDmzZjaRHzDPz5IOskgk4wl1F+HHZX9tsThOaqm46nzcODSUzrNFkKR1+nH2L4MMgPZIGvNByF9VZ2Ke3ejCHJEyB73z91cEeAPlvwPm47xBrN
 59kyNGyRWFkvd3PgZ4OrZT1SC/mrA4hwwA8Igw23OLX62PSMT6m7MyD9+TWJ6N9DmSff1H9HHfwjkJHhkg/AnVDIVduTxjAH6I5sp6NG2TxfBySJYnHuwr0a
 GQWcuhDepaq1h3/imOaAqWRztf2RAaoLyAlpNSFK+u7/Nf2Os3tsF0+dsyhGVo4o9On+2miAbq4c0CB3gmhljK1iOvww/hBBlH/ee4HZgimVbGy5Lg+HrpE2
 s5Fu8yi7vXTRlTyq2qKS0/yuUCxxW8PbmrruYki0rhcWx90H4Pt+jmv1aVy4yDVEHV90xRar/KQY7unpFDJpBh8FuuCyY6inw5xfW8BbDuMEzAfH6hKkRRNo
 G7j+zaw4X1mxyW1AmJoLJdXj+b82vOOJnDjX2A==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/12/19 10:10 PM, Jacopo Mondi wrote:
> Add documentation for the V4L2_CID_CAMERA_SENSOR_LOCATION camera
> control. The newly added read-only control reports the camera device
> mounting position.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  .../media/uapi/v4l/ext-ctrls-camera.rst       | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> index 51c1d5c9eb00..f879dcc9409c 100644
> --- a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> +++ b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> @@ -510,6 +510,38 @@ enum v4l2_scene_mode -
>      value down. A value of zero stops the motion if one is in progress
>      and has no effect otherwise.
>  
> +``V4L2_CID_CAMERA_SENSOR_LOCATION (integer)``
> +    This read-only control describes the camera sensor location by reporting
> +    its mounting position on the device where the camera is installed. The
> +    control value is constant and not modifiable by software. This control is
> +    particularly meaningful for devices which have a well defined orientation,
> +    such as phones, laptops and portable devices as the camera location is

as -> since

> +    expressed as a position relative to the device intended usage orientation.

device -> device's

> +    For example, a camera sensor installed on the user-facing side of a phone,
> +    a tablet or a laptop device is said to be installed in the
> +    ``V4L2_LOCATION_FRONT`` location while camera sensors installed on the side
> +    opposite the front one are said to be installed in the
> +    ``V4L2_LOCATION_BACK`` location. Camera sensors not directly attached to
> +    the device or attached in a way that allows it to move freely, such as

it -> them (plural)

> +    webcams and digital cameras, are said to be have ``V4L2_LOCATION_EXTERNAL``

to be have -> to have the

> +    location.
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
> +      - The camera sensor is not directly attached to the device and is
> +        freely movable.
> +
> +
> +
>  .. [#f1]
>     This control may be changed to a menu control in the future, if more
>     options are required.
> 

Regards,

	Hans
