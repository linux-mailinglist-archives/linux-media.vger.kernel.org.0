Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50921E77E5
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2019 18:55:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391110AbfJ1Rz0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Oct 2019 13:55:26 -0400
Received: from mga03.intel.com ([134.134.136.65]:65313 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730395AbfJ1RzZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Oct 2019 13:55:25 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 28 Oct 2019 10:55:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,240,1569308400"; 
   d="scan'208";a="211502982"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.148]) ([10.7.153.148])
  by orsmga002.jf.intel.com with ESMTP; 28 Oct 2019 10:55:24 -0700
Subject: Re: [PATCH v3] media: aspeed-video: Fix memory leaks in
 aspeed_video_probe
To:     Navid Emamdoost <navid.emamdoost@gmail.com>
Cc:     linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
        kjlu@umn.edu, openbmc@lists.ozlabs.org,
        Eddie James <eajames@linux.ibm.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        emamd001@umn.edu, smccaman@umn.edu,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-kernel@lists.infradead.org
References: <da959329-aa40-b6e7-dcc9-48183a8da716@linux.intel.com>
 <20191028171838.28533-1-navid.emamdoost@gmail.com>
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <57550f1e-87b8-79c4-b1d6-7672b1ce11dc@linux.intel.com>
Date:   Mon, 28 Oct 2019 10:55:24 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191028171838.28533-1-navid.emamdoost@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/28/2019 10:18 AM, Navid Emamdoost wrote:
> In the implementation of aspeed_video_probe() the allocated memory for
> video should be released if either devm_ioremap_resource()
> or aspeed_video_init() or aspeed_video_setup_video() fails. Replace
> kzalloc() with devm_kzalloc to avoid explicit release for video.
> 
> Fixes: d2b4387f3bdf ("media: platform: Add Aspeed Video Engine driver")
> Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
> ---
> Changes in v3:
> 	-- fix call to devm_kzalloc()

Better keep all change history at here.

> ---
>   drivers/media/platform/aspeed-video.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index eb12f3793062..70797b41447c 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -1646,7 +1646,8 @@ static int aspeed_video_probe(struct platform_device *pdev)
>   {
>   	int rc;
>   	struct resource *res;
> -	struct aspeed_video *video = kzalloc(sizeof(*video), GFP_KERNEL);
> +	struct aspeed_video *video =
> +		devm_kzalloc(&pdev->dev, sizeof(*video), GFP_KERNEL);

For a case of assignment in definition section, let it go over the 80
chars.

With this fixed:

Reviewed-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>

>   	if (!video)
>   		return -ENOMEM;
> 
