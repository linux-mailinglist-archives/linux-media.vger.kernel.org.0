Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8ECA09255A
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2019 15:42:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727487AbfHSNmV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Aug 2019 09:42:21 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:55035 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727332AbfHSNmV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Aug 2019 09:42:21 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hzhvL-0003R3-Fq; Mon, 19 Aug 2019 15:42:15 +0200
Message-ID: <1566222134.3008.4.camel@pengutronix.de>
Subject: Re: [PATCH 2/3] Documentation: Describe V4L2_CID_PIXEL_SIZE
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Ricardo Ribalda Delgado <ribalda@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Mon, 19 Aug 2019 15:42:14 +0200
In-Reply-To: <20190819121720.31345-2-ribalda@kernel.org>
References: <20190819121720.31345-1-ribalda@kernel.org>
         <20190819121720.31345-2-ribalda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 2019-08-19 at 14:17 +0200, Ricardo Ribalda Delgado wrote:
> New control to pass to userspace the width/height of a pixel. Which is
> needed for 3D calibration and lens selection.
> 
> Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
> ---
>  Documentation/media/uapi/v4l/ext-ctrls-camera.rst | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> index 51c1d5c9eb00..670c57a6f622 100644
> --- a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> +++ b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> @@ -510,6 +510,12 @@ enum v4l2_scene_mode -
>      value down. A value of zero stops the motion if one is in progress
>      and has no effect otherwise.
>  
> +``V4L2_CID_PIXEL_SIZE (struct)``
> +    This control returns the pixel size in nanometres. The struct provides
> +    the width and the height in separated fields to take into consideration
> +    asymmetric pixels and/or hardware binning.
> +    This control is required for automatic calibration of the sensor.
> +
>  .. [#f1]
>     This control may be changed to a menu control in the future, if more
>     options are required.

I suppose this is a common term, but should it be mentioned that pixel
size is the same as unit cell size, and not necessarily the size of the
light sensitive area? Just in case the effective fill-factor is < 100%.

regards
Philipp
