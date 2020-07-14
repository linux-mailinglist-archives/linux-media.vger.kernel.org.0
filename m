Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0325D21F12E
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2020 14:28:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728050AbgGNM2S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jul 2020 08:28:18 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:55963 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726352AbgGNM2R (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jul 2020 08:28:17 -0400
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id ECB9924000D;
        Tue, 14 Jul 2020 12:28:13 +0000 (UTC)
Date:   Tue, 14 Jul 2020 14:31:46 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
        libcamera-devel@lists.libcamera.org
Subject: Re: [PATCH] imx219: selection compliance fixes
Message-ID: <20200714123146.5xhmslath7vqqfds@uno.localdomain>
References: <b580ac9d-5ae4-29ce-c81a-a1f98b1d953b@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b580ac9d-5ae4-29ce-c81a-a1f98b1d953b@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Thu, Jul 02, 2020 at 03:50:04PM +0200, Hans Verkuil wrote:
> The top/left crop coordinates were 0, 0 instead of 8, 8 in the
> supported_modes array. This was a mismatch with the default values,
> so this is corrected. Found with v4l2-compliance.
>
> Also add V4L2_SEL_TGT_CROP_BOUNDS support: CROP_DEFAULT and CROP_BOUNDS
> always go together. Found with v4l2-compliance.

I actually introduced this with
e6d4ef7d58aa ("media: i2c: imx219: Implement get_selection")

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

Mmmm, why this change ?
This values are used to report V4L2_SEL_TGT_CROP rectangle, which
according to the documentation is defined as
"Crop rectangle. Defines the cropped area."
(not a much extensive description :)

Clearly this is a faulty definition, and I know from experience how
hard is proving to define pixel array properties and in which extent
the documentation has to go:
https://lists.libcamera.org/pipermail/libcamera-devel/2020-June/009115.html

My understanding is that target should report the current crop
rectangle, defined from the rectangle retrieved with the
V4L2_SEL_TGT_CROP_DEFAULT target, which, according documentation
reports the:
"Suggested cropping rectangle that covers the “whole picture”.
This includes only active pixels and excludes other non-active pixels such
as black pixels"

The TGT_CROP_DEFAULT then reports the active pixel array portion, and
needs to be defined in respect to the TGT_NATIVE_SIZE, which reports
the dimensions of the whole pixel matrix, including non-active pixels,
optical blanks active and non-active pixels.

The TGT_CROP rectangle is hence defined from the CROP_DEFAULT one, and
if the 'whole active area' is selected, its top-left corner is placed
in position (0, 0) (what's the point of defining it in respect to an
area which cannot be read anyway ?)

Unless TGT_CROP should be defined in respect to the NATIVE_SIZE
rectangle too, but that's not specified anywhere.

Anyway, those selection targets badly apply to image sensors, are
ill-defined as the definition of active pixels, optical blank (active
and non-active) pixels is not provided anywhere, and it's not specified
anywhere what is the reference area for each of those rectangles, so I
might very well got them wrongly.

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

Still not getting what is the purpose of two targets if the "always
have to go together" :)

>  		sel->r.top = IMX219_PIXEL_ARRAY_TOP;
>  		sel->r.left = IMX219_PIXEL_ARRAY_LEFT;
>  		sel->r.width = IMX219_PIXEL_ARRAY_WIDTH;
> --
> 2.27.0
>
