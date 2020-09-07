Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40B5025FF4F
	for <lists+linux-media@lfdr.de>; Mon,  7 Sep 2020 18:30:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729854AbgIGQa0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Sep 2020 12:30:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729840AbgIGO1P (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Sep 2020 10:27:15 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 381F7C061575
        for <linux-media@vger.kernel.org>; Mon,  7 Sep 2020 07:19:38 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 8CE5B296466
Subject: Re: [PATCH v4 07/10] media: staging: rkisp1: rsz: enumerate the
 formats on the src pad according to the capture
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
References: <20200901111612.10552-1-dafna.hirschfeld@collabora.com>
 <20200901111612.10552-8-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <bfb4d1f8-eeaf-9f5e-7007-09011340193f@collabora.com>
Date:   Mon, 7 Sep 2020 11:19:28 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200901111612.10552-8-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 9/1/20 8:16 AM, Dafna Hirschfeld wrote:
> Currently the resizer outputs the same media bus format
> as the input. This is wrong since the resizer is also used
> to downscale YUV formats. This patch changes the enumeration
> of the supported formats. The supported formats on the sink pad
> should be taken from the isp entity and the supported formats on
> the source pad should be taken from the capture entity.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks
Helen

> ---
>  drivers/staging/media/rkisp1/rkisp1-resizer.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-resizer.c
> index 066d22096a7d..0e4a2c931ab0 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-resizer.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
> @@ -437,6 +437,17 @@ static int rkisp1_rsz_enum_mbus_code(struct v4l2_subdev *sd,
>  	u32 pad = code->pad;
>  	int ret;
>  
> +	if (code->pad == RKISP1_RSZ_PAD_SRC) {
> +		/* supported mbus codes on the src are the same as in the capture */
> +		struct rkisp1_capture *cap = &rsz->rkisp1->capture_devs[rsz->id];
> +
> +		return rkisp1_cap_enum_mbus_codes(cap, code);
> +	}
> +
> +	/*
> +	 * The selfpath capture doesn't support bayer formats. Therefore the selfpath resizer
> +	 * should support only YUV422 on the sink pad
> +	 */
>  	if (rsz->id == RKISP1_SELFPATH) {
>  		if (code->index > 0)
>  			return -EINVAL;
> @@ -444,7 +455,7 @@ static int rkisp1_rsz_enum_mbus_code(struct v4l2_subdev *sd,
>  		return 0;
>  	}
>  
> -	/* supported mbus codes are the same in isp video src pad */
> +	/* supported mbus codes on the sink pad are the same as isp src pad */
>  	code->pad = RKISP1_ISP_PAD_SOURCE_VIDEO;
>  	ret = v4l2_subdev_call(&rsz->rkisp1->isp.sd, pad, enum_mbus_code,
>  			       &dummy_cfg, code);
> 
