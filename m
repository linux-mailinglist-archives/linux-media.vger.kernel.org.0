Return-Path: <linux-media+bounces-15965-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3579E94B71F
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2024 09:08:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7CCBCB249BA
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2024 07:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 896D2187FF6;
	Thu,  8 Aug 2024 07:07:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F80187FE2;
	Thu,  8 Aug 2024 07:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723100871; cv=none; b=HZqMv7kSmXU4TkOKxt9XYDaQegy05FLb0PvsjqIpKN0sS+om5xHsS/1yyjA/E/djvJhRUNEDWFPLR1X+m/HTv6Q7+zfv5VAAGGMSffcArv6WhUTIqf9gwFXtQ74DSyesN8B2YJyiV6RZIqxpzT39qVputwFJfYGbTwEftUdmMs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723100871; c=relaxed/simple;
	bh=uydTY6xDUPLZQsVqOcwlTBLIxnvMH1Fw0eT4BCgvU+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=OXY+0B855HF9Vb2B0CKRr3flg9HDX4ow3GFRyvPC9lKpdeJMIRzX0vddzn1s02ARvemWn4+wi82VlUqPt+hkN311JIGlPT7QYz9pWr7mIvEfaS+WSDnqJ40yQWfVUJLPaVVHWsAHzHU8V36hmSl+HSCFtdBCfoyiUskDlo6HOCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6A10C32782;
	Thu,  8 Aug 2024 07:07:48 +0000 (UTC)
Message-ID: <2387b4c4-42a0-4435-afea-1574f42970eb@xs4all.nl>
Date: Thu, 8 Aug 2024 09:07:47 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: aspeed: Allow to capture from SoC display (GFX)
To: Jammy Huang <jammy_huang@aspeedtech.com>, eajames@linux.ibm.com,
 mchehab@kernel.org, joel@jms.id.au, andrew@aj.id.au,
 linux-media@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20240708005952.481727-1-jammy_huang@aspeedtech.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20240708005952.481727-1-jammy_huang@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/07/2024 02:59, Jammy Huang wrote:
> ASPEED BMC IC has 2 different display engines. Please find AST2600's
> datasheet to get detailed information.
> 
> 1. VGA on PCIe
> 2. SoC Display (GFX)
> 
> By default, video engine (VE) will capture video from VGA. This patch
> adds an option to capture video from GFX with standard ioctl,
> vidioc_s_input.
> 
> An enum, aspeed_video_input, is added for this purpose.
> enum aspeed_video_input {
> 	VIDEO_INPUT_VGA = 0,
> 	VIDEO_INPUT_GFX,
> 	VIDEO_INPUT_MAX
> };
> 
> To test this feature, you will need to enable GFX first. Please refer to
> ASPEED's SDK_User_Guide, 6.3.x Soc Display driver, for more information.
> In your application, you will need to use v4l2 ioctl, VIDIOC_S_INPUT, as
> below to select before start streaming.
> 
> int rc;
> struct v4l2_input input;
> 
> input.index = VIDEO_INPUT_GFX;
> rc = ioctl(fd, VIDIOC_S_INPUT, &input);
> if (rc < 0)
> {
> 	...
> }
> 
> Link: https://github.com/AspeedTech-BMC/openbmc/releases
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---
>  drivers/media/platform/aspeed/aspeed-video.c | 189 ++++++++++++++++---
>  include/uapi/linux/aspeed-video.h            |   7 +
>  2 files changed, 170 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
> index fc6050e3be0d..79dbec113f3f 100644
> --- a/drivers/media/platform/aspeed/aspeed-video.c
> +++ b/drivers/media/platform/aspeed/aspeed-video.c
> @@ -25,6 +25,8 @@
>  #include <linux/workqueue.h>
>  #include <linux/debugfs.h>
>  #include <linux/ktime.h>
> +#include <linux/regmap.h>
> +#include <linux/mfd/syscon.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-dev.h>
>  #include <media/v4l2-device.h>
> @@ -203,6 +205,25 @@
>  #define VE_MEM_RESTRICT_START		0x310
>  #define VE_MEM_RESTRICT_END		0x314
>  
> +/* SCU's registers */
> +#define SCU_MISC_CTRL			0xC0
> +#define  SCU_DPLL_SOURCE		BIT(20)
> +
> +/* GFX's registers */
> +#define GFX_CTRL			0x60
> +#define  GFX_CTRL_ENABLE		BIT(0)
> +#define  GFX_CTRL_FMT			GENMASK(9, 7)
> +
> +#define GFX_H_DISPLAY			0x70
> +#define  GFX_H_DISPLAY_DE		GENMASK(28, 16)
> +#define  GFX_H_DISPLAY_TOTAL		GENMASK(12, 0)
> +
> +#define GFX_V_DISPLAY			0x78
> +#define  GFX_V_DISPLAY_DE		GENMASK(27, 16)
> +#define  GFX_V_DISPLAY_TOTAL		GENMASK(11, 0)
> +
> +#define GFX_DISPLAY_ADDR		0x80
> +
>  /*
>   * VIDEO_MODE_DETECT_DONE:	a flag raised if signal lock
>   * VIDEO_RES_CHANGE:		a flag raised if res_change work on-going
> @@ -262,6 +283,7 @@ struct aspeed_video_perf {
>  /*
>   * struct aspeed_video - driver data
>   *
> + * version:		holds the version of aspeed SoC
>   * res_work:		holds the delayed_work for res-detection if unlock
>   * buffers:		holds the list of buffer queued from user
>   * flags:		holds the state of video
> @@ -273,6 +295,7 @@ struct aspeed_video_perf {
>   * yuv420:		a flag raised if JPEG subsampling is 420
>   * format:		holds the video format
>   * hq_mode:		a flag raised if HQ is enabled. Only for VIDEO_FMT_ASPEED
> + * input:		holds the video input
>   * frame_rate:		holds the frame_rate
>   * jpeg_quality:	holds jpeq's quality (0~11)
>   * jpeg_hq_quality:	holds hq's quality (1~12) only if hq_mode enabled
> @@ -298,6 +321,9 @@ struct aspeed_video {
>  	struct video_device vdev;
>  	struct mutex video_lock;	/* v4l2 and videobuf2 lock */
>  
> +	struct regmap *scu;
> +	struct regmap *gfx;
> +	u32 version;
>  	u32 jpeg_mode;
>  	u32 comp_size_read;
>  
> @@ -316,6 +342,7 @@ struct aspeed_video {
>  	bool yuv420;
>  	enum aspeed_video_format format;
>  	bool hq_mode;
> +	enum aspeed_video_input input;
>  	unsigned int frame_rate;
>  	unsigned int jpeg_quality;
>  	unsigned int jpeg_hq_quality;
> @@ -331,21 +358,25 @@ struct aspeed_video {
>  #define to_aspeed_video(x) container_of((x), struct aspeed_video, v4l2_dev)
>  
>  struct aspeed_video_config {
> +	u32 version;
>  	u32 jpeg_mode;
>  	u32 comp_size_read;
>  };
>  
>  static const struct aspeed_video_config ast2400_config = {
> +	.version = 4,
>  	.jpeg_mode = AST2400_VE_SEQ_CTRL_JPEG_MODE,
>  	.comp_size_read = AST2400_VE_COMP_SIZE_READ_BACK,
>  };
>  
>  static const struct aspeed_video_config ast2500_config = {
> +	.version = 5,
>  	.jpeg_mode = AST2500_VE_SEQ_CTRL_JPEG_MODE,
>  	.comp_size_read = AST2400_VE_COMP_SIZE_READ_BACK,
>  };
>  
>  static const struct aspeed_video_config ast2600_config = {
> +	.version = 6,
>  	.jpeg_mode = AST2500_VE_SEQ_CTRL_JPEG_MODE,
>  	.comp_size_read = AST2600_VE_COMP_SIZE_READ_BACK,
>  };
> @@ -485,6 +516,7 @@ static const struct v4l2_dv_timings_cap aspeed_video_timings_cap = {
>  
>  static const char * const format_str[] = {"Standard JPEG",
>  	"Aspeed JPEG"};
> +static const char * const input_str[] = {"VGA", "BMC GFX"};
>  
>  static unsigned int debug;
>  
> @@ -609,6 +641,14 @@ static int aspeed_video_start_frame(struct aspeed_video *video)
>  		aspeed_video_free_buf(video, &video->bcd);
>  	}
>  
> +	if (video->input == VIDEO_INPUT_GFX) {
> +		u32 val;
> +
> +		// update input buffer address as gfx's
> +		regmap_read(video->gfx, GFX_DISPLAY_ADDR, &val);
> +		aspeed_video_write(video, VE_TGS_0, val);
> +	}
> +
>  	spin_lock_irqsave(&video->lock, flags);
>  	buf = list_first_entry_or_null(&video->buffers,
>  				       struct aspeed_video_buffer, link);
> @@ -1026,9 +1066,23 @@ static void aspeed_video_get_timings(struct aspeed_video *v,
>  	}
>  }
>  
> +static void aspeed_video_get_resolution_gfx(struct aspeed_video *video,
> +					    struct v4l2_bt_timings *det)
> +{
> +	u32 h_val, v_val;
> +
> +	regmap_read(video->gfx, GFX_H_DISPLAY, &h_val);
> +	regmap_read(video->gfx, GFX_V_DISPLAY, &v_val);
> +
> +	det->width = FIELD_GET(GFX_H_DISPLAY_DE, h_val) + 1;
> +	det->height = FIELD_GET(GFX_V_DISPLAY_DE, v_val) + 1;
> +	video->v4l2_input_status = 0;
> +}
> +
>  #define res_check(v) test_and_clear_bit(VIDEO_MODE_DETECT_DONE, &(v)->flags)
>  
> -static void aspeed_video_get_resolution(struct aspeed_video *video)
> +static void aspeed_video_get_resolution_vga(struct aspeed_video *video,
> +					    struct v4l2_bt_timings *det)
>  {
>  	bool invalid_resolution = true;
>  	int rc;
> @@ -1036,7 +1090,6 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
>  	u32 mds;
>  	u32 src_lr_edge;
>  	u32 src_tb_edge;
> -	struct v4l2_bt_timings *det = &video->detected_timings;
>  
>  	det->width = MIN_WIDTH;
>  	det->height = MIN_HEIGHT;
> @@ -1113,14 +1166,20 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
>  
>  	aspeed_video_get_timings(video, det);
>  
> -	/*
> -	 * Enable mode-detect watchdog, resolution-change watchdog and
> -	 * automatic compression after frame capture.
> -	 */
> +	/* Enable mode-detect watchdog, resolution-change watchdog */
>  	aspeed_video_update(video, VE_INTERRUPT_CTRL, 0,
>  			    VE_INTERRUPT_MODE_DETECT_WD);
> -	aspeed_video_update(video, VE_SEQ_CTRL, 0,
> -			    VE_SEQ_CTRL_AUTO_COMP | VE_SEQ_CTRL_EN_WATCHDOG);
> +	aspeed_video_update(video, VE_SEQ_CTRL, 0, VE_SEQ_CTRL_EN_WATCHDOG);
> +}
> +
> +static void aspeed_video_get_resolution(struct aspeed_video *video)
> +{
> +	struct v4l2_bt_timings *det = &video->detected_timings;
> +
> +	if (video->input == VIDEO_INPUT_GFX)
> +		aspeed_video_get_resolution_gfx(video, det);
> +	else
> +		aspeed_video_get_resolution_vga(video, det);
>  
>  	v4l2_dbg(1, debug, &video->v4l2_dev, "Got resolution: %dx%d\n",
>  		 det->width, det->height);
> @@ -1156,7 +1215,7 @@ static void aspeed_video_set_resolution(struct aspeed_video *video)
>  	aspeed_video_write(video, VE_SRC_SCANLINE_OFFSET, act->width * 4);
>  
>  	/* Don't use direct mode below 1024 x 768 (irqs don't fire) */
> -	if (size < DIRECT_FETCH_THRESHOLD) {
> +	if (video->input == VIDEO_INPUT_VGA && size < DIRECT_FETCH_THRESHOLD) {
>  		v4l2_dbg(1, debug, &video->v4l2_dev, "Capture: Sync Mode\n");
>  		aspeed_video_write(video, VE_TGS_0,
>  				   FIELD_PREP(VE_TGS_FIRST,
> @@ -1171,10 +1230,20 @@ static void aspeed_video_set_resolution(struct aspeed_video *video)
>  				    VE_CTRL_INT_DE | VE_CTRL_DIRECT_FETCH,
>  				    VE_CTRL_INT_DE);
>  	} else {
> +		u32 ctrl, val, bpp;
> +
>  		v4l2_dbg(1, debug, &video->v4l2_dev, "Capture: Direct Mode\n");
> +		ctrl = VE_CTRL_DIRECT_FETCH;
> +		if (video->input == VIDEO_INPUT_GFX) {
> +			regmap_read(video->gfx, GFX_CTRL, &val);
> +			bpp = FIELD_GET(GFX_CTRL_FMT, val) ? 32 : 16;
> +			if (bpp == 16)
> +				ctrl |= VE_CTRL_INT_DE;
> +			aspeed_video_write(video, VE_TGS_1, act->width * (bpp >> 3));
> +		}
>  		aspeed_video_update(video, VE_CTRL,
>  				    VE_CTRL_INT_DE | VE_CTRL_DIRECT_FETCH,
> -				    VE_CTRL_DIRECT_FETCH);
> +				    ctrl);
>  	}
>  
>  	size *= 4;
> @@ -1207,6 +1276,22 @@ static void aspeed_video_set_resolution(struct aspeed_video *video)
>  		aspeed_video_free_buf(video, &video->srcs[0]);
>  }
>  
> +/*
> + * Update relative parameters when timing changed.
> + *
> + * @video: the struct of aspeed_video
> + * @timings: the new timings
> + */
> +static void aspeed_video_update_timings(struct aspeed_video *video, struct v4l2_bt_timings *timings)
> +{
> +	video->active_timings = *timings;
> +	aspeed_video_set_resolution(video);
> +
> +	video->pix_fmt.width = timings->width;
> +	video->pix_fmt.height = timings->height;
> +	video->pix_fmt.sizeimage = video->max_compressed_size;
> +}
> +
>  static void aspeed_video_update_regs(struct aspeed_video *video)
>  {
>  	u8 jpeg_hq_quality = clamp((int)video->jpeg_hq_quality - 1, 0,
> @@ -1219,6 +1304,8 @@ static void aspeed_video_update_regs(struct aspeed_video *video)
>  	u32 ctrl = 0;
>  	u32 seq_ctrl = 0;
>  
> +	v4l2_dbg(1, debug, &video->v4l2_dev, "input(%s)\n",
> +		 input_str[video->input]);
>  	v4l2_dbg(1, debug, &video->v4l2_dev, "framerate(%d)\n",
>  		 video->frame_rate);
>  	v4l2_dbg(1, debug, &video->v4l2_dev, "jpeg format(%s) subsample(%s)\n",
> @@ -1234,6 +1321,9 @@ static void aspeed_video_update_regs(struct aspeed_video *video)
>  	else
>  		aspeed_video_update(video, VE_BCD_CTRL, VE_BCD_CTRL_EN_BCD, 0);
>  
> +	if (video->input == VIDEO_INPUT_VGA)
> +		ctrl |= VE_CTRL_AUTO_OR_CURSOR;
> +
>  	if (video->frame_rate)
>  		ctrl |= FIELD_PREP(VE_CTRL_FRC, video->frame_rate);
>  
> @@ -1252,7 +1342,9 @@ static void aspeed_video_update_regs(struct aspeed_video *video)
>  	aspeed_video_update(video, VE_SEQ_CTRL,
>  			    video->jpeg_mode | VE_SEQ_CTRL_YUV420,
>  			    seq_ctrl);
> -	aspeed_video_update(video, VE_CTRL, VE_CTRL_FRC, ctrl);
> +	aspeed_video_update(video, VE_CTRL,
> +			    VE_CTRL_FRC | VE_CTRL_AUTO_OR_CURSOR |
> +			    VE_CTRL_SOURCE, ctrl);
>  	aspeed_video_update(video, VE_COMP_CTRL,
>  			    VE_COMP_CTRL_DCT_LUM | VE_COMP_CTRL_DCT_CHR |
>  			    VE_COMP_CTRL_EN_HQ | VE_COMP_CTRL_HQ_DCT_LUM |
> @@ -1280,6 +1372,7 @@ static void aspeed_video_init_regs(struct aspeed_video *video)
>  	aspeed_video_write(video, VE_JPEG_ADDR, video->jpeg.dma);
>  
>  	/* Set control registers */
> +	aspeed_video_write(video, VE_SEQ_CTRL, VE_SEQ_CTRL_AUTO_COMP);
>  	aspeed_video_write(video, VE_CTRL, ctrl);
>  	aspeed_video_write(video, VE_COMP_CTRL, VE_COMP_CTRL_RSVD);
>  
> @@ -1311,12 +1404,7 @@ static void aspeed_video_start(struct aspeed_video *video)
>  	aspeed_video_get_resolution(video);
>  
>  	/* Set timings since the device is being opened for the first time */
> -	video->active_timings = video->detected_timings;
> -	aspeed_video_set_resolution(video);
> -
> -	video->pix_fmt.width = video->active_timings.width;
> -	video->pix_fmt.height = video->active_timings.height;
> -	video->pix_fmt.sizeimage = video->max_compressed_size;
> +	aspeed_video_update_timings(video, &video->detected_timings);
>  }
>  
>  static void aspeed_video_stop(struct aspeed_video *video)
> @@ -1414,16 +1502,47 @@ static int aspeed_video_enum_input(struct file *file, void *fh,
>  
>  static int aspeed_video_get_input(struct file *file, void *fh, unsigned int *i)
>  {
> -	*i = 0;
> +	struct aspeed_video *video = video_drvdata(file);
> +
> +	*i = video->input;
>  
>  	return 0;
>  }
>  
>  static int aspeed_video_set_input(struct file *file, void *fh, unsigned int i)
>  {
> -	if (i)
> +	struct aspeed_video *video = video_drvdata(file);
> +
> +	if (i >= VIDEO_INPUT_MAX)
>  		return -EINVAL;
>  
> +	if (IS_ERR(video->scu)) {
> +		v4l2_dbg(1, debug, &video->v4l2_dev, "%s: scu isn't ready for input-control\n", __func__);
> +		return -EINVAL;
> +	}
> +
> +	if (IS_ERR(video->gfx) && i == VIDEO_INPUT_GFX) {
> +		v4l2_dbg(1, debug, &video->v4l2_dev, "%s: gfx isn't ready for GFX input\n", __func__);
> +		return -EINVAL;
> +	}
> +
> +	video->input = i;
> +
> +	if (video->version == 6) {
> +		/* modify dpll source per current input */
> +		if (video->input == VIDEO_INPUT_VGA)
> +			regmap_update_bits(video->scu, SCU_MISC_CTRL, SCU_DPLL_SOURCE, 0);
> +		else
> +			regmap_update_bits(video->scu, SCU_MISC_CTRL, SCU_DPLL_SOURCE, SCU_DPLL_SOURCE);
> +	}
> +
> +	aspeed_video_update_regs(video);
> +
> +	/* update signal status */
> +	aspeed_video_get_resolution(video);
> +	if (!video->v4l2_input_status)
> +		aspeed_video_update_timings(video, &video->detected_timings);
> +
>  	return 0;
>  }

You forgot to update aspeed_video_enum_input()!

If possible, always run v4l2-compliance (directly build from the v4l-utils git repo) whenever
you make changes to ioctls like this, it would have caught this.

Regards,

	Hans

>  
> @@ -1527,13 +1646,7 @@ static int aspeed_video_set_dv_timings(struct file *file, void *fh,
>  	if (vb2_is_busy(&video->queue))
>  		return -EBUSY;
>  
> -	video->active_timings = timings->bt;
> -
> -	aspeed_video_set_resolution(video);
> -
> -	video->pix_fmt.width = timings->bt.width;
> -	video->pix_fmt.height = timings->bt.height;
> -	video->pix_fmt.sizeimage = video->max_compressed_size;
> +	aspeed_video_update_timings(video, &timings->bt);
>  
>  	timings->type = V4L2_DV_BT_656_1120;
>  
> @@ -1911,6 +2024,7 @@ static int aspeed_video_debugfs_show(struct seq_file *s, void *data)
>  	val08 = aspeed_video_read(v, VE_CTRL);
>  	if (FIELD_GET(VE_CTRL_DIRECT_FETCH, val08)) {
>  		seq_printf(s, "  %-20s:\tDirect fetch\n", "Mode");
> +		seq_printf(s, "  %-20s:\t%s\n", "Input", input_str[v->input]);
>  		seq_printf(s, "  %-20s:\t%s\n", "VGA bpp mode",
>  			   FIELD_GET(VE_CTRL_INT_DE, val08) ? "16" : "32");
>  	} else {
> @@ -2070,12 +2184,34 @@ static int aspeed_video_setup_video(struct aspeed_video *video)
>  	return 0;
>  }
>  
> +/*
> + * Get regmap without checking res, such as clk/reset, that could lead to
> + * conflict.
> + */
> +static struct regmap *aspeed_regmap_lookup(struct device_node *np, const char *property)
> +{
> +	struct device_node *syscon_np;
> +	struct regmap *regmap;
> +
> +	syscon_np = of_parse_phandle(np, property, 0);
> +	if (!syscon_np)
> +		return ERR_PTR(-ENODEV);
> +
> +	regmap = device_node_to_regmap(syscon_np);
> +	of_node_put(syscon_np);
> +
> +	return regmap;
> +}
> +
>  static int aspeed_video_init(struct aspeed_video *video)
>  {
>  	int irq;
>  	int rc;
>  	struct device *dev = video->dev;
>  
> +	video->scu = aspeed_regmap_lookup(dev->of_node, "aspeed,scu");
> +	video->gfx = aspeed_regmap_lookup(dev->of_node, "aspeed,gfx");
> +
>  	irq = irq_of_parse_and_map(dev->of_node, 0);
>  	if (!irq) {
>  		dev_err(dev, "Unable to find IRQ\n");
> @@ -2167,6 +2303,7 @@ static int aspeed_video_probe(struct platform_device *pdev)
>  	if (!config)
>  		return -ENODEV;
>  
> +	video->version = config->version;
>  	video->jpeg_mode = config->jpeg_mode;
>  	video->comp_size_read = config->comp_size_read;
>  
> diff --git a/include/uapi/linux/aspeed-video.h b/include/uapi/linux/aspeed-video.h
> index 6586a65548c4..15168e8c931e 100644
> --- a/include/uapi/linux/aspeed-video.h
> +++ b/include/uapi/linux/aspeed-video.h
> @@ -8,6 +8,13 @@
>  
>  #include <linux/v4l2-controls.h>
>  
> +/* aspeed video's input types */
> +enum aspeed_video_input {
> +	VIDEO_INPUT_VGA = 0,
> +	VIDEO_INPUT_GFX,
> +	VIDEO_INPUT_MAX
> +};
> +
>  #define V4L2_CID_ASPEED_HQ_MODE			(V4L2_CID_USER_ASPEED_BASE  + 1)
>  #define V4L2_CID_ASPEED_HQ_JPEG_QUALITY		(V4L2_CID_USER_ASPEED_BASE  + 2)
>  
> 
> base-commit: e9d22f7a6655941fc8b2b942ed354ec780936b3e


