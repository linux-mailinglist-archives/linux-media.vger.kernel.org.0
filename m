Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 635E4F5F08
	for <lists+linux-media@lfdr.de>; Sat,  9 Nov 2019 13:25:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726556AbfKIMZY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 Nov 2019 07:25:24 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:35239 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726296AbfKIMZY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 9 Nov 2019 07:25:24 -0500
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id TPnqiwlDfPMT8TPntiPHlH; Sat, 09 Nov 2019 13:25:21 +0100
Subject: Re: [PATCH v2 for 5.4 1/4] media: hantro: Fix s_fmt for dynamic
 resolution changes
To:     Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>
Cc:     linux-media@vger.kernel.org, kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Alexandre Courbot <acourbot@chromium.org>,
        fbuergisser@chromium.org, linux-kernel@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>
References: <20191007174505.10681-1-ezequiel@collabora.com>
 <20191007174505.10681-2-ezequiel@collabora.com>
 <20191108111950.717db5ce@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <92cba217-4f14-a397-2ae5-8797cc931703@xs4all.nl>
Date:   Sat, 9 Nov 2019 13:25:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191108111950.717db5ce@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfGROjpkO0yiW5w03/71ux9rahKrV6cbjn+rBQvdzxxKlAd7Apz3kgqlYfMSaM1X1AvSlGY3BWUgDm2hTsMIcGiExG2JBDG3xI6ZsWrc5KlTEjv23wVcv
 WF9ZdhSlkpY5k+mO+RL4XL7md1ZuC9fXMy8Q9AEKLR+XiF4X+0nffcwAmBmwEdjSmw8fTTefifJR1jG89TiUph/j5Z21Vg7Yich3xBRWbxJWlKo6rn0MN6m1
 DS66pXm5P8SorW5smWfWEJ+0irwuKDyy1iR0Rszen18TNrV89Dz8BpIpLG4YnCJjkvi/CVRXsYGlIEDvSmo8upcLL2ihShFyt7JNrYYrFWZSFmaUm1cPodnk
 JXbP3DSSNvH00fdlajLwwRckkZnSPPL6znivxV9QQmEsqctTQ86SVHcFkfk/AjQqxehRpaMIGIDe8watMNGZ1YgdS78fmAsbzhDGEx+4/dyD702MQ4NrNhGA
 lkj5WDBtppIXir0H3UWU/Jnn5Lh2ZnDZoU66cm9f1CdwpMJe+K7IrgOnBOvP37aqeZkXbIjaHAxdvQU9gkdOirstHLsYRah9VVs0O98BSIjg6qoO4pjZyasz
 H0XXiWJywHgOFKzKNgy/mWaMIc+/PxOXfOsK/xA9wITtGnTo7QUSPQJQqYDLaaSPSnY=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/8/19 11:19 AM, Boris Brezillon wrote:
> On Mon,  7 Oct 2019 14:45:02 -0300
> Ezequiel Garcia <ezequiel@collabora.com> wrote:
> 
>> Commit 953aaa1492c53 ("media: rockchip/vpu: Prepare things to support decoders")
>> changed the conditions under S_FMT was allowed for OUTPUT
>> CAPTURE buffers.
>>
>> However, and according to the mem-to-mem stateless decoder specification,
>> in order to support dynamic resolution changes, S_FMT should be allowed
>> even if OUTPUT buffers have been allocated.
>>
>> Relax decoder S_FMT restrictions on OUTPUT buffers, allowing a resolution
>> modification, provided the pixel format stays the same.
>>
>> Tested on RK3288 platforms using ChromiumOS Video Decode/Encode Accelerator Unittests.
>>
>> Fixes: 953aaa1492c53 ("media: rockchip/vpu: Prepare things to support decoders")
>> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
>> --
>> v2:
>> * Call try_fmt_out before using the format,
>>   pointed out by Philipp.
>>
>>  drivers/staging/media/hantro/hantro_v4l2.c | 28 +++++++++++++++-------
>>  1 file changed, 19 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
>> index 3dae52abb96c..586d243cc3cc 100644
>> --- a/drivers/staging/media/hantro/hantro_v4l2.c
>> +++ b/drivers/staging/media/hantro/hantro_v4l2.c
>> @@ -367,19 +367,26 @@ vidioc_s_fmt_out_mplane(struct file *file, void *priv, struct v4l2_format *f)
>>  {
>>  	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
>>  	struct hantro_ctx *ctx = fh_to_ctx(priv);
>> +	struct vb2_queue *vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
>>  	const struct hantro_fmt *formats;
>>  	unsigned int num_fmts;
>> -	struct vb2_queue *vq;
>>  	int ret;
>>  
>> -	/* Change not allowed if queue is busy. */
>> -	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
>> -	if (vb2_is_busy(vq))
>> -		return -EBUSY;
>> +	ret = vidioc_try_fmt_out_mplane(file, priv, f);
>> +	if (ret)
>> +		return ret;
>>  
>>  	if (!hantro_is_encoder_ctx(ctx)) {
>>  		struct vb2_queue *peer_vq;
>>  
>> +		/*
>> +		 * In other to support dynamic resolution change,
> 
> 		      ^ order
> 
>> +		 * the decoder admits a resolution change, as long
>> +		 * as the pixelformat remains. Can't be done if streaming.
>> +		 */
>> +		if (vb2_is_streaming(vq) || (vb2_is_busy(vq) &&
>> +		    pix_mp->pixelformat != ctx->src_fmt.pixelformat))
>> +			return -EBUSY;
> 
> Sorry to chime in only now, but I'm currently looking at the VP9 spec
> and it seems the resolution is allowed to change dynamically [1] (I
> guess the same applies to VP8). IIU the spec correctly, coded frames
> using the new resolution can reference decoded frames using the old
> one (can be higher or lower res BTW). If we force a streamoff to change
> the resolution (as seems to be the case here), we'll lose those ref
> frames (see the hantro_return_bufs() in stop streaming), right?
> Hans, Tomasz, any idea how this dynamic resolution change could/should
> be supported?

As Tomasz also mentioned, supporting this is much more work, and probably
requires new streaming ioctls.

In the meantime I think this patch is fine (with the typo fixed, I can do
that), so is it OK if I merge this?

Regards,

	Hans

> 
>>  		/*
>>  		 * Since format change on the OUTPUT queue will reset
>>  		 * the CAPTURE queue, we can't allow doing so
>> @@ -389,12 +396,15 @@ vidioc_s_fmt_out_mplane(struct file *file, void *priv, struct v4l2_format *f)
>>  					  V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
>>  		if (vb2_is_busy(peer_vq))
>>  			return -EBUSY;
>> +	} else {
>> +		/*
>> +		 * The encoder doesn't admit a format change if
>> +		 * there are OUTPUT buffers allocated.
>> +		 */
>> +		if (vb2_is_busy(vq))
>> +			return -EBUSY;
>>  	}
>>  
>> -	ret = vidioc_try_fmt_out_mplane(file, priv, f);
>> -	if (ret)
>> -		return ret;
>> -
>>  	formats = hantro_get_formats(ctx, &num_fmts);
>>  	ctx->vpu_src_fmt = hantro_find_format(formats, num_fmts,
>>  					      pix_mp->pixelformat);
> 
> [1] Section "5.16 Reference frame scaling" of
>     https://storage.googleapis.com/downloads.webmproject.org/docs/vp9/vp9-bitstream-specification-v0.6-20160331-draft.pdf
> 

