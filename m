Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F8CB1532A5
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2020 15:17:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728188AbgBEORp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Feb 2020 09:17:45 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:54258 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726597AbgBEORp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Feb 2020 09:17:45 -0500
Received: from [IPv6:2804:214:85ec:bd22:b29b:72b8:8fc3:cfae] (unknown [IPv6:2804:214:85ec:bd22:b29b:72b8:8fc3:cfae])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 0995F29358C;
        Wed,  5 Feb 2020 14:17:40 +0000 (GMT)
Subject: Re: [PATCH 2/3] media: vimc: Add GBR media bus code
To:     =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= 
        <nfraprado@protonmail.com>, linux-media@vger.kernel.org
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        linux-kernel@vger.kernel.org, lkcamp@lists.libreplanetbr.org
References: <20200202155019.1029993-1-nfraprado@protonmail.com>
 <20200202155019.1029993-3-nfraprado@protonmail.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <c88d21cb-29e0-9fac-c584-d010fd9a4aa3@collabora.com>
Date:   Wed, 5 Feb 2020 11:17:35 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200202155019.1029993-3-nfraprado@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nícolas,

Thank you for the patch.

On 2/2/20 1:50 PM, Nícolas F. R. A. Prado wrote:
> Add missing GBR888_1X24 media bus code in the vimc_pix_map_list. Since
> there is no pixel format for it, use the pixelformat for RGB.
> 
> Co-developed-by: Vitor Massaru Iha <vitor@massaru.org>
> Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@protonmail.com>
> ---
>  drivers/media/platform/vimc/vimc-common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/vimc/vimc-common.c b/drivers/media/platform/vimc/vimc-common.c
> index 55797e5ab2b1..591a50f63766 100644
> --- a/drivers/media/platform/vimc/vimc-common.c
> +++ b/drivers/media/platform/vimc/vimc-common.c
> @@ -25,7 +25,7 @@ static const struct vimc_pix_map vimc_pix_map_list[] = {
>  		.bayer = false,
>  	},
>  	{
> -		.code = {MEDIA_BUS_FMT_RGB888_1X24},
> +		.code = {MEDIA_BUS_FMT_RGB888_1X24, MEDIA_BUS_FMT_GBR888_1X24},

Could you add spaces around the curly brackets here too?

I was also thinking that all the MEDIA_BUS_FMT_RGB888_* and MEDIA_BUS_FMT_GBR888_* variants
could be added here (to be verified).

Thanks
Helen

>  		.pixelformat = V4L2_PIX_FMT_RGB24,
>  		.bpp = 3,
>  		.bayer = false,
> 
