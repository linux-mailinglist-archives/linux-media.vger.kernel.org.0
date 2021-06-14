Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A96B3A5D3E
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 08:49:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232476AbhFNGv2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 02:51:28 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:28336 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232394AbhFNGvZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 02:51:25 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623653363; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=I38mQxV/Tbn+T1jBm45ueY8hqSAqFaS9oTZBJvKWkoU=;
 b=A2nBupqPjwi23pOGQyFCK9pMRhJQChySxDB+39jO+IHMPkT7WglbFtnwVcTQYMOggSeEFJ4F
 ijUHRwqESAE8UbBmhgtIwOukikv2lbayqhioF9HIWduhQ8ScqZPWxSmsgUgH7BIgrPd2BCdQ
 cYtlK7oZPdftsTbMy8oKM0uryew=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 60c6fbeae27c0cc77f921577 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 14 Jun 2021 06:49:14
 GMT
Sender: mansur=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6626EC43460; Mon, 14 Jun 2021 06:49:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: mansur)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 21BD3C433D3;
        Mon, 14 Jun 2021 06:49:12 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 14 Jun 2021 12:19:12 +0530
From:   mansur@codeaurora.org
To:     Fritz Koenig <frkoenig@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Dikshita Agarwal <dikshita@codeaurora.org>
Subject: Re: [PATCH] venus: venc: add support for
 V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM control
In-Reply-To: <CAMfZQbyHN14OXVH4x8SsXD0My1QzdHocMLoi++pfCTk-XbABxg@mail.gmail.com>
References: <1622438514-16657-1-git-send-email-mansur@codeaurora.org>
 <CAMfZQbyHN14OXVH4x8SsXD0My1QzdHocMLoi++pfCTk-XbABxg@mail.gmail.com>
Message-ID: <7b26fdd6169ab8f8af475f2d4e68efcb@codeaurora.org>
X-Sender: mansur@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> On 2021-06-02 23:10, Fritz Koenig wrote:
>> On Sun, May 30, 2021 at 10:22 PM Mansur Alisha Shaik
>> <mansur@codeaurora.org> wrote:
>>> 
>>> Add support for V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM control for
>>> H264 high profile and constrained high profile.
>>> 
>>> Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
>>> ---
>>>  drivers/media/platform/qcom/venus/core.h       |  1 +
>>>  drivers/media/platform/qcom/venus/hfi_cmds.c   | 10 ++++++++++
>>>  drivers/media/platform/qcom/venus/hfi_helper.h |  5 +++++
>>>  drivers/media/platform/qcom/venus/venc.c       | 11 +++++++++++
>>>  drivers/media/platform/qcom/venus/venc_ctrls.c | 12 +++++++++++-
>>>  5 files changed, 38 insertions(+), 1 deletion(-)
>>> 
>>> diff --git a/drivers/media/platform/qcom/venus/core.h 
>>> b/drivers/media/platform/qcom/venus/core.h
>>> index 745f226..103fbd8 100644
>>> --- a/drivers/media/platform/qcom/venus/core.h
>>> +++ b/drivers/media/platform/qcom/venus/core.h
>>> @@ -235,6 +235,7 @@ struct venc_controls {
>>>         u32 h264_loop_filter_mode;
>>>         s32 h264_loop_filter_alpha;
>>>         s32 h264_loop_filter_beta;
>>> +       u32 h264_8x8_transform;
>>> 
>>>         u32 hevc_i_qp;
>>>         u32 hevc_p_qp;
>>> diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.c 
>>> b/drivers/media/platform/qcom/venus/hfi_cmds.c
>>> index 11a8347..61d04a5 100644
>>> --- a/drivers/media/platform/qcom/venus/hfi_cmds.c
>>> +++ b/drivers/media/platform/qcom/venus/hfi_cmds.c
>>> @@ -1178,6 +1178,7 @@ pkt_session_set_property_4xx(struct 
>>> hfi_session_set_property_pkt *pkt,
>>>  {
>>>         void *prop_data;
>>> 
>>> +
>>>         if (!pkt || !cookie || !pdata)
>>>                 return -EINVAL;
>>> 
>>> @@ -1227,6 +1228,15 @@ pkt_session_set_property_4xx(struct 
>>> hfi_session_set_property_pkt *pkt,
>>>                 break;
>>>         }
>>> 
>>> +       case HFI_PROPERTY_PARAM_VENC_H264_TRANSFORM_8X8: {
>>> +               struct hfi_h264_8x8x_transform *in = pdata, *tm = 
>>> prop_data;
>>> +
>>> +               tm->enable_type = in->enable_type;
>>> +               pkt->shdr.hdr.size += sizeof(u32) + sizeof(*tm);
>>> +               break;
>>> +
>>> +       }
>>> +
>>>         case HFI_PROPERTY_CONFIG_VENC_MAX_BITRATE:
>>>         case HFI_PROPERTY_CONFIG_VDEC_POST_LOOP_DEBLOCKER:
>>>         case HFI_PROPERTY_PARAM_BUFFER_ALLOC_MODE:
>>> diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h 
>>> b/drivers/media/platform/qcom/venus/hfi_helper.h
>>> index 63cd347..81d0536 100644
>>> --- a/drivers/media/platform/qcom/venus/hfi_helper.h
>>> +++ b/drivers/media/platform/qcom/venus/hfi_helper.h
>>> @@ -510,6 +510,7 @@
>>>  #define HFI_PROPERTY_PARAM_VENC_MAX_NUM_B_FRAMES               
>>> 0x2005020
>>>  #define HFI_PROPERTY_PARAM_VENC_H264_VUI_BITSTREAM_RESTRC      
>>> 0x2005021
>>>  #define HFI_PROPERTY_PARAM_VENC_PRESERVE_TEXT_QUALITY          
>>> 0x2005023
>>> +#define HFI_PROPERTY_PARAM_VENC_H264_TRANSFORM_8X8                   
>>>   0x2005025
>>>  #define HFI_PROPERTY_PARAM_VENC_HIER_P_MAX_NUM_ENH_LAYER       
>>> 0x2005026
>>>  #define HFI_PROPERTY_PARAM_VENC_DISABLE_RC_TIMESTAMP           
>>> 0x2005027
>>>  #define HFI_PROPERTY_PARAM_VENC_INITIAL_QP                     
>>> 0x2005028
>>> @@ -565,6 +566,10 @@ struct hfi_bitrate {
>>>         u32 layer_id;
>>>  };
>>> 
>>> +struct hfi_h264_8x8x_transform {
>>> +       u32 enable_type;
>>> +};
>>> +
>>>  #define HFI_CAPABILITY_FRAME_WIDTH                     0x01
>>>  #define HFI_CAPABILITY_FRAME_HEIGHT                    0x02
>>>  #define HFI_CAPABILITY_MBS_PER_FRAME                   0x03
>>> diff --git a/drivers/media/platform/qcom/venus/venc.c 
>>> b/drivers/media/platform/qcom/venus/venc.c
>>> index 8dd49d4..4ecf331 100644
>>> --- a/drivers/media/platform/qcom/venus/venc.c
>>> +++ b/drivers/media/platform/qcom/venus/venc.c
>>> @@ -567,6 +567,7 @@ static int venc_set_properties(struct venus_inst 
>>> *inst)
>>>                 struct hfi_h264_vui_timing_info info;
>>>                 struct hfi_h264_entropy_control entropy;
>>>                 struct hfi_h264_db_control deblock;
>>> +               struct hfi_h264_8x8x_transform h264_transform;
>>> 
>>>                 ptype = HFI_PROPERTY_PARAM_VENC_H264_VUI_TIMING_INFO;
>>>                 info.enable = 1;
>>> @@ -597,6 +598,16 @@ static int venc_set_properties(struct venus_inst 
>>> *inst)
>>>                 ret = hfi_session_set_property(inst, ptype, 
>>> &deblock);
>>>                 if (ret)
>>>                         return ret;
>>> +
>>> +               ptype = HFI_PROPERTY_PARAM_VENC_H264_TRANSFORM_8X8;
>>> +               if (ctr->profile.h264 == HFI_H264_PROFILE_HIGH ||
>>> +                       ctr->profile.h264 == 
>>> HFI_H264_PROFILE_CONSTRAINED_HIGH)
>>> +                       h264_transform.enable_type = 
>>> ctr->h264_8x8_transform;
>>> +
>>> +               ret = hfi_session_set_property(inst, ptype, 
>>> &h264_transform);
>>> +               if (ret)
>>> +                       return ret;
>>> +
>>>         }
>>> 
>>>         if (inst->fmt_cap->pixfmt == V4L2_PIX_FMT_H264 ||
>>> diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c 
>>> b/drivers/media/platform/qcom/venus/venc_ctrls.c
>>> index 637c92f..e3ef611 100644
>>> --- a/drivers/media/platform/qcom/venus/venc_ctrls.c
>>> +++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
>>> @@ -319,6 +319,13 @@ static int venc_op_s_ctrl(struct v4l2_ctrl 
>>> *ctrl)
>>>         case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:
>>>                 ctr->mastering = *ctrl->p_new.p_hdr10_mastering;
>>>                 break;
>>> +       case V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM:
>>> +               if (ctr->profile.h264 != HFI_H264_PROFILE_HIGH ||
>>> +                       ctr->profile.h264 != 
>>> HFI_H264_PROFILE_CONSTRAINED_HIGH)
>> 
>> This appears to be incorrect as the comparison will always be true.  I
>> think it should be written as:
>>                if (ctr->profile.h264 == HFI_H264_PROFILE_HIGH ||
>>                        ctr->profile.h264 == 
>> HFI_H264_PROFILE_CONSTRAINED_HIGH)
>>                        ctr->h264_8x8_transform = ctrl->val;
>> 
>>> +                       return -EINVAL;
>> 
>> I'm not sure -EINVAL is appropriate here.  venc_op_s_ctrl will be
>> called to initialize the default control values from
>> v4l2_ctrl_handler_setup.  If the default profile isn't high or
>> constrained high, the driver will fail to initialize.
>> 
As per codec spec, the 8x8 transform is enabled for high profile and
constrained high profile, but I didn't found any document what happens
when we set 8x8 transform for other profiles.
Hence added a check to reject other profiles to inform the same to 
client
>>> +
>>> +               ctr->h264_8x8_transform = ctrl->val;
>>> +               break;
>>> 
>>>         default:
>>>                 return -EINVAL;
>>>         }
>>> @@ -334,7 +341,7 @@ int venc_ctrl_init(struct venus_inst *inst)
>>>  {
>>>         int ret;
>>> 
>>> -       ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 57);
>>> +       ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 58);
>>>         if (ret)
>>>                 return ret;
>>> 
>>> @@ -438,6 +445,9 @@ int venc_ctrl_init(struct venus_inst *inst)
>>>                           V4L2_CID_MPEG_VIDEO_H264_I_FRAME_MIN_QP, 1, 
>>> 51, 1, 1);
>>> 
>>>         v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
>>> +               V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM, 0, 1, 1, 0);
>>> +
>>> +       v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
>>>                           V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MIN_QP, 1, 
>>> 51, 1, 1);
>>> 
>>>         v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
>>> --
>>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
>>> member
>>> of Code Aurora Forum, hosted by The Linux Foundation
>>> 
> 
