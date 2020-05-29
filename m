Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B4641E8251
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2020 17:44:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727035AbgE2PoC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 May 2020 11:44:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727023AbgE2PoB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 May 2020 11:44:01 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1C94C03E969;
        Fri, 29 May 2020 08:44:01 -0700 (PDT)
Received: from [IPv6:2003:cb:871f:5b00:5488:ffc1:6399:a6c0] (p200300cb871f5b005488ffc16399a6c0.dip0.t-ipconnect.de [IPv6:2003:cb:871f:5b00:5488:ffc1:6399:a6c0])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id F34212A440E;
        Fri, 29 May 2020 16:43:59 +0100 (BST)
Subject: Re: [PATCH] vimc: debayer: Add support for ARGB format
To:     Kaaira Gupta <kgupta@es.iitr.ac.in>,
        Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kieran.bingham@ideasonboard.com,
        dafna Hirschfeld <dafna3@gmail.com>
References: <20200528185717.GA20581@kaaira-HP-Pavilion-Notebook>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <0ab57863-935d-3ab5-dfea-80a44c63ae18@collabora.com>
Date:   Fri, 29 May 2020 17:43:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200528185717.GA20581@kaaira-HP-Pavilion-Notebook>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,
Thanks for the patch

I don't know how real devices handle ARGB formats,
I wonder if it should be the part of the debayer.


On 28.05.20 20:57, Kaaira Gupta wrote:
> Running qcam for pixelformat 0x34324142 showed that vimc debayer does
> not support it. Hence, add the support for Alpha (255).

I would change the commit log to:

Add support for V4L2_PIX_FMT_RGB24 format in the debayer
and set the alpha channel to constant 255.

Thanks,
Dafna

> 
> Signed-off-by: Kaaira Gupta <kgupta@es.iitr.ac.in>
> ---
>   .../media/test-drivers/vimc/vimc-debayer.c    | 27 ++++++++++++-------
>   1 file changed, 18 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/test-drivers/vimc/vimc-debayer.c b/drivers/media/test-drivers/vimc/vimc-debayer.c
> index c3f6fef34f68..f34148717a40 100644
> --- a/drivers/media/test-drivers/vimc/vimc-debayer.c
> +++ b/drivers/media/test-drivers/vimc/vimc-debayer.c
> @@ -62,6 +62,7 @@ static const u32 vimc_deb_src_mbus_codes[] = {
>   	MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
>   	MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA,
>   	MEDIA_BUS_FMT_RGB888_1X32_PADHI,
> +	MEDIA_BUS_FMT_ARGB8888_1X32
>   };
>   
>   static const struct vimc_deb_pix_map vimc_deb_pix_map_list[] = {
> @@ -322,15 +323,23 @@ static void vimc_deb_process_rgb_frame(struct vimc_deb_device *vdeb,
>   	unsigned int i, index;
>   
>   	vpix = vimc_pix_map_by_code(vdeb->src_code);
> -	index = VIMC_FRAME_INDEX(lin, col, vdeb->sink_fmt.width, 3);
> -	for (i = 0; i < 3; i++) {
> -		switch (vpix->pixelformat) {
> -		case V4L2_PIX_FMT_RGB24:
> -			vdeb->src_frame[index + i] = rgb[i];
> -			break;
> -		case V4L2_PIX_FMT_BGR24:
> -			vdeb->src_frame[index + i] = rgb[2 - i];
> -			break;
> +
> +	if (vpix->pixelformat == V4L2_PIX_FMT_ARGB32) {
> +		index =  VIMC_FRAME_INDEX(lin, col, vdeb->sink_fmt.width, 4);
> +		vdeb->src_frame[index] = 255;
> +		for (i = 0; i < 3; i++)
> +			vdeb->src_frame[index + i + 1] = rgb[i];
> +	} else {
> +		index =  VIMC_FRAME_INDEX(lin, col, vdeb->sink_fmt.width, 3);
> +		for (i = 0; i < 3; i++) {
> +			switch (vpix->pixelformat) {
> +			case V4L2_PIX_FMT_RGB24:
> +				vdeb->src_frame[index + i] = rgb[i];
> +				break;
> +			case V4L2_PIX_FMT_BGR24:
> +				vdeb->src_frame[index + i] = rgb[2 - i];
> +				break;
> +			}
>   		}
>   	}
>   }
> 
