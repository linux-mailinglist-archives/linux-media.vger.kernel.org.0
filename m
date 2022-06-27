Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBEED55DEDF
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 15:29:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233626AbiF0Im3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jun 2022 04:42:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233615AbiF0Im2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jun 2022 04:42:28 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AA6A631D;
        Mon, 27 Jun 2022 01:42:26 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7236447C;
        Mon, 27 Jun 2022 10:42:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656319344;
        bh=BfYcDxBDehyo3BvTO3RVLFievKApZzPs29tBDKI3TPo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gCxQNzj8txqtwGuReyYI/lh283jEy7VXyGSCU7Rni8CRdNSgtiUbs79SKXUmw0MzG
         VphrEZiLkDiLe+7GWA1TDQxlqVJX0OTQuUCFdRJcA2xxCD4mO53tFKkMcurryVeGMH
         JZDkWBUKcQXDvFls9Y0XlzuCLWNXUcv7php/5jyg=
Date:   Mon, 27 Jun 2022 11:42:06 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sebastian Fricke <sebastian.fricke@collabora.com>
Cc:     linux-media@vger.kernel.org, kernel@collabora.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Daniel Scally <djrscally@gmail.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: Fix incorrect P010 chroma order description
Message-ID: <YrltXpTYqMZK/AZV@pendragon.ideasonboard.com>
References: <20220627071224.16787-1-sebastian.fricke@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220627071224.16787-1-sebastian.fricke@collabora.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sebastian,

Thank you for the patch.

On Mon, Jun 27, 2022 at 09:12:23AM +0200, Sebastian Fricke wrote:
> The chroma order of P010 is `CbCr`,
> match with the descriptions in `include/uapi/linux/videodev2.h` and the
> documentation.
> 
> Fixes: 5374d8fb75f31 Add P010 video format

This should be

Fixes: 5374d8fb75f3 ("media: Add P010 video format")

I recommend adding the following to your ~/.gitconfig:

[pretty]
	fixes = Fixes: %h (\"%s\")

You can then use `git show --pretty=fixes -s` to generate the right
Fixes: tag. If you fix lots of bugs, an alias in your ~/.bashrc is also
useful:

gpf() {
	git show --pretty=fixes -s ${1:-HEAD} | xclip -selection clipboard
}

> Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index e2526701294e..e03362c8aef9 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1306,7 +1306,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_PIX_FMT_NV61:		descr = "Y/CrCb 4:2:2"; break;
>  	case V4L2_PIX_FMT_NV24:		descr = "Y/CbCr 4:4:4"; break;
>  	case V4L2_PIX_FMT_NV42:		descr = "Y/CrCb 4:4:4"; break;
> -	case V4L2_PIX_FMT_P010:		descr = "10-bit Y/CrCb 4:2:0"; break;
> +	case V4L2_PIX_FMT_P010:		descr = "10-bit Y/CbCr 4:2:0"; break;
>  	case V4L2_PIX_FMT_NV12_4L4:	descr = "Y/CbCr 4:2:0 (4x4 Linear)"; break;
>  	case V4L2_PIX_FMT_NV12_16L16:	descr = "Y/CbCr 4:2:0 (16x16 Linear)"; break;
>  	case V4L2_PIX_FMT_NV12_32L32:   descr = "Y/CbCr 4:2:0 (32x32 Linear)"; break;

-- 
Regards,

Laurent Pinchart
