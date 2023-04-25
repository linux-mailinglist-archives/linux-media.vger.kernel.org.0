Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 033446EDDAF
	for <lists+linux-media@lfdr.de>; Tue, 25 Apr 2023 10:10:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233448AbjDYIKp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Apr 2023 04:10:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233416AbjDYIKn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Apr 2023 04:10:43 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 812EA2D76
        for <linux-media@vger.kernel.org>; Tue, 25 Apr 2023 01:10:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1C8536275E
        for <linux-media@vger.kernel.org>; Tue, 25 Apr 2023 08:10:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D84FC433A1;
        Tue, 25 Apr 2023 08:10:37 +0000 (UTC)
Message-ID: <d2e84f93-afc0-4006-aeb8-44be7c7ff55d@xs4all.nl>
Date:   Tue, 25 Apr 2023 10:10:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 13/13] media: bttv: convert to vb2
Content-Language: en-US
To:     Deborah Brouwer <deborah.brouwer@collabora.com>,
        linux-media@vger.kernel.org
References: <cover.1682379348.git.deborah.brouwer@collabora.com>
 <bc025f256d5ad3890e100b4d1359caa1f1447ad5.1682379348.git.deborah.brouwer@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <bc025f256d5ad3890e100b4d1359caa1f1447ad5.1682379348.git.deborah.brouwer@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

One compiler warning below:

On 25/04/2023 02:10, Deborah Brouwer wrote:
> Convert this driver from the old videobuf framework to videobuf2.
> 
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> ---
>  drivers/media/pci/bt8xx/Kconfig       |   2 +-
>  drivers/media/pci/bt8xx/bttv-driver.c | 805 ++++++++------------------
>  drivers/media/pci/bt8xx/bttv-risc.c   | 265 +++++----
>  drivers/media/pci/bt8xx/bttv-vbi.c    | 239 +++-----
>  drivers/media/pci/bt8xx/bttvp.h       |  60 +-
>  5 files changed, 491 insertions(+), 880 deletions(-)
> 

<snip>

> @@ -3414,6 +3055,35 @@ static void vdev_init(struct bttv *btv,
>  		v4l2_disable_ioctl(vfd, VIDIOC_G_TUNER);
>  		v4l2_disable_ioctl(vfd, VIDIOC_S_TUNER);
>  	}
> +
> +	if (strcmp(type_name, "radio") == 0)
> +		return 0;
> +
> +	if (strcmp(type_name, "video") == 0) {
> +		q = &btv->capq;
> +		q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
> +		q->ops = &bttv_video_qops;
> +	}
> +	if (strcmp(type_name, "vbi") == 0) {
> +		q = &btv->vbiq;
> +		q->type = V4L2_BUF_TYPE_VBI_CAPTURE;
> +		q->ops = &bttv_vbi_qops;
> +	}

I'm getting a compiler warning here:

drivers/media/pci/bt8xx/bttv-driver.c: In function 'vdev_init.isra':
drivers/media/pci/bt8xx/bttv-driver.c:3080:16: warning: 'q' may be used uninitialized [-Wmaybe-uninitialized]
 3080 |         q->dev = &btv->c.pci->dev;
      |         ~~~~~~~^~~~~~~~~~~~~~~~~~
drivers/media/pci/bt8xx/bttv-driver.c:3044:27: note: 'q' was declared here
 3044 |         struct vb2_queue *q;
      |                           ^

I would change this to:

	if (strcmp(type_name, "video") == 0) {
		...
	} else if (strcmp(type_name, "vbi") == 0) {
		...
	} else {
		return -EINVAL;
	}



> +	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> +	q->io_modes = VB2_MMAP | VB2_USERPTR | VB2_READ | VB2_DMABUF;
> +	q->mem_ops = &vb2_dma_sg_memops;
> +	q->drv_priv = btv;
> +	q->gfp_flags = __GFP_DMA32;
> +	q->buf_struct_size = sizeof(struct bttv_buffer);
> +	q->lock = &btv->lock;
> +	q->min_buffers_needed = 2;
> +	q->dev = &btv->c.pci->dev;
> +	err = vb2_queue_init(q);
> +	if (err)
> +		return err;
> +	vfd->queue = q;
> +
> +	return 0;
>  }

Regards,

	Hans

