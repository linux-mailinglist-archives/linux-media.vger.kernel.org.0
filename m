Return-Path: <linux-media+bounces-49870-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B09D3CF1335
	for <lists+linux-media@lfdr.de>; Sun, 04 Jan 2026 19:39:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A8256300C0C2
	for <lists+linux-media@lfdr.de>; Sun,  4 Jan 2026 18:38:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8392A30FC11;
	Sun,  4 Jan 2026 18:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lD1mFivU"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD6430F527;
	Sun,  4 Jan 2026 18:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767551932; cv=none; b=Gkv1CubrES9eaBv41AMqM0TwaBYosUxFVRmd+f24jLksYgA+oI9dcRxA2MvM3ZKitvqO7+Gl8GewXiCgIPZsM85ONFuz6Bb7/UuFzwVwZX4sGnrHQC3qoKybo9bJtyXw2g+M1DRRpOLKtP99R3HTlAnZHGNSb2Lzz5gXRu4Zn60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767551932; c=relaxed/simple;
	bh=pRyq3X+jx+agZ0b2zRO8BRcnlX2r5MzHh4KQBuO/Ymg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pPJi2fGfT5dK+uvGf+q57hW4bFds+Rg+jA7qLs+2eVqvQW4mfsVyEtMgCTGfZPmSSGWVb2Yw7+R2BCQl4mzcm/LGidIJcW07sm/VSkFtoJnBrp3PaySjDU40X8CEJjcZ+bQtBRPoNkOhsnzWVO6b/TnN4zVXp7wLBpXBjShxONo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lD1mFivU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D78DC4CEF7;
	Sun,  4 Jan 2026 18:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767551931;
	bh=pRyq3X+jx+agZ0b2zRO8BRcnlX2r5MzHh4KQBuO/Ymg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lD1mFivUlYxAmACrxkKqEqCSpNvLlO6jjTgDqT0J0b2BgkEi3/3pyTMe6P+pHo8dY
	 QGLz8p50OEviacHIIUCzommGuVbedOAPgOFNZMteEEl6Ekfj/Ta5+2KPnRTV2UyD7t
	 Zsbzmi6dt781K7RZjS8JQ6aftl5lD9/mfg5S23sjkcwaUSwYjYX0+yCrvaB0n7XGkF
	 KwpRtqd0+cXurJJ/zk20PPkpZvYTcEuEa3GGUKpNQBp4kXN7NySfV716y9dU1XPhar
	 dGaXs433hb+WkHgff6VVyNKqJjva1FU1I/UP901oZuogekedvC0vaKLW4kCrCau9l9
	 9B/TJ57ef0t3g==
Message-ID: <81e2d12c-342b-4b88-88a0-3e24115541aa@kernel.org>
Date: Sun, 4 Jan 2026 19:38:48 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: atomisp: replace shadow zoom structs with
 v4l2_rect and fix error paths
To: Karthikey D Kadati <karthikey3608@gmail.com>, mchehab@kernel.org
Cc: sakari.ailus@linux.intel.com, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260104164037.18176-1-karthikey3608@gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260104164037.18176-1-karthikey3608@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Karthikey,

On 4-Jan-26 17:40, Karthikey D Kadati wrote:
> This patch addresses a TODO graduation blocker by removing private zoom
> structures (`atomisp_zoom_point` and `atomisp_zoom_region`) in favor of
> standard V4L2 types (`v4l2_rect`).
> 
> It also improves error propagation for IRQs and XNR configuration, ensuring
> that failures are detected and reported. Additionally, it consolidates
> memory allocation boilerplate into a safer helper function
> (`atomisp_alloc_stat_bufs_list`) that includes a proper error-unwind path
> to prevent memory leaks during partial allocation failures.

It looks like you are doing a lot of unrelated changes in a single 
patch. Please split this up into multiple patches each only making
a single change:

1. Replace shadow zoom structs with v4l2_rect
2. Add atomisp_alloc_stat_bufs_list() helper function (and use it)
3. Error handling fixes

Regards,

Hans



> 
> Signed-off-by: Karthikey D Kadati <karthikey3608@gmail.com>
> ---
>  .../media/atomisp/include/linux/atomisp.h     |  19 +--
>  .../staging/media/atomisp/pci/atomisp_cmd.c   | 144 ++++++++---------
>  .../staging/media/atomisp/pci/atomisp_ioctl.c | 147 +++++++++++++-----
>  3 files changed, 183 insertions(+), 127 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/include/linux/atomisp.h b/drivers/staging/media/atomisp/include/linux/atomisp.h
> index fcf116cc4..e86f636d2 100644
> --- a/drivers/staging/media/atomisp/include/linux/atomisp.h
> +++ b/drivers/staging/media/atomisp/include/linux/atomisp.h
> @@ -326,27 +326,14 @@ struct atomisp_resolution {
>  	u32 height; /** Height */
>  };
>  
> -/*
> - * This specifies the coordinates (x,y)
> - */
> -struct atomisp_zoom_point {
> -	s32 x; /** x coordinate */
> -	s32 y; /** y coordinate */
> -};
> +#include <linux/videodev2.h>
>  
> -/*
> - * This specifies the region
> - */
> -struct atomisp_zoom_region {
> -	struct atomisp_zoom_point
> -		origin; /* Starting point coordinates for the region */
> -	struct atomisp_resolution resolution; /* Region resolution */
> -};
> +/* Use v4l2_rect instead of shadow structures */
>  
>  struct atomisp_dz_config {
>  	u32 dx; /** Horizontal zoom factor */
>  	u32 dy; /** Vertical zoom factor */
> -	struct atomisp_zoom_region zoom_region; /** region for zoom */
> +	struct v4l2_rect zoom_region; /** region for zoom */
>  };
>  
>  struct atomisp_parm {
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> index 327836372..76a65f379 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> @@ -874,7 +874,9 @@ void atomisp_assert_recovery_work(struct work_struct *work)
>  	if (!isp->asd.streaming)
>  		goto out_unlock;
>  
> -	atomisp_css_irq_enable(isp, IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF, false);
> +	if (atomisp_css_irq_enable(isp, IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF,
> +				   false))
> +		dev_err_once(isp->dev, "atomisp_css_irq_enable failed\n");
>  
>  	spin_lock_irqsave(&isp->lock, flags);
>  	isp->asd.streaming = false;
> @@ -925,8 +927,9 @@ void atomisp_assert_recovery_work(struct work_struct *work)
>  
>  	atomisp_csi2_configure(&isp->asd);
>  
> -	atomisp_css_irq_enable(isp, IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF,
> -			       atomisp_css_valid_sof(isp));
> +	if (atomisp_css_irq_enable(isp, IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF,
> +				   atomisp_css_valid_sof(isp)))
> +		dev_err_once(isp->dev, "atomisp_css_irq_enable failed\n");
>  
>  	if (atomisp_freq_scaling(isp, ATOMISP_DFS_MODE_AUTO, true) < 0)
>  		dev_dbg(isp->dev, "DFS auto failed while recovering!\n");
> @@ -1196,9 +1199,7 @@ int atomisp_xnr(struct atomisp_sub_device *asd, int flag,
>  		return 0;
>  	}
>  
> -	atomisp_css_capture_enable_xnr(asd, !!*xnr_enable);
> -
> -	return 0;
> +	return atomisp_css_capture_enable_xnr(asd, !!*xnr_enable);
>  }
>  
>  /*
> @@ -1764,15 +1765,13 @@ int atomisp_calculate_real_zoom_region(struct atomisp_sub_device *asd,
>  		return -EINVAL;
>  	}
>  
> -	if (dz_config->zoom_region.resolution.width
> -	    == asd->sensor_array_res.width
> -	    || dz_config->zoom_region.resolution.height
> -	    == asd->sensor_array_res.height) {
> +	if (dz_config->zoom_region.width == asd->sensor_array_res.width ||
> +	    dz_config->zoom_region.height == asd->sensor_array_res.height) {
>  		/*no need crop region*/
> -		dz_config->zoom_region.origin.x = 0;
> -		dz_config->zoom_region.origin.y = 0;
> -		dz_config->zoom_region.resolution.width = eff_res.width;
> -		dz_config->zoom_region.resolution.height = eff_res.height;
> +		dz_config->zoom_region.left = 0;
> +		dz_config->zoom_region.top = 0;
> +		dz_config->zoom_region.width = eff_res.width;
> +		dz_config->zoom_region.height = eff_res.height;
>  		return 0;
>  	}
>  
> @@ -1783,18 +1782,18 @@ int atomisp_calculate_real_zoom_region(struct atomisp_sub_device *asd,
>  	 */
>  
>  	if (!IS_ISP2401) {
> -		dz_config->zoom_region.origin.x = dz_config->zoom_region.origin.x
> -						  * eff_res.width
> -						  / asd->sensor_array_res.width;
> -		dz_config->zoom_region.origin.y = dz_config->zoom_region.origin.y
> -						  * eff_res.height
> -						  / asd->sensor_array_res.height;
> -		dz_config->zoom_region.resolution.width = dz_config->zoom_region.resolution.width
> -							  * eff_res.width
> -							  / asd->sensor_array_res.width;
> -		dz_config->zoom_region.resolution.height = dz_config->zoom_region.resolution.height
> -							  * eff_res.height
> -							  / asd->sensor_array_res.height;
> +		dz_config->zoom_region.left =
> +			(s32)((long long)dz_config->zoom_region.left *
> +			      eff_res.width / asd->sensor_array_res.width);
> +		dz_config->zoom_region.top =
> +			(s32)((long long)dz_config->zoom_region.top *
> +			      eff_res.height / asd->sensor_array_res.height);
> +		dz_config->zoom_region.width =
> +			(u32)((long long)dz_config->zoom_region.width *
> +			      eff_res.width / asd->sensor_array_res.width);
> +		dz_config->zoom_region.height =
> +			(u32)((long long)dz_config->zoom_region.height *
> +			      eff_res.height / asd->sensor_array_res.height);
>  		/*
>  		 * Set same ratio of crop region resolution and current pipe output
>  		 * resolution
> @@ -1821,62 +1820,67 @@ int atomisp_calculate_real_zoom_region(struct atomisp_sub_device *asd,
>  				   - asd->sensor_array_res.width
>  				   * out_res.height / out_res.width;
>  			h_offset = h_offset / 2;
> -			if (dz_config->zoom_region.origin.y < h_offset)
> -				dz_config->zoom_region.origin.y = 0;
> +			if (dz_config->zoom_region.top < h_offset)
> +				dz_config->zoom_region.top = 0;
>  			else
> -				dz_config->zoom_region.origin.y = dz_config->zoom_region.origin.y - h_offset;
> +				dz_config->zoom_region.top = dz_config->zoom_region.top - h_offset;
>  			w_offset = 0;
>  		} else {
>  			w_offset = asd->sensor_array_res.width
>  				   - asd->sensor_array_res.height
>  				   * out_res.width / out_res.height;
>  			w_offset = w_offset / 2;
> -			if (dz_config->zoom_region.origin.x < w_offset)
> -				dz_config->zoom_region.origin.x = 0;
> +			if (dz_config->zoom_region.left < w_offset)
> +				dz_config->zoom_region.left = 0;
>  			else
> -				dz_config->zoom_region.origin.x = dz_config->zoom_region.origin.x - w_offset;
> +				dz_config->zoom_region.left =
> +					dz_config->zoom_region.left - w_offset;
>  			h_offset = 0;
>  		}
> -		dz_config->zoom_region.origin.x = dz_config->zoom_region.origin.x
> -						  * eff_res.width
> -						  / (asd->sensor_array_res.width - 2 * w_offset);
> -		dz_config->zoom_region.origin.y = dz_config->zoom_region.origin.y
> -						  * eff_res.height
> -						  / (asd->sensor_array_res.height - 2 * h_offset);
> -		dz_config->zoom_region.resolution.width = dz_config->zoom_region.resolution.width
> -						  * eff_res.width
> -						  / (asd->sensor_array_res.width - 2 * w_offset);
> -		dz_config->zoom_region.resolution.height = dz_config->zoom_region.resolution.height
> -						  * eff_res.height
> -						  / (asd->sensor_array_res.height - 2 * h_offset);
> -	}
> -
> -	if (out_res.width * dz_config->zoom_region.resolution.height
> -	    > dz_config->zoom_region.resolution.width * out_res.height) {
> -		dz_config->zoom_region.resolution.height =
> -		    dz_config->zoom_region.resolution.width
> -		    * out_res.height / out_res.width;
> +		dz_config->zoom_region.left =
> +			(s32)((long long)dz_config->zoom_region.left *
> +			      eff_res.width /
> +			      (asd->sensor_array_res.width - 2 * w_offset));
> +		dz_config->zoom_region.top =
> +			(s32)((long long)dz_config->zoom_region.top *
> +			      eff_res.height /
> +			      (asd->sensor_array_res.height - 2 * h_offset));
> +		dz_config->zoom_region.width =
> +			(u32)((long long)dz_config->zoom_region.width *
> +			      eff_res.width /
> +			      (asd->sensor_array_res.width - 2 * w_offset));
> +		dz_config->zoom_region.height =
> +			(u32)((long long)dz_config->zoom_region.height *
> +			      eff_res.height /
> +			      (asd->sensor_array_res.height - 2 * h_offset));
> +	}
> +
> +	if ((long long)out_res.width * dz_config->zoom_region.height >
> +	    (long long)dz_config->zoom_region.width * out_res.height) {
> +		dz_config->zoom_region.height =
> +			(u32)((long long)dz_config->zoom_region.width *
> +			      out_res.height / out_res.width);
>  	} else {
> -		dz_config->zoom_region.resolution.width =
> -		    dz_config->zoom_region.resolution.height
> -		    * out_res.width / out_res.height;
> +		dz_config->zoom_region.width =
> +			(u32)((long long)dz_config->zoom_region.height *
> +			      out_res.width / out_res.height);
>  	}
>  	dev_dbg(asd->isp->dev,
>  		"%s crop region:(%d,%d),(%d,%d) eff_res(%d, %d) array_size(%d,%d) out_res(%d, %d)\n",
> -		__func__, dz_config->zoom_region.origin.x,
> -		dz_config->zoom_region.origin.y,
> -		dz_config->zoom_region.resolution.width,
> -		dz_config->zoom_region.resolution.height,
> +		__func__, dz_config->zoom_region.left,
> +		dz_config->zoom_region.top,
> +		dz_config->zoom_region.width,
> +		dz_config->zoom_region.height,
>  		eff_res.width, eff_res.height,
>  		asd->sensor_array_res.width,
>  		asd->sensor_array_res.height,
>  		out_res.width, out_res.height);
>  
> -	if ((dz_config->zoom_region.origin.x +
> -	     dz_config->zoom_region.resolution.width
> +	if ((dz_config->zoom_region.left +
> +	     dz_config->zoom_region.width
>  	     > eff_res.width) ||
> -	    (dz_config->zoom_region.origin.y +
> -	     dz_config->zoom_region.resolution.height
> +	    (dz_config->zoom_region.top +
> +	     dz_config->zoom_region.height
>  	     > eff_res.height))
>  		return -EINVAL;
>  
> @@ -1901,10 +1905,10 @@ static bool atomisp_check_zoom_region(
>  
>  	config.width = asd->sensor_array_res.width;
>  	config.height = asd->sensor_array_res.height;
> -	w = dz_config->zoom_region.origin.x +
> -	    dz_config->zoom_region.resolution.width;
> -	h = dz_config->zoom_region.origin.y +
> -	    dz_config->zoom_region.resolution.height;
> +	w = dz_config->zoom_region.left +
> +	    dz_config->zoom_region.width;
> +	h = dz_config->zoom_region.top +
> +	    dz_config->zoom_region.height;
>  
>  	if ((w <= config.width) && (h <= config.height) && w > 0 && h > 0)
>  		flag = true;
> @@ -1912,10 +1916,10 @@ static bool atomisp_check_zoom_region(
>  		/* setting error zoom region */
>  		dev_err(asd->isp->dev,
>  			"%s zoom region ERROR:dz_config:(%d,%d),(%d,%d)array_res(%d, %d)\n",
> -			__func__, dz_config->zoom_region.origin.x,
> -			dz_config->zoom_region.origin.y,
> -			dz_config->zoom_region.resolution.width,
> -			dz_config->zoom_region.resolution.height,
> +			__func__, dz_config->zoom_region.left,
> +			dz_config->zoom_region.top,
> +			dz_config->zoom_region.width,
> +			dz_config->zoom_region.height,
>  			config.width, config.height);
>  
>  	return flag;
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> index 5c0a1d92b..bb277f5a3 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> @@ -678,13 +678,104 @@ static int atomisp_g_fmt_cap(struct file *file, void *fh,
>  	return atomisp_try_fmt_cap(file, fh, f);
>  }
>  
> +static int atomisp_alloc_stat_bufs_list(struct atomisp_sub_device *asd,
> +					u16 stream_id,
> +					struct list_head *head,
> +					int count,
> +					int type)
> +{
> +	struct atomisp_s3a_buf *s3a_buf;
> +	struct atomisp_dis_buf *dis_buf;
> +	struct atomisp_metadata_buf *md_buf;
> +	int ret;
> +
> +	while (count--) {
> +		switch (type) {
> +		case IA_CSS_BUFFER_TYPE_3A_STATISTICS:
> +			s3a_buf = kzalloc(sizeof(*s3a_buf), GFP_KERNEL);
> +			if (!s3a_buf)
> +				goto error;
> +
> +			ret = atomisp_css_allocate_stat_buffers(asd, stream_id,
> +								s3a_buf, NULL,
> +								NULL);
> +			if (ret) {
> +				kfree(s3a_buf);
> +				goto error;
> +			}
> +			list_add_tail(&s3a_buf->list, head);
> +			break;
> +		case IA_CSS_BUFFER_TYPE_DIS_STATISTICS:
> +			dis_buf = kzalloc(sizeof(*dis_buf), GFP_KERNEL);
> +			if (!dis_buf)
> +				goto error;
> +
> +			ret = atomisp_css_allocate_stat_buffers(asd, stream_id,
> +								NULL, dis_buf,
> +								NULL);
> +			if (ret) {
> +				kfree(dis_buf);
> +				goto error;
> +			}
> +			list_add_tail(&dis_buf->list, head);
> +			break;
> +		case IA_CSS_BUFFER_TYPE_METADATA:
> +			md_buf = kzalloc(sizeof(*md_buf), GFP_KERNEL);
> +			if (!md_buf)
> +				goto error;
> +
> +			ret = atomisp_css_allocate_stat_buffers(asd, stream_id,
> +								NULL, NULL,
> +								md_buf);
> +			if (ret) {
> +				kfree(md_buf);
> +				goto error;
> +			}
> +			list_add_tail(&md_buf->list, head);
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +	}
> +
> +	return 0;
> +
> +error:
> +	while (!list_empty(head)) {
> +		switch (type) {
> +		case IA_CSS_BUFFER_TYPE_3A_STATISTICS:
> +			s3a_buf = list_entry(head->next,
> +					     struct atomisp_s3a_buf, list);
> +			atomisp_css_free_3a_buffer(s3a_buf);
> +			list_del(&s3a_buf->list);
> +			kfree(s3a_buf);
> +			break;
> +		case IA_CSS_BUFFER_TYPE_DIS_STATISTICS:
> +			dis_buf = list_entry(head->next,
> +					     struct atomisp_dis_buf, list);
> +			atomisp_css_free_dis_buffer(dis_buf);
> +			list_del(&dis_buf->list);
> +			kfree(dis_buf);
> +			break;
> +		case IA_CSS_BUFFER_TYPE_METADATA:
> +			md_buf = list_entry(head->next,
> +					    struct atomisp_metadata_buf, list);
> +			atomisp_css_free_metadata_buffer(md_buf);
> +			list_del(&md_buf->list);
> +			kfree(md_buf);
> +			break;
> +		}
> +	}
> +	return -ENOMEM;
> +}
> +
>  int atomisp_alloc_css_stat_bufs(struct atomisp_sub_device *asd,
>  				uint16_t stream_id)
>  {
>  	struct atomisp_device *isp = asd->isp;
> -	struct atomisp_s3a_buf *s3a_buf = NULL, *_s3a_buf;
> -	struct atomisp_dis_buf *dis_buf = NULL, *_dis_buf;
> -	struct atomisp_metadata_buf *md_buf = NULL, *_md_buf;
> +	struct atomisp_dis_buf *dis_buf, *_dis_buf;
> +	struct atomisp_s3a_buf *s3a_buf, *_s3a_buf;
> +	struct atomisp_metadata_buf *md_buf, *_md_buf;
>  	int count;
>  	struct ia_css_dvs_grid_info *dvs_grid_info =
>  	    atomisp_css_get_dvs_grid_info(&asd->params.curr_grid_info);
> @@ -695,37 +786,20 @@ int atomisp_alloc_css_stat_bufs(struct atomisp_sub_device *asd,
>  		count = ATOMISP_CSS_Q_DEPTH +
>  			ATOMISP_S3A_BUF_QUEUE_DEPTH_FOR_HAL;
>  		dev_dbg(isp->dev, "allocating %d 3a buffers\n", count);
> -		while (count--) {
> -			s3a_buf = kzalloc(sizeof(struct atomisp_s3a_buf), GFP_KERNEL);
> -			if (!s3a_buf)
> -				goto error;
> -
> -			if (atomisp_css_allocate_stat_buffers(
> -				asd, stream_id, s3a_buf, NULL, NULL)) {
> -				kfree(s3a_buf);
> -				goto error;
> -			}
> -
> -			list_add_tail(&s3a_buf->list, &asd->s3a_stats);
> -		}
> +		if (atomisp_alloc_stat_bufs_list(asd, stream_id,
> +						 &asd->s3a_stats, count,
> +						 IA_CSS_BUFFER_TYPE_3A_STATISTICS))
> +			goto error;
>  	}
>  
>  	if (list_empty(&asd->dis_stats) && dvs_grid_info &&
>  	    dvs_grid_info->enable) {
>  		count = ATOMISP_CSS_Q_DEPTH + 1;
>  		dev_dbg(isp->dev, "allocating %d dis buffers\n", count);
> -		while (count--) {
> -			dis_buf = kzalloc(sizeof(struct atomisp_dis_buf), GFP_KERNEL);
> -			if (!dis_buf)
> -				goto error;
> -			if (atomisp_css_allocate_stat_buffers(
> -				asd, stream_id, NULL, dis_buf, NULL)) {
> -				kfree(dis_buf);
> -				goto error;
> -			}
> -
> -			list_add_tail(&dis_buf->list, &asd->dis_stats);
> -		}
> +		if (atomisp_alloc_stat_bufs_list(asd, stream_id,
> +						 &asd->dis_stats, count,
> +						 IA_CSS_BUFFER_TYPE_DIS_STATISTICS))
> +			goto error;
>  	}
>  
>  	for (i = 0; i < ATOMISP_METADATA_TYPE_NUM; i++) {
> @@ -736,19 +810,10 @@ int atomisp_alloc_css_stat_bufs(struct atomisp_sub_device *asd,
>  				ATOMISP_METADATA_QUEUE_DEPTH_FOR_HAL;
>  			dev_dbg(isp->dev, "allocating %d metadata buffers for type %d\n",
>  				count, i);
> -			while (count--) {
> -				md_buf = kzalloc(sizeof(struct atomisp_metadata_buf),
> -						 GFP_KERNEL);
> -				if (!md_buf)
> -					goto error;
> -
> -				if (atomisp_css_allocate_stat_buffers(
> -					asd, stream_id, NULL, NULL, md_buf)) {
> -					kfree(md_buf);
> -					goto error;
> -				}
> -				list_add_tail(&md_buf->list, &asd->metadata[i]);
> -			}
> +			if (atomisp_alloc_stat_bufs_list(asd, stream_id,
> +							 &asd->metadata[i], count,
> +							 IA_CSS_BUFFER_TYPE_METADATA))
> +				goto error;
>  		}
>  	}
>  	return 0;


