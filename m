Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7E995A00B1
	for <lists+linux-media@lfdr.de>; Wed, 24 Aug 2022 19:48:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239002AbiHXRsM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Aug 2022 13:48:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235764AbiHXRsL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Aug 2022 13:48:11 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC42882750
        for <linux-media@vger.kernel.org>; Wed, 24 Aug 2022 10:48:10 -0700 (PDT)
Received: from pyrite.rasen.tech (unknown [12.184.218.20])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 336672B3;
        Wed, 24 Aug 2022 19:48:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661363288;
        bh=MFaHBcEGSDb1ad1dZAafm2/CeTrWUzOkADyVxK3KBtw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ADVk/ICGXH4CFTgSm3Gj6w/jxJOXKIWWBA9kEwbqcabtHsnrxDds4RlwL0npVO8gS
         ViU0MtAhgDriMdEgK946wIz8twrViRZhZ8+iwI9VTKM7fjOZECgdW/x4h+2pHU6NbG
         KrwGDhlHVhMVEOmZtAtFFrRS5Dnt3hTFOhju5Rnk=
Date:   Wed, 24 Aug 2022 12:48:02 -0500
From:   paul.elder@ideasonboard.com
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Florian Sylvestre <fsylvestre@baylibre.com>
Subject: Re: [PATCH] media: rkisp1: Zero v4l2_subdev_format fields in when
 validating links
Message-ID: <20220824174802.GB109174@pyrite.rasen.tech>
References: <20220823171930.9236-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220823171930.9236-1-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

In the subject: s/in //

On Tue, Aug 23, 2022 at 08:19:30PM +0300, Laurent Pinchart wrote:
> The local sd_fmt variable in rkisp1_capture_link_validate() has
> uninitialized fields, which causes random failures when calling the
> subdev .get_fmt() operation. Fix it by initialization the variable when

s/initialization/initializing/

> declaring it, which zeros all other fields.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> index 0d5e3373e1f5..28f5bf284314 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> @@ -1394,11 +1394,12 @@ static int rkisp1_capture_link_validate(struct media_link *link)
>  	struct rkisp1_capture *cap = video_get_drvdata(vdev);
>  	const struct rkisp1_capture_fmt_cfg *fmt =
>  		rkisp1_find_fmt_cfg(cap, cap->pix.fmt.pixelformat);
> -	struct v4l2_subdev_format sd_fmt;
> +	struct v4l2_subdev_format sd_fmt = {
> +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
> +		.pad = link->source->index,
> +	};
>  	int ret;
>  
> -	sd_fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
> -	sd_fmt.pad = link->source->index;
>  	ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &sd_fmt);
>  	if (ret)
>  		return ret;
