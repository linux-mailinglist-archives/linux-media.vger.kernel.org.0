Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B0F7E7729
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2019 18:01:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403979AbfJ1RBj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Oct 2019 13:01:39 -0400
Received: from mga02.intel.com ([134.134.136.20]:40367 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730463AbfJ1RBj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Oct 2019 13:01:39 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 28 Oct 2019 10:01:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,240,1569308400"; 
   d="scan'208";a="211488272"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.148]) ([10.7.153.148])
  by orsmga002.jf.intel.com with ESMTP; 28 Oct 2019 10:01:19 -0700
Subject: Re: [PATCH v2] media: aspeed-video: Fix memory leaks in
 aspeed_video_probe
To:     Navid Emamdoost <navid.emamdoost@gmail.com>
Cc:     emamd001@umn.edu, smccaman@umn.edu, kjlu@umn.edu,
        Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>, linux-media@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <d9c04318-586a-bfc2-fce6-6218c6bab1d6@linux.intel.com>
 <20191028165827.24949-1-navid.emamdoost@gmail.com>
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <6450dbb4-aa6f-627d-7e5d-21a20f560d60@linux.intel.com>
Date:   Mon, 28 Oct 2019 10:01:19 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191028165827.24949-1-navid.emamdoost@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/28/2019 9:58 AM, Navid Emamdoost wrote:
> In the implementation of aspeed_video_probe() the allocated memory for
> video should be released if either devm_ioremap_resource()
> or aspeed_video_init() or aspeed_video_setup_video() fails. Replace
> kzalloc() with devm_kzalloc to avoid explicit release for video.
> 
> Fixes: d2b4387f3bdf ("media: platform: Add Aspeed Video Engine driver")
> Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
> ---
> Changes in v2:
> 	-- replace kzalloc with devm_kzalloc based on Jae Hyun Yoo
> suggestion
> 
>   drivers/media/platform/aspeed-video.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index eb12f3793062..2aa8ea2f9824 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -1646,7 +1646,7 @@ static int aspeed_video_probe(struct platform_device *pdev)
>   {
>   	int rc;
>   	struct resource *res;
> -	struct aspeed_video *video = kzalloc(sizeof(*video), GFP_KERNEL);
> +	struct aspeed_video *video = devm_kzalloc(sizeof(*video), GFP_KERNEL);

It can't be compiled. devm_kzalloc should have 3 parameters.

Cheers,

Jae
