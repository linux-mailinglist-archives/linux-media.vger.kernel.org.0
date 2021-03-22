Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1650034464C
	for <lists+linux-media@lfdr.de>; Mon, 22 Mar 2021 14:55:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231286AbhCVNzM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Mar 2021 09:55:12 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:54123 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231197AbhCVNyv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Mar 2021 09:54:51 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id OL13lgQmRGEYcOL16lXU11; Mon, 22 Mar 2021 14:54:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616421289; bh=h8yM/HE2LPgagD4ZYvzewYemBDrBXvwomEdMCVWsqt8=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Z9r/4GYeT0CqV3fjqsZt2muv4G7sIy0mWczcrbxtwhTePAiOi4XgHsWI7DhtGnvVf
         ywtS/2OFF6jIgo/mTQ/pn1TUNx57g08YnAv18A/8byWJAuQv+xtAkQLhkj/ApOocT9
         q9Zgc2OmBzvX/S/SdOiPasJK6EuFui3jQfpd/F2PJMyb5QmjdoiC0QbJ2+K9JSZYmx
         8kVtcdbGJvTl+p1h6rlHB5xBj7bZBLkvwEVT5+sgC9F2IY6UuwBsDprSxii80Xb4Xv
         TpLilCrG5vqo1z78xFAytqDiKu93PNJY1tx7VWpZ9Xdx+MyjmkLbZP9IAx48wrsNGO
         wBsvMy+240mXw==
Subject: Re: [PATCH v5 3/5] v4l: Add HDR10 static metadata controls
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20210209162425.3970393-1-stanimir.varbanov@linaro.org>
 <20210209162425.3970393-4-stanimir.varbanov@linaro.org>
 <77ac3b63-9995-e08f-9e6e-7a7d75c64ec1@xs4all.nl>
 <444bb318-169f-6d30-2b7c-31d19d98a548@linaro.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <ba8cb44f-18f0-5080-66ff-030c101323e8@xs4all.nl>
Date:   Mon, 22 Mar 2021 14:54:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <444bb318-169f-6d30-2b7c-31d19d98a548@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfL4kTaQkMDNNz/DukXp11OT+wksf/zS6u7gPma8w6rBUh9lSIf0ipolJK4ZjWCff9fq/KaWjvBepF6Qfp5UeBNFwD4iX0IVR3ETALgX1Q6RafsgCaH+5
 5wljx41cnKh4vZtPZqkQy3c6WVW2R5bg7Qm7stX5bWONhbSp+ZMq4k3W3Tkxu/rFMNXI9o1hxzrWz1JuuO0IPihWJiKr3DpL21AKGQqj3kLmeqe8xzJ/93jO
 AxkswYvVNJXtz2J/+yGkq/98U4OYpHP7ZIYoonjKtP7aZp8EES38lJrwLicwJFCBTxvmAuEAqNBGYcUqkkLOwJAPIFeHgcBteffc6iSieLv7gZu/IxMfIp70
 KFCPkOqT8CVWVGUslBYCTbPU8qsT35AXMuUNnfoEXFy/4RWOgap1vAN7pL5IY78q8L2C5ln0
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22/03/2021 13:56, Stanimir Varbanov wrote:
> Hi Hans,
> 
> On 3/16/21 2:16 PM, Hans Verkuil wrote:
>> On 09/02/2021 17:24, Stanimir Varbanov wrote:
>>> Introduce Content light level and Mastering display colour
>>> volume Colorimetry compound controls with relevant payload
>>> structures and validation.
>>>
>>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>>> ---
>>>  drivers/media/v4l2-core/v4l2-ctrls.c | 67 ++++++++++++++++++++++++++++
>>>  include/media/v4l2-ctrls.h           |  4 ++
>>>  include/uapi/linux/v4l2-controls.h   | 31 +++++++++++++
>>>  include/uapi/linux/videodev2.h       |  3 ++
>>>  4 files changed, 105 insertions(+)
>>>
>>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
>>> index 335cf354f51b..8bd3cf0e1e4f 100644
>>> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
>>> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
>>> @@ -1205,6 +1205,8 @@ const char *v4l2_ctrl_get_name(u32 id)
>>>  	/* Colorimetry controls */
>>>  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
>>>  	case V4L2_CID_COLORIMETRY_CLASS:	return "Colorimetry Controls";
>>> +	case V4L2_CID_COLORIMETRY_HDR10_CLL_INFO:		return "HDR10 Content Light Info";
>>> +	case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:	return "HDR10 Mastering Display";
>>>  	default:
>>>  		return NULL;
>>>  	}
>>> @@ -1491,6 +1493,12 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>>>  		*type = V4L2_CTRL_TYPE_AREA;
>>>  		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
>>>  		break;
>>> +	case V4L2_CID_COLORIMETRY_HDR10_CLL_INFO:
>>> +		*type = V4L2_CTRL_TYPE_HDR10_CLL_INFO;
>>> +		break;
>>> +	case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:
>>> +		*type = V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY;
>>> +		break;
>>>  	default:
>>>  		*type = V4L2_CTRL_TYPE_INTEGER;
>>>  		break;
>>> @@ -1786,6 +1794,12 @@ static void std_log(const struct v4l2_ctrl *ctrl)
>>>  	case V4L2_CTRL_TYPE_FWHT_PARAMS:
>>>  		pr_cont("FWHT_PARAMS");
>>>  		break;
>>> +	case V4L2_CTRL_TYPE_HDR10_CLL_INFO:
>>> +		pr_cont("HDR10_CLL_INFO");
>>> +		break;
>>> +	case V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY:
>>> +		pr_cont("HDR10_MASTERING_DISPLAY");
>>> +		break;
>>>  	default:
>>>  		pr_cont("unknown type %d", ctrl->type);
>>>  		break;
>>> @@ -1838,6 +1852,7 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>>>  	struct v4l2_ctrl_hevc_sps *p_hevc_sps;
>>>  	struct v4l2_ctrl_hevc_pps *p_hevc_pps;
>>>  	struct v4l2_ctrl_hevc_slice_params *p_hevc_slice_params;
>>> +	struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
>>>  	struct v4l2_area *area;
>>>  	void *p = ptr.p + idx * ctrl->elem_size;
>>>  	unsigned int i;
>>> @@ -2133,6 +2148,52 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>>>  		zero_padding(*p_hevc_slice_params);
>>>  		break;
>>>  
>>> +	case V4L2_CTRL_TYPE_HDR10_CLL_INFO:
>>> +		break;
>>> +
>>> +	case V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY:
>>> +		p_hdr10_mastering = p;
>>> +
>>> +		for (i = 0; i < 3; ++i) {
>>> +			if (p_hdr10_mastering->display_primaries_x[i] <
>>> +				V4L2_HDR10_MASTERING_PRIMARIES_X_LOW ||
>>> +			    p_hdr10_mastering->display_primaries_x[i] >
>>> +				V4L2_HDR10_MASTERING_PRIMARIES_X_HIGH ||
>>> +			    p_hdr10_mastering->display_primaries_y[i] <
>>> +				V4L2_HDR10_MASTERING_PRIMARIES_Y_LOW ||
>>> +			    p_hdr10_mastering->display_primaries_y[i] >
>>> +				V4L2_HDR10_MASTERING_PRIMARIES_Y_HIGH)
>>> +				return -EINVAL;
>>> +		}
>>> +
>>> +		if (p_hdr10_mastering->white_point_x <
>>> +			V4L2_HDR10_MASTERING_WHITE_POINT_X_LOW ||
>>> +		    p_hdr10_mastering->white_point_x >
>>> +			V4L2_HDR10_MASTERING_WHITE_POINT_X_HIGH ||
>>> +		    p_hdr10_mastering->white_point_y <
>>> +			V4L2_HDR10_MASTERING_WHITE_POINT_Y_LOW ||
>>> +		    p_hdr10_mastering->white_point_y >
>>> +			V4L2_HDR10_MASTERING_WHITE_POINT_Y_HIGH)
>>> +			return -EINVAL;
>>> +
>>> +		if (p_hdr10_mastering->max_display_mastering_luminance <
>>> +			V4L2_HDR10_MASTERING_MAX_LUMA_LOW ||
>>> +		    p_hdr10_mastering->max_display_mastering_luminance >
>>> +			V4L2_HDR10_MASTERING_MAX_LUMA_HIGH ||
>>> +		    p_hdr10_mastering->min_display_mastering_luminance <
>>> +			V4L2_HDR10_MASTERING_MIN_LUMA_LOW ||
>>> +		    p_hdr10_mastering->min_display_mastering_luminance >
>>> +			V4L2_HDR10_MASTERING_MIN_LUMA_HIGH)
>>> +			return -EINVAL;
>>> +
>>> +		if (p_hdr10_mastering->max_display_mastering_luminance ==
>>> +			V4L2_HDR10_MASTERING_MAX_LUMA_LOW &&
>>> +		    p_hdr10_mastering->min_display_mastering_luminance ==
>>> +			V4L2_HDR10_MASTERING_MIN_LUMA_HIGH)
>>
>> I had to think about this one :-)
>>
>> Isn't it clearer to write:
>>
>> 		if (p_hdr10_mastering->min_display_mastering_luminance >=
>> 		    p_hdr10_mastering->max_display_mastering_luminance)
>>
>> (even though it can't be >, but >= is probably more robust and future proof)
>>
>> And is it indeed invalid if both are the same?
> 
> This what the ITU-T Rec. H.265 spec says:
> 
> "When max_display_mastering_luminance is equal to 50 000,
> min_display_mastering_luminance shall not be equal to 50 000."

OK. Just add a comment explaining that that restriction comes from the
H.265 spec.

Regards,

	Hans

> 
> 

