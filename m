Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B9604009E7
	for <lists+linux-media@lfdr.de>; Sat,  4 Sep 2021 07:53:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229998AbhIDFyF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 4 Sep 2021 01:54:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:56358 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229741AbhIDFyE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 4 Sep 2021 01:54:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BDBA960F90;
        Sat,  4 Sep 2021 05:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1630734783;
        bh=qpOBAvDkDu13hb8ihotJ6B5GQ43H7dVCqgu92ZbgssU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ndzyo0kLml9lgVZDXvNlZX+vzt4QXmPQ7+BNSvOVHfTm0nomUhDRy6PDuJG2tuZD3
         ELl2PD8Ip3r2wpTq/UGUvZKU8cHDJ49kLCy1L65JJ3kJqLcMDwIuf6ZyJdr7CkqbjB
         vj2vjdkS95DrO9+aEbvnxTJ2+1+3vqjYTBKVxvkI=
Date:   Sat, 4 Sep 2021 07:53:00 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Corentin Labbe <clabbe@baylibre.com>
Cc:     mchehab@kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        mjpeg-users@lists.sourceforge.net
Subject: Re: [PATCH 4/8] staging: media: zoran: add debugfs
Message-ID: <YTMJvI1C1OmBgdeI@kroah.com>
References: <20210903191540.3052775-1-clabbe@baylibre.com>
 <20210903191540.3052775-5-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210903191540.3052775-5-clabbe@baylibre.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Sep 03, 2021 at 07:15:36PM +0000, Corentin Labbe wrote:
> Add debugfs for displaying zoran debug and stats information.
> 
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> ---
>  drivers/staging/media/zoran/Kconfig      | 10 ++++++
>  drivers/staging/media/zoran/zoran.h      |  5 +++
>  drivers/staging/media/zoran/zoran_card.c | 39 ++++++++++++++++++++++++
>  3 files changed, 54 insertions(+)
> 
> diff --git a/drivers/staging/media/zoran/Kconfig b/drivers/staging/media/zoran/Kconfig
> index 7874842033ca..7d2d3c2431b1 100644
> --- a/drivers/staging/media/zoran/Kconfig
> +++ b/drivers/staging/media/zoran/Kconfig
> @@ -74,3 +74,13 @@ config VIDEO_ZORAN_AVS6EYES
>  	select VIDEO_KS0127 if MEDIA_SUBDRV_AUTOSELECT
>  	help
>  	  Support for the AverMedia 6 Eyes video surveillance card.
> +
> +config VIDEO_ZORAN_DEBUG
> +	bool "Enable zoran debugfs"
> +	depends on VIDEO_ZORAN
> +	depends on DEBUG_FS
> +	help
> +	  Say y to enable zoran debug file.
> +	  This will create /sys/kernel/debug/CARD_NAME/debug for displaying
> +	  stats and debug information.
> +
> diff --git a/drivers/staging/media/zoran/zoran.h b/drivers/staging/media/zoran/zoran.h
> index b1ad2a2b914c..8c271005f14d 100644
> --- a/drivers/staging/media/zoran/zoran.h
> +++ b/drivers/staging/media/zoran/zoran.h
> @@ -18,6 +18,7 @@
>  #ifndef _BUZ_H_
>  #define _BUZ_H_
>  
> +#include <linux/debugfs.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/videobuf2-core.h>
> @@ -295,6 +296,10 @@ struct zoran {
>  	struct list_head queued_bufs;
>  	spinlock_t queued_bufs_lock; /* Protects queued_bufs */
>  	struct zr_buffer *inuse[BUZ_NUM_STAT_COM * 2];
> +#ifdef CONFIG_VIDEO_ZORAN_DEBUG
> +	struct dentry *dbgfs_dir;
> +	struct dentry *dbgfs_file;

No need for these, the file is never referenced and the directory can be
looked up when you want to remove it.

> +#endif
>  };
>  
>  static inline struct zoran *to_zoran(struct v4l2_device *v4l2_dev)
> diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
> index f1465fbf98af..1ed8ed2f4f7f 100644
> --- a/drivers/staging/media/zoran/zoran_card.c
> +++ b/drivers/staging/media/zoran/zoran_card.c
> @@ -1051,6 +1051,39 @@ static const struct v4l2_ctrl_ops zoran_video_ctrl_ops = {
>  	.s_ctrl = zoran_video_set_ctrl,
>  };
>  
> +#ifdef CONFIG_VIDEO_ZORAN_DEBUG
> +static int zoran_debugfs_show(struct seq_file *seq, void *v)
> +{
> +	struct zoran *zr = seq->private;
> +
> +	seq_printf(seq, "Running mode %x\n", zr->running);
> +	seq_printf(seq, "Codec mode %x\n", zr->codec_mode);
> +	seq_printf(seq, "Norm %x\n", zr->norm);
> +	seq_printf(seq, "Input %d\n", zr->input);
> +	seq_printf(seq, "Buffersize %d\n", zr->buffer_size);
> +
> +	seq_printf(seq, "V4L width %dx%d\n", zr->v4l_settings.width, zr->v4l_settings.height);
> +	seq_printf(seq, "V4L bytesperline %d\n", zr->v4l_settings.bytesperline);
> +
> +	seq_printf(seq, "JPG decimation %u\n", zr->jpg_settings.decimation);
> +	seq_printf(seq, "JPG hor_dcm %u\n", zr->jpg_settings.hor_dcm);
> +	seq_printf(seq, "JPG ver_dcm %u\n", zr->jpg_settings.ver_dcm);
> +	seq_printf(seq, "JPG tmp_dcm %u\n", zr->jpg_settings.tmp_dcm);
> +	seq_printf(seq, "JPG odd_even %u\n", zr->jpg_settings.odd_even);
> +	seq_printf(seq, "JPG crop %dx%d %d %d\n",
> +		zr->jpg_settings.img_x,
> +		zr->jpg_settings.img_y,
> +		zr->jpg_settings.img_width,
> +		zr->jpg_settings.img_height);
> +
> +	seq_printf(seq, "Prepared %u\n", zr->prepared);
> +	seq_printf(seq, "Queued %u\n", zr->queued);
> +	return 0;
> +}
> +
> +DEFINE_SHOW_ATTRIBUTE(zoran_debugfs);
> +#endif
> +
>  /*
>   *   Scan for a Buz card (actually for the PCI controller ZR36057),
>   *   request the irq and map the io memory
> @@ -1286,6 +1319,12 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  
>  	zr->map_mode = ZORAN_MAP_MODE_RAW;
>  
> +#ifdef CONFIG_VIDEO_ZORAN_DEBUG
> +	zr->dbgfs_dir = debugfs_create_dir(ZR_DEVNAME(zr), NULL);
> +	zr->dbgfs_file = debugfs_create_file("debug", 0444,
> +					      zr->dbgfs_dir, zr,
> +					      &zoran_debugfs_fops);
> +#endif

Wait, when are you removing the files when the device is removed?

That needs to be fixed no matter what before this patch is accepted.

thanks,

greg k-h
