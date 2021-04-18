Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6258363740
	for <lists+linux-media@lfdr.de>; Sun, 18 Apr 2021 21:06:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231646AbhDRTGq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Apr 2021 15:06:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbhDRTGq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Apr 2021 15:06:46 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4E9AC06174A
        for <linux-media@vger.kernel.org>; Sun, 18 Apr 2021 12:06:17 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5EAF04AB;
        Sun, 18 Apr 2021 21:06:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618772775;
        bh=+iuJRuThb9nj6dqxoy9Ffls+Z54BZ+p/yh20Zb9LrXU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GSMtp2kbGh1uzJ7uem0w9HTygxJgIpr4OJfGrQCls4sWiO1Jdxceg9nUXeD2Srthg
         cmcxS235+zaQoJj+tCuTYPYf7o6gOVItabLoRwc9f39+DLFu6lwmDLXTJSnIi/xyZf
         RjgEf7gW/QarHGDwPf//7UCrxd8a2ToFloXFkInA=
Date:   Sun, 18 Apr 2021 22:06:12 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v5 24/24] v4l: subdev: increase V4L2_FRAME_DESC_ENTRY_MAX
 to 8
Message-ID: <YHyDJFw5Uhl+xIDw@pendragon.ideasonboard.com>
References: <20210415130450.421168-1-tomi.valkeinen@ideasonboard.com>
 <20210415130450.421168-25-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210415130450.421168-25-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Thu, Apr 15, 2021 at 04:04:50PM +0300, Tomi Valkeinen wrote:
> V4L2_FRAME_DESC_ENTRY_MAX is currently set to 4. In theory it's possible
> to have an arbitrary amount of streams in a single pad, so preferably
> there should be no hardcoded maximum number.
> 
> However, I believe a reasonable max is 8, which would cover a CSI-2 pad
> with 4 streams of pixel data and 4 streams of metadata.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  include/media/v4l2-subdev.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 730631f9a091..49969d3699cb 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -356,7 +356,7 @@ struct v4l2_mbus_frame_desc_entry {
>  	} bus;
>  };
>  

With

 /*
  * FIXME: If this number is too small, it should be dropped altogether and the
  * API switched to a dynamic number of frame descriptor entries.
  */

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> -#define V4L2_FRAME_DESC_ENTRY_MAX	4
> +#define V4L2_FRAME_DESC_ENTRY_MAX	8
>  
>  enum v4l2_mbus_frame_desc_type {
>  	V4L2_MBUS_FRAME_DESC_TYPE_PLATFORM,

-- 
Regards,

Laurent Pinchart
