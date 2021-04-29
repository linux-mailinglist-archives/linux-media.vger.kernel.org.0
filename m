Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 847E436E369
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 04:50:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229814AbhD2Cvh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 22:51:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229718AbhD2Cvh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 22:51:37 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E870AC06138B
        for <linux-media@vger.kernel.org>; Wed, 28 Apr 2021 19:50:50 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 32FC7BC0;
        Thu, 29 Apr 2021 04:50:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619664649;
        bh=4k6wVuIEgC/QNzqhztuar4/dyUrGCvv+lckBmMJ9tXs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YPcMtCR/YmgtubcqZrhLiUEFWI68NvdTD2dlrX6QVkP7B/WOLQqOutSYvt3f75yLN
         e/q5e8w8B2imY9nQ76qLBKhP7gkQGbYTXcuPdGhuIFMNe9zKao1mW0ope0JRwBpoIC
         3VBRUDFjWgQAtTqaKX1pGLxEOCnUDo5GIeYr67sU=
Date:   Thu, 29 Apr 2021 05:50:43 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v6 17/24] v4l: Add stream to frame descriptor
Message-ID: <YIofAy+CwKq1DdHT@pendragon.ideasonboard.com>
References: <20210427124523.990938-1-tomi.valkeinen@ideasonboard.com>
 <20210427124523.990938-18-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210427124523.990938-18-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Tue, Apr 27, 2021 at 03:45:16PM +0300, Tomi Valkeinen wrote:
> From: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> The stream field identifies the stream this frame descriptor applies to in
> routing configuration across a multiplexed link.

I'd still move this to the next series, to review it with code that uses
this new field.

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  include/media/v4l2-subdev.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 695e97b6eb13..70a21298020b 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -338,6 +338,7 @@ enum v4l2_mbus_frame_desc_flags {
>   * struct v4l2_mbus_frame_desc_entry - media bus frame description structure
>   *
>   * @flags:	bitmask flags, as defined by &enum v4l2_mbus_frame_desc_flags.
> + * @stream:	stream in routing configuration
>   * @pixelcode:	media bus pixel code, valid if @flags
>   *		%FRAME_DESC_FL_BLOB is not set.
>   * @length:	number of octets per frame, valid if @flags
> @@ -347,6 +348,7 @@ enum v4l2_mbus_frame_desc_flags {
>   */
>  struct v4l2_mbus_frame_desc_entry {
>  	enum v4l2_mbus_frame_desc_flags flags;
> +	u32 stream;
>  	u32 pixelcode;
>  	u32 length;
>  	union {

-- 
Regards,

Laurent Pinchart
