Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1C1D39B7B4
	for <lists+linux-media@lfdr.de>; Fri,  4 Jun 2021 13:13:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230228AbhFDLPA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Jun 2021 07:15:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229854AbhFDLPA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Jun 2021 07:15:00 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8097EC06174A
        for <linux-media@vger.kernel.org>; Fri,  4 Jun 2021 04:13:14 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id c13so4493956plz.0
        for <linux-media@vger.kernel.org>; Fri, 04 Jun 2021 04:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RjN7n3e9jvHWi5uQ82UqHQyH1oxqgv/tnA4DMcfZtA0=;
        b=mioATbcB/wJIEDEq7yBatUPbYTLQcxH/lVwaOUlQSaopv46wJWULkACrTveSmEPxdL
         bznK24X1LMMjvniL9BPaJLCltfuTPMLQ11uoZx5C0F2Yl7uZotcTrAQNkIl3SEsj/Nxj
         XVwpgwfwuO56UQ9WtUM4ZuZyIzorySgkxWedU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RjN7n3e9jvHWi5uQ82UqHQyH1oxqgv/tnA4DMcfZtA0=;
        b=uRWD3oGVFN2Q1NGgPz6knAT+C804nIgBWplI2Ff3Es1WR7ObbsaNkRJYMlka9q3uBC
         J585aomlzXtgCmbZ6IPyrSOUDoHuaBuDyQtO8D6m43bFS8ENnEHU4lHVmjZvwvSqfAt6
         Z8rpU/dZVrWAlkH4PaI78kFCd4vUSzjC+8ycVZvCKzNaC1ononIXYtZSG16LpbAZ4CtZ
         N/5A7LZTy4/uISRiG2VcLRFRa/RMoymggl9yQl93IMnTGiByAT6WzjI9Cvq9fr6xly1Y
         NGBxe3zbP4RhdngsRSSZg0p+NiKtcrMnlinmyBUR8Ruh5ZwbSqTRVUizGCU4ger9OHWU
         jutw==
X-Gm-Message-State: AOAM530Tjf3U5qGWOMgEw2co7Ua/IWdO4UsJKy6ZG62FOA8dKPp1Tb3u
        N1mfVar1fqStHgP2UN9KhUKIqg==
X-Google-Smtp-Source: ABdhPJxp0eESQ6TJ+DVqIxRUEjkscmpJGdf5qwMsMSA6u7XqTBSSqSij02jxSGQZcSGXi8WaglT3Ww==
X-Received: by 2002:a17:902:be0a:b029:104:4f7c:8140 with SMTP id r10-20020a170902be0ab02901044f7c8140mr3760411pls.70.1622805193938;
        Fri, 04 Jun 2021 04:13:13 -0700 (PDT)
Received: from chromium.org ([2401:fa00:8f:203:dbd1:4208:a05f:3593])
        by smtp.gmail.com with ESMTPSA id q4sm1578318pfg.3.2021.06.04.04.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 04:13:13 -0700 (PDT)
Date:   Fri, 4 Jun 2021 20:13:10 +0900
From:   Tomasz Figa <tfiga@chromium.org>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 1/3] media: videobuf2-v4l2.c: add
 vb2_queue_change_type() helper
Message-ID: <YLoKxlXsC/nT4rF7@chromium.org>
References: <20210412110211.275791-1-tomi.valkeinen@ideasonboard.com>
 <20210412110211.275791-2-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210412110211.275791-2-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On Mon, Apr 12, 2021 at 02:02:09PM +0300, Tomi Valkeinen wrote:
> On some platforms a video device can capture either video data or
> metadata. The driver can implement vidioc functions for both video and
> metadata, and use a single vb2_queue for the buffers. However, vb2_queue
> requires choosing a single buffer type, which conflicts with the idea of
> capturing either video or metadata.
> 
> The buffer type of vb2_queue can be changed, but it's not obvious how
> this should be done in the drivers. To help this, add a new helper
> function vb2_queue_change_type() which ensures the correct checks and
> documents how it can be used.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/common/videobuf2/videobuf2-v4l2.c | 14 ++++++++++++++
>  include/media/videobuf2-v4l2.h                  | 15 +++++++++++++++
>  2 files changed, 29 insertions(+)
> 

Good to see you contributing to the media subsystem. Not sure if you
still remember me from the Common Display Framework discussions. ;)

Anyway, thanks for the patch. I think the code itself is okay, but I'm
wondering why the driver couldn't just have two queues, one for each
type?

Best regards,
Tomasz

> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index 7e96f67c60ba..2988bb38ceb1 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -939,6 +939,20 @@ void vb2_queue_release(struct vb2_queue *q)
>  }
>  EXPORT_SYMBOL_GPL(vb2_queue_release);
>  
> +int vb2_queue_change_type(struct vb2_queue *q, unsigned int type)
> +{
> +	if (type == q->type)
> +		return 0;
> +
> +	if (vb2_is_busy(q))
> +		return -EBUSY;
> +
> +	q->type = type;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(vb2_queue_change_type);
> +
>  __poll_t vb2_poll(struct vb2_queue *q, struct file *file, poll_table *wait)
>  {
>  	struct video_device *vfd = video_devdata(file);
> diff --git a/include/media/videobuf2-v4l2.h b/include/media/videobuf2-v4l2.h
> index c203047eb834..12fa72a664cf 100644
> --- a/include/media/videobuf2-v4l2.h
> +++ b/include/media/videobuf2-v4l2.h
> @@ -261,6 +261,21 @@ int __must_check vb2_queue_init_name(struct vb2_queue *q, const char *name);
>   */
>  void vb2_queue_release(struct vb2_queue *q);
>  
> +/**
> + * vb2_queue_change_type() - change the type of an inactive vb2_queue
> + * @q:		pointer to &struct vb2_queue with videobuf2 queue.
> + *
> + * This function changes the type of the vb2_queue. This is only possible
> + * if the queue is not busy (i.e. no buffers have been allocated).
> + *
> + * vb2_queue_change_type() can be used to support multiple buffer types using
> + * the same queue. The driver can implement v4l2_ioctl_ops.vidioc_reqbufs and
> + * v4l2_ioctl_ops.vidioc_create_bufs functions and call vb2_queue_change_type()
> + * before calling vb2_ioctl_reqbufs() or vb2_ioctl_create_bufs(), and thus
> + * "lock" the buffer type until the buffers have been released.
> + */
> +int vb2_queue_change_type(struct vb2_queue *q, unsigned int type);
> +
>  /**
>   * vb2_poll() - implements poll userspace operation
>   * @q:		pointer to &struct vb2_queue with videobuf2 queue.
> -- 
> 2.25.1
> 
