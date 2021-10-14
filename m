Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95B2742D2C4
	for <lists+linux-media@lfdr.de>; Thu, 14 Oct 2021 08:36:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229551AbhJNGiz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Oct 2021 02:38:55 -0400
Received: from mx3.molgen.mpg.de ([141.14.17.11]:52683 "EHLO mx1.molgen.mpg.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229457AbhJNGiz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Oct 2021 02:38:55 -0400
Received: from [192.168.0.2] (ip5f5ae921.dynamic.kabel-deutschland.de [95.90.233.33])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        (Authenticated sender: pmenzel)
        by mx.molgen.mpg.de (Postfix) with ESMTPSA id 9B8DA61E64760;
        Thu, 14 Oct 2021 08:36:49 +0200 (CEST)
Subject: Re: [PATCH 3/6] media: aspeed: refine to centerize format/compress
 settings
To:     Jammy Huang <jammy_huang@aspeedtech.com>
References: <20211014034819.2283-1-jammy_huang@aspeedtech.com>
 <20211014034819.2283-4-jammy_huang@aspeedtech.com>
Cc:     eajames@linux.ibm.com, mchehab@kernel.org, joel@jms.id.au,
        andrew@aj.id.au, linux-media@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
From:   Paul Menzel <pmenzel@molgen.mpg.de>
Message-ID: <27ddf165-4a7c-2d41-bddc-16baf4a3db8f@molgen.mpg.de>
Date:   Thu, 14 Oct 2021 08:36:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211014034819.2283-4-jammy_huang@aspeedtech.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dear Jammy,


Am 14.10.21 um 05:48 schrieb Jammy Huang:

> [PATCH 3/6] media: aspeed: refine to centerize format/compress settings

Do you mean to “refactor”? Maybe:

> Refactor format/compress settings into dedicated function

> Add API, aspeed_video_update_regs(), to centerize format/compress settings
> which are controlled by user.

I do not know “centerize”. Maybe somebody else has an idea.

> … to control format/compress settings controlled by the user.

Could you please paste the new log messages?

> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---
>   drivers/media/platform/aspeed-video.c | 68 +++++++++++++--------------
>   1 file changed, 34 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index 7b8129b0ca5f..3b5a3935325d 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -974,20 +974,41 @@ static void aspeed_video_set_resolution(struct aspeed_video *video)
>   		aspeed_video_free_buf(video, &video->srcs[0]);
>   }
>   
> -static void aspeed_video_init_regs(struct aspeed_video *video)
> +static void aspeed_video_update_regs(struct aspeed_video *video)
>   {
>   	u32 comp_ctrl = VE_COMP_CTRL_RSVD |
>   		FIELD_PREP(VE_COMP_CTRL_DCT_LUM, video->jpeg_quality) |
>   		FIELD_PREP(VE_COMP_CTRL_DCT_CHR, video->jpeg_quality | 0x10);
> -	u32 ctrl = VE_CTRL_AUTO_OR_CURSOR;
> +	u32 ctrl = 0;
>   	u32 seq_ctrl = VE_SEQ_CTRL_JPEG_MODE;
>   
> +	dprintk(LOG_INFO, "framerate(%d)\n", video->frame_rate);
> +	dprintk(LOG_INFO, "subsample(%s)\n",
> +		video->yuv420 ? "420" : "444");
> +	dprintk(LOG_INFO, "compression quality(%d)\n",
> +		video->jpeg_quality);
> +
>   	if (video->frame_rate)
>   		ctrl |= FIELD_PREP(VE_CTRL_FRC, video->frame_rate);
>   
>   	if (video->yuv420)
>   		seq_ctrl |= VE_SEQ_CTRL_YUV420;
>   
> +	if (video->jpeg.virt)
> +		aspeed_video_update_jpeg_table(video->jpeg.virt, video->yuv420);
> +
> +	/* Set control registers */
> +	aspeed_video_update(video, VE_SEQ_CTRL,
> +			    VE_SEQ_CTRL_JPEG_MODE | VE_SEQ_CTRL_YUV420,
> +			    seq_ctrl);
> +	aspeed_video_update(video, VE_CTRL, VE_CTRL_FRC, ctrl);
> +	aspeed_video_update(video, VE_COMP_CTRL,
> +			    VE_COMP_CTRL_DCT_LUM | VE_COMP_CTRL_DCT_CHR,
> +			    comp_ctrl);
> +}
> +
> +static void aspeed_video_init_regs(struct aspeed_video *video)
> +{
>   	/* Unlock VE registers */
>   	aspeed_video_write(video, VE_PROTECTION_KEY, VE_PROTECTION_KEY_UNLOCK);
>   
> @@ -1002,9 +1023,8 @@ static void aspeed_video_init_regs(struct aspeed_video *video)
>   	aspeed_video_write(video, VE_JPEG_ADDR, video->jpeg.dma);
>   
>   	/* Set control registers */
> -	aspeed_video_write(video, VE_SEQ_CTRL, seq_ctrl);
> -	aspeed_video_write(video, VE_CTRL, ctrl);
> -	aspeed_video_write(video, VE_COMP_CTRL, comp_ctrl);
> +	aspeed_video_write(video, VE_CTRL, VE_CTRL_AUTO_OR_CURSOR);
> +	aspeed_video_write(video, VE_COMP_CTRL, VE_COMP_CTRL_RSVD);

Why is this changed?

>   
>   	/* Don't downscale */
>   	aspeed_video_write(video, VE_SCALING_FACTOR, 0x10001000);
> @@ -1335,27 +1355,6 @@ static const struct v4l2_ioctl_ops aspeed_video_ioctl_ops = {
>   	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
>   };
>   
> -static void aspeed_video_update_jpeg_quality(struct aspeed_video *video)
> -{
> -	u32 comp_ctrl = FIELD_PREP(VE_COMP_CTRL_DCT_LUM, video->jpeg_quality) |
> -		FIELD_PREP(VE_COMP_CTRL_DCT_CHR, video->jpeg_quality | 0x10);
> -
> -	aspeed_video_update(video, VE_COMP_CTRL,
> -			    VE_COMP_CTRL_DCT_LUM | VE_COMP_CTRL_DCT_CHR,
> -			    comp_ctrl);
> -}
> -
> -static void aspeed_video_update_subsampling(struct aspeed_video *video)
> -{
> -	if (video->jpeg.virt)
> -		aspeed_video_update_jpeg_table(video->jpeg.virt, video->yuv420);
> -
> -	if (video->yuv420)
> -		aspeed_video_update(video, VE_SEQ_CTRL, 0, VE_SEQ_CTRL_YUV420);
> -	else
> -		aspeed_video_update(video, VE_SEQ_CTRL, VE_SEQ_CTRL_YUV420, 0);
> -}
> -
>   static int aspeed_video_set_ctrl(struct v4l2_ctrl *ctrl)
>   {
>   	struct aspeed_video *video = container_of(ctrl->handler,
> @@ -1365,16 +1364,13 @@ static int aspeed_video_set_ctrl(struct v4l2_ctrl *ctrl)
>   	switch (ctrl->id) {
>   	case V4L2_CID_JPEG_COMPRESSION_QUALITY:
>   		video->jpeg_quality = ctrl->val;
> -		aspeed_video_update_jpeg_quality(video);
> +		if (test_bit(VIDEO_STREAMING, &video->flags))
> +			aspeed_video_update_regs(video);
>   		break;
>   	case V4L2_CID_JPEG_CHROMA_SUBSAMPLING:
> -		if (ctrl->val == V4L2_JPEG_CHROMA_SUBSAMPLING_420) {
> -			video->yuv420 = true;
> -			aspeed_video_update_subsampling(video);
> -		} else {
> -			video->yuv420 = false;
> -			aspeed_video_update_subsampling(video);
> -		}
> +		video->yuv420 = (ctrl->val == V4L2_JPEG_CHROMA_SUBSAMPLING_420);
> +		if (test_bit(VIDEO_STREAMING, &video->flags))
> +			aspeed_video_update_regs(video);
>   		break;
>   	default:
>   		return -EINVAL;
> @@ -1404,6 +1400,8 @@ static void aspeed_video_resolution_work(struct work_struct *work)
>   
>   	aspeed_video_init_regs(video);
>   
> +	aspeed_video_update_regs(video);
> +
>   	aspeed_video_get_resolution(video);
>   
>   	if (video->detected_timings.width != video->active_timings.width ||
> @@ -1518,6 +1516,8 @@ static int aspeed_video_start_streaming(struct vb2_queue *q,
>   	video->perf.duration_max = 0;
>   	video->perf.duration_min = 0xffffffff;
>   
> +	aspeed_video_update_regs(video);
> +
>   	rc = aspeed_video_start_frame(video);
>   	if (rc) {
>   		aspeed_video_bufs_done(video, VB2_BUF_STATE_QUEUED);
> 

Kind regards,

Paul
