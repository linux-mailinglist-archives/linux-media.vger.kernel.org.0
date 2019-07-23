Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FBA1715EB
	for <lists+linux-media@lfdr.de>; Tue, 23 Jul 2019 12:21:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728583AbfGWKV1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jul 2019 06:21:27 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:43380 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727157AbfGWKV0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jul 2019 06:21:26 -0400
Received: by mail-ed1-f67.google.com with SMTP id e3so43329929edr.10
        for <linux-media@vger.kernel.org>; Tue, 23 Jul 2019 03:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VScPbgs1GOMCPHNg/uX3pMKi4F0eUzwKuwuUKc8G9y0=;
        b=IctsH2Eu/hKgx1vVLyyTLE+upbWc+qW9ut3kviFgA13BjV41RgHSwGORzVBKwqZX90
         MGvuuwPHkoquAXOawB8CIL9l7xSICdU1YBCXG12tz1OwElY0/DfFgcg3p6YEisy282U4
         ScrqkLrd3D1sZDn4DOJdcWBgzcMcz/zUfG+ZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VScPbgs1GOMCPHNg/uX3pMKi4F0eUzwKuwuUKc8G9y0=;
        b=CQbWZmtTdGd7jszw7h43U2uv6oNh9BGSjINa/VMDpI8QNCQKiieRdKoSUnHuCg5X21
         2HOmYHoODY9in9nxz/l2YnOVUbcD8kPlJFH6Tt1YMUjgFJENb6IngGtmP36GjABcDJcu
         DzBLGltmw8McR7M6PoOfjJI5fH8dWLlDY+oGreK1/Kz1A1hL3SYqZ50YbGioGiginpSY
         sIn3kqkf3F0noHj+a6DQZBlcZXFBKBOeoBaecFUWTP+aTMS5aIpzBR+cKejynOdOgVy2
         2kMi3NGZQ5DoKotiulVBcHKrCFsCEJ2Y18thBFWwAX7z2T38/qFQp+JKLnIeSibURtj1
         bbTQ==
X-Gm-Message-State: APjAAAUBNrHehaOPM5YXs1GIFn65GoetjlENSZq8JoXH8gpxWa2cK2xo
        xccKYOV3fNeCy5nvVOJSzQwKRHVBEeQ7aw==
X-Google-Smtp-Source: APXvYqzN5FzhKsW1TXdwTGCSVWhCCu0/yxWvbsi+sga7fzE5UA6lrdJ6yUFf1EwLYGfTOZFthuW8IA==
X-Received: by 2002:a17:906:2da9:: with SMTP id g9mr13584569eji.182.1563877283861;
        Tue, 23 Jul 2019 03:21:23 -0700 (PDT)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com. [209.85.221.45])
        by smtp.gmail.com with ESMTPSA id q50sm12156874edd.91.2019.07.23.03.21.20
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Jul 2019 03:21:21 -0700 (PDT)
Received: by mail-wr1-f45.google.com with SMTP id x4so42516477wrt.6
        for <linux-media@vger.kernel.org>; Tue, 23 Jul 2019 03:21:20 -0700 (PDT)
X-Received: by 2002:adf:e541:: with SMTP id z1mr74819105wrm.48.1563877280051;
 Tue, 23 Jul 2019 03:21:20 -0700 (PDT)
MIME-Version: 1.0
References: <jungo.lin@mediatek.com> <20190611035344.29814-1-jungo.lin@mediatek.com>
 <20190611035344.29814-7-jungo.lin@mediatek.com> <20190710095429.GA181405@chromium.org>
 <1563424741.1212.212.camel@mtksdccf07>
In-Reply-To: <1563424741.1212.212.camel@mtksdccf07>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 23 Jul 2019 19:21:06 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CXeQv74RtqDxYYLVEpsnFbsm0m-kUBDpY_AFmCBO0PyA@mail.gmail.com>
Message-ID: <CAAFQd5CXeQv74RtqDxYYLVEpsnFbsm0m-kUBDpY_AFmCBO0PyA@mail.gmail.com>
Subject: Re: [RFC,v3 6/9] media: platform: Add Mediatek ISP P1 V4L2 functions
To:     Jungo Lin <jungo.lin@mediatek.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        devicetree@vger.kernel.org,
        srv_heupstream <srv_heupstream@mediatek.com>,
        ddavenport@chromium.org, Rob Herring <robh@kernel.org>,
        =?UTF-8?B?U2VhbiBDaGVuZyAo6YSt5piH5byYKQ==?= 
        <sean.cheng@mediatek.com>, Sj Huang <sj.huang@mediatek.com>,
        =?UTF-8?B?RnJlZGVyaWMgQ2hlbiAo6Zmz5L+K5YWDKQ==?= 
        <frederic.chen@mediatek.com>,
        =?UTF-8?B?UnlhbiBZdSAo5L2Z5a2f5L+uKQ==?= <ryan.yu@mediatek.com>,
        =?UTF-8?B?UnlubiBXdSAo5ZCz6IKy5oGpKQ==?= <rynn.wu@mediatek.com>,
        =?UTF-8?B?RnJhbmtpZSBDaGl1ICjpgrHmloflh7Ep?= 
        <frankie.chiu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jungo,

On Thu, Jul 18, 2019 at 1:39 PM Jungo Lin <jungo.lin@mediatek.com> wrote:
>
> Hi, Tomasz:
>
> On Wed, 2019-07-10 at 18:54 +0900, Tomasz Figa wrote:
> > Hi Jungo,
> >
> > On Tue, Jun 11, 2019 at 11:53:41AM +0800, Jungo Lin wrote:
[snip]
> > > +static void mtk_cam_req_try_isp_queue(struct mtk_cam_dev *cam_dev,
> > > +                                 struct media_request *new_req)
> > > +{
> > > +   struct mtk_cam_dev_request *req, *req_safe, *cam_dev_req;
> > > +   struct device *dev = &cam_dev->pdev->dev;
> > > +
> > > +   dev_dbg(dev, "%s new req:%d", __func__, !new_req);
> > > +
> > > +   if (!cam_dev->streaming) {
> > > +           cam_dev_req = mtk_cam_req_to_dev_req(new_req);
> > > +           spin_lock(&cam_dev->req_lock);
> > > +           list_add_tail(&cam_dev_req->list, &cam_dev->req_list);
> > > +           spin_unlock(&cam_dev->req_lock);
> > > +           dev_dbg(dev, "%s: stream off, no ISP enqueue\n", __func__);
> > > +           return;
> > > +   }
> > > +
> > > +   /* Normal enqueue flow */
> > > +   if (new_req) {
> > > +           mtk_isp_req_enqueue(dev, new_req);
> > > +           return;
> > > +   }
> > > +
> > > +   /* Flush all media requests wehen first stream on */
> > > +   list_for_each_entry_safe(req, req_safe, &cam_dev->req_list, list) {
> > > +           list_del(&req->list);
> > > +           mtk_isp_req_enqueue(dev, &req->req);
> > > +   }
> > > +}
> >
> > This will have to be redone, as per the other suggestions, but generally one
> > would have a function that tries to queue as much as possible from a list to
> > the hardware and another function that adds a request to the list and calls
> > the first function.
> >
>
> We revised this function as below.
> First to check the en-queue conditions:
> a. stream on
> b. The composer buffers in SCP are 3, so we only could has 3 jobs
> at the same time.
>
>
> Second, try to en-queue the frames in the pending job if possible and
> move them into running job list if possible.
>
> The request has been inserted into pending job in mtk_cam_req_validate
> which is used to validate media_request.

Thanks for replying to each of the comments, that's very helpful.
Snipped out the parts that I agreed with.

Please note that req_validate is not supposed to change any driver
state. It's only supposed to validate the request. req_queue is the
right callback to insert the request into some internal driver
bookkeeping structures.

>
> void mtk_cam_dev_req_try_queue(struct mtk_cam_dev *cam_dev)
> {
>         struct mtk_cam_dev_request *req, *req_prev;
>         struct list_head enqueue_job_list;
>         int buffer_cnt = atomic_read(&cam_dev->running_job_count);
>         unsigned long flags;
>
>         if (!cam_dev->streaming ||
>             buffer_cnt >= MTK_ISP_MAX_RUNNING_JOBS) {

Do we have a guarantee that cam_dev->running_job_count doesn't
decrement between the atomic_read() above and this line?

>                 dev_dbg(cam_dev->dev, "stream off or buffers are full:%d\n",
>                         buffer_cnt);
>                 return;
>         }
>
>         INIT_LIST_HEAD(&enqueue_job_list);
>
>         spin_lock(&cam_dev->pending_job_lock);
>         list_for_each_entry_safe(req, req_prev,
>                                  &cam_dev->pending_job_list, list) {
>                 list_del(&req->list);
>                 list_add_tail(&req->list, &enqueue_job_list);

What's the reason to use the second list? Could we just take one job
from pending_job_list, enqueue it and then iterate again?

>                 if (atomic_inc_return(&cam_dev->running_job_count) >=
>                         MTK_ISP_MAX_RUNNING_JOBS)
>                         break;
>         }
>         spin_unlock(&cam_dev->pending_job_lock);
>
>         list_for_each_entry_safe(req, req_prev,
>                                  &enqueue_job_list, list) {
>                 list_del(&req->list);
>                 spin_lock_irqsave(&cam_dev->running_job_lock, flags);
>                 list_add_tail(&req->list, &cam_dev->running_job_list);
>                 spin_unlock_irqrestore(&cam_dev->running_job_lock, flags);
>

Do we have a guarantee that another thread doesn't run the same
function ending up calling mtk_isp_req_enqueue() with another request
before this one and thus making the order of running_job_list
incorrect?

>                 mtk_isp_req_enqueue(cam_dev, req);
>         }
> }
>
[snip]
> > > +   stride = DIV_ROUND_UP(stride * pixel_byte, 8);
> > > +
> > > +   if (pix_fmt == V4L2_PIX_FMT_MTISP_F10)
> > > +           stride = ALIGN(stride, 4);
> >
> > Is it expected that only the F10 format needs this alignment?
> >
>
> yes, if the pixel bits of image format is 10, the byte alignment of bpl
> should be 4. Otherwise, it is 8. We will revise this and add more
> comments.

That means that the B10 format also needs the extra alignment, as
opposed to what the original code did, right?

>
> /* 4 bytes alignment for 10 bit other are 8 bytes alignment */
>         if (pixel_bits == 10)
>                 bpl = ALIGN(bpl, 4);
>         else
>                 bpl = ALIGN(bpl, 8);

SGTM, thanks.

[snip]
> > > +
> > > +static struct v4l2_subdev *
> > > +mtk_cam_cio_get_active_sensor(struct mtk_cam_dev *cam_dev)
> > > +{
> > > +   struct media_device *mdev = cam_dev->seninf->entity.graph_obj.mdev;
> > > +   struct media_entity *entity;
> > > +   struct device *dev = &cam_dev->pdev->dev;
> > > +   struct v4l2_subdev *sensor;
> >
> > This variable would be unitialized if there is no streaming sensor. Was
> > there no compiler warning generated for this?
> >
>
> No, there is no compiler warning.
> But, we will assign sensor to NULL to avoid unnecessary compiler warning
> with different compiler options.
>

Thanks. It would be useful if you could check why the compiler you're
using doesn't show a warning here. We might be missing other
uninitialized variables.

[snip]
> > > +}
> > > +
> > > +static int mtk_cam_media_link_setup(struct media_entity *entity,
> > > +                               const struct media_pad *local,
> > > +                               const struct media_pad *remote, u32 flags)
> > > +{
> > > +   struct mtk_cam_dev *cam_dev =
> > > +           container_of(entity, struct mtk_cam_dev, subdev.entity);
> > > +   u32 pad = local->index;
> > > +
> > > +   dev_dbg(&cam_dev->pdev->dev, "%s: %d -> %d flags:0x%x\n",
> > > +           __func__, pad, remote->index, flags);
> > > +
> > > +   if (pad < MTK_CAM_P1_TOTAL_NODES)
> >
> > I assume this check is needed, because the pads with higher indexes are not
> > video nodes? If so, a comment would be helpful here.
> >
>
> Yes, we will new comment as below.
>
>         /*
>          * Check video nodes is enabled by link setup.
>          * The pad index of video node should be less than
>          * MTK_CAM_P1_TOTAL_NODES.
>          */
>         if (pad < MTK_CAM_P1_TOTAL_NODES)
>                 cam_dev->vdev_nodes[pad].enabled =
>                         !!(flags & MEDIA_LNK_FL_ENABLED);
>

Could we rephrase this a bit. The comment still doesn't explain why
the index should be less than the constant. Perhaps:

/*
 * The video nodes exposed by the driver have pads indexes
 * from 0 to MTK_CAM_P1_TOTAL_NODES - 1.
 */

[snip]

> > > +
> > > +   dev_dbg(dev, "%s: node:%d fd:%d idx:%d\n",
> > > +           __func__,
> > > +           node->id,
> > > +           buf->vbb.request_fd,
> > > +           buf->vbb.vb2_buf.index);
> > > +
> > > +   /* For request buffers en-queue, handled in mtk_cam_req_try_queue */
> > > +   if (vb->vb2_queue->uses_requests)
> > > +           return;
> >
> > I'd suggest removing non-request support from this driver. Even if we end up
> > with a need to provide compatibility for non-request mode, then it should be
> > built on top of the requests mode, so that the driver itself doesn't have to
> > deal with two modes.
> >
>
> The purpose of non-request function in this driver is needed by
> our camera middle-ware design. It needs 3A statistics buffers before
> image buffers en-queue. So we need to en-queue 3A statistics with
> non-request mode in this driver. After MW got the 3A statistics data, it
> will en-queue the images, tuning buffer and other meta buffers with
> request mode. Based on this requirement, do you have any suggestion?
> For upstream driver, should we only consider request mode?
>

Where does that requirement come from? Why the timing of queuing of
the buffers to the driver is important?

[snip]
> > > +static int mtk_cam_vb2_start_streaming(struct vb2_queue *vq,
> > > +                                  unsigned int count)
> > > +{
> > > +   struct mtk_cam_dev *cam_dev = vb2_get_drv_priv(vq);
> > > +   struct mtk_cam_video_device *node = mtk_cam_vbq_to_vdev(vq);
> > > +   struct device *dev = &cam_dev->pdev->dev;
> > > +   unsigned int node_count = cam_dev->subdev.entity.use_count;
> > > +   int ret;
> > > +
> > > +   if (!node->enabled) {
> >
> > How is this synchronized with mtk_cam_media_link_setup()?
> >
>
> We will follow your suggestion and below is our proposal for this
> function.
>
> 1. Use !cam_dev->pipeline.streaming_count to decide the first node to
> stream-on.
> 2.a If yes, do the following steps
>     2.a-1 Call media_pipeline_start function to prevent the link
> configuration changes.
>     2.a-2 Call mtk_cam_dev_init_stream function to calculate how many
> video nodes are enabled and save it into cam_dev->enabled_node_count.
>     2.a-3 Initialize ISP P1 HW in mtk_isp_hw_init function since end
> user has called stream-on API
> 2.b jump step 3.
>
> 3. Use cam_dev->streamed_node_count to track how many video nodes are
> streamed by user space.
> 4. Check all enabled video nodes are streamed or not based on
> cam_dev->streamed_node_count & cam_dev->enabled_node_count.
> 5. If yes, call s_stream on for P1 sub-device
>
> Do you think it is reasonable?
>

That should work indeed.

[snip]
> > > +
> > > +   mtk_cam_vb2_return_all_buffers(cam_dev, node, VB2_BUF_STATE_ERROR);
> >
> > Shouldn't we stop streaming first, so that the hardware operation is
> > cancelled and any buffers owned by the hardware are released?
> >
>
> For this function, below is the new code flow.
>
> 1. Check the first node to stream off based on
> cam_dev->streamed_node_count & cam_dev->enabled_node_count.
> 2. If yes, call all s_stream off for P1 sub-device
> 3. Call mtk_cam_vb2_return_all_buffers for each node
> 4. Check the last node to stream off
> 5. If yes, call media_pipeline_stop to allow user space
> to perform link configuration changes, such as disable link.
>
> But, for step 5, is it too late for end user to disable link?
> For example, for first node, it has called stream off but
> can't call disable link until the last node is stream off?
>

I think that should be okay. From the userspace point of view, having
one of the video nodes streaming implies that the related subdevice
could be streaming as well. The links between the video nodes and the
subdevices don't have the DYNAMIC flag, so the userspace should expect
that it can't change any links connecting to the subdevice when the
subdevice could be streaming.

[snip]
> > > +static void mtk_cam_vb2_buf_request_complete(struct vb2_buffer *vb)
> > > +{
> > > +   struct mtk_cam_dev *dev = vb2_get_drv_priv(vb->vb2_queue);
> > > +
> > > +   v4l2_ctrl_request_complete(vb->req_obj.req,
> > > +                              dev->v4l2_dev.ctrl_handler);
> >
> > This would end up being called multiple times, once for each video node.
> > Instead, this should be called explicitly by the driver when it completed
> > the request - perhaps in the frame completion handler?
> >
> > With that, we probably wouldn't even need this callback.
> >
>
> First, if we don't implement this callback function, we will receive
> kernel warning as below.
>
> https://elixir.bootlin.com/linux/latest/source/drivers/media/common/videobuf2/videobuf2-v4l2.c#L420
>
> Second, this function is only be called in __vb2_queue_cancel function.
> Moreover, we will remove cam_dev->v4l2_dev.ctrl_handler in next patch.
> So could we just implement dummy empty function?
>
>  * @buf_request_complete: a buffer that was never queued to the driver
> but is
>  *                      associated with a queued request was canceled.
>  *                      The driver will have to mark associated objects in the
>  *                      request as completed; required if requests are
>  *                      supported.
>

Good catch, thanks.

Sounds like we may indeed need to implement this callback. In
particular, we may need to remove the request that the buffer was
associated with from the driver queue and return the other buffers
associated to it with an error state. This should be similar to
handling a request failure.
[snip]
> > > +
> > > +   return 0;
> > > +}
> > > +
> > > +static int mtk_cam_vidioc_enum_fmt(struct file *file, void *fh,
> > > +                              struct v4l2_fmtdesc *f)
> > > +{
> > > +   struct mtk_cam_video_device *node = file_to_mtk_cam_node(file);
> > > +
> > > +   if (f->index >= node->desc.num_fmts)
> > > +           return -EINVAL;
> > > +
> > > +   f->pixelformat = node->desc.fmts[f->index].fmt.pix_mp.pixelformat;
> >
> > Is the set of formats available always the same regardless of the sensor
> > format?
> >
>
> Yes, ISP P1 HW output formats are always available without impact
> by sensor formats.
>
> > > +   f->flags = 0;
> >
> > We need f->description too.
> >
>
> For this description, do you suggest 1). we fill this field in this
> function or 2). v4l_fill_fmtdesc function in v4l2-ioctl?
>
> https://elixir.bootlin.com/linux/latest/source/drivers/media/v4l2-core/v4l2-ioctl.c#L1152
>
> Basically, we prefer method 1.
>

That should be v4l_fill_fmtdesc(), as it already includes other
vendor-specific formats.

[snip]
> > > +
> > > +   dev_dbg(&cam_dev->pdev->dev, "%s: fmt:%c%c%c%c, w*h:%u*%u\n",
> > > +           __func__,
> > > +           (in_fmt->fmt.pix_mp.pixelformat & 0xFF),
> > > +           (in_fmt->fmt.pix_mp.pixelformat >> 8) & 0xFF,
> > > +           (in_fmt->fmt.pix_mp.pixelformat >> 16) & 0xFF,
> > > +           (in_fmt->fmt.pix_mp.pixelformat >> 24) & 0xFF,
> > > +           in_fmt->fmt.pix_mp.width, in_fmt->fmt.pix_mp.height);
> > > +
> > > +   width = in_fmt->fmt.pix_mp.width;
> > > +   height = in_fmt->fmt.pix_mp.height;
> > > +
> > > +   dev_fmt = mtk_cam_dev_find_fmt(&node->desc,
> > > +                                  in_fmt->fmt.pix_mp.pixelformat);
> > > +   if (dev_fmt) {
> > > +           mtk_cam_dev_set_img_fmt(&cam_dev->pdev->dev,
> > > +                                   &in_fmt->fmt.pix_mp,
> > > +                                   &dev_fmt->fmt.pix_mp,
> > > +                                   node->id);
> > > +   } else {
> > > +           mtk_cam_dev_load_default_fmt(&cam_dev->pdev->dev,
> > > +                                        &node->desc, in_fmt);
> >
> > We shouldn't just load a default format. This function should validate all
> > the fields one by one and adjust them to something appropriate.
> >
>
> For ISP P1 HW, we only cares these fields of v4l2_pix_format_mplane.
> a. width
> b. height
> c. pixelformat
> d. plane_fmt
>     - sizeimage
>     - bytesperline
> e. num_planes
> Other fields are consider constant.
>
> So if the user space passes one pixel format with un-supported, we will
> apply the default format firstly and adjust width, height, sizeimage,
> and bytesperline. We will focus on validate width & height.
> Is it ok?

I'm not sure I understand your proposal, but let me describe the
proper behavior here:

if (pixelformat is invalid)
    pixelformat = some valid pixel format;

width = clamp(width, driver min, driver max);
height = clamp(height, driver min, driver max);

num_planes = 1;

calculate_sizeimage_and_bytesperline(fmt);

fill_in_the_remaining_constant_fields(fmt);

Does it make sense?

[snip]
> > > +static int mtk_cam_vidioc_s_fmt(struct file *file, void *fh,
> > > +                           struct v4l2_format *f)
> > > +{
> > > +   struct mtk_cam_dev *cam_dev = video_drvdata(file);
> > > +   struct mtk_cam_video_device *node = file_to_mtk_cam_node(file);
> > > +
> > > +   if (cam_dev->streaming)
> > > +           return -EBUSY;
> >
> > I think this should rather be something like vb2_queue_is_busy(), which
> > would prevent format changes if buffers are allocated.
> >
>
> Since vb2_queue_is_busy is static function, would we paste its
> implementation in this function to check like this?
>
>         if (node->vdev.queue->owner &&
>                 node->vdev.queue->owner != file->private_data) {
>                 dev_err(cam_dev->dev, "%s err: buffer allocated\n", __func__);
>                 return -EBUSY;
>         }
>

Sorry, I mixed up the function name. That should've been vb2_is_busy().

[snip]
> > > +   /* Total pad numbers is video devices + one seninf pad */
> > > +   unsigned int num_subdev_pads = MTK_CAM_CIO_PAD_SINK + 1;
> > > +   unsigned int i;
> > > +   int ret;
> > > +
> > > +   ret = mtk_cam_media_register(dev,
> > > +                                &cam_dev->media_dev);
> > > +   if (ret) {
> > > +           dev_err(dev, "failed to register media device:%d\n", ret);
> > > +           return ret;
> > > +   }
> > > +   dev_info(dev, "Register media device: %s, 0x%pK",
> > > +            MTK_CAM_DEV_P1_NAME, cam_dev->media_dev);
> >
> > An info message should be useful to the user in some way. Printing kernel
> > pointers isn't useful. Something like "registered media0" could be useful to
> > let the user know which media device is associated with this driver if there
> > is more than one in the system.
> >
>
> Here is the new log info.
>
> dev_info(dev, "media%d register",cam->media_dev.devnode->minor);
>

Let's fix the missing space and making a bit more readable:

dev_info(dev, "Registered media%d", cam->media_dev.devnode->minor);

>
> > > +
> > > +   /* Set up v4l2 device */
> > > +   cam_dev->v4l2_dev.mdev = &cam_dev->media_dev;
> > > +   ret = v4l2_device_register(dev, &cam_dev->v4l2_dev);
> > > +   if (ret) {
> > > +           dev_err(dev, "failed to register V4L2 device:%d\n", ret);
> > > +           goto fail_v4l2_dev;
> >
> > Please call the labels after the cleanup step that needs to be done. It
> > makes it easier to spot any ordering errors.
> >
>
> Will fix in next patch.
>
> > > +   }
> > > +   dev_info(dev, "Register v4l2 device: 0x%pK", cam_dev->v4l2_dev);
> >
> > Same as above.
> >
>
> Ditto.
>
> dev_info(dev, "Register v4l2 device: %s", cam->v4l2_dev.name);
>

Perhaps just "Registered %s" to be consistent with the above media log?

[snip]
> > > +
> > > +static int mtk_cam_dev_notifier_bound(struct v4l2_async_notifier *notifier,
> > > +                                 struct v4l2_subdev *sd,
> > > +                                 struct v4l2_async_subdev *asd)
> > > +{
> > > +   struct mtk_cam_dev *cam_dev =
> > > +           container_of(notifier, struct mtk_cam_dev, notifier);
> > > +
> >
> > Should we somehow check that the entity we got is seninf indeed and there
> > was no mistake in DT?
> >
>
> How about to check the entity function of seninf device?
>
> if (!(sd->entity.function & MEDIA_ENT_F_VID_IF_BRIDGE)) {
>         dev_dbg(cam->dev, "No MEDIA_ENT_F_VID_IF_BRIDGE function\n");
>                 return -ENODEV;
> }
>
> If we need to check DT, may we need to implement this in parse_endpoint
> callback function of v4l2_async_notifier_parse_fwnode_endpoints?
>

Yes, checking the entity function is indeed the right way to do this.

[snip]
> > > +           .default_fmt_idx = 4,
> > > +           .max_buf_count = 10,
> >
> > Where does this number come from?
> >
>
> The default maximum VB2 buffer count is 32.
> In order to limit memory usage, we like to limit the maximum buffer
> counts in the driver layer. The maximum buffer count is estimated
> according to our camera MW.
>
> #define VB2_MAX_FRAME   (32)
>

Okay, thanks.

[snip]
> > > +   struct media_pad vdev_pad;
> > > +   struct vb2_queue vbq;
> > > +   struct v4l2_ctrl_handler ctrl_handler;
> > > +   struct list_head pending_list;
> > > +   /* Used for vbq & vdev */
> >
> > It's already documented in the kerneldoc comment.
> >
>
> Fixed in next patch.
> Btw, if we remove this, we will got complain from checkpatch.pl script.
>

Oh really, that's weird. Okay, please keep it then, sorry for the confusion.

Best regards,
Tomasz
