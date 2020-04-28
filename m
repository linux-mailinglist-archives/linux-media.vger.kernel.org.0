Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5CA31BCD42
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2020 22:17:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726346AbgD1UQ6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Apr 2020 16:16:58 -0400
Received: from retiisi.org.uk ([95.216.213.190]:41820 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726284AbgD1UQ6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Apr 2020 16:16:58 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id A07C6634C8F;
        Tue, 28 Apr 2020 23:16:00 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1jTWe7-00027P-VL; Tue, 28 Apr 2020 23:15:59 +0300
Date:   Tue, 28 Apr 2020 23:15:59 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Daniel Gomez <daniel@qtec.com>
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 2/3] media: v4l2: Add v4l2 control IDs for temperature
Message-ID: <20200428201559.GV934@valkosipuli.retiisi.org.uk>
References: <20200414200151.80089-1-daniel@qtec.com>
 <20200414200151.80089-3-daniel@qtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200414200151.80089-3-daniel@qtec.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

On Tue, Apr 14, 2020 at 10:01:50PM +0200, Daniel Gomez wrote:
> Add a v4l2 control ID to handle the temperature.
> 
> Signed-off-by: Daniel Gomez <daniel@qtec.com>
> ---
>  drivers/media/v4l2-core/v4l2-ctrls.c | 5 +++++
>  include/uapi/linux/v4l2-controls.h   | 4 +++-
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index 93d33d1db4e8..17b93111baa8 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -783,6 +783,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_MIN_BUFFERS_FOR_OUTPUT:	return "Min Number of Output Buffers";
>  	case V4L2_CID_ALPHA_COMPONENT:		return "Alpha Component";
>  	case V4L2_CID_COLORFX_CBCR:		return "Color Effects, CbCr";
> +	case V4L2_CID_TEMPERATURE:		return "Temperature";

What's the unit of this control? I think it should have one.

As Hans pointed out, documentation is needed.

>  
>  	/* Codec controls */
>  	/* The MPEG controls are applicable to all codec controls
> @@ -1344,6 +1345,10 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  		*type = V4L2_CTRL_TYPE_INTEGER;
>  		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
>  		break;
> +	case V4L2_CID_TEMPERATURE:
> +		*type = V4L2_CTRL_TYPE_INTEGER;
> +		*flags |= V4L2_CTRL_FLAG_VOLATILE | V4L2_CTRL_FLAG_READ_ONLY;
> +		break;
>  	case V4L2_CID_MPEG_VIDEO_DEC_PTS:
>  		*type = V4L2_CTRL_TYPE_INTEGER64;
>  		*flags |= V4L2_CTRL_FLAG_VOLATILE | V4L2_CTRL_FLAG_READ_ONLY;
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 1a58d7cc4ccc..76ec0a6da8d5 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -143,8 +143,10 @@ enum v4l2_colorfx {
>  #define V4L2_CID_ALPHA_COMPONENT		(V4L2_CID_BASE+41)
>  #define V4L2_CID_COLORFX_CBCR			(V4L2_CID_BASE+42)
>  
> +#define V4L2_CID_TEMPERATURE			(V4L2_CID_BASE+43)
> +
>  /* last CID + 1 */
> -#define V4L2_CID_LASTP1                         (V4L2_CID_BASE+43)
> +#define V4L2_CID_LASTP1                         (V4L2_CID_BASE+44)
>  
>  /* USER-class private control IDs */
>  

-- 
Kind regards,

Sakari Ailus
