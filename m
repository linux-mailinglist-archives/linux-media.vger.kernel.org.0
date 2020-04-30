Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90DA51BF451
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2020 11:43:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726565AbgD3Jmm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Apr 2020 05:42:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726404AbgD3Jmm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Apr 2020 05:42:42 -0400
X-Greylist: delayed 131958 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 30 Apr 2020 02:42:42 PDT
Received: from hillosipuli.retiisi.org.uk (hillosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0627DC035494;
        Thu, 30 Apr 2020 02:42:42 -0700 (PDT)
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 7CE2E634C8F;
        Thu, 30 Apr 2020 12:42:33 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1jU5iD-0000Q1-AI; Thu, 30 Apr 2020 12:42:33 +0300
Date:   Thu, 30 Apr 2020 12:42:33 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Daniel Gomez <daniel@qtec.com>
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [RFC PATCH 1/3] media: v4l2-subdev.h: Add min and max enum
Message-ID: <20200430094233.GE867@valkosipuli.retiisi.org.uk>
References: <20200414200151.80089-1-daniel@qtec.com>
 <20200414200151.80089-2-daniel@qtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200414200151.80089-2-daniel@qtec.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

Thanks for the patchset.

I'm also cc'ing Laurent who I think could be interested in this one.

On Tue, Apr 14, 2020 at 10:01:49PM +0200, Daniel Gomez wrote:
> Add min and max structures to the v4l2-subdev callback in order to allow
> the subdev to return a range of valid frame intervals.
> 
> This would operate similar to the struct v4l2_subdev_frame_size_enum and
> its max and min values for the width and the height. In this case, the
> possibility to return a frame interval range is added to the v4l2-subdev level
> whenever the v4l2 device operates in step-wise or continuous mode.

The current API only allows providing a list of enumerated values. That is
limiting indeed, especially on register list based sensor drivers where
vertical blanking is configurable.

I guess this could be extended to cover what V4L2, more or less. If we tell
it's a range, is it assumed to be contiguous? We don't have try operation
for the frame interval, but I guess set is good enough. The fraction is
probably best for TV standards but it's not what camera sensors natively
use. (But for a register list based driver, the established practice
remains to use frame interval.)

I'm also wondering the effect on existing user space; if a driver gives a
range, how will the existing programs work with such a driver?

I'd add an anonymous union with the interval field, the other field being
min_interval. Then the current applications would get the minimum interval
and still continue to function. I guess compilers are modern enough these
days we can have an anonymous union in the uAPI?

> 
> Signed-off-by: Daniel Gomez <daniel@qtec.com>
> ---
>  include/uapi/linux/v4l2-subdev.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
> index 03970ce30741..ee15393c58cd 100644
> --- a/include/uapi/linux/v4l2-subdev.h
> +++ b/include/uapi/linux/v4l2-subdev.h
> @@ -117,6 +117,8 @@ struct v4l2_subdev_frame_interval {
>   * @code: format code (MEDIA_BUS_FMT_ definitions)
>   * @width: frame width in pixels
>   * @height: frame height in pixels
> + * @min_interval: min frame interval in seconds
> + * @max_interval: max frame interval in seconds
>   * @interval: frame interval in seconds
>   * @which: format type (from enum v4l2_subdev_format_whence)
>   */
> @@ -126,9 +128,11 @@ struct v4l2_subdev_frame_interval_enum {
>  	__u32 code;
>  	__u32 width;
>  	__u32 height;
> +	struct v4l2_fract min_interval;
> +	struct v4l2_fract max_interval;

This changes the memory layout of the struct and breaks the ABI. Any new
fields in the struct may only replace reserved fields while the rest must
stay unchanged.

>  	struct v4l2_fract interval;
>  	__u32 which;
> -	__u32 reserved[8];
> +	__u32 reserved[4];
>  };
>  
>  /**

-- 
Regards,

Sakari Ailus
