Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F5D729FCD7
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 05:51:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725790AbgJ3EvV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Oct 2020 00:51:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725771AbgJ3EvU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Oct 2020 00:51:20 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A20EBC0613CF
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2020 21:51:20 -0700 (PDT)
Received: from [IPv6:2804:14c:483:7e3e::1005] (unknown [IPv6:2804:14c:483:7e3e::1005])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 46FCC1F4590E;
        Fri, 30 Oct 2020 04:51:16 +0000 (GMT)
Subject: Re: [PATCH v4l-utils] v4l2-compliance: don't test pad's dimensions if
 it's MEDIA_PAD_FL_METADATA
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, laurent.pinchart@ideasonboard.com
References: <20200325214357.30722-1-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <f59a3e2b-ec48-01c2-2bdf-52526ffa2662@collabora.com>
Date:   Fri, 30 Oct 2020 01:51:11 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20200325214357.30722-1-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On 3/25/20 6:43 PM, Dafna Hirschfeld wrote:
> Pads with the flag MEDIA_PAD_FL_METADATA transmit metadata
> which has no dimension, so don't test the width and hight
> returned by S/G_FMT for that pads.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
> This patch completes the patchset sent to linux-media:
> "media: staging: rkisp1: Fix formats for metadata pads"
> https://patchwork.kernel.org/project/linux-media/list/?series=261673
> It compiles only when the media.h file is synced with
> this patchset so that the flag MEDIA_PAD_FL_METADATA
> is added.
> 
>  utils/v4l2-compliance/v4l2-test-subdevs.cpp | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/utils/v4l2-compliance/v4l2-test-subdevs.cpp b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
> index 489639fb..ca527529 100644
> --- a/utils/v4l2-compliance/v4l2-test-subdevs.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
> @@ -305,11 +305,13 @@ int testSubDevFrameInterval(struct node *node, unsigned pad)
>  	return 0;
>  }
>  
> -static int checkMBusFrameFmt(struct node *node, struct v4l2_mbus_framefmt &fmt)
> +static int checkMBusFrameFmt(struct node *node, struct v4l2_mbus_framefmt &fmt, unsigned pad)
>  {
>  	fail_on_test(check_0(fmt.reserved, sizeof(fmt.reserved)));
> -	fail_on_test(fmt.width == 0 || fmt.width > 65536);
> -	fail_on_test(fmt.height == 0 || fmt.height > 65536);
> +	if (!(node->pads[pad].flags & MEDIA_PAD_FL_METADATA)) {

I was wondering if instead of checking the flag type, we shouldn't be checking the
code for MEDIA_BUS_FMT_METADATA_FIXED.


Regards,
Helen

> +		fail_on_test(fmt.width == 0 || fmt.width > 65536);
> +		fail_on_test(fmt.height == 0 || fmt.height > 65536);
> +	}
>  	fail_on_test(fmt.code == 0 || fmt.code == ~0U);
>  	fail_on_test(fmt.field == ~0U);
>  	if (!node->is_passthrough_subdev) {
> @@ -353,7 +355,7 @@ int testSubDevFormat(struct node *node, unsigned which, unsigned pad)
>  	fail_on_test(check_0(fmt.reserved, sizeof(fmt.reserved)));
>  	fail_on_test(fmt.which != which);
>  	fail_on_test(fmt.pad != pad);
> -	fail_on_test(checkMBusFrameFmt(node, fmt.format));
> +	fail_on_test(checkMBusFrameFmt(node, fmt.format, pad));
>  	s_fmt = fmt;
>  	memset(s_fmt.reserved, 0xff, sizeof(s_fmt.reserved));
>  	memset(s_fmt.format.reserved, 0xff, sizeof(s_fmt.format.reserved));
> @@ -366,7 +368,7 @@ int testSubDevFormat(struct node *node, unsigned which, unsigned pad)
>  		return 0;
>  	}
>  	fail_on_test(check_0(s_fmt.reserved, sizeof(s_fmt.reserved)));
> -	fail_on_test(checkMBusFrameFmt(node, s_fmt.format));
> +	fail_on_test(checkMBusFrameFmt(node, s_fmt.format, pad));
>  	fail_on_test(s_fmt.format.width != fmt.format.width);
>  	fail_on_test(s_fmt.format.height != fmt.format.height);
>  	fail_on_test(s_fmt.format.code != fmt.format.code);
> 
