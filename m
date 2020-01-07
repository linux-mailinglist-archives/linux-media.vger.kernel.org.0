Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 346C2132F3E
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2020 20:18:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728668AbgAGTSU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jan 2020 14:18:20 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:18310 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728358AbgAGTSU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 7 Jan 2020 14:18:20 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 007JGw9K121967;
        Tue, 7 Jan 2020 14:18:11 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2xar4988f7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 07 Jan 2020 14:18:11 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
        by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 007JF8X2002457;
        Tue, 7 Jan 2020 19:18:16 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
        by ppma01wdc.us.ibm.com with ESMTP id 2xajb6dqv0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 07 Jan 2020 19:18:16 +0000
Received: from b03ledav001.gho.boulder.ibm.com (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
        by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 007JI9UZ45679066
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 7 Jan 2020 19:18:09 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 027C76E04E;
        Tue,  7 Jan 2020 19:18:09 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 9F6576E050;
        Tue,  7 Jan 2020 19:18:08 +0000 (GMT)
Received: from [9.163.26.112] (unknown [9.163.26.112])
        by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
        Tue,  7 Jan 2020 19:18:08 +0000 (GMT)
Subject: Re: [PATCH 2/3] media: aspeed: Use runtime configuration
To:     Joel Stanley <joel@jms.id.au>,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Andrew Jeffery <andrew@aj.id.au>, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20200107034324.38073-1-joel@jms.id.au>
 <20200107034324.38073-3-joel@jms.id.au>
From:   Eddie James <eajames@linux.ibm.com>
Message-ID: <7eedae4f-967f-d563-44e6-9bb3e9679bb7@linux.ibm.com>
Date:   Tue, 7 Jan 2020 13:18:08 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200107034324.38073-3-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-01-07_06:2020-01-07,2020-01-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 impostorscore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0 phishscore=0
 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001070152
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 1/6/20 9:43 PM, Joel Stanley wrote:
> The aspeed video IP has some differences between SoC families. Currently
> the driver decides which registers to use at compile time, which means
> a single kernel can not be used between platforms.
>
> Switch to using runtime configuration of the registers that vary between
> SoC families. This is in preparation for upcoming ast2600 support.


Reviewed-by: Eddie James <eajames@linux.ibm.com>


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
