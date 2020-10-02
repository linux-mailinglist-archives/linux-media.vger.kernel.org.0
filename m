Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2680D28155F
	for <lists+linux-media@lfdr.de>; Fri,  2 Oct 2020 16:37:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388030AbgJBOha (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Oct 2020 10:37:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726017AbgJBOha (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Oct 2020 10:37:30 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB039C0613D0;
        Fri,  2 Oct 2020 07:37:29 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: gtucker)
        with ESMTPSA id 2404A29DD8E
Subject: Re: media/master bisection:
 v4l2-compliance-vivid.Format-ioctls-Input-3.VIDIOC_TRY_FMT on
 qemu_arm-virt-gicv3
From:   Guillaume Tucker <guillaume.tucker@collabora.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        kernelci-results@groups.io, kernelci@groups.io
References: <5f72d499.1c69fb81.81d5b.6937@mx.google.com>
 <ebd6520a-85c3-c955-ee16-88e0c6995855@collabora.com>
Message-ID: <43e028e9-f0ea-90a9-6a64-388a6bac1c8c@collabora.com>
Date:   Fri, 2 Oct 2020 15:37:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <ebd6520a-85c3-c955-ee16-88e0c6995855@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 30/09/2020 09:05, Guillaume Tucker wrote:
> Please see the bisection report below about a regression in
> v4l2-compliance on vivid.
> 
> Reports aren't automatically sent to the public while we're
> trialing new bisection features on kernelci.org but this one
> looks valid.
> 
> 
> The full results for v4l2-compliance on vivid for
> v5.9-rc4-471-gc0c8db7bc953 show 22 individual test case
> regressions which might all be due to a single issue:
> 
>   https://kernelci.org/test/plan/id/5f728c108b008d61f4bf9db7/
> 
> For comparison, this is the results from the previous revision in
> the media tree:
> 
>   https://kernelci.org/test/plan/id/5f6b44ddea4abb1888bf9db4/
> 
> Also worth noting is that the v4l2-compliance test suite was
> updated on Friday 25th, in-between the revisions mentioned above.
> So the issue might have been present earlier but not detected.

Turns out, it needed yet another update.  The failures were all
due to the fact that the v4l2-compliance version being used on
kernelci.org was lagging by a few days behind the media/master
branch.

It's a pretty rare issue, but it would be nice to have a way to
avoid that.  On the KernelCI side of things, we should start
monitoring tests and rebuild them automatically rather than on a
fixed weekly basis.  On the kernel side of things, it would help
if the tests were updated _before_ the changes were applied to
the branch as otherwise there would still be a window for this
kind of issue to occur.

Generally speaking, what do you think would be the best way to
fit the KernelCI v4l2-compliance test cycles into the media
subsystem workflow?

Best wishes,
Guillaume


> On 29/09/2020 07:30, KernelCI bot wrote:
>> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
>> * This automated bisection report was sent to you on the basis  *
>> * that you may be involved with the breaking commit it has      *
>> * found.  No manual investigation has been done to verify it,   *
>> * and the root cause of the problem may be somewhere else.      *
>> *                                                               *
>> * If you do send a fix, please include this trailer:            *
>> *   Reported-by: "kernelci.org bot" <bot@kernelci.org>          *
>> *                                                               *
>> * Hope this helps!                                              *
>> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
>>
>> media/master bisection: v4l2-compliance-vivid.Format-ioctls-Input-3.VIDIOC_TRY_FMT on qemu_arm-virt-gicv3
>>
>> Summary:
>>   Start:      c0c8db7bc953 media: MAINTAINERS: remove Maxime Jourdan as maintainer of Amlogic VDEC
>>   Plain log:  https://storage.kernelci.org/media/master/v5.9-rc4-471-gc0c8db7bc953/arm/multi_v7_defconfig+virtualvideo/gcc-8/lab-collabora/v4l2-compliance-vivid-qemu_arm-virt-gicv3.txt
>>   HTML log:   https://storage.kernelci.org/media/master/v5.9-rc4-471-gc0c8db7bc953/arm/multi_v7_defconfig+virtualvideo/gcc-8/lab-collabora/v4l2-compliance-vivid-qemu_arm-virt-gicv3.html
>>   Result:     2f491463497a media: vivid: Add support to the CSC API
>>
>> Checks:
>>   revert:     PASS
>>   verify:     PASS
>>
>> Parameters:
>>   Tree:       media
>>   URL:        https://git.linuxtv.org/media_tree.git
>>   Branch:     master
>>   Target:     qemu_arm-virt-gicv3
>>   CPU arch:   arm
>>   Lab:        lab-collabora
>>   Compiler:   gcc-8
>>   Config:     multi_v7_defconfig+virtualvideo
>>   Test case:  v4l2-compliance-vivid.Format-ioctls-Input-3.VIDIOC_TRY_FMT
>>
>> Breaking commit found:
>>
>> -------------------------------------------------------------------------------
>> commit 2f491463497ad43bc06968a334747c6b6b20fc74
>> Author: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>> Date:   Thu Aug 27 21:46:09 2020 +0200
>>
>>     media: vivid: Add support to the CSC API
>>     
>>     The CSC API (Colorspace conversion) allows userspace to try
>>     to configure the colorspace, transfer function, Y'CbCr/HSV encoding
>>     and the quantization for capture devices. This patch adds support
>>     to the CSC API in vivid.
>>     Using the CSC API, userspace is allowed to do the following:
>>     
>>     - Set the colorspace.
>>     - Set the xfer_func.
>>     - Set the ycbcr_enc function for YUV formats.
>>     - Set the hsv_enc function for HSV formats
>>     - Set the quantization for YUV and RGB formats.
>>     
>>     Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>>     Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>>     Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>>
>> diff --git a/drivers/media/test-drivers/vivid/vivid-vid-cap.c b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
>> index e94beef008c8..eadf28ab1e39 100644
>> --- a/drivers/media/test-drivers/vivid/vivid-vid-cap.c
>> +++ b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
>> @@ -560,6 +560,7 @@ int vivid_try_fmt_vid_cap(struct file *file, void *priv,
>>  	unsigned factor = 1;
>>  	unsigned w, h;
>>  	unsigned p;
>> +	bool user_set_csc = !!(mp->flags & V4L2_PIX_FMT_FLAG_SET_CSC);
>>  
>>  	fmt = vivid_get_format(dev, mp->pixelformat);
>>  	if (!fmt) {
>> @@ -633,13 +634,30 @@ int vivid_try_fmt_vid_cap(struct file *file, void *priv,
>>  			(fmt->bit_depth[p] / fmt->vdownsampling[p])) /
>>  			(fmt->bit_depth[0] / fmt->vdownsampling[0]);
>>  
>> -	mp->colorspace = vivid_colorspace_cap(dev);
>> -	if (fmt->color_enc == TGP_COLOR_ENC_HSV)
>> -		mp->hsv_enc = vivid_hsv_enc_cap(dev);
>> -	else
>> +	if (!user_set_csc || !v4l2_is_colorspace_valid(mp->colorspace))
>> +		mp->colorspace = vivid_colorspace_cap(dev);
>> +
>> +	if (!user_set_csc || !v4l2_is_xfer_func_valid(mp->xfer_func))
>> +		mp->xfer_func = vivid_xfer_func_cap(dev);
>> +
>> +	if (fmt->color_enc == TGP_COLOR_ENC_HSV) {
>> +		if (!user_set_csc || !v4l2_is_hsv_enc_valid(mp->hsv_enc))
>> +			mp->hsv_enc = vivid_hsv_enc_cap(dev);
>> +	} else if (fmt->color_enc == TGP_COLOR_ENC_YCBCR) {
>> +		if (!user_set_csc || !v4l2_is_ycbcr_enc_valid(mp->ycbcr_enc))
>> +			mp->ycbcr_enc = vivid_ycbcr_enc_cap(dev);
>> +	} else {
>>  		mp->ycbcr_enc = vivid_ycbcr_enc_cap(dev);
>> -	mp->xfer_func = vivid_xfer_func_cap(dev);
>> -	mp->quantization = vivid_quantization_cap(dev);
>> +	}
>> +
>> +	if (fmt->color_enc == TGP_COLOR_ENC_YCBCR ||
>> +	    fmt->color_enc == TGP_COLOR_ENC_RGB) {
>> +		if (!user_set_csc || !v4l2_is_quant_valid(mp->quantization))
>> +			mp->quantization = vivid_quantization_cap(dev);
>> +	} else {
>> +		mp->quantization = vivid_quantization_cap(dev);
>> +	}
>> +
>>  	memset(mp->reserved, 0, sizeof(mp->reserved));
>>  	return 0;
>>  }
>> @@ -769,6 +787,14 @@ int vivid_s_fmt_vid_cap(struct file *file, void *priv,
>>  	if (vivid_is_sdtv_cap(dev))
>>  		dev->tv_field_cap = mp->field;
>>  	tpg_update_mv_step(&dev->tpg);
>> +	dev->tpg.colorspace = mp->colorspace;
>> +	dev->tpg.xfer_func = mp->xfer_func;
>> +	if (dev->fmt_cap->color_enc == TGP_COLOR_ENC_YCBCR)
>> +		dev->tpg.ycbcr_enc = mp->ycbcr_enc;
>> +	else
>> +		dev->tpg.hsv_enc = mp->hsv_enc;
>> +	dev->tpg.quantization = mp->quantization;
>> +
>>  	return 0;
>>  }
>>  
>> diff --git a/drivers/media/test-drivers/vivid/vivid-vid-common.c b/drivers/media/test-drivers/vivid/vivid-vid-common.c
>> index 76b0be670ebb..19701fe72030 100644
>> --- a/drivers/media/test-drivers/vivid/vivid-vid-common.c
>> +++ b/drivers/media/test-drivers/vivid/vivid-vid-common.c
>> @@ -920,6 +920,31 @@ int vivid_enum_fmt_vid(struct file *file, void  *priv,
>>  	fmt = &vivid_formats[f->index];
>>  
>>  	f->pixelformat = fmt->fourcc;
>> +
>> +	if (f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE &&
>> +	    f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
>> +		return 0;
>> +	/*
>> +	 * For capture devices, we support the CSC API.
>> +	 * We allow userspace to:
>> +	 * 1. set the colorspace
>> +	 * 2. set the xfer_func
>> +	 * 3. set the ycbcr_enc on YUV formats
>> +	 * 4. set the hsv_enc on HSV formats
>> +	 * 5. set the quantization on YUV and RGB formats
>> +	 */
>> +	f->flags |= V4L2_FMT_FLAG_CSC_COLORSPACE;
>> +	f->flags |= V4L2_FMT_FLAG_CSC_XFER_FUNC;
>> +
>> +	if (fmt->color_enc == TGP_COLOR_ENC_YCBCR) {
>> +		f->flags |= V4L2_FMT_FLAG_CSC_YCBCR_ENC;
>> +		f->flags |= V4L2_FMT_FLAG_CSC_QUANTIZATION;
>> +	} else if (fmt->color_enc == TGP_COLOR_ENC_HSV) {
>> +		f->flags |= V4L2_FMT_FLAG_CSC_HSV_ENC;
>> +	} else if (fmt->color_enc == TGP_COLOR_ENC_RGB) {
>> +		f->flags |= V4L2_FMT_FLAG_CSC_QUANTIZATION;
>> +	}
>> +
>>  	return 0;
>>  }
>>  
>> diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
>> index 150ee16ebd81..a3083529b698 100644
>> --- a/include/media/v4l2-common.h
>> +++ b/include/media/v4l2-common.h
>> @@ -539,4 +539,33 @@ static inline void v4l2_buffer_set_timestamp(struct v4l2_buffer *buf,
>>  	buf->timestamp.tv_usec = ts.tv_nsec / NSEC_PER_USEC;
>>  }
>>  
>> +static inline bool v4l2_is_colorspace_valid(__u32 colorspace)
>> +{
>> +	return colorspace > V4L2_COLORSPACE_DEFAULT &&
>> +	       colorspace <= V4L2_COLORSPACE_DCI_P3;
>> +}
>> +
>> +static inline bool v4l2_is_xfer_func_valid(__u32 xfer_func)
>> +{
>> +	return xfer_func > V4L2_XFER_FUNC_DEFAULT &&
>> +	       xfer_func <= V4L2_XFER_FUNC_SMPTE2084;
>> +}
>> +
>> +static inline bool v4l2_is_ycbcr_enc_valid(__u8 ycbcr_enc)
>> +{
>> +	return ycbcr_enc > V4L2_YCBCR_ENC_DEFAULT &&
>> +	       ycbcr_enc <= V4L2_YCBCR_ENC_SMPTE240M;
>> +}
>> +
>> +static inline bool v4l2_is_hsv_enc_valid(__u8 hsv_enc)
>> +{
>> +	return hsv_enc == V4L2_HSV_ENC_180 || hsv_enc == V4L2_HSV_ENC_256;
>> +}
>> +
>> +static inline bool v4l2_is_quant_valid(__u8 quantization)
>> +{
>> +	return quantization == V4L2_QUANTIZATION_FULL_RANGE ||
>> +	       quantization == V4L2_QUANTIZATION_LIM_RANGE;
>> +}
>> +
>>  #endif /* V4L2_COMMON_H_ */
>> -------------------------------------------------------------------------------
>>
>>
>> Git bisection log:
>>
>> -------------------------------------------------------------------------------
>> git bisect start
>> # good: [01cc2ec6ea044731e939e5e47f7e115b86f49465] media: atomisp: cleanup __printf() atributes on printk messages
>> git bisect good 01cc2ec6ea044731e939e5e47f7e115b86f49465
>> # bad: [c0c8db7bc95397f32fe60ff8b07c746a69fb22de] media: MAINTAINERS: remove Maxime Jourdan as maintainer of Amlogic VDEC
>> git bisect bad c0c8db7bc95397f32fe60ff8b07c746a69fb22de
>> # bad: [aaffa0126a111d65f4028c503c76192d4cc93277] media: rcar-vin: Fix a reference count leak.
>> git bisect bad aaffa0126a111d65f4028c503c76192d4cc93277
>> # bad: [25d8cf786d34b5167f2c01e092eeedcb0ae58628] media: staging: rkisp1: rsz: set flags to 0 in enum_mbus_code cb
>> git bisect bad 25d8cf786d34b5167f2c01e092eeedcb0ae58628
>> # good: [327296920f9dedfc6ba4ef8f5a686c9667c65f38] media: mtk-vcodec: venc: set OUTPUT buffers field to V4L2_FIELD_NONE
>> git bisect good 327296920f9dedfc6ba4ef8f5a686c9667c65f38
>> # good: [21d387b8d372f859d9e87fdcc7c3b4a432737f4d] media: mx2_emmaprp: Fix memleak in emmaprp_probe
>> git bisect good 21d387b8d372f859d9e87fdcc7c3b4a432737f4d
>> # good: [b38c73ca1c213bbf8a872b334a6bb835becfaba5] media: v4l2: add support for colorspace conversion API (CSC) for video capture
>> git bisect good b38c73ca1c213bbf8a872b334a6bb835becfaba5
>> # bad: [62aacfa9bf93f94f6949338e0c7a2ed4c4bd2c2a] media: v4l2: extend the CSC API to subdevice.
>> git bisect bad 62aacfa9bf93f94f6949338e0c7a2ed4c4bd2c2a
>> # bad: [2f491463497ad43bc06968a334747c6b6b20fc74] media: vivid: Add support to the CSC API
>> git bisect bad 2f491463497ad43bc06968a334747c6b6b20fc74
>> # first bad commit: [2f491463497ad43bc06968a334747c6b6b20fc74] media: vivid: Add support to the CSC API
>> -------------------------------------------------------------------------------
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Groups.io Links: You receive all messages sent to this group.
>> View/Reply Online (#1739): https://groups.io/g/kernelci-results/message/1739
>> Mute This Topic: https://groups.io/mt/77191137/924702
>> Group Owner: kernelci-results+owner@groups.io
>> Unsubscribe: https://groups.io/g/kernelci-results/unsub [guillaume.tucker@collabora.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
>>
> 

