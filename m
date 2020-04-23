Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B4911B5861
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2020 11:40:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726985AbgDWJkt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 05:40:49 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:37339 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726669AbgDWJkt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 05:40:49 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id RYLajLPzh7xncRYLdjQ0mN; Thu, 23 Apr 2020 11:40:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1587634847; bh=X9jIIE53Q0GK6WoPEeXiidEZB/kG+LH0noxQldRb5Co=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Tc85sXmap73Eg62GowEg1coB+S6XPU8TgnkGGpSaEPxpHokAtib92mH3OQGUAYoXt
         gbnBm7M3Upjxq9rF8hEutscBy9TUK+Ftc5v8FPtJNfmotfBDDLc2iYCVEUGvYwyg3v
         x0gYNtB5vlNsNv/nG/PMM9zbbQ0Y1WC/c3Tu0V2gbjG8no6xG3rv3q5hwnng/1tlk0
         SsWD1G9lDKmqZSgzwCXkXPW6a8j/2buehJCXIFC1h1S19rs4AIf5TOdX09eZ0mlBSm
         /gyBZLrBTow/ZH9nhAs4CNA8N+5pCRSm6UEgF/hpwVdPF6Rfutc7WPH1jBTUsrUFa9
         skzYCr6qmvXPw==
Subject: Re: [PATCH 2/2] v4l2-compliance: add tests for V4L2_CAP_IO_MC
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Helen Koike <helen.koike@collabora.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
References: <20200318132722.3089925-1-niklas.soderlund+renesas@ragnatech.se>
 <20200318132722.3089925-3-niklas.soderlund+renesas@ragnatech.se>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <d67fda94-68b0-a3ac-3e1b-42aa7d42d884@xs4all.nl>
Date:   Thu, 23 Apr 2020 11:40:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200318132722.3089925-3-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfDrOkPlo79Jo7Hs2PUvPtQqb3/6xYDzuZ+0+PqenuIFPozUNldwZeG5RGxMU1nzee4ZDmY63DIBUzqqNqJjZZxgoLk1FjStENytihv9lWBlwTIvI/lt3
 cDIwINOG/CGZ3Zolbj4hNyq/fC0N/RISLjtBV911IU/0IiqbWKpOrOJAtJK+QomWxQawrWmecYHK9ix1uV12y2B/p5DER8itWCjNE7DqJpUhDuqITaWs03Vd
 Sw49n2dLCoHKZjN+mFXEU5yB+j7SrT5+QBmEaEBPWbW8jC/7LFEsFMO9j+fQ6FBJmNyf72RRXI2ZQJ641S1zhCrk3B8ikPBQ/VyCPKM5nEOD2p4KA6btQCvP
 huf9dF9aQzkihdw/tVQxA11mQnK+/2ZP6JWhoLNG3BsK+2hgDH0s0OBsN4Ad/bK9/jOmmYQ+
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18/03/2020 14:27, Niklas Söderlund wrote:
> Add tests to check the behavior of VIDIOC_ENUM{INPUT,OUTPUT},
> VIDIOC_G_{INPUT,OUTPUT} and VIDIOC_S_{INPUT,OUTPUT} when the
> V4L2_CAP_IO_MC  is set.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  utils/v4l2-compliance/v4l2-test-input-output.cpp | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/utils/v4l2-compliance/v4l2-test-input-output.cpp b/utils/v4l2-compliance/v4l2-test-input-output.cpp
> index 2bf338e6f6d7ec5a..bf937abec320f88a 100644
> --- a/utils/v4l2-compliance/v4l2-test-input-output.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-input-output.cpp
> @@ -466,6 +466,13 @@ int testInput(struct node *node)
>  	if (!node->inputs && node->has_inputs)
>  		return fail("no inputs found, but input capabilities set\n");
>  	fail_on_test(node->is_m2m && node->inputs > 1);
> +	if (node->g_caps() & V4L2_CAP_IO_MC) {
> +		if (!node->is_video && !node->is_meta)
> +			return fail("media device controls none video or meta input\n");
> +
> +		if (!node->is_meta && node->inputs != 1)
> +			return fail("media device controlled input have %d inputs\n", node->inputs);

Just replace this with:

		fail_on_test(!node->is_video && !node->is_meta);
		fail_on_test(node->inputs != 1);

> +	}
>  	return 0;
>  }
>  
> @@ -836,6 +843,13 @@ int testOutput(struct node *node)
>  	if (!node->outputs && node->has_outputs)
>  		return fail("no outputs found, but output capabilities set\n");
>  	fail_on_test(node->is_m2m && node->outputs > 1);
> +	if (node->g_caps() & V4L2_CAP_IO_MC) {
> +		if (!node->is_video && !node->is_meta)
> +			return fail("media device controls none video or meta output\n");
> +
> +		if (!node->is_meta && node->outputs != 1)
> +			return fail("media device controlled output have %d outputs\n", node->outputs);

Ditto.

> +	}
>  	return 0;
>  }
>  
> 

Regards,

	Hans
