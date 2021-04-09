Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA46A3597F1
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 10:33:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229829AbhDIIdc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 04:33:32 -0400
Received: from mga14.intel.com ([192.55.52.115]:30497 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231904AbhDIIdb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 9 Apr 2021 04:33:31 -0400
IronPort-SDR: w+Rlp9HQ1+2GuQyCvu9MG7UKotisN5UDou8mZWYujLtn7S625wh9PiFqAplBJeejIqEPf8/5rK
 4z+d07kYqeQg==
X-IronPort-AV: E=McAfee;i="6000,8403,9948"; a="193266697"
X-IronPort-AV: E=Sophos;i="5.82,208,1613462400"; 
   d="scan'208";a="193266697"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2021 01:33:18 -0700
IronPort-SDR: y1rWW0xJe1WjbVDNwY6ORHuITfHxvhbE3REE/juvzdY+tUjNW2vlg2QQKCFM2WLUGNOK2g9eI7
 IuU4+JtpoVhA==
X-IronPort-AV: E=Sophos;i="5.82,208,1613462400"; 
   d="scan'208";a="442076842"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2021 01:31:52 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 72F7B201C0;
        Fri,  9 Apr 2021 11:31:49 +0300 (EEST)
Date:   Fri, 9 Apr 2021 11:31:49 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Martina Krasteva <martinax.krasteva@linux.intel.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        daniele.alessandrelli@linux.intel.com,
        paul.j.murphy@linux.intel.com, gjorgjix.rosikopulos@linux.intel.com
Subject: Re: [PATCH 06/10] media: Keem Bay Camera: Add ISP sub-device
Message-ID: <20210409083149.GF3@paasikivi.fi.intel.com>
References: <20210319180632.585-1-martinax.krasteva@linux.intel.com>
 <20210319180632.585-7-martinax.krasteva@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210319180632.585-7-martinax.krasteva@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martina,

On Fri, Mar 19, 2021 at 06:06:28PM +0000, Martina Krasteva wrote:
...
> +/**
> + * kmb_cam_xlink_alloc_channel - Allocate xlink camera channel id
> + * @xlink_cam: Pointer to xlink camera handle
> + *
> + * Each xlink channel (except main control) should have unieque id
> + *
> + * Return: Channel id, negative error otherwise
> + */
> +int kmb_cam_xlink_alloc_channel(struct kmb_xlink_cam *xlink_cam)
> +{
> +	int chan_id;
> +
> +	chan_id = ida_alloc_range(&xlink_cam->channel_ids,
> +				  KMB_CAM_XLINK_CHAN_ID_BASE,
> +				  U16_MAX, GFP_KERNEL);

return ida_alloc_range(...);

> +
> +	return chan_id;
> +}

...

> +
> +/**
> + * struct kmb_video_fh - KMB video file handler
> + * @fh: V4L2 file handler
> + * @kmb_vid: Pointer to KMB video device
> + * @lock: Mutex serializing access to fh
> + * @vb2_lock: Mutex serializing access to vb2 queue
> + * @vb2_q: Video buffer queue
> + * @active_fmt: Active format
> +     @pix: Mplane active pixel format
> +     @info: Active kmb format info

@active_fmt.info: ...

etc.

> + * @contiguous_memory: Flag to enable contiguous memory allocation
> + * @dma_queue: DMA buffers queue
> + * @thread: Pointer to worker thread data
> + */
> +struct kmb_video_fh {
> +	struct v4l2_fh fh;
> +	struct kmb_video *kmb_vid;
> +	struct mutex lock; /* Lock protecting fh operations */
> +	struct mutex vb2_lock; /* Lock protecting video buffer queue */
> +	struct vb2_queue vb2_q;
> +	struct {
> +		struct v4l2_pix_format_mplane pix;
> +		const struct kmb_video_fmt_info *info;
> +	} active_fmt;
> +	bool contiguous_memory;
> +	struct list_head dma_queue;
> +	struct task_struct *thread;
> +};
> +
> +int kmb_video_init(struct kmb_video *kmb_vid, const char *name);
> +void kmb_video_cleanup(struct kmb_video *kmb_vid);
> +
> +int kmb_video_register(struct kmb_video *kmb_vid,
> +		       struct v4l2_device *v4l2_dev);
> +void kmb_video_unregister(struct kmb_video *kmb_vid);
> +
> +#endif /* KEEMBAY_VIDEO_H */

-- 
Kind regards,

Sakari Ailus
