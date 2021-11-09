Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB59D44AB50
	for <lists+linux-media@lfdr.de>; Tue,  9 Nov 2021 11:18:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245238AbhKIKU4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Nov 2021 05:20:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243712AbhKIKUz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Nov 2021 05:20:55 -0500
Received: from lb2-smtp-cloud9.xs4all.net (lb2-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3183BC061764;
        Tue,  9 Nov 2021 02:18:08 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id kOCFm1Vfo030KkOCYmdc9D; Tue, 09 Nov 2021 11:18:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1636453086; bh=lCCHZ/8Qq8rr0aVosrFnG11TPRlCtP3gwV7u5ejgY+I=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=wv+Q0C/ZRilGwC54YUgRYiYn9C5fvZhPCapWUUS3dCuYzi1Z44hSTQfaM8rO1VKAe
         6SQwaJjN4YejZdJUjAKUUkPEm9Bxf+d5ZV7GyVqLKdBdafRpev6qViS3wNdlObGJwK
         E2lDgw8jyPXkg7kOiDkl4tJGAUYF5E825qrmY+/sKsSu1KzexNeRL6NpqA02hiarmv
         hfor5KmdYUj0HXzN+n97ykCAPriqy5CCeibSIbWDhCWtYLyaWiUpG/xq8EC8KVcWvl
         qUjFHYZEqpxwhBDMVzm5fwHIvlzhyYZ7mx/vnIS1zPBtg42eAHRyJTzYMABTnOwiRS
         n2YeDaEu105pQ==
Subject: Re: [PATCH v3 5/7] media: aspeed: Support aspeed mode to reduce
 compressed data
To:     Jammy Huang <jammy_huang@aspeedtech.com>, eajames@linux.ibm.com,
        mchehab@kernel.org, joel@jms.id.au, andrew@aj.id.au,
        linux-media@vger.kernel.org, openbmc@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20211022065539.12392-1-jammy_huang@aspeedtech.com>
 <20211022065539.12392-6-jammy_huang@aspeedtech.com>
 <75ea5824-e241-6548-bdc2-7ac9ec6346b6@xs4all.nl>
 <7d6ced4a-fea1-1163-40cb-65b4ea929a51@aspeedtech.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <34ce1814-349b-d7a9-6118-341eea9ecf5f@xs4all.nl>
Date:   Tue, 9 Nov 2021 11:17:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <7d6ced4a-fea1-1163-40cb-65b4ea929a51@aspeedtech.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfM9I2KbEWltIoN82crq4G+wLnh91bq8BvHGga2iT4CqgFIo1KbGj0vv6/npsaX+g+P+Vb1AlSwSj7uDhwmidcL08B0HspPY59J1fTY+XdvrZXDP6xhOm
 rsuqqF/4QWVcZ1gfIhy+4Wb9AdOPq1fNYTlGEmbK+gIN6QWelKEbSKcoyWqM2vnFxjvFrLJQ1YA29yelSZa7UpULuWTaOz3zd6RTF39M3u1iiZcbRHORKp5K
 S6P8XyCP093faU7ruifKNmsCvR28Bcxco9c+czCbDG6SU0Nr61NHWMqvd1SiECbDhgv16EH8vu/wApQT46tec3cAorWt4VnkcNTh7KRq0kv9XQnEgMyOHCLu
 h0fO00wYNCCataK1UEHqruh5OYmNtkEugOCy1H4fTe1/SN7ofnuOVfWYMTdBXYLInNpi0kdP0LJ7kifKMZx8G9zi5YKh66f1YkAto08chZaoOTWlNtmdWETk
 EG1/NBz6u5Xz+jbfrECt44BHmLAaLt/QUNf+rNadKx+YV/B5HSr+hQFrlI5TM/hPNFxhJWAk1h14PeZPKiOqGMRBbInjZlwCKWxoi56JaEGgJSU3l/qlmrwm
 moRjU31B84+zN4E8bdD6Uw6s43Npw3B3+WOyUmr/irneNA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/9/21 2:56 AM, Jammy Huang wrote:
> Dear Hans,
> 
> Thanks for your review.
> 
> On 2021/11/8 下午 05:09, Hans Verkuil wrote:
>> On 22/10/2021 08:55, Jammy Huang wrote:
>>> aspeed supports differential jpeg format which only compress the parts
>>> which are changed. In this way, it reduces both the amount of data to be
>>> transferred by network and those to be decoded on the client side.
>>>
>>> 4 new ctrls are added:
>>> * Aspeed JPEG Format: to control aspeed's partial jpeg on/off
>>>    0: standard jpeg, 1: aspeed jpeg
>> What exactly is 'aspeed jpeg'?
> 
> 'aspeed jpeg' is aspeed proprietary compression format. It will compare 
> the new frame
> with previous one to decide which macroblock's data is changed, and only 
> the changed
> macroblock will be compressed. In this way, the amount of compressed data is
> significantly reduced. This is similar to the concept of I/P-frames of 
> video compression.

Right, but that makes this a new vendor-specific pixelformat, not a control.

> 
> For example, the video is static in first 3 frames and then a object in 
> the video moved in
> 4th frame.
> 
>          Frame Content      |    Standard    |    Aspeed
> -----------------------------------------------------------------------
> 1th                                 |    Full             | Full
> 2th    identical with 1st   |    Full             |   none (only about 
> 12 Bytes for header data)
> 3th    identical with 1st   |    Full             |   none
> 4th    a object moved     |    Full             |   Only the Macroblocks 
> that have data changed are compressed
> 
> I have implemented a javascript aspeed decoder in novnc to support this 
> format, but
> the performance isn't good enough. I am working on a web-assembly to 
> improve it.

Is this format documented in a datasheet or something similar, ideally freely
available?

> 
>>> * Aspeed Compression Mode: to control aspeed's compression mode
>>>    0: DCT Only, 1: DCT VQ mix 2-color, 2: DCT VQ mix 4-color
>>>    This is AST2400 only. It will adapt JPEG or VQ encoding method according
>>>    to the context automatically.
>> What exactly does this do?
>>
>> Is this very aspeed-specific, or could this be a standard JPEG control?
> Yes, this is aspeed-specific. Its compression algorithm is a modified 
> JPEG algorithm.

Is this specific to the aspeed jpeg format, or also to the 'regular' jpeg format?

Regards,

	Hans

>>
>>> * Aspeed HQ Mode: to control aspeed's HQ mode on/off
>>>    0: disabled, 1: enabled
>>> * Aspeed HQ Quality: to control the quality of aspeed's HQ mode
>>>    only useful if Aspeed HQ mode is enabled
>> Can these two controls be replaced by the existing V4L2_CID_JPEG_COMPRESSION_QUALITY
>> control? I.e.: range 1..12 is non-HQ, 13-24 is HQ. Note that the spec recommends
>> that value 0 is not used in the V4L2_CID_JPEG_COMPRESSION_QUALITY range:
>>
>> https://hverkuil.home.xs4all.nl/spec/userspace-api/v4l/ext-ctrls-jpeg.html
> HQ mode is aspeed-specific and not related to stanard jpeg's compression 
> quality. These two
> quality attribute can be controlled independently. So, I think it is not 
> proper to integrate them
> together.
> 
> Noted, I will modified the min value of these 2 quality control.
> 
>>
>>> Aspeed JPEG Format requires an additional buffer, called bcd, to store
>>> the information about which macro block in the new frame is different
>>> from the previous one.
>>>
>>> To have bcd correctly working, we need to swap the buffers for src0/1 to
>>> make src1 refer to previous frame and src0 to the coming new frame.
>>>
>>> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
>>> ---
>>>   drivers/media/platform/aspeed-video.c | 222 +++++++++++++++++++++++---
>>>   1 file changed, 203 insertions(+), 19 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
>>> index cafbffe1ef69..94d17dee6f3d 100644
>>> --- a/drivers/media/platform/aspeed-video.c
>>> +++ b/drivers/media/platform/aspeed-video.c
>>> @@ -32,6 +32,12 @@
>>>   #include <media/videobuf2-dma-contig.h>
>>>   #include <linux/videodev2.h>
>>>   
>>> +#define ASPEED_CID_CUSTOM_BASE			(V4L2_CID_USER_BASE | 0xf000)
>> Driver-specific control ID ranges must be reserved in include/uapi/linux/v4l2-controls.h.
>> See e.g. V4L2_CID_USER_ALLEGRO_BASE.
> OKay, I will update in the next patch.
>>
>> Regards,
>>
>> 	Hans
>>
>>> +#define V4L2_CID_ASPEED_FORMAT			(ASPEED_CID_CUSTOM_BASE  + 1)
>>> +#define V4L2_CID_ASPEED_COMPRESSION_MODE	(ASPEED_CID_CUSTOM_BASE  + 2)
>>> +#define V4L2_CID_ASPEED_HQ_MODE			(ASPEED_CID_CUSTOM_BASE  + 3)
>>> +#define V4L2_CID_ASPEED_HQ_JPEG_QUALITY		(ASPEED_CID_CUSTOM_BASE  + 4)
>>> +
>>>   #define DEVICE_NAME			"aspeed-video"
>>>   
>>>   #define ASPEED_VIDEO_JPEG_NUM_QUALITIES	12
>>> @@ -55,6 +61,7 @@
>>>   
>>>   #define VE_MAX_SRC_BUFFER_SIZE		0x8ca000 /* 1920 * 1200, 32bpp */
>>>   #define VE_JPEG_HEADER_SIZE		0x006000 /* 512 * 12 * 4 */
>>> +#define VE_BCD_BUFF_SIZE		0x100000
>>>   
>>>   #define VE_PROTECTION_KEY		0x000
>>>   #define  VE_PROTECTION_KEY_UNLOCK	0x1a038aa8
>>> @@ -108,6 +115,13 @@
>>>   #define VE_SCALING_FILTER2		0x020
>>>   #define VE_SCALING_FILTER3		0x024
>>>   
>>> +#define VE_BCD_CTRL			0x02C
>>> +#define  VE_BCD_CTRL_EN_BCD		BIT(0)
>>> +#define  VE_BCD_CTRL_EN_ABCD		BIT(1)
>>> +#define  VE_BCD_CTRL_EN_CB		BIT(2)
>>> +#define  VE_BCD_CTRL_THR		GENMASK(23, 16)
>>> +#define  VE_BCD_CTRL_ABCD_THR		GENMASK(31, 24)
>>> +
>>>   #define VE_CAP_WINDOW			0x030
>>>   #define VE_COMP_WINDOW			0x034
>>>   #define VE_COMP_PROC_OFFSET		0x038
>>> @@ -116,6 +130,7 @@
>>>   #define VE_SRC0_ADDR			0x044
>>>   #define VE_SRC_SCANLINE_OFFSET		0x048
>>>   #define VE_SRC1_ADDR			0x04c
>>> +#define VE_BCD_ADDR			0x050
>>>   #define VE_COMP_ADDR			0x054
>>>   
>>>   #define VE_STREAM_BUF_SIZE		0x058
>>> @@ -136,6 +151,8 @@
>>>   #define  VE_COMP_CTRL_HQ_DCT_CHR	GENMASK(26, 22)
>>>   #define  VE_COMP_CTRL_HQ_DCT_LUM	GENMASK(31, 27)
>>>   
>>> +#define VE_CB_ADDR			0x06C
>>> +
>>>   #define VE_OFFSET_COMP_STREAM		0x078
>>>   
>>>   #define VE_JPEG_COMP_SIZE_READ_BACK	0x084
>>> @@ -243,10 +260,15 @@ struct aspeed_video {
>>>   	unsigned int max_compressed_size;
>>>   	struct aspeed_video_addr srcs[2];
>>>   	struct aspeed_video_addr jpeg;
>>> +	struct aspeed_video_addr bcd;
>>>   
>>>   	bool yuv420;
>>> +	bool partial_jpeg;
>>> +	bool hq_mode;
>>>   	unsigned int frame_rate;
>>>   	unsigned int jpeg_quality;
>>> +	unsigned int jpeg_hq_quality;
>>> +	unsigned int compression_mode;
>>>   
>>>   	unsigned int frame_bottom;
>>>   	unsigned int frame_left;
>>> @@ -258,6 +280,13 @@ struct aspeed_video {
>>>   
>>>   #define to_aspeed_video(x) container_of((x), struct aspeed_video, v4l2_dev)
>>>   
>>> +static bool aspeed_video_alloc_buf(struct aspeed_video *video,
>>> +				   struct aspeed_video_addr *addr,
>>> +				   unsigned int size);
>>> +
>>> +static void aspeed_video_free_buf(struct aspeed_video *video,
>>> +				  struct aspeed_video_addr *addr);
>>> +
>>>   static const u32 aspeed_video_jpeg_header[ASPEED_VIDEO_JPEG_HEADER_SIZE] = {
>>>   	0xe0ffd8ff, 0x464a1000, 0x01004649, 0x60000101, 0x00006000, 0x0f00feff,
>>>   	0x00002d05, 0x00000000, 0x00000000, 0x00dbff00
>>> @@ -492,6 +521,20 @@ static int aspeed_video_start_frame(struct aspeed_video *video)
>>>   		return -EBUSY;
>>>   	}
>>>   
>>> +	if (video->partial_jpeg && !video->bcd.size) {
>>> +		if (!aspeed_video_alloc_buf(video, &video->bcd,
>>> +					    VE_BCD_BUFF_SIZE)) {
>>> +			dev_err(video->dev, "Failed to allocate BCD buffer\n");
>>> +			dev_err(video->dev, "don't start frame\n");
>>> +			return -ENOMEM;
>>> +		}
>>> +		aspeed_video_write(video, VE_BCD_ADDR, video->bcd.dma);
>>> +		v4l2_dbg(1, debug, &video->v4l2_dev, "bcd addr(%#x) size(%d)\n",
>>> +			video->bcd.dma, video->bcd.size);
>>> +	} else if (!video->partial_jpeg && video->bcd.size) {
>>> +		aspeed_video_free_buf(video, &video->bcd);
>>> +	}
>>> +
>>>   	spin_lock_irqsave(&video->lock, flags);
>>>   	buf = list_first_entry_or_null(&video->buffers,
>>>   				       struct aspeed_video_buffer, link);
>>> @@ -635,6 +678,7 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
>>>   
>>>   	if (sts & VE_INTERRUPT_COMP_COMPLETE) {
>>>   		struct aspeed_video_buffer *buf;
>>> +		bool empty = true;
>>>   		u32 frame_size = aspeed_video_read(video,
>>>   						   VE_JPEG_COMP_SIZE_READ_BACK);
>>>   
>>> @@ -648,13 +692,23 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
>>>   		if (buf) {
>>>   			vb2_set_plane_payload(&buf->vb.vb2_buf, 0, frame_size);
>>>   
>>> -			if (!list_is_last(&buf->link, &video->buffers)) {
>>> +			/*
>>> +			 * partial_jpeg requires continuous update.
>>> +			 * On the contrary, standard jpeg can keep last buffer
>>> +			 * to always have the latest result.
>>> +			 */
>>> +			if (!video->partial_jpeg &&
>>> +			    list_is_last(&buf->link, &video->buffers)) {
>>> +				empty = false;
>>> +				v4l2_warn(&video->v4l2_dev, "skip to keep last frame updated\n");
>>> +			} else {
>>>   				buf->vb.vb2_buf.timestamp = ktime_get_ns();
>>>   				buf->vb.sequence = video->sequence++;
>>>   				buf->vb.field = V4L2_FIELD_NONE;
>>>   				vb2_buffer_done(&buf->vb.vb2_buf,
>>>   						VB2_BUF_STATE_DONE);
>>>   				list_del(&buf->link);
>>> +				empty = list_empty(&video->buffers);
>>>   			}
>>>   		}
>>>   		spin_unlock(&video->lock);
>>> @@ -668,7 +722,18 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
>>>   		aspeed_video_write(video, VE_INTERRUPT_STATUS,
>>>   				   VE_INTERRUPT_COMP_COMPLETE);
>>>   		sts &= ~VE_INTERRUPT_COMP_COMPLETE;
>>> -		if (test_bit(VIDEO_STREAMING, &video->flags) && buf)
>>> +
>>> +		// swap src buffer if partial_jpeg
>>> +		if (video->partial_jpeg) {
>>> +			u32 src0, src1;
>>> +
>>> +			src0 = aspeed_video_read(video, VE_SRC0_ADDR);
>>> +			src1 = aspeed_video_read(video, VE_SRC1_ADDR);
>>> +			aspeed_video_write(video, VE_SRC0_ADDR, src1);
>>> +			aspeed_video_write(video, VE_SRC1_ADDR, src0);
>>> +		}
>>> +
>>> +		if (test_bit(VIDEO_STREAMING, &video->flags) && !empty)
>>>   			aspeed_video_start_frame(video);
>>>   	}
>>>   
>>> @@ -931,10 +996,14 @@ static void aspeed_video_set_resolution(struct aspeed_video *video)
>>>   				   FIELD_PREP(VE_TGS_FIRST, video->frame_top) |
>>>   				   FIELD_PREP(VE_TGS_LAST,
>>>   					      video->frame_bottom + 1));
>>> -		aspeed_video_update(video, VE_CTRL, 0, VE_CTRL_INT_DE);
>>> +		aspeed_video_update(video, VE_CTRL,
>>> +				    VE_CTRL_INT_DE | VE_CTRL_DIRECT_FETCH,
>>> +				    VE_CTRL_INT_DE);
>>>   	} else {
>>>   		v4l2_dbg(1, debug, &video->v4l2_dev, "Capture: Direct Mode\n");
>>> -		aspeed_video_update(video, VE_CTRL, 0, VE_CTRL_DIRECT_FETCH);
>>> +		aspeed_video_update(video, VE_CTRL,
>>> +				    VE_CTRL_INT_DE | VE_CTRL_DIRECT_FETCH,
>>> +				    VE_CTRL_DIRECT_FETCH);
>>>   	}
>>>   
>>>   	size *= 4;
>>> @@ -969,35 +1038,70 @@ static void aspeed_video_set_resolution(struct aspeed_video *video)
>>>   
>>>   static void aspeed_video_update_regs(struct aspeed_video *video)
>>>   {
>>> -	u32 comp_ctrl = VE_COMP_CTRL_RSVD |
>>> -		FIELD_PREP(VE_COMP_CTRL_DCT_LUM, video->jpeg_quality) |
>>> -		FIELD_PREP(VE_COMP_CTRL_DCT_CHR, video->jpeg_quality | 0x10);
>>> +	static const char * const compress_mode_str[] = {"DCT Only",
>>> +		"DCT VQ mix 2-color", "DCT VQ mix 4-color"};
>>> +	u32 comp_ctrl =	FIELD_PREP(VE_COMP_CTRL_DCT_LUM, video->jpeg_quality) |
>>> +		FIELD_PREP(VE_COMP_CTRL_DCT_CHR, video->jpeg_quality | 0x10) |
>>> +		FIELD_PREP(VE_COMP_CTRL_EN_HQ, video->hq_mode) |
>>> +		FIELD_PREP(VE_COMP_CTRL_HQ_DCT_LUM, video->jpeg_hq_quality) |
>>> +		FIELD_PREP(VE_COMP_CTRL_HQ_DCT_CHR, video->jpeg_hq_quality |
>>> +			   0x10);
>>>   	u32 ctrl = 0;
>>> -	u32 seq_ctrl = VE_SEQ_CTRL_JPEG_MODE;
>>> +	u32 seq_ctrl = 0;
>>>   
>>> -	v4l2_dbg(1, debug, &video->v4l2_dev, "framerate(%d)\n",
>>> -		 video->frame_rate);
>>> -	v4l2_dbg(1, debug, &video->v4l2_dev, "subsample(%s)\n",
>>> +	v4l2_dbg(1, debug, &video->v4l2_dev, "framerate(%d)\n", video->frame_rate);
>>> +	v4l2_dbg(1, debug, &video->v4l2_dev, "jpeg format(%s) subsample(%s)\n",
>>> +		 video->partial_jpeg ? "partial" : "standard",
>>>   		 video->yuv420 ? "420" : "444");
>>> -	v4l2_dbg(1, debug, &video->v4l2_dev, "compression quality(%d)\n",
>>> -		 video->jpeg_quality);
>>> +	v4l2_dbg(1, debug, &video->v4l2_dev, "compression quality(%d) hq(%s) hq_quality(%d)\n",
>>> +		 video->jpeg_quality, video->hq_mode ? "on" : "off",
>>> +		 video->jpeg_hq_quality);
>>> +	v4l2_dbg(1, debug, &video->v4l2_dev, "compression mode(%s)\n",
>>> +		 compress_mode_str[video->compression_mode]);
>>> +
>>> +	if (video->partial_jpeg)
>>> +		aspeed_video_update(video, VE_BCD_CTRL, 0, VE_BCD_CTRL_EN_BCD);
>>> +	else
>>> +		aspeed_video_update(video, VE_BCD_CTRL, VE_BCD_CTRL_EN_BCD, 0);
>>>   
>>>   	if (video->frame_rate)
>>>   		ctrl |= FIELD_PREP(VE_CTRL_FRC, video->frame_rate);
>>>   
>>> +	if (!video->partial_jpeg) {
>>> +		comp_ctrl &= ~FIELD_PREP(VE_COMP_CTRL_EN_HQ, video->hq_mode);
>>> +		seq_ctrl |= VE_SEQ_CTRL_JPEG_MODE;
>>> +	}
>>> +
>>>   	if (video->yuv420)
>>>   		seq_ctrl |= VE_SEQ_CTRL_YUV420;
>>>   
>>>   	if (video->jpeg.virt)
>>>   		aspeed_video_update_jpeg_table(video->jpeg.virt, video->yuv420);
>>>   
>>> +#ifdef CONFIG_MACH_ASPEED_G4
>>> +	switch (video->compression_mode) {
>>> +	case 0:	//DCT only
>>> +		comp_ctrl |= VE_COMP_CTRL_VQ_DCT_ONLY;
>>> +		break;
>>> +	case 1:	//DCT VQ mix 2-color
>>> +		comp_ctrl &= ~(VE_COMP_CTRL_VQ_4COLOR | VE_COMP_CTRL_VQ_DCT_ONLY);
>>> +		break;
>>> +	case 2:	//DCT VQ mix 4-color
>>> +		comp_ctrl |= VE_COMP_CTRL_VQ_4COLOR;
>>> +		break;
>>> +	}
>>> +#endif
>>> +
>>>   	/* Set control registers */
>>>   	aspeed_video_update(video, VE_SEQ_CTRL,
>>>   			    VE_SEQ_CTRL_JPEG_MODE | VE_SEQ_CTRL_YUV420,
>>>   			    seq_ctrl);
>>>   	aspeed_video_update(video, VE_CTRL, VE_CTRL_FRC, ctrl);
>>>   	aspeed_video_update(video, VE_COMP_CTRL,
>>> -			    VE_COMP_CTRL_DCT_LUM | VE_COMP_CTRL_DCT_CHR,
>>> +			    VE_COMP_CTRL_DCT_LUM | VE_COMP_CTRL_DCT_CHR |
>>> +			    VE_COMP_CTRL_EN_HQ | VE_COMP_CTRL_HQ_DCT_LUM |
>>> +			    VE_COMP_CTRL_HQ_DCT_CHR | VE_COMP_CTRL_VQ_4COLOR |
>>> +			    VE_COMP_CTRL_VQ_DCT_ONLY,
>>>   			    comp_ctrl);
>>>   }
>>>   
>>> @@ -1029,6 +1133,8 @@ static void aspeed_video_init_regs(struct aspeed_video *video)
>>>   
>>>   	/* Set mode detection defaults */
>>>   	aspeed_video_write(video, VE_MODE_DETECT, 0x22666500);
>>> +
>>> +	aspeed_video_write(video, VE_BCD_CTRL, 0);
>>>   }
>>>   
>>>   static void aspeed_video_start(struct aspeed_video *video)
>>> @@ -1062,6 +1168,9 @@ static void aspeed_video_stop(struct aspeed_video *video)
>>>   	if (video->srcs[1].size)
>>>   		aspeed_video_free_buf(video, &video->srcs[1]);
>>>   
>>> +	if (video->bcd.size)
>>> +		aspeed_video_free_buf(video, &video->bcd);
>>> +
>>>   	video->v4l2_input_status = V4L2_IN_ST_NO_SIGNAL;
>>>   	video->flags = 0;
>>>   }
>>> @@ -1364,6 +1473,28 @@ static int aspeed_video_set_ctrl(struct v4l2_ctrl *ctrl)
>>>   		if (test_bit(VIDEO_STREAMING, &video->flags))
>>>   			aspeed_video_update_regs(video);
>>>   		break;
>>> +	case V4L2_CID_ASPEED_FORMAT:
>>> +		video->partial_jpeg = ctrl->val;
>>> +		if (test_bit(VIDEO_STREAMING, &video->flags))
>>> +			aspeed_video_update_regs(video);
>>> +		break;
>>> +#ifdef CONFIG_MACH_ASPEED_G4
>>> +	case V4L2_CID_ASPEED_COMPRESSION_MODE:
>>> +		video->compression_mode = ctrl->val;
>>> +		if (test_bit(VIDEO_STREAMING, &video->flags))
>>> +			aspeed_video_update_regs(video);
>>> +		break;
>>> +#endif
>>> +	case V4L2_CID_ASPEED_HQ_MODE:
>>> +		video->hq_mode = ctrl->val;
>>> +		if (test_bit(VIDEO_STREAMING, &video->flags))
>>> +			aspeed_video_update_regs(video);
>>> +		break;
>>> +	case V4L2_CID_ASPEED_HQ_JPEG_QUALITY:
>>> +		video->jpeg_hq_quality = ctrl->val;
>>> +		if (test_bit(VIDEO_STREAMING, &video->flags))
>>> +			aspeed_video_update_regs(video);
>>> +		break;
>>>   	default:
>>>   		return -EINVAL;
>>>   	}
>>> @@ -1375,6 +1506,52 @@ static const struct v4l2_ctrl_ops aspeed_video_ctrl_ops = {
>>>   	.s_ctrl = aspeed_video_set_ctrl,
>>>   };
>>>   
>>> +static const struct v4l2_ctrl_config aspeed_ctrl_format = {
>>> +	.ops = &aspeed_video_ctrl_ops,
>>> +	.id = V4L2_CID_ASPEED_FORMAT,
>>> +	.name = "Aspeed JPEG Format",
>>> +	.type = V4L2_CTRL_TYPE_BOOLEAN,
>>> +	.min = false,
>>> +	.max = true,
>>> +	.step = 1,
>>> +	.def = false,
>>> +};
>>> +
>>> +#ifdef CONFIG_MACH_ASPEED_G4
>>> +static const struct v4l2_ctrl_config aspeed_ctrl_compression_mode = {
>>> +	.ops = &aspeed_video_ctrl_ops,
>>> +	.id = V4L2_CID_ASPEED_COMPRESSION_MODE,
>>> +	.name = "Aspeed Compression Mode",
>>> +	.type = V4L2_CTRL_TYPE_INTEGER,
>>> +	.min = 0,
>>> +	.max = 2,
>>> +	.step = 1,
>>> +	.def = 0,
>>> +};
>>> +#endif
>>> +
>>> +static const struct v4l2_ctrl_config aspeed_ctrl_HQ_mode = {
>>> +	.ops = &aspeed_video_ctrl_ops,
>>> +	.id = V4L2_CID_ASPEED_HQ_MODE,
>>> +	.name = "Aspeed HQ Mode",
>>> +	.type = V4L2_CTRL_TYPE_BOOLEAN,
>>> +	.min = false,
>>> +	.max = true,
>>> +	.step = 1,
>>> +	.def = false,
>>> +};
>>> +
>>> +static const struct v4l2_ctrl_config aspeed_ctrl_HQ_jpeg_quality = {
>>> +	.ops = &aspeed_video_ctrl_ops,
>>> +	.id = V4L2_CID_ASPEED_HQ_JPEG_QUALITY,
>>> +	.name = "Aspeed HQ Quality",
>>> +	.type = V4L2_CTRL_TYPE_INTEGER,
>>> +	.min = 0,
>>> +	.max = ASPEED_VIDEO_JPEG_NUM_QUALITIES - 1,
>>> +	.step = 1,
>>> +	.def = 0,
>>> +};
>>> +
>>>   static void aspeed_video_resolution_work(struct work_struct *work)
>>>   {
>>>   	struct delayed_work *dwork = to_delayed_work(work);
>>> @@ -1644,6 +1821,7 @@ static int aspeed_video_setup_video(struct aspeed_video *video)
>>>   	struct v4l2_device *v4l2_dev = &video->v4l2_dev;
>>>   	struct vb2_queue *vbq = &video->queue;
>>>   	struct video_device *vdev = &video->vdev;
>>> +	struct v4l2_ctrl_handler *hdl = &video->ctrl_handler;
>>>   	int rc;
>>>   
>>>   	video->pix_fmt.pixelformat = V4L2_PIX_FMT_JPEG;
>>> @@ -1658,22 +1836,28 @@ static int aspeed_video_setup_video(struct aspeed_video *video)
>>>   		return rc;
>>>   	}
>>>   
>>> -	v4l2_ctrl_handler_init(&video->ctrl_handler, 2);
>>> -	v4l2_ctrl_new_std(&video->ctrl_handler, &aspeed_video_ctrl_ops,
>>> +	v4l2_ctrl_handler_init(hdl, 6);
>>> +	v4l2_ctrl_new_std(hdl, &aspeed_video_ctrl_ops,
>>>   			  V4L2_CID_JPEG_COMPRESSION_QUALITY, 0,
>>>   			  ASPEED_VIDEO_JPEG_NUM_QUALITIES - 1, 1, 0);
>>> -	v4l2_ctrl_new_std_menu(&video->ctrl_handler, &aspeed_video_ctrl_ops,
>>> +	v4l2_ctrl_new_std_menu(hdl, &aspeed_video_ctrl_ops,
>>>   			       V4L2_CID_JPEG_CHROMA_SUBSAMPLING,
>>>   			       V4L2_JPEG_CHROMA_SUBSAMPLING_420, mask,
>>>   			       V4L2_JPEG_CHROMA_SUBSAMPLING_444);
>>> +	v4l2_ctrl_new_custom(hdl, &aspeed_ctrl_format, NULL);
>>> +#ifdef CONFIG_MACH_ASPEED_G4
>>> +	v4l2_ctrl_new_custom(hdl, &aspeed_ctrl_compression_mode, NULL);
>>> +#endif
>>> +	v4l2_ctrl_new_custom(hdl, &aspeed_ctrl_HQ_mode, NULL);
>>> +	v4l2_ctrl_new_custom(hdl, &aspeed_ctrl_HQ_jpeg_quality, NULL);
>>>   
>>> -	rc = video->ctrl_handler.error;
>>> +	rc = hdl->error;
>>>   	if (rc) {
>>>   		dev_err(video->dev, "Failed to init controls: %d\n", rc);
>>>   		goto err_ctrl_init;
>>>   	}
>>>   
>>> -	v4l2_dev->ctrl_handler = &video->ctrl_handler;
>>> +	v4l2_dev->ctrl_handler = hdl;
>>>   
>>>   	vbq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
>>>   	vbq->io_modes = VB2_MMAP | VB2_READ | VB2_DMABUF;
>>>

