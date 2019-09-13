Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F5FBB1CC3
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2019 14:01:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728523AbfIMMBs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Sep 2019 08:01:48 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:34783 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727998AbfIMMBs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Sep 2019 08:01:48 -0400
Received: from [IPv6:2001:420:44c1:2577:888a:538c:8dda:557b] ([IPv6:2001:420:44c1:2577:888a:538c:8dda:557b])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 8kGfiWKRcV17O8kGki2PbF; Fri, 13 Sep 2019 14:01:43 +0200
Subject: Re: [PATCH v4] vivid: Add metadata capture support
To:     Vandana BN <bnvandana@gmail.com>, linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <20190909095210.8123-1-bnvandana@gmail.com>
 <20190911111753.455-1-bnvandana@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <ef86234a-f60c-3383-bf32-4c140ef6062e@xs4all.nl>
Date:   Fri, 13 Sep 2019 14:01:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190911111753.455-1-bnvandana@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfCQ/zyuyWExi4TijwazDWHXttIuo3GyRnPsQy/wmot2xS3P110xw+i5GV/K3PdMMU/hww8GIsW+y2ws6EtiwLkVFYc8rFJ6gXVngMv2P2o4wkWyVxYg3
 NVM825wI9V1AxwboSSgerIUmpt3SdQ+WieDmT/ox542Nu/x6asmwefab66qVbaNdIRGKHXO9b+s/rNal7QwuoVBU+XVbE9MCSATrU+KcitbyG2/PB5DfsxAg
 /TDW7iBimngCGf7gNG/czlqt6vJm+KBBPVk3GmMviW+vjHfQUChvLPXoQxBtOwBImt3C0NdxJ91mMYECtacwfiNqZPoCYK/xEvCZCEf7yf0MHdQY/iowGmDN
 Co9k+zCeI/Tjmn3aET3bn/I30LeXFQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Vandana,

Some checkpatch warnings:

Applying: vivid: Add metadata capture support
WARNING: line over 80 characters
#43: FILE: drivers/media/platform/vivid/vivid-core.c:103:
+/* Default: video + vbi-cap (raw and sliced) + radio rx + radio tx + sdr + vbi-out + vid-out + meta-cap */

This can easily be split up.

WARNING: line over 80 characters
#44: FILE: drivers/media/platform/vivid/vivid-core.c:104:
+static unsigned node_types[VIVID_MAX_DEVS] = { [0 ... (VIVID_MAX_DEVS - 1)] = 0x21d3d };

WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
#44: FILE: drivers/media/platform/vivid/vivid-core.c:104:
+static unsigned node_types[VIVID_MAX_DEVS] = { [0 ... (VIVID_MAX_DEVS - 1)] = 0x21d3d };

Let's use unsigned int and more the part after the = to the next line.


WARNING: line over 80 characters
#403: FILE: drivers/media/platform/vivid/vivid-kthread-cap.c:860:
+               dev->meta_cap_seq_count = dev->cap_seq_count - dev->meta_cap_seq_start;

This one we can keep, I think it gets harder to read if this was split up.

Some more comments below:

On 9/11/19 1:17 PM, Vandana BN wrote:
> This patch adds meatadata capture support in vivid driver.
> Added new files for metadata capture.
> 
> Signed-off-by: Vandana BN <bnvandana@gmail.com>
> ---
> v2 Add UVC metadata structure.
> v3 Use correct metadata size.
> v4 use VFL_TYPE_METADATA.
> 
>  drivers/media/platform/vivid/Makefile         |   2 +-
>  drivers/media/platform/vivid/vivid-core.c     |  87 +++++++-
>  drivers/media/platform/vivid/vivid-core.h     |  13 ++
>  drivers/media/platform/vivid/vivid-ctrls.c    |  14 ++
>  .../media/platform/vivid/vivid-kthread-cap.c  |  48 ++++-
>  drivers/media/platform/vivid/vivid-meta-cap.c | 187 ++++++++++++++++++
>  drivers/media/platform/vivid/vivid-meta-cap.h |  21 ++
>  drivers/media/platform/vivid/vivid-meta-gen.c |  25 +++
>  drivers/media/platform/vivid/vivid-meta-gen.h |  22 +++
>  9 files changed, 410 insertions(+), 9 deletions(-)
>  create mode 100644 drivers/media/platform/vivid/vivid-meta-cap.c
>  create mode 100644 drivers/media/platform/vivid/vivid-meta-cap.h
>  create mode 100644 drivers/media/platform/vivid/vivid-meta-gen.c
>  create mode 100644 drivers/media/platform/vivid/vivid-meta-gen.h
> 
> diff --git a/drivers/media/platform/vivid/Makefile b/drivers/media/platform/vivid/Makefile
> index 2f5762e3309a..70a9262fafaa 100644
> --- a/drivers/media/platform/vivid/Makefile
> +++ b/drivers/media/platform/vivid/Makefile
> @@ -3,7 +3,7 @@ vivid-objs := vivid-core.o vivid-ctrls.o vivid-vid-common.o vivid-vbi-gen.o \
>  		vivid-vid-cap.o vivid-vid-out.o vivid-kthread-cap.o vivid-kthread-out.o \
>  		vivid-radio-rx.o vivid-radio-tx.o vivid-radio-common.o \
>  		vivid-rds-gen.o vivid-sdr-cap.o vivid-vbi-cap.o vivid-vbi-out.o \
> -		vivid-osd.o
> +		vivid-osd.o vivid-meta-cap.o vivid-meta-gen.o
>  ifeq ($(CONFIG_VIDEO_VIVID_CEC),y)
>    vivid-objs += vivid-cec.o
>  endif
> diff --git a/drivers/media/platform/vivid/vivid-core.c b/drivers/media/platform/vivid/vivid-core.c
> index 53315c8dd2bb..e7b179a3fd5b 100644
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
> @@ -95,8 +100,8 @@ static unsigned multiplanar[VIVID_MAX_DEVS] = { [0 ... (VIVID_MAX_DEVS - 1)] = 1
>  module_param_array(multiplanar, uint, NULL, 0444);
>  MODULE_PARM_DESC(multiplanar, " 1 (default) creates a single planar device, 2 creates a multiplanar device.");
>  
> -/* Default: video + vbi-cap (raw and sliced) + radio rx + radio tx + sdr + vbi-out + vid-out */
> -static unsigned node_types[VIVID_MAX_DEVS] = { [0 ... (VIVID_MAX_DEVS - 1)] = 0x1d3d };
> +/* Default: video + vbi-cap (raw and sliced) + radio rx + radio tx + sdr + vbi-out + vid-out + meta-cap */
> +static unsigned node_types[VIVID_MAX_DEVS] = { [0 ... (VIVID_MAX_DEVS - 1)] = 0x21d3d };
>  module_param_array(node_types, uint, NULL, 0444);
>  MODULE_PARM_DESC(node_types, " node types, default is 0x1d3d. Bitmask with the following meaning:\n"
>  			     "\t\t    bit 0: Video Capture node\n"
> @@ -106,7 +111,8 @@ MODULE_PARM_DESC(node_types, " node types, default is 0x1d3d. Bitmask with the f
>  			     "\t\t    bit 8: Video Output node\n"
>  			     "\t\t    bit 10-11: VBI Output node: 0 = none, 1 = raw vbi, 2 = sliced vbi, 3 = both\n"
>  			     "\t\t    bit 12: Radio Transmitter node\n"
> -			     "\t\t    bit 16: Framebuffer for testing overlays");
> +			     "\t\t    bit 16: Framebuffer for testing overlays\n"
> +			     "\t\t    bit 17: Metadata capture node\n");
>  
>  /* Default: 4 inputs */
>  static unsigned num_inputs[VIVID_MAX_DEVS] = { [0 ... (VIVID_MAX_DEVS - 1)] = 4 };
> @@ -205,7 +211,7 @@ static int vidioc_querycap(struct file *file, void  *priv,
>  	cap->capabilities = dev->vid_cap_caps | dev->vid_out_caps |
>  		dev->vbi_cap_caps | dev->vbi_out_caps |
>  		dev->radio_rx_caps | dev->radio_tx_caps |
> -		dev->sdr_cap_caps | V4L2_CAP_DEVICE_CAPS;
> +		dev->sdr_cap_caps | dev->meta_cap_caps | V4L2_CAP_DEVICE_CAPS;
>  	return 0;
>  }
>  
> @@ -433,7 +439,8 @@ static bool vivid_is_last_user(struct vivid_dev *dev)
>  			vivid_is_in_use(&dev->vbi_out_dev) +
>  			vivid_is_in_use(&dev->sdr_cap_dev) +
>  			vivid_is_in_use(&dev->radio_rx_dev) +
> -			vivid_is_in_use(&dev->radio_tx_dev);
> +			vivid_is_in_use(&dev->radio_tx_dev) +
> +			vivid_is_in_use(&dev->meta_cap_dev);
>  
>  	return uses == 1;
>  }
> @@ -459,6 +466,7 @@ static int vivid_fop_release(struct file *file)
>  		set_bit(V4L2_FL_REGISTERED, &dev->sdr_cap_dev.flags);
>  		set_bit(V4L2_FL_REGISTERED, &dev->radio_rx_dev.flags);
>  		set_bit(V4L2_FL_REGISTERED, &dev->radio_tx_dev.flags);
> +		set_bit(V4L2_FL_REGISTERED, &dev->meta_cap_dev.flags);
>  	}
>  	mutex_unlock(&dev->mutex);
>  	if (file->private_data == dev->overlay_cap_owner)
> @@ -604,6 +612,11 @@ static const struct v4l2_ioctl_ops vivid_ioctl_ops = {
>  	.vidioc_log_status		= vidioc_log_status,
>  	.vidioc_subscribe_event		= vidioc_subscribe_event,
>  	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
> +
> +	.vidioc_enum_fmt_meta_cap	= vidioc_enum_fmt_meta_cap,
> +	.vidioc_g_fmt_meta_cap		= vidioc_g_fmt_meta_cap,
> +	.vidioc_s_fmt_meta_cap		= vidioc_s_fmt_meta_cap,
> +	.vidioc_try_fmt_meta_cap	= vidioc_g_fmt_meta_cap,
>  };
>  
>  /* -----------------------------------------------------------------
> @@ -818,6 +831,9 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
>  			dev->has_scaler_out ? 'Y' : 'N');
>  	}
>  
> +	/* do we create a meta capture device */
> +	dev->has_meta_cap = node_type & 0x20000;
> +
>  	/* end detecting feature set */
>  
>  	if (dev->has_vid_cap) {
> @@ -875,6 +891,10 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
>  		dev->radio_tx_caps = V4L2_CAP_RDS_OUTPUT | V4L2_CAP_MODULATOR |
>  				     V4L2_CAP_READWRITE;
>  
> +	/* set up the capabilities of meta capture device */
> +	if (dev->has_meta_cap)
> +		dev->meta_cap_caps = V4L2_CAP_META_CAPTURE | V4L2_CAP_STREAMING;

You are missing V4L2_CAP_READWRITE here. Without it v4l2-compliance will fail.

> +
>  	ret = -ENOMEM;
>  	/* initialize the test pattern generator */
>  	tpg_init(&dev->tpg, 640, 360);
> @@ -1078,6 +1098,7 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
>  	INIT_LIST_HEAD(&dev->vbi_cap_active);
>  	INIT_LIST_HEAD(&dev->vbi_out_active);
>  	INIT_LIST_HEAD(&dev->sdr_cap_active);
> +	INIT_LIST_HEAD(&dev->meta_cap_active);
>  
>  	INIT_LIST_HEAD(&dev->cec_work_list);
>  	spin_lock_init(&dev->cec_slock);
> @@ -1225,6 +1246,27 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
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
> @@ -1265,6 +1307,7 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
>  	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_radio_rx);
>  	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_radio_tx);
>  	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_sdr_cap);
> +	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_meta_cap);
>  
>  	/* finally start creating the device nodes */
>  	if (dev->has_vid_cap) {
> @@ -1492,6 +1535,34 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
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
> +		video_set_drvdata(vfd, dev);
> +#ifdef CONFIG_MEDIA_CONTROLLER
> +		dev->meta_cap_pad.flags = MEDIA_PAD_FL_SINK;
> +		ret = media_entity_pads_init(&vfd->entity, 1,
> +					     &dev->meta_cap_pad);
> +		if (ret)
> +			goto unreg_dev;
> +#endif
> +		ret = video_register_device(vfd, VFL_TYPE_METADATA,
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
> @@ -1508,6 +1579,7 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
>  	return 0;
>  
>  unreg_dev:
> +	video_unregister_device(&dev->meta_cap_dev);
>  	video_unregister_device(&dev->radio_tx_dev);
>  	video_unregister_device(&dev->radio_rx_dev);
>  	video_unregister_device(&dev->sdr_cap_dev);
> @@ -1624,6 +1696,11 @@ static int vivid_remove(struct platform_device *pdev)
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
> index 7ebb14673c75..36f0988814bc 100644
> --- a/drivers/media/platform/vivid/vivid-core.h
> +++ b/drivers/media/platform/vivid/vivid-core.h
> @@ -18,6 +18,7 @@
>  #include <media/tpg/v4l2-tpg.h>
>  #include "vivid-rds-gen.h"
>  #include "vivid-vbi-gen.h"
> +#include "vivid-meta-gen.h"
>  
>  #define dprintk(dev, level, fmt, arg...) \
>  	v4l2_dbg(level, vivid_debug, &dev->v4l2_dev, fmt, ## arg)
> @@ -131,6 +132,7 @@ struct vivid_dev {
>  	struct media_pad		vbi_cap_pad;
>  	struct media_pad		vbi_out_pad;
>  	struct media_pad		sdr_cap_pad;
> +	struct media_pad		meta_cap_pad;
>  #endif
>  	struct v4l2_ctrl_handler	ctrl_hdl_user_gen;
>  	struct v4l2_ctrl_handler	ctrl_hdl_user_vid;
> @@ -153,6 +155,9 @@ struct vivid_dev {
>  	struct v4l2_ctrl_handler	ctrl_hdl_radio_tx;
>  	struct video_device		sdr_cap_dev;
>  	struct v4l2_ctrl_handler	ctrl_hdl_sdr_cap;
> +	struct video_device		meta_cap_dev;
> +	struct v4l2_ctrl_handler	ctrl_hdl_meta_cap;
> +
>  	spinlock_t			slock;
>  	struct mutex			mutex;
>  
> @@ -164,6 +169,7 @@ struct vivid_dev {
>  	u32				sdr_cap_caps;
>  	u32				radio_rx_caps;
>  	u32				radio_tx_caps;
> +	u32				meta_cap_caps;
>  
>  	/* supported features */
>  	bool				multiplanar;
> @@ -189,6 +195,7 @@ struct vivid_dev {
>  	bool				has_radio_tx;
>  	bool				has_sdr_cap;
>  	bool				has_fb;
> +	bool				has_meta_cap;
>  
>  	bool				can_loop_video;
>  
> @@ -324,6 +331,7 @@ struct vivid_dev {
>  	unsigned			tv_audmode;
>  	unsigned			tv_field_cap;
>  	unsigned			tv_audio_input;
> +	struct vivid_meta_gen_data      meta_gen;

Both the type and the field appear to be unused. Leftover from a
previous version?

>  
>  	u32				power_present;
>  
> @@ -390,6 +398,8 @@ struct vivid_dev {
>  	struct list_head		vid_cap_active;
>  	struct vb2_queue		vb_vbi_cap_q;
>  	struct list_head		vbi_cap_active;
> +	struct vb2_queue		vb_meta_cap_q;
> +	struct list_head		meta_cap_active;
>  
>  	/* thread for generating video capture stream */
>  	struct task_struct		*kthread_vid_cap;
> @@ -407,6 +417,9 @@ struct vivid_dev {
>  	u32				vbi_cap_seq_count;
>  	bool				vbi_cap_streaming;
>  	bool				stream_sliced_vbi_cap;
> +	u32				meta_cap_seq_start;
> +	u32				meta_cap_seq_count;
> +	bool				meta_cap_streaming;
>  
>  	/* video output */
>  	const struct vivid_fmt		*fmt_out;
> diff --git a/drivers/media/platform/vivid/vivid-ctrls.c b/drivers/media/platform/vivid/vivid-ctrls.c
> index cb19a9a73092..78ae0fe90081 100644
> --- a/drivers/media/platform/vivid/vivid-ctrls.c
> +++ b/drivers/media/platform/vivid/vivid-ctrls.c
> @@ -110,6 +110,7 @@ static int vivid_user_gen_s_ctrl(struct v4l2_ctrl *ctrl)
>  		clear_bit(V4L2_FL_REGISTERED, &dev->sdr_cap_dev.flags);
>  		clear_bit(V4L2_FL_REGISTERED, &dev->radio_rx_dev.flags);
>  		clear_bit(V4L2_FL_REGISTERED, &dev->radio_tx_dev.flags);
> +		clear_bit(V4L2_FL_REGISTERED, &dev->meta_cap_dev.flags);
>  		break;
>  	case VIVID_CID_BUTTON:
>  		dev->button_pressed = 30;
> @@ -1448,6 +1449,8 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
>  	struct v4l2_ctrl_handler *hdl_radio_rx = &dev->ctrl_hdl_radio_rx;
>  	struct v4l2_ctrl_handler *hdl_radio_tx = &dev->ctrl_hdl_radio_tx;
>  	struct v4l2_ctrl_handler *hdl_sdr_cap = &dev->ctrl_hdl_sdr_cap;
> +	struct v4l2_ctrl_handler *hdl_meta_cap = &dev->ctrl_hdl_meta_cap;
> +
>  	struct v4l2_ctrl_config vivid_ctrl_dv_timings = {
>  		.ops = &vivid_vid_cap_ctrl_ops,
>  		.id = VIVID_CID_DV_TIMINGS,
> @@ -1486,6 +1489,8 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
>  	v4l2_ctrl_new_custom(hdl_radio_tx, &vivid_ctrl_class, NULL);
>  	v4l2_ctrl_handler_init(hdl_sdr_cap, 19);
>  	v4l2_ctrl_new_custom(hdl_sdr_cap, &vivid_ctrl_class, NULL);
> +	v4l2_ctrl_handler_init(hdl_meta_cap, 2);
> +	v4l2_ctrl_new_custom(hdl_meta_cap, &vivid_ctrl_class, NULL);
>  
>  	/* User Controls */
>  	dev->volume = v4l2_ctrl_new_std(hdl_user_aud, NULL,
> @@ -1817,6 +1822,14 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
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
> @@ -1836,4 +1849,5 @@ void vivid_free_controls(struct vivid_dev *dev)
>  	v4l2_ctrl_handler_free(&dev->ctrl_hdl_sdtv_cap);
>  	v4l2_ctrl_handler_free(&dev->ctrl_hdl_loop_cap);
>  	v4l2_ctrl_handler_free(&dev->ctrl_hdl_fb);
> +	v4l2_ctrl_handler_free(&dev->ctrl_hdl_meta_cap);
>  }
> diff --git a/drivers/media/platform/vivid/vivid-kthread-cap.c b/drivers/media/platform/vivid/vivid-kthread-cap.c
> index 003319d7816d..b92109e2715e 100644
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
> @@ -704,9 +706,15 @@ static noinline_for_stack void vivid_thread_vid_cap_tick(struct vivid_dev *dev,
>  			list_del(&vbi_cap_buf->list);
>  		}
>  	}
> +	if (!list_empty(&dev->meta_cap_active) && vid_cap_buf) {

I know I said that it would make sense that there is no metadata as long
as there is no video capture. However, I changed my mind on this. One of
the reasons for having vivid is to do regression testing with v4l2-compliance,
and v4l2-compliance expects that it can capture from any device node
independently of another. So this '&& vid_cap_buf' actually prevents me
from running v4l2-compliance on the metadata device node.

So just drop that bit.

With this change and the change above the compliance test passes.

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
> @@ -758,6 +766,20 @@ static noinline_for_stack void vivid_thread_vid_cap_tick(struct vivid_dev *dev,
>  		do_div(vbi_period, 100);
>  		vbi_cap_buf->vb.vb2_buf.timestamp = f_time + vbi_period;
>  	}
> +
> +	if (meta_cap_buf) {
> +		v4l2_ctrl_request_setup(meta_cap_buf->vb.vb2_buf.req_obj.req,
> +					&dev->ctrl_hdl_meta_cap);
> +		vivid_meta_cap_fillbuff(dev, meta_cap_buf);
> +		v4l2_ctrl_request_complete(meta_cap_buf->vb.vb2_buf.req_obj.req,
> +					   &dev->ctrl_hdl_meta_cap);
> +		vb2_buffer_done(&meta_cap_buf->vb.vb2_buf, dev->dqbuf_error ?
> +				VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE);
> +		dprintk(dev, 2, "meta_cap %d done\n",
> +			meta_cap_buf->vb.vb2_buf.index);
> +		meta_cap_buf->vb.vb2_buf.timestamp = f_time;
> +	}
> +
>  	dev->dqbuf_error = false;
>  
>  update_mv:
> @@ -835,6 +857,7 @@ static int vivid_thread_vid_cap(void *data)
>  		dev->cap_seq_count = buffers_since_start + dev->cap_seq_offset;
>  		dev->vid_cap_seq_count = dev->cap_seq_count - dev->vid_cap_seq_start;
>  		dev->vbi_cap_seq_count = dev->cap_seq_count - dev->vbi_cap_seq_start;
> +		dev->meta_cap_seq_count = dev->cap_seq_count - dev->meta_cap_seq_start;
>  
>  		vivid_thread_vid_cap_tick(dev, dropped_bufs);
>  
> @@ -883,8 +906,10 @@ int vivid_start_generating_vid_cap(struct vivid_dev *dev, bool *pstreaming)
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
> @@ -894,6 +919,7 @@ int vivid_start_generating_vid_cap(struct vivid_dev *dev, bool *pstreaming)
>  
>  	dev->vid_cap_seq_start = dev->seq_wrap * 128;
>  	dev->vbi_cap_seq_start = dev->seq_wrap * 128;
> +	dev->meta_cap_seq_start = dev->seq_wrap * 128;
>  
>  	dev->kthread_vid_cap = kthread_run(vivid_thread_vid_cap, dev,
>  			"%s-vid-cap", dev->v4l2_dev.name);
> @@ -951,7 +977,23 @@ void vivid_stop_generating_vid_cap(struct vivid_dev *dev, bool *pstreaming)
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
> index 000000000000..0796fee51b73
> --- /dev/null
> +++ b/drivers/media/platform/vivid/vivid-meta-cap.c
> @@ -0,0 +1,187 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * vivid-meta-cap.c - meta capture support functions.
> + *
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
> +#include "vivid-meta-gen.h"
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
> +		return -ENODATA;
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
> +int vidioc_s_fmt_meta_cap(struct file *file, void *priv,
> +			  struct v4l2_format *f)
> +{
> +	int ret = vidioc_g_fmt_meta_cap(file, priv, f);
> +
> +	if (ret)
> +		return ret;
> +	/*TODO: try fmt and then set meta format */
> +	return 0;
> +}

Just drop this function and use vidioc_g_fmt_meta_cap for the .vidioc_s_fmt_meta_cap
callback.

> +
> +void vivid_meta_cap_fillbuff(struct vivid_dev *dev, struct vivid_buffer *buf)
> +{
> +	struct vivid_uvc_meta_buf *vbuf = vb2_plane_vaddr(&buf->vb.vb2_buf, 0);
> +
> +	buf->vb.sequence = dev->meta_cap_seq_count;
> +	if (dev->field_cap == V4L2_FIELD_ALTERNATE)
> +		buf->vb.sequence /= 2;
> +	memset(vbuf, 1, vb2_plane_size(&buf->vb.vb2_buf, 0));
> +	vivid_meta_cap_gen(vbuf, buf->vb.sequence);
> +	//vbuf = dev->meta_gen.data;

Delete this line.

> +	dprintk(dev, 1, "%s ns %llu sof %u, len %u, flags 0x%x\n",
> +		__func__, vbuf->ns, vbuf->sof, vbuf->length, vbuf->flags);

I'd set the debug level to 2 for this.

> +}
> diff --git a/drivers/media/platform/vivid/vivid-meta-cap.h b/drivers/media/platform/vivid/vivid-meta-cap.h
> new file mode 100644
> index 000000000000..be9d9a096ca4
> --- /dev/null
> +++ b/drivers/media/platform/vivid/vivid-meta-cap.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * vivid-meta-cap.h - meta capture support functions.
> + *
> + */
> +#ifndef _VIVID_META_CAP_H_
> +#define _VIVID_META_CAP_H_
> +
> +void vivid_meta_cap_fillbuff(struct vivid_dev *dev, struct vivid_buffer *buf);
> +
> +int vidioc_enum_fmt_meta_cap(struct file *file, void  *priv,
> +			     struct v4l2_fmtdesc *f);
> +
> +int vidioc_g_fmt_meta_cap(struct file *file, void *priv,
> +			  struct v4l2_format *f);
> +
> +int vidioc_s_fmt_meta_cap(struct file *file, void *priv,
> +			  struct v4l2_format *f);

This function can be dropped.

> +
> +extern const struct vb2_ops vivid_meta_cap_qops;
> +#endif
> diff --git a/drivers/media/platform/vivid/vivid-meta-gen.c b/drivers/media/platform/vivid/vivid-meta-gen.c
> new file mode 100644
> index 000000000000..32b3ca1aa206
> --- /dev/null
> +++ b/drivers/media/platform/vivid/vivid-meta-gen.c
> @@ -0,0 +1,25 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * vivid-meta-gen.c - metadata generator support functions.
> + *
> + */
> +
> +#include <linux/errno.h>
> +#include <linux/kernel.h>
> +#include <linux/ktime.h>
> +#include <linux/string.h>
> +#include <linux/videodev2.h>
> +#include <linux/usb/video.h>
> +
> +#include "vivid-meta-gen.h"
> +#include "vivid-core.h"
> +
> +void vivid_meta_cap_gen(struct vivid_uvc_meta_buf *meta, unsigned int seq)
> +{
> +	meta->ns = ktime_get_ns();
> +	meta->sof = seq;
> +	meta->length = sizeof(meta->ns) + sizeof(meta->sof) + 2;
> +	meta->flags = UVC_STREAM_EOH;
> +	if ((seq % 2) == 0)
> +		meta->flags |= UVC_STREAM_FID;
> +}
> diff --git a/drivers/media/platform/vivid/vivid-meta-gen.h b/drivers/media/platform/vivid/vivid-meta-gen.h
> new file mode 100644
> index 000000000000..e033817c48c6
> --- /dev/null
> +++ b/drivers/media/platform/vivid/vivid-meta-gen.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * vivid-meta-gen.h - meta generator support functions.
> + *
> + */
> +#ifndef _VIVID_META_GEN_H_
> +#define _VIVID_META_GEN_H_
> +
> +struct vivid_uvc_meta_buf {
> +	__u64 ns;
> +	__u16 sof;
> +	__u8 length;
> +	__u8 flags;
> +	__u8 buf[];
> +} __packed;
> +
> +struct vivid_meta_gen_data {
> +	struct vivid_uvc_meta_buf data;
> +};

Unused struct.

> +
> +void vivid_meta_cap_gen(struct vivid_uvc_meta_buf *meta, unsigned int seq);
> +#endif
> 

Regards,

	Hans
