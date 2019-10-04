Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA939CB7D1
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2019 12:02:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730354AbfJDKCd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Oct 2019 06:02:33 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:43863 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726927AbfJDKCc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 4 Oct 2019 06:02:32 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id GKPpiw1FUjZ8vGKPsitCFw; Fri, 04 Oct 2019 12:02:29 +0200
Subject: Re: [PATCH v8] vivid: Add metadata capture support
To:     Vandana BN <bnvandana@gmail.com>, linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <e36d98bb-b362-5444-38ee-65587454a32d@xs4all.nl>
 <20191004094438.24492-1-bnvandana@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <0e9fb478-18b7-22a4-2eaf-c19ae57678e0@xs4all.nl>
Date:   Fri, 4 Oct 2019 12:02:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191004094438.24492-1-bnvandana@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfErJHqmXRfU86hCjTRXhZT6dhymml2EwG6vBPhAjsm66pRo+uj6MjABujxEGuWCTgDvOaTXi/wKh9zCtCJszAch3JXM+1UQDjrr4BcwX2mKWEhWPW1z3
 fmMMLBfEDMAkBXRbJKH9w5+4/Qf0LbN2VPRSGWimGSLtcQ9tZgqZdR0CWj4ct1h+YDBIf5VArQRujQbjjFmVja5g4mrH9U/FWLwh7B7sRZYxUd65MMXcx0SG
 nZwtWl+Q78r23miF3+6a1dfudq4P2j2fpzaCqEjMop4=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/4/19 11:44 AM, Vandana BN wrote:
> This patch adds meatadata capture support in vivid driver.
> Adds new files for metadata capture.
> Adds vivid controls to generate PTS and SCR for metadata stream.
> 
> Signed-off-by: Vandana BN <bnvandana@gmail.com>
> ---
> V8 - squash commit:fixes for v4l2-compliance issues.
> ---
>  drivers/media/platform/vivid/Makefile         |   2 +-
>  drivers/media/platform/vivid/vivid-core.c     | 107 +++++++++-
>  drivers/media/platform/vivid/vivid-core.h     |  14 ++
>  drivers/media/platform/vivid/vivid-ctrls.c    |  65 ++++++
>  .../media/platform/vivid/vivid-kthread-cap.c  |  55 ++++-
>  drivers/media/platform/vivid/vivid-meta-cap.c | 201 ++++++++++++++++++
>  drivers/media/platform/vivid/vivid-meta-cap.h |  29 +++
>  drivers/media/platform/vivid/vivid-vid-cap.c  |   5 +-
>  8 files changed, 465 insertions(+), 13 deletions(-)
>  create mode 100644 drivers/media/platform/vivid/vivid-meta-cap.c
>  create mode 100644 drivers/media/platform/vivid/vivid-meta-cap.h
> 
> diff --git a/drivers/media/platform/vivid/Makefile b/drivers/media/platform/vivid/Makefile
> index 2f5762e3309a..af94abf9bce6 100644
> --- a/drivers/media/platform/vivid/Makefile
> +++ b/drivers/media/platform/vivid/Makefile
> @@ -3,7 +3,7 @@ vivid-objs := vivid-core.o vivid-ctrls.o vivid-vid-common.o vivid-vbi-gen.o \
>  		vivid-vid-cap.o vivid-vid-out.o vivid-kthread-cap.o vivid-kthread-out.o \
>  		vivid-radio-rx.o vivid-radio-tx.o vivid-radio-common.o \
>  		vivid-rds-gen.o vivid-sdr-cap.o vivid-vbi-cap.o vivid-vbi-out.o \
> -		vivid-osd.o
> +		vivid-osd.o vivid-meta-cap.o
>  ifeq ($(CONFIG_VIDEO_VIVID_CEC),y)
>    vivid-objs += vivid-cec.o
>  endif
> diff --git a/drivers/media/platform/vivid/vivid-core.c b/drivers/media/platform/vivid/vivid-core.c
> index 53315c8dd2bb..97ab197bdec0 100644
> --- a/drivers/media/platform/vivid/vivid-core.c
> +++ b/drivers/media/platform/vivid/vivid-core.c
> @@ -37,6 +37,7 @@
>  #include "vivid-osd.h"
>  #include "vivid-cec.h"
>  #include "vivid-ctrls.h"
> +#include "vivid-meta-cap.h"
>  
>  #define VIVID_MODULE_NAME "vivid"
>  
> @@ -79,6 +80,10 @@ static int radio_tx_nr[VIVID_MAX_DEVS] = { [0 ... (VIVID_MAX_DEVS - 1)] = -1 };
>  module_param_array(radio_tx_nr, int, NULL, 0444);
>  MODULE_PARM_DESC(radio_tx_nr, " radioX start number, -1 is autodetect");
>  
> +static int meta_cap_nr[VIVID_MAX_DEVS] = { [0 ... (VIVID_MAX_DEVS - 1)] = -1 };
> +module_param_array(meta_cap_nr, int, NULL, 0444);
> +MODULE_PARM_DESC(meta_cap_nr, " videoX start number, -1 is autodetect");
> +
>  static int ccs_cap_mode[VIVID_MAX_DEVS] = { [0 ... (VIVID_MAX_DEVS - 1)] = -1 };
>  module_param_array(ccs_cap_mode, int, NULL, 0444);
>  MODULE_PARM_DESC(ccs_cap_mode, " capture crop/compose/scale mode:\n"
> @@ -95,8 +100,13 @@ static unsigned multiplanar[VIVID_MAX_DEVS] = { [0 ... (VIVID_MAX_DEVS - 1)] = 1
>  module_param_array(multiplanar, uint, NULL, 0444);
>  MODULE_PARM_DESC(multiplanar, " 1 (default) creates a single planar device, 2 creates a multiplanar device.");
>  
> -/* Default: video + vbi-cap (raw and sliced) + radio rx + radio tx + sdr + vbi-out + vid-out */
> -static unsigned node_types[VIVID_MAX_DEVS] = { [0 ... (VIVID_MAX_DEVS - 1)] = 0x1d3d };
> +/*
> + * Default: video + vbi-cap (raw and sliced) + radio rx + radio tx + sdr +
> + * vbi-out + vid-out + meta-cap
> + */
> +static unsigned int node_types[VIVID_MAX_DEVS] = {
> +	[0 ... (VIVID_MAX_DEVS - 1)] = 0x21d3d
> +};
>  module_param_array(node_types, uint, NULL, 0444);
>  MODULE_PARM_DESC(node_types, " node types, default is 0x1d3d. Bitmask with the following meaning:\n"
>  			     "\t\t    bit 0: Video Capture node\n"
> @@ -106,7 +116,8 @@ MODULE_PARM_DESC(node_types, " node types, default is 0x1d3d. Bitmask with the f
>  			     "\t\t    bit 8: Video Output node\n"
>  			     "\t\t    bit 10-11: VBI Output node: 0 = none, 1 = raw vbi, 2 = sliced vbi, 3 = both\n"
>  			     "\t\t    bit 12: Radio Transmitter node\n"
> -			     "\t\t    bit 16: Framebuffer for testing overlays");
> +			     "\t\t    bit 16: Framebuffer for testing overlays\n"
> +			     "\t\t    bit 17: Metadata Capture node\n");
>  
>  /* Default: 4 inputs */
>  static unsigned num_inputs[VIVID_MAX_DEVS] = { [0 ... (VIVID_MAX_DEVS - 1)] = 4 };
> @@ -205,7 +216,7 @@ static int vidioc_querycap(struct file *file, void  *priv,
>  	cap->capabilities = dev->vid_cap_caps | dev->vid_out_caps |
>  		dev->vbi_cap_caps | dev->vbi_out_caps |
>  		dev->radio_rx_caps | dev->radio_tx_caps |
> -		dev->sdr_cap_caps | V4L2_CAP_DEVICE_CAPS;
> +		dev->sdr_cap_caps | dev->meta_cap_caps | V4L2_CAP_DEVICE_CAPS;
>  	return 0;
>  }
>  
> @@ -433,7 +444,8 @@ static bool vivid_is_last_user(struct vivid_dev *dev)
>  			vivid_is_in_use(&dev->vbi_out_dev) +
>  			vivid_is_in_use(&dev->sdr_cap_dev) +
>  			vivid_is_in_use(&dev->radio_rx_dev) +
> -			vivid_is_in_use(&dev->radio_tx_dev);
> +			vivid_is_in_use(&dev->radio_tx_dev) +
> +			vivid_is_in_use(&dev->meta_cap_dev);
>  
>  	return uses == 1;
>  }
> @@ -459,6 +471,7 @@ static int vivid_fop_release(struct file *file)
>  		set_bit(V4L2_FL_REGISTERED, &dev->sdr_cap_dev.flags);
>  		set_bit(V4L2_FL_REGISTERED, &dev->radio_rx_dev.flags);
>  		set_bit(V4L2_FL_REGISTERED, &dev->radio_tx_dev.flags);
> +		set_bit(V4L2_FL_REGISTERED, &dev->meta_cap_dev.flags);
>  	}
>  	mutex_unlock(&dev->mutex);
>  	if (file->private_data == dev->overlay_cap_owner)
> @@ -604,6 +617,11 @@ static const struct v4l2_ioctl_ops vivid_ioctl_ops = {
>  	.vidioc_log_status		= vidioc_log_status,
>  	.vidioc_subscribe_event		= vidioc_subscribe_event,
>  	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
> +
> +	.vidioc_enum_fmt_meta_cap	= vidioc_enum_fmt_meta_cap,
> +	.vidioc_g_fmt_meta_cap		= vidioc_g_fmt_meta_cap,
> +	.vidioc_s_fmt_meta_cap		= vidioc_g_fmt_meta_cap,
> +	.vidioc_try_fmt_meta_cap	= vidioc_g_fmt_meta_cap,
>  };
>  
>  /* -----------------------------------------------------------------
> @@ -818,6 +836,9 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
>  			dev->has_scaler_out ? 'Y' : 'N');
>  	}
>  
> +	/* do we create a meta capture device */
> +	dev->has_meta_cap = node_type & 0x20000;
> +
>  	/* end detecting feature set */
>  
>  	if (dev->has_vid_cap) {
> @@ -875,6 +896,16 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
>  		dev->radio_tx_caps = V4L2_CAP_RDS_OUTPUT | V4L2_CAP_MODULATOR |
>  				     V4L2_CAP_READWRITE;
>  
> +	/* set up the capabilities of meta capture device */
> +	if (dev->has_meta_cap) {
> +		dev->meta_cap_caps = V4L2_CAP_META_CAPTURE |
> +				     V4L2_CAP_STREAMING | V4L2_CAP_READWRITE;
> +		if (dev->has_audio_inputs)
> +			dev->meta_cap_caps |= V4L2_CAP_AUDIO;
> +		if (in_type_counter[TV])
> +			dev->meta_cap_caps |= V4L2_CAP_TUNER;
> +	}
> +
>  	ret = -ENOMEM;
>  	/* initialize the test pattern generator */
>  	tpg_init(&dev->tpg, 640, 360);
> @@ -934,6 +965,9 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
>  		v4l2_disable_ioctl(&dev->vbi_cap_dev, VIDIOC_S_AUDIO);
>  		v4l2_disable_ioctl(&dev->vbi_cap_dev, VIDIOC_G_AUDIO);
>  		v4l2_disable_ioctl(&dev->vbi_cap_dev, VIDIOC_ENUMAUDIO);
> +		v4l2_disable_ioctl(&dev->meta_cap_dev, VIDIOC_S_AUDIO);
> +		v4l2_disable_ioctl(&dev->meta_cap_dev, VIDIOC_G_AUDIO);
> +		v4l2_disable_ioctl(&dev->meta_cap_dev, VIDIOC_ENUMAUDIO);
>  	}
>  	if (!dev->has_audio_outputs) {
>  		v4l2_disable_ioctl(&dev->vid_out_dev, VIDIOC_S_AUDOUT);
> @@ -959,12 +993,16 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
>  		v4l2_disable_ioctl(&dev->vid_cap_dev, VIDIOC_G_FREQUENCY);
>  		v4l2_disable_ioctl(&dev->vbi_cap_dev, VIDIOC_S_FREQUENCY);
>  		v4l2_disable_ioctl(&dev->vbi_cap_dev, VIDIOC_G_FREQUENCY);
> +		v4l2_disable_ioctl(&dev->meta_cap_dev, VIDIOC_S_FREQUENCY);
> +		v4l2_disable_ioctl(&dev->meta_cap_dev, VIDIOC_G_FREQUENCY);
>  	}
>  	if (!has_tuner) {
>  		v4l2_disable_ioctl(&dev->vid_cap_dev, VIDIOC_S_TUNER);
>  		v4l2_disable_ioctl(&dev->vid_cap_dev, VIDIOC_G_TUNER);
>  		v4l2_disable_ioctl(&dev->vbi_cap_dev, VIDIOC_S_TUNER);
>  		v4l2_disable_ioctl(&dev->vbi_cap_dev, VIDIOC_G_TUNER);
> +		v4l2_disable_ioctl(&dev->meta_cap_dev, VIDIOC_S_TUNER);
> +		v4l2_disable_ioctl(&dev->meta_cap_dev, VIDIOC_G_TUNER);
>  	}
>  	if (in_type_counter[HDMI] == 0) {
>  		v4l2_disable_ioctl(&dev->vid_cap_dev, VIDIOC_S_EDID);
> @@ -990,6 +1028,7 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
>  	v4l2_disable_ioctl(&dev->vid_cap_dev, VIDIOC_S_HW_FREQ_SEEK);
>  	v4l2_disable_ioctl(&dev->vbi_cap_dev, VIDIOC_S_HW_FREQ_SEEK);
>  	v4l2_disable_ioctl(&dev->sdr_cap_dev, VIDIOC_S_HW_FREQ_SEEK);
> +	v4l2_disable_ioctl(&dev->meta_cap_dev, VIDIOC_S_HW_FREQ_SEEK);
>  	v4l2_disable_ioctl(&dev->vid_out_dev, VIDIOC_S_FREQUENCY);
>  	v4l2_disable_ioctl(&dev->vid_out_dev, VIDIOC_G_FREQUENCY);
>  	v4l2_disable_ioctl(&dev->vid_out_dev, VIDIOC_ENUM_FRAMESIZES);
> @@ -1078,6 +1117,7 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
>  	INIT_LIST_HEAD(&dev->vbi_cap_active);
>  	INIT_LIST_HEAD(&dev->vbi_out_active);
>  	INIT_LIST_HEAD(&dev->sdr_cap_active);
> +	INIT_LIST_HEAD(&dev->meta_cap_active);
>  
>  	INIT_LIST_HEAD(&dev->cec_work_list);
>  	spin_lock_init(&dev->cec_slock);
> @@ -1225,6 +1265,27 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
>  				dev->fb_info.node);
>  	}
>  
> +	if (dev->has_meta_cap) {
> +		/* initialize meta_cap queue */
> +		q = &dev->vb_meta_cap_q;
> +		q->type = V4L2_BUF_TYPE_META_CAPTURE;
> +		q->io_modes = VB2_MMAP | VB2_DMABUF | VB2_READ;
> +		if (!allocator)
> +			q->io_modes |= VB2_USERPTR;
> +		q->drv_priv = dev;
> +		q->buf_struct_size = sizeof(struct vivid_buffer);
> +		q->ops = &vivid_meta_cap_qops;
> +		q->mem_ops = vivid_mem_ops[allocator];
> +		q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> +		q->min_buffers_needed = 2;
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
> @@ -1265,6 +1326,7 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
>  	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_radio_rx);
>  	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_radio_tx);
>  	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_sdr_cap);
> +	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_meta_cap);
>  
>  	/* finally start creating the device nodes */
>  	if (dev->has_vid_cap) {
> @@ -1492,6 +1554,35 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
>  					  video_device_node_name(vfd));
>  	}
>  
> +	if (dev->has_meta_cap) {
> +		vfd = &dev->meta_cap_dev;
> +		snprintf(vfd->name, sizeof(vfd->name),
> +			 "vivid-%03d-meta-cap", inst);
> +		vfd->fops = &vivid_fops;
> +		vfd->ioctl_ops = &vivid_ioctl_ops;
> +		vfd->device_caps = dev->meta_cap_caps;
> +		vfd->release = video_device_release_empty;
> +		vfd->v4l2_dev = &dev->v4l2_dev;
> +		vfd->queue = &dev->vb_meta_cap_q;
> +		vfd->lock = &dev->mutex;
> +		vfd->tvnorms = tvnorms_cap;
> +		video_set_drvdata(vfd, dev);
> +#ifdef CONFIG_MEDIA_CONTROLLER
> +		dev->meta_cap_pad.flags = MEDIA_PAD_FL_SINK;
> +		ret = media_entity_pads_init(&vfd->entity, 1,
> +					     &dev->meta_cap_pad);
> +		if (ret)
> +			goto unreg_dev;
> +#endif
> +		ret = video_register_device(vfd, VFL_TYPE_GRABBER,
> +					    meta_cap_nr[inst]);
> +		if (ret < 0)
> +			goto unreg_dev;
> +		v4l2_info(&dev->v4l2_dev,
> +			  "V4L2 metadata capture device registered as %s\n",
> +			  video_device_node_name(vfd));
> +	}
> +
>  #ifdef CONFIG_MEDIA_CONTROLLER
>  	/* Register the media device */
>  	ret = media_device_register(&dev->mdev);
> @@ -1508,6 +1599,7 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
>  	return 0;
>  
>  unreg_dev:
> +	video_unregister_device(&dev->meta_cap_dev);
>  	video_unregister_device(&dev->radio_tx_dev);
>  	video_unregister_device(&dev->radio_rx_dev);
>  	video_unregister_device(&dev->sdr_cap_dev);
> @@ -1624,6 +1716,11 @@ static int vivid_remove(struct platform_device *pdev)
>  			unregister_framebuffer(&dev->fb_info);
>  			vivid_fb_release_buffers(dev);
>  		}
> +		if (dev->has_meta_cap) {
> +			v4l2_info(&dev->v4l2_dev, "unregistering %s\n",
> +				  video_device_node_name(&dev->meta_cap_dev));
> +			video_unregister_device(&dev->meta_cap_dev);
> +		}
>  		cec_unregister_adapter(dev->cec_rx_adap);
>  		for (j = 0; j < MAX_OUTPUTS; j++)
>  			cec_unregister_adapter(dev->cec_tx_adap[j]);
> diff --git a/drivers/media/platform/vivid/vivid-core.h b/drivers/media/platform/vivid/vivid-core.h
> index 7ebb14673c75..fd601345a17c 100644
> --- a/drivers/media/platform/vivid/vivid-core.h
> +++ b/drivers/media/platform/vivid/vivid-core.h
> @@ -131,6 +131,7 @@ struct vivid_dev {
>  	struct media_pad		vbi_cap_pad;
>  	struct media_pad		vbi_out_pad;
>  	struct media_pad		sdr_cap_pad;
> +	struct media_pad		meta_cap_pad;
>  #endif
>  	struct v4l2_ctrl_handler	ctrl_hdl_user_gen;
>  	struct v4l2_ctrl_handler	ctrl_hdl_user_vid;
> @@ -153,6 +154,9 @@ struct vivid_dev {
>  	struct v4l2_ctrl_handler	ctrl_hdl_radio_tx;
>  	struct video_device		sdr_cap_dev;
>  	struct v4l2_ctrl_handler	ctrl_hdl_sdr_cap;
> +	struct video_device		meta_cap_dev;
> +	struct v4l2_ctrl_handler	ctrl_hdl_meta_cap;
> +
>  	spinlock_t			slock;
>  	struct mutex			mutex;
>  
> @@ -164,6 +168,7 @@ struct vivid_dev {
>  	u32				sdr_cap_caps;
>  	u32				radio_rx_caps;
>  	u32				radio_tx_caps;
> +	u32				meta_cap_caps;
>  
>  	/* supported features */
>  	bool				multiplanar;
> @@ -189,6 +194,7 @@ struct vivid_dev {
>  	bool				has_radio_tx;
>  	bool				has_sdr_cap;
>  	bool				has_fb;
> +	bool				has_meta_cap;
>  
>  	bool				can_loop_video;
>  
> @@ -390,6 +396,8 @@ struct vivid_dev {
>  	struct list_head		vid_cap_active;
>  	struct vb2_queue		vb_vbi_cap_q;
>  	struct list_head		vbi_cap_active;
> +	struct vb2_queue		vb_meta_cap_q;
> +	struct list_head		meta_cap_active;
>  
>  	/* thread for generating video capture stream */
>  	struct task_struct		*kthread_vid_cap;
> @@ -407,6 +415,9 @@ struct vivid_dev {
>  	u32				vbi_cap_seq_count;
>  	bool				vbi_cap_streaming;
>  	bool				stream_sliced_vbi_cap;
> +	u32				meta_cap_seq_start;
> +	u32				meta_cap_seq_count;
> +	bool				meta_cap_streaming;
>  
>  	/* video output */
>  	const struct vivid_fmt		*fmt_out;
> @@ -527,6 +538,9 @@ struct vivid_dev {
>  	/* CEC OSD String */
>  	char				osd[14];
>  	unsigned long			osd_jiffies;
> +
> +	bool				meta_pts;
> +	bool				meta_scr;
>  };
>  
>  static inline bool vivid_is_webcam(const struct vivid_dev *dev)
> diff --git a/drivers/media/platform/vivid/vivid-ctrls.c b/drivers/media/platform/vivid/vivid-ctrls.c
> index cb19a9a73092..36e5944b51bb 100644
> --- a/drivers/media/platform/vivid/vivid-ctrls.c
> +++ b/drivers/media/platform/vivid/vivid-ctrls.c
> @@ -94,6 +94,9 @@
>  
>  #define VIVID_CID_SDR_CAP_FM_DEVIATION	(VIVID_CID_VIVID_BASE + 110)
>  
> +#define VIVID_CID_META_CAP_GENERATE_PTS	(VIVID_CID_VIVID_BASE + 111)
> +#define VIVID_CID_META_CAP_GENERATE_SCR	(VIVID_CID_VIVID_BASE + 112)
> +
>  /* General User Controls */
>  
>  static int vivid_user_gen_s_ctrl(struct v4l2_ctrl *ctrl)
> @@ -110,6 +113,7 @@ static int vivid_user_gen_s_ctrl(struct v4l2_ctrl *ctrl)
>  		clear_bit(V4L2_FL_REGISTERED, &dev->sdr_cap_dev.flags);
>  		clear_bit(V4L2_FL_REGISTERED, &dev->radio_rx_dev.flags);
>  		clear_bit(V4L2_FL_REGISTERED, &dev->radio_tx_dev.flags);
> +		clear_bit(V4L2_FL_REGISTERED, &dev->meta_cap_dev.flags);
>  		break;
>  	case VIVID_CID_BUTTON:
>  		dev->button_pressed = 30;
> @@ -1421,6 +1425,47 @@ static const struct v4l2_ctrl_config vivid_ctrl_sdr_cap_fm_deviation = {
>  	.step =     1,
>  };
>  
> +/* Metadata Capture Control */
> +
> +static int vivid_meta_cap_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct vivid_dev *dev = container_of(ctrl->handler, struct vivid_dev,
> +					     ctrl_hdl_meta_cap);
> +
> +	switch (ctrl->id) {
> +	case VIVID_CID_META_CAP_GENERATE_PTS:
> +		dev->meta_pts = ctrl->val;
> +		break;
> +	case VIVID_CID_META_CAP_GENERATE_SCR:
> +		dev->meta_scr = ctrl->val;
> +		break;
> +	}
> +	return 0;
> +}
> +
> +static const struct v4l2_ctrl_ops vivid_meta_cap_ctrl_ops = {
> +	.s_ctrl = vivid_meta_cap_s_ctrl,
> +};
> +
> +static const struct v4l2_ctrl_config vivid_ctrl_meta_has_pts = {
> +	.ops = &vivid_meta_cap_ctrl_ops,
> +	.id = VIVID_CID_META_CAP_GENERATE_PTS,
> +	.name = "Generate PTS",
> +	.type = V4L2_CTRL_TYPE_BOOLEAN,
> +	.max = 1,
> +	.def = 1,
> +	.step = 1,
> +};
> +
> +static const struct v4l2_ctrl_config vivid_ctrl_meta_has_src_clk = {
> +	.ops = &vivid_meta_cap_ctrl_ops,
> +	.id = VIVID_CID_META_CAP_GENERATE_SCR,
> +	.name = "Generate SCR",
> +	.type = V4L2_CTRL_TYPE_BOOLEAN,
> +	.max = 1,
> +	.def = 1,
> +	.step = 1,
> +};
>  
>  static const struct v4l2_ctrl_config vivid_ctrl_class = {
>  	.ops = &vivid_user_gen_ctrl_ops,
> @@ -1448,6 +1493,8 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
>  	struct v4l2_ctrl_handler *hdl_radio_rx = &dev->ctrl_hdl_radio_rx;
>  	struct v4l2_ctrl_handler *hdl_radio_tx = &dev->ctrl_hdl_radio_tx;
>  	struct v4l2_ctrl_handler *hdl_sdr_cap = &dev->ctrl_hdl_sdr_cap;
> +	struct v4l2_ctrl_handler *hdl_meta_cap = &dev->ctrl_hdl_meta_cap;
> +
>  	struct v4l2_ctrl_config vivid_ctrl_dv_timings = {
>  		.ops = &vivid_vid_cap_ctrl_ops,
>  		.id = VIVID_CID_DV_TIMINGS,
> @@ -1486,6 +1533,8 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
>  	v4l2_ctrl_new_custom(hdl_radio_tx, &vivid_ctrl_class, NULL);
>  	v4l2_ctrl_handler_init(hdl_sdr_cap, 19);
>  	v4l2_ctrl_new_custom(hdl_sdr_cap, &vivid_ctrl_class, NULL);
> +	v4l2_ctrl_handler_init(hdl_meta_cap, 2);
> +	v4l2_ctrl_new_custom(hdl_meta_cap, &vivid_ctrl_class, NULL);
>  
>  	/* User Controls */
>  	dev->volume = v4l2_ctrl_new_std(hdl_user_aud, NULL,
> @@ -1743,6 +1792,13 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
>  		v4l2_ctrl_new_custom(hdl_sdr_cap,
>  			&vivid_ctrl_sdr_cap_fm_deviation, NULL);
>  	}
> +	if (dev->has_meta_cap) {
> +		v4l2_ctrl_new_custom(hdl_meta_cap,
> +				     &vivid_ctrl_meta_has_pts, NULL);
> +		v4l2_ctrl_new_custom(hdl_meta_cap,
> +				     &vivid_ctrl_meta_has_src_clk, NULL);
> +	}
> +
>  	if (hdl_user_gen->error)
>  		return hdl_user_gen->error;
>  	if (hdl_user_vid->error)
> @@ -1817,6 +1873,14 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
>  			return hdl_sdr_cap->error;
>  		dev->sdr_cap_dev.ctrl_handler = hdl_sdr_cap;
>  	}
> +	if (dev->has_meta_cap) {
> +		v4l2_ctrl_add_handler(hdl_meta_cap, hdl_user_gen, NULL, false);
> +		v4l2_ctrl_add_handler(hdl_meta_cap, hdl_streaming, NULL, false);
> +		if (hdl_meta_cap->error)
> +			return hdl_meta_cap->error;
> +		dev->meta_cap_dev.ctrl_handler = hdl_meta_cap;
> +	}
> +
>  	return 0;
>  }
>  
> @@ -1836,4 +1900,5 @@ void vivid_free_controls(struct vivid_dev *dev)
>  	v4l2_ctrl_handler_free(&dev->ctrl_hdl_sdtv_cap);
>  	v4l2_ctrl_handler_free(&dev->ctrl_hdl_loop_cap);
>  	v4l2_ctrl_handler_free(&dev->ctrl_hdl_fb);
> +	v4l2_ctrl_handler_free(&dev->ctrl_hdl_meta_cap);
>  }
> diff --git a/drivers/media/platform/vivid/vivid-kthread-cap.c b/drivers/media/platform/vivid/vivid-kthread-cap.c
> index 003319d7816d..95bb4551ee1d 100644
> --- a/drivers/media/platform/vivid/vivid-kthread-cap.c
> +++ b/drivers/media/platform/vivid/vivid-kthread-cap.c
> @@ -39,6 +39,7 @@
>  #include "vivid-osd.h"
>  #include "vivid-ctrls.h"
>  #include "vivid-kthread-cap.h"
> +#include "vivid-meta-cap.h"
>  
>  static inline v4l2_std_id vivid_get_std_cap(const struct vivid_dev *dev)
>  {
> @@ -677,6 +678,7 @@ static noinline_for_stack void vivid_thread_vid_cap_tick(struct vivid_dev *dev,
>  {
>  	struct vivid_buffer *vid_cap_buf = NULL;
>  	struct vivid_buffer *vbi_cap_buf = NULL;
> +	struct vivid_buffer *meta_cap_buf = NULL;
>  	u64 f_time = 0;
>  
>  	dprintk(dev, 1, "Video Capture Thread Tick\n");
> @@ -704,15 +706,20 @@ static noinline_for_stack void vivid_thread_vid_cap_tick(struct vivid_dev *dev,
>  			list_del(&vbi_cap_buf->list);
>  		}
>  	}
> +	if (!list_empty(&dev->meta_cap_active)) {
> +		meta_cap_buf = list_entry(dev->meta_cap_active.next,
> +					  struct vivid_buffer, list);
> +		list_del(&meta_cap_buf->list);
> +	}
> +
>  	spin_unlock(&dev->slock);
>  
> -	if (!vid_cap_buf && !vbi_cap_buf)
> +	if (!vid_cap_buf && !vbi_cap_buf && !meta_cap_buf)
>  		goto update_mv;
>  
>  	f_time = dev->cap_frame_period * dev->vid_cap_seq_count +
> -		 dev->cap_stream_start + dev->time_wrap_offset;
> -	if (!dev->tstamp_src_is_soe)
> -		f_time += dev->cap_frame_eof_offset;
> +		 dev->cap_stream_start + dev->time_wrap_offset +
> +		 dev->cap_frame_eof_offset;

No, keep the code as in v7: f_time is the time at the beginning of the frame.

Then only add dev->cap_frame_eof_offset where it is needed.

Subtracting time values is harder to understand than adding time values.

>  
>  	if (vid_cap_buf) {
>  		v4l2_ctrl_request_setup(vid_cap_buf->vb.vb2_buf.req_obj.req,
> @@ -735,6 +742,8 @@ static noinline_for_stack void vivid_thread_vid_cap_tick(struct vivid_dev *dev,
>  				vid_cap_buf->vb.vb2_buf.index);
>  
>  		vid_cap_buf->vb.vb2_buf.timestamp = f_time;
> +		if (dev->tstamp_src_is_soe)
> +			vid_cap_buf->vb.vb2_buf.timestamp -= dev->cap_frame_eof_offset;

This becomes:

		if (!dev->tstamp_src_is_soe)
			vid_cap_buf->vb.vb2_buf.timestamp += dev->cap_frame_eof_offset;

>  	}
>  
>  	if (vbi_cap_buf) {
> @@ -758,6 +767,20 @@ static noinline_for_stack void vivid_thread_vid_cap_tick(struct vivid_dev *dev,
>  		do_div(vbi_period, 100);
>  		vbi_cap_buf->vb.vb2_buf.timestamp = f_time + vbi_period;

This becomes f_time + dev->cap_frame_eof_offset + vbi_period;

>  	}
> +
> +	if (meta_cap_buf) {
> +		v4l2_ctrl_request_setup(meta_cap_buf->vb.vb2_buf.req_obj.req,
> +					&dev->ctrl_hdl_meta_cap);
> +		vivid_meta_cap_fillbuff(dev, meta_cap_buf, f_time);

This is now wrong in v8, since vivid_meta_cap_fillbuff() expects the start-of-frame
time. If f_time is once again the start-of-frame time, then this is correct again.

> +		v4l2_ctrl_request_complete(meta_cap_buf->vb.vb2_buf.req_obj.req,
> +					   &dev->ctrl_hdl_meta_cap);
> +		vb2_buffer_done(&meta_cap_buf->vb.vb2_buf, dev->dqbuf_error ?
> +				VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE);
> +		dprintk(dev, 2, "meta_cap %d done\n",
> +			meta_cap_buf->vb.vb2_buf.index);
> +		meta_cap_buf->vb.vb2_buf.timestamp = f_time;

This becomes f_time + dev->cap_frame_eof_offset;

Metadata always arrives at the end of the frame.

Regards,

	Hans

> +	}
> +
>  	dev->dqbuf_error = false;
>  
>  update_mv:
> @@ -835,6 +858,7 @@ static int vivid_thread_vid_cap(void *data)
>  		dev->cap_seq_count = buffers_since_start + dev->cap_seq_offset;
>  		dev->vid_cap_seq_count = dev->cap_seq_count - dev->vid_cap_seq_start;
>  		dev->vbi_cap_seq_count = dev->cap_seq_count - dev->vbi_cap_seq_start;
> +		dev->meta_cap_seq_count = dev->cap_seq_count - dev->meta_cap_seq_start;
>  
>  		vivid_thread_vid_cap_tick(dev, dropped_bufs);
>  
> @@ -883,8 +907,10 @@ int vivid_start_generating_vid_cap(struct vivid_dev *dev, bool *pstreaming)
>  
>  		if (pstreaming == &dev->vid_cap_streaming)
>  			dev->vid_cap_seq_start = seq_count;
> -		else
> +		else if (pstreaming == &dev->vbi_cap_streaming)
>  			dev->vbi_cap_seq_start = seq_count;
> +		else
> +			dev->meta_cap_seq_start = seq_count;
>  		*pstreaming = true;
>  		return 0;
>  	}
> @@ -894,6 +920,7 @@ int vivid_start_generating_vid_cap(struct vivid_dev *dev, bool *pstreaming)
>  
>  	dev->vid_cap_seq_start = dev->seq_wrap * 128;
>  	dev->vbi_cap_seq_start = dev->seq_wrap * 128;
> +	dev->meta_cap_seq_start = dev->seq_wrap * 128;
>  
>  	dev->kthread_vid_cap = kthread_run(vivid_thread_vid_cap, dev,
>  			"%s-vid-cap", dev->v4l2_dev.name);
> @@ -951,7 +978,23 @@ void vivid_stop_generating_vid_cap(struct vivid_dev *dev, bool *pstreaming)
>  		}
>  	}
>  
> -	if (dev->vid_cap_streaming || dev->vbi_cap_streaming)
> +	if (pstreaming == &dev->meta_cap_streaming) {
> +		while (!list_empty(&dev->meta_cap_active)) {
> +			struct vivid_buffer *buf;
> +
> +			buf = list_entry(dev->meta_cap_active.next,
> +					 struct vivid_buffer, list);
> +			list_del(&buf->list);
> +			v4l2_ctrl_request_complete(buf->vb.vb2_buf.req_obj.req,
> +						   &dev->ctrl_hdl_meta_cap);
> +			vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
> +			dprintk(dev, 2, "meta_cap buffer %d done\n",
> +				buf->vb.vb2_buf.index);
> +		}
> +	}
> +
> +	if (dev->vid_cap_streaming || dev->vbi_cap_streaming ||
> +	    dev->meta_cap_streaming)
>  		return;
>  
>  	/* shutdown control thread */
> diff --git a/drivers/media/platform/vivid/vivid-meta-cap.c b/drivers/media/platform/vivid/vivid-meta-cap.c
> new file mode 100644
> index 000000000000..b2f42c09abe1
> --- /dev/null
> +++ b/drivers/media/platform/vivid/vivid-meta-cap.c
> @@ -0,0 +1,201 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * vivid-meta-cap.c - meta capture support functions.
> + */
> +
> +#include <linux/errno.h>
> +#include <linux/kernel.h>
> +#include <linux/videodev2.h>
> +#include <media/v4l2-common.h>
> +#include <linux/usb/video.h>
> +
> +#include "vivid-core.h"
> +#include "vivid-kthread-cap.h"
> +#include "vivid-meta-cap.h"
> +
> +static int meta_cap_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
> +				unsigned int *nplanes, unsigned int sizes[],
> +				struct device *alloc_devs[])
> +{
> +	struct vivid_dev *dev = vb2_get_drv_priv(vq);
> +	unsigned int size =  sizeof(struct vivid_uvc_meta_buf);
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
> +static int meta_cap_buf_prepare(struct vb2_buffer *vb)
> +{
> +	struct vivid_dev *dev = vb2_get_drv_priv(vb->vb2_queue);
> +	unsigned int size = sizeof(struct vivid_uvc_meta_buf);
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
> +static void meta_cap_buf_queue(struct vb2_buffer *vb)
> +{
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +	struct vivid_dev *dev = vb2_get_drv_priv(vb->vb2_queue);
> +	struct vivid_buffer *buf = container_of(vbuf, struct vivid_buffer, vb);
> +
> +	dprintk(dev, 1, "%s\n", __func__);
> +
> +	spin_lock(&dev->slock);
> +	list_add_tail(&buf->list, &dev->meta_cap_active);
> +	spin_unlock(&dev->slock);
> +}
> +
> +static int meta_cap_start_streaming(struct vb2_queue *vq, unsigned int count)
> +{
> +	struct vivid_dev *dev = vb2_get_drv_priv(vq);
> +	int err;
> +
> +	dprintk(dev, 1, "%s\n", __func__);
> +	dev->meta_cap_seq_count = 0;
> +	if (dev->start_streaming_error) {
> +		dev->start_streaming_error = false;
> +		err = -EINVAL;
> +	} else {
> +		err = vivid_start_generating_vid_cap(dev,
> +						     &dev->meta_cap_streaming);
> +	}
> +	if (err) {
> +		struct vivid_buffer *buf, *tmp;
> +
> +		list_for_each_entry_safe(buf, tmp,
> +					 &dev->meta_cap_active, list) {
> +			list_del(&buf->list);
> +			vb2_buffer_done(&buf->vb.vb2_buf,
> +					VB2_BUF_STATE_QUEUED);
> +		}
> +	}
> +	return err;
> +}
> +
> +/* abort streaming and wait for last buffer */
> +static void meta_cap_stop_streaming(struct vb2_queue *vq)
> +{
> +	struct vivid_dev *dev = vb2_get_drv_priv(vq);
> +
> +	dprintk(dev, 1, "%s\n", __func__);
> +	vivid_stop_generating_vid_cap(dev, &dev->meta_cap_streaming);
> +}
> +
> +static void meta_cap_buf_request_complete(struct vb2_buffer *vb)
> +{
> +	struct vivid_dev *dev = vb2_get_drv_priv(vb->vb2_queue);
> +
> +	v4l2_ctrl_request_complete(vb->req_obj.req, &dev->ctrl_hdl_meta_cap);
> +}
> +
> +const struct vb2_ops vivid_meta_cap_qops = {
> +	.queue_setup		= meta_cap_queue_setup,
> +	.buf_prepare		= meta_cap_buf_prepare,
> +	.buf_queue		= meta_cap_buf_queue,
> +	.start_streaming	= meta_cap_start_streaming,
> +	.stop_streaming		= meta_cap_stop_streaming,
> +	.buf_request_complete	= meta_cap_buf_request_complete,
> +	.wait_prepare		= vb2_ops_wait_prepare,
> +	.wait_finish		= vb2_ops_wait_finish,
> +};
> +
> +int vidioc_enum_fmt_meta_cap(struct file *file, void  *priv,
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
> +	f->type = V4L2_BUF_TYPE_META_CAPTURE;
> +	f->pixelformat = V4L2_META_FMT_UVC;
> +	return 0;
> +}
> +
> +int vidioc_g_fmt_meta_cap(struct file *file, void *priv,
> +			  struct v4l2_format *f)
> +{
> +	struct vivid_dev *dev = video_drvdata(file);
> +	struct v4l2_meta_format *meta = &f->fmt.meta;
> +
> +	if (!vivid_is_webcam(dev) || !dev->has_meta_cap)
> +		return -EINVAL;
> +
> +	meta->dataformat = V4L2_META_FMT_UVC;
> +	meta->buffersize = sizeof(struct vivid_uvc_meta_buf);
> +	return 0;
> +}
> +
> +void vivid_meta_cap_fillbuff(struct vivid_dev *dev,
> +			     struct vivid_buffer *buf, u32 soe)
> +{
> +	struct vivid_uvc_meta_buf *meta = vb2_plane_vaddr(&buf->vb.vb2_buf, 0);
> +	int buf_off = 0;
> +
> +	buf->vb.sequence = dev->meta_cap_seq_count;
> +	if (dev->field_cap == V4L2_FIELD_ALTERNATE)
> +		buf->vb.sequence /= 2;
> +	memset(meta, 1, vb2_plane_size(&buf->vb.vb2_buf, 0));
> +
> +	meta->ns = ktime_get_ns();
> +	meta->sof = buf->vb.sequence * 30;
> +	meta->length = sizeof(*meta) - offsetof(struct vivid_uvc_meta_buf, length);
> +	meta->flags = UVC_STREAM_EOH | UVC_STREAM_EOF;
> +
> +	if ((buf->vb.sequence % 2) == 0)
> +		meta->flags |= UVC_STREAM_FID;
> +
> +	dprintk(dev, 2, "%s ns:%llu sof:%4d len:%u flags: 0x%02x",
> +		__func__, meta->ns, meta->sof, meta->length, meta->flags);
> +	if (dev->meta_pts) {
> +		meta->flags |= UVC_STREAM_PTS;
> +		meta->buf[0] = soe / VIVID_META_CLOCK_UNIT;
> +		buf_off = 4;
> +		dprintk(dev, 2, " pts: %u\n", *(__u32 *)(meta->buf));
> +	}
> +
> +	if (dev->meta_scr) {
> +		meta->flags |= UVC_STREAM_SCR;
> +		meta->buf[buf_off] = (soe + dev->cap_frame_eof_offset)
> +					/ VIVID_META_CLOCK_UNIT;
> +
> +		meta->buf[buf_off + 4] = (buf->vb.sequence * 30) % 1000;
> +		dprintk(dev, 2, " stc: %u, sof counter: %u\n",
> +			*(__u32 *)(meta->buf + buf_off),
> +			*(__u16 *)(meta->buf + buf_off + 4));
> +	}
> +	dprintk(dev, 2, "\n");
> +}
> diff --git a/drivers/media/platform/vivid/vivid-meta-cap.h b/drivers/media/platform/vivid/vivid-meta-cap.h
> new file mode 100644
> index 000000000000..58d23f2aa800
> --- /dev/null
> +++ b/drivers/media/platform/vivid/vivid-meta-cap.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * vivid-meta-cap.h - meta capture support functions.
> + */
> +#ifndef _VIVID_META_CAP_H_
> +#define _VIVID_META_CAP_H_
> +
> +#define VIVID_META_CLOCK_UNIT	10 /* 100 MHz */
> +
> +struct vivid_uvc_meta_buf {
> +	__u64 ns;
> +	__u16 sof;
> +	__u8 length;
> +	__u8 flags;
> +	__u8 buf[10]; /* PTS(4)+STC(4)+SOF(2) */
> +} __packed;
> +
> +void vivid_meta_cap_fillbuff(struct vivid_dev *dev,
> +			     struct vivid_buffer *buf, u32 soe);
> +
> +int vidioc_enum_fmt_meta_cap(struct file *file, void  *priv,
> +			     struct v4l2_fmtdesc *f);
> +
> +int vidioc_g_fmt_meta_cap(struct file *file, void *priv,
> +			  struct v4l2_format *f);
> +
> +extern const struct vb2_ops vivid_meta_cap_qops;
> +
> +#endif
> diff --git a/drivers/media/platform/vivid/vivid-vid-cap.c b/drivers/media/platform/vivid/vivid-vid-cap.c
> index 2d030732feac..e94beef008c8 100644
> --- a/drivers/media/platform/vivid/vivid-vid-cap.c
> +++ b/drivers/media/platform/vivid/vivid-vid-cap.c
> @@ -1356,7 +1356,9 @@ int vidioc_s_input(struct file *file, void *priv, unsigned i)
>  	if (i == dev->input)
>  		return 0;
>  
> -	if (vb2_is_busy(&dev->vb_vid_cap_q) || vb2_is_busy(&dev->vb_vbi_cap_q))
> +	if (vb2_is_busy(&dev->vb_vid_cap_q) ||
> +	    vb2_is_busy(&dev->vb_vbi_cap_q) ||
> +	    vb2_is_busy(&dev->vb_meta_cap_q))
>  		return -EBUSY;
>  
>  	dev->input = i;
> @@ -1366,6 +1368,7 @@ int vidioc_s_input(struct file *file, void *priv, unsigned i)
>  		dev->vid_cap_dev.tvnorms = V4L2_STD_ALL;
>  	}
>  	dev->vbi_cap_dev.tvnorms = dev->vid_cap_dev.tvnorms;
> +	dev->meta_cap_dev.tvnorms = dev->vid_cap_dev.tvnorms;
>  	vivid_update_format_cap(dev, false);
>  
>  	if (dev->colorspace) {
> 

