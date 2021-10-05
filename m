Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05D43423267
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 22:53:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232250AbhJEUzj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 16:55:39 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45138 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231387AbhJEUzj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Oct 2021 16:55:39 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E21B525B;
        Tue,  5 Oct 2021 22:53:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1633467227;
        bh=bNi+NUYUelqeqTuOvcyL10Q7yaRx2j+pH0FSTzH9KRM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EAyDgVO3ZJEYhPc5Rl7qU12Vk0E1Jv+0fLa23vf4Yt2/j1fvnHy80O8cn2whfOmjs
         VVKYKP7jT5IrqgWCOhQlkxaCUVr8pzDtz2j9JMF+/LmnxcwZF1h0/OeH/e7r4f8DNm
         XbP1KBqlkZ21lPBtvI3XNcH6k4a/UEGRVr9KA4jo=
Date:   Tue, 5 Oct 2021 23:53:39 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tfiga@google.com, tian.shu.qiu@intel.com
Subject: Re: [PATCH v2] media: staging: ipu3-imgu: add the AWB memory layout
Message-ID: <YVy7U7rzUU/+PMaa@pendragon.ideasonboard.com>
References: <20211005202019.253353-1-jeanmichel.hautbois@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211005202019.253353-1-jeanmichel.hautbois@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jean-Michel,

Thank you for the patch.

On Tue, Oct 05, 2021 at 10:20:19PM +0200, Jean-Michel Hautbois wrote:
> While parsing the RAW AWB metadata, the AWB layout was missing to fully
> understand which byte corresponds to which feature. Make the field names
> and usage explicit, as it is used by the userspace applications.
> 
> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
> ---
>  .../media/ipu3/include/uapi/intel-ipu3.h      | 32 ++++++++++++++++---
>  1 file changed, 27 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h b/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
> index 585f55981c86..ad116a912e44 100644
> --- a/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
> +++ b/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
> @@ -61,17 +61,39 @@ struct ipu3_uapi_grid_config {
>  	__u16 y_end;
>  } __packed;
>  
> +/**
> + * struct ipu3_uapi_awb_set_item - Memory layout for each cell in AWB
> + *
> + * @Gr_avg:	Green average for red lines in the cell.
> + * @R_avg:	Red average in the cell.
> + * @B_avg:	Blue average in the cell.
> + * @Gb_avg:	Green average for blue lines in the cell.
> + * @sat_ratio:  Percentage of pixels over a given threshold set in

s/over a given threshold set in/over the thresholds specified in/

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I would still like a review from someone knowledgeable with the hardware
and firmware, as we're partly guessing here.

> + * 		ipu3_uapi_awb_config_s, coded from 0 to 255.
> + * @padding0:   Unused byte for padding.
> + * @padding1:   Unused byte for padding.
> + * @padding2:   Unused byte for padding.
> + */
> +struct ipu3_uapi_awb_set_item {
> +	__u8 Gr_avg;
> +	__u8 R_avg;
> +	__u8 B_avg;
> +	__u8 Gb_avg;
> +	__u8 sat_ratio;
> +	__u8 padding0;
> +	__u8 padding1;
> +	__u8 padding2;
> +} __attribute__((packed));
> +
>  /*
>   * The grid based data is divided into "slices" called set, each slice of setX
>   * refers to ipu3_uapi_grid_config width * height_per_slice.
>   */
>  #define IPU3_UAPI_AWB_MAX_SETS				60
>  /* Based on grid size 80 * 60 and cell size 16 x 16 */
> -#define IPU3_UAPI_AWB_SET_SIZE				1280
> -#define IPU3_UAPI_AWB_MD_ITEM_SIZE			8
> +#define IPU3_UAPI_AWB_SET_SIZE				160
>  #define IPU3_UAPI_AWB_SPARE_FOR_BUBBLES \
> -	(IPU3_UAPI_MAX_BUBBLE_SIZE * IPU3_UAPI_MAX_STRIPES * \
> -	 IPU3_UAPI_AWB_MD_ITEM_SIZE)
> +	(IPU3_UAPI_MAX_BUBBLE_SIZE * IPU3_UAPI_MAX_STRIPES)
>  #define IPU3_UAPI_AWB_MAX_BUFFER_SIZE \
>  	(IPU3_UAPI_AWB_MAX_SETS * \
>  	 (IPU3_UAPI_AWB_SET_SIZE + IPU3_UAPI_AWB_SPARE_FOR_BUBBLES))
> @@ -83,7 +105,7 @@ struct ipu3_uapi_grid_config {
>   *		the average values for each color channel.
>   */
>  struct ipu3_uapi_awb_raw_buffer {
> -	__u8 meta_data[IPU3_UAPI_AWB_MAX_BUFFER_SIZE]
> +	struct ipu3_uapi_awb_set_item meta_data[IPU3_UAPI_AWB_MAX_BUFFER_SIZE]
>  		__attribute__((aligned(32)));
>  } __packed;
>  

-- 
Regards,

Laurent Pinchart
