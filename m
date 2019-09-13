Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C3B6B1F02
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2019 15:20:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389597AbfIMNOw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Sep 2019 09:14:52 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:54895 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389030AbfIMNOv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Sep 2019 09:14:51 -0400
Received: from [IPv6:2001:420:44c1:2577:888a:538c:8dda:557b] ([IPv6:2001:420:44c1:2577:888a:538c:8dda:557b])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 8lPRiWmpLV17O8lPUi2ooy; Fri, 13 Sep 2019 15:14:49 +0200
Subject: Re: [Patch 08/13] media: am437x-vpfe: Maintain a reference to the
 current vpfe_fmt
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Prabhakar Lad <prabhakar.csengg@gmail.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190909162743.30114-1-bparrot@ti.com>
 <20190909162743.30114-9-bparrot@ti.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <8b3d5c23-6784-fb1c-5e14-f3759b10aa0b@xs4all.nl>
Date:   Fri, 13 Sep 2019 15:14:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190909162743.30114-9-bparrot@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfEIIBrceDZFfrzH0aasvDg4A4FwdLH69cYH5uQug/DGS5FdEWkzrvg63k/2Wqx4K2zguwfnuALaFbsJyuX5DRG/ZQCJJFe4bU+ckt8AvnH3VBx3GcUUH
 zYxS6lsKDjumd9rgQmQHaMWWkDU3oRHUdqP5OVpkKZIOKZJNKspEZy9YiUq0774KcdvGDdHC0Luyf4T8YKpbepuPe+L5eFrUZ3jd4QpgXO2WD5QTkgVR/9Tc
 eq7TiGglWjhK2eQ7xycQ+RGqKg7I9DnFSB1cyCyMifoPPYfXhbC2Dpo+JcJTdaAlPa/Yo/xOkhCn5L06oVwIgEsGEUlgCKIfB7wjarzXGK23o9Ka/t2YMFHV
 Blwf42nh52PfulE3O1DlGaD6M+gTN1Ydrf+BJ3GOdmN/m20EFazWff4c7p5GMuMS3TtKXLs7pYbXna0YLFprfttY0Ax0nw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/9/19 6:27 PM, Benoit Parrot wrote:
> Keep a reference to the currently selected struct vpfe_fmt * object.
> By doing so we rename the current struct v4l2_format * member from
> fmt to v_fmt.
> The added struct vpfe_fmt * reference is set to "const" so we also
> constify all accesses and related helper functions.

This explains what you do, but not why you do it.

And I think fmt vs v_fmt is *very* confusing naming.

I'd keep fmt as-is, and come up with a different name for the vpfe_fmt
pointer. ref_vpfe_fmt?

Regards,

	Hans

> 
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> ---
>  drivers/media/platform/am437x/am437x-vpfe.c | 88 +++++++++++++--------
>  drivers/media/platform/am437x/am437x-vpfe.h |  3 +-
>  2 files changed, 55 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
> index e76dc2b3b7b8..a8f6cf1d06a0 100644
> --- a/drivers/media/platform/am437x/am437x-vpfe.c
> +++ b/drivers/media/platform/am437x/am437x-vpfe.c
> @@ -147,8 +147,8 @@ static int
>  __vpfe_get_format(struct vpfe_device *vpfe,
>  		  struct v4l2_format *format, unsigned int *bpp);
>  
> -static struct vpfe_fmt *find_format_by_code(struct vpfe_device *vpfe,
> -					    unsigned int code)
> +static const struct vpfe_fmt *find_format_by_code(struct vpfe_device *vpfe,
> +						  unsigned int code)
>  {
>  	struct vpfe_fmt *fmt;
>  	unsigned int k;
> @@ -162,8 +162,8 @@ static struct vpfe_fmt *find_format_by_code(struct vpfe_device *vpfe,
>  	return NULL;
>  }
>  
> -static struct vpfe_fmt *find_format_by_pix(struct vpfe_device *vpfe,
> -					   unsigned int pixelformat)
> +static const struct vpfe_fmt *find_format_by_pix(struct vpfe_device *vpfe,
> +						 unsigned int pixelformat)
>  {
>  	struct vpfe_fmt *fmt;
>  	unsigned int k;
> @@ -184,7 +184,7 @@ mbus_to_pix(struct vpfe_device *vpfe,
>  {
>  	struct vpfe_subdev_info *sdinfo = vpfe->current_subdev;
>  	unsigned int bus_width = sdinfo->vpfe_param.bus_width;
> -	struct vpfe_fmt *fmt;
> +	const struct vpfe_fmt *fmt;
>  
>  	fmt = find_format_by_code(vpfe, mbus->code);
>  	if (WARN_ON(fmt == NULL)) {
> @@ -207,7 +207,7 @@ static void pix_to_mbus(struct vpfe_device *vpfe,
>  			struct v4l2_pix_format *pix_fmt,
>  			struct v4l2_mbus_framefmt *mbus_fmt)
>  {
> -	struct vpfe_fmt *fmt;
> +	const struct vpfe_fmt *fmt;
>  
>  	fmt = find_format_by_pix(vpfe, pix_fmt->pixelformat);
>  	if (!fmt) {
> @@ -990,10 +990,10 @@ static int vpfe_config_ccdc_image_format(struct vpfe_device *vpfe)
>  	vpfe_dbg(2, vpfe, "vpfe_config_ccdc_image_format\n");
>  
>  	vpfe_dbg(1, vpfe, "pixelformat: %s\n",
> -		print_fourcc(vpfe->fmt.fmt.pix.pixelformat));
> +		print_fourcc(vpfe->v_fmt.fmt.pix.pixelformat));
>  
>  	if (vpfe_ccdc_set_pixel_format(&vpfe->ccdc,
> -			vpfe->fmt.fmt.pix.pixelformat) < 0) {
> +			vpfe->v_fmt.fmt.pix.pixelformat) < 0) {
>  		vpfe_err(vpfe, "couldn't set pix format in ccdc\n");
>  		return -EINVAL;
>  	}
> @@ -1001,7 +1001,7 @@ static int vpfe_config_ccdc_image_format(struct vpfe_device *vpfe)
>  	/* configure the image window */
>  	vpfe_ccdc_set_image_window(&vpfe->ccdc, &vpfe->crop, vpfe->bpp);
>  
> -	switch (vpfe->fmt.fmt.pix.field) {
> +	switch (vpfe->v_fmt.fmt.pix.field) {
>  	case V4L2_FIELD_INTERLACED:
>  		/* do nothing, since it is default */
>  		ret = vpfe_ccdc_set_buftype(
> @@ -1043,7 +1043,8 @@ static int vpfe_config_ccdc_image_format(struct vpfe_device *vpfe)
>  static int vpfe_config_image_format(struct vpfe_device *vpfe,
>  				    v4l2_std_id std_id)
>  {
> -	struct v4l2_pix_format *pix = &vpfe->fmt.fmt.pix;
> +	const struct vpfe_fmt *fmt;
> +	struct v4l2_pix_format *pix = &vpfe->v_fmt.fmt.pix;
>  	int i, ret;
>  
>  	for (i = 0; i < ARRAY_SIZE(vpfe_standards); i++) {
> @@ -1078,10 +1079,18 @@ static int vpfe_config_image_format(struct vpfe_device *vpfe,
>  	else
>  		pix->field = V4L2_FIELD_NONE;
>  
> -	ret = __vpfe_get_format(vpfe, &vpfe->fmt, &vpfe->bpp);
> +	ret = __vpfe_get_format(vpfe, &vpfe->v_fmt, &vpfe->bpp);
>  	if (ret)
>  		return ret;
>  
> +	fmt = find_format_by_pix(vpfe, pix->pixelformat);
> +	if (!fmt) {
> +		vpfe_dbg(3, vpfe, "Invalid pixel code: %4.4s\n",
> +			 (char *)&pix->pixelformat);
> +		return -EINVAL;
> +	}
> +	vpfe->fmt = fmt;
> +
>  	/* Update the crop window based on found values */
>  	vpfe->crop.width = pix->width;
>  	vpfe->crop.height = pix->height;
> @@ -1227,7 +1236,7 @@ static inline void vpfe_schedule_bottom_field(struct vpfe_device *vpfe)
>  static inline void vpfe_process_buffer_complete(struct vpfe_device *vpfe)
>  {
>  	vpfe->cur_frm->vb.vb2_buf.timestamp = ktime_get_ns();
> -	vpfe->cur_frm->vb.field = vpfe->fmt.fmt.pix.field;
> +	vpfe->cur_frm->vb.field = vpfe->v_fmt.fmt.pix.field;
>  	vpfe->cur_frm->vb.sequence = vpfe->sequence++;
>  	vb2_buffer_done(&vpfe->cur_frm->vb.vb2_buf, VB2_BUF_STATE_DONE);
>  	vpfe->cur_frm = vpfe->next_frm;
> @@ -1296,7 +1305,7 @@ static void vpfe_handle_interlaced_irq(struct vpfe_device *vpfe,
>  static irqreturn_t vpfe_isr(int irq, void *dev)
>  {
>  	struct vpfe_device *vpfe = (struct vpfe_device *)dev;
> -	enum v4l2_field field = vpfe->fmt.fmt.pix.field;
> +	enum v4l2_field field = vpfe->v_fmt.fmt.pix.field;
>  	int intr_status, stopping = vpfe->stopping;
>  
>  	intr_status = vpfe_reg_read(&vpfe->ccdc, VPFE_IRQ_STS);
> @@ -1397,7 +1406,7 @@ static int __vpfe_get_format(struct vpfe_device *vpfe,
>  		mbus_to_pix(vpfe, &mbus_fmt, &format->fmt.pix, bpp);
>  	}
>  
> -	format->type = vpfe->fmt.type;
> +	format->type = vpfe->v_fmt.type;
>  
>  	vpfe_dbg(1, vpfe,
>  		 "%s size %dx%d (%s) bytesperline = %d, size = %d, bpp = %d\n",
> @@ -1434,7 +1443,7 @@ static int __vpfe_set_format(struct vpfe_device *vpfe,
>  	v4l2_fill_pix_format(&format->fmt.pix, &fmt.format);
>  	mbus_to_pix(vpfe, &fmt.format, &format->fmt.pix, bpp);
>  
> -	format->type = vpfe->fmt.type;
> +	format->type = vpfe->v_fmt.type;
>  
>  	vpfe_dbg(1, vpfe,
>  		 "%s size %dx%d (%s) bytesperline = %d, size = %d, bpp = %d\n",
> @@ -1452,7 +1461,7 @@ static int vpfe_g_fmt(struct file *file, void *priv,
>  
>  	vpfe_dbg(2, vpfe, "vpfe_g_fmt\n");
>  
> -	*fmt = vpfe->fmt;
> +	*fmt = vpfe->v_fmt;
>  
>  	return 0;
>  }
> @@ -1496,9 +1505,10 @@ static int vpfe_try_fmt(struct file *file, void *priv,
>  }
>  
>  static int vpfe_s_fmt(struct file *file, void *priv,
> -		      struct v4l2_format *fmt)
> +		      struct v4l2_format *f)
>  {
>  	struct vpfe_device *vpfe = video_drvdata(file);
> +	const struct vpfe_fmt *fmt;
>  	struct v4l2_format format;
>  	unsigned int bpp;
>  	int ret;
> @@ -1515,25 +1525,32 @@ static int vpfe_s_fmt(struct file *file, void *priv,
>  	if (ret)
>  		return ret;
>  
> -
> -	if (!cmp_v4l2_format(fmt, &format)) {
> +	if (!cmp_v4l2_format(f, &format)) {
>  		/* Sensor format is different from the requested format
>  		 * so we need to change it
>  		 */
> -		ret = __vpfe_set_format(vpfe, fmt, &bpp);
> +		ret = __vpfe_set_format(vpfe, f, &bpp);
>  		if (ret)
>  			return ret;
>  	} else /* Just make sure all of the fields are consistent */
> -		*fmt = format;
> +		*f = format;
> +
> +	fmt = find_format_by_pix(vpfe, f->fmt.pix.pixelformat);
> +	if (!fmt) {
> +		vpfe_dbg(3, vpfe, "Invalid pixel code: %4.4s, This should not happen!!\n",
> +			 (char *)&f->fmt.pix.pixelformat);
> +		return -EINVAL;
> +	}
>  
>  	/* First detach any IRQ if currently attached */
>  	vpfe_detach_irq(vpfe);
> -	vpfe->fmt = *fmt;
> +	vpfe->v_fmt = *f;
>  	vpfe->bpp = bpp;
> +	vpfe->fmt = fmt;
>  
>  	/* Update the crop window based on found values */
> -	vpfe->crop.width = fmt->fmt.pix.width;
> -	vpfe->crop.height = fmt->fmt.pix.height;
> +	vpfe->crop.width = f->fmt.pix.width;
> +	vpfe->crop.height = f->fmt.pix.height;
>  
>  	/* set image capture parameters in the ccdc */
>  	return vpfe_config_ccdc_image_format(vpfe);
> @@ -1547,7 +1564,7 @@ static int vpfe_enum_size(struct file *file, void  *priv,
>  	struct vpfe_subdev_info *sdinfo;
>  	struct v4l2_mbus_framefmt mbus;
>  	struct v4l2_pix_format pix;
> -	struct vpfe_fmt *fmt;
> +	const struct vpfe_fmt *fmt;
>  	int ret;
>  
>  	vpfe_dbg(2, vpfe, "vpfe_enum_size\n");
> @@ -1850,7 +1867,7 @@ static int vpfe_queue_setup(struct vb2_queue *vq,
>  			    unsigned int sizes[], struct device *alloc_devs[])
>  {
>  	struct vpfe_device *vpfe = vb2_get_drv_priv(vq);
> -	unsigned size = vpfe->fmt.fmt.pix.sizeimage;
> +	unsigned int size = vpfe->v_fmt.fmt.pix.sizeimage;
>  
>  	if (vq->num_buffers + *nbuffers < 3)
>  		*nbuffers = 3 - vq->num_buffers;
> @@ -1886,12 +1903,12 @@ static int vpfe_buffer_prepare(struct vb2_buffer *vb)
>  	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
>  	struct vpfe_device *vpfe = vb2_get_drv_priv(vb->vb2_queue);
>  
> -	vb2_set_plane_payload(vb, 0, vpfe->fmt.fmt.pix.sizeimage);
> +	vb2_set_plane_payload(vb, 0, vpfe->v_fmt.fmt.pix.sizeimage);
>  
>  	if (vb2_get_plane_payload(vb, 0) > vb2_plane_size(vb, 0))
>  		return -EINVAL;
>  
> -	vbuf->field = vpfe->fmt.fmt.pix.field;
> +	vbuf->field = vpfe->v_fmt.fmt.pix.field;
>  
>  	return 0;
>  }
> @@ -2116,11 +2133,12 @@ vpfe_s_selection(struct file *file, void *fh, struct v4l2_selection *s)
>  	s->r = vpfe->crop = r;
>  
>  	vpfe_ccdc_set_image_window(&vpfe->ccdc, &r, vpfe->bpp);
> -	vpfe->fmt.fmt.pix.width = r.width;
> -	vpfe->fmt.fmt.pix.height = r.height;
> -	vpfe->fmt.fmt.pix.bytesperline = vpfe_ccdc_get_line_length(&vpfe->ccdc);
> -	vpfe->fmt.fmt.pix.sizeimage = vpfe->fmt.fmt.pix.bytesperline *
> -						vpfe->fmt.fmt.pix.height;
> +	vpfe->v_fmt.fmt.pix.width = r.width;
> +	vpfe->v_fmt.fmt.pix.height = r.height;
> +	vpfe->v_fmt.fmt.pix.bytesperline =
> +		vpfe_ccdc_get_line_length(&vpfe->ccdc);
> +	vpfe->v_fmt.fmt.pix.sizeimage = vpfe->v_fmt.fmt.pix.bytesperline *
> +						vpfe->v_fmt.fmt.pix.height;
>  
>  	vpfe_dbg(1, vpfe, "cropped (%d,%d)/%dx%d of %dx%d\n",
>  		 r.left, r.top, r.width, r.height, cr.width, cr.height);
> @@ -2156,7 +2174,7 @@ static long vpfe_ioctl_default(struct file *file, void *priv,
>  			return ret;
>  		}
>  		ret = vpfe_get_ccdc_image_format(vpfe,
> -						 &vpfe->fmt);
> +						 &vpfe->v_fmt);
>  		if (ret < 0) {
>  			vpfe_dbg(2, vpfe,
>  				"Invalid image format at CCDC\n");
> @@ -2309,7 +2327,7 @@ static int vpfe_probe_complete(struct vpfe_device *vpfe)
>  	spin_lock_init(&vpfe->dma_queue_lock);
>  	mutex_init(&vpfe->lock);
>  
> -	vpfe->fmt.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
> +	vpfe->v_fmt.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
>  
>  	/* set first sub device as current one */
>  	vpfe->current_subdev = &vpfe->cfg->sub_devs[0];
> diff --git a/drivers/media/platform/am437x/am437x-vpfe.h b/drivers/media/platform/am437x/am437x-vpfe.h
> index 6f25750f84e4..64a25bf720e4 100644
> --- a/drivers/media/platform/am437x/am437x-vpfe.h
> +++ b/drivers/media/platform/am437x/am437x-vpfe.h
> @@ -280,7 +280,8 @@ struct vpfe_device {
>  	/* Pointer pointing to next v4l2_buffer */
>  	struct vpfe_cap_buffer *next_frm;
>  	/* Used to store pixel format */
> -	struct v4l2_format fmt;
> +	const struct vpfe_fmt *fmt;
> +	struct v4l2_format v_fmt;
>  	/* Used to store current bytes per pixel based on current format */
>  	unsigned int bpp;
>  	struct vpfe_fmt	*active_fmt[VPFE_MAX_ACTIVE_FMT];
> 

