Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D55154BD5D9
	for <lists+linux-media@lfdr.de>; Mon, 21 Feb 2022 07:23:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344886AbiBUGI2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Feb 2022 01:08:28 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:34914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344884AbiBUGI1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Feb 2022 01:08:27 -0500
X-Greylist: delayed 301 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 20 Feb 2022 22:08:04 PST
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
        by lindbergh.monkeyblade.net (Postfix) with UTF8SMTPS id B6683B42
        for <linux-media@vger.kernel.org>; Sun, 20 Feb 2022 22:08:04 -0800 (PST)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1645423684; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=+AazQjQeDgQpPnJ/pXKd7WBiIS1jXxFHsSWffVy37C8=;
 b=P4qyj/my8ga8VKfKGbVsmbAFMLz6ABIAEudIbhUzrB2k/a1AbIwip8eDOHc9HLGSRsVvYvj6
 bjs55HqLX+AvQ+j16FdL6hCv512Rlmm8R67GsaBRSCXpTP/7H1sY4wKtKP1C2dZC5Ue/o+S7
 YeXeYYuet5edLXYq2EWE2ooyPzQ=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 62132b14403a075b97a4b443 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 21 Feb 2022 06:03:00
 GMT
Sender: dikshita=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 643AEC43618; Mon, 21 Feb 2022 06:02:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: dikshita)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3151BC4338F;
        Mon, 21 Feb 2022 06:02:58 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 21 Feb 2022 11:32:58 +0530
From:   dikshita@codeaurora.org
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, ezequiel@collabora.com,
        vgarodia@codeaurora.org, stanimir.varbanov@linaro.org,
        Dikshita Agarwal <quic_dikshita@quicinc.com>
Subject: Re: [PATCH v1 1/2] media: v4l2-ctrls: Add intra-refresh type control
In-Reply-To: <20ace4b3-5002-4edb-642b-bbb1952f3591@xs4all.nl>
References: <1643019119-8309-1-git-send-email-dikshita@qti.qualcomm.com>
 <1643019119-8309-2-git-send-email-dikshita@qti.qualcomm.com>
 <20ace4b3-5002-4edb-642b-bbb1952f3591@xs4all.nl>
Message-ID: <39d1418cec305e59d798242b34d62e90@codeaurora.org>
X-Sender: dikshita@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2022-02-15 13:51, Hans Verkuil wrote:
> Hi Dikshita,
> 
> Some comments below:
> 
> On 1/24/22 11:11, Dikshita Agarwal wrote:
>> From: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> 
>> Add a control to set intra-refresh type.
>> 
>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> ---
>>  .../userspace-api/media/v4l/ext-ctrls-codec.rst    | 23 
>> ++++++++++++++++++++++
>>  drivers/media/v4l2-core/v4l2-ctrls-defs.c          |  9 +++++++++
>>  include/uapi/linux/v4l2-controls.h                 |  5 +++++
>>  3 files changed, 37 insertions(+)
>> 
>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst 
>> b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> index e141f0e..54b42e1 100644
>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> @@ -1180,6 +1180,29 @@ enum v4l2_mpeg_video_h264_entropy_mode -
>>      is set to non zero value.
>>      Applicable to H264, H263 and MPEG4 encoder.
>> 
>> +``V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_TYPE (enum)``
>> +
>> +enum v4l2_mpeg_video_intra_refresh_type -
>> +    Sets the type of intra refresh. The period to refresh
>> +    the whole frame is specified by 
>> V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD.
>> +    Note if the client sets this control to either 
>> ``V4L2_MPEG_VIDEO_INTRA_REFRESH_RANDOM``
>> +    or ``V4L2_MPEG_VIDEO_INTRA_REFRESH_CYCLIC`` the 
>> ``V4L2_CID_MPEG_VIDEO_CYCLIC_INTRA_REFRESH_MB``
>> +    control shall be ignored.
> 
> Since this control has only two possible values, that would mean that,
> if this control
> is present, then REFRESH_MB is always ignored.
> 
> It seems to me that you need a third option here that specifically
> selects the REFRESH_MB
> method.
> 
> Also, this needs to be documented as well in REFRESH_MB (i.e. it is
> ignored if this TYPE
> control is present and is set to something other than REFRESH_MB).
> 

Hi Hans,

I don't think we need to add that as the third option in this control.

So, there are two ways to set intra refresh to driver, it can be either 
MB based or Frame-based.
Currently, we have two v4l2 controls in place
1. V4L2_CID_MPEG_VIDEO_CYCLIC_INTRA_REFRESH_MB -> this is MB based and 
only applicable for cyclic
2. V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD -> this is frame based and 
has no type associated to it
    and it is up to the driver to decide the type i.e Random or Cyclic.

with this new control V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_TYPE, we are 
introducing
a way for the client to set the type of intra refresh, either cyclic or 
random.

Thanks,
Dikshita

>> +    Applicable to H264, H263 and MPEG4 encoder. Possible values are:
>> +
>> +.. tabularcolumns:: |p{9.6cm}|p{7.9cm}|
>> +
>> +.. flat-table::
>> +    :header-rows:  0
>> +    :stub-columns: 0
>> +
>> +    * - ``V4L2_MPEG_VIDEO_INTRA_REFRESH_RANDOM``
> 
> I think you should add _TYPE after REFRESH in these names to clearly 
> specify
> that this is setting the refresh *type*.
> 
>> +      - The whole frame is completely refreshed randomly
>> +      after the specified period.
>> +    * - ``V4L2_MPEG_VIDEO_INTRA_REFRESH_CYCLIC``
>> +      - The whole frame MBs are completely refreshed in cyclic order
>> +      after the specified period.
>> +
>>  ``V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD (integer)``
>>      Intra macroblock refresh period. This sets the period to refresh
>>      the whole frame. In other words, this defines the number of 
>> frames
>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c 
>> b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>> index 54ca4e6..f13f587 100644
>> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>> @@ -572,6 +572,11 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
>>  		"VBV/CPB Limit",
>>  		NULL,
>>  	};
>> +	static const char * const intra_refresh_type[] = {
>> +		"Random",
>> +		"Cyclic",
>> +		NULL,
>> +	};
>> 
>>  	switch (id) {
>>  	case V4L2_CID_MPEG_AUDIO_SAMPLING_FREQ:
>> @@ -705,6 +710,8 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
>>  		return hevc_start_code;
>>  	case V4L2_CID_CAMERA_ORIENTATION:
>>  		return camera_orientation;
>> +	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_TYPE:
>> +		return intra_refresh_type;
>>  	default:
>>  		return NULL;
>>  	}
>> @@ -834,6 +841,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>>  	case V4L2_CID_MPEG_VIDEO_DECODER_SLICE_INTERFACE:	return "Decoder 
>> Slice Interface";
>>  	case V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER:	return "MPEG4 
>> Loop Filter Enable";
>>  	case V4L2_CID_MPEG_VIDEO_CYCLIC_INTRA_REFRESH_MB:	return "Number of 
>> Intra Refresh MBs";
>> +	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_TYPE:		return "Intra Refresh 
>> Type";
>>  	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD:		return "Intra 
>> Refresh Period";
>>  	case V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE:		return "Frame Level Rate 
>> Control Enable";
>>  	case V4L2_CID_MPEG_VIDEO_MB_RC_ENABLE:			return "H264 MB Level Rate 
>> Control";
>> @@ -1360,6 +1368,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, 
>> enum v4l2_ctrl_type *type,
>>  	case V4L2_CID_STATELESS_H264_DECODE_MODE:
>>  	case V4L2_CID_STATELESS_H264_START_CODE:
>>  	case V4L2_CID_CAMERA_ORIENTATION:
>> +	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_TYPE:
>>  		*type = V4L2_CTRL_TYPE_MENU;
>>  		break;
>>  	case V4L2_CID_LINK_FREQ:
>> diff --git a/include/uapi/linux/v4l2-controls.h 
>> b/include/uapi/linux/v4l2-controls.h
>> index c8e0f84..9650b71 100644
>> --- a/include/uapi/linux/v4l2-controls.h
>> +++ b/include/uapi/linux/v4l2-controls.h
>> @@ -443,6 +443,11 @@ enum v4l2_mpeg_video_multi_slice_mode {
>>  #define V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES		(V4L2_CID_CODEC_BASE+234)
>>  #define 
>> V4L2_CID_MPEG_VIDEO_DEC_CONCEAL_COLOR		(V4L2_CID_CODEC_BASE+235)
>>  #define 
>> V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD	(V4L2_CID_CODEC_BASE+236)
>> +#define 
>> V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_TYPE		(V4L2_CID_CODEC_BASE+237)
>> +enum v4l2_mpeg_video_intra_refresh_type {
>> +	V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_RANDOM	= 0,
>> +	V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_CYCLIC	= 1,
>> +};
>> 
>>  /* CIDs for the MPEG-2 Part 2 (H.262) codec */
>>  #define V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL			(V4L2_CID_CODEC_BASE+270)
> 
> Regards,
> 
> 	Hans
