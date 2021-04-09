Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAE2E359BCE
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 12:18:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233664AbhDIKTC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 06:19:02 -0400
Received: from mga14.intel.com ([192.55.52.115]:38020 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233860AbhDIKS6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 9 Apr 2021 06:18:58 -0400
IronPort-SDR: qkwOO2y7al2QxrpQ6pm5tfyLHZ0NfR2vU12eIO6GGc3N7+yZLgOMXxM/hsvxdfxuRfTMPPxxZU
 Dw7a2DFg7tCg==
X-IronPort-AV: E=McAfee;i="6000,8403,9948"; a="193281731"
X-IronPort-AV: E=Sophos;i="5.82,209,1613462400"; 
   d="scan'208";a="193281731"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2021 03:17:47 -0700
IronPort-SDR: UsvtmxEY2Zx+wVsmJGAgqNuRADFdARj6mu7nCKRapaJ6c2N0Hr8dajhqvreYa41mjzwlM+VyoH
 RNiv/xNmPgjA==
X-IronPort-AV: E=Sophos;i="5.82,209,1613462400"; 
   d="scan'208";a="422670776"
Received: from mkrastex-mobl.ger.corp.intel.com (HELO mkrastexMOBL) ([10.104.88.16])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2021 03:17:44 -0700
From:   "Martina Krasteva" <martinax.krasteva@linux.intel.com>
To:     "'Sakari Ailus'" <sakari.ailus@linux.intel.com>
Cc:     <linux-media@vger.kernel.org>, <mchehab@kernel.org>,
        <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <daniele.alessandrelli@linux.intel.com>,
        <paul.j.murphy@linux.intel.com>,
        <gjorgjix.rosikopulos@linux.intel.com>
References: <20210319180632.585-1-martinax.krasteva@linux.intel.com> <20210319180632.585-7-martinax.krasteva@linux.intel.com> <20210409083149.GF3@paasikivi.fi.intel.com>
In-Reply-To: <20210409083149.GF3@paasikivi.fi.intel.com>
Subject: RE: [PATCH 06/10] media: Keem Bay Camera: Add ISP sub-device
Date:   Fri, 9 Apr 2021 11:17:42 +0100
Message-ID: <000101d72d29$9646f260$c2d4d720$@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGkxFC8iVmgdtfjjEKdBTZVxtLxOQG5ogTAAVktV/Sq+DOAEA==
Content-Language: en-us
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the review

> 
> Hi Martina,
> 
> On Fri, Mar 19, 2021 at 06:06:28PM +0000, Martina Krasteva wrote:
> ...
> > +/**
> > + * kmb_cam_xlink_alloc_channel - Allocate xlink camera channel id
> > + * @xlink_cam: Pointer to xlink camera handle
> > + *
> > + * Each xlink channel (except main control) should have unieque id
> > + *
> > + * Return: Channel id, negative error otherwise  */ int
> > +kmb_cam_xlink_alloc_channel(struct kmb_xlink_cam *xlink_cam) {
> > +	int chan_id;
> > +
> > +	chan_id = ida_alloc_range(&xlink_cam->channel_ids,
> > +				  KMB_CAM_XLINK_CHAN_ID_BASE,
> > +				  U16_MAX, GFP_KERNEL);
> 
> return ida_alloc_range(...);
> 

Will be fixed in next version
> > +
> > +	return chan_id;
> > +}
> 
> ...
> 
> > +
> > +/**
> > + * struct kmb_video_fh - KMB video file handler
> > + * @fh: V4L2 file handler
> > + * @kmb_vid: Pointer to KMB video device
> > + * @lock: Mutex serializing access to fh
> > + * @vb2_lock: Mutex serializing access to vb2 queue
> > + * @vb2_q: Video buffer queue
> > + * @active_fmt: Active format
> > +     @pix: Mplane active pixel format
> > +     @info: Active kmb format info
> 
> @active_fmt.info: ...
> 
> etc.
> 
Oops, will be fixed

> > + * @contiguous_memory: Flag to enable contiguous memory allocation
> > + * @dma_queue: DMA buffers queue
> > + * @thread: Pointer to worker thread data  */ struct kmb_video_fh {
> > +	struct v4l2_fh fh;
> > +	struct kmb_video *kmb_vid;
> > +	struct mutex lock; /* Lock protecting fh operations */
> > +	struct mutex vb2_lock; /* Lock protecting video buffer queue */
> > +	struct vb2_queue vb2_q;
> > +	struct {
> > +		struct v4l2_pix_format_mplane pix;
> > +		const struct kmb_video_fmt_info *info;
> > +	} active_fmt;
> > +	bool contiguous_memory;
> > +	struct list_head dma_queue;
> > +	struct task_struct *thread;
> > +};
> > +
> > +int kmb_video_init(struct kmb_video *kmb_vid, const char *name); void
> > +kmb_video_cleanup(struct kmb_video *kmb_vid);
> > +
> > +int kmb_video_register(struct kmb_video *kmb_vid,
> > +		       struct v4l2_device *v4l2_dev); void
> > +kmb_video_unregister(struct kmb_video *kmb_vid);
> > +
> > +#endif /* KEEMBAY_VIDEO_H */
> 
> --
> Kind regards,
> 
> Sakari Ailus

Best Regards,
Martina

