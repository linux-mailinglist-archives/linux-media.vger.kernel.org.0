Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D94F9B033
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2019 15:00:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395096AbfHWM5C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Aug 2019 08:57:02 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:37455 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389245AbfHWM5A (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Aug 2019 08:57:00 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1i197f-0006X5-4Y; Fri, 23 Aug 2019 14:56:55 +0200
Message-ID: <1566565015.3023.16.camel@pengutronix.de>
Subject: Re: [PATCH v3 2/7] Documentation: media: Describe
 V4L2_CID_UNIT_CELL_SIZE
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Ricardo Ribalda Delgado <ribalda@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>
Date:   Fri, 23 Aug 2019 14:56:55 +0200
In-Reply-To: <20190823123737.7774-2-ribalda@kernel.org>
References: <20190823123737.7774-1-ribalda@kernel.org>
         <20190823123737.7774-2-ribalda@kernel.org>
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

On Fri, 2019-08-23 at 14:37 +0200, Ricardo Ribalda Delgado wrote:
> New control to pass to userspace the width/height of a pixel. Which is
> needed for calibration and lens selection.
> 
> Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
> ---
>  Documentation/media/uapi/v4l/ext-ctrls-image-source.rst | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/media/uapi/v4l/ext-ctrls-image-source.rst b/Documentation/media/uapi/v4l/ext-ctrls-image-source.rst
> index 2c3ab5796d76..6e728accf67b 100644
> --- a/Documentation/media/uapi/v4l/ext-ctrls-image-source.rst
> +++ b/Documentation/media/uapi/v4l/ext-ctrls-image-source.rst
> @@ -55,3 +55,11 @@ Image Source Control IDs
>  
>  ``V4L2_CID_TEST_PATTERN_GREENB (integer)``
>      Test pattern green (next to blue) colour component.
> +
> +``V4L2_CID_UNIT_CELL_SIZE (struct)``
> +    This control returns the unit cell size in nanometres. The struct provides
> +    the width and the height in separated fields to take into consideration
> +    asymmetric pixels and/or hardware binning.
> +    The unit cell consists of the whole area of the pixel, sensitive and
> +    non-sensitive.
> +    This control is required for automatic calibration sensors/cameras.

Can we have a link from here to the struct v4l2_area documentation?

regards
Philipp
