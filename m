Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E80944774F5
	for <lists+linux-media@lfdr.de>; Thu, 16 Dec 2021 15:50:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237334AbhLPOuu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Dec 2021 09:50:50 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:45204 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230071AbhLPOuu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Dec 2021 09:50:50 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id CB8AD1F46440
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1639666249; bh=YeeNoZFhcYbCE0AGssU+fq/L+kEmkwTRFKEz/9FyRZA=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=KKQlNaQ6co+xlRcWVqImbk46OxGQ0NAHwiEMfeXOJe69XkMzUjxlQ6bxRaf96SarU
         +15rl5YhTi7g1rTS9p3svt3DtiqkPSbqOaT4Iek2eq6e7fT988tgddESn376fhsjLq
         ITUHVeu+Cz+WxnAHQEL76RibcUjfBaPfc26+HeRo94hWNCxTrfL4HLxMINhaIq/J2t
         w6yQLaOOUCPIlIddm2z8ZMvXQrOi1Ro6PBmgze9lY1xieE/gj828pK38Ab+ffKGmh0
         UFPDoh/hHDQDd4TxK3e6V4PRRPVFZb4W7LfxM0NZ60GYNoaBgLkO7iB9T0UNME+1qL
         otwB0yCpXA3KA==
Subject: Re: [RFC PATCH] Implement a POC for V4L2 stateless uAPI versioning
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        daniel.almeida@collabora.com
Cc:     hverkuil@xs4all.nl, linux-media@vger.kernel.org
References: <20211202151629.581818-1-daniel.almeida@collabora.com>
 <YakHVW6V4of78I/s@eze-laptop>
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Message-ID: <6270531b-7086-b690-43f4-b9070547aae8@collabora.com>
Date:   Thu, 16 Dec 2021 15:50:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YakHVW6V4of78I/s@eze-laptop>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All,

W dniu 02.12.2021 o 18:50, Ezequiel Garcia pisze:
> Hi everyone,
> 
> On Thu, Dec 02, 2021 at 12:16:29PM -0300, daniel.almeida@collabora.com wrote:
>> From: Daniel Almeida <daniel.almeida@collabora.com>
>>
>> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
>> Suggested-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
>> ---
>> Hi all.
>>
>> This is a proposal to enable versioning of the stateless uAPIs so as to allow multiple versions to coexist in the kernel. It was initially suggested by Ezequiel Garcia.
>>
>> The problem:
>>
>> Without any form of versioning in place, utmost care must be taken before merging uAPI code, since it is considered final and "set in stone". This naturally slows down progress of uAPI development as we expect each codec uAPI to be more or less perfect before merging it. Arguably, this is an unrealistic expectation and VP9, for instance, had to be substantially reworked as of the introduction of V4L2_STATELESS_CID_COMPRESSED_HDR.
>>
>> The proposed solution:
>>
>> This patch attempts to address the problem by introducing a menu control to query/get/set API version. Once the API version is set, the core/driver will use the set of corresponding structs. You can see how this looks like with one of the simplest codecs we support, i.e. MPEG2.
>>
>> A driver can specify what versions of the uAPI it can work with by means of its try_ctrl() hook if the standard min/max validation for menu controls is not enough. It is then shown how this can work with Hantro G1, but note that V2 is simply a copy of V1 in this example.
>>
>> I have also worked on an tentative userspace implementation using gstreamer[0]. A user can then select which version of the uAPI she wants to use by means of a property, which case the application will try to validate the chosen version first.
>>
>> There are four outcomes possible when negotiating the version to be used:
>>
>> a) If the VIDIOC_G_EXT_CTRLS ioctl for the version menu control fails, we assume that the driver does not support versioning and we default to v1.
>> b) If the VIDIOC_G_EXT_CTRLS ioctl for the version menu control succeeds, we store the default value as reported by the driver.
>> c) We attempt to set the version the user passed in, if that does not match the default, and if that fails,
>> d) We check if we support the default as returned by the driver, and if not, we error out.
>>
>> Pros:
>>
>> This approach can be used on top of the existing controls, i.e. it can be used to extend drivers and still support old kernels backwards. If the control V4L2_CID_STATELESS_{}_VERSION is not present on a given driver, applications can safely assume the first API version is the only supported. The version suffix (i.e. _v1) on structs is not needed as it is assumed that no suffix effectively means v1.
>>
>> uAPI development can be streamlined as developers will know these can further be extended in the future if some hardware is incompatible with the current versions.
>>
>> Design mistakes will not be catastrophic, instead they can be elegantly solved in a newer version.
>>
>> Version negotiation is easy from a userspace perspective, applications can indicate a preference for the version number.
>>
>> Drops the use of "reserved" for future APIs.
>>
>> If the number of versions is kept to a minimum (i.e. v2, v3, at most v4) then it is very tractable.
>>
>> Cons:
>>
>> Applications will need to support different versions as they come out. The version applies to the entire API, not control-wise. In a sense, under this design, some repetition is the price to pay for tidiness. This approach is less-ambiguous and therefore less error-prone.

I assume that by "the entire API" you mean for example "the entire H.264 API"
or "the entire VP9 API" rather than "the entire V4L2 API"? What is the benefit
of, say, "per-codec" API versioning vs "per-control" API versioning?

>>
>> Closing thoughts:
>>
>> This is only a draft, but I hope this design is enough to kickstart some discussion around this topic.
>>
>>
> 
> In addition to Daniel's excellent introduction, I'd like to point out that as
> direct consequences of this versioning mechanism we would be able to
> mark HEVC as stable (perhaps after addressing known issues) and
> therefore move Hantro and Cedrus out of staging.
> 
> Other codecs, such as AV1, would also have a path to land as stable
> controls, allowing us to offer a solution to vendors with much more
> reasonable timelines.
> 
> So even if we don't go with this exact approach, an approach that meets
> this same goals, would have a huge impact.

I'd definitely want something like this.

Regards,

Andrzej

> 
>> [0]: https://gitlab.freedesktop.org/dwlsalmeida/gstreamer/-/merge_requests/1/commits
>> ---
>>   drivers/media/v4l2-core/v4l2-ctrls-core.c     | 67 +++++++++++++++++++
>>   drivers/media/v4l2-core/v4l2-ctrls-defs.c     | 21 ++++++
>>   drivers/staging/media/hantro/hantro_drv.c     | 28 ++++++++
>>   .../media/hantro/hantro_g1_mpeg2_dec.c        | 47 +++++++++++--
>>   include/media/v4l2-ctrls.h                    |  3 +
>>   include/uapi/linux/v4l2-controls.h            | 38 +++++++++++
>>   include/uapi/linux/videodev2.h                |  7 ++
> 
> If there's some consensus on the proposal, we'd need to incorporate
> the versioning into the Stateless Decoder specification, and make
> sure there are enough documentation for driver authors and application
> developers.
> 
> Thanks!
> Ezequiel
> 
>>   7 files changed, 207 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
>> index 54abe5245dcc..a821ed4d458d 100644
>> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
>> @@ -283,6 +283,15 @@ static void std_log(const struct v4l2_ctrl *ctrl)
>>   	case V4L2_CTRL_TYPE_MPEG2_PICTURE:
>>   		pr_cont("MPEG2_PICTURE");
>>   		break;
>> +	case V4L2_CTRL_TYPE_MPEG2_QUANTISATION_V2:
>> +		pr_cont("MPEG2_QUANTISATION_V2");
>> +		break;
>> +	case V4L2_CTRL_TYPE_MPEG2_SEQUENCE_V2:
>> +		pr_cont("MPEG2_SEQUENCE_V2");
>> +		break;
>> +	case V4L2_CTRL_TYPE_MPEG2_PICTURE_V2:
>> +		pr_cont("MPEG2_PICTURE_V2");
>> +		break;
>>   	case V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR:
>>   		pr_cont("VP9_COMPRESSED_HDR");
>>   		break;
>> @@ -559,6 +568,55 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>>   
>>   	case V4L2_CTRL_TYPE_MPEG2_QUANTISATION:
>>   		break;
>> +	case V4L2_CTRL_TYPE_MPEG2_SEQUENCE_V2:
>> +		p_mpeg2_sequence = p;
>> +
>> +		switch (p_mpeg2_sequence->chroma_format) {
>> +		case 1: /* 4:2:0 */
>> +		case 2: /* 4:2:2 */
>> +		case 3: /* 4:4:4 */
>> +			break;
>> +		default:
>> +			return -EINVAL;
>> +		}
>> +		break;
>> +
>> +	case V4L2_CTRL_TYPE_MPEG2_PICTURE_V2:
>> +		p_mpeg2_picture = p;
>> +
>> +		switch (p_mpeg2_picture->intra_dc_precision) {
>> +		case 0: /* 8 bits */
>> +		case 1: /* 9 bits */
>> +		case 2: /* 10 bits */
>> +		case 3: /* 11 bits */
>> +			break;
>> +		default:
>> +			return -EINVAL;
>> +		}
>> +
>> +		switch (p_mpeg2_picture->picture_structure) {
>> +		case V4L2_MPEG2_PIC_TOP_FIELD:
>> +		case V4L2_MPEG2_PIC_BOTTOM_FIELD:
>> +		case V4L2_MPEG2_PIC_FRAME:
>> +			break;
>> +		default:
>> +			return -EINVAL;
>> +		}
>> +
>> +		switch (p_mpeg2_picture->picture_coding_type) {
>> +		case V4L2_MPEG2_PIC_CODING_TYPE_I:
>> +		case V4L2_MPEG2_PIC_CODING_TYPE_P:
>> +		case V4L2_MPEG2_PIC_CODING_TYPE_B:
>> +			break;
>> +		default:
>> +			return -EINVAL;
>> +		}
>> +		zero_reserved(*p_mpeg2_picture);
>> +		break;
>> +
>> +	case V4L2_CTRL_TYPE_MPEG2_QUANTISATION_V2:
>> +		break;
>> +
>>   
>>   	case V4L2_CTRL_TYPE_FWHT_PARAMS:
>>   		p_fwht_params = p;
>> @@ -1384,6 +1442,15 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
>>   	case V4L2_CTRL_TYPE_MPEG2_QUANTISATION:
>>   		elem_size = sizeof(struct v4l2_ctrl_mpeg2_quantisation);
>>   		break;
>> +	case V4L2_CTRL_TYPE_MPEG2_SEQUENCE_V2:
>> +		elem_size = sizeof(struct v4l2_ctrl_mpeg2_sequence_v2);
>> +		break;
>> +	case V4L2_CTRL_TYPE_MPEG2_PICTURE_V2:
>> +		elem_size = sizeof(struct v4l2_ctrl_mpeg2_picture_v2);
>> +		break;
>> +	case V4L2_CTRL_TYPE_MPEG2_QUANTISATION_V2:
>> +		elem_size = sizeof(struct v4l2_ctrl_mpeg2_quantisation_v2);
>> +		break;
>>   	case V4L2_CTRL_TYPE_FWHT_PARAMS:
>>   		elem_size = sizeof(struct v4l2_ctrl_fwht_params);
>>   		break;
>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>> index 54ca4e6b820b..b487f0c3fa3f 100644
>> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>> @@ -573,6 +573,11 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
>>   		NULL,
>>   	};
>>   
>> +	static const char * const mpeg2_stateless_uapi_version[] = {
>> +		"V1",
>> +		"V2",
>> +	};
>> +
>>   	switch (id) {
>>   	case V4L2_CID_MPEG_AUDIO_SAMPLING_FREQ:
>>   		return mpeg_audio_sampling_freq;
>> @@ -705,6 +710,8 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
>>   		return hevc_start_code;
>>   	case V4L2_CID_CAMERA_ORIENTATION:
>>   		return camera_orientation;
>> +	case V4L2_CID_STATELESS_MPEG2_UAPI_VERSION:
>> +		return mpeg2_stateless_uapi_version;
>>   	default:
>>   		return NULL;
>>   	}
>> @@ -1178,6 +1185,10 @@ const char *v4l2_ctrl_get_name(u32 id)
>>   	case V4L2_CID_STATELESS_MPEG2_SEQUENCE:			return "MPEG-2 Sequence Header";
>>   	case V4L2_CID_STATELESS_MPEG2_PICTURE:			return "MPEG-2 Picture Header";
>>   	case V4L2_CID_STATELESS_MPEG2_QUANTISATION:		return "MPEG-2 Quantisation Matrices";
>> +	case V4L2_CID_STATELESS_MPEG2_SEQUENCE_V2:		return "MPEG-2 Sequence Header V2";
>> +	case V4L2_CID_STATELESS_MPEG2_PICTURE_V2:		return "MPEG-2 Picture Header V2";
>> +	case V4L2_CID_STATELESS_MPEG2_QUANTISATION_V2:		return "MPEG-2 Quantisation Matrices V2";
>> +	case V4L2_CID_STATELESS_MPEG2_UAPI_VERSION:		return "MPEG-2 uAPI Version";
>>   	case V4L2_CID_STATELESS_VP9_COMPRESSED_HDR:	return "VP9 Probabilities Updates";
>>   	case V4L2_CID_STATELESS_VP9_FRAME:			return "VP9 Frame Decode Parameters";
>>   
>> @@ -1360,6 +1371,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>>   	case V4L2_CID_STATELESS_H264_DECODE_MODE:
>>   	case V4L2_CID_STATELESS_H264_START_CODE:
>>   	case V4L2_CID_CAMERA_ORIENTATION:
>> +	case V4L2_CID_STATELESS_MPEG2_UAPI_VERSION:
>>   		*type = V4L2_CTRL_TYPE_MENU;
>>   		break;
>>   	case V4L2_CID_LINK_FREQ:
>> @@ -1469,6 +1481,15 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>>   	case V4L2_CID_STATELESS_MPEG2_QUANTISATION:
>>   		*type = V4L2_CTRL_TYPE_MPEG2_QUANTISATION;
>>   		break;
>> +	case V4L2_CID_STATELESS_MPEG2_SEQUENCE_V2:
>> +		*type = V4L2_CTRL_TYPE_MPEG2_SEQUENCE_V2;
>> +		break;
>> +	case V4L2_CID_STATELESS_MPEG2_PICTURE_V2:
>> +		*type = V4L2_CTRL_TYPE_MPEG2_PICTURE_V2;
>> +		break;
>> +	case V4L2_CID_STATELESS_MPEG2_QUANTISATION_V2:
>> +		*type = V4L2_CTRL_TYPE_MPEG2_QUANTISATION_V2;
>> +		break;
>>   	case V4L2_CID_STATELESS_FWHT_PARAMS:
>>   		*type = V4L2_CTRL_TYPE_FWHT_PARAMS;
>>   		break;
>> diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
>> index ab2467998d29..036810db1d67 100644
>> --- a/drivers/staging/media/hantro/hantro_drv.c
>> +++ b/drivers/staging/media/hantro/hantro_drv.c
>> @@ -269,6 +269,11 @@ static int hantro_try_ctrl(struct v4l2_ctrl *ctrl)
>>   		/* We only support profile 0 */
>>   		if (dec_params->profile != 0)
>>   			return -EINVAL;
>> +	} else if (ctrl->id == V4L2_CID_STATELESS_MPEG2_UAPI_VERSION) {
>> +		/*
>> +		 * optionally restrict the uAPI version that this driver supports if
>> +		 * the standard min/max validation for menu controls is not enough
>> +		 */
>>   	}
>>   	return 0;
>>   }
>> @@ -336,6 +341,14 @@ static const struct hantro_ctrl controls[] = {
>>   			.def = 50,
>>   			.ops = &hantro_jpeg_ctrl_ops,
>>   		},
>> +	}, {
>> +		.codec = HANTRO_MPEG2_DECODER,
>> +		.cfg = {
>> +			.id = V4L2_CID_STATELESS_MPEG2_UAPI_VERSION,
>> +			.def = V4L2_STATELESS_MPEG2_UAPI_V1,
>> +			.min = V4L2_STATELESS_MPEG2_UAPI_V1,
>> +			.max = V4L2_STATELESS_MPEG2_UAPI_V2,
>> +		},
>>   	}, {
>>   		.codec = HANTRO_MPEG2_DECODER,
>>   		.cfg = {
>> @@ -351,6 +364,21 @@ static const struct hantro_ctrl controls[] = {
>>   		.cfg = {
>>   			.id = V4L2_CID_STATELESS_MPEG2_QUANTISATION,
>>   		},
>> +	}, {
>> +		.codec = HANTRO_MPEG2_DECODER,
>> +		.cfg = {
>> +			.id = V4L2_CID_STATELESS_MPEG2_SEQUENCE_V2,
>> +		},
>> +	}, {
>> +		.codec = HANTRO_MPEG2_DECODER,
>> +		.cfg = {
>> +			.id = V4L2_CID_STATELESS_MPEG2_PICTURE_V2,
>> +		},
>> +	}, {
>> +		.codec = HANTRO_MPEG2_DECODER,
>> +		.cfg = {
>> +			.id = V4L2_CID_STATELESS_MPEG2_QUANTISATION_V2,
>> +		},
>>   	}, {
>>   		.codec = HANTRO_VP8_DECODER,
>>   		.cfg = {
>> diff --git a/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c b/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
>> index 9aea331e1a3c..7c209efa0b8e 100644
>> --- a/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
>> +++ b/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
>> @@ -145,7 +145,7 @@ hantro_g1_mpeg2_dec_set_buffers(struct hantro_dev *vpu, struct hantro_ctx *ctx,
>>   	vdpu_write_relaxed(vpu, backward_addr, G1_REG_REFER3_BASE);
>>   }
>>   
>> -int hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx)
>> +static void hantro_g1_mpeg2_dec_run_v1(struct hantro_ctx *ctx)
>>   {
>>   	struct hantro_dev *vpu = ctx->dev;
>>   	struct vb2_v4l2_buffer *src_buf, *dst_buf;
>> @@ -156,9 +156,6 @@ int hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx)
>>   	src_buf = hantro_get_src_buf(ctx);
>>   	dst_buf = hantro_get_dst_buf(ctx);
>>   
>> -	/* Apply request controls if any */
>> -	hantro_start_prepare_run(ctx);
>> -
>>   	seq = hantro_get_ctrl(ctx,
>>   			      V4L2_CID_STATELESS_MPEG2_SEQUENCE);
>>   	pic = hantro_get_ctrl(ctx,
>> @@ -231,6 +228,48 @@ int hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx)
>>   	hantro_g1_mpeg2_dec_set_buffers(vpu, ctx, &src_buf->vb2_buf,
>>   					&dst_buf->vb2_buf,
>>   					seq, pic);
>> +}
>> +
>> +static void hantro_g1_mpeg2_dec_run_v2(struct hantro_ctx *ctx)
>> +{
>> +	const struct v4l2_ctrl_mpeg2_sequence_v2 *seq;
>> +	const struct v4l2_ctrl_mpeg2_picture_v2 *pic;
>> +	const struct v4l2_ctrl_mpeg2_quantisation_v2 *quant;
>> +
>> +	seq = hantro_get_ctrl(ctx,
>> +			      V4L2_CID_STATELESS_MPEG2_SEQUENCE_V2);
>> +	pic = hantro_get_ctrl(ctx,
>> +			      V4L2_CID_STATELESS_MPEG2_PICTURE_V2);
>> +	quant = hantro_get_ctrl(ctx,
>> +				V4L2_CID_STATELESS_MPEG2_QUANTISATION_V2);
>> +
>> +	WARN_ON_ONCE(!seq || !pic || !quant);
>> +
>> +	/* actually implement v2 ... */
>> +
>> +	/* pretend this happened so as to keep userspace going */
>> +	hantro_irq_done(ctx->dev, VB2_BUF_STATE_DONE);
>> +}
>> +
>> +int hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx)
>> +{
>> +	struct hantro_dev *vpu = ctx->dev;
>> +	enum v4l2_stateless_mpeg2_uapi_version version;
>> +
>> +	/* Apply request controls if any */
>> +	hantro_start_prepare_run(ctx);
>> +
>> +	version = v4l2_ctrl_find(&ctx->ctrl_handler,
>> +				 V4L2_CID_STATELESS_MPEG2_UAPI_VERSION)->cur.val;
>> +
>> +	switch (version) {
>> +	case V4L2_STATELESS_MPEG2_UAPI_V1:
>> +		hantro_g1_mpeg2_dec_run_v1(ctx);
>> +		break;
>> +	case V4L2_STATELESS_MPEG2_UAPI_V2:
>> +		hantro_g1_mpeg2_dec_run_v2(ctx);
>> +		break;
>> +	}
>>   
>>   	hantro_end_prepare_run(ctx);
>>   
>> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
>> index b3ce438f1329..57f11bf4a516 100644
>> --- a/include/media/v4l2-ctrls.h
>> +++ b/include/media/v4l2-ctrls.h
>> @@ -71,6 +71,9 @@ union v4l2_ctrl_ptr {
>>   	struct v4l2_ctrl_mpeg2_sequence *p_mpeg2_sequence;
>>   	struct v4l2_ctrl_mpeg2_picture *p_mpeg2_picture;
>>   	struct v4l2_ctrl_mpeg2_quantisation *p_mpeg2_quantisation;
>> +	struct v4l2_ctrl_mpeg2_sequence_v2 *p_mpeg2_sequence_v2;
>> +	struct v4l2_ctrl_mpeg2_picture_v2 *p_mpeg2_picture_v2;
>> +	struct v4l2_ctrl_mpeg2_quantisation_v2 *p_mpeg2_quantisation_v2;
>>   	struct v4l2_ctrl_fwht_params *p_fwht_params;
>>   	struct v4l2_ctrl_h264_sps *p_h264_sps;
>>   	struct v4l2_ctrl_h264_pps *p_h264_pps;
>> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
>> index c8e0f84d204d..a4a990e16603 100644
>> --- a/include/uapi/linux/v4l2-controls.h
>> +++ b/include/uapi/linux/v4l2-controls.h
>> @@ -1984,6 +1984,44 @@ struct v4l2_ctrl_mpeg2_quantisation {
>>   	__u8	chroma_non_intra_quantiser_matrix[64];
>>   };
>>   
>> +#define V4L2_CID_STATELESS_MPEG2_UAPI_VERSION  (V4L2_CID_CODEC_STATELESS_BASE+223)
>> +
>> +enum v4l2_stateless_mpeg2_uapi_version {
>> +	V4L2_STATELESS_MPEG2_UAPI_V1, /* assume V1 by default */
>> +	V4L2_STATELESS_MPEG2_UAPI_V2,
>> +};
>> +
>> +#define V4L2_CID_STATELESS_MPEG2_QUANTISATION_V2  (V4L2_CID_CODEC_STATELESS_BASE+224)
>> +#define V4L2_CID_STATELESS_MPEG2_PICTURE_V2  (V4L2_CID_CODEC_STATELESS_BASE+225)
>> +#define V4L2_CID_STATELESS_MPEG2_SEQUENCE_V2  (V4L2_CID_CODEC_STATELESS_BASE+226)
>> +
>> +struct v4l2_ctrl_mpeg2_quantisation_v2 {
>> +	__u8	intra_quantiser_matrix[64];
>> +	__u8	non_intra_quantiser_matrix[64];
>> +	__u8	chroma_intra_quantiser_matrix[64];
>> +	__u8	chroma_non_intra_quantiser_matrix[64];
>> +};
>> +
>> +struct v4l2_ctrl_mpeg2_picture_v2 {
>> +	__u64	backward_ref_ts;
>> +	__u64	forward_ref_ts;
>> +	__u32	flags;
>> +	__u8	f_code[2][2];
>> +	__u8	picture_coding_type;
>> +	__u8	picture_structure;
>> +	__u8	intra_dc_precision;
>> +	__u8	reserved[5];
>> +};
>> +
>> +struct v4l2_ctrl_mpeg2_sequence_v2 {
>> +	__u16	horizontal_size;
>> +	__u16	vertical_size;
>> +	__u32	vbv_buffer_size;
>> +	__u16	profile_and_level_indication;
>> +	__u8	chroma_format;
>> +	__u8	flags;
>> +};
>> +
>>   #define V4L2_CID_COLORIMETRY_CLASS_BASE	(V4L2_CTRL_CLASS_COLORIMETRY | 0x900)
>>   #define V4L2_CID_COLORIMETRY_CLASS	(V4L2_CTRL_CLASS_COLORIMETRY | 1)
>>   
>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>> index df8b9c486ba1..178e8acf8bbf 100644
>> --- a/include/uapi/linux/videodev2.h
>> +++ b/include/uapi/linux/videodev2.h
>> @@ -1760,6 +1760,10 @@ struct v4l2_ext_control {
>>   		struct v4l2_ctrl_mpeg2_sequence __user *p_mpeg2_sequence;
>>   		struct v4l2_ctrl_mpeg2_picture __user *p_mpeg2_picture;
>>   		struct v4l2_ctrl_mpeg2_quantisation __user *p_mpeg2_quantisation;
>> +		struct v4l2_ctrl_mpeg2_sequence_v2 __user *p_mpeg2_sequence_v2;
>> +		struct v4l2_ctrl_mpeg2_picture_v2 __user *p_mpeg2_picture_v2;
>> +		struct v4l2_ctrl_mpeg2_quantisation_v2 __user *p_mpeg2_quantisation_v2;
>> +		struct v4l2_ctrl_mpeg2_uapi_version __user *p_mpeg2_uapi_version;
>>   		struct v4l2_ctrl_vp9_compressed_hdr __user *p_vp9_compressed_hdr_probs;
>>   		struct v4l2_ctrl_vp9_frame __user *p_vp9_frame;
>>   		void __user *ptr;
>> @@ -1826,6 +1830,9 @@ enum v4l2_ctrl_type {
>>   	V4L2_CTRL_TYPE_MPEG2_QUANTISATION   = 0x0250,
>>   	V4L2_CTRL_TYPE_MPEG2_SEQUENCE       = 0x0251,
>>   	V4L2_CTRL_TYPE_MPEG2_PICTURE        = 0x0252,
>> +	V4L2_CTRL_TYPE_MPEG2_QUANTISATION_V2   = 0x0253,
>> +	V4L2_CTRL_TYPE_MPEG2_SEQUENCE_V2       = 0x0254,
>> +	V4L2_CTRL_TYPE_MPEG2_PICTURE_V2        = 0x0255,
>>   
>>   	V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR	= 0x0260,
>>   	V4L2_CTRL_TYPE_VP9_FRAME		= 0x0261,
>> -- 
>> 2.34.0
>>

