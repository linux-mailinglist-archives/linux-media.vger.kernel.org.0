Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D818F359649
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 09:25:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231371AbhDIHXw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 03:23:52 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:34093 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229703AbhDIHXw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 9 Apr 2021 03:23:52 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id UlUBlYkTxgIC3UlUFlBLws; Fri, 09 Apr 2021 09:23:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1617953018; bh=APMETB3zEpAOU0Fhyt/OJ+787Q+BXlzWzrvJwZIggc4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=N5ap1onb6j7+Tx4jnvefbPQ4XZO6dcDfKA6Kg3aiUFMbmUlU2XJCkUVxI7fG5tuz7
         MjAjKLL65r0ZN0B+Mak7LFOGTExr7X4jjBtWTt2dUH78W8dslnG8cj3uC26Qc7VYDz
         GDodWjMGFW3bwUaKQByvTw+3ITI5zY8EqJxubjt8a+8IvPVYhC7lE5GddyhmoS4qzU
         /NrJyLrt0xDftUF2zVYym3QgG4KSUAhyRQXvcDE89cNYtWocCacZb7HmwrbBcEMqu6
         q+ykCImDfWJywMRmofDN/dYV1VJxQK+nqvXSDhq3IdEB7Jc9KBGyGrvSFw08t5IsgE
         +L3cIngH8UolQ==
Subject: Re: [PATCH 1/2] media: zoran: add spaces around '<<'
To:     Mitali Borkar <mitaliborkar810@gmail.com>, clabbe@baylibre.com,
        mchehab@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        mitali_s@me.iitr.ac.in
References: <cover.1617912177.git.mitaliborkar810@gmail.com>
 <8e8ac690d97478f7cbb9b91d46ef7a95e4444e5f.1617912177.git.mitaliborkar810@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <f196d8ff-e8bf-360e-ee7b-cd2dcafd9742@xs4all.nl>
Date:   Fri, 9 Apr 2021 09:23:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <8e8ac690d97478f7cbb9b91d46ef7a95e4444e5f.1617912177.git.mitaliborkar810@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfFSut/hMT23athPR8Gw35GGx/7yXe9fJ57927job9mtszK0c4rZKiinzjFbtd3e44QBA4nA09Oqpr1SAofOFrNl4o1NKVo4d+FgCAMkv5hY4BZO8Pkkz
 epx9AWKyNxlz0P/GzrQx5c5roQHyX8uHpC2D3x2C+UiSELaiP26oprS2JTs4qKKLmiAlieX/A5XELkDe8tIXflQvKj8c/zJZnAMja4qRkVo1EZs4jEuHsg6r
 OW4abAbqpNqN9Yg5Yjw+BzhX7p3ZV3eGxRG+e18+zqAsGK+t0CdJONWL0em9CVMOPSiZCNx3zfto1Kn+/gYzaWNnrq7o/Vm8TVdq1mEtXd4kVVdKAVcXEX6M
 T9Liy9eCfmp2QB3s3FTzYGUbiquD/4wFhMpSIdCevvEm13DgXndvgbghO4lpFAz1jEyoJqQb62UUpamtKhL+qM/Vy+V4Jeb99pNhsBf70uBVp9fDyXs4CYpM
 Dt+v5t40l6tIuvVDgOiVv2E7/r87EaRZg+bn6g==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mitali,

On 08/04/2021 22:38, Mitali Borkar wrote:
> Added spaces around '<<' operator to improve readability and meet linux
> kernel coding style.
> Reported by checkpatch
> 
> Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> ---
>  drivers/staging/media/zoran/zr36057.h | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/media/zoran/zr36057.h b/drivers/staging/media/zoran/zr36057.h
> index 71b651add35a..a2a75fd9f535 100644
> --- a/drivers/staging/media/zoran/zr36057.h
> +++ b/drivers/staging/media/zoran/zr36057.h
> @@ -30,13 +30,13 @@
>  #define ZR36057_VFESPFR_HOR_DCM          14
>  #define ZR36057_VFESPFR_VER_DCM          8
>  #define ZR36057_VFESPFR_DISP_MODE        6
> -#define ZR36057_VFESPFR_YUV422          (0<<3)
> -#define ZR36057_VFESPFR_RGB888          (1<<3)
> -#define ZR36057_VFESPFR_RGB565          (2<<3)
> -#define ZR36057_VFESPFR_RGB555          (3<<3)
> -#define ZR36057_VFESPFR_ERR_DIF          (1<<2)
> -#define ZR36057_VFESPFR_PACK24          (1<<1)
> -#define ZR36057_VFESPFR_LITTLE_ENDIAN    (1<<0)
> +#define ZR36057_VFESPFR_YUV422          (0 << 3)
> +#define ZR36057_VFESPFR_RGB888          (1 << 3)
> +#define ZR36057_VFESPFR_RGB565          (2 << 3)
> +#define ZR36057_VFESPFR_RGB555          (3 << 3)
> +#define ZR36057_VFESPFR_ERR_DIF          (1 << 2)
> +#define ZR36057_VFESPFR_PACK24          (1 << 1)
> +#define ZR36057_VFESPFR_LITTLE_ENDIAN    (1 << 0)
>  
>  #define ZR36057_VDTR            0x00c	/* Video Display "Top" Register */
>  
> 

I looked at that header and it is very messy.

Can you make two new patches? The first aligns every nicely, e.g. this:

#define ZR36057_VFEHCR          0x000   /* Video Front End, Horizontal Configuration Register */
#define ZR36057_VFEHCR_HS_POL             BIT(30)
#define ZR36057_VFEHCR_H_START           10
#define ZR36057_VFEHCR_H_END            0
#define ZR36057_VFEHCR_HMASK            0x3ff

should become:

/* Video Front End, Horizontal Configuration Register */
#define ZR36057_VFEHCR			0x000
#define ZR36057_VFEHCR_HS_POL		BIT(30)
#define ZR36057_VFEHCR_H_START		10
#define ZR36057_VFEHCR_H_END		0
#define ZR36057_VFEHCR_HMASK		0x3ff

Same for all the other register blocks. Use tabs to do the alignment
instead of spaces, as is currently the case.

The second patch can replace the (0<<3) etc. to BIT(0).

That would be a nice cleanup of this rather messy header.

Thanks!

	Hans
