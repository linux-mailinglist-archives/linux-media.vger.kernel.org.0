Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CD927C4DB0
	for <lists+linux-media@lfdr.de>; Wed, 11 Oct 2023 10:53:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344899AbjJKIxr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Oct 2023 04:53:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230190AbjJKIxq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Oct 2023 04:53:46 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31F8B9D;
        Wed, 11 Oct 2023 01:53:41 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FA29C433C8;
        Wed, 11 Oct 2023 08:53:37 +0000 (UTC)
Message-ID: <a054a3d6-f996-441b-9f16-5f473a5d7629@xs4all.nl>
Date:   Wed, 11 Oct 2023 10:53:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 13/54] media: Report the maximum possible number of
 buffers for the queue
Content-Language: en-US, nl
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        mchehab@kernel.org, tfiga@chromium.org, m.szyprowski@samsung.com,
        ming.qian@nxp.com, ezequiel@vanguardiasur.com.ar,
        p.zabel@pengutronix.de, gregkh@linuxfoundation.org,
        nicolas.dufresne@collabora.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
        kernel@collabora.com
References: <20231003080704.43911-1-benjamin.gaignard@collabora.com>
 <20231003080704.43911-14-benjamin.gaignard@collabora.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20231003080704.43911-14-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Minor issue: the subject should start with: "media: core:"

Regards,

	Hans

On 03/10/2023 10:06, Benjamin Gaignard wrote:
> Use one of the struct v4l2_create_buffers reserved bytes to report
> the maximum possible number of buffers for the queue.
> V4l2 framework set V4L2_BUF_CAP_SUPPORTS_SET_MAX_BUFS flags in queue
> capabilities so userland can know when the field is valid.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  .../userspace-api/media/v4l/vidioc-create-bufs.rst        | 8 ++++++--
>  Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst  | 1 +
>  drivers/media/common/videobuf2/videobuf2-v4l2.c           | 4 ++++
>  drivers/media/v4l2-core/v4l2-ioctl.c                      | 4 ++--
>  include/uapi/linux/videodev2.h                            | 7 ++++++-
>  5 files changed, 19 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst b/Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst
> index a048a9f6b7b6..1a46549e7462 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst
> @@ -116,9 +116,13 @@ than the number requested.
>        - ``flags``
>        - Specifies additional buffer management attributes.
>  	See :ref:`memory-flags`.
> -
>      * - __u32
> -      - ``reserved``\ [6]
> +      - ``max_buffers``
> +      - If V4L2_BUF_CAP_SUPPORTS_SET_MAX_BUFS capability flag is set
> +        this field indicate the maximum possible number of buffers
> +        for this queue.
> +    * - __u32
> +      - ``reserved``\ [5]
>        - A place holder for future extensions. Drivers and applications
>  	must set the array to zero.
>  
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
> index 099fa6695167..0395187e1a5a 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
> @@ -120,6 +120,7 @@ aborting or finishing any DMA in progress, an implicit
>  .. _V4L2-BUF-CAP-SUPPORTS-ORPHANED-BUFS:
>  .. _V4L2-BUF-CAP-SUPPORTS-M2M-HOLD-CAPTURE-BUF:
>  .. _V4L2-BUF-CAP-SUPPORTS-MMAP-CACHE-HINTS:
> +.. _V4L2-BUF-CAP-SUPPORTS-SET-MAX-BUFS:
>  
>  .. raw:: latex
>  
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index 278ea1107b01..42da0adc052a 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -686,6 +686,7 @@ EXPORT_SYMBOL(vb2_querybuf);
>  static void fill_buf_caps(struct vb2_queue *q, u32 *caps)
>  {
>  	*caps = V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS;
> +	*caps |= V4L2_BUF_CAP_SUPPORTS_SET_MAX_BUFS;
>  	if (q->io_modes & VB2_MMAP)
>  		*caps |= V4L2_BUF_CAP_SUPPORTS_MMAP;
>  	if (q->io_modes & VB2_USERPTR)
> @@ -767,7 +768,10 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create)
>  
>  	fill_buf_caps(q, &create->capabilities);
>  	validate_memory_flags(q, create->memory, &create->flags);
> +
> +	create->max_buffers = q->max_num_buffers;
>  	create->index = q->num_buffers;
> +
>  	if (create->count == 0)
>  		return ret != -EBUSY ? ret : 0;
>  
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 9b1de54ce379..da355355a869 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -483,9 +483,9 @@ static void v4l_print_create_buffers(const void *arg, bool write_only)
>  {
>  	const struct v4l2_create_buffers *p = arg;
>  
> -	pr_cont("index=%d, count=%d, memory=%s, capabilities=0x%08x, ",
> +	pr_cont("index=%d, count=%d, memory=%s, capabilities=0x%08x, max buffers=%u",
>  		p->index, p->count, prt_names(p->memory, v4l2_memory_names),
> -		p->capabilities);
> +		p->capabilities, p->max_buffers);
>  	v4l_print_format(&p->format, write_only);
>  }
>  
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index c3d4e490ce7c..ef1402537395 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -1035,6 +1035,7 @@ struct v4l2_requestbuffers {
>  #define V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS		(1 << 4)
>  #define V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF	(1 << 5)
>  #define V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS		(1 << 6)
> +#define V4L2_BUF_CAP_SUPPORTS_SET_MAX_BUFS		(1 << 7)
>  
>  /**
>   * struct v4l2_plane - plane info for multi-planar buffers
> @@ -2605,6 +2606,9 @@ struct v4l2_dbg_chip_info {
>   * @flags:	additional buffer management attributes (ignored unless the
>   *		queue has V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS capability
>   *		and configured for MMAP streaming I/O).
> + * @max_buffers: if V4L2_BUF_CAP_SUPPORTS_SET_MAX_BUFS capability flag is set
> + *		 this field indicate the maximum possible number of buffers
> + *		 for this queue.
>   * @reserved:	future extensions
>   */
>  struct v4l2_create_buffers {
> @@ -2614,7 +2618,8 @@ struct v4l2_create_buffers {
>  	struct v4l2_format	format;
>  	__u32			capabilities;
>  	__u32			flags;
> -	__u32			reserved[6];
> +	__u32			max_buffers;
> +	__u32			reserved[5];
>  };
>  
>  /*

