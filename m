Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE93A28E7F2
	for <lists+linux-media@lfdr.de>; Wed, 14 Oct 2020 22:41:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387670AbgJNUlM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Oct 2020 16:41:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387591AbgJNUlL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Oct 2020 16:41:11 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B46F7C061755
        for <linux-media@vger.kernel.org>; Wed, 14 Oct 2020 13:41:11 -0700 (PDT)
Received: from [IPv6:2804:14c:483:7f66::1004] (unknown [IPv6:2804:14c:483:7f66::1004])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B168C1F45611;
        Wed, 14 Oct 2020 21:41:06 +0100 (BST)
Subject: Re: [PATCH] v4l2-compliance: skip dimentions tests for media bus
 format MEDIA_BUS_FMT_METADATA_FIXED
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
References: <20200922171933.3830-1-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <ee3c92ea-8f1f-477e-4f16-d8a6b8c5918f@collabora.com>
Date:   Wed, 14 Oct 2020 17:41:02 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20200922171933.3830-1-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 9/22/20 2:19 PM, Dafna Hirschfeld wrote:
> The media bus format code MEDIA_BUS_FMT_METADATA_FIXED
> is used for metadata formats that are not configurable
> from userspace and therefore may have any value for
> width and height. So skip width and height tests for
> this format.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

lgtm

Reviewed-by: Helen Koike <helen.koike@collabora.com>

Thanks
Helen

> ---
> note, this patch should be applied after updating the header
> include/linux/media-bus-format.h to include that new format.
> ---
>  utils/v4l2-compliance/v4l2-test-subdevs.cpp | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/utils/v4l2-compliance/v4l2-test-subdevs.cpp b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
> index ec3ef169..f60853e3 100644
> --- a/utils/v4l2-compliance/v4l2-test-subdevs.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
> @@ -300,8 +300,10 @@ int testSubDevFrameInterval(struct node *node, unsigned pad)
>  static int checkMBusFrameFmt(struct node *node, struct v4l2_mbus_framefmt &fmt)
>  {
>  	fail_on_test(check_0(fmt.reserved, sizeof(fmt.reserved)));
> -	fail_on_test(fmt.width == 0 || fmt.width > 65536);
> -	fail_on_test(fmt.height == 0 || fmt.height > 65536);
> +	if (fmt.code != MEDIA_BUS_FMT_METADATA_FIXED) {
> +		fail_on_test(fmt.width == 0 || fmt.width > 65536);
> +		fail_on_test(fmt.height == 0 || fmt.height > 65536);
> +	}
>  	fail_on_test(fmt.code == 0 || fmt.code == ~0U);
>  	fail_on_test(fmt.field == ~0U);
>  	if (!node->is_passthrough_subdev) {
> 
