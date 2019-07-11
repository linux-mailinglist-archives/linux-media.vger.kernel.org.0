Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 857E26536F
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2019 11:04:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727595AbfGKJEK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Jul 2019 05:04:10 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:34718 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725963AbfGKJEK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Jul 2019 05:04:10 -0400
Received: from pendragon.ideasonboard.com (softbank126163157105.bbtec.net [126.163.157.105])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D022131C;
        Thu, 11 Jul 2019 11:04:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1562835849;
        bh=SCuX7+qfwjE53oquW5hOpAzMrz6RDe+uWnOxafhXCLM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qI54iTVPlq9KfnhUyHXa4I/4ukRbNEsF9Oza7r8fDFEqsshIkklHKunSLApqmKth4
         6JIip5+MZZ4ymwvC+wUbQ/KTXxSNDJR8b6o1c0ST+QWvw4r7Dljwa9ymoSfnWdArc8
         7qDnn+c3yhOdcQsNKTnd8rwsyJr15ANEWAg4TT0c=
Date:   Thu, 11 Jul 2019 12:03:40 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH for 5.3] videodev2.h: change V4L2_PIX_FMT_BGRA444 define:
 fourcc was already in use
Message-ID: <20190711090340.GK5247@pendragon.ideasonboard.com>
References: <27374021-a714-f49f-5ea2-9ebfd1992e54@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <27374021-a714-f49f-5ea2-9ebfd1992e54@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for the patch.

On Thu, Jul 11, 2019 at 10:53:25AM +0200, Hans Verkuil wrote:
> The V4L2_PIX_FMT_BGRA444 define clashed with the pre-existing V4L2_PIX_FMT_SGRBG12
> which strangely enough used the same fourcc, even though that fourcc made no sense
> for a Bayer format. In any case, you can't have duplicates, so change the fourcc of
> V4L2_PIX_FMT_BGRA444.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: <stable@vger.kernel.org>      # for v5.2 and up

Maybe a Fixes: line ?

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 9d9705ceda76..2427bc4d8eba 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -518,7 +518,13 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_RGBX444 v4l2_fourcc('R', 'X', '1', '2') /* 16  rrrrgggg bbbbxxxx */
>  #define V4L2_PIX_FMT_ABGR444 v4l2_fourcc('A', 'B', '1', '2') /* 16  aaaabbbb ggggrrrr */
>  #define V4L2_PIX_FMT_XBGR444 v4l2_fourcc('X', 'B', '1', '2') /* 16  xxxxbbbb ggggrrrr */
> -#define V4L2_PIX_FMT_BGRA444 v4l2_fourcc('B', 'A', '1', '2') /* 16  bbbbgggg rrrraaaa */
> +
> +/*
> + * Originally this had 'BA12' as fourcc, but this clashed with the older
> + * V4L2_PIX_FMT_SGRBG12 which inexplicably used that same fourcc.
> + * So use 'GA12' instead for V4L2_PIX_FMT_BGRA444.
> + */
> +#define V4L2_PIX_FMT_BGRA444 v4l2_fourcc('G', 'A', '1', '2') /* 16  bbbbgggg rrrraaaa */
>  #define V4L2_PIX_FMT_BGRX444 v4l2_fourcc('B', 'X', '1', '2') /* 16  bbbbgggg rrrrxxxx */
>  #define V4L2_PIX_FMT_RGB555  v4l2_fourcc('R', 'G', 'B', 'O') /* 16  RGB-5-5-5     */
>  #define V4L2_PIX_FMT_ARGB555 v4l2_fourcc('A', 'R', '1', '5') /* 16  ARGB-1-5-5-5  */

-- 
Regards,

Laurent Pinchart
