Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02FDF35D8C9
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 09:26:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230388AbhDMH0g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 03:26:36 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:50497 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230220AbhDMH0f (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 03:26:35 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id WDQvlhJsG43ycWDQylbKsA; Tue, 13 Apr 2021 09:26:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1618298774; bh=iuscKYlZrmNNcYDAdFgfUygRIDVn2zQTJzj0tnhaTjE=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=TBgDYf6oNueT4ZNtCBRGqTHa+AeLyqCD19lzLlYmmSfw5j4763vmDLB23cr9Zrhmk
         qSs9/RkWZ8hTzNsee6VK9miMwcxgjiain/ljENcNblcUo8Xrla4KiaeG8upGJqCM6a
         +Hv4O2AKrn3KeaaKXJhtwM3Td87Si5rl6/JxliRAmSjM8WIH1FP2DJzfyg6H4YE4aT
         E5nqdz4y9bZ1XTLVLdRQhsP/D85FbTmaRUEZZ1tFXhu9LwtIUcG6B+T/vy9AwvNkGP
         Nx+oCIVSTHjYc34ZklGDBoU7kQPCd5ZrrS/mAT/xk4uDtc8fvjkx2PShCxDrHCYM5s
         DMV2Qz0XW/xtg==
Subject: Re: Subject: [PATCH v2] staging: media: meson: vdec: declare u32 as
 static const appropriately
To:     Mitali Borkar <mitaliborkar810@gmail.com>, narmstrong@baylibre.com,
        mchehab@kernel.org, gregkh@linuxfoundation.org,
        khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        linux-amlogic@lists.infradead.org, mitali_s@me.iitr.ac.in
References: <YHU56OM+C2zY34VP@kali>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <00c8a239-49d3-fedb-ec67-076e8b823efa@xs4all.nl>
Date:   Tue, 13 Apr 2021 09:26:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YHU56OM+C2zY34VP@kali>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfMACiB/U3iBmeIo8g2sQHaGJfQjsL6GJ7v+M9ptXTdZx5bTSXHAIxK6HgPN5d14hv9IMqKdD7UkDJDWsTPefBdDD+Pk4FTegeqoWcKUT0squpR8jLHt5
 kf8a7+2gQd8//OJJqeur7Rzfkj7GjP8p3rPeDAIq3TsvlNSGDvzd71Ia1SSDNBczzHanGs6Cm3cUXkZ2gpmWuD3g3s8c5ykxphhxahqSCKry+t+N5KyCaquP
 AFzAtQr90Vk7DRNrDj7tRybqimpkkOOismwFRbZZwHOCbTXRal0OtwRdehHUxYCXJtiYuowDAwXFU/QGlJbW0Rgz69B2BQl+pxIv027K7OoJ7Kx58/2FHIRu
 aFVG9byy7VQr3ssoeLqhG23oOrix7EhRvOUuko6z2NZwVkG04XUJB5ih6Oy47e3CIk2hLSej1zCFW1LB5iqE+o1qi587irxJRerd3SXjYtd/mfTgy9xIEiru
 3TIGJTn2Lj08Y0iTOJJouMb+ZTy/O9nNeZTOsQr3+vIjcDIZco8Y/ZJqVhKeyNRSIwOw/8reeoex51YYxujMkj6ZEbWENSzysjMG+Bm9nUJTBnW87Ca78wgr
 emZ9uuHwXJ5TgUTCDclURjY8dtB20VuPnUcduBexg0gYE5eVrFJKqSYQd50H7EX6KE3RyHIeK6ifEX9Z5THD0sI8
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 13/04/2021 08:27, Mitali Borkar wrote:
> Declared 32 bit unsigned int as static constant inside a function
> appropriately.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> ---
> 
> Changes from v1:- Rectified the mistake by declaring u32 as static const
> properly.
> 
>  drivers/staging/media/meson/vdec/codec_h264.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/meson/vdec/codec_h264.c b/drivers/staging/media/meson/vdec/codec_h264.c
> index ea86e9e1c447..80141b89a9f6 100644
> --- a/drivers/staging/media/meson/vdec/codec_h264.c
> +++ b/drivers/staging/media/meson/vdec/codec_h264.c
> @@ -287,8 +287,8 @@ static void codec_h264_resume(struct amvdec_session *sess)
>  	struct amvdec_core *core = sess->core;
>  	struct codec_h264 *h264 = sess->priv;
>  	u32 mb_width, mb_height, mb_total;
> -	static const u32[] canvas3 = { ANCO_CANVAS_ADDR, 0 };
> -	static const u32[] canvas4 = { 24, 0 };
> +	static const u32 canvas3[] = { ANCO_CANVAS_ADDR, 0 };
> +	static const u32 canvas4[] = { 24, 0 };

This is a patch on top of your previous (v1) patch. That won't work
since the v1 is not merged, you need to make a patch against the current
mainline code.

Regards,

	Hans

>  
>  	amvdec_set_canvases(sess, canvas3, canvas4);
>  
> 

