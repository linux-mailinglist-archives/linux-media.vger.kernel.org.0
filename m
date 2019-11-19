Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7F54102375
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2019 12:42:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727753AbfKSLms (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Nov 2019 06:42:48 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:44375 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727432AbfKSLms (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Nov 2019 06:42:48 -0500
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1iX1uA-00012G-Nd; Tue, 19 Nov 2019 12:42:46 +0100
Message-ID: <54e84fe8a6d1fdd6faf11e3a5c4a7314b0151474.camel@pengutronix.de>
Subject: Re: [PATCH 2/5] input/rmi4/rmi_f54: fix various V4L2 compliance
 problems
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Nick Dyer <nick@shmanahar.org>,
        Christopher Heiny <cheiny@synaptics.com>,
        Vandana BN <bnvandana@gmail.com>
Date:   Tue, 19 Nov 2019 12:42:46 +0100
In-Reply-To: <20191119105118.54285-3-hverkuil-cisco@xs4all.nl>
References: <20191119105118.54285-1-hverkuil-cisco@xs4all.nl>
         <20191119105118.54285-3-hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::2a
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Di, 2019-11-19 at 11:51 +0100, Hans Verkuil wrote:
> The v4l2-compliance utility reported several V4L2 API compliance
> issues:
> 
> - the sequence counter wasn't filled in
> - the sequence counter wasn't reset to 0 at the start of streaming
> - the returned field value wasn't set to V4L2_FIELD_NONE
> - the timestamp wasn't set
> - the payload size was undefined if an error was returned
> - min_buffers_needed doesn't need to be initialized
> 
> Fix these issues.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Reviewed-by: Lucas Stach <l.stach@pengutronix.de

> ---
>  drivers/input/rmi4/rmi_f54.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/rmi4/rmi_f54.c
> b/drivers/input/rmi4/rmi_f54.c
> index 710b02595486..ebccab7a4834 100644
> --- a/drivers/input/rmi4/rmi_f54.c
> +++ b/drivers/input/rmi4/rmi_f54.c
> @@ -116,6 +116,7 @@ struct f54_data {
>  	struct video_device vdev;
>  	struct vb2_queue queue;
>  	struct mutex lock;
> +	u32 sequence;
>  	int input;
>  	enum rmi_f54_report_type inputs[F54_MAX_REPORT_TYPE];
>  };
> @@ -290,6 +291,7 @@ static int rmi_f54_queue_setup(struct vb2_queue
> *q, unsigned int *nbuffers,
>  
>  static void rmi_f54_buffer_queue(struct vb2_buffer *vb)
>  {
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
>  	struct f54_data *f54 = vb2_get_drv_priv(vb->vb2_queue);
>  	u16 *ptr;
>  	enum vb2_buffer_state state;
> @@ -298,6 +300,7 @@ static void rmi_f54_buffer_queue(struct
> vb2_buffer *vb)
>  
>  	mutex_lock(&f54->status_mutex);
>  
> +	vb2_set_plane_payload(vb, 0, 0);
>  	reptype = rmi_f54_get_reptype(f54, f54->input);
>  	if (reptype == F54_REPORT_NONE) {
>  		state = VB2_BUF_STATE_ERROR;
> @@ -344,14 +347,25 @@ static void rmi_f54_buffer_queue(struct
> vb2_buffer *vb)
>  data_done:
>  	mutex_unlock(&f54->data_mutex);
>  done:
> +	vb->timestamp = ktime_get_ns();
> +	vbuf->field = V4L2_FIELD_NONE;
> +	vbuf->sequence = f54->sequence++;
>  	vb2_buffer_done(vb, state);
>  	mutex_unlock(&f54->status_mutex);
>  }
>  
> +static void rmi_f54_stop_streaming(struct vb2_queue *q)
> +{
> +	struct f54_data *f54 = vb2_get_drv_priv(q);
> +
> +	f54->sequence = 0;
> +}
> +
>  /* V4L2 structures */
>  static const struct vb2_ops rmi_f54_queue_ops = {
>  	.queue_setup            = rmi_f54_queue_setup,
>  	.buf_queue              = rmi_f54_buffer_queue,
> +	.stop_streaming		= rmi_f54_stop_streaming,
>  	.wait_prepare           = vb2_ops_wait_prepare,
>  	.wait_finish            = vb2_ops_wait_finish,
>  };
> @@ -363,7 +377,6 @@ static const struct vb2_queue rmi_f54_queue = {
>  	.ops = &rmi_f54_queue_ops,
>  	.mem_ops = &vb2_vmalloc_memops,
>  	.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC,
> -	.min_buffers_needed = 1,
>  };
>  
>  static int rmi_f54_vidioc_querycap(struct file *file, void *priv,

