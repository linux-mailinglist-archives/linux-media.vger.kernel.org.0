Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DF91E760F
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2019 17:27:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390968AbfJ1Q1a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Oct 2019 12:27:30 -0400
Received: from mga14.intel.com ([192.55.52.115]:4473 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732424AbfJ1Q1a (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Oct 2019 12:27:30 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 28 Oct 2019 09:27:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,240,1569308400"; 
   d="scan'208";a="211478039"
Received: from unknown (HELO [10.7.153.148]) ([10.7.153.148])
  by orsmga002.jf.intel.com with ESMTP; 28 Oct 2019 09:27:29 -0700
Subject: Re: [PATCH] media: aspeed-video: Fix memory leaks in
 aspeed_video_probe
To:     Navid Emamdoost <navid.emamdoost@gmail.com>
Cc:     linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
        kjlu@umn.edu, openbmc@lists.ozlabs.org,
        Eddie James <eajames@linux.ibm.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        emamd001@umn.edu, smccaman@umn.edu,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-kernel@lists.infradead.org
References: <20191026042519.29446-1-navid.emamdoost@gmail.com>
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <d9c04318-586a-bfc2-fce6-6218c6bab1d6@linux.intel.com>
Date:   Mon, 28 Oct 2019 09:27:30 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191026042519.29446-1-navid.emamdoost@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Navid,

On 10/25/2019 9:25 PM, Navid Emamdoost wrote:
> In the implementation of aspeed_video_probe() the allocated memory for
> video should be released in case of failure. Release video if either
> devm_ioremap_resource() or aspeed_video_init() or
> aspeed_video_setup_video() fails.
> 
> Fixes: d2b4387f3bdf ("media: platform: Add Aspeed Video Engine driver")
> Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
> ---
>   drivers/media/platform/aspeed-video.c | 14 ++++++++++----
>   1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index eb12f3793062..8c473356132d 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -1663,18 +1663,24 @@ static int aspeed_video_probe(struct platform_device *pdev)
>   
>   	video->base = devm_ioremap_resource(video->dev, res);
>   
> -	if (IS_ERR(video->base))
> -		return PTR_ERR(video->base);
> +	if (IS_ERR(video->base)) {
> +		rc = PTR_ERR(video->base);
> +		goto free_video;
> +	}
>   
>   	rc = aspeed_video_init(video);
>   	if (rc)
> -		return rc;
> +		goto free_video;
>   
>   	rc = aspeed_video_setup_video(video);
>   	if (rc)
> -		return rc;
> +		goto free_video;
>   
>   	return 0;
> +
> +free_video:
> +	kfree(video);
> +	return rc;
>   }
>   
>   static int aspeed_video_remove(struct platform_device *pdev)
> 

Can we simply change kzalloc in aspeed_video_probe with devm_kzalloc
so that we don't need to take care of freeing of video? I think it would
be more simpler.

Cheers,

Jae
