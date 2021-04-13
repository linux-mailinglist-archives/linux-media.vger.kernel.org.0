Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1A0D35E166
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 16:28:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238043AbhDMO2t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 10:28:49 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:44357 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232172AbhDMO2n (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 10:28:43 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id WK1YlFUF2MxedWK1bliyIA; Tue, 13 Apr 2021 16:28:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1618324100; bh=1OYRzaPYX+MdL2oJs4PbhIJNrmnwYHeYtpLOazWRad4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=LE5q+1/GxEP74ilj90iQBYAqaWO6EocuzMs6EXfE+urj8TyS9sLw1jrCYErXh3HuM
         4Qqf1RZgCF3vX8igimzeC8drgtbs55bHgkIgHpXGjSwuudDzS1bTSbVedXduO0lYyj
         ZI9fjWnt8JANheRv/w/tjMyNyVKTgbmmVEi9nE5X67As8aleo2SCslNwwmoCfACKek
         Zt183z/DdY9hif5nPeH03e4WgCxTPQ4HwgTppRuq6WV55OgoiaxPUF8kQXkUbkKtiS
         dJFOwxw/h1JUcZDSa52x4DDPO1gS54fEsUsRxCOkjqPsU1jy+uT76xtF6L2iA6r/dO
         UCzh9lcqabkTQ==
Subject: Re: [PATCH v3] staging: media: zoran: remove and move statement in
 next line with '*'
To:     Mitali Borkar <mitaliborkar810@gmail.com>, clabbe@baylibre.com,
        mchehab@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        mitali_s@me.iitr.ac.in
References: <YHA9IdZVRr4kbVJ0@kali>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <74a4e59b-48b5-d054-8cb1-6cba038279ba@xs4all.nl>
Date:   Tue, 13 Apr 2021 16:28:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YHA9IdZVRr4kbVJ0@kali>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfFp9rS0rBtd8Y3HBIpiwaBaDWe58n9PZvJ5V1pfIHcnldOzfc+HLqJUBR60spsxLINEUol/VpmJjl0DjK3H8r9ilXcfW1NZF3IBaBlQ/91KDzVM88G8K
 AhYqaOZLtHR3YJGCMo9oo3ftuNa4VsvtvFXq4eJCJ0xK4knTYmJPoueFDUf34ztoVbcQCl1X0va3MEAEYxu0N8p/WcjnqZeV74aOuCY4+sk0Zub5mihzKuHh
 9q3Cf+2KxovQX7RgL+xLhurYOWz0P83ey/SS8IaOQwd0++ckH54q0JOC6FjsPkKwJy3LkMsF+3xxC1FCMEIj3UneX82xUTs8oJhyTcWzVVZJyWUOnWv74h3R
 aokQ2Dxo2mwYAC0yWoPgp+zgi4sYhMsL5dZQguPeoOPWswPy3URXW1p4+ORzv0nZSNkVSeK5VaxmlVoi53+nhj22zbNZKj8W7Qbt3vJeixl9CbDUqSU8AXv/
 11XS8vVgYrW+Q4zxBN6r5VCb/t1St9+nkWiJmg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 09/04/2021 13:40, Mitali Borkar wrote:
> Removed and moved statement in line in long(multi-line) comments and
> added '*' before it to meet linux kernel coding style for long (multi-line) comments
> 
> Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> ---
> 
> Changes from v2:- made style changes in code according to linux kernel
> coding style for long comments.
> 
> drivers/staging/media/zoran/zr36050.c | 26 +++++++++++++++++---------
>  1 file changed, 17 insertions(+), 9 deletions(-)

This too sits on top of other commits from your own private branch, so
it won't apply against the mainline code.

Regards,

	Hans

> 
> diff --git a/drivers/staging/media/zoran/zr36050.c b/drivers/staging/media/zoran/zr36050.c
> index 703064009c6b..b89afa239b0c 100644
> --- a/drivers/staging/media/zoran/zr36050.c
> +++ b/drivers/staging/media/zoran/zr36050.c
> @@ -24,7 +24,8 @@
>  /* codec io API */
>  #include "videocodec.h"
>  
> -/* it doesn't make sense to have more than 20 or so,
> +/*
> + * it doesn't make sense to have more than 20 or so,
>   * just to prevent some unwanted loops
>   */
>  #define MAX_CODECS 20
> @@ -311,7 +312,8 @@ static const char zr36050_decimation_v[8] = { 1, 1, 1, 0, 0, 0, 0, 0 };
>  
>  /* ------------------------------------------------------------------------- */
>  
> -/* SOF (start of frame) segment depends on width, height and sampling ratio
> +/*
> + * SOF (start of frame) segment depends on width, height and sampling ratio
>   *			 of each color component
>   */
>  
> @@ -343,7 +345,8 @@ static int zr36050_set_sof(struct zr36050 *ptr)
>  
>  /* ------------------------------------------------------------------------- */
>  
> -/* SOS (start of scan) segment depends on the used scan components
> +/*
> + * SOS (start of scan) segment depends on the used scan components
>   *			of each color component
>   */
>  
> @@ -432,7 +435,8 @@ static void zr36050_init(struct zr36050 *ptr)
>  		sum += zr36050_set_sos(ptr);
>  		sum += zr36050_set_dri(ptr);
>  
> -		/* setup the fixed jpeg tables - maybe variable, though -
> +		/*
> +		 * setup the fixed jpeg tables - maybe variable, though -
>  		 * (see table init section above)
>  		 */
>  		dprintk(3, "%s: write DQT, DHT, APP\n", ptr->name);
> @@ -551,8 +555,9 @@ static void zr36050_init(struct zr36050 *ptr)
>   * =========================================================================
>   */
>  
> -/* set compression/expansion mode and launches codec -
> - *  this should be the last call from the master before starting processing
> +/*
> + * set compression/expansion mode and launches codec -
> + * this should be the last call from the master before starting processing
>   */
>  
>  static int zr36050_set_mode(struct videocodec *codec, int mode)
> @@ -581,7 +586,8 @@ static int zr36050_set_video(struct videocodec *codec, const struct tvnorm *norm
>  		ptr->name, norm->h_start, norm->v_start,
>  		cap->x, cap->y, cap->width, cap->height,
>  		cap->decimation, cap->quality);
> -	/* if () return -EINVAL;
> +	/*
> +	 * if () return -EINVAL;
>  	 * trust the master driver that it knows what it does - so
>  	 * we allow invalid startx/y and norm for now ...
>  	 */
> @@ -603,7 +609,8 @@ static int zr36050_set_video(struct videocodec *codec, const struct tvnorm *norm
>  
>  	ptr->real_code_vol = size >> 3; /* in bytes */
>  
> -	/* Set max_block_vol here (previously in zr36050_init, moved
> +	/*
> +	 * Set max_block_vol here (previously in zr36050_init, moved
>  	 * here for consistency with zr36060 code
>  	 */
>  	zr36050_write(ptr, ZR050_MBCV, ptr->max_block_vol);
> @@ -661,7 +668,8 @@ static int zr36050_control(struct videocodec *codec, int type, int size, void *d
>  		if (size != sizeof(int))
>  			return -EFAULT;
>  		ptr->total_code_vol = *ival;
> -		/* (Kieran Morrissey)
> +		/*
> +		 * (Kieran Morrissey)
>  		 * code copied from zr36060.c to ensure proper bitrate
>  		 */
>  		ptr->real_code_vol = (ptr->total_code_vol * 6) >> 3;
> 

