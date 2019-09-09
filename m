Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E3C4AD58B
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2019 11:19:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389784AbfIIJTl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Sep 2019 05:19:41 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:45311 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728862AbfIIJTl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 9 Sep 2019 05:19:41 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 7FpfiPa1R9b7T7Fpiieo8M; Mon, 09 Sep 2019 11:19:39 +0200
Subject: Re: [PATCH] vivid: Set vid_cap_streaming and vid_out_streaming to
 true
To:     Vandana BN <bnvandana@gmail.com>, linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <20190909091147.6596-1-bnvandana@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <841cf7a9-2e5f-17c8-1595-56c911b7f35d@xs4all.nl>
Date:   Mon, 9 Sep 2019 11:19:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190909091147.6596-1-bnvandana@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfKop+OlePfXkyrFlPxVo0bBBreI0Y6Pu99s8JBr3TKF6GNhuNStx2XLpJ6fTz/vRIiERRiXW+jryTVi/5G3MKceigrbB7AqTY1M84DwRtdpycEwSDpKl
 fC2wiD/5tmmuOJqHsz2L5GA72HSoQpvMiYSQL8S/HxRvo/w+RR9srP9AjVQmVx8K/uCe1oY0cL7VkQhYbEAtEp09nyAMpHs7FsnlKxuHfUes/xjeQlwjy9zZ
 X0anjdECZtB7T/eJceMRt4WVk/DSwbTP0X7Fg+JuUjE=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Vandana,

The patch is right, but the commit log can be improved:

On 9/9/19 11:11 AM, Vandana BN wrote:
> when vbi/meta stream is started, followed by video streaming,

Since this patch will be applied before the patch that adds metadata,
you can't refer to meta yet. Just stick to vbi.

Also: 'when' -> 'When'

> the vid_cap_streaming and vid_out_streaming were not being set to true,
> which would cause the video stream to stop when vbi/meta stream is stopped.

Drop /meta here as well.

> This patch allows to set vid_cap_streaming and vid_out_streaming to true.

You can add a line here saying:

"According to Hans Verkuil it appears that these 'if (dev->kthread_vid_cap)'
checks are a left-over from the original vivid development and should never
have been there."

> 
> Signed-off-by: Vandana BN <bnvandana@gmail.com>

Add this line:

Cc: <stable@vger.kernel.org>      # for v3.18 and up

Since this is a fix valid for all kernels that support vivid.

Regards,

	Hans

> ---
>  drivers/media/platform/vivid/vivid-vid-cap.c | 3 ---
>  drivers/media/platform/vivid/vivid-vid-out.c | 3 ---
>  2 files changed, 6 deletions(-)
> 
> diff --git a/drivers/media/platform/vivid/vivid-vid-cap.c b/drivers/media/platform/vivid/vivid-vid-cap.c
> index 8cbaa0c998ed..2d030732feac 100644
> --- a/drivers/media/platform/vivid/vivid-vid-cap.c
> +++ b/drivers/media/platform/vivid/vivid-vid-cap.c
> @@ -223,9 +223,6 @@ static int vid_cap_start_streaming(struct vb2_queue *vq, unsigned count)
>  	if (vb2_is_streaming(&dev->vb_vid_out_q))
>  		dev->can_loop_video = vivid_vid_can_loop(dev);
>  
> -	if (dev->kthread_vid_cap)
> -		return 0;
> -
>  	dev->vid_cap_seq_count = 0;
>  	dprintk(dev, 1, "%s\n", __func__);
>  	for (i = 0; i < VIDEO_MAX_FRAME; i++)
> diff --git a/drivers/media/platform/vivid/vivid-vid-out.c b/drivers/media/platform/vivid/vivid-vid-out.c
> index 148b663a6075..a0364ac497f9 100644
> --- a/drivers/media/platform/vivid/vivid-vid-out.c
> +++ b/drivers/media/platform/vivid/vivid-vid-out.c
> @@ -161,9 +161,6 @@ static int vid_out_start_streaming(struct vb2_queue *vq, unsigned count)
>  	if (vb2_is_streaming(&dev->vb_vid_cap_q))
>  		dev->can_loop_video = vivid_vid_can_loop(dev);
>  
> -	if (dev->kthread_vid_out)
> -		return 0;
> -
>  	dev->vid_out_seq_count = 0;
>  	dprintk(dev, 1, "%s\n", __func__);
>  	if (dev->start_streaming_error) {
> 

