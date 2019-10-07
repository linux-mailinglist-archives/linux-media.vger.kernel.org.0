Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 149ACCE534
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 16:26:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727951AbfJGO01 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 10:26:27 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:46829 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727324AbfJGO00 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 7 Oct 2019 10:26:26 -0400
Received: from [IPv6:2001:983:e9a7:1:3d61:cdd2:8085:cc8] ([IPv6:2001:983:e9a7:1:3d61:cdd2:8085:cc8])
        by smtp-cloud8.xs4all.net with ESMTPA
        id HTxtiQ4VLop0AHTxuiImCf; Mon, 07 Oct 2019 16:26:22 +0200
Subject: Re: [PATCH v3 2/2] vivid: Add metadata output support
To:     Vandana BN <bnvandana@gmail.com>, linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <787ff1cb-dde3-800a-9dde-68f1db5e4897@xs4all.nl>
 <20191004120837.31614-1-bnvandana@gmail.com>
 <20191004120837.31614-3-bnvandana@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <a95022bb-1c6c-5f91-9169-65a06ff87148@xs4all.nl>
Date:   Mon, 7 Oct 2019 16:26:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191004120837.31614-3-bnvandana@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLvP6AGOtMfM7nBRannv5iQACZMCOvahxr7LHFeXWGtnGzSdCW8L2ldL0QRBfoWuU4gmmSJlcoIh4ijyb5KutVR3Ncux/+A6nx+EhwY0H4vyyWvbZ8HP
 kuakk11Kgx036gmaq8gk7j3x8f1Fh56wnQyH1HjXnH2iuIQHo2QxPAYVPbdZ9vut+OlVfcDYh8E0vKTn/IYNnfxfVkTAjzBUtwMP8TPXj+HIg2RLD2oDVdbP
 zF3KLBgFGT4kp4vuH4NvQZBLdpVQ26UfmjdBNCFTpkm3b/ePxGmuPX2TteErLd6Em4RRzijzwK7LWxXN8EpUfIdjGjPoYuuiRwgWQ6RaiffdmJ9ql4F2KEhA
 Z0YpDPG+f4qfgm/n7ee8PZNA71AbJg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/4/19 2:08 PM, Vandana BN wrote:
> Support metadata output in vivid driver.
> Metadata output is used to set brightness, contrast, saturation
> and hue.
> Adds new files for metadata output.
> 
> Signed-off-by: Vandana BN <bnvandana@gmail.com>
> ---
>  drivers/media/platform/vivid/Makefile         |   2 +-
>  drivers/media/platform/vivid/vivid-core.c     |  98 +++++++++-
>  drivers/media/platform/vivid/vivid-core.h     |  10 +
>  drivers/media/platform/vivid/vivid-ctrls.c    |  12 +-
>  .../media/platform/vivid/vivid-kthread-out.c  |  50 ++++-
>  drivers/media/platform/vivid/vivid-meta-out.c | 174 ++++++++++++++++++
>  drivers/media/platform/vivid/vivid-meta-out.h |  25 +++
>  drivers/media/platform/vivid/vivid-vid-out.c  |   5 +-
>  8 files changed, 365 insertions(+), 11 deletions(-)
>  create mode 100644 drivers/media/platform/vivid/vivid-meta-out.c
>  create mode 100644 drivers/media/platform/vivid/vivid-meta-out.h
> 
> diff --git a/drivers/media/platform/vivid/Makefile b/drivers/media/platform/vivid/Makefile
> index af94abf9bce6..e8a50c506dc9 100644
> --- a/drivers/media/platform/vivid/Makefile
> +++ b/drivers/media/platform/vivid/Makefile
> @@ -3,7 +3,7 @@ vivid-objs := vivid-core.o vivid-ctrls.o vivid-vid-common.o vivid-vbi-gen.o \
>  		vivid-vid-cap.o vivid-vid-out.o vivid-kthread-cap.o vivid-kthread-out.o \
>  		vivid-radio-rx.o vivid-radio-tx.o vivid-radio-common.o \
>  		vivid-rds-gen.o vivid-sdr-cap.o vivid-vbi-cap.o vivid-vbi-out.o \
> -		vivid-osd.o vivid-meta-cap.o
> +		vivid-osd.o vivid-meta-cap.o vivid-meta-out.o
>  ifeq ($(CONFIG_VIDEO_VIVID_CEC),y)
>    vivid-objs += vivid-cec.o
>  endif
> diff --git a/drivers/media/platform/vivid/vivid-core.c b/drivers/media/platform/vivid/vivid-core.c
> index 97ab197bdec0..2c1f7f99c628 100644
> --- a/drivers/media/platform/vivid/vivid-core.c
> +++ b/drivers/media/platform/vivid/vivid-core.c
> @@ -38,6 +38,7 @@
>  #include "vivid-cec.h"
>  #include "vivid-ctrls.h"
>  #include "vivid-meta-cap.h"
> +#include "vivid-meta-out.h"
>  
>  #define VIVID_MODULE_NAME "vivid"
>  
> @@ -84,6 +85,10 @@ static int meta_cap_nr[VIVID_MAX_DEVS] = { [0 ... (VIVID_MAX_DEVS - 1)] = -1 };
>  module_param_array(meta_cap_nr, int, NULL, 0444);
>  MODULE_PARM_DESC(meta_cap_nr, " videoX start number, -1 is autodetect");
>  
> +static int meta_out_nr[VIVID_MAX_DEVS] = { [0 ... (VIVID_MAX_DEVS - 1)] = -1 };
> +module_param_array(meta_out_nr, int, NULL, 0444);
> +MODULE_PARM_DESC(meta_out_nr, " videoX start number, -1 is autodetect");
> +
>  static int ccs_cap_mode[VIVID_MAX_DEVS] = { [0 ... (VIVID_MAX_DEVS - 1)] = -1 };
>  module_param_array(ccs_cap_mode, int, NULL, 0444);
>  MODULE_PARM_DESC(ccs_cap_mode, " capture crop/compose/scale mode:\n"
> @@ -105,10 +110,10 @@ MODULE_PARM_DESC(multiplanar, " 1 (default) creates a single planar device, 2 cr
>   * vbi-out + vid-out + meta-cap
>   */
>  static unsigned int node_types[VIVID_MAX_DEVS] = {
> -	[0 ... (VIVID_MAX_DEVS - 1)] = 0x21d3d
> +	[0 ... (VIVID_MAX_DEVS - 1)] = 0x61d3d
>  };
>  module_param_array(node_types, uint, NULL, 0444);
> -MODULE_PARM_DESC(node_types, " node types, default is 0x1d3d. Bitmask with the following meaning:\n"
> +MODULE_PARM_DESC(node_types, " node types, default is 0x61d3d. Bitmask with the following meaning:\n"
>  			     "\t\t    bit 0: Video Capture node\n"
>  			     "\t\t    bit 2-3: VBI Capture node: 0 = none, 1 = raw vbi, 2 = sliced vbi, 3 = both\n"
>  			     "\t\t    bit 4: Radio Receiver node\n"
> @@ -117,7 +122,8 @@ MODULE_PARM_DESC(node_types, " node types, default is 0x1d3d. Bitmask with the f
>  			     "\t\t    bit 10-11: VBI Output node: 0 = none, 1 = raw vbi, 2 = sliced vbi, 3 = both\n"
>  			     "\t\t    bit 12: Radio Transmitter node\n"
>  			     "\t\t    bit 16: Framebuffer for testing overlays\n"
> -			     "\t\t    bit 17: Metadata Capture node\n");
> +			     "\t\t    bit 17: Metadata Capture node\n"
> +			     "\t\t    bit 18: Metadata Output node\n");
>  
>  /* Default: 4 inputs */
>  static unsigned num_inputs[VIVID_MAX_DEVS] = { [0 ... (VIVID_MAX_DEVS - 1)] = 4 };
> @@ -216,7 +222,8 @@ static int vidioc_querycap(struct file *file, void  *priv,
>  	cap->capabilities = dev->vid_cap_caps | dev->vid_out_caps |
>  		dev->vbi_cap_caps | dev->vbi_out_caps |
>  		dev->radio_rx_caps | dev->radio_tx_caps |
> -		dev->sdr_cap_caps | dev->meta_cap_caps | V4L2_CAP_DEVICE_CAPS;
> +		dev->sdr_cap_caps | dev->meta_cap_caps |
> +		dev->meta_out_caps | V4L2_CAP_DEVICE_CAPS;
>  	return 0;
>  }
>  
> @@ -445,7 +452,8 @@ static bool vivid_is_last_user(struct vivid_dev *dev)
>  			vivid_is_in_use(&dev->sdr_cap_dev) +
>  			vivid_is_in_use(&dev->radio_rx_dev) +
>  			vivid_is_in_use(&dev->radio_tx_dev) +
> -			vivid_is_in_use(&dev->meta_cap_dev);
> +			vivid_is_in_use(&dev->meta_cap_dev) +
> +			vivid_is_in_use(&dev->meta_out_dev);
>  
>  	return uses == 1;
>  }
> @@ -472,6 +480,7 @@ static int vivid_fop_release(struct file *file)
>  		set_bit(V4L2_FL_REGISTERED, &dev->radio_rx_dev.flags);
>  		set_bit(V4L2_FL_REGISTERED, &dev->radio_tx_dev.flags);
>  		set_bit(V4L2_FL_REGISTERED, &dev->meta_cap_dev.flags);
> +		set_bit(V4L2_FL_REGISTERED, &dev->meta_out_dev.flags);
>  	}
>  	mutex_unlock(&dev->mutex);
>  	if (file->private_data == dev->overlay_cap_owner)
> @@ -622,6 +631,11 @@ static const struct v4l2_ioctl_ops vivid_ioctl_ops = {
>  	.vidioc_g_fmt_meta_cap		= vidioc_g_fmt_meta_cap,
>  	.vidioc_s_fmt_meta_cap		= vidioc_g_fmt_meta_cap,
>  	.vidioc_try_fmt_meta_cap	= vidioc_g_fmt_meta_cap,
> +
> +	.vidioc_enum_fmt_meta_out       = vidioc_enum_fmt_meta_out,
> +	.vidioc_g_fmt_meta_out          = vidioc_g_fmt_meta_out,
> +	.vidioc_s_fmt_meta_out          = vidioc_g_fmt_meta_out,
> +	.vidioc_try_fmt_meta_out        = vidioc_g_fmt_meta_out,
>  };
>  
>  /* -----------------------------------------------------------------
> @@ -839,6 +853,9 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
>  	/* do we create a meta capture device */
>  	dev->has_meta_cap = node_type & 0x20000;
>  
> +	/* do we create a metadata output device */
> +	dev->has_meta_out = node_type & 0x40000;
> +
>  	/* end detecting feature set */
>  
>  	if (dev->has_vid_cap) {
> @@ -905,6 +922,13 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
>  		if (in_type_counter[TV])
>  			dev->meta_cap_caps |= V4L2_CAP_TUNER;
>  	}
> +	/* set up the capablilities of meta output device*/

nitpick: capablilities -> capabilities

And add space before */

> +	if (dev->has_meta_out) {
> +		dev->meta_out_caps = V4L2_CAP_META_OUTPUT |
> +				     V4L2_CAP_STREAMING | V4L2_CAP_READWRITE;
> +		if (dev->has_audio_outputs)
> +			dev->meta_out_caps |= V4L2_CAP_AUDIO;
> +	}
>  
>  	ret = -ENOMEM;
>  	/* initialize the test pattern generator */
> @@ -976,6 +1000,9 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
>  		v4l2_disable_ioctl(&dev->vbi_out_dev, VIDIOC_S_AUDOUT);
>  		v4l2_disable_ioctl(&dev->vbi_out_dev, VIDIOC_G_AUDOUT);
>  		v4l2_disable_ioctl(&dev->vbi_out_dev, VIDIOC_ENUMAUDOUT);
> +		v4l2_disable_ioctl(&dev->meta_out_dev, VIDIOC_S_AUDOUT);
> +		v4l2_disable_ioctl(&dev->meta_out_dev, VIDIOC_G_AUDOUT);
> +		v4l2_disable_ioctl(&dev->meta_out_dev, VIDIOC_ENUMAUDOUT);
>  	}
>  	if (!in_type_counter[TV] && !in_type_counter[SVID]) {
>  		v4l2_disable_ioctl(&dev->vid_cap_dev, VIDIOC_S_STD);
> @@ -1035,6 +1062,8 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
>  	v4l2_disable_ioctl(&dev->vid_out_dev, VIDIOC_ENUM_FRAMEINTERVALS);
>  	v4l2_disable_ioctl(&dev->vbi_out_dev, VIDIOC_S_FREQUENCY);
>  	v4l2_disable_ioctl(&dev->vbi_out_dev, VIDIOC_G_FREQUENCY);
> +	v4l2_disable_ioctl(&dev->meta_out_dev, VIDIOC_S_FREQUENCY);
> +	v4l2_disable_ioctl(&dev->meta_out_dev, VIDIOC_G_FREQUENCY);
>  
>  	/* configure internal data */
>  	dev->fmt_cap = &vivid_formats[0];
> @@ -1118,6 +1147,7 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
>  	INIT_LIST_HEAD(&dev->vbi_out_active);
>  	INIT_LIST_HEAD(&dev->sdr_cap_active);
>  	INIT_LIST_HEAD(&dev->meta_cap_active);
> +	INIT_LIST_HEAD(&dev->meta_out_active);
>  
>  	INIT_LIST_HEAD(&dev->cec_work_list);
>  	spin_lock_init(&dev->cec_slock);
> @@ -1286,6 +1316,27 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
>  			goto unreg_dev;
>  	}
>  
> +	if (dev->has_meta_out) {
> +		/* initialize vbi_out queue */
> +		q = &dev->vb_meta_out_q;
> +		q->type = V4L2_BUF_TYPE_META_OUTPUT;
> +		q->io_modes = VB2_MMAP | VB2_DMABUF | VB2_WRITE;
> +		if (!allocator)
> +			q->io_modes |= VB2_USERPTR;
> +		q->drv_priv = dev;
> +		q->buf_struct_size = sizeof(struct vivid_buffer);
> +		q->ops = &vivid_meta_out_qops;
> +		q->mem_ops = vivid_mem_ops[allocator];
> +		q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> +		q->min_buffers_needed = 2;

I think it would be safe to set this to 1. Otherwise queueing just a single
buffer would not actually activate this feature, since it expects at least
two buffers. That's unexpected.

> +		q->lock = &dev->mutex;
> +		q->dev = dev->v4l2_dev.dev;
> +		q->supports_requests = true;
> +		ret = vb2_queue_init(q);
> +		if (ret)
> +			goto unreg_dev;
> +	}
> +
>  #ifdef CONFIG_VIDEO_VIVID_CEC
>  	if (dev->has_vid_cap && in_type_counter[HDMI]) {
>  		struct cec_adapter *adap;
> @@ -1327,6 +1378,7 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
>  	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_radio_tx);
>  	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_sdr_cap);
>  	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_meta_cap);
> +	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_meta_out);
>  
>  	/* finally start creating the device nodes */
>  	if (dev->has_vid_cap) {
> @@ -1583,6 +1635,36 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
>  			  video_device_node_name(vfd));
>  	}
>  
> +	if (dev->has_meta_out) {
> +		vfd = &dev->meta_out_dev;
> +		snprintf(vfd->name, sizeof(vfd->name),
> +			 "vivid-%03d-meta-out", inst);
> +		vfd->vfl_dir = VFL_DIR_TX;
> +		vfd->fops = &vivid_fops;
> +		vfd->ioctl_ops = &vivid_ioctl_ops;
> +		vfd->device_caps = dev->meta_out_caps;
> +		vfd->release = video_device_release_empty;
> +		vfd->v4l2_dev = &dev->v4l2_dev;
> +		vfd->queue = &dev->vb_meta_out_q;
> +		vfd->lock = &dev->mutex;
> +		vfd->tvnorms = tvnorms_out;
> +		video_set_drvdata(vfd, dev);
> +#ifdef CONFIG_MEDIA_CONTROLLER
> +		dev->meta_out_pad.flags = MEDIA_PAD_FL_SOURCE;
> +		ret = media_entity_pads_init(&vfd->entity, 1,
> +					     &dev->meta_out_pad);
> +		if (ret)
> +			goto unreg_dev;
> +#endif
> +		ret = video_register_device(vfd, VFL_TYPE_GRABBER,
> +					    meta_out_nr[inst]);
> +		if (ret < 0)
> +			goto unreg_dev;
> +		v4l2_info(&dev->v4l2_dev,
> +			  "V4L2 metadata output device registered as %s\n",
> +			  video_device_node_name(vfd));
> +	}
> +
>  #ifdef CONFIG_MEDIA_CONTROLLER
>  	/* Register the media device */
>  	ret = media_device_register(&dev->mdev);
> @@ -1599,6 +1681,7 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
>  	return 0;
>  
>  unreg_dev:
> +	video_unregister_device(&dev->meta_out_dev);
>  	video_unregister_device(&dev->meta_cap_dev);
>  	video_unregister_device(&dev->radio_tx_dev);
>  	video_unregister_device(&dev->radio_rx_dev);
> @@ -1721,6 +1804,11 @@ static int vivid_remove(struct platform_device *pdev)
>  				  video_device_node_name(&dev->meta_cap_dev));
>  			video_unregister_device(&dev->meta_cap_dev);
>  		}
> +		if (dev->has_meta_out) {
> +			v4l2_info(&dev->v4l2_dev, "unregistering %s\n",
> +				  video_device_node_name(&dev->meta_out_dev));
> +			video_unregister_device(&dev->meta_out_dev);
> +		}
>  		cec_unregister_adapter(dev->cec_rx_adap);
>  		for (j = 0; j < MAX_OUTPUTS; j++)
>  			cec_unregister_adapter(dev->cec_tx_adap[j]);
> diff --git a/drivers/media/platform/vivid/vivid-core.h b/drivers/media/platform/vivid/vivid-core.h
> index fd601345a17c..d57066ed31f0 100644
> --- a/drivers/media/platform/vivid/vivid-core.h
> +++ b/drivers/media/platform/vivid/vivid-core.h
> @@ -132,6 +132,7 @@ struct vivid_dev {
>  	struct media_pad		vbi_out_pad;
>  	struct media_pad		sdr_cap_pad;
>  	struct media_pad		meta_cap_pad;
> +	struct media_pad		meta_out_pad;
>  #endif
>  	struct v4l2_ctrl_handler	ctrl_hdl_user_gen;
>  	struct v4l2_ctrl_handler	ctrl_hdl_user_vid;
> @@ -156,6 +157,8 @@ struct vivid_dev {
>  	struct v4l2_ctrl_handler	ctrl_hdl_sdr_cap;
>  	struct video_device		meta_cap_dev;
>  	struct v4l2_ctrl_handler	ctrl_hdl_meta_cap;
> +	struct video_device		meta_out_dev;
> +	struct v4l2_ctrl_handler	ctrl_hdl_meta_out;
>  
>  	spinlock_t			slock;
>  	struct mutex			mutex;
> @@ -169,6 +172,7 @@ struct vivid_dev {
>  	u32				radio_rx_caps;
>  	u32				radio_tx_caps;
>  	u32				meta_cap_caps;
> +	u32				meta_out_caps;
>  
>  	/* supported features */
>  	bool				multiplanar;
> @@ -195,6 +199,7 @@ struct vivid_dev {
>  	bool				has_sdr_cap;
>  	bool				has_fb;
>  	bool				has_meta_cap;
> +	bool				has_meta_out;
>  
>  	bool				can_loop_video;
>  
> @@ -432,6 +437,8 @@ struct vivid_dev {
>  	struct list_head		vid_out_active;
>  	struct vb2_queue		vb_vbi_out_q;
>  	struct list_head		vbi_out_active;
> +	struct vb2_queue		vb_meta_out_q;
> +	struct list_head		meta_out_active;
>  
>  	/* video loop precalculated rectangles */
>  
> @@ -472,6 +479,9 @@ struct vivid_dev {
>  	u32				vbi_out_seq_count;
>  	bool				vbi_out_streaming;
>  	bool				stream_sliced_vbi_out;
> +	u32				meta_out_seq_start;
> +	u32				meta_out_seq_count;
> +	bool				meta_out_streaming;
>  
>  	/* SDR capture */
>  	struct vb2_queue		vb_sdr_cap_q;
> diff --git a/drivers/media/platform/vivid/vivid-ctrls.c b/drivers/media/platform/vivid/vivid-ctrls.c
> index 36e5944b51bb..b250fc3764e2 100644
> --- a/drivers/media/platform/vivid/vivid-ctrls.c
> +++ b/drivers/media/platform/vivid/vivid-ctrls.c
> @@ -1494,6 +1494,7 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
>  	struct v4l2_ctrl_handler *hdl_radio_tx = &dev->ctrl_hdl_radio_tx;
>  	struct v4l2_ctrl_handler *hdl_sdr_cap = &dev->ctrl_hdl_sdr_cap;
>  	struct v4l2_ctrl_handler *hdl_meta_cap = &dev->ctrl_hdl_meta_cap;
> +	struct v4l2_ctrl_handler *hdl_meta_out = &dev->ctrl_hdl_meta_out;
>  
>  	struct v4l2_ctrl_config vivid_ctrl_dv_timings = {
>  		.ops = &vivid_vid_cap_ctrl_ops,
> @@ -1535,6 +1536,8 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
>  	v4l2_ctrl_new_custom(hdl_sdr_cap, &vivid_ctrl_class, NULL);
>  	v4l2_ctrl_handler_init(hdl_meta_cap, 2);
>  	v4l2_ctrl_new_custom(hdl_meta_cap, &vivid_ctrl_class, NULL);
> +	v4l2_ctrl_handler_init(hdl_meta_out, 2);
> +	v4l2_ctrl_new_custom(hdl_meta_out, &vivid_ctrl_class, NULL);
>  
>  	/* User Controls */
>  	dev->volume = v4l2_ctrl_new_std(hdl_user_aud, NULL,
> @@ -1880,7 +1883,13 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
>  			return hdl_meta_cap->error;
>  		dev->meta_cap_dev.ctrl_handler = hdl_meta_cap;
>  	}
> -
> +	if (dev->has_meta_out) {
> +		v4l2_ctrl_add_handler(hdl_meta_out, hdl_user_gen, NULL, false);
> +		v4l2_ctrl_add_handler(hdl_meta_out, hdl_streaming, NULL, false);
> +		if (hdl_meta_out->error)
> +			return hdl_meta_out->error;
> +		dev->meta_out_dev.ctrl_handler = hdl_meta_out;
> +	}
>  	return 0;
>  }
>  
> @@ -1901,4 +1910,5 @@ void vivid_free_controls(struct vivid_dev *dev)
>  	v4l2_ctrl_handler_free(&dev->ctrl_hdl_loop_cap);
>  	v4l2_ctrl_handler_free(&dev->ctrl_hdl_fb);
>  	v4l2_ctrl_handler_free(&dev->ctrl_hdl_meta_cap);
> +	v4l2_ctrl_handler_free(&dev->ctrl_hdl_meta_out);
>  }
> diff --git a/drivers/media/platform/vivid/vivid-kthread-out.c b/drivers/media/platform/vivid/vivid-kthread-out.c
> index ce5bcda2348c..d63addb062d1 100644
> --- a/drivers/media/platform/vivid/vivid-kthread-out.c
> +++ b/drivers/media/platform/vivid/vivid-kthread-out.c
> @@ -38,11 +38,13 @@
>  #include "vivid-osd.h"
>  #include "vivid-ctrls.h"
>  #include "vivid-kthread-out.h"
> +#include "vivid-meta-out.h"
>  
>  static void vivid_thread_vid_out_tick(struct vivid_dev *dev)
>  {
>  	struct vivid_buffer *vid_out_buf = NULL;
>  	struct vivid_buffer *vbi_out_buf = NULL;
> +	struct vivid_buffer *meta_out_buf = NULL;
>  
>  	dprintk(dev, 1, "Video Output Thread Tick\n");
>  
> @@ -69,9 +71,15 @@ static void vivid_thread_vid_out_tick(struct vivid_dev *dev)
>  					 struct vivid_buffer, list);
>  		list_del(&vbi_out_buf->list);
>  	}
> +	if (!list_empty(&dev->meta_out_active) &&
> +	    (dev->meta_out_seq_count & 1)) {
> +		meta_out_buf = list_entry(dev->meta_out_active.next,
> +					  struct vivid_buffer, list);
> +		list_del(&meta_out_buf->list);
> +	}
>  	spin_unlock(&dev->slock);
>  
> -	if (!vid_out_buf && !vbi_out_buf)
> +	if (!vid_out_buf && !vbi_out_buf && !meta_out_buf)
>  		return;
>  
>  	if (vid_out_buf) {
> @@ -111,6 +119,21 @@ static void vivid_thread_vid_out_tick(struct vivid_dev *dev)
>  		dprintk(dev, 2, "vbi_out buffer %d done\n",
>  			vbi_out_buf->vb.vb2_buf.index);
>  	}
> +	if (meta_out_buf) {
> +		v4l2_ctrl_request_setup(meta_out_buf->vb.vb2_buf.req_obj.req,
> +					&dev->ctrl_hdl_meta_out);
> +		v4l2_ctrl_request_complete(meta_out_buf->vb.vb2_buf.req_obj.req,
> +					   &dev->ctrl_hdl_meta_out);
> +		vivid_meta_out_process(dev, meta_out_buf);
> +		meta_out_buf->vb.sequence = dev->meta_out_seq_count;
> +		meta_out_buf->vb.vb2_buf.timestamp =
> +			ktime_get_ns() + dev->time_wrap_offset;
> +		vb2_buffer_done(&meta_out_buf->vb.vb2_buf, dev->dqbuf_error ?
> +				VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE);
> +		dprintk(dev, 2, "meta_out buffer %d done\n",
> +			meta_out_buf->vb.vb2_buf.index);
> +	}
> +
>  	dev->dqbuf_error = false;
>  }
>  
> @@ -136,6 +159,7 @@ static int vivid_thread_vid_out(void *data)
>  		dev->out_seq_count = 0xffffff80U;
>  	dev->jiffies_vid_out = jiffies;
>  	dev->vid_out_seq_start = dev->vbi_out_seq_start = 0;
> +	dev->meta_out_seq_start = 0;
>  	dev->out_seq_resync = false;
>  
>  	for (;;) {
> @@ -178,6 +202,7 @@ static int vivid_thread_vid_out(void *data)
>  		dev->out_seq_count = buffers_since_start + dev->out_seq_offset;
>  		dev->vid_out_seq_count = dev->out_seq_count - dev->vid_out_seq_start;
>  		dev->vbi_out_seq_count = dev->out_seq_count - dev->vbi_out_seq_start;
> +		dev->meta_out_seq_count = dev->out_seq_count - dev->meta_out_seq_start;
>  
>  		vivid_thread_vid_out_tick(dev);
>  		mutex_unlock(&dev->mutex);
> @@ -229,8 +254,10 @@ int vivid_start_generating_vid_out(struct vivid_dev *dev, bool *pstreaming)
>  
>  		if (pstreaming == &dev->vid_out_streaming)
>  			dev->vid_out_seq_start = seq_count;
> -		else
> +		else if (pstreaming == &dev->vbi_out_streaming)
>  			dev->vbi_out_seq_start = seq_count;
> +		else
> +			dev->meta_out_seq_start = seq_count;
>  		*pstreaming = true;
>  		return 0;
>  	}
> @@ -239,6 +266,7 @@ int vivid_start_generating_vid_out(struct vivid_dev *dev, bool *pstreaming)
>  	dev->jiffies_vid_out = jiffies;
>  	dev->vid_out_seq_start = dev->seq_wrap * 128;
>  	dev->vbi_out_seq_start = dev->seq_wrap * 128;
> +	dev->meta_out_seq_start = dev->seq_wrap * 128;
>  
>  	dev->kthread_vid_out = kthread_run(vivid_thread_vid_out, dev,
>  			"%s-vid-out", dev->v4l2_dev.name);
> @@ -296,7 +324,23 @@ void vivid_stop_generating_vid_out(struct vivid_dev *dev, bool *pstreaming)
>  		}
>  	}
>  
> -	if (dev->vid_out_streaming || dev->vbi_out_streaming)
> +	if (pstreaming == &dev->meta_out_streaming) {
> +		while (!list_empty(&dev->meta_out_active)) {
> +			struct vivid_buffer *buf;
> +
> +			buf = list_entry(dev->meta_out_active.next,
> +					 struct vivid_buffer, list);
> +			list_del(&buf->list);
> +			v4l2_ctrl_request_complete(buf->vb.vb2_buf.req_obj.req,
> +						   &dev->ctrl_hdl_meta_out);
> +			vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
> +			dprintk(dev, 2, "meta_out buffer %d done\n",
> +				buf->vb.vb2_buf.index);
> +		}
> +	}
> +
> +	if (dev->vid_out_streaming || dev->vbi_out_streaming ||
> +	    dev->meta_out_streaming)
>  		return;
>  
>  	/* shutdown control thread */
> diff --git a/drivers/media/platform/vivid/vivid-meta-out.c b/drivers/media/platform/vivid/vivid-meta-out.c
> new file mode 100644
> index 000000000000..ff8a039aba72
> --- /dev/null
> +++ b/drivers/media/platform/vivid/vivid-meta-out.c
> @@ -0,0 +1,174 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * vivid-meta-out.c - meta output support functions.
> + */
> +
> +#include <linux/errno.h>
> +#include <linux/kernel.h>
> +#include <linux/videodev2.h>
> +#include <media/v4l2-common.h>
> +#include <linux/usb/video.h>
> +
> +#include "vivid-core.h"
> +#include "vivid-kthread-out.h"
> +#include "vivid-meta-out.h"
> +
> +static int meta_out_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
> +				unsigned int *nplanes, unsigned int sizes[],
> +				struct device *alloc_devs[])
> +{
> +	struct vivid_dev *dev = vb2_get_drv_priv(vq);
> +	unsigned int size =  sizeof(struct vivid_meta_out_buf);
> +
> +	if (!vivid_is_webcam(dev))
> +		return -EINVAL;
> +
> +	if (*nplanes) {
> +		if (sizes[0] < size)
> +			return -EINVAL;
> +	} else {
> +		sizes[0] = size;
> +	}
> +
> +	if (vq->num_buffers + *nbuffers < 2)
> +		*nbuffers = 2 - vq->num_buffers;
> +
> +	*nplanes = 1;
> +	return 0;
> +}
> +
> +static int meta_out_buf_prepare(struct vb2_buffer *vb)
> +{
> +	struct vivid_dev *dev = vb2_get_drv_priv(vb->vb2_queue);
> +	unsigned int size = sizeof(struct vivid_meta_out_buf);
> +
> +	dprintk(dev, 1, "%s\n", __func__);
> +
> +	if (dev->buf_prepare_error) {
> +		/*
> +		 * Error injection: test what happens if buf_prepare() returns
> +		 * an error.
> +		 */
> +		dev->buf_prepare_error = false;
> +		return -EINVAL;
> +	}
> +	if (vb2_plane_size(vb, 0) < size) {
> +		dprintk(dev, 1, "%s data will not fit into plane (%lu < %u)\n",
> +			__func__, vb2_plane_size(vb, 0), size);
> +		return -EINVAL;
> +	}
> +	vb2_set_plane_payload(vb, 0, size);
> +
> +	return 0;
> +}
> +
> +static void meta_out_buf_queue(struct vb2_buffer *vb)
> +{
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +	struct vivid_dev *dev = vb2_get_drv_priv(vb->vb2_queue);
> +	struct vivid_buffer *buf = container_of(vbuf, struct vivid_buffer, vb);
> +
> +	dprintk(dev, 1, "%s\n", __func__);
> +
> +	spin_lock(&dev->slock);
> +	list_add_tail(&buf->list, &dev->meta_out_active);
> +	spin_unlock(&dev->slock);
> +}
> +
> +static int meta_out_start_streaming(struct vb2_queue *vq, unsigned int count)
> +{
> +	struct vivid_dev *dev = vb2_get_drv_priv(vq);
> +	int err;
> +
> +	dprintk(dev, 1, "%s\n", __func__);
> +	dev->meta_out_seq_count = 0;
> +	if (dev->start_streaming_error) {
> +		dev->start_streaming_error = false;
> +		err = -EINVAL;
> +	} else {
> +		err = vivid_start_generating_vid_out(dev,
> +						     &dev->meta_out_streaming);
> +	}
> +	if (err) {
> +		struct vivid_buffer *buf, *tmp;
> +
> +		list_for_each_entry_safe(buf, tmp,
> +					 &dev->meta_out_active, list) {
> +			list_del(&buf->list);
> +			vb2_buffer_done(&buf->vb.vb2_buf,
> +					VB2_BUF_STATE_QUEUED);
> +		}
> +	}
> +	return err;
> +}
> +
> +/* abort streaming and wait for last buffer */
> +static void meta_out_stop_streaming(struct vb2_queue *vq)
> +{
> +	struct vivid_dev *dev = vb2_get_drv_priv(vq);
> +
> +	dprintk(dev, 1, "%s\n", __func__);
> +	vivid_stop_generating_vid_out(dev, &dev->meta_out_streaming);
> +}
> +
> +static void meta_out_buf_request_complete(struct vb2_buffer *vb)
> +{
> +	struct vivid_dev *dev = vb2_get_drv_priv(vb->vb2_queue);
> +
> +	v4l2_ctrl_request_complete(vb->req_obj.req, &dev->ctrl_hdl_meta_out);
> +}
> +
> +const struct vb2_ops vivid_meta_out_qops = {
> +	.queue_setup            = meta_out_queue_setup,
> +	.buf_prepare            = meta_out_buf_prepare,
> +	.buf_queue              = meta_out_buf_queue,
> +	.start_streaming        = meta_out_start_streaming,
> +	.stop_streaming         = meta_out_stop_streaming,
> +	.buf_request_complete   = meta_out_buf_request_complete,
> +	.wait_prepare           = vb2_ops_wait_prepare,
> +	.wait_finish            = vb2_ops_wait_finish,
> +};
> +
> +int vidioc_enum_fmt_meta_out(struct file *file, void  *priv,
> +			     struct v4l2_fmtdesc *f)
> +{
> +	struct vivid_dev *dev = video_drvdata(file);
> +
> +	if (!vivid_is_webcam(dev))
> +		return -EINVAL;
> +
> +	if (f->index > 0)
> +		return -EINVAL;
> +
> +	f->type = V4L2_BUF_TYPE_META_OUTPUT;
> +	f->pixelformat = V4L2_META_FMT_VIVID;
> +	return 0;
> +}
> +
> +int vidioc_g_fmt_meta_out(struct file *file, void *priv,
> +			  struct v4l2_format *f)
> +{
> +	struct vivid_dev *dev = video_drvdata(file);
> +	struct v4l2_meta_format *meta = &f->fmt.meta;
> +
> +	if (!vivid_is_webcam(dev) || !dev->has_meta_out)
> +		return -EINVAL;
> +
> +	meta->dataformat = V4L2_META_FMT_VIVID;
> +	meta->buffersize = sizeof(struct vivid_meta_out_buf);
> +	return 0;
> +}
> +
> +void vivid_meta_out_process(struct vivid_dev *dev,
> +			    struct vivid_buffer *buf)
> +{
> +	struct vivid_meta_out_buf *meta = vb2_plane_vaddr(&buf->vb.vb2_buf, 0);
> +
> +	tpg_s_brightness(&dev->tpg, meta->brightness);
> +	tpg_s_contrast(&dev->tpg, meta->contrast);
> +	tpg_s_saturation(&dev->tpg, meta->saturation);
> +	tpg_s_hue(&dev->tpg, meta->hue);
> +	dprintk(dev, 2, " %s brightness %u contrast %u saturation %u hue %d\n",
> +		__func__, meta->brightness, meta->contrast,
> +		meta->saturation, meta->hue);
> +}
> diff --git a/drivers/media/platform/vivid/vivid-meta-out.h b/drivers/media/platform/vivid/vivid-meta-out.h
> new file mode 100644
> index 000000000000..0c639b7c2842
> --- /dev/null
> +++ b/drivers/media/platform/vivid/vivid-meta-out.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * vivid-meta-out.h - meta output support functions.
> + */
> +#ifndef _VIVID_META_OUT_H_
> +#define _VIVID_META_OUT_H_
> +
> +struct vivid_meta_out_buf {
> +	u16	brightness;
> +	u16	contrast;
> +	u16	saturation;
> +	s16	hue;
> +};
> +
> +void vivid_meta_out_process(struct vivid_dev *dev, struct vivid_buffer *buf);
> +int vidioc_enum_fmt_meta_out(struct file *file, void  *priv,
> +			     struct v4l2_fmtdesc *f);
> +int vidioc_g_fmt_meta_out(struct file *file, void *priv,
> +			  struct v4l2_format *f);
> +int vidioc_s_fmt_meta_out(struct file *file, void *priv,
> +			  struct v4l2_format *f);
> +
> +extern const struct vb2_ops vivid_meta_out_qops;
> +
> +#endif
> diff --git a/drivers/media/platform/vivid/vivid-vid-out.c b/drivers/media/platform/vivid/vivid-vid-out.c
> index a0364ac497f9..ee3446e3217c 100644
> --- a/drivers/media/platform/vivid/vivid-vid-out.c
> +++ b/drivers/media/platform/vivid/vivid-vid-out.c
> @@ -1079,7 +1079,9 @@ int vidioc_s_output(struct file *file, void *priv, unsigned o)
>  	if (o == dev->output)
>  		return 0;
>  
> -	if (vb2_is_busy(&dev->vb_vid_out_q) || vb2_is_busy(&dev->vb_vbi_out_q))
> +	if (vb2_is_busy(&dev->vb_vid_out_q) ||
> +	    vb2_is_busy(&dev->vb_vbi_out_q) ||
> +	    vb2_is_busy(&dev->vb_meta_out_q))
>  		return -EBUSY;
>  
>  	dev->output = o;
> @@ -1090,6 +1092,7 @@ int vidioc_s_output(struct file *file, void *priv, unsigned o)
>  		dev->vid_out_dev.tvnorms = 0;
>  
>  	dev->vbi_out_dev.tvnorms = dev->vid_out_dev.tvnorms;
> +	dev->meta_out_dev.tvnorms = dev->vid_out_dev.tvnorms;
>  	vivid_update_format_out(dev);
>  
>  	v4l2_ctrl_activate(dev->ctrl_display_present, vivid_is_hdmi_out(dev));
> 

Regards,

	Hans
