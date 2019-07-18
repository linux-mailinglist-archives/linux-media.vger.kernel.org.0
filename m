Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7EAE6C87A
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2019 06:39:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726500AbfGREjc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Jul 2019 00:39:32 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:11983 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725959AbfGREjb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Jul 2019 00:39:31 -0400
X-UUID: 5755acd0cc0445249befbeb83af7d069-20190718
X-UUID: 5755acd0cc0445249befbeb83af7d069-20190718
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
        (envelope-from <jungo.lin@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 1088925997; Thu, 18 Jul 2019 12:39:02 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 18 Jul 2019 12:39:01 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 18 Jul 2019 12:39:01 +0800
Message-ID: <1563424741.1212.212.camel@mtksdccf07>
Subject: Re: [RFC,v3 6/9] media: platform: Add Mediatek ISP P1 V4L2 functions
From:   Jungo Lin <jungo.lin@mediatek.com>
To:     Tomasz Figa <tfiga@chromium.org>
CC:     <hverkuil@xs4all.nl>, <laurent.pinchart@ideasonboard.com>,
        <matthias.bgg@gmail.com>, <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
        <ddavenport@chromium.org>, <robh@kernel.org>,
        <sean.cheng@mediatek.com>, <sj.huang@mediatek.com>,
        <frederic.chen@mediatek.com>, <ryan.yu@mediatek.com>,
        <rynn.wu@mediatek.com>, <frankie.chiu@mediatek.com>
Date:   Thu, 18 Jul 2019 12:39:01 +0800
In-Reply-To: <20190710095429.GA181405@chromium.org>
References: <jungo.lin@mediatek.com>
         <20190611035344.29814-1-jungo.lin@mediatek.com>
         <20190611035344.29814-7-jungo.lin@mediatek.com>
         <20190710095429.GA181405@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi, Tomasz:

On Wed, 2019-07-10 at 18:54 +0900, Tomasz Figa wrote:
> Hi Jungo,
> 
> On Tue, Jun 11, 2019 at 11:53:41AM +0800, Jungo Lin wrote:
> > Implement standard V4L2 video driver that utilizes V4L2
> > and media framework APIs. In this driver, supports one media
> > device, one sub-device and seven video devices during
> > initialization. Moreover, it also connects with sensor and
> > seninf drivers with V4L2 async APIs.
> > 
> > (The current metadata interface used in meta input and partial
> > meta nodes is only a temporary solution to kick off the driver
> > development and is not ready to be reviewed yet.)
> > 
> > Signed-off-by: Jungo Lin <jungo.lin@mediatek.com>
> > ---
> > This patch depends on "media: support Mediatek sensor interface driver"[1].
> > 
> > ISP P1 sub-device communicates with seninf sub-device with CIO.
> > 
> > [1]. media: support Mediatek sensor interface driver
> > https://patchwork.kernel.org/cover/10979135/
> > ---
> >  .../platform/mtk-isp/isp_50/cam/Makefile      |    1 +
> >  .../mtk-isp/isp_50/cam/mtk_cam-v4l2-util.c    | 1674 +++++++++++++++++
> >  .../mtk-isp/isp_50/cam/mtk_cam-v4l2-util.h    |  173 ++
> >  3 files changed, 1848 insertions(+)
> >  create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-v4l2-util.c
> >  create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-v4l2-util.h
> > 
> 
> Thanks for the patch. Please see my comments inline.
> 
> [snip]
> 

Appreciate your comments on this patch.
Please check my replied inline.

> > +static void mtk_cam_req_try_isp_queue(struct mtk_cam_dev *cam_dev,
> > +				      struct media_request *new_req)
> > +{
> > +	struct mtk_cam_dev_request *req, *req_safe, *cam_dev_req;
> > +	struct device *dev = &cam_dev->pdev->dev;
> > +
> > +	dev_dbg(dev, "%s new req:%d", __func__, !new_req);
> > +
> > +	if (!cam_dev->streaming) {
> > +		cam_dev_req = mtk_cam_req_to_dev_req(new_req);
> > +		spin_lock(&cam_dev->req_lock);
> > +		list_add_tail(&cam_dev_req->list, &cam_dev->req_list);
> > +		spin_unlock(&cam_dev->req_lock);
> > +		dev_dbg(dev, "%s: stream off, no ISP enqueue\n", __func__);
> > +		return;
> > +	}
> > +
> > +	/* Normal enqueue flow */
> > +	if (new_req) {
> > +		mtk_isp_req_enqueue(dev, new_req);
> > +		return;
> > +	}
> > +
> > +	/* Flush all media requests wehen first stream on */
> > +	list_for_each_entry_safe(req, req_safe, &cam_dev->req_list, list) {
> > +		list_del(&req->list);
> > +		mtk_isp_req_enqueue(dev, &req->req);
> > +	}
> > +}
> 
> This will have to be redone, as per the other suggestions, but generally one
> would have a function that tries to queue as much as possible from a list to
> the hardware and another function that adds a request to the list and calls
> the first function.
> 

We revised this function as below.
First to check the en-queue conditions:
a. stream on 
b. The composer buffers in SCP are 3, so we only could has 3 jobs
at the same time.


Second, try to en-queue the frames in the pending job if possible and
move them into running job list if possible.

The request has been inserted into pending job in mtk_cam_req_validate
which is used to validate media_request.

void mtk_cam_dev_req_try_queue(struct mtk_cam_dev *cam_dev)
{
	struct mtk_cam_dev_request *req, *req_prev;
	struct list_head enqueue_job_list;
	int buffer_cnt = atomic_read(&cam_dev->running_job_count);
	unsigned long flags;

	if (!cam_dev->streaming ||
	    buffer_cnt >= MTK_ISP_MAX_RUNNING_JOBS) {
		dev_dbg(cam_dev->dev, "stream off or buffers are full:%d\n",
			buffer_cnt);
		return;
	}

	INIT_LIST_HEAD(&enqueue_job_list);

	spin_lock(&cam_dev->pending_job_lock);
	list_for_each_entry_safe(req, req_prev,
				 &cam_dev->pending_job_list, list) {
		list_del(&req->list);
		list_add_tail(&req->list, &enqueue_job_list);
		if (atomic_inc_return(&cam_dev->running_job_count) >=
			MTK_ISP_MAX_RUNNING_JOBS)
			break;
	}
	spin_unlock(&cam_dev->pending_job_lock);

	list_for_each_entry_safe(req, req_prev,
				 &enqueue_job_list, list) {
		list_del(&req->list);
		spin_lock_irqsave(&cam_dev->running_job_lock, flags);
		list_add_tail(&req->list, &cam_dev->running_job_list);
		spin_unlock_irqrestore(&cam_dev->running_job_lock, flags);

		mtk_isp_req_enqueue(cam_dev, req);
	}
}


> > +
> > +static void mtk_cam_req_queue(struct media_request *req)
> > +{
> > +	struct mtk_cam_dev *cam_dev = mtk_cam_mdev_to_dev(req->mdev);
> > +
> > +	vb2_request_queue(req);
> > +	mtk_cam_req_try_isp_queue(cam_dev, req);
> 
> Looks like this driver is suffering from versy similar problems in request
> handling as the DIP driver used to.
> 
> I'd prefer to save my time and avoid repeating the same comments, so please
> check my comments for the DIP driver and apply them to this one too:
> 
> https://patchwork.kernel.org/patch/10905223/
> 

Yes, we will follow the same design of DIP and replace this function by
vb2_request_queue and defined new request structure. 

/*
 * struct mtk_cam_dev_request - MTK camera device request.
 *
 * @req: Embedded struct media request.
 * @frame_params: The frame info. & address info. of enabled DMA nodes.
 * @frame_work: work queue entry for frame transmission to SCP.
 * @list: List entry of the object for @struct mtk_cam_dev:
 *        pending_job_list or running_job_list.
 * @buf_count: Buffer count in this request.
 *
 */
struct mtk_cam_dev_request {
	struct media_request req;
	struct mtk_p1_frame_param frame_params;
	struct work_struct frame_work;
	struct list_head list;
	atomic_t buf_count;
};


> > +}
> > +
> > +static struct media_request *mtk_cam_req_alloc(struct media_device *mdev)
> > +{
> > +	struct mtk_cam_dev_request *cam_dev_req;
> > +
> > +	cam_dev_req = kzalloc(sizeof(*cam_dev_req), GFP_KERNEL);
> > +
> > +	return &cam_dev_req->req;
> > +}
> > +
> > +static void mtk_cam_req_free(struct media_request *req)
> > +{
> > +	struct mtk_cam_dev_request *cam_dev_req = mtk_cam_req_to_dev_req(req);
> > +
> > +	kfree(cam_dev_req);
> > +}
> > +
> > +static __u32 img_get_pixel_byte_by_fmt(__u32 pix_fmt)
> 
> Doesn't this function return bits not bytes?
> 

Yes, the unit sould be bits, not bytes.
We will rename this function to get_pixel_bits.

static unsigned int get_pixel_bits(unsigned int pix_fmt)

> > +{
> > +	switch (pix_fmt) {
> > +	case V4L2_PIX_FMT_MTISP_B8:
> > +	case V4L2_PIX_FMT_MTISP_F8:
> > +		return 8;
> > +	case V4L2_PIX_FMT_MTISP_B10:
> > +	case V4L2_PIX_FMT_MTISP_F10:
> > +		return 10;
> > +	case V4L2_PIX_FMT_MTISP_B12:
> > +	case V4L2_PIX_FMT_MTISP_F12:
> > +		return 12;
> > +	case V4L2_PIX_FMT_MTISP_B14:
> > +	case V4L2_PIX_FMT_MTISP_F14:
> > +		return 14;
> > +	default:
> > +		return 0;
> > +	}
> > +}
> > +
> > +static __u32 img_cal_main_stream_stride(struct device *dev, __u32 width,
> > +					__u32 pix_fmt)
> > +{
> > +	__u32 stride;
> > +	__u32 pixel_byte = img_get_pixel_byte_by_fmt(pix_fmt);
> 
> The __ prefixed types should be used only inside UAPI. Please change the
> driver to use the normal ones.
> 

Ok, we will fix our usage in our driver source code.

> > +
> > +	width = ALIGN(width, 4);
> 
> If there is some alignment requirement for width, it should be handled by
> TRY_/S_FMT and here we should already assume everything properly aligned.
> 

We will follow your suggestion to move this code login in TRY_/S_FMT
functions.

> > +	stride = ALIGN(DIV_ROUND_UP(width * pixel_byte, 8), 2);
> > +
> > +	dev_dbg(dev, "main width:%d, stride:%d\n", width, stride);
> > +
> > +	return stride;
> > +}
> > +
> > +static __u32 img_cal_packed_out_stride(struct device *dev, __u32 width,
> > +				       __u32 pix_fmt)
> > +{
> > +	__u32 stride;
> > +	__u32 pixel_byte = img_get_pixel_byte_by_fmt(pix_fmt);
> > +
> > +	width = ALIGN(width, 4);
> 
> Ditto.
> 

Will fix.

> > +	stride = DIV_ROUND_UP(width * 3, 2);
> 
> Could we introduce a local variable for this intermediate value, so that its
> name could explain what the value is?
> 
> > +	stride = DIV_ROUND_UP(stride * pixel_byte, 8);
> > +
> > +	if (pix_fmt == V4L2_PIX_FMT_MTISP_F10)
> > +		stride = ALIGN(stride, 4);
> 
> Is it expected that only the F10 format needs this alignment?
> 

yes, if the pixel bits of image format is 10, the byte alignment of bpl
should be 4. Otherwise, it is 8. We will revise this and add more
comments.

/* 4 bytes alignment for 10 bit other are 8 bytes alignment */
	if (pixel_bits == 10)
		bpl = ALIGN(bpl, 4);
	else
		bpl = ALIGN(bpl, 8);

> > +
> > +	dev_dbg(dev, "packed width:%d, stride:%d\n", width, stride);
> > +
> > +	return stride;
> > +}
> > +
> > +static __u32 img_cal_stride(struct device *dev,
> > +			    int node_id,
> > +			    __u32 width,
> > +			    __u32 pix_fmt)
> > +{
> > +	__u32 bpl;
> > +
> > +	/* Currently, only support one_pixel_mode */
> > +	if (node_id == MTK_CAM_P1_MAIN_STREAM_OUT)
> > +		bpl = img_cal_main_stream_stride(dev, width, pix_fmt);
> > +	else if (node_id == MTK_CAM_P1_PACKED_BIN_OUT)
> > +		bpl = img_cal_packed_out_stride(dev, width, pix_fmt);
> > +
> > +	/* For DIP HW constrained, it needs 4 byte alignment */
> > +	bpl = ALIGN(bpl, 4);
> > +
> > +	return bpl;
> > +}
> > +
> > +static const struct v4l2_format *
> > +mtk_cam_dev_find_fmt(struct mtk_cam_dev_node_desc *desc, u32 format)
> > +{
> > +	unsigned int i;
> > +	const struct v4l2_format *dev_fmt;
> > +
> > +	for (i = 0; i < desc->num_fmts; i++) {
> > +		dev_fmt = &desc->fmts[i];
> > +		if (dev_fmt->fmt.pix_mp.pixelformat == format)
> > +			return dev_fmt;
> > +	}
> > +
> > +	return NULL;
> > +}
> > +
> > +/* Calcuate mplane pix format */
> > +static void
> > +mtk_cam_dev_cal_mplane_fmt(struct device *dev,
> > +			   struct v4l2_pix_format_mplane *dest_fmt,
> > +			   unsigned int node_id)
> > +{
> > +	unsigned int i;
> > +	__u32 bpl, sizeimage, imagsize;
> 
> Perhaps s/sizeimage/plane_size/ and s/imagsize/total_size/?
> 

Has fixed it.
Btw we will only support 1 plane, there is no need for plane_size.

> > +
> > +	imagsize = 0;
> > +	for (i = 0 ; i < dest_fmt->num_planes; ++i) {
> > +		bpl = img_cal_stride(dev,
> > +				     node_id,
> > +				     dest_fmt->width,
> > +				     dest_fmt->pixelformat);
> > +		sizeimage = bpl * dest_fmt->height;
> > +		imagsize += sizeimage;
> > +		dest_fmt->plane_fmt[i].bytesperline = bpl;
> > +		dest_fmt->plane_fmt[i].sizeimage = sizeimage;
> > +		memset(dest_fmt->plane_fmt[i].reserved,
> > +		       0, sizeof(dest_fmt->plane_fmt[i].reserved));
> 
> This memset is not needed. The core clears the reserved fields
> automatically:
> 
> https://elixir.bootlin.com/linux/v5.2/source/drivers/media/v4l2-core/v4l2-ioctl.c#L1559
> 
> (We may want to backport the patch that added that to our 4.19 branch.)
> 

Ok, we will remove both memset functions in this function.


> > +		dev_dbg(dev, "plane:%d,bpl:%d,sizeimage:%u\n",
> > +			i,  bpl, dest_fmt->plane_fmt[i].sizeimage);
> > +	}
> > +
> > +	if (dest_fmt->num_planes == 1)
> > +		dest_fmt->plane_fmt[0].sizeimage = imagsize;
> 
> Hmm, we only seem to support 1 plane raw formats in this driver. Does the
> hardware support any formats with more than 1 plane? If not, all the code
> should be simplified to just assume 1 plane.
> 

No, MTK P1 ISP HW only supports raw formats with 1 plane.
We will revise our source codes to support only 1 plane.

> > +}
> > +
> > +static void
> > +mtk_cam_dev_set_img_fmt(struct device *dev,
> > +			struct v4l2_pix_format_mplane *dest_fmt,
> > +			const struct v4l2_pix_format_mplane *src_fmt,
> > +			unsigned int node_id)
> > +{
> > +	dest_fmt->width = src_fmt->width;
> > +	dest_fmt->height = src_fmt->height;
> > +	dest_fmt->pixelformat = src_fmt->pixelformat;
> > +	dest_fmt->field = src_fmt->field;
> > +	dest_fmt->colorspace = src_fmt->colorspace;
> > +	dest_fmt->num_planes = src_fmt->num_planes;
> > +	/* Use default */
> > +	dest_fmt->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
> > +	dest_fmt->quantization = V4L2_QUANTIZATION_DEFAULT;
> > +	dest_fmt->xfer_func =
> > +		V4L2_MAP_XFER_FUNC_DEFAULT(dest_fmt->colorspace);
> > +	memset(dest_fmt->reserved, 0, sizeof(dest_fmt->reserved));
> 
> Given that src_fmt should already be validated and have any fields adjusted
> to match the driver requirements, wouldn't all the lines above be equivalent
> to *dest_fmt = *src_fmt?
> 
> We probably want to move setting all the constant fields to
> mtk_cam_vidioc_try_fmt().
> 

Ok, we will remove mtk_cam_dev_set_img_fmt function
and use *dest_fmt = *src_fmt directly in the caller.
Moreover, all the constant fields are moved to mtk_cam_vidioc_try_fmt()
function.

> > +
> > +	dev_dbg(dev, "%s: Dest Fmt:%c%c%c%c, w*h:%d*%d\n",
> > +		__func__,
> > +		(dest_fmt->pixelformat & 0xFF),
> > +		(dest_fmt->pixelformat >> 8) & 0xFF,
> > +		(dest_fmt->pixelformat >> 16) & 0xFF,
> > +		(dest_fmt->pixelformat >> 24) & 0xFF,
> > +		dest_fmt->width,
> > +		dest_fmt->height);
> > +
> > +	mtk_cam_dev_cal_mplane_fmt(dev, dest_fmt, node_id);
> 
> This should have been called already before this function was called,
> because src_fmt should be already expected to contain valid settings. In
> fact, this is already called in mtk_cam_vidioc_try_fmt().
> 

Ok, we will revise this.

> > +}
> > +
> > +/* Get the default format setting */
> > +static void
> > +mtk_cam_dev_load_default_fmt(struct device *dev,
> 
> Please don't pass struct device pointer around, but instead just the main
> driver data struct, which should be much more convenient for accessing
> various driver data. Please fix the other functions as well.
> 

Ok, we will revise this coding style in our source codes.

> > +			     struct mtk_cam_dev_node_desc *queue_desc,
> > +			     struct v4l2_format *dest)
> > +{
> > +	const struct v4l2_format *default_fmt =
> > +		&queue_desc->fmts[queue_desc->default_fmt_idx];
> > +
> > +	dest->type = queue_desc->buf_type;
> > +
> > +	/* Configure default format based on node type */
> > +	if (queue_desc->image) {
> > +		mtk_cam_dev_set_img_fmt(dev,
> > +					&dest->fmt.pix_mp,
> > +					&default_fmt->fmt.pix_mp,
> > +					queue_desc->id);
> 
> We should probably just call mtk_cam_vidioc_s_fmt() here, with a dummy
> v4l2_format struct and have any incorrect fields replaced by
> mtk_cam_vidioc_try_fmt(), since it's the same logic, as if setting invalid
> v4l2_format at runtime.
> 

Ok, we will revise this.

> > +	} else {
> > +		dest->fmt.meta.dataformat = default_fmt->fmt.meta.dataformat;
> > +		dest->fmt.meta.buffersize = default_fmt->fmt.meta.buffersize;
> > +	}
> > +}
> > +
> > +static int mtk_cam_isp_open(struct file *file)
> > +{
> > +	struct mtk_cam_dev *cam_dev = video_drvdata(file);
> > +	struct device *dev = &cam_dev->pdev->dev;
> > +	struct mtk_cam_video_device *node = file_to_mtk_cam_node(file);
> > +	int ret;
> > +
> > +	mutex_lock(&cam_dev->lock);
> > +	ret = v4l2_fh_open(file);
> > +	if (ret)
> > +		goto unlock;
> > +
> > +	ret = v4l2_pipeline_pm_use(&node->vdev.entity, 1);
> 
> Please don't power on open. Normally applications keep the device nodes open
> all the time, so they would keep everything powered on.
> 
> Normally this should be done as late as possible, ideally when starting the
> streaming.
> 

Ok, we will remove this function and just call 4l2_fh_open(file)
function.

> > +	if (ret)
> > +		dev_err(dev, "%s fail:%d", __func__, ret);
> > +
> > +unlock:
> > +	mutex_unlock(&cam_dev->lock);
> > +
> > +	return ret;
> > +}
> > +
> > +static int mtk_cam_isp_release(struct file *file)
> > +{
> > +	struct mtk_cam_dev *cam_dev = video_drvdata(file);
> > +	struct mtk_cam_video_device *node = file_to_mtk_cam_node(file);
> > +
> > +	mutex_lock(&cam_dev->lock);
> > +	v4l2_pipeline_pm_use(&node->vdev.entity, 0);
> > +	vb2_fop_release(file);
> > +	mutex_unlock(&cam_dev->lock);
> > +
> > +	return 0;
> > +}
> 
> If we remove power handling from open and release, we should be able to just
> use v4l2_fh_open() and vb2_fop_release() directly in the
> v4l2_file_operations struct.
> 

Ok, we will fix this.

> > +
> > +static struct v4l2_subdev *
> > +mtk_cam_cio_get_active_sensor(struct mtk_cam_dev *cam_dev)
> > +{
> > +	struct media_device *mdev = cam_dev->seninf->entity.graph_obj.mdev;
> > +	struct media_entity *entity;
> > +	struct device *dev = &cam_dev->pdev->dev;
> > +	struct v4l2_subdev *sensor;
> 
> This variable would be unitialized if there is no streaming sensor. Was
> there no compiler warning generated for this?
> 

No, there is no compiler warning.
But, we will assign sensor to NULL to avoid unnecessary compiler warning
with different compiler options.

> > +
> > +	media_device_for_each_entity(entity, mdev) {
> > +		dev_dbg(dev, "media entity: %s:0x%x\n",
> > +			entity->name, entity->function);
> > +		if (entity->function == MEDIA_ENT_F_CAM_SENSOR &&
> > +		    entity->stream_count) {
> > +			sensor = media_entity_to_v4l2_subdev(entity);
> > +			dev_dbg(dev, "Sensor found: %s\n", entity->name);
> > +			break;
> > +		}
> > +	}
> > +
> > +	if (!sensor)
> > +		dev_err(dev, "Sensor is not connected\n");
> > +
> > +	return sensor;
> > +}
> > +
> > +static int mtk_cam_cio_stream_on(struct mtk_cam_dev *cam_dev)
> > +{
> > +	struct device *dev = &cam_dev->pdev->dev;
> > +	int ret;
> > +
> > +	/* Align vb2_core_streamon design */
> > +	if (cam_dev->streaming) {
> > +		dev_warn(dev, "already streaming\n", dev);
> > +		return 0;
> > +	}
> 
> Could we check this in the caller?
> 

Ok, we will move this logic check in the mtk_cam_sd_s_stream function.

> > +
> > +	if (!cam_dev->seninf) {
> > +		dev_err(dev, "no seninf connected:%d\n", ret);
> > +		return -EPERM;
> 
> I don't think -EPERM is a good error code here. It's about a missing seninf
> device, so perhaps -ENODEV?
> 

Fix it in next patch.

> > +	}
> > +
> > +	/* Get active sensor from graph topology */
> > +	cam_dev->sensor = mtk_cam_cio_get_active_sensor(cam_dev);
> > +	if (!cam_dev->sensor)
> > +		return -EPERM;
> 
> > -ENODEV
> 
> > +
> > +	ret = mtk_isp_config(dev);
> > +	if (ret)
> > +		return -EPERM;
> 
> Maybe just return ret?
> 

Fix it in next patch.

> > +
> > +	/* Seninf must stream on first */
> > +	ret = v4l2_subdev_call(cam_dev->seninf, video, s_stream, 1);
> > +	if (ret) {
> > +		dev_err(dev, "%s stream on failed:%d\n",
> > +			cam_dev->seninf->entity.name, ret);
> > +		return -EPERM;
> 
> return ret?
> 

Fix it in next patch.

> > +	}
> > +
> > +	ret = v4l2_subdev_call(cam_dev->sensor, video, s_stream, 1);
> > +	if (ret) {
> > +		dev_err(dev, "%s stream on failed:%d\n",
> > +			cam_dev->sensor->entity.name, ret);
> > +		goto fail_sensor_on;
> > +	}
> > +
> > +	cam_dev->streaming = true;
> > +	mtk_cam_req_try_isp_queue(cam_dev, NULL);
> > +	isp_composer_stream(dev, 1);
> > +	dev_dbg(dev, "streamed on Pass 1\n");
> > +
> > +	return 0;
> > +
> > +fail_sensor_on:
> > +	v4l2_subdev_call(cam_dev->seninf, video, s_stream, 0);
> > +
> > +	return -EPERM;
> 
> return ret?
> 

Fix it in next patch.

> > +}
> > +
> > +static int mtk_cam_cio_stream_off(struct mtk_cam_dev *cam_dev)
> > +{
> > +	struct device *dev = &cam_dev->pdev->dev;
> > +	int ret;
> > +
> > +	if (!cam_dev->streaming) {
> > +		dev_warn(dev, "already stream off");
> > +		return 0;
> > +	}
> 
> Could we check this in the caller?
> 

Ditto.

> > +
> > +	ret = v4l2_subdev_call(cam_dev->sensor, video, s_stream, 0);
> > +	if (ret) {
> > +		dev_err(dev, "%s stream off failed:%d\n",
> > +			cam_dev->sensor->entity.name, ret);
> > +		return -EPERM;
> > +	}
> > +
> > +	ret = v4l2_subdev_call(cam_dev->seninf, video, s_stream, 0);
> > +	if (ret) {
> > +		dev_err(dev, "%s stream off failed:%d\n",
> > +			cam_dev->seninf->entity.name, ret);
> > +		return -EPERM;
> > +	}
> > +
> > +	isp_composer_stream(dev, 0);
> 
> Shouldn't we synchronously wait for the streaming to stop here? Otherwise we
> can't guarantee that the hardware releases all the memory that we're going
> to free once this function returns.
> 

We will add  below functions.
1. Stream off ISP HW
2. Stop ISP HW
3. Clear all pending & running request lists.

	cam_dev->streaming = false;
	mtk_isp_stream(cam_dev, 0);
	mtk_isp_hw_release(cam_dev);
	mtk_cam_dev_req_clear(cam_dev);

	dev_dbg(dev, "streamed off Pass 1\n");

> > +	cam_dev->streaming = false;
> > +	dev_dbg(dev, "streamed off Pass 1\n");
> > +
> > +	return 0;
> > +}
> > +
> > +static int mtk_cam_sd_s_stream(struct v4l2_subdev *sd, int enable)
> > +{
> > +	struct mtk_cam_dev *cam_dev = mtk_cam_subdev_to_dev(sd);
> > +
> > +	if (enable)
> > +		return mtk_cam_cio_stream_on(cam_dev);
> > +	else
> > +		return mtk_cam_cio_stream_off(cam_dev);
> > +}
> > +
> > +static int mtk_cam_sd_subscribe_event(struct v4l2_subdev *subdev,
> > +				      struct v4l2_fh *fh,
> > +				      struct v4l2_event_subscription *sub)
> > +{
> > +	switch (sub->type) {
> > +	case V4L2_EVENT_FRAME_SYNC:
> > +		return v4l2_event_subscribe(fh, sub, 0, NULL);
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +}
> > +
> > +static int mtk_cam_sd_s_power(struct v4l2_subdev *sd, int on)
> > +{
> > +	struct mtk_cam_dev *cam_dev = mtk_cam_subdev_to_dev(sd);
> > +
> > +	dev_dbg(&cam_dev->pdev->dev, "%s:%d", __func__, on);
> > +
> > +	return on ? mtk_isp_power_init(cam_dev) :
> > +		    mtk_isp_power_release(&cam_dev->pdev->dev);
> 
> s_power is a historical thing and we shouldn't be implementing it. Instead,
> we should use runtime PM and call pm_runtime_get_sync(), pm_runtime_put()
> whenever we start and stop streaming respectively.
> 

Ok, we will remove this callback function.

> > +}
> > +
> > +static int mtk_cam_media_link_setup(struct media_entity *entity,
> > +				    const struct media_pad *local,
> > +				    const struct media_pad *remote, u32 flags)
> > +{
> > +	struct mtk_cam_dev *cam_dev =
> > +		container_of(entity, struct mtk_cam_dev, subdev.entity);
> > +	u32 pad = local->index;
> > +
> > +	dev_dbg(&cam_dev->pdev->dev, "%s: %d -> %d flags:0x%x\n",
> > +		__func__, pad, remote->index, flags);
> > +
> > +	if (pad < MTK_CAM_P1_TOTAL_NODES)
> 
> I assume this check is needed, because the pads with higher indexes are not
> video nodes? If so, a comment would be helpful here.
> 

Yes, we will new comment as below.

	/*
	 * Check video nodes is enabled by link setup.
	 * The pad index of video node should be less than       
         * MTK_CAM_P1_TOTAL_NODES.
	 */
	if (pad < MTK_CAM_P1_TOTAL_NODES)
		cam_dev->vdev_nodes[pad].enabled =
			!!(flags & MEDIA_LNK_FL_ENABLED);

> > +		cam_dev->vdev_nodes[pad].enabled =
> > +			!!(flags & MEDIA_LNK_FL_ENABLED);
> > +
> > +	return 0;
> > +}
> > +
> > +static void mtk_cam_vb2_buf_queue(struct vb2_buffer *vb)
> > +{
> > +	struct mtk_cam_dev *mtk_cam_dev = vb2_get_drv_priv(vb->vb2_queue);
> > +	struct mtk_cam_video_device *node = mtk_cam_vbq_to_vdev(vb->vb2_queue);
> > +	struct device *dev = &mtk_cam_dev->pdev->dev;
> > +	struct mtk_cam_dev_buffer *buf;
> > +
> > +	buf = mtk_cam_vb2_buf_to_dev_buf(vb);
> 
> This can be folded into the declaration.
> 

Fix it in next patch.

> > +
> > +	dev_dbg(dev, "%s: node:%d fd:%d idx:%d\n",
> > +		__func__,
> > +		node->id,
> > +		buf->vbb.request_fd,
> > +		buf->vbb.vb2_buf.index);
> > +
> > +	/* For request buffers en-queue, handled in mtk_cam_req_try_queue */
> > +	if (vb->vb2_queue->uses_requests)
> > +		return;
> 
> I'd suggest removing non-request support from this driver. Even if we end up
> with a need to provide compatibility for non-request mode, then it should be
> built on top of the requests mode, so that the driver itself doesn't have to
> deal with two modes.
> 

The purpose of non-request function in this driver is needed by
our camera middle-ware design. It needs 3A statistics buffers before
image buffers en-queue. So we need to en-queue 3A statistics with
non-request mode in this driver. After MW got the 3A statistics data, it
will en-queue the images, tuning buffer and other meta buffers with
request mode. Based on this requirement, do you have any suggestion?
For upstream driver, should we only consider request mode?

> > +
> > +	/* Added the buffer into the tracking list */
> > +	spin_lock(&node->slock);
> > +	list_add_tail(&buf->list, &node->pending_list);
> > +	spin_unlock(&node->slock);
> > +
> > +	mtk_isp_enqueue(dev, node->desc.dma_port, buf);
> > +}
> > +
> > +static int mtk_cam_vb2_buf_init(struct vb2_buffer *vb)
> > +{
> > +	struct mtk_cam_dev *cam_dev = vb2_get_drv_priv(vb->vb2_queue);
> > +	struct device *smem_dev = cam_dev->smem_dev;
> > +	struct mtk_cam_video_device *node = mtk_cam_vbq_to_vdev(vb->vb2_queue);
> > +	struct mtk_cam_dev_buffer *buf;
> > +
> > +	buf = mtk_cam_vb2_buf_to_dev_buf(vb);
> > +	buf->node_id = node->id;
> > +	buf->daddr = vb2_dma_contig_plane_dma_addr(&buf->vbb.vb2_buf, 0);
> > +	buf->scp_addr = 0;
> 
> Just a reminder that this will have to be reworked according to my comments
> for the memory allocation patch.
> 

Yes, we have revised this implementation according to the review of
below patch set.

https://patchwork.kernel.org/patch/10985833/

> > +
> > +	/* scp address is only valid for meta input buffer */
> > +	if (node->desc.smem_alloc)
> > +		buf->scp_addr = mtk_cam_smem_iova_to_scp_addr(smem_dev,
> > +							      buf->daddr);
> > +
> > +	return 0;
> > +}
> > +
> > +static int mtk_cam_vb2_buf_prepare(struct vb2_buffer *vb)
> > +{
> > +	struct vb2_v4l2_buffer *v4l2_buf = to_vb2_v4l2_buffer(vb);
> > +	struct mtk_cam_video_device *node = mtk_cam_vbq_to_vdev(vb->vb2_queue);
> > +	const struct v4l2_format *fmt = &node->vdev_fmt;
> > +	unsigned int size;
> > +
> > +	if (vb->vb2_queue->type == V4L2_BUF_TYPE_META_OUTPUT ||
> > +	    vb->vb2_queue->type == V4L2_BUF_TYPE_META_CAPTURE)
> > +		size = fmt->fmt.meta.buffersize;
> > +	else
> > +		size = fmt->fmt.pix_mp.plane_fmt[0].sizeimage;
> > +
> > +	if (vb2_plane_size(vb, 0) < size)
> > +		return -EINVAL;
> 
> For OUTPUT buffers we need to check if vb2_get_plane_payload() == size.
> Otherwise we could get not enough or invalid data.
> 

Fixed in next patch.

> > +
> > +	v4l2_buf->field = V4L2_FIELD_NONE;
> > +	vb2_set_plane_payload(vb, 0, size);
> 
> This shouldn't be called on OUTPUT buffers.
> 

Ditto.

> > +
> > +	return 0;
> > +}
> > +
> > +static int mtk_cam_vb2_queue_setup(struct vb2_queue *vq,
> > +				   unsigned int *num_buffers,
> > +				   unsigned int *num_planes,
> > +				   unsigned int sizes[],
> > +				   struct device *alloc_devs[])
> > +{
> > +	struct mtk_cam_video_device *node = mtk_cam_vbq_to_vdev(vq);
> > +	unsigned int max_buffer_count = node->desc.max_buf_count;
> > +	const struct v4l2_format *fmt = &node->vdev_fmt;
> > +	unsigned int size;
> > +
> > +	/* Check the limitation of buffer size */
> > +	if (max_buffer_count)
> > +		*num_buffers = clamp_val(*num_buffers, 1, max_buffer_count);
> > +
> > +	if (vq->type == V4L2_BUF_TYPE_META_OUTPUT ||
> > +	    vq->type == V4L2_BUF_TYPE_META_CAPTURE)
> > +		size = fmt->fmt.meta.buffersize;
> > +	else
> > +		size = fmt->fmt.pix_mp.plane_fmt[0].sizeimage;
> > +
> > +	/* Add for q.create_bufs with fmt.g_sizeimage(p) / 2 test */
> > +	if (*num_planes) {
> 
> We should also verify that *num_planes == 1, as we don't support more
> planes in this driver.
> 

Ok, here is new check logic.

	if (*num_planes) {
		if (sizes[0] < size || *num_planes != 1)
			return -EINVAL;
	} else {
		*num_planes = 1;
		sizes[0] = size;
	}


> > +		if (sizes[0] < size)
> > +			return -EINVAL;
> > +	} else {
> > +		*num_planes = 1;
> > +		sizes[0] = size;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static void mtk_cam_vb2_return_all_buffers(struct mtk_cam_dev *cam_dev,
> > +					   struct mtk_cam_video_device *node,
> > +					   enum vb2_buffer_state state)
> > +{
> > +	struct mtk_cam_dev_buffer *b, *b0;
> > +	struct mtk_cam_dev_request *req, *req0;
> > +	struct media_request_object *obj, *obj0;
> > +	struct vb2_buffer *vb;
> > +
> > +	dev_dbg(&cam_dev->pdev->dev, "%s: node:%s", __func__, node->vdev.name);
> > +
> > +	/* Return all buffers */
> > +	spin_lock(&node->slock);
> > +	list_for_each_entry_safe(b, b0, &node->pending_list, list) {
> 
> nit: One would normally call the second argument "prev", or "b_prev".
> 

Ok, we will follow this coding convention in our source codes. 

> > +		vb = &b->vbb.vb2_buf;
> > +		if (vb->state == VB2_BUF_STATE_ACTIVE)
> 
> We shouldn't need to check the buffer state.
> 

Fixed in next patch.

> > +			vb2_buffer_done(vb, state);
> > +		list_del(&b->list);
> > +	}
> > +	spin_unlock(&node->slock);
> > +
> > +	spin_lock(&cam_dev->req_lock);
> > +	list_for_each_entry_safe(req, req0, &cam_dev->req_list, list) {
> 
> nit: Ditto.
> 

Fixed in next patch.

> > +		list_for_each_entry_safe(obj, obj0, &req->req.objects, list) {
> 
> Need to check if the object is a buffer.
> 

Fixed in next patch.

> > +			vb = container_of(obj, struct vb2_buffer, req_obj);
> > +			if (vb->state == VB2_BUF_STATE_ACTIVE)
> 
> vb->state shouldn't be accessed directly from the drivers.
> 

nit: Ditto.

> Generally, the need to check the state here would suggest that there is
> something wrong with how the driver manages the requests. The list that is
> being iterated here shouldn't contain any requests that have buffers that
> aren't active. That will be achieved if my comments for the request handling
> in the DIP driver are applied to this driver as well.
> 
> > +				vb2_buffer_done(vb, state);
> > +		}
> > +		list_del(&req->list);
> > +	}
> > +	spin_unlock(&cam_dev->req_lock);
> > +
> > +	if (node->vbq.uses_requests)
> > +		mtk_isp_req_flush_buffers(&cam_dev->pdev->dev);
> > +}
> > +
> > +static int mtk_cam_vb2_start_streaming(struct vb2_queue *vq,
> > +				       unsigned int count)
> > +{
> > +	struct mtk_cam_dev *cam_dev = vb2_get_drv_priv(vq);
> > +	struct mtk_cam_video_device *node = mtk_cam_vbq_to_vdev(vq);
> > +	struct device *dev = &cam_dev->pdev->dev;
> > +	unsigned int node_count = cam_dev->subdev.entity.use_count;
> > +	int ret;
> > +
> > +	if (!node->enabled) {
> 
> How is this synchronized with mtk_cam_media_link_setup()?
> 

We will follow your suggestion and below is our proposal for this
function.

1. Use !cam_dev->pipeline.streaming_count to decide the first node to
stream-on.
2.a If yes, do the following steps
    2.a-1 Call media_pipeline_start function to prevent the link
configuration changes.
    2.a-2 Call mtk_cam_dev_init_stream function to calculate how many
video nodes are enabled and save it into cam_dev->enabled_node_count.
    2.a-3 Initialize ISP P1 HW in mtk_isp_hw_init function since end
user has called stream-on API
2.b jump step 3.

3. Use cam_dev->streamed_node_count to track how many video nodes are
streamed by user space.
4. Check all enabled video nodes are streamed or not based on
cam_dev->streamed_node_count & cam_dev->enabled_node_count.
5. If yes, call s_stream on for P1 sub-device

Do you think it is reasonable?

> > +		dev_err(dev, "Node:%d is not enable\n", node->id);
> > +		ret = -ENOLINK;
> > +		goto fail_no_link;
> > +	}
> > +
> > +	dev_dbg(dev, "%s: count info:%d:%d", __func__,
> > +		atomic_read(&cam_dev->streamed_node_count), node_count);
> > +
> > +	if (atomic_inc_return(&cam_dev->streamed_node_count) < node_count)
> > +		return 0;
> 
> How do we guarantee that cam_dev->subdev.entity.use_count doesn't change
> between calls to this function on different video nodes?
> 

Ditto.

> > +
> > +	/* Start streaming of the whole pipeline now */
> > +	ret = media_pipeline_start(&node->vdev.entity, &cam_dev->pipeline);
> > +	if (ret) {
> > +		dev_err(dev, "%s: Node:%d failed\n", __func__, node->id);
> > +		goto fail_start_pipeline;
> > +	}
> > +
> 
> Related to the above comment: If we start the media pipeline when we start
> streaming on the first node, we would naturally prevent the link
> configuration changes until the last node stops streaming (as long as the
> link is not DYNAMIC). Note that it would only mark the entities as
> streaming, but it wouldn't call their s_stream, which I believe is exactly
> what we would need to solve the problem above.
> 

Ditto.

> > +	/* Stream on sub-devices node */
> > +	ret = v4l2_subdev_call(&cam_dev->subdev, video, s_stream, 1);
> > +	if (ret) {
> > +		dev_err(dev, "Node:%d s_stream on failed:%d\n", node->id, ret);
> > +		goto fail_stream_on;
> > +	}
> > +
> > +	return 0;
> > +
> > +fail_stream_on:
> > +	media_pipeline_stop(&node->vdev.entity);
> > +fail_start_pipeline:
> > +	atomic_dec(&cam_dev->streamed_node_count);
> > +fail_no_link:
> > +	mtk_cam_vb2_return_all_buffers(cam_dev, node, VB2_BUF_STATE_QUEUED);
> > +
> > +	return ret;
> > +}
> > +
> > +static void mtk_cam_vb2_stop_streaming(struct vb2_queue *vq)
> > +{
> > +	struct mtk_cam_dev *cam_dev = vb2_get_drv_priv(vq);
> > +	struct mtk_cam_video_device *node = mtk_cam_vbq_to_vdev(vq);
> > +	struct device *dev = &cam_dev->pdev->dev;
> > +
> > +	if (!node->enabled)
> > +		return;
> 
> It shouldn't be possible for this to happen, because nobody could have
> called start_streaming on a disabled node.
> 

Will remove in next patch.

> > +
> > +	mtk_cam_vb2_return_all_buffers(cam_dev, node, VB2_BUF_STATE_ERROR);
> 
> Shouldn't we stop streaming first, so that the hardware operation is
> cancelled and any buffers owned by the hardware are released?
> 

For this function, below is the new code flow.

1. Check the first node to stream off based on 
cam_dev->streamed_node_count & cam_dev->enabled_node_count.
2. If yes, call all s_stream off for P1 sub-device
3. Call mtk_cam_vb2_return_all_buffers for each node
4. Check the last node to stream off
5. If yes, call media_pipeline_stop to allow user space
to perform link configuration changes, such as disable link.

But, for step 5, is it too late for end user to disable link?
For example, for first node, it has called stream off but
can't call disable link until the last node is stream off?

> > +
> > +	dev_dbg(dev, "%s: count info:%d", __func__,
> > +		cam_dev->subdev.entity.stream_count);
> > +
> > +	/* Check the first node to stream-off */
> > +	if (!cam_dev->subdev.entity.stream_count)
> > +		return;
> > +
> > +	media_pipeline_stop(&node->vdev.entity);
> > +
> > +	if (v4l2_subdev_call(&cam_dev->subdev, video, s_stream, 0))
> > +		dev_err(dev, "failed to stop streaming\n");
> > +}
> > +
> > +static void mtk_cam_vb2_buf_request_complete(struct vb2_buffer *vb)
> > +{
> > +	struct mtk_cam_dev *dev = vb2_get_drv_priv(vb->vb2_queue);
> > +
> > +	v4l2_ctrl_request_complete(vb->req_obj.req,
> > +				   dev->v4l2_dev.ctrl_handler);
> 
> This would end up being called multiple times, once for each video node.
> Instead, this should be called explicitly by the driver when it completed
> the request - perhaps in the frame completion handler?
> 
> With that, we probably wouldn't even need this callback.
> 

First, if we don't implement this callback function, we will receive
kernel warning as below.

https://elixir.bootlin.com/linux/latest/source/drivers/media/common/videobuf2/videobuf2-v4l2.c#L420

Second, this function is only be called in __vb2_queue_cancel function.
Moreover, we will remove cam_dev->v4l2_dev.ctrl_handler in next patch.
So could we just implement dummy empty function?

 * @buf_request_complete: a buffer that was never queued to the driver
but is
 *			associated with a queued request was canceled.
 *			The driver will have to mark associated objects in the
 *			request as completed; required if requests are
 *			supported.


> > +}
> > +
> > +static int mtk_cam_vidioc_querycap(struct file *file, void *fh,
> > +				   struct v4l2_capability *cap)
> > +{
> > +	struct mtk_cam_dev *cam_dev = video_drvdata(file);
> > +
> > +	strscpy(cap->driver, MTK_CAM_DEV_P1_NAME, sizeof(cap->driver));
> > +	strscpy(cap->card, MTK_CAM_DEV_P1_NAME, sizeof(cap->card));
> 
> We could just use dev_driver_name(cam_dev->dev) for both.
> 
> > +	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
> > +		 dev_name(cam_dev->media_dev.dev));
> 
> We should just store dev in cam_dev.
> 

Will fix in next patch.

> > +
> > +	return 0;
> > +}
> > +
> > +static int mtk_cam_vidioc_enum_fmt(struct file *file, void *fh,
> > +				   struct v4l2_fmtdesc *f)
> > +{
> > +	struct mtk_cam_video_device *node = file_to_mtk_cam_node(file);
> > +
> > +	if (f->index >= node->desc.num_fmts)
> > +		return -EINVAL;
> > +
> > +	f->pixelformat = node->desc.fmts[f->index].fmt.pix_mp.pixelformat;
> 
> Is the set of formats available always the same regardless of the sensor
> format?
> 

Yes, ISP P1 HW output formats are always available without impact
by sensor formats. 

> > +	f->flags = 0;
> 
> We need f->description too.
> 

For this description, do you suggest 1). we fill this field in this
function or 2). v4l_fill_fmtdesc function in v4l2-ioctl?

https://elixir.bootlin.com/linux/latest/source/drivers/media/v4l2-core/v4l2-ioctl.c#L1152

Basically, we prefer method 1.

> > +
> > +	return 0;
> > +}
> > +
> > +static int mtk_cam_vidioc_g_fmt(struct file *file, void *fh,
> > +				struct v4l2_format *f)
> > +{
> > +	struct mtk_cam_video_device *node = file_to_mtk_cam_node(file);
> > +
> > +	if (!node->desc.num_fmts)
> > +		return -EINVAL;
> 
> When would that condition happen?
> 

Will remove this in next patch.

> > +
> > +	f->fmt = node->vdev_fmt.fmt;
> > +
> > +	return 0;
> > +}
> > +
> > +static int mtk_cam_vidioc_try_fmt(struct file *file, void *fh,
> > +				  struct v4l2_format *in_fmt)
> > +{
> > +	struct mtk_cam_dev *cam_dev = video_drvdata(file);
> > +	struct mtk_cam_video_device *node = file_to_mtk_cam_node(file);
> > +	const struct v4l2_format *dev_fmt;
> > +	__u32  width, height;
> 
> Don't use __ types in implementation, they are here for UAPI purposes. There
> is u32, which you could use instead, but for width and height you don't need
> explicit size, so unsigned int should be good.
> 

Ok, we will revise this in next patch.

> > +
> > +	dev_dbg(&cam_dev->pdev->dev, "%s: fmt:%c%c%c%c, w*h:%u*%u\n",
> > +		__func__,
> > +		(in_fmt->fmt.pix_mp.pixelformat & 0xFF),
> > +		(in_fmt->fmt.pix_mp.pixelformat >> 8) & 0xFF,
> > +		(in_fmt->fmt.pix_mp.pixelformat >> 16) & 0xFF,
> > +		(in_fmt->fmt.pix_mp.pixelformat >> 24) & 0xFF,
> > +		in_fmt->fmt.pix_mp.width, in_fmt->fmt.pix_mp.height);
> > +
> > +	width = in_fmt->fmt.pix_mp.width;
> > +	height = in_fmt->fmt.pix_mp.height;
> > +
> > +	dev_fmt = mtk_cam_dev_find_fmt(&node->desc,
> > +				       in_fmt->fmt.pix_mp.pixelformat);
> > +	if (dev_fmt) {
> > +		mtk_cam_dev_set_img_fmt(&cam_dev->pdev->dev,
> > +					&in_fmt->fmt.pix_mp,
> > +					&dev_fmt->fmt.pix_mp,
> > +					node->id);
> > +	} else {
> > +		mtk_cam_dev_load_default_fmt(&cam_dev->pdev->dev,
> > +					     &node->desc, in_fmt);
> 
> We shouldn't just load a default format. This function should validate all
> the fields one by one and adjust them to something appropriate.
> 

For ISP P1 HW, we only cares these fields of v4l2_pix_format_mplane.
a. width
b. height
c. pixelformat
d. plane_fmt
    - sizeimage
    - bytesperline
e. num_planes
Other fields are consider constant.

So if the user space passes one pixel format with un-supported, we will
apply the default format firstly and adjust width, height, sizeimage,
and bytesperline. We will focus on validate width & height.
Is it ok?

> > +	}
> 
> CodingStyle: No braces if both if and else bodies have only 1 statement
> each.
> 

Will fix coding style in next patch.

> > +	in_fmt->fmt.pix_mp.width = clamp_t(u32,
> > +					   width,
> > +					   CAM_MIN_WIDTH,
> > +					   in_fmt->fmt.pix_mp.width);
> 
> Shouldn't we clamp this with some maximum value too?
> 

Ok, will revise as below:

	try_fmt.fmt.pix_mp.width = clamp_val(f->fmt.pix_mp.width,
					     IMG_MIN_WIDTH, IMG_MAX_WIDTH);
	try_fmt.fmt.pix_mp.height = clamp_val(f->fmt.pix_mp.height,
					      IMG_MAX_HEIGHT, IMG_MIN_HEIGHT);

> > +	in_fmt->fmt.pix_mp.height = clamp_t(u32,
> > +					    height,
> > +					    CAM_MIN_HEIGHT,
> > +					    in_fmt->fmt.pix_mp.height);
> 
> Ditto.
> 

Ditto.

> > +	mtk_cam_dev_cal_mplane_fmt(&cam_dev->pdev->dev,
> > +				   &in_fmt->fmt.pix_mp, node->id);
> > +
> > +	return 0;
> > +}
> > +
> > +static int mtk_cam_vidioc_s_fmt(struct file *file, void *fh,
> > +				struct v4l2_format *f)
> > +{
> > +	struct mtk_cam_dev *cam_dev = video_drvdata(file);
> > +	struct mtk_cam_video_device *node = file_to_mtk_cam_node(file);
> > +
> > +	if (cam_dev->streaming)
> > +		return -EBUSY;
> 
> I think this should rather be something like vb2_queue_is_busy(), which
> would prevent format changes if buffers are allocated.
> 

Since vb2_queue_is_busy is static function, would we paste its
implementation in this function to check like this?

	if (node->vdev.queue->owner &&
		node->vdev.queue->owner != file->private_data) {
		dev_err(cam_dev->dev, "%s err: buffer allocated\n", __func__);
		return -EBUSY;
	}

> > +
> > +	/* Get the valid format */
> > +	mtk_cam_vidioc_try_fmt(file, fh, f);
> > +
> > +	/* Configure to video device */
> > +	mtk_cam_dev_set_img_fmt(&cam_dev->pdev->dev,
> > +				&node->vdev_fmt.fmt.pix_mp,
> > +				&f->fmt.pix_mp,
> > +				node->id);
> > +
> > +	return 0;
> > +}
> > +
> > +static int mtk_cam_vidioc_enum_input(struct file *file, void *fh,
> > +				     struct v4l2_input *input)
> > +{
> > +	if (input->index)
> > +		return -EINVAL;
> > +
> > +	strscpy(input->name, "camera", sizeof(input->name));
> > +	input->type = V4L2_INPUT_TYPE_CAMERA;
> > +
> > +	return 0;
> > +}
> > +
> > +static int mtk_cam_vidioc_g_input(struct file *file, void *fh,
> > +				  unsigned int *input)
> > +{
> > +	*input = 0;
> > +
> > +	return 0;
> > +}
> > +
> > +static int mtk_cam_vidioc_s_input(struct file *file,
> > +				  void *fh, unsigned int input)
> > +{
> > +	return input == 0 ? 0 : -EINVAL;
> > +}
> > +
> > +static int mtk_cam_vidioc_enum_framesizes(struct file *filp, void *priv,
> > +					  struct v4l2_frmsizeenum *sizes)
> > +{
> > +	struct mtk_cam_video_device *node = file_to_mtk_cam_node(filp);
> > +	const struct v4l2_format *dev_fmt;
> > +
> > +	dev_fmt = mtk_cam_dev_find_fmt(&node->desc, sizes->pixel_format);
> > +	if (!dev_fmt || sizes->index)
> > +		return -EINVAL;
> > +
> > +	sizes->type = node->desc.frmsizes->type;
> > +	memcpy(&sizes->stepwise, &node->desc.frmsizes->stepwise,
> > +	       sizeof(sizes->stepwise));
> > +
> > +	return 0;
> > +}
> > +
> > +static int mtk_cam_vidioc_meta_enum_fmt(struct file *file, void *fh,
> > +					struct v4l2_fmtdesc *f)
> > +{
> > +	struct mtk_cam_video_device *node = file_to_mtk_cam_node(file);
> > +
> > +	if (f->index)
> > +		return -EINVAL;
> > +
> > +	strscpy(f->description, node->desc.description,
> > +		sizeof(node->desc.description));
> > +	f->pixelformat = node->vdev_fmt.fmt.meta.dataformat;
> > +	f->flags = 0;
> > +
> > +	return 0;
> > +}
> > +
> > +static int mtk_cam_vidioc_g_meta_fmt(struct file *file, void *fh,
> > +				     struct v4l2_format *f)
> > +{
> > +	struct mtk_cam_video_device *node = file_to_mtk_cam_node(file);
> > +
> > +	f->fmt.meta.dataformat = node->vdev_fmt.fmt.meta.dataformat;
> > +	f->fmt.meta.buffersize = node->vdev_fmt.fmt.meta.buffersize;
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct v4l2_subdev_core_ops mtk_cam_subdev_core_ops = {
> > +	.subscribe_event = mtk_cam_sd_subscribe_event,
> > +	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
> > +	.s_power = mtk_cam_sd_s_power,
> > +};
> > +
> > +static const struct v4l2_subdev_video_ops mtk_cam_subdev_video_ops = {
> > +	.s_stream =  mtk_cam_sd_s_stream,
> > +};
> > +
> > +static const struct v4l2_subdev_ops mtk_cam_subdev_ops = {
> > +	.core = &mtk_cam_subdev_core_ops,
> > +	.video = &mtk_cam_subdev_video_ops,
> > +};
> > +
> > +static const struct media_entity_operations mtk_cam_media_ops = {
> 
> nit: mtk_cam_media_entity_ops?
> 

Rename in next patch.

> > +	.link_setup = mtk_cam_media_link_setup,
> > +	.link_validate = v4l2_subdev_link_validate,
> > +};
> > +
> > +static const struct vb2_ops mtk_cam_vb2_ops = {
> > +	.queue_setup = mtk_cam_vb2_queue_setup,
> > +	.wait_prepare = vb2_ops_wait_prepare,
> > +	.wait_finish = vb2_ops_wait_finish,
> > +	.buf_init = mtk_cam_vb2_buf_init,
> > +	.buf_prepare = mtk_cam_vb2_buf_prepare,
> > +	.start_streaming = mtk_cam_vb2_start_streaming,
> > +	.stop_streaming = mtk_cam_vb2_stop_streaming,
> > +	.buf_queue = mtk_cam_vb2_buf_queue,
> > +	.buf_request_complete = mtk_cam_vb2_buf_request_complete,
> > +};
> > +
> > +static const struct v4l2_file_operations mtk_cam_v4l2_fops = {
> > +	.unlocked_ioctl = video_ioctl2,
> > +	.open = mtk_cam_isp_open,
> > +	.release = mtk_cam_isp_release,
> > +	.poll = vb2_fop_poll,
> > +	.mmap = vb2_fop_mmap,
> > +#ifdef CONFIG_COMPAT
> > +	.compat_ioctl32 = v4l2_compat_ioctl32,
> > +#endif
> > +};
> > +
> > +static const struct media_device_ops mtk_cam_media_req_ops = {
> 
> nit: Those are media ops, so perhaps just mtk_cam_media_ops?
> 

Rename in next patch.

> > +	.link_notify = v4l2_pipeline_link_notify,
> > +	.req_alloc = mtk_cam_req_alloc,
> > +	.req_free = mtk_cam_req_free,
> > +	.req_validate = vb2_request_validate,
> > +	.req_queue = mtk_cam_req_queue,
> > +};
> > +
> > +static int mtk_cam_media_register(struct device *dev,
> > +				  struct media_device *media_dev)
> > +{
> > +	media_dev->dev = dev;
> > +	strscpy(media_dev->model, MTK_CAM_DEV_P1_NAME,
> 
> Could we replace any use of this macro with dev_driver_string(dev) and then
> delete the macro? The less name strings in the driver the better, as there
> is less change for confusing the userspace if few different names are used
> at the same time.
> 

Ok, revised in next patch.

> > +		sizeof(media_dev->model));
> > +	snprintf(media_dev->bus_info, sizeof(media_dev->bus_info),
> > +		 "platform:%s", dev_name(dev));
> > +	media_dev->hw_revision = 0;
> > +	media_device_init(media_dev);
> > +	media_dev->ops = &mtk_cam_media_req_ops;
> > +
> > +	return media_device_register(media_dev);
> > +}
> > +
> > +static int mtk_cam_video_register_device(struct mtk_cam_dev *cam_dev, u32 i)
> > +{
> > +	struct device *dev = &cam_dev->pdev->dev;
> > +	struct mtk_cam_video_device *node = &cam_dev->vdev_nodes[i];
> 
> Would it make sense to pass node as an argument to this function instead of
> (or in addition to) i?
> 

Ok, revised in next patch.

> > +	struct video_device *vdev = &node->vdev;
> > +	struct vb2_queue *vbq = &node->vbq;
> > +	u32 output = !cam_dev->vdev_nodes[i].desc.capture;
> 
> Why not call it capture instead and avoid the inversion?
> 

Ok, we will revised as below.

unsigned int output = V4L2_TYPE_IS_OUTPUT(node->desc.buf_type);

> > +	u32 link_flags = cam_dev->vdev_nodes[i].desc.link_flags;
> > +	int ret;
> > +
> > +	cam_dev->subdev_pads[i].flags = output ?
> > +		MEDIA_PAD_FL_SINK : MEDIA_PAD_FL_SOURCE;
> > +
> > +	/* Initialize media entities */
> > +	ret = media_entity_pads_init(&vdev->entity, 1, &node->vdev_pad);
> > +	if (ret) {
> > +		dev_err(dev, "failed initialize media pad:%d\n", ret);
> > +		return ret;
> > +	}
> > +	node->enabled = false;
> 
> Are all the nodes optional? If there is any required node, it should be
> always enabled and have the MEDIA_LNK_FL_IMMUTABLE flag set.
> 

Ok, MTK_CAM_P1_MAIN_STREAM_OUT is required node, others are optional.
We will enable TK_CAM_P1_MAIN_STREAM_OUT with MEDIA_LNK_FL_IMMUTABLE |
MEDIA_LNK_FL_ENABLED.

> > +	node->id = i;
> > +	node->vdev_pad.flags = cam_dev->subdev_pads[i].flags;
> 
> Hmm, shouldn't the subdev pads have opposite directions (sink vs source)?
> 

Yes, it is wrong and fix with below statement.

node->vdev_pad.flags = output ? MEDIA_PAD_FL_SINK : MEDIA_PAD_FL_SOURCE;


> > +	mtk_cam_dev_load_default_fmt(&cam_dev->pdev->dev,
> > +				     &node->desc,
> > +				     &node->vdev_fmt);
> > +
> > +	/* Initialize vbq */
> > +	vbq->type = node->vdev_fmt.type;
> > +	if (vbq->type == V4L2_BUF_TYPE_META_OUTPUT)
> > +		vbq->io_modes = VB2_MMAP;
> > +	else
> > +		vbq->io_modes = VB2_MMAP | VB2_DMABUF;
> > +
> > +	if (node->desc.smem_alloc) {
> > +		vbq->bidirectional = 1;
> > +		vbq->dev = cam_dev->smem_dev;
> > +	} else {
> > +		vbq->dev = &cam_dev->pdev->dev;
> > +	}
> > +
> > +	if (vbq->type == V4L2_BUF_TYPE_META_CAPTURE)
> > +		vdev->entity.function =
> > +			MEDIA_ENT_F_PROC_VIDEO_STATISTICS;
> 
> This is a video node, so it's just a DMA, not a processing entity. I believe
> all the entities corresponding to video nodes should use MEDIA_ENT_F_IO_V4L.
> 

Ok, it is fixed.

> > +	vbq->ops = &mtk_cam_vb2_ops;
> > +	vbq->mem_ops = &vb2_dma_contig_memops;
> > +	vbq->buf_struct_size = sizeof(struct mtk_cam_dev_buffer);
> > +	vbq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> > +	vbq->min_buffers_needed = 0;	/* Can streamon w/o buffers */
> > +	/* Put the process hub sub device in the vb2 private data */
> 
> What is "process hub" and what "sub device" is this about?
> 

We will drop this comment.

> > +	vbq->drv_priv = cam_dev;
> > +	vbq->lock = &node->lock;
> > +	vbq->supports_requests = true;
> > +
> > +	ret = vb2_queue_init(vbq);
> > +	if (ret) {
> > +		dev_err(dev, "failed to init. vb2 queue:%d\n", ret);
> > +		goto fail_vb2_queue;
> > +	}
> > +
> > +	/* Initialize vdev */
> > +	snprintf(vdev->name, sizeof(vdev->name), "%s %s",
> > +		 MTK_CAM_DEV_P1_NAME, node->desc.name);
> > +	/* set cap/type/ioctl_ops of the video device */
> > +	vdev->device_caps = node->desc.cap | V4L2_CAP_STREAMING;
> > +	vdev->ioctl_ops = node->desc.ioctl_ops;
> > +	vdev->fops = &mtk_cam_v4l2_fops;
> > +	vdev->release = video_device_release_empty;
> > +	vdev->lock = &node->lock;
> > +	vdev->v4l2_dev = &cam_dev->v4l2_dev;
> > +	vdev->queue = &node->vbq;
> > +	vdev->vfl_dir = output ? VFL_DIR_TX : VFL_DIR_RX;
> > +	vdev->entity.ops = NULL;
> > +	/* Enable private control for image video devices */
> > +	if (node->desc.image) {
> > +		mtk_cam_ctrl_init(cam_dev, &node->ctrl_handler);
> > +		vdev->ctrl_handler = &node->ctrl_handler;
> > +	}
> > +	video_set_drvdata(vdev, cam_dev);
> > +	dev_dbg(dev, "register vdev:%d:%s\n", i, vdev->name);
> > +
> > +	ret = video_register_device(vdev, VFL_TYPE_GRABBER, -1);
> > +	if (ret) {
> > +		dev_err(dev, "failed to register vde:%d\n", ret);
> > +		goto fail_vdev;
> > +	}
> > +
> > +	/* Create link between video node and the subdev pad */
> > +	if (output) {
> > +		ret = media_create_pad_link(&vdev->entity, 0,
> > +					    &cam_dev->subdev.entity,
> > +					    i, link_flags);
> > +	} else {
> > +		ret = media_create_pad_link(&cam_dev->subdev.entity,
> > +					    i, &vdev->entity, 0,
> > +					    link_flags);
> > +	}
> > +	if (ret)
> > +		goto fail_link;
> > +
> > +	/* Initialize miscellaneous variables */
> > +	mutex_init(&node->lock);
> > +	spin_lock_init(&node->slock);
> > +	INIT_LIST_HEAD(&node->pending_list);
> 
> This should be all initialized before registering the video device.
> Otherwise userspace could open the device before these are initialized.
> 

Fixed in next patch.

> > +
> > +	return 0;
> > +
> > +fail_link:
> > +	video_unregister_device(vdev);
> > +fail_vdev:
> > +	vb2_queue_release(vbq);
> > +fail_vb2_queue:
> > +	media_entity_cleanup(&vdev->entity);
> > +
> > +	return ret;
> > +}
> > +
> > +static int mtk_cam_mem2mem2_v4l2_register(struct mtk_cam_dev *cam_dev)
> 
> This function doesn't have anything to do with mem2mem. How about
> mtk_cam_v4l2_register()?
> 
> Perhaps it would make sense to move any media related code into into
> mtk_cam_media_register(), keep only V4L2 related code here and have the
> caller call the former first and then this one, rather than having such deep
> sequence of nested calls, which makes the driver harder to read.
> 

Fixed in next patch.

> > +{
> > +	struct device *dev = &cam_dev->pdev->dev;
> 
> How about just storing dev, instead of pdev in the struct? Also, calling the
> argument "cam", would make it as short as cam->dev.
> 

Ok, we will revise this in next patch.

> > +	/* Total pad numbers is video devices + one seninf pad */
> > +	unsigned int num_subdev_pads = MTK_CAM_CIO_PAD_SINK + 1;
> > +	unsigned int i;
> > +	int ret;
> > +
> > +	ret = mtk_cam_media_register(dev,
> > +				     &cam_dev->media_dev);
> > +	if (ret) {
> > +		dev_err(dev, "failed to register media device:%d\n", ret);
> > +		return ret;
> > +	}
> > +	dev_info(dev, "Register media device: %s, 0x%pK",
> > +		 MTK_CAM_DEV_P1_NAME, cam_dev->media_dev);
> 
> An info message should be useful to the user in some way. Printing kernel
> pointers isn't useful. Something like "registered media0" could be useful to
> let the user know which media device is associated with this driver if there
> is more than one in the system.
> 

Here is the new log info.

dev_info(dev, "media%d register",cam->media_dev.devnode->minor);


> > +
> > +	/* Set up v4l2 device */
> > +	cam_dev->v4l2_dev.mdev = &cam_dev->media_dev;
> > +	ret = v4l2_device_register(dev, &cam_dev->v4l2_dev);
> > +	if (ret) {
> > +		dev_err(dev, "failed to register V4L2 device:%d\n", ret);
> > +		goto fail_v4l2_dev;
> 
> Please call the labels after the cleanup step that needs to be done. It
> makes it easier to spot any ordering errors.
> 

Will fix in next patch.

> > +	}
> > +	dev_info(dev, "Register v4l2 device: 0x%pK", cam_dev->v4l2_dev);
> 
> Same as above.
> 

Ditto.

dev_info(dev, "Register v4l2 device: %s", cam->v4l2_dev.name);

> > +
> > +	/* Initialize subdev media entity */
> > +	cam_dev->subdev_pads = devm_kcalloc(dev, num_subdev_pads,
> > +					    sizeof(*cam_dev->subdev_pads),
> > +					    GFP_KERNEL);
> > +	if (!cam_dev->subdev_pads) {
> > +		ret = -ENOMEM;
> > +		goto fail_subdev_pads;
> > +	}
> > +
> > +	ret = media_entity_pads_init(&cam_dev->subdev.entity,
> > +				     num_subdev_pads,
> > +				     cam_dev->subdev_pads);
> > +	if (ret) {
> > +		dev_err(dev, "failed initialize media pads:%d:\n", ret);
> 
> Stray ":" at the end of the message.
> 

Fixed in next patch.

> > +		goto fail_subdev_pads;
> > +	}
> > +
> > +	/* Initialize all pads with MEDIA_PAD_FL_SOURCE */
> > +	for (i = 0; i < num_subdev_pads; i++)
> > +		cam_dev->subdev_pads[i].flags = MEDIA_PAD_FL_SOURCE;
> > +
> > +	/* Customize the last one pad as CIO sink pad. */
> > +	cam_dev->subdev_pads[MTK_CAM_CIO_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
> > +
> > +	/* Initialize subdev */
> > +	v4l2_subdev_init(&cam_dev->subdev, &mtk_cam_subdev_ops);
> > +	cam_dev->subdev.entity.function = MEDIA_ENT_F_PROC_VIDEO_STATISTICS;
> > +	cam_dev->subdev.entity.ops = &mtk_cam_media_ops;
> > +	cam_dev->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE |
> > +				V4L2_SUBDEV_FL_HAS_EVENTS;
> > +	snprintf(cam_dev->subdev.name, sizeof(cam_dev->subdev.name),
> > +		 "%s", MTK_CAM_DEV_P1_NAME);
> > +	v4l2_set_subdevdata(&cam_dev->subdev, cam_dev);
> > +
> > +	ret = v4l2_device_register_subdev(&cam_dev->v4l2_dev, &cam_dev->subdev);
> > +	if (ret) {
> > +		dev_err(dev, "failed initialize subdev:%d\n", ret);
> > +		goto fail_subdev;
> > +	}
> > +	dev_info(dev, "register subdev: %s\n", cam_dev->subdev.name);
> > +
> > +	/* Create video nodes and links */
> > +	for (i = 0; i < MTK_CAM_P1_TOTAL_NODES; i++) {
> > +		ret = mtk_cam_video_register_device(cam_dev, i);
> > +		if (ret)
> > +			goto fail_video_register;
> > +	}
> > +
> > +	vb2_dma_contig_set_max_seg_size(dev, DMA_BIT_MASK(32));
> > +
> > +	return 0;
> > +
> > +fail_video_register:
> > +	i--;
> 
> This could be moved into the for clause, as the initialization statement.
> 

Fixed in next patch.

> > +	for (; i >= 0; i--) {
> 
> i is unsigned. Did this compile without warnings?
> 
> > +		video_unregister_device(&cam_dev->vdev_nodes[i].vdev);
> > +		media_entity_cleanup(&cam_dev->vdev_nodes[i].vdev.entity);
> > +		mutex_destroy(&cam_dev->vdev_nodes[i].lock);
> 
> Should we move this into mtk_cam_video_unregister_device() to be consistent
> with registration?
> 

Fixed in next patch.

> > +	}
> > +fail_subdev:
> > +	media_entity_cleanup(&cam_dev->subdev.entity);
> > +fail_subdev_pads:
> > +	v4l2_device_unregister(&cam_dev->v4l2_dev);
> > +fail_v4l2_dev:
> > +	dev_err(dev, "fail_v4l2_dev mdev: 0x%pK:%d", &cam_dev->media_dev, ret);
> 
> Please print errors only where they actually happen, not at the cleanup.
> 

Fixed in next patch.

> > +	media_device_unregister(&cam_dev->media_dev);
> > +	media_device_cleanup(&cam_dev->media_dev);
> > +
> > +	return ret;
> > +}
> > +
> > +static int mtk_cam_v4l2_unregister(struct mtk_cam_dev *cam_dev)
> > +{
> > +	unsigned int i;
> > +	struct mtk_cam_video_device *dev;
> 
> nit: Move the declaration inside the for loop, since the variable is only
> used there.
> 

Fixed in next patch.

> > +
> > +	for (i = 0; i < MTK_CAM_P1_TOTAL_NODES; i++) {
> > +		dev = &cam_dev->vdev_nodes[i];
> > +		video_unregister_device(&dev->vdev);
> > +		media_entity_cleanup(&dev->vdev.entity);
> > +		mutex_destroy(&dev->lock);
> > +		if (dev->desc.image)
> > +			v4l2_ctrl_handler_free(&dev->ctrl_handler);
> > +	}
> > +
> > +	vb2_dma_contig_clear_max_seg_size(&cam_dev->pdev->dev);
> > +
> > +	v4l2_device_unregister_subdev(&cam_dev->subdev);
> > +	media_entity_cleanup(&cam_dev->subdev.entity);
> > +	kfree(cam_dev->subdev_pads);
> 
> This was allocated using devm_kcalloc(), so no need to free it explicitly.
> 

Fixed in next patch.

> > +
> > +	v4l2_device_unregister(&cam_dev->v4l2_dev);
> > +	media_device_unregister(&cam_dev->media_dev);
> > +	media_device_cleanup(&cam_dev->media_dev);
> > +
> > +	return 0;
> > +}
> > +
> > +static int mtk_cam_dev_complete(struct v4l2_async_notifier *notifier)
> > +{
> > +	struct mtk_cam_dev *cam_dev =
> > +		container_of(notifier, struct mtk_cam_dev, notifier);
> > +	struct device *dev = &cam_dev->pdev->dev;
> > +	int ret;
> > +
> > +	ret = media_create_pad_link(&cam_dev->seninf->entity,
> > +				    MTK_CAM_CIO_PAD_SRC,
> > +				    &cam_dev->subdev.entity,
> > +				    MTK_CAM_CIO_PAD_SINK,
> > +				    0);
> > +	if (ret) {
> > +		dev_err(dev, "fail to create pad link %s %s err:%d\n",
> > +			cam_dev->seninf->entity.name,
> > +			cam_dev->subdev.entity.name,
> > +			ret);
> > +		return ret;
> > +	}
> > +
> > +	dev_info(dev, "Complete the v4l2 registration\n");
> 
> dev_dbg()
> 

Fixed in next patch.

> > +
> > +	ret = v4l2_device_register_subdev_nodes(&cam_dev->v4l2_dev);
> > +	if (ret) {
> > +		dev_err(dev, "failed initialize subdev nodes:%d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	return ret;
> > +}
> 
> Why not just put the contents of this function inside 
> mtk_cam_dev_notifier_complete()?
> 

Ok, we will mtk_cam_dev_complete() function and move its content into
mtk_cam_dev_notifier_complete().

> > +
> > +static int mtk_cam_dev_notifier_bound(struct v4l2_async_notifier *notifier,
> > +				      struct v4l2_subdev *sd,
> > +				      struct v4l2_async_subdev *asd)
> > +{
> > +	struct mtk_cam_dev *cam_dev =
> > +		container_of(notifier, struct mtk_cam_dev, notifier);
> > +
> 
> Should we somehow check that the entity we got is seninf indeed and there
> was no mistake in DT?
> 

How about to check the entity function of seninf device?

if (!(sd->entity.function & MEDIA_ENT_F_VID_IF_BRIDGE)) {
	dev_dbg(cam->dev, "No MEDIA_ENT_F_VID_IF_BRIDGE function\n");
		return -ENODEV;
}

If we need to check DT, may we need to implement this in parse_endpoint
callback function of v4l2_async_notifier_parse_fwnode_endpoints?

> > +	cam_dev->seninf = sd;
> > +	dev_info(&cam_dev->pdev->dev, "%s is bounded\n", sd->entity.name);
> 
> bound
> 
> Also please make this dev_dbg().
> 

Fixed in next patch.

> > +	return 0;
> > +}
> > +
> > +static void mtk_cam_dev_notifier_unbind(struct v4l2_async_notifier *notifier,
> > +					struct v4l2_subdev *sd,
> > +					struct v4l2_async_subdev *asd)
> > +{
> > +	struct mtk_cam_dev *cam_dev =
> > +		container_of(notifier, struct mtk_cam_dev, notifier);
> > +
> > +	cam_dev->seninf = NULL;
> > +	dev_dbg(&cam_dev->pdev->dev, "%s is unbounded\n", sd->entity.name);
> 
> unbound
> 

Fixed in next patch.

> > +}
> > +
> > +static int mtk_cam_dev_notifier_complete(struct v4l2_async_notifier *notifier)
> > +{
> > +	return mtk_cam_dev_complete(notifier);
> > +}
> > +
> > +static const struct v4l2_async_notifier_operations mtk_cam_async_ops = {
> > +	.bound = mtk_cam_dev_notifier_bound,
> > +	.unbind = mtk_cam_dev_notifier_unbind,
> > +	.complete = mtk_cam_dev_notifier_complete,
> > +};
> > +
> > +static int mtk_cam_v4l2_async_register(struct mtk_cam_dev *cam_dev)
> > +{
> > +	struct device *dev = &cam_dev->pdev->dev;
> > +	int ret;
> > +
> > +	ret = v4l2_async_notifier_parse_fwnode_endpoints(dev,
> > +		&cam_dev->notifier, sizeof(struct v4l2_async_subdev),
> > +		NULL);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (!cam_dev->notifier.num_subdevs)
> > +		return -ENODEV;
> 
> Could we print some error messages for the 2 cases above?
> 

Fixed in next patch.

> > +
> > +	cam_dev->notifier.ops = &mtk_cam_async_ops;
> > +	dev_info(&cam_dev->pdev->dev, "mtk_cam v4l2_async_notifier_register\n");
> 
> dev_dbg()
> 

Fixed in next patch.

> > +	ret = v4l2_async_notifier_register(&cam_dev->v4l2_dev,
> > +					   &cam_dev->notifier);
> > +	if (ret) {
> > +		dev_err(&cam_dev->pdev->dev,
> > +			"failed to register async notifier : %d\n", ret);
> > +		v4l2_async_notifier_cleanup(&cam_dev->notifier);
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> > +static void mtk_cam_v4l2_async_unregister(struct mtk_cam_dev *cam_dev)
> > +{
> > +	v4l2_async_notifier_unregister(&cam_dev->notifier);
> > +	v4l2_async_notifier_cleanup(&cam_dev->notifier);
> > +}
> > +
> > +static const struct v4l2_ioctl_ops mtk_cam_v4l2_vcap_ioctl_ops = {
> > +	.vidioc_querycap = mtk_cam_vidioc_querycap,
> > +	.vidioc_enum_framesizes = mtk_cam_vidioc_enum_framesizes,
> > +	.vidioc_enum_fmt_vid_cap_mplane = mtk_cam_vidioc_enum_fmt,
> > +	.vidioc_g_fmt_vid_cap_mplane = mtk_cam_vidioc_g_fmt,
> > +	.vidioc_s_fmt_vid_cap_mplane = mtk_cam_vidioc_s_fmt,
> > +	.vidioc_try_fmt_vid_cap_mplane = mtk_cam_vidioc_try_fmt,
> > +	.vidioc_enum_input = mtk_cam_vidioc_enum_input,
> > +	.vidioc_g_input = mtk_cam_vidioc_g_input,
> > +	.vidioc_s_input = mtk_cam_vidioc_s_input,
> 
> I don't think we need vidioc_*_input. At least the current implementation in
> this patch doesn't seem to do anything useful.
> 
> > +	/* buffer queue management */
> 
> Drop this comment, as it's obvious that the callbacks with "buf" in the name
> are related to buffers, there are some non-buffer callbacks below too (e.g.
> vidioc_subscribe_event) and also the other ops structs below don't have such
> comment.
> 

Fixed in next patch.

> > +	.vidioc_reqbufs = vb2_ioctl_reqbufs,
> > +	.vidioc_create_bufs = vb2_ioctl_create_bufs,
> > +	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
> > +	.vidioc_querybuf = vb2_ioctl_querybuf,
> > +	.vidioc_qbuf = vb2_ioctl_qbuf,
> > +	.vidioc_dqbuf = vb2_ioctl_dqbuf,
> > +	.vidioc_streamon = vb2_ioctl_streamon,
> > +	.vidioc_streamoff = vb2_ioctl_streamoff,
> > +	.vidioc_expbuf = vb2_ioctl_expbuf,
> > +	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
> > +	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
> > +};
> > +
> > +static const struct v4l2_ioctl_ops mtk_cam_v4l2_meta_cap_ioctl_ops = {
> > +	.vidioc_querycap = mtk_cam_vidioc_querycap,
> > +	.vidioc_enum_fmt_meta_cap = mtk_cam_vidioc_meta_enum_fmt,
> > +	.vidioc_g_fmt_meta_cap = mtk_cam_vidioc_g_meta_fmt,
> > +	.vidioc_s_fmt_meta_cap = mtk_cam_vidioc_g_meta_fmt,
> > +	.vidioc_try_fmt_meta_cap = mtk_cam_vidioc_g_meta_fmt,
> > +	.vidioc_reqbufs = vb2_ioctl_reqbufs,
> > +	.vidioc_create_bufs = vb2_ioctl_create_bufs,
> > +	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
> > +	.vidioc_querybuf = vb2_ioctl_querybuf,
> > +	.vidioc_qbuf = vb2_ioctl_qbuf,
> > +	.vidioc_dqbuf = vb2_ioctl_dqbuf,
> > +	.vidioc_streamon = vb2_ioctl_streamon,
> > +	.vidioc_streamoff = vb2_ioctl_streamoff,
> > +	.vidioc_expbuf = vb2_ioctl_expbuf,
> > +};
> > +
> > +static const struct v4l2_ioctl_ops mtk_cam_v4l2_meta_out_ioctl_ops = {
> > +	.vidioc_querycap = mtk_cam_vidioc_querycap,
> > +	.vidioc_enum_fmt_meta_out = mtk_cam_vidioc_meta_enum_fmt,
> > +	.vidioc_g_fmt_meta_out = mtk_cam_vidioc_g_meta_fmt,
> > +	.vidioc_s_fmt_meta_out = mtk_cam_vidioc_g_meta_fmt,
> > +	.vidioc_try_fmt_meta_out = mtk_cam_vidioc_g_meta_fmt,
> > +	.vidioc_reqbufs = vb2_ioctl_reqbufs,
> > +	.vidioc_create_bufs = vb2_ioctl_create_bufs,
> > +	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
> > +	.vidioc_querybuf = vb2_ioctl_querybuf,
> > +	.vidioc_qbuf = vb2_ioctl_qbuf,
> > +	.vidioc_dqbuf = vb2_ioctl_dqbuf,
> > +	.vidioc_streamon = vb2_ioctl_streamon,
> > +	.vidioc_streamoff = vb2_ioctl_streamoff,
> > +	.vidioc_expbuf = vb2_ioctl_expbuf,
> > +};
> > +
> > +static const struct v4l2_format meta_fmts[] = {
> > +	{
> > +		.fmt.meta = {
> > +			.dataformat = V4L2_META_FMT_MTISP_PARAMS,
> > +			.buffersize = 128 * PAGE_SIZE,
> 
> PAGE_SIZE is a weird unit for specifying generic buffer sizes. How about
> making it 512 * SZ_1K?
> 
> That said, it should normally be just sizeof(struct some_struct_used_here).
> 
> Same for the other entries below.
> 

ok, we will change the size unit from PAGE_SIZE to SZ_1K.
If we finalize the meta structures design, we may change to use sizeof.

> > +		},
> > +	},
> > +	{
> > +		.fmt.meta = {
> > +			.dataformat = V4L2_META_FMT_MTISP_3A,
> > +			.buffersize = 300 * PAGE_SIZE,
> > +		},
> > +	},
> > +	{
> > +		.fmt.meta = {
> > +			.dataformat = V4L2_META_FMT_MTISP_AF,
> > +			.buffersize = 160 * PAGE_SIZE,
> > +		},
> > +	},
> > +	{
> > +		.fmt.meta = {
> > +			.dataformat = V4L2_META_FMT_MTISP_LCS,
> > +			.buffersize = 72 * PAGE_SIZE,
> > +		},
> > +	},
> > +	{
> > +		.fmt.meta = {
> > +			.dataformat = V4L2_META_FMT_MTISP_LMV,
> > +			.buffersize = 256,
> > +		},
> > +	},
> > +};
> > +
> > +static const struct v4l2_format stream_out_fmts[] = {
> > +	{
> > +		.fmt.pix_mp = {
> > +			.width = IMG_MAX_WIDTH,
> > +			.height = IMG_MAX_HEIGHT,
> > +			.pixelformat = V4L2_PIX_FMT_MTISP_B8,
> > +			.field = V4L2_FIELD_NONE,
> > +			.colorspace = V4L2_COLORSPACE_SRGB,
> > +			.num_planes = 1,
> > +		},
> > +	},
> > +	{
> > +		.fmt.pix_mp = {
> > +			.width = IMG_MAX_WIDTH,
> > +			.height = IMG_MAX_HEIGHT,
> > +			.pixelformat = V4L2_PIX_FMT_MTISP_B10,
> > +			.field = V4L2_FIELD_NONE,
> > +			.colorspace = V4L2_COLORSPACE_SRGB,
> > +			.num_planes = 1,
> > +		},
> > +	},
> > +	{
> > +		.fmt.pix_mp = {
> > +			.width = IMG_MAX_WIDTH,
> > +			.height = IMG_MAX_HEIGHT,
> > +			.pixelformat = V4L2_PIX_FMT_MTISP_B12,
> > +			.field = V4L2_FIELD_NONE,
> > +			.colorspace = V4L2_COLORSPACE_SRGB,
> > +			.num_planes = 1,
> > +		},
> > +	},
> > +	{
> > +		.fmt.pix_mp = {
> > +			.width = IMG_MAX_WIDTH,
> > +			.height = IMG_MAX_HEIGHT,
> > +			.pixelformat = V4L2_PIX_FMT_MTISP_B14,
> > +			.field = V4L2_FIELD_NONE,
> > +			.colorspace = V4L2_COLORSPACE_SRGB,
> > +			.num_planes = 1,
> > +		},
> > +	},
> > +};
> > +
> > +static const struct v4l2_format bin_out_fmts[] = {
> > +	{
> > +		.fmt.pix_mp = {
> > +			.width = RRZ_MAX_WIDTH,
> > +			.height = RRZ_MAX_HEIGHT,
> > +			.pixelformat = V4L2_PIX_FMT_MTISP_F8,
> > +			.field = V4L2_FIELD_NONE,
> > +			.colorspace = V4L2_COLORSPACE_RAW,
> > +			.num_planes = 1,
> > +		},
> > +	},
> > +	{
> > +		.fmt.pix_mp = {
> > +			.width = RRZ_MAX_WIDTH,
> > +			.height = RRZ_MAX_HEIGHT,
> > +			.pixelformat = V4L2_PIX_FMT_MTISP_F10,
> > +			.field = V4L2_FIELD_NONE,
> > +			.colorspace = V4L2_COLORSPACE_RAW,
> > +			.num_planes = 1,
> > +		},
> > +	},
> > +	{
> > +		.fmt.pix_mp = {
> > +			.width = RRZ_MAX_WIDTH,
> > +			.height = RRZ_MAX_HEIGHT,
> > +			.pixelformat = V4L2_PIX_FMT_MTISP_F12,
> > +			.field = V4L2_FIELD_NONE,
> > +			.colorspace = V4L2_COLORSPACE_RAW,
> > +			.num_planes = 1,
> > +		},
> > +	},
> > +	{
> > +		.fmt.pix_mp = {
> > +			.width = RRZ_MAX_WIDTH,
> > +			.height = RRZ_MAX_HEIGHT,
> > +			.pixelformat = V4L2_PIX_FMT_MTISP_F14,
> > +			.field = V4L2_FIELD_NONE,
> > +			.colorspace = V4L2_COLORSPACE_RAW,
> > +			.num_planes = 1,
> > +		},
> > +	},
> > +};
> > +
> > +static const struct v4l2_frmsizeenum img_frm_size_nums[] = {
> > +	{
> > +		.index = 0,
> > +		.type = V4L2_FRMSIZE_TYPE_CONTINUOUS,
> > +		.stepwise = {
> > +			.max_width = IMG_MAX_WIDTH,
> > +			.min_width = IMG_MIN_WIDTH,
> > +			.max_height = IMG_MAX_HEIGHT,
> > +			.min_height = IMG_MIN_HEIGHT,
> > +			.step_height = 1,
> > +			.step_width = 1,
> > +		},
> > +	},
> > +	{
> > +		.index = 0,
> > +		.type = V4L2_FRMSIZE_TYPE_CONTINUOUS,
> > +		.stepwise = {
> > +			.max_width = RRZ_MAX_WIDTH,
> > +			.min_width = RRZ_MIN_WIDTH,
> > +			.max_height = RRZ_MAX_HEIGHT,
> > +			.min_height = RRZ_MIN_HEIGHT,
> > +			.step_height = 1,
> > +			.step_width = 1,
> > +		},
> > +	},
> > +};
> > +
> > +static const struct
> > +mtk_cam_dev_node_desc output_queues[MTK_CAM_P1_TOTAL_OUTPUT] = {
> > +	{
> > +		.id = MTK_CAM_P1_META_IN_0,
> > +		.name = "meta input",
> > +		.description = "ISP tuning parameters",
> > +		.cap = V4L2_CAP_META_OUTPUT,
> > +		.buf_type = V4L2_BUF_TYPE_META_OUTPUT,
> > +		.link_flags = 0,
> > +		.capture = false,
> > +		.image = false,
> > +		.smem_alloc = true,
> > +		.fmts = meta_fmts,
> > +		.num_fmts = ARRAY_SIZE(meta_fmts),
> > +		.default_fmt_idx = 0,
> > +		.max_buf_count = 10,
> > +		.ioctl_ops = &mtk_cam_v4l2_meta_out_ioctl_ops,
> > +	},
> > +};
> > +
> > +static const struct
> > +mtk_cam_dev_node_desc capture_queues[MTK_CAM_P1_TOTAL_CAPTURE] = {
> > +	{
> > +		.id = MTK_CAM_P1_MAIN_STREAM_OUT,
> > +		.name = "main stream",
> > +		.cap = V4L2_CAP_VIDEO_CAPTURE_MPLANE,
> > +		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
> > +		.link_flags = 0,
> > +		.capture = true,
> > +		.image = true,
> > +		.smem_alloc = false,
> > +		.dma_port = R_IMGO,
> > +		.fmts = stream_out_fmts,
> > +		.num_fmts = ARRAY_SIZE(stream_out_fmts),
> > +		.default_fmt_idx = 1,
> 
> Why not just make it always 0 and move the default format to the beginning
> of stream_out_fmts[]?
> 

Fixed in next patch.

> > +		.ioctl_ops = &mtk_cam_v4l2_vcap_ioctl_ops,
> > +		.frmsizes = &img_frm_size_nums[0],
> 
> nit: If you only need to point to these data once, you could define them in
> place, as a compound literal, like
> 

Fixed in next patch.

> >                 .frmsizes = &(struct v4l2_framesizeenum) {
> >                         // initialize here
> >                 },
> 

Ditto

> > +	},
> > +	{
> > +		.id = MTK_CAM_P1_PACKED_BIN_OUT,
> > +		.name = "packed out",
> > +		.cap = V4L2_CAP_VIDEO_CAPTURE_MPLANE,
> > +		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
> > +		.link_flags = 0,
> > +		.capture = true,
> > +		.image = true,
> > +		.smem_alloc = false,
> > +		.dma_port = R_RRZO,
> > +		.fmts = bin_out_fmts,
> > +		.num_fmts = ARRAY_SIZE(bin_out_fmts),
> > +		.default_fmt_idx = 1,
> > +		.ioctl_ops = &mtk_cam_v4l2_vcap_ioctl_ops,
> > +		.frmsizes = &img_frm_size_nums[1],
> > +	},
> > +	{
> > +		.id = MTK_CAM_P1_META_OUT_0,
> > +		.name = "partial meta 0",
> > +		.description = "AE/AWB histogram",
> > +		.cap = V4L2_CAP_META_CAPTURE,
> > +		.buf_type = V4L2_BUF_TYPE_META_CAPTURE,
> > +		.link_flags = 0,
> > +		.capture = true,
> > +		.image = false,
> > +		.smem_alloc = false,
> > +		.dma_port = R_AAO | R_FLKO | R_PSO,
> > +		.fmts = meta_fmts,
> > +		.num_fmts = ARRAY_SIZE(meta_fmts),
> > +		.default_fmt_idx = 1,
> > +		.max_buf_count = 5,
> > +		.ioctl_ops = &mtk_cam_v4l2_meta_cap_ioctl_ops,
> > +	},
> > +	{
> > +		.id = MTK_CAM_P1_META_OUT_1,
> > +		.name = "partial meta 1",
> > +		.description = "AF histogram",
> > +		.cap = V4L2_CAP_META_CAPTURE,
> > +		.buf_type = V4L2_BUF_TYPE_META_CAPTURE,
> > +		.link_flags = 0,
> > +		.capture = true,
> > +		.image = false,
> > +		.smem_alloc = false,
> > +		.dma_port = R_AFO,
> > +		.fmts = meta_fmts,
> > +		.num_fmts = ARRAY_SIZE(meta_fmts),
> > +		.default_fmt_idx = 2,
> > +		.max_buf_count = 5,
> > +		.ioctl_ops = &mtk_cam_v4l2_meta_cap_ioctl_ops,
> > +	},
> > +	{
> > +		.id = MTK_CAM_P1_META_OUT_2,
> > +		.name = "partial meta 2",
> > +		.description = "Local contrast enhanced statistics",
> > +		.cap = V4L2_CAP_META_CAPTURE,
> > +		.buf_type = V4L2_BUF_TYPE_META_CAPTURE,
> > +		.link_flags = 0,
> > +		.capture = true,
> > +		.image = false,
> > +		.smem_alloc = false,
> > +		.dma_port = R_LCSO,
> > +		.fmts = meta_fmts,
> > +		.num_fmts = ARRAY_SIZE(meta_fmts),
> > +		.default_fmt_idx = 3,
> > +		.max_buf_count = 10,
> > +		.ioctl_ops = &mtk_cam_v4l2_meta_cap_ioctl_ops,
> > +	},
> > +	{
> > +		.id = MTK_CAM_P1_META_OUT_3,
> > +		.name = "partial meta 3",
> > +		.description = "Local motion vector histogram",
> > +		.cap = V4L2_CAP_META_CAPTURE,
> > +		.buf_type = V4L2_BUF_TYPE_META_CAPTURE,
> > +		.link_flags = 0,
> 
> link_flags seems to be 0 for all nodes.
> 

Ditto.

> > +		.capture = true,
> 
> We already know this from .buf_type. We can check using the
> V4L2_TYPE_IS_OUTPUT() macro.
> 

Ditto.

> > +		.image = false,
> > +		.smem_alloc = false,
> > +		.dma_port = R_LMVO,
> > +		.fmts = meta_fmts,
> > +		.num_fmts = ARRAY_SIZE(meta_fmts),
> 
> I don't think this is correct. The description suggests one specific format
> (local motion vector histogram), so the queue should probably be hardwired
> to that format?
> 

Yes, we will set num_fmts = 1 for meta nodes.

> > +		.default_fmt_idx = 4,
> > +		.max_buf_count = 10,
> 
> Where does this number come from?
> 

The default maximum VB2 buffer count is 32.
In order to limit memory usage, we like to limit the maximum buffer
counts in the driver layer. The maximum buffer count is estimated
according to our camera MW.

#define VB2_MAX_FRAME	(32)

> > +		.ioctl_ops = &mtk_cam_v4l2_meta_cap_ioctl_ops,
> > +	},
> > +};
> > +
> > +/* The helper to configure the device context */
> > +static void mtk_cam_dev_queue_setup(struct mtk_cam_dev *cam_dev)
> > +{
> > +	unsigned int i, node_idx;
> > +
> > +	node_idx = 0;
> > +
> > +	/* Setup the output queue */
> > +	for (i = 0; i < MTK_CAM_P1_TOTAL_OUTPUT; i++)
> 
> < ARRAY_SIZE(output_queues)
> 

Fixed in next patch.

> > +		cam_dev->vdev_nodes[node_idx++].desc = output_queues[i];
> > +
> > +	/* Setup the capture queue */
> > +	for (i = 0; i < MTK_CAM_P1_TOTAL_CAPTURE; i++)
> 
> < ARRAY_SIZE(capture_queues)
> 

Fixed in next patch.

> > +		cam_dev->vdev_nodes[node_idx++].desc = capture_queues[i];
> > +}
> > +
> > +int mtk_cam_dev_init(struct platform_device *pdev,
> > +		     struct mtk_cam_dev *cam_dev)
> > +{
> > +	int ret;
> > +
> > +	cam_dev->pdev = pdev;
> 
> Do we need this additional mtk_cam_dev struct? Couldn't we just use
> mtk_isp_p1 here?
> 

We remove pdev field and add dev field in mtk_cam_dev struct.

> > +	mtk_cam_dev_queue_setup(cam_dev);
> > +	/* v4l2 sub-device registration */
> > +
> > +	dev_dbg(&cam_dev->pdev->dev, "mem2mem2.name: %s\n",
> > +		MTK_CAM_DEV_P1_NAME);
> 
> This debugging message doesn't seem very useful. Please remove.
> 

Fixed in next patch.

> > +	ret = mtk_cam_mem2mem2_v4l2_register(cam_dev);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = mtk_cam_v4l2_async_register(cam_dev);
> > +	if (ret) {
> > +		mtk_cam_v4l2_unregister(cam_dev);
> 
> Please use an error path on the bottom of the function instead. With goto
> labels named after the next clean-up step that needs to be performed.
> 

Fixed in next patch.

> > +		return ret;
> > +	}
> > +
> > +	spin_lock_init(&cam_dev->req_lock);
> > +	INIT_LIST_HEAD(&cam_dev->req_list);
> > +	mutex_init(&cam_dev->lock);
> > +
> > +	return 0;
> > +}
> > +
> > +int mtk_cam_dev_release(struct platform_device *pdev,
> 
> "release" is normally used for file_operations. How about "cleanup"?
> 

Fixed in next patch.

> > +			struct mtk_cam_dev *cam_dev)
> > +{
> > +	mtk_cam_v4l2_async_unregister(cam_dev);
> > +	mtk_cam_v4l2_unregister(cam_dev);
> > +
> > +	mutex_destroy(&cam_dev->lock);
> > +
> > +	return 0;
> > +}
> 
> I'd suggest moving any generic API implementation code (platform_device,
> V4L2, VB2, Media Controller, etc.) to mtk_cam.c and then moving any low
> level hardware/firmware-related code from mtk_cam.c and mtk_cam-scp.c to
> mtk_cam_hw.c.
> 

Fixed in next patch.

> > +
> diff --git a/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-v4l2-util.h b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-v4l2-util.h
> new file mode 100644
> index 000000000000..825cdf20643a
> > --- /dev/null
> > +++ b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-v4l2-util.h
> @@ -0,0 +1,173 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (c) 2018 MediaTek Inc.
> > + */
> > +
> > +#ifndef __MTK_CAM_DEV_V4L2_H__
> > +#define __MTK_CAM_DEV_V4L2_H__
> > +
> > +#include <linux/device.h>
> > +#include <linux/types.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/spinlock.h>
> > +#include <linux/videodev2.h>
> > +#include <media/v4l2-device.h>
> > +#include <media/v4l2-ctrls.h>
> > +#include <media/v4l2-subdev.h>
> > +#include <media/videobuf2-core.h>
> > +#include <media/videobuf2-v4l2.h>
> > +
> > +#define MTK_CAM_DEV_P1_NAME			"MTK-ISP-P1-V4L2"
> 
> Maybe it's not a critical thing, but generally it's a good practice to just
> explicitly specific this name somewhere, e.g. struct
> platform_driver::driver::name and then just refer to dev_driver_name(). It
> makes it easier to make sure that the name stays the same everywhere.
> 

Fixed in next patch.

> > +
> > +#define MTK_CAM_P1_META_IN_0			0
> > +#define MTK_CAM_P1_TOTAL_OUTPUT		1
> 
> Since these are just some utility definitions, we can use enum instead of
> assigning the values by hand.
> 

We will revise these definitions as below.

/* ID enum value for struct mtk_cam_dev_node_desc:id */
enum  {
	MTK_CAM_P1_META_IN_0 = 0,
	MTK_CAM_P1_MAIN_STREAM_OUT,
	MTK_CAM_P1_PACKED_BIN_OUT,
	MTK_CAM_P1_META_OUT_0,
	MTK_CAM_P1_META_OUT_1,
	MTK_CAM_P1_META_OUT_2,
	MTK_CAM_P1_META_OUT_3,
	MTK_CAM_P1_TOTAL_NODES
};

> > +
> > +#define MTK_CAM_P1_MAIN_STREAM_OUT		1
> > +#define MTK_CAM_P1_PACKED_BIN_OUT		2
> > +#define MTK_CAM_P1_META_OUT_0			3
> > +#define MTK_CAM_P1_META_OUT_1			4
> > +#define MTK_CAM_P1_META_OUT_2			5
> > +#define MTK_CAM_P1_META_OUT_3			6
> > +#define MTK_CAM_P1_TOTAL_CAPTURE		6
> 
> Ditto.
> 

Ditto.

> > +
> > +#define MTK_CAM_P1_TOTAL_NODES			7
> 
> Please just add the two totals together rather than manually specifying the
> value.
> 

Ditto.

> > +
> > +struct mtk_cam_dev_request {
> > +	struct media_request	req;
> > +	struct list_head	list;
> > +};
> > +
> > +struct mtk_cam_dev_buffer {
> > +	struct vb2_v4l2_buffer	vbb;
> > +	struct list_head	list;
> > +	/* Intenal part */
> > +	dma_addr_t		daddr;
> > +	dma_addr_t		scp_addr;
> > +	unsigned int		node_id;
> > +};
> 
> Could you add kerneldoc comments for the 2 structs?
> 

Fixed in next patch.

> > +
> > +/*
> > + * struct mtk_cam_dev_node_desc - node attributes
> > + *
> > + * @id:		 id of the context queue
> > + * @name:	 media entity name
> > + * @description: descritpion of node
> > + * @cap:	 mapped to V4L2 capabilities
> > + * @buf_type:	 mapped to V4L2 buffer type
> > + * @dma_port:	 the dma port associated to the buffer
> > + * @link_flags:	 default media link flags
> > + * @smem_alloc:	 using the cam_smem_drv as alloc ctx or not
> > + * @capture:	 true for capture queue (device to user)
> > + *		 false for output queue (from user to device)
> > + * @image:	 true for image node, false for meta node
> > + * @num_fmts:	 the number of supported formats
> > + * @default_fmt_idx: default format of this node
> > + * @max_buf_count: maximum V4L2 buffer count
> > + * @ioctl_ops:  mapped to v4l2_ioctl_ops
> > + * @fmts:	supported format
> > + * @frmsizes:	supported frame size number
> > + *
> > + */
> > +struct mtk_cam_dev_node_desc {
> > +	u8 id;
> > +	char *name;
> > +	char *description;
> > +	u32 cap;
> > +	u32 buf_type;
> > +	u32 dma_port;
> > +	u32 link_flags;
> > +	u8 smem_alloc:1;
> > +	u8 capture:1;
> > +	u8 image:1;
> > +	u8 num_fmts;
> > +	u8 default_fmt_idx;
> > +	u8 max_buf_count;
> > +	const struct v4l2_ioctl_ops *ioctl_ops;
> > +	const struct v4l2_format *fmts;
> > +	const struct v4l2_frmsizeenum *frmsizes;
> > +};
> > +
> > +/*
> > + * struct mtk_cam_video_device - Mediatek video device structure.
> > + *
> > + * @id:		Id for mtk_cam_dev_node_desc or mem2mem2_nodes array
> > + * @enabled:	Indicate the device is enabled or not
> > + * @vdev_fmt:	The V4L2 format of video device
> > + * @vdev_apd:	The media pad graph object of video device
> 
> vdev_pad?
> 
> > + * @vbq:	A videobuf queue of video device
> > + * @desc:	The node attributes of video device
> > + * @ctrl_handler:	The control handler of video device
> > + * @pending_list:	List for pending buffers before enqueuing into driver
> > + * @lock:	Serializes vb2 queue and video device operations.
> > + * @slock:	Protect for pending_list.
> > + *
> 
> Please fix the order of the documentation to match the order of the struct.
> 

Fixed in next patch.

> > + */
> > +struct mtk_cam_video_device {
> > +	unsigned int id;
> > +	unsigned int enabled;
> > +	struct v4l2_format vdev_fmt;
> > +	struct mtk_cam_dev_node_desc desc;
> > +	struct video_device vdev;
> 
> Not documented above.
> 

Fixed in next patch.

> > +	struct media_pad vdev_pad;
> > +	struct vb2_queue vbq;
> > +	struct v4l2_ctrl_handler ctrl_handler;
> > +	struct list_head pending_list;
> > +	/* Used for vbq & vdev */
> 
> It's already documented in the kerneldoc comment.
> 

Fixed in next patch.
Btw, if we remove this, we will got complain from checkpatch.pl script.

> > +	struct mutex lock;
> > +	/* protect for pending_list */
> 
> It's already documented in the kerneldoc comment.
> 

Ditto.

> > +	spinlock_t slock;
> 
> How about calling it pending_list_lock?
> 

We will rename to buf_list to track all en-queue buffers in this video
node.

struct mtk_cam_video_device {
	unsigned int id;
	unsigned int enabled;
	struct v4l2_format vdev_fmt;
	struct mtk_cam_dev_node_desc desc;
	struct video_device vdev;
	struct media_pad vdev_pad;
	struct vb2_queue vbq;
	struct v4l2_ctrl_handler ctrl_handler;
	struct list_head buf_list;
	struct mutex lock;
	spinlock_t buf_list_lock;
};

> > +};
> > +
> > +/*
> > + * struct mtk_cam_dev - Mediatek camera device structure.
> > + *
> > + * @pdev:	Pointer to platform device
> > + * @smem_pdev:	Pointer to shared memory platform device
> > + * @pipeline:	Media pipeline information
> > + * @media_dev:	Media device
> > + * @subdev:	The V4L2 sub-device
> > + * @v4l2_dev:	The V4L2 device driver
> > + * @notifier:	The v4l2_device notifier data
> > + * @subdev_pads: Pointer to the number of media pads of this sub-device
> > + * @ctrl_handler: The control handler
> > + * @vdev_nodes: The array list of mtk_cam_video_device nodes
> > + * @seninf:	Pointer to the seninf sub-device
> > + * @sensor:	Pointer to the active sensor V4L2 sub-device when streaming on
> > + * @lock:       The mutex protecting video device open/release operations
> > + * @streaming:	Indicate the overall streaming status is on or off
> > + * @streamed_node_count: The number of V4L2 video device nodes are streaming on
> > + * @req_list:	Lins to keep media requests before streaming on
> > + * @req_lock:	Protect the req_list data
> > + *
> > + * Below is the graph topology for Camera IO connection.
> > + * sensor 1 (main) --> sensor IF --> P1 sub-device
> > + * sensor 2 (sub)  -->
> 
> This probably isn't the best place for graph topology description. I think
> we actually want a separate documentation file for this, similar to
> Documentation/media/v4l-drivers/ipu3.rst.
> 

Ok, we will drop our graph topology comment & discuss how to come out
another separate document.

> > + *
> > + */
> > +struct mtk_cam_dev {
> > +	struct platform_device *pdev;
> > +	struct device *smem_dev;
> > +	struct media_pipeline pipeline;
> > +	struct media_device media_dev;
> > +	struct v4l2_subdev subdev;
> > +	struct v4l2_device v4l2_dev;
> > +	struct v4l2_async_notifier notifier;
> > +	struct media_pad *subdev_pads;
> > +	struct v4l2_ctrl_handler ctrl_handler;
> > +	struct mtk_cam_video_device vdev_nodes[MTK_CAM_P1_TOTAL_NODES];
> > +	struct v4l2_subdev *seninf;
> > +	struct v4l2_subdev *sensor;
> > +	/* protect video device open/release operations */
> 
> It's already documented in the kerneldoc comment.
> 

Fixed in next patch.

> > +	struct mutex lock;
> > +	unsigned int streaming:1;
> > +	atomic_t streamed_node_count;
> > +	struct list_head req_list;
> > +	/* protect for req_list */
> 
> It's already documented in the kerneldoc comment.
> 

Fixed in next patch.

> > +	spinlock_t req_lock;
> 
> How about calling it req_list_lock?
> 

Below is new mtk_cam_dev structure.
We will use job to handle request.

struct mtk_cam_dev {
	struct device *dev;
	struct device *smem_dev;
	struct media_pipeline pipeline;
	struct media_device media_dev;
	struct v4l2_subdev subdev;
	struct v4l2_device v4l2_dev;
	struct v4l2_async_notifier notifier;
	struct media_pad *subdev_pads;
	struct v4l2_ctrl_handler ctrl_handler;
	struct mtk_cam_video_device vdev_nodes[MTK_CAM_P1_TOTAL_NODES];
	struct v4l2_subdev *seninf;
	struct v4l2_subdev *sensor;
	struct mutex lock;
	unsigned int streaming:1;
	unsigned int enabled_dmas;
	unsigned int enabled_node_count;
	atomic_t streamed_node_count;
	struct list_head pending_job_list;
	spinlock_t pending_job_lock;
	struct list_head running_job_list;
	spinlock_t running_job_lock;
	atomic_t running_job_count;
};


> Best regards,
> Tomasz
> 

Thanks again for your many inputs on this patch.
It is helpful for us.

Best regards,

Jungo



