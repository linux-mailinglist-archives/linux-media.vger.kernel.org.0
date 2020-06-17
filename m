Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E6CF1FCBB9
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2020 13:05:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726303AbgFQLF0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Jun 2020 07:05:26 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48834 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725536AbgFQLF0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Jun 2020 07:05:26 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 78216F9;
        Wed, 17 Jun 2020 13:05:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592391922;
        bh=vl4Xr7NTQnsxBCEA2RPEbytStYOmyy1jUDMCl+0nJ9w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PXADL7P8CPzlH1r9oDlc7Mf0cGtzmLZClAVNfIr2LLEWQZTr+IaJZiYPHoJ0LgCCF
         1WTFc3NWpj7TF5RGmfrZ1QDDkJGTK7ydQ2oUIisjBP8xDSU58t0xafqHG27dnxEaBy
         dbDYfzM0+uXt4HGOJJ7LvQIH9QKHHAYjFpagLbgY=
Date:   Wed, 17 Jun 2020 14:04:59 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: Re: [PATCH v1 036/107] media: ti-vpe: cal: Reorganize remaining code
 in sections
Message-ID: <20200617110459.GD5838@pendragon.ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
 <20200614235944.17716-37-laurent.pinchart@ideasonboard.com>
 <a007b062-37b2-2088-7600-0b9f3fa5ab12@ideasonboard.com>
 <20200617105135.GC5838@pendragon.ideasonboard.com>
 <47ea4ce5-7bf2-40f0-a34a-aad229f67890@ideasonboard.com>
 <fb2fadf7-3742-274f-5de9-0771631b08de@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fb2fadf7-3742-274f-5de9-0771631b08de@ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

On Wed, Jun 17, 2020 at 12:01:39PM +0100, Kieran Bingham wrote:
> On 17/06/2020 11:54, Kieran Bingham wrote:
> > On 17/06/2020 11:51, Laurent Pinchart wrote:
> >> On Wed, Jun 17, 2020 at 11:00:31AM +0100, Kieran Bingham wrote:
> >>> On 15/06/2020 00:58, Laurent Pinchart wrote:
> >>>> Increase readability by reorganizing the remaining code in sections. No
> >>>> functional change is included.
> >>>>
> >>>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>>> ---
> >>>>  drivers/media/platform/ti-vpe/cal.c | 350 +++++++++++++++-------------
> >>>>  1 file changed, 187 insertions(+), 163 deletions(-)
> >>>>
> >>>> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> >>>> index 176f616033a1..6f33853ecdb2 100644
> >>>> --- a/drivers/media/platform/ti-vpe/cal.c
> >>>> +++ b/drivers/media/platform/ti-vpe/cal.c
> >>>> @@ -37,9 +37,6 @@
> >>>>  
> >>>>  #define CAL_MODULE_NAME "cal"
> >>>>  
> >>>> -#define MAX_WIDTH_BYTES (8192 * 8)
> >>>> -#define MAX_HEIGHT_LINES 16383
> >>>> -
> >>>>  MODULE_DESCRIPTION("TI CAL driver");
> >>>>  MODULE_AUTHOR("Benoit Parrot, <bparrot@ti.com>");
> >>>>  MODULE_LICENSE("GPL v2");
> >>>> @@ -79,11 +76,11 @@ MODULE_PARM_DESC(debug, "activates debug info");
> >>>>  
> >>>>  #define CAL_NUM_CONTEXT 2
> >>>>  
> >>>> -#define reg_read(dev, offset) ioread32(dev->base + offset)
> >>>> -#define reg_write(dev, offset, val) iowrite32(val, dev->base + offset)
> >>>> +#define MAX_WIDTH_BYTES (8192 * 8)
> >>>> +#define MAX_HEIGHT_LINES 16383
> >>>>  
> >>>>  /* ------------------------------------------------------------------
> >>>> - *	Basic structures
> >>>> + *	Format Handling
> >>>>   * ------------------------------------------------------------------
> >>>>   */
> >>>>  
> >>>> @@ -204,6 +201,11 @@ static char *fourcc_to_str(u32 fmt)
> >>>>  	return code;
> >>>>  }
> >>>>  
> >>>> +/* ------------------------------------------------------------------
> >>>> + *	Driver Structures
> >>>> + * ------------------------------------------------------------------
> >>>> + */
> >>>> +
> >>>>  /* buffer for one video frame */
> >>>>  struct cal_buffer {
> >>>>  	/* common v4l buffer stuff -- must be first */
> >>>> @@ -239,80 +241,6 @@ struct cal_data {
> >>>>  	unsigned int flags;
> >>>>  };
> >>>>  
> >>>> -static const struct cal_camerarx_data dra72x_cal_camerarx[] = {
> >>>> -	{
> >>>> -		.fields = {
> >>>> -			[F_CTRLCLKEN] = { 10, 10 },
> >>>> -			[F_CAMMODE] = { 11, 12 },
> >>>> -			[F_LANEENABLE] = { 13, 16 },
> >>>> -			[F_CSI_MODE] = { 17, 17 },
> >>>> -		},
> >>>> -		.num_lanes = 4,
> >>>> -	},
> >>>> -	{
> >>>> -		.fields = {
> >>>> -			[F_CTRLCLKEN] = { 0, 0 },
> >>>> -			[F_CAMMODE] = { 1, 2 },
> >>>> -			[F_LANEENABLE] = { 3, 4 },
> >>>> -			[F_CSI_MODE] = { 5, 5 },
> >>>> -		},
> >>>> -		.num_lanes = 2,
> >>>> -	},
> >>>> -};
> >>>> -
> >>>> -static const struct cal_data dra72x_cal_data = {
> >>>> -	.camerarx = dra72x_cal_camerarx,
> >>>> -	.num_csi2_phy = ARRAY_SIZE(dra72x_cal_camerarx),
> >>>> -};
> >>>> -
> >>>> -static const struct cal_data dra72x_es1_cal_data = {
> >>>> -	.camerarx = dra72x_cal_camerarx,
> >>>> -	.num_csi2_phy = ARRAY_SIZE(dra72x_cal_camerarx),
> >>>> -	.flags = DRA72_CAL_PRE_ES2_LDO_DISABLE,
> >>>> -};
> >>>> -
> >>>> -static const struct cal_camerarx_data dra76x_cal_csi_phy[] = {
> >>>> -	{
> >>>> -		.fields = {
> >>>> -			[F_CTRLCLKEN] = { 8, 8 },
> >>>> -			[F_CAMMODE] = { 9, 10 },
> >>>> -			[F_CSI_MODE] = { 11, 11 },
> >>>> -			[F_LANEENABLE] = { 27, 31 },
> >>>> -		},
> >>>> -		.num_lanes = 5,
> >>>> -	},
> >>>> -	{
> >>>> -		.fields = {
> >>>> -			[F_CTRLCLKEN] = { 0, 0 },
> >>>> -			[F_CAMMODE] = { 1, 2 },
> >>>> -			[F_CSI_MODE] = { 3, 3 },
> >>>> -			[F_LANEENABLE] = { 24, 26 },
> >>>> -		},
> >>>> -		.num_lanes = 3,
> >>>> -	},
> >>>> -};
> >>>> -
> >>>> -static const struct cal_data dra76x_cal_data = {
> >>>> -	.camerarx = dra76x_cal_csi_phy,
> >>>> -	.num_csi2_phy = ARRAY_SIZE(dra76x_cal_csi_phy),
> >>>> -};
> >>>> -
> >>>> -static const struct cal_camerarx_data am654_cal_csi_phy[] = {
> >>>> -	{
> >>>> -		.fields = {
> >>>> -			[F_CTRLCLKEN] = { 15, 15 },
> >>>> -			[F_CAMMODE] = { 24, 25 },
> >>>> -			[F_LANEENABLE] = { 0, 4 },
> >>>> -		},
> >>>> -		.num_lanes = 5,
> >>>> -	},
> >>>> -};
> >>>> -
> >>>> -static const struct cal_data am654_cal_data = {
> >>>> -	.camerarx = am654_cal_csi_phy,
> >>>> -	.num_csi2_phy = ARRAY_SIZE(am654_cal_csi_phy),
> >>>> -};
> >>>> -
> >>>>  /*
> >>>>   * The Camera Adaptation Layer (CAL) module is paired with one or more complex
> >>>>   * I/O PHYs (CAMERARX). It contains multiple instances of CSI-2, processing and
> >>>> @@ -408,6 +336,98 @@ struct cal_ctx {
> >>>>  	bool dma_act;
> >>>>  };
> >>>>  
> >>>> +static inline struct cal_ctx *notifier_to_ctx(struct v4l2_async_notifier *n)
> >>>> +{
> >>>> +	return container_of(n, struct cal_ctx, notifier);
> >>>> +}
> >>>> +
> >>>> +/* ------------------------------------------------------------------
> >>>> + *	Platform Data
> >>>> + * ------------------------------------------------------------------
> >>>> + */
> >>>> +
> >>>> +static const struct cal_camerarx_data dra72x_cal_camerarx[] = {
> >>>> +	{
> >>>> +		.fields = {
> >>>> +			[F_CTRLCLKEN] = { 10, 10 },
> >>>> +			[F_CAMMODE] = { 11, 12 },
> >>>> +			[F_LANEENABLE] = { 13, 16 },
> >>>> +			[F_CSI_MODE] = { 17, 17 },
> >>>> +		},
> >>>> +		.num_lanes = 4,
> >>>> +	},
> >>>> +	{
> >>>> +		.fields = {
> >>>> +			[F_CTRLCLKEN] = { 0, 0 },
> >>>> +			[F_CAMMODE] = { 1, 2 },
> >>>> +			[F_LANEENABLE] = { 3, 4 },
> >>>> +			[F_CSI_MODE] = { 5, 5 },
> >>>> +		},
> >>>> +		.num_lanes = 2,
> >>>> +	},
> >>>> +};
> >>>> +
> >>>> +static const struct cal_data dra72x_cal_data = {
> >>>> +	.camerarx = dra72x_cal_camerarx,
> >>>> +	.num_csi2_phy = ARRAY_SIZE(dra72x_cal_camerarx),
> >>>> +};
> >>>> +
> >>>> +static const struct cal_data dra72x_es1_cal_data = {
> >>>> +	.camerarx = dra72x_cal_camerarx,
> >>>> +	.num_csi2_phy = ARRAY_SIZE(dra72x_cal_camerarx),
> >>>> +	.flags = DRA72_CAL_PRE_ES2_LDO_DISABLE,
> >>>> +};
> >>>> +
> >>>> +static const struct cal_camerarx_data dra76x_cal_csi_phy[] = {
> >>>> +	{
> >>>> +		.fields = {
> >>>> +			[F_CTRLCLKEN] = { 8, 8 },
> >>>> +			[F_CAMMODE] = { 9, 10 },
> >>>> +			[F_CSI_MODE] = { 11, 11 },
> >>>> +			[F_LANEENABLE] = { 27, 31 },
> >>>> +		},
> >>>> +		.num_lanes = 5,
> >>>> +	},
> >>>> +	{
> >>>> +		.fields = {
> >>>> +			[F_CTRLCLKEN] = { 0, 0 },
> >>>> +			[F_CAMMODE] = { 1, 2 },
> >>>> +			[F_CSI_MODE] = { 3, 3 },
> >>>> +			[F_LANEENABLE] = { 24, 26 },
> >>>> +		},
> >>>> +		.num_lanes = 3,
> >>>> +	},
> >>>> +};
> >>>> +
> >>>> +static const struct cal_data dra76x_cal_data = {
> >>>> +	.camerarx = dra76x_cal_csi_phy,
> >>>> +	.num_csi2_phy = ARRAY_SIZE(dra76x_cal_csi_phy),
> >>>> +};
> >>>> +
> >>>> +static const struct cal_camerarx_data am654_cal_csi_phy[] = {
> >>>> +	{
> >>>> +		.fields = {
> >>>> +			[F_CTRLCLKEN] = { 15, 15 },
> >>>> +			[F_CAMMODE] = { 24, 25 },
> >>>> +			[F_LANEENABLE] = { 0, 4 },
> >>>> +		},
> >>>> +		.num_lanes = 5,
> >>>> +	},
> >>>> +};
> >>>> +
> >>>> +static const struct cal_data am654_cal_data = {
> >>>> +	.camerarx = am654_cal_csi_phy,
> >>>> +	.num_csi2_phy = ARRAY_SIZE(am654_cal_csi_phy),
> >>>> +};
> >>>> +
> >>>> +/* ------------------------------------------------------------------
> >>>> + *	I/O Register Accessors
> >>>> + * ------------------------------------------------------------------
> >>>> + */
> >>>> +
> >>>> +#define reg_read(dev, offset) ioread32(dev->base + offset)
> >>>> +#define reg_write(dev, offset, val) iowrite32(val, dev->base + offset)
> >>>> +
> >>>>  static inline u32 reg_read_field(struct cal_dev *cal, u32 offset, u32 mask)
> >>>>  {
> >>>>  	return FIELD_GET(mask, reg_read(cal, offset));
> >>>> @@ -423,41 +443,6 @@ static inline void reg_write_field(struct cal_dev *cal, u32 offset, u32 value,
> >>>>  	reg_write(cal, offset, val);
> >>>>  }
> >>>>  
> >>>> -static const struct cal_fmt *find_format_by_pix(struct cal_ctx *ctx,
> >>>> -						u32 pixelformat)
> >>>> -{
> >>>> -	const struct cal_fmt *fmt;
> >>>> -	unsigned int k;
> >>>> -
> >>>> -	for (k = 0; k < ctx->num_active_fmt; k++) {
> >>>> -		fmt = ctx->active_fmt[k];
> >>>> -		if (fmt->fourcc == pixelformat)
> >>>> -			return fmt;
> >>>> -	}
> >>>> -
> >>>> -	return NULL;
> >>>> -}
> >>>> -
> >>>> -static const struct cal_fmt *find_format_by_code(struct cal_ctx *ctx,
> >>>> -						 u32 code)
> >>>> -{
> >>>> -	const struct cal_fmt *fmt;
> >>>> -	unsigned int k;
> >>>> -
> >>>> -	for (k = 0; k < ctx->num_active_fmt; k++) {
> >>>> -		fmt = ctx->active_fmt[k];
> >>>> -		if (fmt->code == code)
> >>>> -			return fmt;
> >>>> -	}
> >>>> -
> >>>> -	return NULL;
> >>>> -}
> >>>> -
> >>>> -static inline struct cal_ctx *notifier_to_ctx(struct v4l2_async_notifier *n)
> >>>> -{
> >>>> -	return container_of(n, struct cal_ctx, notifier);
> >>>> -}
> >>>> -
> >>>>  static inline void set_field(u32 *valp, u32 field, u32 mask)
> >>>>  {
> >>>>  	u32 val = *valp;
> >>>> @@ -493,11 +478,6 @@ static void cal_quickdump_regs(struct cal_dev *cal)
> >>>>  	}
> >>>>  }
> >>>>  
> >>>> -static u32 cal_data_get_num_csi2_phy(struct cal_dev *cal)
> >>>> -{
> >>>> -	return cal->data->num_csi2_phy;
> >>>> -}
> >>>> -
> >>>>  /* ------------------------------------------------------------------
> >>>>   *	CAMERARX Management
> >>>>   * ------------------------------------------------------------------
> >>>> @@ -1152,6 +1132,11 @@ static void cal_ctx_wr_dma_addr(struct cal_ctx *ctx, unsigned int dmaaddr)
> >>>>  	reg_write(ctx->cal, CAL_WR_DMA_ADDR(ctx->csi2_port), dmaaddr);
> >>>>  }
> >>>>  
> >>>> +/* ------------------------------------------------------------------
> >>>> + *	IRQ Handling
> >>>> + * ------------------------------------------------------------------
> >>>> + */
> >>>> +
> >>>>  static inline void cal_schedule_next_buffer(struct cal_ctx *ctx)
> >>>>  {
> >>>>  	struct cal_dmaqueue *dma_q = &ctx->vidq;
> >>>> @@ -1255,9 +1240,41 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
> >>>>  	return IRQ_HANDLED;
> >>>>  }
> >>>>  
> >>>> -/*
> >>>> - * video ioctls
> >>>> +/* ------------------------------------------------------------------
> >>>> + *	V4L2 Video IOCTLs
> >>>> + * ------------------------------------------------------------------
> >>>>   */
> >>>> +
> >>>> +static const struct cal_fmt *find_format_by_pix(struct cal_ctx *ctx,
> >>>> +						u32 pixelformat)
> >>>> +{
> >>>> +	const struct cal_fmt *fmt;
> >>>> +	unsigned int k;
> >>>> +
> >>>> +	for (k = 0; k < ctx->num_active_fmt; k++) {
> >>>> +		fmt = ctx->active_fmt[k];
> >>>> +		if (fmt->fourcc == pixelformat)
> >>>> +			return fmt;
> >>>> +	}
> >>>> +
> >>>> +	return NULL;
> >>>> +}
> >>>> +
> >>>> +static const struct cal_fmt *find_format_by_code(struct cal_ctx *ctx,
> >>>> +						 u32 code)
> >>>> +{
> >>>> +	const struct cal_fmt *fmt;
> >>>> +	unsigned int k;
> >>>> +
> >>>> +	for (k = 0; k < ctx->num_active_fmt; k++) {
> >>>> +		fmt = ctx->active_fmt[k];
> >>>> +		if (fmt->code == code)
> >>>> +			return fmt;
> >>>> +	}
> >>>> +
> >>>> +	return NULL;
> >>>> +}
> >>>> +
> >>>>  static int cal_querycap(struct file *file, void *priv,
> >>>>  			struct v4l2_capability *cap)
> >>>>  {
> >>>> @@ -1566,9 +1583,46 @@ static int cal_enum_frameintervals(struct file *file, void *priv,
> >>>>  	return 0;
> >>>>  }
> >>>>  
> >>>> -/*
> >>>> - * Videobuf operations
> >>>> +static const struct v4l2_file_operations cal_fops = {
> >>>> +	.owner		= THIS_MODULE,
> >>>> +	.open           = v4l2_fh_open,
> >>>> +	.release        = vb2_fop_release,
> >>>> +	.read           = vb2_fop_read,
> >>>> +	.poll		= vb2_fop_poll,
> >>>> +	.unlocked_ioctl = video_ioctl2, /* V4L2 ioctl handler */
> >>>> +	.mmap           = vb2_fop_mmap,
> >>>> +};
> >>>> +
> >>>> +static const struct v4l2_ioctl_ops cal_ioctl_ops = {
> >>>> +	.vidioc_querycap      = cal_querycap,
> >>>> +	.vidioc_enum_fmt_vid_cap  = cal_enum_fmt_vid_cap,
> >>>> +	.vidioc_g_fmt_vid_cap     = cal_g_fmt_vid_cap,
> >>>> +	.vidioc_try_fmt_vid_cap   = cal_try_fmt_vid_cap,
> >>>> +	.vidioc_s_fmt_vid_cap     = cal_s_fmt_vid_cap,
> >>>> +	.vidioc_enum_framesizes   = cal_enum_framesizes,
> >>>> +	.vidioc_reqbufs       = vb2_ioctl_reqbufs,
> >>>> +	.vidioc_create_bufs   = vb2_ioctl_create_bufs,
> >>>> +	.vidioc_prepare_buf   = vb2_ioctl_prepare_buf,
> >>>> +	.vidioc_querybuf      = vb2_ioctl_querybuf,
> >>>> +	.vidioc_qbuf          = vb2_ioctl_qbuf,
> >>>> +	.vidioc_dqbuf         = vb2_ioctl_dqbuf,
> >>>> +	.vidioc_expbuf        = vb2_ioctl_expbuf,
> >>>> +	.vidioc_enum_input    = cal_enum_input,
> >>>> +	.vidioc_g_input       = cal_g_input,
> >>>> +	.vidioc_s_input       = cal_s_input,
> >>>> +	.vidioc_enum_frameintervals = cal_enum_frameintervals,
> >>>> +	.vidioc_streamon      = vb2_ioctl_streamon,
> >>>> +	.vidioc_streamoff     = vb2_ioctl_streamoff,
> >>>> +	.vidioc_log_status    = v4l2_ctrl_log_status,
> >>>> +	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
> >>>> +	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
> >>>> +};
> >>>> +
> >>>> +/* ------------------------------------------------------------------
> >>>> + *	videobuf2 Operations
> >>>> + * ------------------------------------------------------------------
> >>>>   */
> >>>> +
> >>>>  static int cal_queue_setup(struct vb2_queue *vq,
> >>>>  			   unsigned int *nbuffers, unsigned int *nplanes,
> >>>>  			   unsigned int sizes[], struct device *alloc_devs[])
> >>>> @@ -1772,40 +1826,10 @@ static const struct vb2_ops cal_video_qops = {
> >>>>  	.wait_finish		= vb2_ops_wait_finish,
> >>>>  };
> >>>>  
> >>>> -static const struct v4l2_file_operations cal_fops = {
> >>>> -	.owner		= THIS_MODULE,
> >>>> -	.open           = v4l2_fh_open,
> >>>> -	.release        = vb2_fop_release,
> >>>> -	.read           = vb2_fop_read,
> >>>> -	.poll		= vb2_fop_poll,
> >>>> -	.unlocked_ioctl = video_ioctl2, /* V4L2 ioctl handler */
> >>>> -	.mmap           = vb2_fop_mmap,
> >>>> -};
> >>>> -
> >>>> -static const struct v4l2_ioctl_ops cal_ioctl_ops = {
> >>>> -	.vidioc_querycap      = cal_querycap,
> >>>> -	.vidioc_enum_fmt_vid_cap  = cal_enum_fmt_vid_cap,
> >>>> -	.vidioc_g_fmt_vid_cap     = cal_g_fmt_vid_cap,
> >>>> -	.vidioc_try_fmt_vid_cap   = cal_try_fmt_vid_cap,
> >>>> -	.vidioc_s_fmt_vid_cap     = cal_s_fmt_vid_cap,
> >>>> -	.vidioc_enum_framesizes   = cal_enum_framesizes,
> >>>> -	.vidioc_reqbufs       = vb2_ioctl_reqbufs,
> >>>> -	.vidioc_create_bufs   = vb2_ioctl_create_bufs,
> >>>> -	.vidioc_prepare_buf   = vb2_ioctl_prepare_buf,
> >>>> -	.vidioc_querybuf      = vb2_ioctl_querybuf,
> >>>> -	.vidioc_qbuf          = vb2_ioctl_qbuf,
> >>>> -	.vidioc_dqbuf         = vb2_ioctl_dqbuf,
> >>>> -	.vidioc_expbuf        = vb2_ioctl_expbuf,
> >>>> -	.vidioc_enum_input    = cal_enum_input,
> >>>> -	.vidioc_g_input       = cal_g_input,
> >>>> -	.vidioc_s_input       = cal_s_input,
> >>>> -	.vidioc_enum_frameintervals = cal_enum_frameintervals,
> >>>> -	.vidioc_streamon      = vb2_ioctl_streamon,
> >>>> -	.vidioc_streamoff     = vb2_ioctl_streamoff,
> >>>> -	.vidioc_log_status    = v4l2_ctrl_log_status,
> >>>> -	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
> >>>> -	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
> >>>> -};
> >>>> +/* ------------------------------------------------------------------
> >>>> + *	Initialization and module stuff
> >>>> + * ------------------------------------------------------------------
> >>>> + */
> >>>>  
> >>>>  static const struct video_device cal_videodev = {
> >>>>  	.name		= CAL_MODULE_NAME,
> >>>> @@ -1817,11 +1841,6 @@ static const struct video_device cal_videodev = {
> >>>>  			  V4L2_CAP_READWRITE,
> >>>>  };
> >>>>  
> >>>> -/* -----------------------------------------------------------------
> >>>> - *	Initialization and module stuff
> >>>> - * ------------------------------------------------------------------
> >>>> - */
> >>>> -
> >>>>  static int cal_complete_ctx(struct cal_ctx *ctx)
> >>>>  {
> >>>>  	struct video_device *vfd;
> >>>> @@ -2242,6 +2261,11 @@ static void cal_get_hwinfo(struct cal_dev *cal)
> >>>>  		hwinfo);
> >>>>  }
> >>>>  
> >>>
> >>>
> >>> Overall, the reorganisation is certainly helpful.
> >>>
> >>>> +static u32 cal_data_get_num_csi2_phy(struct cal_dev *cal)
> >>>> +{
> >>>> +	return cal->data->num_csi2_phy;
> >>>> +}
> >>>
> >>> However, this function (which is possibly a bit overkill on it's own
> >>> anyway) could be moved much higher in the module, so that /all/
> >>> references to the num_csi2_phy variable are accessed through it.
> >>>
> >>> Otherwise, the code is inconsistent with other parts of the driver
> >>> directly accessing this value even with an accessor.
> >>>
> >>> We could remove the accessor... or - apply the patch "media: ti-vpe:
> >>> cal: Use cal_data_get_num_csi2_phy() consistently" (which will follow
> >>> next) on top.
> >>
> >> I think I'd rather remove the accessors, this function provides little
> >> value.
> > 
> > It had some value in giving me a clean place to override having only a
> > single phy, but that's not a reason to keep it (just helpful while
> > debugging).
> > 
> > I'm fine dropping the accessor, and open-coding the usage too.
> 
> Actually, further to that - we might want some loop helper here on this
> topic anyway, as when a PHY is unused (/unconnected) we need a good way
> to make sure we don't process anything on that phy.
> 
> I think all of the places where that accessor is used would be key
> locations that should also check if the phy is defined too.
> 
> But that accessor alone is not enough, there needs to be a check that
> the phy was created too. (currently working through that now for better
> support on the DRA76-evm which has two phys, and only one is connected
> to the OV5640).

Shouldn't we still create two cal_camerarx instances, even if only one
of them is used ? Think about it from a media controller point of view,
there should be two phy entities, even if one has its input left
unconnected.

> >>> Otherwise,
> >>>
> >>> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> >>>
> >>>> +
> >>>>  static int cal_probe(struct platform_device *pdev)
> >>>>  {
> >>>>  	struct cal_dev *cal;

-- 
Regards,

Laurent Pinchart
