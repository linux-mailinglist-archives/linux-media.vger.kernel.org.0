Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50D521F17E2
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2020 13:33:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729543AbgFHLdc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Jun 2020 07:33:32 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:48327 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729310AbgFHLdb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Jun 2020 07:33:31 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id iG1tjQeHJCKzeiG1wjlvME; Mon, 08 Jun 2020 13:33:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1591616009; bh=2RM5mDdaGap2T8ENTy0eyuoJhcBfWd/GTOz/2yQh9nA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=FX7v5dVXhu47hdSnY6jpwwKX3BQMXN1TDeuN6wr0+E0knGIGMi2I9hI+PXqJjj4/s
         BjBZbOpOdbBoakSPcjYpWigzcpSjxYsbTauNQ4uX3rpXhMJfXXX/OSNLw7MBgqXwRa
         cogEIAl0sZ5bieqotx6Z879kbBDFNw0f9jYDQJbyUaaL0mnALNkbMz6Mr1tFHvDLa8
         2tm3BXU0dYzNSBhQJmMIHIxmL2fCTML0+sH5ZfRobQUtiR/c+7FUct71JUrghazMey
         kk6QByyYnDQkXOoUZh0JC0GaO4c+y3JIVK0htIxhNrtiWUnYS9tWnVVztkHrx3yeq3
         WgirYbgZjI/PQ==
Subject: Re: [RFC v4 1/8] media: staging: rkisp1: rsz: supported formats are
 the isp's src formats, not sink formats
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     helen.koike@collabora.com, ezequiel@collabora.com,
        kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org, skhan@linuxfoundation.org,
        p.zabel@pengutronix.de
References: <20200605172625.19777-1-dafna.hirschfeld@collabora.com>
 <20200605172625.19777-2-dafna.hirschfeld@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <a929b94b-ab8b-42cc-6ffa-d7a3e8a8332b@xs4all.nl>
Date:   Mon, 8 Jun 2020 13:33:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200605172625.19777-2-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJj5s9wfhixK5lOkp6EP0wQpt5SKnIr5SeGyfJ2TMEBPC2pBLM94a/EQpM4uci5dNRz6PASytFFDpSdkh6IUCrIouardLtpLDnyAYz6OzVhurIV3YHLR
 bGg51BaLc1FQv0y2pwV/tJTemobVbh/3mo6t6xYBBfyLMS3H54K0si+wM3t8OW/6RQpSS+ZtVbn4LbawjcXcD/8WXOvKaZmVnpd2942sV0WPY7bvpV6MxwII
 W8huRh/A8vBlibVoIOphxwdhCJGfnSJLwnWVnolZwHYqRjGjbpx2OsQ+BCCds36wl+OjeCLqYODCHFFVoEGaPED0a809OY35yLrX1s+eJ7wwjH1um6q3uhP+
 jG4Y+gxOROHA6rM1Ti+bwj+QCX/vANoeSoVRDvwWUwL28hSDZ7E9mN8dBZHjchdbb4hQDJPIEMgnzB+Q7d51RLbbrdWvOs68t8eRBlV24M2Tw+MiHnsgAo1+
 T5JIk/ZbWHdB1D1YI9Co46PTKO9wvt6RoLO5ONcbLD+LOFXa7ozHoFbM3pZwYSuf+dhSw1yZCghMq+gNDh3NJCxPmSXvfFZ8qMwRHyCyluowSoUGoc3rQy8Q
 AhBG6BgBUpImlBksX6AJl47bEHazzgbjp3hVG7eMBqe98A==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05/06/2020 19:26, Dafna Hirschfeld wrote:
> The rkisp1_resizer's enum callback 'rkisp1_rsz_enum_mbus_code'
> calls the enum callback of the 'rkisp1_isp' on it's video sink pad.
> This is a bug, the resizer should support the same formats
> supported by the 'rkisp1_isp' on the source pad (not the sink pad).
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Please include Helen's Ack when you post a v5.

(https://patchwork.linuxtv.org/patch/64291/)

For that matter, shouldn't this be a 'Fixes:' patch with a Cc to stable?

Regards,

	Hans

> ---
>  drivers/staging/media/rkisp1/rkisp1-resizer.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-resizer.c
> index d049374413dc..d64c064bdb1d 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-resizer.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
> @@ -437,8 +437,8 @@ static int rkisp1_rsz_enum_mbus_code(struct v4l2_subdev *sd,
>  	u32 pad = code->pad;
>  	int ret;
>  
> -	/* supported mbus codes are the same in isp sink pad */
> -	code->pad = RKISP1_ISP_PAD_SINK_VIDEO;
> +	/* supported mbus codes are the same in isp video src pad */
> +	code->pad = RKISP1_ISP_PAD_SOURCE_VIDEO;
>  	ret = v4l2_subdev_call(&rsz->rkisp1->isp.sd, pad, enum_mbus_code,
>  			       &dummy_cfg, code);
>  
> 

