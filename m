Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70492199ED6
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2020 21:21:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727795AbgCaTVl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Mar 2020 15:21:41 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49082 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727509AbgCaTVl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Mar 2020 15:21:41 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 5C3E4297064
Subject: Re: [PATCH] media: i2c: imx219: Fix a bug in imx219_enum_frame_size
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        dave.stevenson@raspberrypi.com,
        prabhakar.mahadev-lad.rj@bp.renesas.com
References: <20200331180630.5703-1-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <fadbaf15-4308-1791-a3fb-eaca0570b75a@collabora.com>
Date:   Tue, 31 Mar 2020 16:21:30 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200331180630.5703-1-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 3/31/20 3:06 PM, Dafna Hirschfeld wrote:
> When enumerating the frame sizes, the value sent to
> imx219_get_format_code should be fse->code
> (the code from the ioctl) and not imx219->fmt.code
> which is the code set currently in the driver.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Reviewed-by: Helen Koike <helen.koike@collabora.com>

> ---
>  drivers/media/i2c/imx219.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index b1f30debe449..df2a6ed7c8ac 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -781,7 +781,7 @@ static int imx219_enum_frame_size(struct v4l2_subdev *sd,
>  	if (fse->index >= ARRAY_SIZE(supported_modes))
>  		return -EINVAL;
>  
> -	if (fse->code != imx219_get_format_code(imx219, imx219->fmt.code))
> +	if (fse->code != imx219_get_format_code(imx219, fse->code))
>  		return -EINVAL;
>  
>  	fse->min_width = supported_modes[fse->index].width;
> 
