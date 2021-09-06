Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38FF34019B0
	for <lists+linux-media@lfdr.de>; Mon,  6 Sep 2021 12:22:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241909AbhIFKV5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Sep 2021 06:21:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241901AbhIFKVx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Sep 2021 06:21:53 -0400
Received: from lb1-smtp-cloud9.xs4all.net (lb1-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7973EC061575;
        Mon,  6 Sep 2021 03:20:48 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id NBk3m6fBqlQKhNBk5mQu1h; Mon, 06 Sep 2021 12:20:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1630923645; bh=8M6fyXU8grftY5acc4WLDDPOWY8QgCOCeUkFDXV+KPU=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=dKwT0S8J0N6ZrbSmE7xqgceQhyOMWDRFyFhYD5iUoFUXqknXGnzuiwkwmJittzAvy
         THHO0jx60Qtjo50x0lEdaxLXNhN75ciGo0TWyGIJEaIjtv12ki/dhDC+NwYSFaNU9w
         6KkLoSeHcyhibK1fKB3Wp/Rm7mYfDg1JGld8EKH3Kv7yFSksy8giYrLFpEAm3zKeoh
         SMOq8/iLun50aem46YasPHWadrN/SdG2JZl++NQeqL8Hk+k4CeVMJLyNl+UoXf7X41
         DWYA1GLbQZpeam9CUg4dDZs6/h3uLjHkdRJhPx3bP6LKVwINRirxC0a62jR2WgJKi3
         zroWM0CbZz6Ig==
Subject: Re: [PATCH 4/8] staging: media: zoran: add debugfs
To:     Corentin Labbe <clabbe@baylibre.com>, gregkh@linuxfoundation.org,
        mchehab@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, mjpeg-users@lists.sourceforge.net
References: <20210903191540.3052775-1-clabbe@baylibre.com>
 <20210903191540.3052775-5-clabbe@baylibre.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <e6b6affa-278a-5ef8-1cb1-b111a0756ea8@xs4all.nl>
Date:   Mon, 6 Sep 2021 12:20:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210903191540.3052775-5-clabbe@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfDdWVs9b//OYKD3Eufj05LU8pujp9tdhbk8S4oPJD55X6ikCeMW+LFnUIf50HSwhAr+I0ETlEPEKAjVOVfPauQM2NAQqFvSOZBN2y+4g0Cv3W+Je34BU
 UrR8LztNcNV47XcpfNuHpYGOJqStOMmeGM6G//vs2Fe9JceVKiw921aDhleRLh6dpChhWN/aeP1DyOELmniy/ZtXbP61GR4pAE8wThNevNSyMtt5rJ+GuDhd
 UZ17TzJh46zrSw/n3d+73BXJXrWvWggJ0L2/+pA6PwvNl228P6UI9TSpO61uxEhaFOPPFu/nDzjshLlv05jQNi7suKt8ZA0J5BojnNEnSmfHLx9x95GlBxr5
 QU/r96hiVTkHPZOoqAvIy1iSgOB9yG2aSoAV2nsPjmEOP8edIQAau98d8itDdcCe9WYO+H+tUQTgC/0ObXykuiEKuGAfrW6kVSpHr+5LdTxe7FwKyBH5QFuE
 sdAGypUeFF55WqWXi6ZVqAfrb0ZGJHshaV5hpuY9KaW63TbTD47VDF5hC+E=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 03/09/2021 21:15, Corentin Labbe wrote:
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

This should be %llx, otherwise you get a compile warning.

Regards,

	Hans

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
>  	return 0;
>  
>  zr_detach_vfe:
> 

