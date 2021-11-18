Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 256E8456132
	for <lists+linux-media@lfdr.de>; Thu, 18 Nov 2021 18:11:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229725AbhKRROh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Nov 2021 12:14:37 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:39778 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229678AbhKRROh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Nov 2021 12:14:37 -0500
Received: from [77.244.183.192] (port=63900 helo=[192.168.178.41])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <luca@lucaceresoli.net>)
        id 1mnkwh-000DiM-MS; Thu, 18 Nov 2021 18:11:35 +0100
Subject: Re: [PATCH] media: i2c: imx274: implement enum_mbus_code
To:     Eugen Hristev <eugen.hristev@microchip.com>,
        leonl@leopardimaging.com, linux-media@vger.kernel.org
Cc:     skomatineni@nvidia.com, sakari.ailus@linux.intel.com,
        linux-kernel@vger.kernel.org
References: <20211118154009.307430-1-eugen.hristev@microchip.com>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <fa26e991-9228-7ed7-833a-b296e6b32afc@lucaceresoli.net>
Date:   Thu, 18 Nov 2021 18:11:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211118154009.307430-1-eugen.hristev@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Eugen,

On 18/11/21 16:40, Eugen Hristev wrote:
> Current driver supports only SRGGB 10 bit RAW bayer format.
> Add the enum_mbus_code implementation to report this format supported.
> 
>  # v4l2-ctl -d /dev/v4l-subdev3 --list-subdev-mbus-codes
> ioctl: VIDIOC_SUBDEV_ENUM_MBUS_CODE (pad=0)
>         0x300f: MEDIA_BUS_FMT_SRGGB10_1X10
>  #
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>

Generally OK, but I have a few minor comments.

> ---
>  drivers/media/i2c/imx274.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
> index 2e804e3b70c4..25a4ef8f6187 100644
> --- a/drivers/media/i2c/imx274.c
> +++ b/drivers/media/i2c/imx274.c
> @@ -1909,7 +1909,21 @@ static int imx274_set_frame_interval(struct stimx274 *priv,
>  	return err;
>  }
>  
> +static int imx274_enum_mbus_code(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_state *sd_state,
> +				 struct v4l2_subdev_mbus_code_enum *code)
> +{
> +	if (code->index > 0)
> +		return -EINVAL;

Many driver do check code->pad too, so you might want to do

	if (code->pad > 0 || code->index > 0)
		return -EINVAL;

However I don't think it is strictly necessary, thus

> +
> +	/* only supported format in the driver is Raw 10 bits SRGGB */
> +	code->code = MEDIA_BUS_FMT_SRGGB10_1X10;

Maybe better:

  code->code =  to_imx274(sd)->format.code

just as a little guard for future format changes.

With or without these I'm OK anyway with the patch, so:

Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
