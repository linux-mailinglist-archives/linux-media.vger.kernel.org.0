Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 952BB21D547
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2020 13:53:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729259AbgGMLxG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jul 2020 07:53:06 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:37326 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727890AbgGMLxF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jul 2020 07:53:05 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 189962A2AF5
Subject: Re: [PATCH 4/4] media: staging: rkisp1: improve documentation of
 rkisp1-common.h
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
References: <20200629065754.26621-1-dafna.hirschfeld@collabora.com>
 <20200629065754.26621-5-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <ec28e78b-3c80-8cc7-4d2c-a46629850e78@collabora.com>
Date:   Mon, 13 Jul 2020 08:52:55 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200629065754.26621-5-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

Thanks for the patch.

On 6/29/20 3:57 AM, Dafna Hirschfeld wrote:
> Add more detailed documentation of the structs in rkisp1-common.h
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/staging/media/rkisp1/TODO            |   1 -
>  drivers/staging/media/rkisp1/rkisp1-common.h | 133 +++++++++++++++----
>  2 files changed, 106 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/TODO b/drivers/staging/media/rkisp1/TODO
> index bdb1b8f73556..f0c90d1c86a8 100644
> --- a/drivers/staging/media/rkisp1/TODO
> +++ b/drivers/staging/media/rkisp1/TODO
> @@ -2,7 +2,6 @@
>  * Fix checkpatch errors.
>  * Review and comment every lock
>  * Handle quantization
> -* Document rkisp1-common.h
>  * streaming paths (mainpath and selfpath) check if the other path is streaming
>  in several places of the code, review this, specially that it doesn't seem it
>  supports streaming from both paths at the same time.
> diff --git a/drivers/staging/media/rkisp1/rkisp1-common.h b/drivers/staging/media/rkisp1/rkisp1-common.h
> index 4185487c520c..47b03a1dfe1b 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-common.h
> +++ b/drivers/staging/media/rkisp1/rkisp1-common.h
> @@ -73,8 +73,16 @@ enum rkisp1_isp_pad {
>  };
>  
>  /*
> - * struct rkisp1_sensor_async - Sensor information
> - * @mbus: media bus configuration
> + * struct rkisp1_sensor_async - A container for the v4l2_async_subdev to add to the notifier
> + * of the v4l2-async API.
> + *
> + * @asd: the async_subdev var for the sensor

I think you can remove "the" here, same for other fields in the rest of this patch.

> + * @lanes: number of lanes
> + * @mbus_type: type of bus (currently only CSI2 is supported)
> + * @mbus_flags: media bus (V4L2_MBUS_*) flags
> + * @sd: a pointer to the v4l2_subdev struct of the sensor
> + * @pixel_rate_ctrl: the pixel rate of the sensor, used to initialize the phy
> + * @dphy: a pointer to the phy
>   */

Just a nit, could you align the comments? I think it is easier to read.

>  struct rkisp1_sensor_async {
>  	struct v4l2_async_subdev asd;
> @@ -87,19 +95,16 @@ struct rkisp1_sensor_async {
>  };
>  
>  /*
> - * struct rkisp1_isp - ISP sub-device
> + * struct rkisp1_isp - ISP subdev entity
>   *
> - * See Cropping regions of ISP in rkisp1.c for details
> - * @sink_frm: input size, don't have to be equal to sensor size
> + * @sd: the v4l2_subdev var
> + * @pads: the media pads
> + * @pad_cfg: the pads configurations
>   * @sink_fmt: input format
> - * @sink_crop: crop for sink pad
>   * @src_fmt: output format
> - * @src_crop: output size
>   * @ops_lock: ops serialization
> - *
>   * @is_dphy_errctrl_disabled : if dphy errctrl is disabled (avoid endless interrupt)
>   * @frame_sequence: used to synchronize frame_id between video devices.
> - * @quantization: output quantization
>   */
>  struct rkisp1_isp {
>  	struct v4l2_subdev sd;
> @@ -107,11 +112,20 @@ struct rkisp1_isp {
>  	struct v4l2_subdev_pad_config pad_cfg[RKISP1_ISP_PAD_MAX];
>  	const struct rkisp1_isp_mbus_info *sink_fmt;
>  	const struct rkisp1_isp_mbus_info *src_fmt;
> -	struct mutex ops_lock;
> +	struct mutex ops_lock; /* serialize the subdevice ops */
>  	bool is_dphy_errctrl_disabled;
>  	atomic_t frame_sequence;
>  };
>  
> +/*
> + * struct rkisp1_vdev_node - A Container for the video nodes of the video devices:
> + *			     params, stats, mainpath, selfpath

Or maybe just:
Container for the video devices nodes: params, stats, mainpath, selfpath

> + *
> + * @buf_queue: the queue of buffers.
> + * @vlock: the lock of the video node
> + * @vdev: the video node
> + * @pad: the media pad
> + */
>  struct rkisp1_vdev_node {
>  	struct vb2_queue buf_queue;
>  	struct mutex vlock; /* ioctl serialization mutex */
> @@ -119,6 +133,15 @@ struct rkisp1_vdev_node {
>  	struct media_pad pad;
>  };
>  
> +/*
> + * struct rkisp1_buffer - A container for the vb2 buffers used by the video devices:
> + *			  params, stats, mainpath, selfpath
> + *
> + * @vb: the vb2 buffer
> + * @queue: the entry of the buffer in the queue
> + * @buff_addr: the dma addresses of each plain, used only by the capture devices: selfpath, mainpath

s/plain/plane

> + * @vaddr: the virtual addresses, used only by the params and stats devices

maybe:

virtual addresses for buffers used by params and stats devices

I also noticed that params and stats only use vaddr[0], maybe we can remove the array and
replaced by a simple variable.

> + */
>  struct rkisp1_buffer {
>  	struct vb2_v4l2_buffer vb;
>  	struct list_head queue;
> @@ -128,6 +151,9 @@ struct rkisp1_buffer {
>  	};
>  };
>  
> +/*
> + * A dummy buffer to write the next frame to in case there are no vb2 buffers available.
> + */

Could you please follow the same standard used in the rest of this patch?

>  struct rkisp1_dummy_buffer {
>  	void *vaddr;
>  	dma_addr_t dma_addr;
> @@ -139,17 +165,28 @@ struct rkisp1_device;
>  /*
>   * struct rkisp1_capture - ISP capture video device
>   *
> - * @pix.fmt: buffer format
> - * @pix.info: pixel information
> - * @pix.cfg: pixel configuration
> - *
> - * @buf.lock: lock to protect buf_queue
> + * @vnode: the video node
> + * @rkisp1: pointer to the rkisp1 device
> + * @id: the id of the capture, one of RKISP1_SELFPATH, RKISP1_MAINPATH
> + * @ops: list of callbacks to configure the capture device.
> + * @config: a pointer to the list of registers to configure the capture format.
> + * @is_streaming: device is streaming
> + * @is_stopping: stop_streaming callback was called and the device is in the process of stopping
> + *		 the streaming.
> + * @done: when stop_streaming callback is called, the device waits for the next irq handler to stop
> + *	  the streaming from there by waiting on the 'done' wait queue.

s/to stop the streaming from there by waiting/to stop the streaming by waiting/

> + *	  If the irq handler is not called, the stream is stopped from the callback after timeout.

s/from/by

> + * @sp_y_stride: the selfpath allows to configure a y stride that is longer than the image width.
> + * @buf.lock: lock to protect buf.queue
>   * @buf.queue: queued buffer list
>   * @buf.dummy: dummy space to store dropped data
>   *
> - * rkisp1 use shadowsock registers, so it need two buffer at a time
> + * rkisp1 uses shadow registers, so it needs two buffers at a time
>   * @buf.curr: the buffer used for current frame
>   * @buf.next: the buffer used for next frame
> + * @pix.cfg: pixel configuration
> + * @pix.info: a pointer to the v4l2_format_info of the pixel format
> + * @pix.fmt: buffer format
>   */
>  struct rkisp1_capture {
>  	struct rkisp1_vdev_node vnode;
> @@ -179,14 +216,18 @@ struct rkisp1_capture {
>  /*
>   * struct rkisp1_stats - ISP Statistics device
>   *
> + * @vnode: the video node
> + * @rkisp1: pointer to the rkisp1 device
>   * @lock: locks the buffer list 'stat' and 'is_streaming'
> - * @stat: stats buffer list
> + * @stat: the queue of rkisp1_buffer
> + * @vdev_fmt: the v4l2_format
> + * @is_streaming: device is streaming
>   */
>  struct rkisp1_stats {
>  	struct rkisp1_vdev_node vnode;
>  	struct rkisp1_device *rkisp1;
>  
> -	spinlock_t lock; /* locks 'is_streaming', and 'stats' */
> +	spinlock_t lock; /* locks the buffers list 'stats' and 'is_streaming' */
>  	struct list_head stat;
>  	struct v4l2_format vdev_fmt;
>  	bool is_streaming;
> @@ -195,14 +236,22 @@ struct rkisp1_stats {
>  /*
>   * struct rkisp1_params - ISP input parameters device
>   *
> - * @cur_params: Current ISP parameters
> + * @vnode: the video node
> + * @rkisp1: pointer to the rkisp1 device
> + * @config_lock: locks the buffer list 'params' and 'is_streaming'
> + * @params: the queue of rkisp1_buffer
> + * @cur_params: the first params values from userspace
> + * @vdev_fmt: the v4l2_format
> + * @is_streaming: device is streaming
>   * @is_first_params: the first params should take effect immediately
> + * @quantization: the quantization configured on the isp's src pad

Just a note unrelated to this patch:
Maybe quantization could be moved to struct rkisp1_device, so it is accessible by all the entities
without the need to maintain copies around.

> + * @raw_type: the bayer pattern on the isp video sink pad
>   */
>  struct rkisp1_params {
>  	struct rkisp1_vdev_node vnode;
>  	struct rkisp1_device *rkisp1;
>  
> -	spinlock_t config_lock;
> +	spinlock_t config_lock; /* locks the buffers list 'params' and 'is_streaming' */
>  	struct list_head params;
>  	struct rkisp1_params_cfg cur_params;
>  	struct v4l2_format vdev_fmt;
> @@ -213,6 +262,18 @@ struct rkisp1_params {
>  	enum rkisp1_fmt_raw_pat_type raw_type;
>  };
>  
> +/*
> + * struct rkisp1_resizer - Resizer subdev
> + *
> + * @sd: the v4l2_subdev var
> + * @id: the id of the resizer, one of RKISP1_SELFPATH, RKISP1_MAINPATH
> + * @rkisp1: pointer to the rkisp1 device
> + * @pads: the media pads
> + * @pad_cfg: the configurations for the pads
> + * @config: the set of registers to configure the resizer
> + * @pixel_enc: the pixel encoding of the resizer
> + * @ops_lock: a lock for the subdev ops
> + */
>  struct rkisp1_resizer {
>  	struct v4l2_subdev sd;
>  	enum rkisp1_stream_id id;
> @@ -221,9 +282,12 @@ struct rkisp1_resizer {
>  	struct v4l2_subdev_pad_config pad_cfg[RKISP1_RSZ_PAD_MAX];
>  	const struct rkisp1_rsz_config *config;
>  	enum v4l2_pixel_encoding pixel_enc;
> -	struct mutex ops_lock;
> +	struct mutex ops_lock; /* serialize the subdevice ops */
>  };
>  
> +/*
> + * struct rkisp1_debug - values to be exposed on debugfs
> + */
>  struct rkisp1_debug {
>  	struct dentry *debugfs_dir;
>  	unsigned long data_loss;
> @@ -237,12 +301,22 @@ struct rkisp1_debug {
>  /*
>   * struct rkisp1_device - ISP platform device

Missing new line here

>   * @base_addr: base register address
> + * @irq: the irq number
> + * @dev: a pointer to the struct device
> + * @clk_size: the number of clocks
> + * @clks: the array of clocks
> + * @v4l2_dev: the v4l2_device
> + * @media_dev: the media_device
> + * @notifier: a notifier to register on the v4l2-async API to be notified on the sensor
>   * @active_sensor: sensor in-use, set when streaming on
>   * @isp: ISP sub-device
> - * @rkisp1_capture: capture video device
> + * @resizer_devs: the two resizer sub-devices
> + * @capture_devs: the two capture devices
>   * @stats: ISP statistics output device
>   * @params: ISP input parameters device
> - * @stream_lock: lock to serialize start/stop streaming in capture devices.
> + * @pipe: the media pipeline
> + * @stream_lock: serializes {start/stop}_streaming callbacks between the capture devices.
> + * @debug: the debug params to be exposed on debugfs
>   */
>  struct rkisp1_device {
>  	void __iomem *base_addr;
> @@ -260,16 +334,21 @@ struct rkisp1_device {
>  	struct rkisp1_stats stats;
>  	struct rkisp1_params params;
>  	struct media_pipeline pipe;
> -	struct mutex stream_lock;
> +	struct mutex stream_lock; /* serialize {start/stop}_streaming cb between capture devices */
>  	struct rkisp1_debug debug;
>  };
>  
>  /*
> - * struct rkisp1_isp_mbus_info - ISP pad format info
> + * struct rkisp1_isp_mbus_info - ISP media bus info
>   *
> - * Translate mbus_code to hardware format values
> + * Translates mbus_code to hardware format values
>   *
> - * @bus_width: used for parallel
> + * @mbus_code: the media bus code
> + * @pixel_enc: the pixel encoding
> + * @mipi_dt: the mipi data type
> + * @bus_width: the bus width
> + * @bayer_pat: the bayer pattern
> + * @direction: a bitmask of the flags indicating on which pad the format is supported on
>   */
>  struct rkisp1_isp_mbus_info {
>  	u32 mbus_code;
> 

It would also be nice to add docs to the enums, macros and functions, but since this is an internal
header, it's fine, we can add them later.

With these changes:

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks
Helen
