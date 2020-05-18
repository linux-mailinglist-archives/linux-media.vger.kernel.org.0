Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55F3E1D7C5A
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2020 17:07:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728008AbgERPHa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 May 2020 11:07:30 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:34345 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727035AbgERPH3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 May 2020 11:07:29 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id ahMOjvIA48hmdahMSjhH9n; Mon, 18 May 2020 17:07:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1589814444; bh=m1T3F3yUeJyDZQzu7Afi2ub265M/SZYZnpO6Wr7Qnb4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=LdZG6I0B2qc8dC2XRNiP7IHxGNPiRBHE2x4KZloTbIy6KC45GZC0d+j4Fx54EYQL7
         YjWQd9rEE0AvLeZ8Fxm3/ssWYDFEpr/Q7hxeFQCrgOE4pTtF8ONagXUH+BQVOZxzRE
         ENAHmndGP9EqM+/ackSD4gwkWIj/2Q6oDyCRaQs6M/zAEu1iaN6PWQs0AGoyGz6R8D
         7FBmHWVarKu8P/7/GizUHvkpDwK481kYqlT3QmQQEtmB5wlYOX4/k8rEA7xXlQCg+G
         L/yXT/+55kIJaJsxN8VAiIqQrhcG2POVy+p7V9GhQoDNYGkFDYh70ReaO/2IyW8SA8
         5N67W9B2IcNgg==
Subject: Re: [PATCH v2 33/34] staging: bcm2835-isp: Add support for BC2835 ISP
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Naushir Patuck <naush@raspberrypi.com>
References: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
 <20200504092611.9798-34-laurent.pinchart@ideasonboard.com>
 <3de6ce28-1089-19c2-cdac-64796a46638f@xs4all.nl>
 <CAPY8ntBDss5ZKPo3mRUP0-9KNHA6kQEQwrnvyUpOh0Ru7O5CKA@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <bdcb471b-e066-373f-aa16-b7caf5c52795@xs4all.nl>
Date:   Mon, 18 May 2020 17:07:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAPY8ntBDss5ZKPo3mRUP0-9KNHA6kQEQwrnvyUpOh0Ru7O5CKA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfFGxCW6WDiGIzhk4QyuYeA6BVUSk3r+EyHYQaBI/ngJpP7brJZRmOQCfBLBa/QJkCG4Nnx031LfQ2G46vbz3qik+XyddvbCsOZTj6Pi2ijRbnJ5yTtXd
 mRoJGSFbUR/waBHoJxDmrMGMLmgbAD4tEHxoIXHYGCeH0v145RT5Zy4MaNym+q+T0cgaJFB6ExHNSzOMjixQnuShMfdGerEw1tkAQRm0CWYS+p49DS7upu5l
 5/1f2KIhjlRAbpWAUpGK3DG7rKWUMLBIcRCNvXmyIMQ8KhpKwMnR6ZqeaoD+lIQ4tkvA8WzPqOZLz5GX//eKK1eYIQ+B8zmaUD8FE1e/gLYb9dEhyi66eqSi
 RZmV10QkvrIXvKoXO2GnF2oasfYd41lxVO51VoXY+4yvkAz0oVS59ZX9n9pheh1BFiP2A5/O
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18/05/2020 16:36, Dave Stevenson wrote:
> Hi Hans.
> 
> Thanks for the review.
> A few of these I need to leave for Naush to answer.
> Ideas On Board have been contracted to drive this upstreaming process,
> so many of these will be left to them to address and generate a v2.

<snip>

>>> +static int bcm2835_isp_node_s_selection(struct file *file, void *fh,
>>> +                                     struct v4l2_selection *s)
>>> +{
>>> +     struct mmal_parameter_crop crop;
>>> +     struct bcm2835_isp_node *node = video_drvdata(file);
>>> +     struct bcm2835_isp_dev *dev = node_get_dev(node);
>>> +     struct vchiq_mmal_port *port = get_port_data(node);
>>> +
>>> +     /* This return value is required fro V4L2 compliance. */
>>> +     if (node_is_stats(node))
>>> +             return -ENOTTY;
>>> +
>>> +     if (!s->r.width || !s->r.height)
>>> +             return -EINVAL;
>>
>> I'm missing a check for s->target.
> 
> Ack
> 
>>> +
>>> +     /* Adjust the crop window if goes outside the frame dimensions. */
>>> +     s->r.left = min((unsigned int)max(s->r.left, 0),
>>> +                     node->q_data.width - MIN_DIM);
>>> +     s->r.top = min((unsigned int)max(s->r.top, 0),
>>> +                    node->q_data.height - MIN_DIM);
>>> +     s->r.width = max(min(s->r.width, node->q_data.width - s->r.left),
>>> +                      MIN_DIM);
>>> +     s->r.height = max(min(s->r.height, node->q_data.height - s->r.top),
>>> +                       MIN_DIM);
>>> +
>>> +     crop.rect.x = s->r.left;
>>> +     crop.rect.y = s->r.top;
>>> +     crop.rect.width = s->r.width;
>>> +     crop.rect.height = s->r.height;
>>> +
>>> +     return vchiq_mmal_port_parameter_set(dev->mmal_instance, port,
>>> +                                          MMAL_PARAMETER_CROP,
>>> +                                          &crop, sizeof(crop));
>>> +}
>>> +
>>> +static int bcm2835_isp_node_g_selection(struct file *file, void *fh,
>>> +                                     struct v4l2_selection *s)
>>> +{
>>> +     struct bcm2835_isp_node *node = video_drvdata(file);
>>> +     struct bcm2835_isp_dev *dev = node_get_dev(node);
>>> +     struct vchiq_mmal_port *port = get_port_data(node);
>>> +     struct mmal_parameter_crop crop;
>>> +     u32 crop_size = sizeof(crop);
>>> +     int ret;
>>> +
>>> +     /* This return value is required for V4L2 compliance. */
>>> +     if (node_is_stats(node))
>>> +             return -ENOTTY;
>>> +
>>> +     /* We can only return out an input crop. */
>>> +     if (s->target != V4L2_SEL_TGT_CROP)
>>> +             return -EINVAL;
>>
>> No support for _TGT_CROP_DEFAULT/BOUNDS? Those are usually supported
>> by drivers and are typically set to the width/height of the current
>> format.
>>
>> I recommend adding support for these targets.
> 
> Trying to find any good M2M drivers to use as an example was tricky,
> but if the return value can be as simple as the current width/height,
> then that's easy.
> 
>>> +
>>> +     ret = vchiq_mmal_port_parameter_get(dev->mmal_instance, port,
>>> +                                         MMAL_PARAMETER_CROP,
>>> +                                         &crop, &crop_size);
>>> +     if (!ret)
>>> +             return -EINVAL;
>>> +
>>> +     s->r.left = crop.rect.x;
>>> +     s->r.top = crop.rect.y;
>>> +     s->r.width = crop.rect.width;
>>> +     s->r.height = crop.rect.height;
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static int bcm3285_isp_subscribe_event(struct v4l2_fh *fh,
>>> +                                    const struct v4l2_event_subscription *s)
>>> +{
>>> +     switch (s->type) {
>>> +     /* Cannot change source parameters dynamically at runtime. */
>>> +     case V4L2_EVENT_SOURCE_CHANGE:
>>> +             return -EINVAL;
>>> +     case V4L2_EVENT_CTRL:
>>> +             return v4l2_ctrl_subscribe_event(fh, s);
>>> +     default:
>>> +             return v4l2_event_subscribe(fh, s, 4, NULL);
>>> +     }
>>> +}
>>> +
>>> +static const struct v4l2_ioctl_ops bcm2835_isp_node_ioctl_ops = {
>>> +     .vidioc_querycap                = bcm2835_isp_node_querycap,
>>> +     .vidioc_g_fmt_vid_cap           = bcm2835_isp_node_g_fmt,
>>> +     .vidioc_g_fmt_vid_out           = bcm2835_isp_node_g_fmt,
>>> +     .vidioc_g_fmt_meta_cap          = bcm2835_isp_node_g_fmt,
>>> +     .vidioc_s_fmt_vid_cap           = bcm2835_isp_node_s_fmt,
>>> +     .vidioc_s_fmt_vid_out           = bcm2835_isp_node_s_fmt,
>>> +     .vidioc_s_fmt_meta_cap          = bcm2835_isp_node_s_fmt,
>>> +     .vidioc_try_fmt_vid_cap         = bcm2835_isp_node_try_fmt,
>>> +     .vidioc_try_fmt_vid_out         = bcm2835_isp_node_try_fmt,
>>> +     .vidioc_try_fmt_meta_cap        = bcm2835_isp_node_try_fmt,
>>> +     .vidioc_s_selection             = bcm2835_isp_node_s_selection,
>>> +     .vidioc_g_selection             = bcm2835_isp_node_g_selection,
>>> +
>>> +     .vidioc_enum_fmt_vid_cap        = bcm2835_isp_node_enum_fmt,
>>> +     .vidioc_enum_fmt_vid_out        = bcm2835_isp_node_enum_fmt,
>>> +     .vidioc_enum_fmt_meta_cap       = bcm2835_isp_node_enum_fmt,
>>> +     .vidioc_enum_framesizes         = bcm2835_isp_enum_framesizes,
>>> +
>>> +     .vidioc_reqbufs                 = vb2_ioctl_reqbufs,
>>> +     .vidioc_querybuf                = vb2_ioctl_querybuf,
>>> +     .vidioc_qbuf                    = vb2_ioctl_qbuf,
>>> +     .vidioc_dqbuf                   = vb2_ioctl_dqbuf,
>>> +     .vidioc_expbuf                  = vb2_ioctl_expbuf,
>>> +     .vidioc_create_bufs             = vb2_ioctl_create_bufs,
>>> +     .vidioc_prepare_buf             = vb2_ioctl_prepare_buf,
>>> +
>>> +     .vidioc_streamon                = vb2_ioctl_streamon,
>>> +     .vidioc_streamoff               = vb2_ioctl_streamoff,
>>> +
>>> +     .vidioc_subscribe_event         = bcm3285_isp_subscribe_event,
>>> +     .vidioc_unsubscribe_event       = v4l2_event_unsubscribe,
>>> +};
>>> +
>>> +/*
>>> + * Size of the array to provide to the VPU when asking for the list of supported
>>> + * formats.
>>> + *
>>> + * The ISP component currently advertises 33 input formats, so add a small
>>> + * overhead on that.
>>> + */
>>> +#define MAX_SUPPORTED_ENCODINGS 40
>>> +
>>> +/* Populate node->supported_fmts with the formats supported by those ports. */
>>> +static int bcm2835_isp_get_supported_fmts(struct bcm2835_isp_node *node)
>>> +{
>>> +     struct bcm2835_isp_dev *dev = node_get_dev(node);
>>> +     struct bcm2835_isp_fmt const **list;
>>> +     unsigned int i, j, num_encodings;
>>> +     u32 fourccs[MAX_SUPPORTED_ENCODINGS];
>>> +     u32 param_size = sizeof(fourccs);
>>> +     int ret;
>>> +
>>> +     ret = vchiq_mmal_port_parameter_get(dev->mmal_instance,
>>> +                                         get_port_data(node),
>>> +                                         MMAL_PARAMETER_SUPPORTED_ENCODINGS,
>>> +                                         &fourccs, &param_size);
>>> +
>>> +     if (ret) {
>>> +             if (ret == MMAL_MSG_STATUS_ENOSPC) {
>>> +                     v4l2_err(&dev->v4l2_dev,
>>> +                              "%s: port has more encoding than we provided space for. Some are dropped.\n",
>>> +                              __func__);
>>> +                     num_encodings = MAX_SUPPORTED_ENCODINGS;
>>> +             } else {
>>> +                     v4l2_err(&dev->v4l2_dev, "%s: get_param ret %u.\n",
>>> +                              __func__, ret);
>>> +                     return -EINVAL;
>>> +             }
>>> +     } else {
>>> +             num_encodings = param_size / sizeof(u32);
>>> +     }
>>> +
>>> +     /*
>>> +      * Assume at this stage that all encodings will be supported in V4L2.
>>> +      * Any that aren't supported will waste a very small amount of memory.
>>> +      */
>>> +     list = devm_kzalloc(dev->dev,
>>> +                         sizeof(struct bcm2835_isp_fmt *) * num_encodings,
>>> +                         GFP_KERNEL);
>>> +     if (!list)
>>> +             return -ENOMEM;
>>> +     node->supported_fmts.list = list;
>>> +
>>> +     for (i = 0, j = 0; i < num_encodings; i++) {
>>> +             const struct bcm2835_isp_fmt *fmt = get_fmt(fourccs[i]);
>>> +
>>> +             if (fmt) {
>>> +                     list[j] = fmt;
>>> +                     j++;
>>> +             }
>>> +     }
>>> +     node->supported_fmts.num_entries = j;
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +/*
>>> + * Register a device node /dev/video<N> to go along with one of the ISP's input
>>> + * or output nodes.
>>> + */
>>> +static int register_node(struct bcm2835_isp_dev *dev,
>>> +                      struct bcm2835_isp_node *node,
>>> +                      int index)
>>> +{
>>> +     struct video_device *vfd;
>>> +     struct vb2_queue *queue;
>>> +     int ret;
>>> +
>>> +     mutex_init(&node->lock);
>>> +
>>> +     node->dev = dev;
>>> +     vfd = &node->vfd;
>>> +     queue = &node->queue;
>>> +     queue->type = index_to_queue_type(index);
>>> +     /*
>>> +      * Setup the node type-specific params.
>>> +      *
>>> +      * Only the OUTPUT node can set controls and crop windows. However,
>>> +      * we must allow the s/g_selection ioctl on the stats node as v4l2
>>> +      * compliance expects it to return a -ENOTTY, and the framework
>>> +      * does not handle it if the ioctl is disabled.
>>> +      */
>>> +     switch (queue->type) {
>>> +     case V4L2_BUF_TYPE_VIDEO_OUTPUT:
>>> +             vfd->device_caps = V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_STREAMING;
>>> +             node->id = index;
>>> +             node->vfl_dir = VFL_DIR_TX;
>>> +             node->name = "output";
>>> +             break;
>>> +     case V4L2_BUF_TYPE_VIDEO_CAPTURE:
>>> +             vfd->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
>>> +             /* First Capture node starts at id 0, etc. */
>>> +             node->id = index - BCM2835_ISP_NUM_OUTPUTS;
>>> +             node->vfl_dir = VFL_DIR_RX;
>>> +             node->name = "capture";
>>> +             v4l2_disable_ioctl(&node->vfd, VIDIOC_S_CTRL);
>>> +             v4l2_disable_ioctl(&node->vfd, VIDIOC_S_SELECTION);
>>> +             v4l2_disable_ioctl(&node->vfd, VIDIOC_G_SELECTION);
>>> +             break;
>>> +     case V4L2_BUF_TYPE_META_CAPTURE:
>>> +             vfd->device_caps = V4L2_CAP_META_CAPTURE | V4L2_CAP_STREAMING;
>>> +             node->id = index - BCM2835_ISP_NUM_OUTPUTS;
>>> +             node->vfl_dir = VFL_DIR_RX;
>>> +             node->name = "stats";
>>> +             v4l2_disable_ioctl(&node->vfd, VIDIOC_S_CTRL);
>>
>> Why not disable S/G_SELECTION for meta capture here rather than test for it
>> in the op functions?
> 
> I'd have to ask Naush. There were some very odd interactions with
> v4l2-compliance that he was struggling with.
> 
>>> +             break;
>>> +     }
>>> +
>>> +     /* We use the selection API instead of the old crop API. */
>>> +     v4l2_disable_ioctl(vfd, VIDIOC_CROPCAP);
>>> +     v4l2_disable_ioctl(vfd, VIDIOC_G_CROP);
>>> +     v4l2_disable_ioctl(vfd, VIDIOC_S_CROP);
>>
>> No need for this: the core handles this and will disable these ioctls
>> automatically.
> 
> The core will ENABLE these if g_selection and s_selection are defined,
> and uses mapping functions to try and convert between the two APIs.
> This may be down to missing the target check in s_selection, but again
> I seem to recall v4l2-compliance was reporting failures on these
> ioctls.

I suspect that the missing target check in g/s_selection is the cause of
the v4l2-compliance failures.

If there are still compliance issues after adding that check, then just
reach out to me for help.

Regards,

	Hans
