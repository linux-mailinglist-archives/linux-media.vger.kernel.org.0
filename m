Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64D37249969
	for <lists+linux-media@lfdr.de>; Wed, 19 Aug 2020 11:36:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727081AbgHSJgB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Aug 2020 05:36:01 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:58787 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726949AbgHSJf5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Aug 2020 05:35:57 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 8KVWkbA44uuXO8KVZkg7t5; Wed, 19 Aug 2020 11:35:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1597829755; bh=CxYTG2B8CfhRvUngLtu1GxHqIUKSHBmXRcAVRnBlCTA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=HSSXVGM9VnGL3chhDro9FPZdZUl2h85fuzWoJTUO7sXVBf4GW5AfruNWlAao9/V5d
         B6quzjQX8jVemXpGnS54YGoH+fc/D5AqVWD8LhNK8C3jke0f4e57mmIyHkrqntnfmO
         Rxvehgfk+Ap1/KIdHOjilOsxok5wQX72PrNkbj+RSEQwVaYGbfSkKN8GYl9hW3Htp2
         XOH1Ckviccu9HqY9hsnSAASFuoE+60Jq8gEXEsXuYgLP9oA2BsShLTniARgBXldKMy
         j6GDcGeEHdblIeWSQdGDrVTm+MaDeKJ6cdgALuQQVVSN9oHaphrXut9Pg+/OUQ14FN
         O6rSBI0VgimKQ==
Subject: Re: [PATCH v2 5/6] media: s5p-mfc: Use standard frame skip mode
 control
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kamil Debski <kamil@wypas.org>,
        Jeongtae Park <jtp.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Maheshwar Ajja <majja@codeaurora.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
References: <20200721074538.505-1-stanimir.varbanov@linaro.org>
 <20200721074538.505-6-stanimir.varbanov@linaro.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <b8b3d048-6f3b-4874-ee6a-547b8d6155b0@xs4all.nl>
Date:   Wed, 19 Aug 2020 11:35:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200721074538.505-6-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfGCViA1b8puglAEz3WxnqYkrqYyMEto5toYfpM9n2g+gfWWbBINTBR4GkFtD8Lq9CXqGzjTfaJa3gu6/5x4uVJrfp6YFBFFH8Q7bpqYxp4BCFGENyq02
 55/GM9SJflSITAwdYuklOz7L1UN/vFnLCwM6nml6ltkDYP4Bhqp/z5rhCfHiW7t4SNQtBxxgJnJnkj323v7aRNZbQ3kAgOHYrrCe+Q2XA3RHB4f3dz+JBNFo
 A04a+lpdQ07euRsNdDx5wNcbs8Yh8G65i0hbT7AbaJAD6eMz/ID3EmlvmcriGeDZPgqPlItqVDG9SfI/L9CbClox/2/ex6v2pB8bU0x3/WF39KJWLm0McOPA
 jNCESRo6JiI8U5dSSTVbpUfEAV+MiBYVvPtzv4D4ScFjgtTPJ74n6pwW60MLI0WM5CTbP5WhGSDqHQn6B694/aav22pWTurXtazejC37T0rc3otxHb7I6x1s
 9ZVHCOClltdEGQ/yFpQQOXLJJvl0BgsF6Rdf7Wc0XuIUs+lp91wW+xFvW4aFASAK4jcmchwea3C/iZ951qyet3TtW0xtOoqYl4MLWX11Q93l7JNdWF7CHxbY
 yU9Rc8RNrFVkw05FpwvovGMh30rYLvsrUZ5IcOoLa9rLHq7pJKeLxPp+hMbGf04Kjpi272ofaycedzmamEisuLLDQdAQsD/h9XoKFPAuJYQIjLFWDVSpifWa
 0V9UERKo21Y=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 21/07/2020 09:45, Stanimir Varbanov wrote:
> Use the standard menu control for frame skip mode in the MFC
> driver. The legacy private menu control is kept for backward
> compatibility.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

> ---
>  drivers/media/platform/s5p-mfc/s5p_mfc_enc.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc_enc.c b/drivers/media/platform/s5p-mfc/s5p_mfc_enc.c
> index 912fe0c5ab18..3092eb6777a5 100644
> --- a/drivers/media/platform/s5p-mfc/s5p_mfc_enc.c
> +++ b/drivers/media/platform/s5p-mfc/s5p_mfc_enc.c
> @@ -261,6 +261,11 @@ static struct mfc_control controls[] = {
>  		.menu_skip_mask = 0,
>  		.default_value = V4L2_MPEG_MFC51_VIDEO_FRAME_SKIP_MODE_DISABLED,
>  	},
> +	{
> +		.id = V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE,
> +		.maximum = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT,
> +		.default_value = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED,
> +	},
>  	{
>  		.id = V4L2_CID_MPEG_MFC51_VIDEO_RC_FIXED_TARGET_BIT,
>  		.type = V4L2_CTRL_TYPE_BOOLEAN,
> @@ -1849,6 +1854,7 @@ static int s5p_mfc_enc_s_ctrl(struct v4l2_ctrl *ctrl)
>  		p->seq_hdr_mode = ctrl->val;
>  		break;
>  	case V4L2_CID_MPEG_MFC51_VIDEO_FRAME_SKIP_MODE:
> +	case V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE:
>  		p->frame_skip_mode = ctrl->val;
>  		break;
>  	case V4L2_CID_MPEG_MFC51_VIDEO_RC_FIXED_TARGET_BIT:
> 

