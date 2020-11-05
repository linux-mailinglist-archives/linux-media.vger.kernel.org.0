Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D52902A8530
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 18:43:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731666AbgKERnd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 12:43:33 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:39501 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728523AbgKERnd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Nov 2020 12:43:33 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id ajI8kCLahRiwVajICkN8oN; Thu, 05 Nov 2020 18:43:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1604598211; bh=AF/68IsCoCoaXJfmouTQI7+Xa0mxZphJKln8/rTlTOw=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=qXx9diOz1VOSNXc6KwZ8eqJaKJzva5beMIg+NyKQGCytPhSFKLFy4fdOwRfzl/PJP
         S2HVQbOGqZIRqBHuDp3pfsmxC5/m/c07GSlhJGq8r8wiY9gR/BLIi4ZtZ57RNrBE6p
         zWcjYcRgv0MZ1q5u705N36auilHOOt8yDEnGx7J6cmB2FSoPY0m1pl8UcQJSGvaleX
         YRLDRYeinE75B/VxN/w1d3h9CujCYAksWgYGdOi7A53dRUrwIIsN2/r82sU4nrHDKS
         NBzbuoIlijwOt6X735R+MFyN4NsGZ+fEOdRueukvmnRE7khbRT6M98OzpNmAGwyUO+
         +PU+ErPe5ZSvQ==
Subject: Re: [PATCH v2 1/3] media: videodev2.h, v4l2-ioctl: add rkisp1 meta
 buffer format
To:     Helen Koike <helen.koike@collabora.com>,
        linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        heiko@sntech.de, kernel@collabora.com,
        dafna.hirschfeld@collabora.com, zhengsq@rock-chips.com,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se,
        mchehab@kernel.org, tfiga@chromium.org, ribalda@google.com
References: <20201030112225.2095909-1-helen.koike@collabora.com>
 <20201030112225.2095909-2-helen.koike@collabora.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <89711cf3-fc1d-68e2-1de0-c6cc88c6f7d0@xs4all.nl>
Date:   Thu, 5 Nov 2020 18:43:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201030112225.2095909-2-helen.koike@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfFQzZsLG4IoaX3MK9lUP4P9bGhv1ECFdNeJQOiElLglacYI/BsXbPysNb+04DVFyoEdgVkJ7Rek3vDJnPt7hIT5P1xB9L1+qCYErrvCNOGtKMS7Auwoe
 6RkflstvARa0zkSt33v+m67BTBNKl5m7CkVR3yPJagUJh7MeTU7zCszSzL13ENT5mam7TNv8d3cHoYK8I1lG0kOcxWqk2svg+DawLaEKjG7sHJuktyrNu7br
 27MYthrYwpWvtyjpsJqqKq+AELe04UoyZtA9OWbPhUJupEJCtNMzgCCLwoGD3bcX8PohfOoZEPXm9aWBHF3LRXA8aG55RvOrL8xtg4cMRyYk9Uxfm2vSCT+r
 n6/7CW2P0mgPLH/YgW1EduBVXCJwOP1n+cBzOODF1gknVTZ7g7M6zarTXS82LeK1jTvC6Q1HogcxbZLhD8/f2zQ691AQvwlwZiAw2+s5XOCu5D3OGO4uxh/P
 1qwX+4ag8hN4RvzhtgiPr9rSFID4/+b6HU+YbZQgUIwW+SlKkXLE0jIqDKqClfsDUdFeTZYNpVEWqXtaIFWrkpA6jBlPYJKqCPI2q0W+El77NfUnbcgZonuv
 rViyJ/audj+z2xutflGBI8RWGUhZ3JAvAu7/OyDkFMldAPtOx0/t5/AQha6Ozk7+GCI=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 30/10/2020 12:22, Helen Koike wrote:
> From: Shunqian Zheng <zhengsq@rock-chips.com>
> 
> Add the Rockchip ISP1 specific processing parameter format
> V4L2_META_FMT_RK_ISP1_PARAMS and metadata format
> V4L2_META_FMT_RK_ISP1_STAT_3A for 3A.
> 
> Signed-off-by: Shunqian Zheng <zhengsq@rock-chips.com>
> Signed-off-by: Jacob Chen <jacob2.chen@rock-chips.com>
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> ---
> Hello,
> 
> This patch is a continuation of:
> 
> https://patchwork.kernel.org/project/linux-arm-kernel/patch/20191106120132.6876-2-helen.koike@collabora.com/
> 
> These formats are already documented under
> Documentation/userspace-api/media/v4l/pixfmt-meta-rkisp1.rst
> 
> We had agreed to keep under
> drivers/staging/media/rkisp1/uapi/rkisp1-config.h while the driver was
> in staging, since we are moving it out of staging, I guess this is the
> time :)
> 
> Regards,
> Helen
> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c              | 2 ++
>  drivers/staging/media/rkisp1/uapi/rkisp1-config.h | 4 ----
>  include/uapi/linux/videodev2.h                    | 4 ++++
>  3 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index eeff398fbdcc1..202597d031c6b 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1402,6 +1402,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_META_FMT_UVC:		descr = "UVC Payload Header Metadata"; break;
>  	case V4L2_META_FMT_D4XX:	descr = "Intel D4xx UVC Metadata"; break;
>  	case V4L2_META_FMT_VIVID:       descr = "Vivid Metadata"; break;
> +	case V4L2_META_FMT_RK_ISP1_PARAMS:	descr = "Rockchip ISP1 3A params"; break;
> +	case V4L2_META_FMT_RK_ISP1_STAT_3A:	descr = "Rockchip ISP1 3A statistics"; break;

Use 'Params' and 'Statistics' to conform to the other descriptions.

Regards,

	Hans

>  
>  	default:
>  		/* Compressed formats */
> diff --git a/drivers/staging/media/rkisp1/uapi/rkisp1-config.h b/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
> index 8d906cc7da8fc..6e449e7842605 100644
> --- a/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
> +++ b/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
> @@ -9,10 +9,6 @@
>  
>  #include <linux/types.h>
>  
> -/* Vendor specific - used for RK_ISP1 camera sub-system */
> -#define V4L2_META_FMT_RK_ISP1_PARAMS   v4l2_fourcc('R', 'K', '1', 'P') /* Rockchip ISP1 params */
> -#define V4L2_META_FMT_RK_ISP1_STAT_3A  v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A statistics */
> -
>  /* Defect Pixel Cluster Detection */
>  #define RKISP1_CIF_ISP_MODULE_DPCC		(1U << 0)
>  /* Black Level Subtraction */
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 534eaa4d39bc8..c2e13ba81196b 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -770,6 +770,10 @@ struct v4l2_pix_format {
>  #define V4L2_META_FMT_D4XX        v4l2_fourcc('D', '4', 'X', 'X') /* D4XX Payload Header metadata */
>  #define V4L2_META_FMT_VIVID	  v4l2_fourcc('V', 'I', 'V', 'D') /* Vivid Metadata */
>  
> +/* Vendor specific - used for RK_ISP1 camera sub-system */
> +#define V4L2_META_FMT_RK_ISP1_PARAMS	v4l2_fourcc('R', 'K', '1', 'P') /* Rockchip ISP1 params */
> +#define V4L2_META_FMT_RK_ISP1_STAT_3A	v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A statistics */
> +
>  /* priv field value to indicates that subsequent fields are valid. */
>  #define V4L2_PIX_FMT_PRIV_MAGIC		0xfeedcafe
>  
> 

