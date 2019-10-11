Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B712ED3E44
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2019 13:22:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728064AbfJKLV7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Oct 2019 07:21:59 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:48151 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727538AbfJKLV6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Oct 2019 07:21:58 -0400
Received: from [IPv6:2001:983:e9a7:1:6018:e727:22dc:6820] ([IPv6:2001:983:e9a7:1:6018:e727:22dc:6820])
        by smtp-cloud8.xs4all.net with ESMTPA
        id IszOiyLA6op0AIszPiWvIt; Fri, 11 Oct 2019 13:21:54 +0200
Subject: Re: [RESEND PATCH v2 3/4] media: rockchip: Add the rkvdec driver
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>
References: <20191011093342.3471-1-boris.brezillon@collabora.com>
 <20191011093342.3471-4-boris.brezillon@collabora.com>
 <8d3abbd9-f27d-f17f-8298-b0cc7c63ab3e@xs4all.nl>
 <20191011131540.002a61a9@dhcp-172-31-174-146.wireless.concordia.ca>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <d689990c-e5c0-5914-fc3d-37d623b68812@xs4all.nl>
Date:   Fri, 11 Oct 2019 13:21:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191011131540.002a61a9@dhcp-172-31-174-146.wireless.concordia.ca>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfP7+hvs/3tMkJGrIc1psAO0ZB85slItKzwqwtqg2nfTJdzHIFuT15jYCIDTVCzkw7aUQi4yXGlODP7YWYUGdbhmMzo4sOpUiwkzYUgNR5Dc2pdx/nAdZ
 dIG30C2tX/W22PGxGB/VrjYouOZViW0tksiCgnQR1pR+meSjmKu27mlswSUPy+tDatKbjoxbKG+OsHddBr0J+lyPStGxu+OfLfMnZYsJsRHXrhFjqjPuWupp
 f9RNRkpA2nuKVQ9kNZ3bUP1OagLEtWu3sZZ8Fy2kJz10hTkI5rqFuYMZI01asRdABx5IJ2/ammt8aDf/LowI6cu8dOmdA6ZAn8hjc/DiWBbIk2CMDegaJgw8
 9zH0B/a87oAAp/IrKXyWjDr8ddWKXNeUACM8uL79ADoGCQWfApuInIuiZevB81MN3CPsqpztYhTW/+0A2pTZwEVEFzi8uysVS0sI1rRYdekPu6aOcuqiySZn
 loAqaYvT+GvEcN8oMuoSzjeyBNx8rCJ5Pi6afvDNDfbFUy75y6gZk53aaLJt5ypUEojhscTWUwvbPD4R96/XjtaeB2Pga9FVpLTIS+cpC0UhBk4CSgEZbO6T
 sglrG51xjIlb+K9UkqI+D3vC0T2ecKcUlIaQ0NVwFWPnfkrOFlftizvArHVf12Q1g+naY29Q5mQ5ysVttuyM9PuknF4pd1eYKtpjK5EvxH1C6uJYtv3OCyDJ
 CO4xVsqPt6UT7vD78KHzwkr6/xGh1slTHvp4SwHs0sU3U9N4z066rorjifkkw5kaf9rey9o6rH4sVdH1o8enzefXt4EMduiJyrI/32oqq3h3LIBmKTkWX4J0
 cCmou/nnI8Wju6YUa6E=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/11/19 1:15 PM, Boris Brezillon wrote:
> Hi Hans,
> 
> On Fri, 11 Oct 2019 12:06:35 +0200
> Hans Verkuil <hverkuil@xs4all.nl> wrote:
> 
>>> diff --git a/drivers/staging/media/rockchip/Kconfig b/drivers/staging/media/rockchip/Kconfig
>>> new file mode 100644
>>> index 000000000000..8c617ae2c84f
>>> --- /dev/null
>>> +++ b/drivers/staging/media/rockchip/Kconfig
>>> @@ -0,0 +1,16 @@
>>> +# SPDX-License-Identifier: GPL-2.0
>>> +config VIDEO_ROCKCHIP
>>> +	bool "Rockchip Video Devices"
>>> +	depends on ARCH_ROCKCHIP || COMPILE_TEST
>>> +	help
>>> +	  If you have a Rockchip SoC based embedding a video codec.
>>> +
>>> +	  Note that this option doesn't include new drivers in the
>>> +	  kernel: saying N will just cause Kconfig to skip all the
>>> +	  questions about Allwinner media devices.
>>> +
>>> +if VIDEO_ROCKCHIP
>>> +
>>> +source "drivers/staging/media/rockchip/vdec/Kconfig"
>>> +
>>> +endif  
>>
>> Is this really necessary? I think the 'source' line can just be added to
>> drivers/staging/media/Kconfig. This config option here is rather vague.
> 
> I based it on the Allwinner/Cedrus model (even left an 'Allwinner' in
> the description :)), but I can definitely move the source line in
> drivers/staging/media/Kconfig or even get rid of the rockchip dir if
> you prefer.
> 
>>
>>> diff --git a/drivers/staging/media/rockchip/Makefile b/drivers/staging/media/rockchip/Makefile
>>> new file mode 100644
>>> index 000000000000..b3705b51f1b9
>>> --- /dev/null
>>> +++ b/drivers/staging/media/rockchip/Makefile
>>> @@ -0,0 +1,2 @@
>>> +# SPDX-License-Identifier: GPL-2.0
>>> +obj-$(CONFIG_VIDEO_ROCKCHIP_VDEC) += vdec/
>>> diff --git a/drivers/staging/media/rockchip/vdec/Kconfig b/drivers/staging/media/rockchip/vdec/Kconfig
>>> new file mode 100644
>>> index 000000000000..329b4a813c47
>>> --- /dev/null
>>> +++ b/drivers/staging/media/rockchip/vdec/Kconfig
>>> @@ -0,0 +1,14 @@
>>> +# SPDX-License-Identifier: GPL-2.0
>>> +config VIDEO_ROCKCHIP_VDEC
>>> +	tristate "Rockchip Video Decoder driver"
>>> +	depends on ARCH_ROCKCHIP || COMPILE_TEST
>>> +	depends on VIDEO_DEV && VIDEO_V4L2 && MEDIA_CONTROLLER
>>> +	depends on MEDIA_CONTROLLER_REQUEST_API
>>> +	select VIDEOBUF2_DMA_CONTIG
>>> +	select VIDEOBUF2_VMALLOC
>>> +	select V4L2_MEM2MEM_DEV
>>> +	help
>>> +	  Support for the Rockchip Video Decoder IP present on Rockchip SoC,
>>> +	  which accelerates video decoding.
>>> +	  To compile this driver as a module, choose M here: the module
>>> +	  will be called hantro-vpu.  
>>
>> hantro-vpu? Not rkvdec?
> 
> Should be rkvdec, indeed. That's what happens when you copy things from
> an existing driver :-).
> 
> 
>>> +
>>> +/* Constant CABAC table. */
>>> +static const u32 rkvdec_h264_cabac_table[] = {  
>>
>> Where does this table come from? It needs some provenance.
> 
> Chromeos kernels [1] and MPP code base [2]. I'll add a comment pointing
> to those trees.
> 
> [...]
> 
>>> +
>>> +struct rkvdec_h264_reflist_builder {
>>> +	const struct v4l2_h264_dpb_entry *dpb;
>>> +	s32 pocs[RKVDEC_H264_DPB_SIZE];
>>> +	u8 unordered_reflist[RKVDEC_H264_DPB_SIZE];
>>> +	int frame_nums[RKVDEC_H264_DPB_SIZE];
>>> +	s32 curpoc;
>>> +	u8 num_valid;
>>> +};  
>>
>> What's a 'poc'? Perhaps this can use some comments.
> 
> Picture Order Count. I'll add comment.
> 
>>
>> It looks like code is copied from hantro_h264.c. Is there anything that
>> can be reasonably shared between the two drivers?
> 
> I was planning on exporting those helpers at some point, but I'd like
> the reflist creation logic to settle before doing (we still need to fix
> things for interlaced streams, which is what Jonas is working on).
> 
> 
> 
>>> +
>>> +static int p_ref_list_cmp(const void *ptra, const void *ptrb, const void *data)
>>> +{
>>> +	const struct rkvdec_h264_reflist_builder *builder = data;
>>> +	const struct v4l2_h264_dpb_entry *a, *b;
>>> +	u8 idxa, idxb;
>>> +
>>> +	idxa = *((u8 *)ptra);
>>> +	idxb = *((u8 *)ptrb);
>>> +	a = &builder->dpb[idxa];
>>> +	b = &builder->dpb[idxb];
>>> +
>>> +	if ((a->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM) !=
>>> +	    (b->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)) {
>>> +		/* Short term pics firt. */  
>>
>> firt -> first
> 
> Will fix the typo.
> 
>>
>>> +		if (!(a->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM))
>>> +			return -1;
>>> +		else
>>> +			return 1;
>>> +	}
>>> +
>>> +	/*
>>> +	 * Short term pics in descending pic num order, long term ones in
>>> +	 * ascending order.
>>> +	 */
>>> +	if (!(a->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)) {
>>> +		int frame_num_a, frame_num_b;
>>> +
>>> +		frame_num_a = builder->frame_nums[idxa];
>>> +		frame_num_b = builder->frame_nums[idxb];
>>> +		return frame_num_b > frame_num_a ? 1 : -1;
>>> +	}
>>> +
>>> +	return a->pic_num > b->pic_num ? 1 : -1;
>>> +}
>>> +
>>> +static int b0_ref_list_cmp(const void *ptra, const void *ptrb, const void *data)
>>> +{
>>> +	const struct rkvdec_h264_reflist_builder *builder = data;
>>> +	const struct v4l2_h264_dpb_entry *a, *b;
>>> +	s32 poca, pocb;
>>> +	u8 idxa, idxb;
>>> +
>>> +	idxa = *((u8 *)ptra);
>>> +	idxb = *((u8 *)ptrb);
>>> +	a = &builder->dpb[idxa];
>>> +	b = &builder->dpb[idxb];
>>> +
>>> +	if ((a->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM) !=
>>> +	    (b->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)) {
>>> +		/* Short term pics firt. */  
>>
>> Ditto. Check the code for this typo. It's in the hantro code as well.
> 
> Will do.
> 
>>
>>> +		if (!(a->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM))
>>> +			return -1;
>>> +		else
>>> +			return 1;
>>> +	}
>>> +
>>> +	/* Long term pics in ascending pic num order. */
>>> +	if (a->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)
>>> +		return a->pic_num > b->pic_num ? 1 : -1;
>>> +
>>> +	poca = builder->pocs[idxa];
>>> +	pocb = builder->pocs[idxb];
>>> +
>>> +	/*
>>> +	 * Short term pics with POC < cur POC first in POC descending order
>>> +	 * followed by short term pics with POC > cur POC in POC ascending
>>> +	 * order.
>>> +	 */
>>> +	if ((poca < builder->curpoc) != (pocb < builder->curpoc))
>>> +		return poca > pocb ? 1 : -1;
>>> +	else if (poca < builder->curpoc)
>>> +		return pocb > poca ? 1 : -1;
>>> +
>>> +	return poca > pocb ? 1 : -1;
>>> +}
> 
>>> +static void rkvdec_reset_fmt(struct rkvdec_ctx *ctx, struct v4l2_format *f,
>>> +			     u32 fourcc)
>>> +{
>>> +	memset(f, 0, sizeof(*f));
>>> +	f->fmt.pix_mp.pixelformat = fourcc;
>>> +	f->fmt.pix_mp.field = V4L2_FIELD_NONE;
>>> +	f->fmt.pix_mp.colorspace = V4L2_COLORSPACE_JPEG,  
>>
>> Don't use this colorspace. I see it is also used in the hantro driver, that should
>> be corrected as well.
>>
>> The colorimetry comes from the stream metadata, and for a stateless driver I
>> assume that it is userspace that parses that.
>>
>> V4L2_COLORSPACE_JPEG should only be used by (M)JPEG codecs. And even there is it
>> dubious. See section 2.17.10 in the spec for more info.
> 
> What should I use when the formats are reset then?

Depends on the resolution: SDTV should use V4L2_COLORSPACE_SMPTE170M, others REC709.

If you don't know the resolution here, then stick to REC709.

Regards,

	Hans

> 
> Thanks for the prompt review!
> 
> Boris
> 
> [1]https://chromium.googlesource.com/chromiumos/third_party/kernel/+/refs/heads/chromeos-4.4/drivers/media/platform/rockchip-vpu/rk3399_vdec_hw_h264d.c#45
> [2]https://github.com/rockchip-linux/mpp/blob/release/mpp/hal/rkdec/h264d/hal_h264d_rkv_reg.c#L67
> 

