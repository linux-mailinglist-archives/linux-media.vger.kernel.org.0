Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3204D2B67F0
	for <lists+linux-media@lfdr.de>; Tue, 17 Nov 2020 15:53:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729262AbgKQOxL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Nov 2020 09:53:11 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:44825 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728718AbgKQOxL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Nov 2020 09:53:11 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id f2LvkpAwd6LFvf2LzkVPo0; Tue, 17 Nov 2020 15:53:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1605624787; bh=FgYMdJ0sPBUZnT5EFt4WPhZomwazgiq6pKDnyizwbWw=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=NBm0whW/kc5GpOJmNqSIiRoogyGGYzzS4p17k5rF7dENQ/iz8jMeuoz85+k2Jpszc
         CMApivFhzox7UC3J7FeIr4f8EFd/JglSzCd7keIebk/jLYWflbSjlDIkpnrBht/c1c
         webkXYrq68LczZAz2XmkLhrJhHhlcO8LYdmN3gLIXHrdgmPeX3ft9dBoKE9TNOrIjd
         opehsw/9H2H9f8ZP9aNLXsd2W23BylNXyZ72WNOO2GWczUl5bzsNYJLpAZov8ixq0S
         3U2BD6wv6yDGZAo9l6MqwjL6qubh3ZKXBBsYNNpsfqhgyDIxjLh8AhlV/GrXKV8Nmc
         CaglER5RyjjTQ==
Subject: Re: [PATCH v2] media: v4l2-ctrl: Add base layer priority id control.
To:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     mchehab@kernel.org, ezequiel@collabora.com,
        stanimir.varbanov@linaro.org, vgarodia@codeaurora.org,
        majja@codeaurora.org, Nicolas Dufresne <nicolas@ndufresne.ca>
References: <1602759935-12965-1-git-send-email-dikshita@codeaurora.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <35f31a15-25b2-73d5-4bdd-c57431070d9b@xs4all.nl>
Date:   Tue, 17 Nov 2020 15:53:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1602759935-12965-1-git-send-email-dikshita@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfLGsgaswyYUn9GhQmIgEUIQgNBuz6FvlDktq1vY0YsDOHMm4pDkhV3HppSazUBCypsvvC7RiO2wAnxy6wKE2d8oZ9GD63rJQZ6s9AFVTkGG1DVg4ECd3
 u3X8HeY9T/d9k9SW9/Y1+k4/k2t4ApXTCtA708whIa/auv3qeuJswm0i9DJhMPqoUyOAWVdFhHvxeF+TXXwqoh1uKpka7a0O5jpFm0w17VRXfZq/tLQAZ8fC
 OZj0IHwNY4CAmJEJaj7Pj0r7dO7NxLECD3CDW022LGE4dk7RZFVWm+sV82kxDhAhThQ9eUaIB19zuIR46rP1u6XGCS9wbafC2ylIxfzwdcBwGMFEcpo3M9uN
 gBue7J4mGNsq6GJ8XxcVbi43i3rcBfwFZsNxWaCT+SjEGkrxHz//OrbRA2K+gNi7PC4r/GUixZ60EV6LZ9p5uHIH9zHppybOOLrxHhxiD3enFwb4YfBgoGWo
 ijbEmNSaOhq4NCBuXip20NBKwTkRG9zUEV3OI7NRCd0lsjTjg6SCm/S9gbs=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Nicolas, can you take a look at this with your codec knowledge?

Some other review comments below:

On 15/10/2020 13:05, Dikshita Agarwal wrote:
> This control indicates the priority id to be applied
> to base layer.
> 
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> ---
>  Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 9 +++++++++
>  drivers/media/v4l2-core/v4l2-ctrls.c                      | 1 +
>  include/uapi/linux/v4l2-controls.h                        | 1 +
>  3 files changed, 11 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index 6e9240a..aac1ea3 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -4407,3 +4407,12 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
>         to the LTR index max LTR count-1.
>         This is applicable to H264 and HEVC encoder and can be applied using
>         request api.
> +
> +``V4L2_CID_MPEG_VIDEO_BASELAYER_PRIORITYID (integer)``

I'd add a_ before the ID, so: V4L2_CID_MPEG_VIDEO_BASELAYER_PRIORITY_ID.

> +       Specifies a priority identifier for the NAL unit,
> +       which will be applied to base layer.
> +       By default this value is set to 0 for base layer.
> +       And the next layer will have priority ID assigned as 1,2,3 and so on.
> +       Video encode can't decide the priority id to be applied to a layer
> +       so this has to come from client.
> +       Valid Range: from 0 to 63

I'm slightly rephrasing the text above:

       Specifies a priority identifier for the NAL unit, which will be applied to
       the base layer. By default this value is set to 0 for the base layer,
       and the next layer will have the priority ID assigned as 1, 2, 3 and so on.
       The video encoder can't decide the priority id to be applied to a layer,
       so this has to come from client.
       Valid Range: from 0 to 63.

For which codecs is this applicable? H264 and HEVC? That should be stated. If you
have a reference to the corresponding sections that describe this, then that would
be nice to add.

> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index 046198f..c973058 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -952,6 +952,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_MPEG_VIDEO_LTR_COUNT:			return "LTR Count";
>  	case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:		return "Mark LTR frame index";
>  	case V4L2_CID_MPEG_VIDEO_USE_LTR_FRAME:			return "Use LTR Frame";
> +	case V4L2_CID_MPEG_VIDEO_BASELAYER_PRIORITYID:		return "Base Layer Priority ID";
>  	case V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS:		return "MPEG-2 Slice Parameters";
>  	case V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION:		return "MPEG-2 Quantization Matrices";
>  	case V4L2_CID_MPEG_VIDEO_FWHT_PARAMS:			return "FWHT Stateless Parameters";
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 3801372..433e119 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -418,6 +418,7 @@ enum v4l2_mpeg_video_multi_slice_mode {
>  #define V4L2_CID_MPEG_VIDEO_LTR_COUNT                  (V4L2_CID_MPEG_BASE+230)
>  #define V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX            (V4L2_CID_MPEG_BASE+231)
>  #define V4L2_CID_MPEG_VIDEO_USE_LTR_FRAME              (V4L2_CID_MPEG_BASE+232)
> +#define V4L2_CID_MPEG_VIDEO_BASELAYER_PRIORITYID       (V4L2_CID_MPEG_BASE+233)
>  
>  /* CIDs for the MPEG-2 Part 2 (H.262) codec */
>  #define V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL			(V4L2_CID_MPEG_BASE+270)
> 

Regards,

	Hans
