Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A761A2351DA
	for <lists+linux-media@lfdr.de>; Sat,  1 Aug 2020 13:15:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728498AbgHALPd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Aug 2020 07:15:33 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:34155 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728255AbgHALPd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Aug 2020 07:15:33 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id DE6FD1C0004;
        Sat,  1 Aug 2020 11:15:27 +0000 (UTC)
Date:   Sat, 1 Aug 2020 13:19:03 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        naush@raspberrypi.com
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        libcamera-devel@lists.libcamera.org
Subject: Re: [PATCH] imx219: selection compliance fixes
Message-ID: <20200801111903.zt2d2djusjdh27vc@uno.localdomain>
References: <b580ac9d-5ae4-29ce-c81a-a1f98b1d953b@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b580ac9d-5ae4-29ce-c81a-a1f98b1d953b@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans, Laurent,

    sorry, long email, contains a few things on the general definition
    of the selection target, a question for libcamera, and a few more
    details at the end.

Adding Sakari, libcamera ml, Ricardo which helped with the
definition of pixel array properties in libcamera recently and
Dave and Naush as this sensor is the RPi camera module v2 and some
information on the sensor come from their BSP.

On Thu, Jul 02, 2020 at 03:50:04PM +0200, Hans Verkuil wrote:
> The top/left crop coordinates were 0, 0 instead of 8, 8 in the
> supported_modes array. This was a mismatch with the default values,
> so this is corrected. Found with v4l2-compliance.
>
> Also add V4L2_SEL_TGT_CROP_BOUNDS support: CROP_DEFAULT and CROP_BOUNDS
> always go together. Found with v4l2-compliance.

Let me try to summarize the outcome of the discussion

1) All selection rectangles are defined in respect to the NATIVE_SIZE
   target, which returns the full pixel array size, which includes
   readable and non-readable pixels. It's top-left corner is in
   position (0,0)

3) CROP_BOUND returns the portion of the full pixel array which can be
   read out, including optical black pixels, and is defined in respect
   to the full pixel array size

2) CROP_DEFAULT returns the portion of the readable part of the pixel array
   which contains valid image data (aka 'active' pixels). It is again
   defined in respect to the full pixel array rectangle returned by
   NATIVE_SIZE target.

With an ack on my understanding, I think it's worth expanding the
target documentation a bit. As I've said I've been hesitant in doing
so, as those targets do not only apply to image sensors, but I think a
section that goes like "If the sub-device represents and image sensor
then the V4L2_SEL_TGT_.. target represents ... "

Laurent: this will have some impact on libcamera as well
https://git.linuxtv.org/libcamera.git/tree/src/libcamera/camera_sensor.cpp#n503
When we read the analogCrop rectangle, we decided it is defined in
respect to the active portion of the pixel array (CROP_DEFAULT) and
not from the full pixel array size (NATIVE_SIZE).

We then should:
1) Back-track on our decision to have analog crop defined in respect
to the active part and decide it should be defined in respect to the
full pixel array: this has implications on the existing IPAs that
assume what we have defined

2) Adjust the analogCrop rectangle by subtracting to its sizes the
values reported by TGT_CROP_DEFAULT.top and TGT_CROP_DEFAULT.left.

I would got for 2) what's your opinion ?

On this specific patch:

>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/media/i2c/imx219.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 0a546b8e466c..935e2a258ce5 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -473,8 +473,8 @@ static const struct imx219_mode supported_modes[] = {
>  		.width = 3280,
>  		.height = 2464,
>  		.crop = {
> -			.left = 0,
> -			.top = 0,
> +			.left = 8,
> +			.top = 8,

we have
#define IMX219_PIXEL_ARRAY_LEFT		8U
#define IMX219_PIXEL_ARRAY_TOP		8U

Which I would then re-name IMX219_ACTIVE_ARRAY_LEFT and
IMX219_ACTIVE_ARRAY_TOP and re-use it there


>  			.width = 3280,
>  			.height = 2464
>  		},
> @@ -489,8 +489,8 @@ static const struct imx219_mode supported_modes[] = {
>  		.width = 1920,
>  		.height = 1080,
>  		.crop = {
> -			.left = 680,
> -			.top = 692,
> +			.left = 8 + 680,
> +			.top = 8 + 692,
>  			.width = 1920,
>  			.height = 1080
>  		},
> @@ -505,8 +505,8 @@ static const struct imx219_mode supported_modes[] = {
>  		.width = 1640,
>  		.height = 1232,
>  		.crop = {
> -			.left = 0,
> -			.top = 0,
> +			.left = 8,
> +			.top = 8,
>  			.width = 3280,
>  			.height = 2464
>  		},
> @@ -521,8 +521,8 @@ static const struct imx219_mode supported_modes[] = {
>  		.width = 640,
>  		.height = 480,
>  		.crop = {
> -			.left = 1000,
> -			.top = 752,
> +			.left = 8 + 1000,
> +			.top = 8 + 752,
>  			.width = 1280,
>  			.height = 960
>  		},
> @@ -1014,6 +1014,7 @@ static int imx219_get_selection(struct v4l2_subdev *sd,
>  		return 0;
>
>  	case V4L2_SEL_TGT_CROP_DEFAULT:
> +	case V4L2_SEL_TGT_CROP_BOUNDS:

I think this is fine and that's my reasoning:

The IMAX219 pixel array is documented as

        /-------------- 3296 -------------------/
         8                                     8
        +---------------------------------------+    /
        |IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII| 8  |
        |IpppppppppppppppppppppppppppppppppppppI|    |
        |IpppppppppppppppppppppppppppppppppppppI|    |
        |IpppppppppppppppppppppppppppppppppppppI|    |
        |IpppppppppppppppppppppppppppppppppppppI|    |
        |IpppppppppppppppppppppppppppppppppppppI|    |
        |IpppppppppppppppppppppppppppppppppppppI|    |

                            ....                    2480

        |IpppppppppppppppppppppppppppppppppppppI|    |
        |IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII|    |
        |IoooooooooooooooooooooooooooooooooooooI| 16 |
        |IOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOI| 16 |
        |IoooooooooooooooooooooooooooooooooooooI| 8  |
        +---------------------------------------+    /

Where:
        I = invalid active area
        p = valid pixels
        o = Invalid OB area
        O = Valid OB area
        Effective area = 3296x2480
        Active area = 3280x2464

The 'active area' is then sorrounded by 8 invalid rows, 8 invalid
cols at the beginning and the end, and followed by 8 more invalid
rows. Then, 16 invalid black rows follow, then 16 -valid- black
rows, then 8 invalid black rows again.

My understanding is that the whole effective area is sent on the bus,
as the CSI-2 timings report the sizes of the 'effective' area to be
the whole 3296x2480 matrix, and assigns a CSI-2 data-type to the
"Valid OB area" while sets the DataType for invalid areas to Null.

However the registers that select the analog crop work on the 'active
area' only, so there is not way to select "I want the Valid OB area"
only, as the whole 'effective area' is sent on the bus and the CSI-2
receivers filters on the DataType to discard the 'Invalid' lines (to
which a Null DataType is assigned) and capture image data ('active area')
and eventually 'Valid black' pixels (which have a data type assigned).

All of this to say, there's no point in reporting a TGT_BOUND larger
that the active area, as the user cannot select portions outside of it
through the S_SELECTION API, but can only instruct it's CSI-2 receiver
to filter-in the data it desires, which I think we're missing an API
for.

Hans: would you like to go ahead with this patch, or should I take
over and change the libcamera part that parses these properties in one
go ?

Thanks
  j

>  		sel->r.top = IMX219_PIXEL_ARRAY_TOP;
>  		sel->r.left = IMX219_PIXEL_ARRAY_LEFT;
>  		sel->r.width = IMX219_PIXEL_ARRAY_WIDTH;
> --
> 2.27.0
>
