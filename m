Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCC2C2BA642
	for <lists+linux-media@lfdr.de>; Fri, 20 Nov 2020 10:34:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727102AbgKTJdb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Nov 2020 04:33:31 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:51519 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727027AbgKTJda (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Nov 2020 04:33:30 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id g2nDk0yctlmd2g2nGkPhXg; Fri, 20 Nov 2020 10:33:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1605864807; bh=dFez3crGhqHi0TX69oCor/a25vkvpPgfuw0IN2yT4qA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=dqBmsfCgcKL3XMC+flu1PPZmH9JFnC0sKXHK22Nz+HK0lTnw3UE2U6N64nwWPs6kb
         3qbVZ3Lw/KcyE1QHxqRvJKSE2BrC0zkpMxobORMlsB8lJFcZ/Vh+5H6Ct4LHlC4x0V
         1eH+VIkRB1RBhBbU+RhaVlHL6GZ8mE4eStUJfV+C3OtchnTgl/Xs6OcGvtDzAdM9ws
         BALK5JSJbPve5zBwv6mbLaLy7KNiAblvV4N0zT8sOUWlXZHDdtBkjWcno0Hfx2pddY
         GbOMGXQvnVq3zdkEnaOEtcy8BdZS8SEgey/7KglTaXEeG8rfF+Xx4ul6LMW2x7eXRJ
         wKcjDb18bAfkg==
Subject: Re: [PATCH v3 08/13] media: controls: Add the stateless codec control
 class
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>
References: <20201118184700.331213-1-ezequiel@collabora.com>
 <20201118184700.331213-9-ezequiel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <a1b68f63-4e7c-2573-adf7-9e4533cbd3af@xs4all.nl>
Date:   Fri, 20 Nov 2020 10:33:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201118184700.331213-9-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfEVSDN4BlaZYy8vhpADrO2CbsU+q91S56af51OAvgwqtsJbJLDS5QHgrBsnwZUox2sO/tsvjJryct9sbsFXJ7A3NDRjKPHk8vF7vdKIuXpwHEBo7Wj8w
 YfVvdWDQ2JXbXw5Mi/Ecm0u1cdINo59dgYWTeo1lnyWZ2izJsLVvtX9K9Ao1V5TBmmLERisc7A1yyJDIJ8OO8j5lHfx5bsSrHd77V/Yr16zGJFmURt9Ktt22
 vqCnUswfwPfG+7P7e08axAzH/PuP0xDxwU67UB8b3bjASkm23GOHeJt4C0wzkj6PFig6iJ5pfnowhYVpWEsPZPC0kgb4T8dwKUT/LVN5uDScpJew8KXUTvHk
 o3woBgUgcOa/qszn0ZnfMvEMNl/DF5Io0JwQrsAXmYDHmmV63aVjlK11R2zoWjQcUOg3DAQOg+m42+L/Ov5ETK88CJ15u7gNXM3RwJT8gwnbJveJHzvnKUOs
 dmaI8VhKmOyHSfpxfBAUs4j5PYgEO7rbDFCG+aFexOTQ9VyaVLHmd4qRvIY=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18/11/2020 19:46, Ezequiel Garcia wrote:
> Add a new control class to hold the stateless codecs controls
> that are ready to be moved out of staging.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  drivers/media/v4l2-core/v4l2-ctrls.c | 5 +++++
>  include/uapi/linux/v4l2-controls.h   | 7 +++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index adcf47bddbe3..472b46e8290b 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -1181,6 +1181,10 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_DETECT_MD_GLOBAL_THRESHOLD: return "MD Global Threshold";
>  	case V4L2_CID_DETECT_MD_THRESHOLD_GRID:	return "MD Threshold Grid";
>  	case V4L2_CID_DETECT_MD_REGION_GRID:	return "MD Region Grid";
> +
> +	/* Codec controls */

Shouldn't that be: /* Stateless Codec controls */ ?

Regards,

	Hans

> +	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> +	case V4L2_CID_CODEC_STATELESS_CLASS:	return "Stateless Codec Controls";
>  	default:
>  		return NULL;
>  	}
> @@ -1368,6 +1372,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  	case V4L2_CID_FM_RX_CLASS:
>  	case V4L2_CID_RF_TUNER_CLASS:
>  	case V4L2_CID_DETECT_CLASS:
> +	case V4L2_CID_CODEC_STATELESS_CLASS:
>  		*type = V4L2_CTRL_TYPE_CTRL_CLASS;
>  		/* You can neither read not write these */
>  		*flags |= V4L2_CTRL_FLAG_READ_ONLY | V4L2_CTRL_FLAG_WRITE_ONLY;
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 75cf87b9a377..90478ecc2f81 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -65,6 +65,7 @@
>  #define V4L2_CTRL_CLASS_FM_RX		0x00a10000	/* FM Receiver controls */
>  #define V4L2_CTRL_CLASS_RF_TUNER	0x00a20000	/* RF tuner controls */
>  #define V4L2_CTRL_CLASS_DETECT		0x00a30000	/* Detection controls */
> +#define V4L2_CTRL_CLASS_CODEC_STATELESS 0x00a40000	/* Stateless codecs controls */
>  
>  /* User-class control IDs */
>  
> @@ -1177,6 +1178,12 @@ enum v4l2_detect_md_mode {
>  #define V4L2_CID_DETECT_MD_THRESHOLD_GRID	(V4L2_CID_DETECT_CLASS_BASE + 3)
>  #define V4L2_CID_DETECT_MD_REGION_GRID		(V4L2_CID_DETECT_CLASS_BASE + 4)
>  
> +
> +/*  Stateless CODECs controls */
> +#define V4L2_CID_CODEC_STATELESS_BASE          (V4L2_CTRL_CLASS_CODEC_STATELESS | 0x900)
> +#define V4L2_CID_CODEC_STATELESS_CLASS         (V4L2_CTRL_CLASS_CODEC_STATELESS | 1)
> +
> +
>  /* MPEG-compression definitions kept for backwards compatibility */
>  #ifndef __KERNEL__
>  #define V4L2_CTRL_CLASS_MPEG            V4L2_CTRL_CLASS_CODEC
> 

