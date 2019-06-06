Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16E6E36EBA
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 10:34:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727138AbfFFIeT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jun 2019 04:34:19 -0400
Received: from retiisi.org.uk ([95.216.213.190]:47300 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725267AbfFFIeT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 Jun 2019 04:34:19 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 88CFF634C7F;
        Thu,  6 Jun 2019 11:34:07 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.89)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1hYnqZ-0000Te-La; Thu, 06 Jun 2019 11:34:07 +0300
Date:   Thu, 6 Jun 2019 11:34:07 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Eugen.Hristev@microchip.com
Cc:     hverkuil@xs4all.nl, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] media: atmel: atmel-sama5d2-isc: fixed checkpatch
 warnings
Message-ID: <20190606083407.av2ifw4lr5w3pdxi@valkosipuli.retiisi.org.uk>
References: <1559806756-16683-1-git-send-email-eugen.hristev@microchip.com>
 <1559806756-16683-2-git-send-email-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1559806756-16683-2-git-send-email-eugen.hristev@microchip.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Eugen,

On Thu, Jun 06, 2019 at 07:43:47AM +0000, Eugen.Hristev@microchip.com wrote:
> From: Eugen Hristev <eugen.hristev@microchip.com>
> 
> Checkpatch complaining that locks do not have comments,
> unaligned code and macro reuse of same argument in to_isc_clk.
> Fixed them by renaming, realigning and adding struct comments
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> ---
> Changes in v3:
> - new patch, addresses the checkpatch issues that Hans asked to fix
> 
>  drivers/media/platform/atmel/atmel-isc.h         | 51 +++++++++++++++++++++---
>  drivers/media/platform/atmel/atmel-sama5d2-isc.c |  4 +-
>  2 files changed, 48 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/atmel/atmel-isc.h b/drivers/media/platform/atmel/atmel-isc.h
> index 0bd5dff..6ff9fa8 100644
> --- a/drivers/media/platform/atmel/atmel-isc.h
> +++ b/drivers/media/platform/atmel/atmel-isc.h
> @@ -24,14 +24,14 @@ struct isc_clk {
>  	struct clk_hw   hw;
>  	struct clk      *clk;
>  	struct regmap   *regmap;
> -	spinlock_t	lock;
> +	spinlock_t	lock;	/* synchronize access to clock registers */

You probably want to serialise the access, not synchronise it (i.e. happen
at the same time). So, s/synchronise/serialise/ ?

Same on the isc_device fields below.

With that,

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

>  	u8		id;
>  	u8		parent_id;
>  	u32		div;
>  	struct device	*dev;
>  };
>  
> -#define to_isc_clk(hw) container_of(hw, struct isc_clk, hw)
> +#define to_isc_clk(v) container_of(v, struct isc_clk, hw)
>  
>  struct isc_buffer {
>  	struct vb2_v4l2_buffer  vb;
> @@ -146,6 +146,47 @@ struct isc_ctrls {
>  
>  #define ISC_PIPE_LINE_NODE_NUM	11
>  
> +/*
> + * struct isc_device - ISC device driver data/config struct
> + * @regmap:		Register map
> + * @hclock:		Hclock clock input (refer datasheet)
> + * @ispck:		iscpck clock (refer datasheet)
> + * @isc_clks:		ISC clocks
> + *
> + * @dev:		Registered device driver
> + * @v4l2_dev:		v4l2 registered device
> + * @video_dev:		registered video device
> + *
> + * @vb2_vidq:		video buffer 2 video queue
> + * @dma_queue_lock:	lock to synchronize the dma buffer queue
> + * @dma_queue:		the queue for dma buffers
> + * @cur_frm:		current isc frame/buffer
> + * @sequence:		current frame number
> + * @stop:		true if isc is not streaming, false if streaming
> + * @comp:		completion reference that signals frame completion
> + *
> + * @fmt:		current v42l format
> + * @user_formats:	list of formats that are supported and agreed with sd
> + * @num_user_formats:	how many formats are in user_formats
> + *
> + * @config:		current ISC format configuration
> + * @try_config:		the current ISC try format , not yet activated
> + *
> + * @ctrls:		holds information about ISC controls
> + * @do_wb_ctrl:		control regarding the DO_WHITE_BALANCE button
> + * @awb_work:		workqueue reference for autowhitebalance histogram
> + *			analysis
> + *
> + * @lock:		lock for synchronizing userspace file operations
> + *			with ISC operations
> + * @awb_lock:		lock for synchronizing awb work queue operations
> + *			with DMA/buffer operations
> + *
> + * @pipeline:		configuration of the ISC pipeline
> + *
> + * @current_subdev:	current subdevice: the sensor
> + * @subdev_entities:	list of subdevice entitites
> + */
>  struct isc_device {
>  	struct regmap		*regmap;
>  	struct clk		*hclock;
> @@ -157,7 +198,7 @@ struct isc_device {
>  	struct video_device	video_dev;
>  
>  	struct vb2_queue	vb2_vidq;
> -	spinlock_t		dma_queue_lock;
> +	spinlock_t		dma_queue_lock; /* sync access to dma queue */
>  	struct list_head	dma_queue;
>  	struct isc_buffer	*cur_frm;
>  	unsigned int		sequence;
> @@ -175,8 +216,8 @@ struct isc_device {
>  	struct v4l2_ctrl	*do_wb_ctrl;
>  	struct work_struct	awb_work;
>  
> -	struct mutex		lock;
> -	spinlock_t		awb_lock;
> +	struct mutex		lock; /* sync access to file operations */
> +	spinlock_t		awb_lock; /* sync access to DMA buffers from awb work queue */
>  
>  	struct regmap_field	*pipeline[ISC_PIPE_LINE_NODE_NUM];
>  
> diff --git a/drivers/media/platform/atmel/atmel-sama5d2-isc.c b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
> index 69faaaf..299243f 100644
> --- a/drivers/media/platform/atmel/atmel-sama5d2-isc.c
> +++ b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
> @@ -87,8 +87,8 @@ static int isc_parse_dt(struct device *dev, struct isc_device *isc)
>  			break;
>  		}
>  
> -		subdev_entity = devm_kzalloc(dev,
> -					  sizeof(*subdev_entity), GFP_KERNEL);
> +		subdev_entity = devm_kzalloc(dev, sizeof(*subdev_entity),
> +					     GFP_KERNEL);
>  		if (!subdev_entity) {
>  			of_node_put(rem);
>  			ret = -ENOMEM;
> -- 
> 2.7.4
> 

-- 
Sakari Ailus
