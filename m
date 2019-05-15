Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2250F1F90C
	for <lists+linux-media@lfdr.de>; Wed, 15 May 2019 19:01:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727074AbfEORBi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 May 2019 13:01:38 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:33044 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726690AbfEORBi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 May 2019 13:01:38 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C715927DBE0;
        Wed, 15 May 2019 18:01:35 +0100 (BST)
Date:   Wed, 15 May 2019 19:01:33 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Thierry Reding <thierry.reding@gmail.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [RFCv2 PATCH] vb2: add V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF
Message-ID: <20190515190133.4a8e5a64@collabora.com>
In-Reply-To: <32ed2e39-36de-eca5-c52e-1385bcee7ffb@xs4all.nl>
References: <32ed2e39-36de-eca5-c52e-1385bcee7ffb@xs4all.nl>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 15 May 2019 14:32:20 +0200
Hans Verkuil <hverkuil@xs4all.nl> wrote:

> This RFC patch adds support for the V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF flag.
> It also adds a new V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF capability and
> a v4l2_m2m_release_capture_buf() helper function.
> 
> Drivers should set vb2_queue->subsystem_flags to VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF
> to indicate support for this flag.
> 
> The device_run() function should look like this:
> 
> if (v4l2_m2m_release_capture_buf(out_vb, cap_vb)) {
> 	v4l2_m2m_buf_done(cap_vb, VB2_BUF_STATE_DONE);
> 	v4l2_m2m_job_finish(...);
> 	return;
> }
> cap_vb->is_held = out_vb->flags & V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF;
> 
> ...
> 
> v4l2_m2m_buf_done(out_vb, VB2_BUF_STATE_DONE);
> if (!cap_vb->is_held) {
> 	v4l2_m2m_buf_done(cap_vb, VB2_BUF_STATE_DONE);
> 	v4l2_m2m_job_finish(...);
> }
> 
> In order to handle the corner case where V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF
> is always set for the output buffer, and you reached the last frame (so no
> new output buffer will be queued with a new timestamp), the driver should
> implement support for the V4L2_DEC_CMD_STOP command, and that should do:
> 
> struct vb2_v4l2_buffer *out_vb = v4l2_m2m_last_src_buf(m2m_ctx);
> struct vb2_v4l2_buffer *cap_vb = v4l2_m2m_last_dst_buf(m2m_ctx);
> 
> if (out_vb) {
> 	out_vb->flags &= ~V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF;
> } else if (cap_vb && cap_vb->is_held) {
> 	v4l2_m2m_buf_done(cap_vb, VB2_BUF_STATE_DONE);
> 	v4l2_m2m_job_finish(...);
> }
> 
> At least, I think so. Comments on this are very welcome. We definitely
> need better support in v4l2-mem2mem.c for such situations (same for
> stateful codecs) since it's too complex for drivers to get right IMHO.
> 
> Regards,
> 
> 	Hans
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

FWIW,

Tested-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

Note that I haven't tested passing V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF
all the time (my implem clears the flag on the last slice of each
frame) which means the solution proposed for the V4L2_DEC_CMD_STOP path
is still untested.

> ---
>  .../media/common/videobuf2/videobuf2-v4l2.c   |  8 +++-
>  include/media/v4l2-mem2mem.h                  | 40 +++++++++++++++++++
>  include/media/videobuf2-core.h                |  3 ++
>  include/media/videobuf2-v4l2.h                |  5 +++
>  include/uapi/linux/videodev2.h                | 13 +++---
>  5 files changed, 63 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index fb9ac7696fc6..c077d3776840 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -50,7 +50,8 @@ module_param(debug, int, 0644);
>  				 V4L2_BUF_FLAG_TIMESTAMP_MASK)
>  /* Output buffer flags that should be passed on to the driver */
>  #define V4L2_BUFFER_OUT_FLAGS	(V4L2_BUF_FLAG_PFRAME | V4L2_BUF_FLAG_BFRAME | \
> -				 V4L2_BUF_FLAG_KEYFRAME | V4L2_BUF_FLAG_TIMECODE)
> +				 V4L2_BUF_FLAG_KEYFRAME | V4L2_BUF_FLAG_TIMECODE | \
> +				 V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF)
> 
>  /*
>   * __verify_planes_array() - verify that the planes array passed in struct
> @@ -194,6 +195,7 @@ static int vb2_fill_vb2_v4l2_buffer(struct vb2_buffer *vb, struct v4l2_buffer *b
>  	}
>  	vbuf->sequence = 0;
>  	vbuf->request_fd = -1;
> +	vbuf->is_held = false;
> 
>  	if (V4L2_TYPE_IS_MULTIPLANAR(b->type)) {
>  		switch (b->memory) {
> @@ -321,6 +323,8 @@ static int vb2_fill_vb2_v4l2_buffer(struct vb2_buffer *vb, struct v4l2_buffer *b
>  		 */
>  		vbuf->flags &= ~V4L2_BUF_FLAG_TIMECODE;
>  		vbuf->field = b->field;
> +		if (!(q->subsystem_flags & VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF))
> +			vbuf->flags &= ~V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF;
>  	} else {
>  		/* Zero any output buffer flags as this is a capture buffer */
>  		vbuf->flags &= ~V4L2_BUFFER_OUT_FLAGS;
> @@ -659,6 +663,8 @@ static void fill_buf_caps(struct vb2_queue *q, u32 *caps)
>  		*caps |= V4L2_BUF_CAP_SUPPORTS_USERPTR;
>  	if (q->io_modes & VB2_DMABUF)
>  		*caps |= V4L2_BUF_CAP_SUPPORTS_DMABUF;
> +	if (q->subsystem_flags & VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF)
> +		*caps |= V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF;
>  #ifdef CONFIG_MEDIA_CONTROLLER_REQUEST_API
>  	if (q->supports_requests)
>  		*caps |= V4L2_BUF_CAP_SUPPORTS_REQUESTS;
> diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
> index bb3e63d6bd1a..8263cf108397 100644
> --- a/include/media/v4l2-mem2mem.h
> +++ b/include/media/v4l2-mem2mem.h
> @@ -648,6 +648,46 @@ void v4l2_m2m_buf_copy_metadata(const struct vb2_v4l2_buffer *out_vb,
>  				struct vb2_v4l2_buffer *cap_vb,
>  				bool copy_frame_flags);
> 
> +/**
> + * v4l2_m2m_release_capture_buf() - check if the capture buffer should be
> + * released
> + *
> + * @out_vb: the output buffer
> + * @cap_vb: the capture buffer
> + *
> + * This helper function returns true if the current capture buffer should
> + * be released to vb2. This is the case if the output buffer specified that
> + * the capture buffer should be held (i.e. not returned to vb2) AND if the
> + * timestamp of the capture buffer differs from the output buffer timestamp.
> + *
> + * This helper is to be called at the start of the device_run callback:
> + *
> + * if (v4l2_m2m_release_capture_buf(out_vb, cap_vb)) {
> + *	v4l2_m2m_buf_done(cap_vb, VB2_BUF_STATE_DONE);
> + *	v4l2_m2m_job_finish(...);
> + *	return;
> + * }
> + * cap_vb->is_held = out_vb->flags & V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF;
> + *
> + * ...
> + *
> + * v4l2_m2m_buf_done(out_vb, VB2_BUF_STATE_DONE);
> + * if (!cap_vb->is_held) {
> + *	v4l2_m2m_buf_done(cap_vb, VB2_BUF_STATE_DONE);
> + *	v4l2_m2m_job_finish(...);
> + * }
> + *
> + * This allows for multiple output buffers to be used to fill in a single
> + * capture buffer. This is typically used by stateless decoders where
> + * multiple e.g. H.264 slices contribute to a single decoded frame.
> + */
> +static inline bool v4l2_m2m_release_capture_buf(const struct vb2_v4l2_buffer *out_vb,
> +						const struct vb2_v4l2_buffer *cap_vb)
> +{
> +	return cap_vb->is_held && cap_vb->vb2_buf.copied_timestamp &&
> +	       out_vb->vb2_buf.timestamp != cap_vb->vb2_buf.timestamp;
> +}
> +
>  /* v4l2 request helper */
> 
>  void v4l2_m2m_request_queue(struct media_request *req);
> diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
> index 22f3ff76a8b5..e9d99023c637 100644
> --- a/include/media/videobuf2-core.h
> +++ b/include/media/videobuf2-core.h
> @@ -504,6 +504,8 @@ struct vb2_buf_ops {
>   * @buf_ops:	callbacks to deliver buffer information.
>   *		between user-space and kernel-space.
>   * @drv_priv:	driver private data.
> + * @subsystem_flags: Flags specific to the subsystem (V4L2/DVB/etc.). Not used
> + *		by the vb2 core.
>   * @buf_struct_size: size of the driver-specific buffer structure;
>   *		"0" indicates the driver doesn't want to use a custom buffer
>   *		structure type. for example, ``sizeof(struct vb2_v4l2_buffer)``
> @@ -570,6 +572,7 @@ struct vb2_queue {
>  	const struct vb2_buf_ops	*buf_ops;
> 
>  	void				*drv_priv;
> +	u32				subsystem_flags;
>  	unsigned int			buf_struct_size;
>  	u32				timestamp_flags;
>  	gfp_t				gfp_flags;
> diff --git a/include/media/videobuf2-v4l2.h b/include/media/videobuf2-v4l2.h
> index 8a10889dc2fd..13ab101864aa 100644
> --- a/include/media/videobuf2-v4l2.h
> +++ b/include/media/videobuf2-v4l2.h
> @@ -33,6 +33,7 @@
>   * @timecode:	frame timecode.
>   * @sequence:	sequence count of this frame.
>   * @request_fd:	the request_fd associated with this buffer
> + * @is_held:	if true, then this buffer was held
>   * @planes:	plane information (userptr/fd, length, bytesused, data_offset).
>   *
>   * Should contain enough information to be able to cover all the fields
> @@ -46,9 +47,13 @@ struct vb2_v4l2_buffer {
>  	struct v4l2_timecode	timecode;
>  	__u32			sequence;
>  	__s32			request_fd;
> +	bool			is_held;
>  	struct vb2_plane	planes[VB2_MAX_PLANES];
>  };
> 
> +/* VB2 V4L2 flags as set in vb2_queue.subsystem_flags */
> +#define VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF (1 << 0)
> +
>  /*
>   * to_vb2_v4l2_buffer() - cast struct vb2_buffer * to struct vb2_v4l2_buffer *
>   */
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 1050a75fb7ef..26925d63ea05 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -907,11 +907,12 @@ struct v4l2_requestbuffers {
>  };
> 
>  /* capabilities for struct v4l2_requestbuffers and v4l2_create_buffers */
> -#define V4L2_BUF_CAP_SUPPORTS_MMAP	(1 << 0)
> -#define V4L2_BUF_CAP_SUPPORTS_USERPTR	(1 << 1)
> -#define V4L2_BUF_CAP_SUPPORTS_DMABUF	(1 << 2)
> -#define V4L2_BUF_CAP_SUPPORTS_REQUESTS	(1 << 3)
> -#define V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS (1 << 4)
> +#define V4L2_BUF_CAP_SUPPORTS_MMAP			(1 << 0)
> +#define V4L2_BUF_CAP_SUPPORTS_USERPTR			(1 << 1)
> +#define V4L2_BUF_CAP_SUPPORTS_DMABUF			(1 << 2)
> +#define V4L2_BUF_CAP_SUPPORTS_REQUESTS			(1 << 3)
> +#define V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS		(1 << 4)
> +#define V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF	(1 << 5)
> 
>  /**
>   * struct v4l2_plane - plane info for multi-planar buffers
> @@ -1033,6 +1034,8 @@ static inline __u64 v4l2_timeval_to_ns(const struct timeval *tv)
>  #define V4L2_BUF_FLAG_IN_REQUEST		0x00000080
>  /* timecode field is valid */
>  #define V4L2_BUF_FLAG_TIMECODE			0x00000100
> +/* Don't return the capture buffer until OUTPUT timestamp changes */
> +#define V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF	0x00000200
>  /* Buffer is prepared for queuing */
>  #define V4L2_BUF_FLAG_PREPARED			0x00000400
>  /* Cache handling flags */

