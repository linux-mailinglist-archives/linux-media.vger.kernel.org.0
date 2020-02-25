Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 841DD16C398
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2020 15:14:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730389AbgBYOOa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Feb 2020 09:14:30 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:58561 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729411AbgBYOOa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Feb 2020 09:14:30 -0500
Received: from [IPv6:2001:420:44c1:2577:a473:ad6c:dd91:35d2]
 ([IPv6:2001:420:44c1:2577:a473:ad6c:dd91:35d2])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 6ayfjo1iFyIme6ayij8jNu; Tue, 25 Feb 2020 15:14:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1582640068; bh=zB8b88rtnkcQM9T5X+KcnbKWzksbLaAn2B3s0+dBGxA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=PZQg+pPo1qIXm3rVZ48G1nerM+hugoKWP6q0NQiEQ8mafW1ycBh8Y5RzsiaZzxA9U
         DT4Oa6kyGlN/qO1vfwaeDWd+uiVMjw+RVK6OWvgPhKpqx6RqkBvuvwhDFYQ5V1NAuQ
         UuQpvV8iIlbmUFznvdVngyFeLerEcJdEN0h+/PZz5jq43LnrSt199u18kDhQX2D7CF
         cI/DlUJ5YLNBnPP5B3xsiRi6VbKgqulsi/QWdDva9Gla5r0zJZcY9A/FS2crGFSW1o
         /3RbTH4YNPycMEStGkuxSvHKYXDWW5HWgMlEzcK0kQ4t5fYEUfUyd8QYUAzKchdd82
         OU5q9V+mEMc6w==
Subject: Re: [PATCH 14/18] media: allegro: handle dependency of bitrate and
 bitrate_peak
To:     Michael Tretter <m.tretter@pengutronix.de>,
        linux-media@vger.kernel.org
Cc:     kernel@pengutronix.de
References: <20200217151358.5695-1-m.tretter@pengutronix.de>
 <20200217151358.5695-15-m.tretter@pengutronix.de>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <270cb6b5-0a4b-667d-1968-aab2e422cfd0@xs4all.nl>
Date:   Tue, 25 Feb 2020 15:14:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200217151358.5695-15-m.tretter@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfCYEOoM1gekz9Yb84nWBRb8S/NimaLJIU/tBb3gD6/3Iu6F18suFBscnAAnsZ0lO9sBUIuguEzro+PQRuAlD2dRgXXUSyScjMT2rhbIhMLkZW0lvd0ft
 6VozHBNCr1M8LyC8WoNu2ujaTTjiNDx34jdGJV/5YWJ4wttIKBmagyf52bSXcyZzhDXY982shYfP7YST74lcXHem06e6SsV8coi0PIg9Ec0qt+0MHoaBCtJd
 wr0cRIO+IsqCfXNO/hNj4s9lAkAlnF38LDaQPRFzrtB0dfO6VnXIgHYCc34T/THrI0Gi/YDxFkRiNtHgYjiJqQEz5Gx3uY1IEja+4StElvBNFALv9H8bmKr1
 DoTG/CvvXbiiKoukatqLMIhEWtDrvQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2/17/20 4:13 PM, Michael Tretter wrote:
> The peak bitrate must not be smaller than the configured bitrate. Update
> the other control whenever one of the controls changes to reflect this
> dependency.
> 
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
>  drivers/staging/media/allegro-dvt/allegro-core.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/staging/media/allegro-dvt/allegro-core.c b/drivers/staging/media/allegro-dvt/allegro-core.c
> index 8c26158eab93..cedb09ea649f 100644
> --- a/drivers/staging/media/allegro-dvt/allegro-core.c
> +++ b/drivers/staging/media/allegro-dvt/allegro-core.c
> @@ -2403,9 +2403,15 @@ static int allegro_s_ctrl(struct v4l2_ctrl *ctrl)
>  		break;
>  	case V4L2_CID_MPEG_VIDEO_BITRATE:
>  		channel->bitrate = ctrl->val;
> +		if (channel->bitrate > channel->bitrate_peak)
> +			__v4l2_ctrl_s_ctrl(channel->mpeg_video_bitrate_peak,
> +					   channel->bitrate);
>  		break;
>  	case V4L2_CID_MPEG_VIDEO_BITRATE_PEAK:
>  		channel->bitrate_peak = ctrl->val;
> +		if (channel->bitrate_peak < channel->bitrate)
> +			__v4l2_ctrl_s_ctrl(channel->mpeg_video_bitrate,
> +					   channel->bitrate_peak);
>  		break;
>  	case V4L2_CID_MPEG_VIDEO_H264_CPB_SIZE:
>  		channel->cpb_size = ctrl->val;
> 

In the case of controls that are depend on one another you use a
control cluster and implement try_ctrl. See e.g. drivers/media/usb/hdpvr/hdpvr-video.c
which does the same thing.

Documentation on control clusters is here:

https://hverkuil.home.xs4all.nl/spec/kapi/v4l2-controls.html#control-clusters

Regards,

	Hans
