Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9745D6C4737
	for <lists+linux-media@lfdr.de>; Wed, 22 Mar 2023 11:06:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbjCVKGi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Mar 2023 06:06:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229757AbjCVKGh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Mar 2023 06:06:37 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C013532BC
        for <linux-media@vger.kernel.org>; Wed, 22 Mar 2023 03:06:34 -0700 (PDT)
Received: from [192.168.0.192] (unknown [194.146.248.75])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: andrzej.p)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id B56746602EDC;
        Wed, 22 Mar 2023 10:06:31 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1679479592;
        bh=gMQSw5W5wchb1f9V81zvIgNpl9TCRyoNQ3fv3ZAp6u0=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=feI0Z1kR/hlsbpKPEEC8ZGhZhVcf2p05O0EaGNBNpdQkDhWDUclP1cM717F8OFnyL
         tp+hvmhtr9tBePCa+g4drvab8eNF9lLsxOMe7MdKheuInMFvudXEZAXha5jE6HyRcL
         JFiNnT0CqvmSXmF5IWC29E5SGJyna4HgeyOHEIrKxPgJ8CGkfuJvvdida4qy6icnXV
         BeQsuzfdTgcHcmAjODskw0GOe6CPaHiS6oHaNIbGs+7ZticiKCOUM+Jqcj/D4oNDgj
         TnTd2BiuVzXGEHVGF84ZYV2tNYx9z14HWHPEmbDpd1WccImEJeebt7/U2wvqsbs2z9
         5jNZ/lDR0m4Sw==
Message-ID: <4ddd59e5-4db3-5027-850c-118230926911@collabora.com>
Date:   Wed, 22 Mar 2023 11:06:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC 1/2] media: uapi: Add VP8 stateless encoder controls
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Heiko Stuebner <heiko@sntech.de>, kernel@collabora.com
References: <20230309125651.23911-1-andrzej.p@collabora.com>
 <20230309125651.23911-2-andrzej.p@collabora.com>
 <e0410a7a-250c-851b-147f-a93652e0a131@xs4all.nl>
Content-Language: en-US
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <e0410a7a-250c-851b-147f-a93652e0a131@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

W dniu 21.03.2023 o 14:39, Hans Verkuil pisze:
> Hi Andrzej,
> 
> On 09/03/2023 13:56, Andrzej Pietrasiewicz wrote:
>> Add uAPI for stateless VP8 encoders.
>>
>> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
>> ---
>>   drivers/media/v4l2-core/v4l2-ctrls-core.c | 16 ++++
>>   drivers/media/v4l2-core/v4l2-ctrls-defs.c |  5 ++
>>   include/media/v4l2-ctrls.h                |  1 +
>>   include/uapi/linux/v4l2-controls.h        | 91 +++++++++++++++++++++++
>>   include/uapi/linux/videodev2.h            |  3 +
>>   5 files changed, 116 insertions(+)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
>> index 29169170880a..5055e75d37bb 100644
>> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
>> @@ -335,6 +335,9 @@ void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
>>   	case V4L2_CTRL_TYPE_VP9_FRAME:
>>   		pr_cont("VP9_FRAME");
>>   		break;
>> +	case V4L2_CTRL_TYPE_VP8_ENCODE_PARAMS:
>> +		pr_cont("VP8_ENCODE_PARAMS");
>> +		break;
>>   	case V4L2_CTRL_TYPE_HEVC_SPS:
>>   		pr_cont("HEVC_SPS");
>>   		break;
>> @@ -568,6 +571,7 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>>   	struct v4l2_ctrl_hevc_pps *p_hevc_pps;
>>   	struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
>>   	struct v4l2_ctrl_hevc_decode_params *p_hevc_decode_params;
>> +	struct v4l2_ctrl_vp8_encode_params *p_vp8_encode_params;
>>   	struct v4l2_area *area;
>>   	void *p = ptr.p + idx * ctrl->elem_size;
>>   	unsigned int i;
>> @@ -918,6 +922,15 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>>   			return -EINVAL;
>>   		break;
>>   
>> +	case V4L2_CTRL_TYPE_VP8_ENCODE_PARAMS:
>> +		p_vp8_encode_params = p;
>> +		if (p_vp8_encode_params->loop_filter_level > 63)
>> +			return -EINVAL;
>> +
>> +		if (p_vp8_encode_params->sharpness_level > 7)
>> +			return -EINVAL;
>> +		break;
>> +
>>   	default:
>>   		return -EINVAL;
>>   	}
>> @@ -1602,6 +1615,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
>>   	case V4L2_CTRL_TYPE_VP9_FRAME:
>>   		elem_size = sizeof(struct v4l2_ctrl_vp9_frame);
>>   		break;
>> +	case V4L2_CTRL_TYPE_VP8_ENCODE_PARAMS:
>> +		elem_size = sizeof(struct v4l2_ctrl_vp8_encode_params);
>> +		break;
>>   	case V4L2_CTRL_TYPE_AREA:
>>   		elem_size = sizeof(struct v4l2_area);
>>   		break;
>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>> index 564fedee2c88..935bd9a07bad 100644
>> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>> @@ -1182,6 +1182,8 @@ const char *v4l2_ctrl_get_name(u32 id)
>>   	case V4L2_CID_STATELESS_MPEG2_QUANTISATION:		return "MPEG-2 Quantisation Matrices";
>>   	case V4L2_CID_STATELESS_VP9_COMPRESSED_HDR:	return "VP9 Probabilities Updates";
>>   	case V4L2_CID_STATELESS_VP9_FRAME:			return "VP9 Frame Decode Parameters";
>> +	case V4L2_CID_STATELESS_VP8_ENCODE_PARAMS:		return "VP8 Encode Parameters";
>> +	case V4L2_CID_STATELESS_VP8_ENCODE_QP:			return "VP8 Encode QP";
>>   	case V4L2_CID_STATELESS_HEVC_SPS:			return "HEVC Sequence Parameter Set";
>>   	case V4L2_CID_STATELESS_HEVC_PPS:			return "HEVC Picture Parameter Set";
>>   	case V4L2_CID_STATELESS_HEVC_SLICE_PARAMS:		return "HEVC Slice Parameters";
>> @@ -1531,6 +1533,9 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>>   	case V4L2_CID_STATELESS_VP9_FRAME:
>>   		*type = V4L2_CTRL_TYPE_VP9_FRAME;
>>   		break;
>> +	case V4L2_CID_STATELESS_VP8_ENCODE_PARAMS:
>> +		*type = V4L2_CTRL_TYPE_VP8_ENCODE_PARAMS;
>> +		break;
> 
> Why isn't V4L2_CID_STATELESS_VP8_ENCODE_QP added here as well? I assume it is of
> type INTEGER?
> 

Thanks for pointing that.

And it is a simple integer, indeed.

> I also wonder if VP9 would have the same control, so that this could be called
> V4L2_CID_STATELESS_VPX_ENCODE_QP. On the other hand, that might be overkill.
> 

It seems to me that having a single kind of control for passing the
requested QP value for both VP8 and VP9 makes sense. In fact, perhaps not
restricting ourselves to VPX would make even more sense?

This touches the question of how we do rate control in general in stateless
encoders. If the uAPI is to be independent of underlying hardware, then the only
parameter userspace passes to the kernel is the required QP (which is determined
entirely by userspace using whatever means it considers appropriate, for example
judging by the last encoded frame(s) size(s)). Any other kinds of data would
probably be somehow hardware-specific. So, I'm wondering if maybe even a

V4L2_CID_STATELESS_ENCODE_QP

is what we want?

This, in turn, brings another question of the range and interpretation of values
that should be passed through this control. 0-255? 0-100? 0 = no quantization at
all (i.e. highest quality) or maybe 0 = lowest possible quality?

Regards,

Andrzej
Regards,

Andrzej

