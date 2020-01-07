Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7166132D19
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2020 18:33:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728434AbgAGRdl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jan 2020 12:33:41 -0500
Received: from mga17.intel.com ([192.55.52.151]:12573 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728266AbgAGRdl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 7 Jan 2020 12:33:41 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Jan 2020 09:33:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,406,1571727600"; 
   d="scan'208";a="233279357"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.147]) ([10.7.153.147])
  by orsmga002.jf.intel.com with ESMTP; 07 Jan 2020 09:33:13 -0800
Subject: Re: [PATCH 2/3] media: aspeed: Use runtime configuration
To:     Joel Stanley <joel@jms.id.au>, Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Andrew Jeffery <andrew@aj.id.au>, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20200107034324.38073-1-joel@jms.id.au>
 <20200107034324.38073-3-joel@jms.id.au>
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <c18ec7d5-023a-f0cd-40fd-32eab1d089fb@linux.intel.com>
Date:   Tue, 7 Jan 2020 09:33:10 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200107034324.38073-3-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Joel,

On 1/6/2020 7:43 PM, Joel Stanley wrote:
> The aspeed video IP has some differences between SoC families. Currently
> the driver decides which registers to use at compile time, which means
> a single kernel can not be used between platforms.
> 
> Switch to using runtime configuration of the registers that vary between
> SoC families. This is in preparation for upcoming ast2600 support.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   drivers/media/platform/aspeed-video.c | 53 ++++++++++++++++++++-------
>   1 file changed, 39 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index 8f849d9866af..d70b893fd4cf 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -72,11 +72,8 @@
>   #define  VE_SEQ_CTRL_CAP_BUSY		BIT(16)
>   #define  VE_SEQ_CTRL_COMP_BUSY		BIT(18)
>   
> -#ifdef CONFIG_MACH_ASPEED_G5
> -#define  VE_SEQ_CTRL_JPEG_MODE		BIT(13)	/* AST2500 */
> -#else
> -#define  VE_SEQ_CTRL_JPEG_MODE		BIT(8)	/* AST2400 */
> -#endif /* CONFIG_MACH_ASPEED_G5 */
> +#define AST2500_VE_SEQ_CTRL_JPEG_MODE	BIT(13)
> +#define AST2400_VE_SEQ_CTRL_JPEG_MODE	BIT(8)
>   
>   #define VE_CTRL				0x008
>   #define  VE_CTRL_HSYNC_POL		BIT(0)
> @@ -220,6 +217,9 @@ struct aspeed_video {
>   	struct video_device vdev;
>   	struct mutex video_lock;	/* v4l2 and videobuf2 lock */
>   
> +	u32 jpeg_mode;
> +	u32 comp_size_read;

How do you think about of adding
'const struct aspeed_video_config *config' instead so that we can
use them like 'video->config->jpeg_mode' in this module. Also, we could
simply add any SoC specific variations in the future if we add the
'config' member instead of above.

Overall it looks good to me. I'll rebase my change on top of it.

Thanks a lot!

Jae

> +
>   	wait_queue_head_t wait;
>   	spinlock_t lock;		/* buffer list lock */
>   	struct delayed_work res_work;
> @@ -243,6 +243,21 @@ struct aspeed_video {
>   
>   #define to_aspeed_video(x) container_of((x), struct aspeed_video, v4l2_dev)
>   
> +struct aspeed_video_config {
> +	u32 jpeg_mode;
> +	u32 comp_size_read;
> +};
> +
> +static const struct aspeed_video_config ast2400_config = {
> +	.jpeg_mode = AST2400_VE_SEQ_CTRL_JPEG_MODE,
> +	.comp_size_read = VE_OFFSET_COMP_STREAM,
> +};
> +
> +static const struct aspeed_video_config ast2500_config = {
> +	.jpeg_mode = AST2500_VE_SEQ_CTRL_JPEG_MODE,
> +	.comp_size_read = VE_OFFSET_COMP_STREAM,
> +};
> +
>   static const u32 aspeed_video_jpeg_header[ASPEED_VIDEO_JPEG_HEADER_SIZE] = {
>   	0xe0ffd8ff, 0x464a1000, 0x01004649, 0x60000101, 0x00006000, 0x0f00feff,
>   	0x00002d05, 0x00000000, 0x00000000, 0x00dbff00
> @@ -572,7 +587,7 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
>   	if (sts & VE_INTERRUPT_COMP_COMPLETE) {
>   		struct aspeed_video_buffer *buf;
>   		u32 frame_size = aspeed_video_read(video,
> -						   VE_OFFSET_COMP_STREAM);
> +						   video->comp_size_read);
>   
>   		spin_lock(&video->lock);
>   		clear_bit(VIDEO_FRAME_INPRG, &video->flags);
> @@ -907,7 +922,7 @@ static void aspeed_video_init_regs(struct aspeed_video *video)
>   		FIELD_PREP(VE_COMP_CTRL_DCT_LUM, video->jpeg_quality) |
>   		FIELD_PREP(VE_COMP_CTRL_DCT_CHR, video->jpeg_quality | 0x10);
>   	u32 ctrl = VE_CTRL_AUTO_OR_CURSOR;
> -	u32 seq_ctrl = VE_SEQ_CTRL_JPEG_MODE;
> +	u32 seq_ctrl = video->jpeg_mode;;
>   
>   	if (video->frame_rate)
>   		ctrl |= FIELD_PREP(VE_CTRL_FRC, video->frame_rate);
> @@ -1653,8 +1668,17 @@ static int aspeed_video_init(struct aspeed_video *video)
>   	return rc;
>   }
>   
> +static const struct of_device_id aspeed_video_of_match[] = {
> +	{ .compatible = "aspeed,ast2400-video-engine", .data = &ast2400_config },
> +	{ .compatible = "aspeed,ast2500-video-engine", .data = &ast2500_config },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, aspeed_video_of_match);
> +
>   static int aspeed_video_probe(struct platform_device *pdev)
>   {
> +	const struct aspeed_video_config *config;
> +	const struct of_device_id *match;
>   	struct aspeed_video *video;
>   	int rc;
>   
> @@ -1666,6 +1690,14 @@ static int aspeed_video_probe(struct platform_device *pdev)
>   	if (IS_ERR(video->base))
>   		return PTR_ERR(video->base);
>   
> +	match = of_match_node(aspeed_video_of_match, pdev->dev.of_node);
> +	if (!match)
> +		return -EINVAL;
> +
> +	config = match->data;
> +	video->jpeg_mode = config->jpeg_mode;
> +	video->comp_size_read = config->comp_size_read;
> +
>   	video->frame_rate = 30;
>   	video->dev = &pdev->dev;
>   	spin_lock_init(&video->lock);
> @@ -1712,13 +1744,6 @@ static int aspeed_video_remove(struct platform_device *pdev)
>   	return 0;
>   }
>   
> -static const struct of_device_id aspeed_video_of_match[] = {
> -	{ .compatible = "aspeed,ast2400-video-engine" },
> -	{ .compatible = "aspeed,ast2500-video-engine" },
> -	{}
> -};
> -MODULE_DEVICE_TABLE(of, aspeed_video_of_match);
> -
>   static struct platform_driver aspeed_video_driver = {
>   	.driver = {
>   		.name = DEVICE_NAME,
> 
