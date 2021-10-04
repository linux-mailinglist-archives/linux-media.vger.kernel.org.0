Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B471421987
	for <lists+linux-media@lfdr.de>; Mon,  4 Oct 2021 23:59:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233487AbhJDWAw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Oct 2021 18:00:52 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54378 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233319AbhJDWAv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Oct 2021 18:00:51 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2F9955A1;
        Mon,  4 Oct 2021 23:59:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1633384741;
        bh=jEYa4ieG9XUiVKz082BinXgkZ1IxYFrGQisCTV/1Z5g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=v1MN3v/lqjbgqrfOxWNTr3LUPONVncV3Po67SBg/7PO85zithk/VPMa2gQLFPv4eC
         t8TQ0QHJFKeRuucCR2vXHTsF3bAaCqqch5GS7ZoExIbbhe6TFVlp0SiCaalk38J5dK
         0FolipUDIRatKK10ZURnE4KAwYxVBl0T+xx4SyLQ=
Date:   Tue, 5 Oct 2021 00:58:54 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tfiga@google.com, tian.shu.qiu@intel.com
Subject: Re: [PATCH] media: staging: ipu3-imgu: add the AWB memory layout
Message-ID: <YVt5HhjiP9i85ZMZ@pendragon.ideasonboard.com>
References: <20210930092021.65741-1-jeanmichel.hautbois@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210930092021.65741-1-jeanmichel.hautbois@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jean-Michel,

Thank you for the patch.

On Thu, Sep 30, 2021 at 11:20:21AM +0200, Jean-Michel Hautbois wrote:
> While parsing the RAW AWB metadata, the AWB layout was missing to fully
> understand which byte corresponds to which feature. Make the field names
> and usage explicit, as it is used by the userspace applications.

I would have mentioned how the hardware (or maybe firmware) generates
the statistics instead of how applications consume them, as it's the
IPU3 dictating the format, but it doesn't matter too much.

> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
> ---
>  .../media/ipu3/include/uapi/intel-ipu3.h      | 30 +++++++++++++++++--
>  1 file changed, 27 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h b/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
> index 585f55981c86..fdda9d0a30af 100644
> --- a/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
> +++ b/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
> @@ -61,6 +61,29 @@ struct ipu3_uapi_grid_config {
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
> + * @sat_ratio:  Saturation ratio in the cell.

Do we have more information about this field ? We can add it later if we
don't.

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
> @@ -73,8 +96,9 @@ struct ipu3_uapi_grid_config {
>  	(IPU3_UAPI_MAX_BUBBLE_SIZE * IPU3_UAPI_MAX_STRIPES * \
>  	 IPU3_UAPI_AWB_MD_ITEM_SIZE)
>  #define IPU3_UAPI_AWB_MAX_BUFFER_SIZE \
> -	(IPU3_UAPI_AWB_MAX_SETS * \
> -	 (IPU3_UAPI_AWB_SET_SIZE + IPU3_UAPI_AWB_SPARE_FOR_BUBBLES))
> +	((IPU3_UAPI_AWB_MAX_SETS * \
> +	 (IPU3_UAPI_AWB_SET_SIZE + IPU3_UAPI_AWB_SPARE_FOR_BUBBLES)) / \
> +	 sizeof(struct ipu3_uapi_awb_set_item))

We'll really have to figure out what the bubbles are... Not in this
patch though.

Given that IPU3_UAPI_AWB_MD_ITEM_SIZE is equal to the size of one item,
how about this ?

diff --git a/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h b/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
index ee0e6d0e4b2c..a18e9228ed07 100644
--- a/include/linux/intel-ipu3.h
+++ b/include/linux/intel-ipu3.h
@@ -65,11 +65,9 @@ struct ipu3_uapi_grid_config {
  */
 #define IPU3_UAPI_AWB_MAX_SETS				60
 /* Based on grid size 80 * 60 and cell size 16 x 16 */
-#define IPU3_UAPI_AWB_SET_SIZE				1280
-#define IPU3_UAPI_AWB_MD_ITEM_SIZE			8
+#define IPU3_UAPI_AWB_SET_SIZE				160
 #define IPU3_UAPI_AWB_SPARE_FOR_BUBBLES \
-	(IPU3_UAPI_MAX_BUBBLE_SIZE * IPU3_UAPI_MAX_STRIPES * \
-	 IPU3_UAPI_AWB_MD_ITEM_SIZE)
+	(IPU3_UAPI_MAX_BUBBLE_SIZE * IPU3_UAPI_MAX_STRIPES)
 #define IPU3_UAPI_AWB_MAX_BUFFER_SIZE \
 	(IPU3_UAPI_AWB_MAX_SETS * \
 	 (IPU3_UAPI_AWB_SET_SIZE + IPU3_UAPI_AWB_SPARE_FOR_BUBBLES))

>  
>  /**
>   * struct ipu3_uapi_awb_raw_buffer - AWB raw buffer
> @@ -83,7 +107,7 @@ struct ipu3_uapi_grid_config {
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
