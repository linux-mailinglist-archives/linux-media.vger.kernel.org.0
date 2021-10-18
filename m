Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67A2A4313E6
	for <lists+linux-media@lfdr.de>; Mon, 18 Oct 2021 11:58:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbhJRKBB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Oct 2021 06:01:01 -0400
Received: from mx3.molgen.mpg.de ([141.14.17.11]:57227 "EHLO mx1.molgen.mpg.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229473AbhJRKBB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Oct 2021 06:01:01 -0400
Received: from [192.168.0.2] (ip5f5aef76.dynamic.kabel-deutschland.de [95.90.239.118])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        (Authenticated sender: pmenzel)
        by mx.molgen.mpg.de (Postfix) with ESMTPSA id 3A67F61E5FE33;
        Mon, 18 Oct 2021 11:58:49 +0200 (CEST)
Subject: Re: [PATCH v2 2/7] media: aspeed: use v4l2_info/v4l2_warn/v4l2_dbg
 for log
To:     Jammy Huang <jammy_huang@aspeedtech.com>
References: <20211018092207.13336-1-jammy_huang@aspeedtech.com>
 <20211018092207.13336-3-jammy_huang@aspeedtech.com>
Cc:     eajames@linux.ibm.com, mchehab@kernel.org, joel@jms.id.au,
        andrew@aj.id.au, linux-media@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
From:   Paul Menzel <pmenzel@molgen.mpg.de>
Message-ID: <24ee2592-c62e-8108-58ff-56e648bdf445@molgen.mpg.de>
Date:   Mon, 18 Oct 2021 11:58:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211018092207.13336-3-jammy_huang@aspeedtech.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dear Jammy,


Am 18.10.21 um 11:22 schrieb Jammy Huang:
> The debug log level, 0~3, is controlled by module_param, debug.
> Higher the value, more the information.

Nit: *The* higher …

Please mention your “conversion heuristic”? For example, level 3 is for 
register operations (read, update, write)? Maybe that could also be 
added to the module parameter description.


Kind regards,

Paul


> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---
>   drivers/media/platform/aspeed-video.c | 40 +++++++++++++++------------
>   1 file changed, 23 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index 6259cf17a7cc..642ca96c8c52 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -30,6 +30,7 @@
>   #include <media/v4l2-event.h>
>   #include <media/v4l2-ioctl.h>
>   #include <media/videobuf2-dma-contig.h>
> +#include <linux/videodev2.h>
>   
>   #define DEVICE_NAME			"aspeed-video"
>   
> @@ -390,6 +391,8 @@ static const struct v4l2_dv_timings_cap aspeed_video_timings_cap = {
>   	},
>   };
>   
> +static unsigned int debug;
> +
>   static void aspeed_video_init_jpeg_table(u32 *table, bool yuv420)
>   {
>   	int i;
> @@ -437,23 +440,23 @@ static void aspeed_video_update(struct aspeed_video *video, u32 reg, u32 clear,
>   	t &= ~clear;
>   	t |= bits;
>   	writel(t, video->base + reg);
> -	dev_dbg(video->dev, "update %03x[%08x -> %08x]\n", reg, before,
> -		readl(video->base + reg));
> +	v4l2_dbg(3, debug, &video->v4l2_dev, "update %03x[%08x -> %08x]\n",
> +		 reg, before, readl(video->base + reg));
>   }
>   
>   static u32 aspeed_video_read(struct aspeed_video *video, u32 reg)
>   {
>   	u32 t = readl(video->base + reg);
>   
> -	dev_dbg(video->dev, "read %03x[%08x]\n", reg, t);
> +	v4l2_dbg(3, debug, &video->v4l2_dev, "read %03x[%08x]\n", reg, t);
>   	return t;
>   }
>   
>   static void aspeed_video_write(struct aspeed_video *video, u32 reg, u32 val)
>   {
>   	writel(val, video->base + reg);
> -	dev_dbg(video->dev, "write %03x[%08x]\n", reg,
> -		readl(video->base + reg));
> +	v4l2_dbg(3, debug, &video->v4l2_dev, "write %03x[%08x]\n", reg,
> +		 readl(video->base + reg));
>   }
>   
>   static void update_perf(struct aspeed_video_perf *p)
> @@ -474,13 +477,13 @@ static int aspeed_video_start_frame(struct aspeed_video *video)
>   	u32 seq_ctrl = aspeed_video_read(video, VE_SEQ_CTRL);
>   
>   	if (video->v4l2_input_status) {
> -		dev_dbg(video->dev, "No signal; don't start frame\n");
> +		v4l2_warn(&video->v4l2_dev, "No signal; don't start frame\n");
>   		return 0;
>   	}
>   
>   	if (!(seq_ctrl & VE_SEQ_CTRL_COMP_BUSY) ||
>   	    !(seq_ctrl & VE_SEQ_CTRL_CAP_BUSY)) {
> -		dev_dbg(video->dev, "Engine busy; don't start frame\n");
> +		v4l2_warn(&video->v4l2_dev, "Engine busy; don't start frame\n");
>   		return -EBUSY;
>   	}
>   
> @@ -489,7 +492,7 @@ static int aspeed_video_start_frame(struct aspeed_video *video)
>   				       struct aspeed_video_buffer, link);
>   	if (!buf) {
>   		spin_unlock_irqrestore(&video->lock, flags);
> -		dev_dbg(video->dev, "No buffers; don't start frame\n");
> +		v4l2_warn(&video->v4l2_dev, "No buffers; don't start frame\n");
>   		return -EPROTO;
>   	}
>   
> @@ -565,7 +568,7 @@ static void aspeed_video_bufs_done(struct aspeed_video *video,
>   
>   static void aspeed_video_irq_res_change(struct aspeed_video *video, ulong delay)
>   {
> -	dev_dbg(video->dev, "Resolution changed; resetting\n");
> +	v4l2_dbg(1, debug, &video->v4l2_dev, "Resolution changed; resetting\n");
>   
>   	set_bit(VIDEO_RES_CHANGE, &video->flags);
>   	clear_bit(VIDEO_FRAME_INPRG, &video->flags);
> @@ -766,8 +769,8 @@ static void aspeed_video_calc_compressed_size(struct aspeed_video *video,
>   	aspeed_video_write(video, VE_STREAM_BUF_SIZE,
>   			   compression_buffer_size_reg);
>   
> -	dev_dbg(video->dev, "Max compressed size: %x\n",
> -		video->max_compressed_size);
> +	v4l2_dbg(1, debug, &video->v4l2_dev, "Max compressed size: %#x\n",
> +		 video->max_compressed_size);
>   }
>   
>   #define res_check(v) test_and_clear_bit(VIDEO_MODE_DETECT_DONE, &(v)->flags)
> @@ -804,7 +807,7 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
>   						      res_check(video),
>   						      MODE_DETECT_TIMEOUT);
>   		if (!rc) {
> -			dev_dbg(video->dev, "Timed out; first mode detect\n");
> +			v4l2_warn(&video->v4l2_dev, "Timed out; first mode detect\n");
>   			clear_bit(VIDEO_RES_DETECT, &video->flags);
>   			return;
>   		}
> @@ -822,7 +825,7 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
>   						      MODE_DETECT_TIMEOUT);
>   		clear_bit(VIDEO_RES_DETECT, &video->flags);
>   		if (!rc) {
> -			dev_dbg(video->dev, "Timed out; second mode detect\n");
> +			v4l2_warn(&video->v4l2_dev, "Timed out; second mode detect\n");
>   			return;
>   		}
>   
> @@ -856,7 +859,7 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
>   	} while (invalid_resolution && (tries++ < INVALID_RESOLUTION_RETRIES));
>   
>   	if (invalid_resolution) {
> -		dev_dbg(video->dev, "Invalid resolution detected\n");
> +		v4l2_warn(&video->v4l2_dev, "Invalid resolution detected\n");
>   		return;
>   	}
>   
> @@ -873,8 +876,8 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
>   	aspeed_video_update(video, VE_SEQ_CTRL, 0,
>   			    VE_SEQ_CTRL_AUTO_COMP | VE_SEQ_CTRL_EN_WATCHDOG);
>   
> -	dev_dbg(video->dev, "Got resolution: %dx%d\n", det->width,
> -		det->height);
> +	v4l2_dbg(1, debug, &video->v4l2_dev, "Got resolution: %dx%d\n",
> +		 det->width, det->height);
>   }
>   
>   static void aspeed_video_set_resolution(struct aspeed_video *video)
> @@ -1501,7 +1504,7 @@ static void aspeed_video_stop_streaming(struct vb2_queue *q)
>   				!test_bit(VIDEO_FRAME_INPRG, &video->flags),
>   				STOP_TIMEOUT);
>   	if (!rc) {
> -		dev_dbg(video->dev, "Timed out when stopping streaming\n");
> +		v4l2_warn(&video->v4l2_dev, "Timed out when stopping streaming\n");
>   
>   		/*
>   		 * Need to force stop any DMA and try and get HW into a good
> @@ -1856,6 +1859,9 @@ static struct platform_driver aspeed_video_driver = {
>   
>   module_platform_driver(aspeed_video_driver);
>   
> +module_param(debug, int, 0644);
> +MODULE_PARM_DESC(debug, "Debug level (0-3)");
> +
>   MODULE_DESCRIPTION("ASPEED Video Engine Driver");
>   MODULE_AUTHOR("Eddie James");
>   MODULE_LICENSE("GPL v2");
> 
