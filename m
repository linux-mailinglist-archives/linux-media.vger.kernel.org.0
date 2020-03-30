Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07512197A94
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2020 13:21:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729621AbgC3LVD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Mar 2020 07:21:03 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:47751 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729494AbgC3LVC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Mar 2020 07:21:02 -0400
Received: from [192.168.2.10] ([46.9.234.233])
        by smtp-cloud8.xs4all.net with ESMTPA
        id IsTQjGUwdBr2bIsTUjcGju; Mon, 30 Mar 2020 13:21:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1585567260; bh=A0mrmL7Ta7NGc2pBvhQfIuoNIfXEGiGjLbvgqXhZL6M=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=dm7Kku3riUTrKHeGIHNLRbqANRxluZd+Xce2R7id4j6dO0nDTihhWwb6qZsX/Ju2y
         s/lja6cV847bpPUxtJO9p5MBi56iv9WZ84IgrOCMdTc9Japg9A/FDb1vX5Yh21VLjn
         jZ5fOHk4uXQjKWaeFRN1p367z4szamH2PNu+/LwKLPLkvdJlAMHIYQiP60eizc6tXh
         KEudNp0DvUwCoVPPkqUgiBoPXImx4eDsGiaJfoF+9vh0t0sFoiq29FW60lhed5xn9L
         Efy5euFoiP4Uq1VNBzoD1aPYZkFN5PfbkRyd9GSBvnO4glZDKRh9bFTOzJRWmZfUmn
         NAq6U1lAIL5gQ==
Subject: Re: [PATCH] media: v4l2-ctrl: Add H264 profile and levels
To:     Maheshwar Ajja <majja@codeaurora.org>, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1584398550-19727-1-git-send-email-majja@codeaurora.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <225cb4d6-ca56-8e61-0cd1-a2aa183e446a@xs4all.nl>
Date:   Mon, 30 Mar 2020 13:20:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1584398550-19727-1-git-send-email-majja@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfGH0B+loUJKUdidcqMJQH0IbRImxAS0XdQnqp7sgupAQGunMcrn4e5wmQcl6QDmpDRNCbSrbySgLufLRuI1WmHHsnyo1rq6cC8gTpRLuVtaOa/rT07f2
 Oba0Pp2A3n2ec2GKIlaeWQO4tgjvBPFEotVndBlpFsw4wXOGNUOdYsYWUAFAjrCk3t6Xl8LdRwB93NP9fIQGfomrK3hwOWTD0tNRzjiBqbUI8kjl3+s/a/+E
 Fc/acUHiTGEJ2V00IDC0q9I9iNQEUGf7tdNrZwzmdPh9R8ADyZ+C6TJNoucrr8Hk
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Maheshwar,

The patch looks good, but you also need to update the documentation
in Documentation/media/uapi/v4l/ext-ctrls-codec.rst, adding the new
profile/levels.

You can just post a separate patch for that, and I'll take them both.

Regards,

	Hans

On 3/16/20 11:42 PM, Maheshwar Ajja wrote:
> Add H264 profile "Contrained High" and H264 levels "5.2",
> "6.0", "6.1" and "6.2".
> 
> Signed-off-by: Maheshwar Ajja <majja@codeaurora.org>
> ---
>  drivers/media/v4l2-core/v4l2-ctrls.c | 5 +++++
>  include/uapi/linux/v4l2-controls.h   | 5 +++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index 2928c5e..67ce711 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -336,6 +336,10 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
>  		"4.2",
>  		"5",
>  		"5.1",
> +		"5.2",
> +		"6.0",
> +		"6.1",
> +		"6.2",
>  		NULL,
>  	};
>  	static const char * const h264_loop_filter[] = {
> @@ -362,6 +366,7 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
>  		"Scalable High Intra",
>  		"Stereo High",
>  		"Multiview High",
> +		"Constrained High",
>  		NULL,
>  	};
>  	static const char * const vui_sar_idc[] = {
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 5a7bede..fbe3f82d 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -467,6 +467,10 @@ enum v4l2_mpeg_video_h264_level {
>  	V4L2_MPEG_VIDEO_H264_LEVEL_4_2	= 13,
>  	V4L2_MPEG_VIDEO_H264_LEVEL_5_0	= 14,
>  	V4L2_MPEG_VIDEO_H264_LEVEL_5_1	= 15,
> +	V4L2_MPEG_VIDEO_H264_LEVEL_5_2	= 16,
> +	V4L2_MPEG_VIDEO_H264_LEVEL_6_0	= 17,
> +	V4L2_MPEG_VIDEO_H264_LEVEL_6_1	= 18,
> +	V4L2_MPEG_VIDEO_H264_LEVEL_6_2	= 19,
>  };
>  #define V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_ALPHA	(V4L2_CID_MPEG_BASE+360)
>  #define V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_BETA	(V4L2_CID_MPEG_BASE+361)
> @@ -495,6 +499,7 @@ enum v4l2_mpeg_video_h264_profile {
>  	V4L2_MPEG_VIDEO_H264_PROFILE_SCALABLE_HIGH_INTRA	= 14,
>  	V4L2_MPEG_VIDEO_H264_PROFILE_STEREO_HIGH		= 15,
>  	V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH		= 16,
> +	V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH		= 17,
>  };
>  #define V4L2_CID_MPEG_VIDEO_H264_VUI_EXT_SAR_HEIGHT	(V4L2_CID_MPEG_BASE+364)
>  #define V4L2_CID_MPEG_VIDEO_H264_VUI_EXT_SAR_WIDTH	(V4L2_CID_MPEG_BASE+365)
> 

