Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACD32368DC
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 02:53:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbfFFAxb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jun 2019 20:53:31 -0400
Received: from mga09.intel.com ([134.134.136.24]:59344 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726532AbfFFAxb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 5 Jun 2019 20:53:31 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Jun 2019 17:53:31 -0700
X-ExtLoop1: 1
Received: from ntle-mobl7.amr.corp.intel.com (HELO [10.254.36.100]) ([10.254.36.100])
  by fmsmga006.fm.intel.com with ESMTP; 05 Jun 2019 17:53:30 -0700
Subject: Re: [PATCH v3 10/10] media: aspeed: add a workaround to fix a silicon
 bug
To:     Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc:     linux-aspeed@lists.ozlabs.org, linux-media@vger.kernel.org
References: <20190531221548.14757-1-jae.hyun.yoo@linux.intel.com>
 <20190531221548.14757-11-jae.hyun.yoo@linux.intel.com>
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <38a8ca27-9991-fe8c-4d89-abdaacd4130b@linux.intel.com>
Date:   Wed, 5 Jun 2019 17:53:29 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190531221548.14757-11-jae.hyun.yoo@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Eddie,

All patches in this series were queued to linux/media tree except this
one. Can you please review this patch?

Thanks,
Jae

On 5/31/2019 3:15 PM, Jae Hyun Yoo wrote:
> AST2500 silicon revision A1 and A2 have a silicon bug which causes
> extremly long capturing time on specific resolutions (1680 width).
> To fix the bug, this commit adjusts the capturing window register
> setting to 1728 if detected width is 1680. The compression window
> register setting will be kept as the original width so output
> result will be the same.
> 
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
> v2 -> v3:
>   Added more detail comments why the value 1728 is picked.
> 
> v1 -> v2:
>   New.
> 
>   drivers/media/platform/aspeed-video.c | 28 ++++++++++++++++++++-------
>   1 file changed, 21 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index ba093096a5a7..f899ac3b4a61 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -824,8 +824,29 @@ static void aspeed_video_set_resolution(struct aspeed_video *video)
>   	struct v4l2_bt_timings *act = &video->active_timings;
>   	unsigned int size = act->width * act->height;
>   
> +	/* Set capture/compression frame sizes */
>   	aspeed_video_calc_compressed_size(video, size);
>   
> +	if (video->active_timings.width == 1680) {
> +		/*
> +		 * This is a workaround to fix a silicon bug on A1 and A2
> +		 * revisions. Since it doesn't break capturing operation of
> +		 * other revisions, use it for all revisions without checking
> +		 * the revision ID. It picked 1728 which is a very next
> +		 * 64-pixels aligned value to 1680 to minimize memory bandwidth
> +		 * and to get better access speed from video engine.
> +		 */
> +		aspeed_video_write(video, VE_CAP_WINDOW,
> +				   1728 << 16 | act->height);
> +		size += (1728 - 1680) * video->active_timings.height;
> +	} else {
> +		aspeed_video_write(video, VE_CAP_WINDOW,
> +				   act->width << 16 | act->height);
> +	}
> +	aspeed_video_write(video, VE_COMP_WINDOW,
> +			   act->width << 16 | act->height);
> +	aspeed_video_write(video, VE_SRC_SCANLINE_OFFSET, act->width * 4);
> +
>   	/* Don't use direct mode below 1024 x 768 (irqs don't fire) */
>   	if (size < DIRECT_FETCH_THRESHOLD) {
>   		aspeed_video_write(video, VE_TGS_0,
> @@ -842,13 +863,6 @@ static void aspeed_video_set_resolution(struct aspeed_video *video)
>   		aspeed_video_update(video, VE_CTRL, 0, VE_CTRL_DIRECT_FETCH);
>   	}
>   
> -	/* Set capture/compression frame sizes */
> -	aspeed_video_write(video, VE_CAP_WINDOW,
> -			   act->width << 16 | act->height);
> -	aspeed_video_write(video, VE_COMP_WINDOW,
> -			   act->width << 16 | act->height);
> -	aspeed_video_write(video, VE_SRC_SCANLINE_OFFSET, act->width * 4);
> -
>   	size *= 4;
>   
>   	if (size != video->srcs[0].size) {
> 
