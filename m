Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C015B18AAD9
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 03:48:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726735AbgCSCsK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 22:48:10 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58096 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726623AbgCSCsK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 22:48:10 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8639B5F;
        Thu, 19 Mar 2020 03:48:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584586088;
        bh=n5ihp3/vijS6PEcPg3eV+Ne/bzUE1d1Lx+I/LHAea2s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=o9CM/WBmiaC6HPwSt9mNGb3VTPSjLWrZD/yFkJa/tjJis56ZtortIf53GfBe/fQ1Q
         /O8ZZODe1cqaqvgm09usR4oQa318GWN+Ph1fG5uetezHegDcS9DltgTm/anW7XtUSK
         OXpX9n/Jo/7kYFy0ok7N6E/0EfiM/txGko+zn6BE=
Date:   Thu, 19 Mar 2020 04:48:03 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Helen Koike <helen.koike@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] v4l2-compliance: add tests for V4L2_CAP_IO_MC
Message-ID: <20200319024803.GH27375@pendragon.ideasonboard.com>
References: <20200318132722.3089925-1-niklas.soderlund+renesas@ragnatech.se>
 <20200318132722.3089925-3-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200318132722.3089925-3-niklas.soderlund+renesas@ragnatech.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

Thank you for the patch.

On Wed, Mar 18, 2020 at 02:27:22PM +0100, Niklas Söderlund wrote:
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

I'm not sure how to parse this message (and the equivalent below). And I
think this check belongs to a test dedicated to V4L2_CAP_IO_MC,
verifying that only video and metadata nodes set V4L2_CAP_IO_MC isn't
related to testing inputs. Same below.

> +
> +		if (!node->is_meta && node->inputs != 1)
> +			return fail("media device controlled input have %d inputs\n", node->inputs);

This part belongs here, but the message needs to be improved, it's both
hard to parse, and not very informative for the user. Same below.

Good news, with the VIDIOC_ENUM_FMT extension that depends on
V4L2_CAP_IO_MC, we'll have more test cases for V4L2_CAP_IO_MC ;-)

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
> +	}
>  	return 0;
>  }
>  

-- 
Regards,

Laurent Pinchart
