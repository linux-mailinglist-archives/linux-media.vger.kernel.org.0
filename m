Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4992618822E
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2020 12:27:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726057AbgCQL1t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Mar 2020 07:27:49 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59956 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725794AbgCQL1s (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Mar 2020 07:27:48 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 6DCB22951C2
Subject: Re: [PATCH] vimc: Report a colorspace
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
References: <20200316221606.2648820-1-niklas.soderlund+renesas@ragnatech.se>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <779b6314-31a6-76df-6dd3-1a24f577a5d3@collabora.com>
Date:   Tue, 17 Mar 2020 08:27:42 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200316221606.2648820-1-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

Thank you for the patch.

I would just change the title of the commit to start with the tags:

media: vimc: cap:

On 3/16/20 7:16 PM, Niklas Söderlund wrote:
> The colorspace reported by a video nodes should not be
> V4L2_COLORSPACE_DEFAULT. Instead a default colorspace should be picked
> by the driver if V4L2_COLORSPACE_DEFAULT is given by userspace to
> {G,S,TRY}_FMT.
> 
> The colorspace V4L2_COLORSPACE_SRGB is arbitrary chosen as the vimc
> default format to report as it's used for most webcams.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Acked-by: Helen Koike <helen.koike@collabora.com>

Do the subdevices also need this change?
They also use V4L2_COLORSPACE_DEFAULT in their default format.

Regards,
Helen

> ---
>  drivers/media/platform/vimc/vimc-capture.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> ---
> Hi,
> 
> This was found while adding V4L2_CAP_IO_MC support to vimc and adding 
> tests to v4l2-compliance. The issue will hence only show up in 
> v4l2-compliance if V4L2_CAP_IO_MC series is enabled for vimc.
> 
> Best regards,
> Niklas Söderlund
> 
> diff --git a/drivers/media/platform/vimc/vimc-capture.c b/drivers/media/platform/vimc/vimc-capture.c
> index 23e740c1c5c00802..747ea9cc1bd7cb12 100644
> --- a/drivers/media/platform/vimc/vimc-capture.c
> +++ b/drivers/media/platform/vimc/vimc-capture.c
> @@ -37,7 +37,7 @@ static const struct v4l2_pix_format fmt_default = {
>  	.height = 480,
>  	.pixelformat = V4L2_PIX_FMT_RGB24,
>  	.field = V4L2_FIELD_NONE,
> -	.colorspace = V4L2_COLORSPACE_DEFAULT,
> +	.colorspace = V4L2_COLORSPACE_SRGB,
>  };
>  
>  struct vimc_cap_buffer {
> @@ -107,6 +107,9 @@ static int vimc_cap_try_fmt_vid_cap(struct file *file, void *priv,
>  
>  	vimc_colorimetry_clamp(format);
>  
> +	if (format->colorspace == V4L2_COLORSPACE_DEFAULT)
> +		format->colorspace = fmt_default.colorspace;
> +
>  	return 0;
>  }
>  
> 
