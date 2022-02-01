Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECF794A6497
	for <lists+linux-media@lfdr.de>; Tue,  1 Feb 2022 20:06:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241237AbiBATGU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Feb 2022 14:06:20 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:39346 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234438AbiBATGU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Feb 2022 14:06:20 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C3F80332;
        Tue,  1 Feb 2022 20:06:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1643742379;
        bh=b6oXsxQS7xhBrXAJ2NGMy1++eulhoRJKXN6iMqy6wjs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JmblC968wykUhiOC8hfEczQnjTpxc/I/8AOxBDWcmOIWL4KIyEjX0DxLFo/E7A3R9
         Uzj17wlSSeGGvY91c1UwhNkwq2MROFPetVU6ePJ9+rJdfVAFKu8dde22IMLihKkwOq
         XA9AHx5jgrAFYsjOu9VHKZvpJC8Ah614HcEuCZss=
Date:   Tue, 1 Feb 2022 21:05:55 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        Eugen.Hristev@microchip.com, jbrunet@baylibre.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 08/21] media: ov5640: Re-sort per-mode register tables
Message-ID: <YfmEk0WkdeJs8bda@pendragon.ideasonboard.com>
References: <20220131143245.128089-1-jacopo@jmondi.org>
 <20220131143245.128089-9-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220131143245.128089-9-jacopo@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Mon, Jan 31, 2022 at 03:32:32PM +0100, Jacopo Mondi wrote:
> The per-mode register tables are not sorted by size. Fix it.
> 
> Cosmetic change only.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/i2c/ov5640.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index bd14e2ad22f6..d966cca78e92 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -428,7 +428,7 @@ static const struct reg_value ov5640_init_setting_30fps_VGA[] = {
>  	{0x3a1f, 0x14, 0, 0}, {0x3008, 0x02, 0, 0}, {0x3c00, 0x04, 0, 300},
>  };
>  
> -static const struct reg_value ov5640_setting_VGA_640_480[] = {
> +static const struct reg_value ov5640_setting_QQVGA_160_120[] = {
>  	{0x3c07, 0x08, 0, 0},
>  	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
>  	{0x3814, 0x31, 0, 0},
> @@ -439,11 +439,10 @@ static const struct reg_value ov5640_setting_VGA_640_480[] = {
>  	{0x3a0a, 0x00, 0, 0}, {0x3a0b, 0xf6, 0, 0}, {0x3a0e, 0x03, 0, 0},
>  	{0x3a0d, 0x04, 0, 0}, {0x3a14, 0x03, 0, 0}, {0x3a15, 0xd8, 0, 0},
>  	{0x4001, 0x02, 0, 0}, {0x4004, 0x02, 0, 0},
> -	{0x4407, 0x04, 0, 0}, {0x460b, 0x35, 0, 0}, {0x460c, 0x22, 0, 0},
> -	{0x3824, 0x02, 0, 0}, {0x5001, 0xa3, 0, 0},
> +	{0x4407, 0x04, 0, 0}, {0x5001, 0xa3, 0, 0},
>  };
>  
> -static const struct reg_value ov5640_setting_XGA_1024_768[] = {
> +static const struct reg_value ov5640_setting_QCIF_176_144[] = {
>  	{0x3c07, 0x08, 0, 0},
>  	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
>  	{0x3814, 0x31, 0, 0},
> @@ -473,7 +472,7 @@ static const struct reg_value ov5640_setting_QVGA_320_240[] = {
>  	{0x3824, 0x02, 0, 0}, {0x5001, 0xa3, 0, 0},
>  };
>  
> -static const struct reg_value ov5640_setting_QQVGA_160_120[] = {
> +static const struct reg_value ov5640_setting_VGA_640_480[] = {
>  	{0x3c07, 0x08, 0, 0},
>  	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
>  	{0x3814, 0x31, 0, 0},
> @@ -484,10 +483,11 @@ static const struct reg_value ov5640_setting_QQVGA_160_120[] = {
>  	{0x3a0a, 0x00, 0, 0}, {0x3a0b, 0xf6, 0, 0}, {0x3a0e, 0x03, 0, 0},
>  	{0x3a0d, 0x04, 0, 0}, {0x3a14, 0x03, 0, 0}, {0x3a15, 0xd8, 0, 0},
>  	{0x4001, 0x02, 0, 0}, {0x4004, 0x02, 0, 0},
> -	{0x4407, 0x04, 0, 0}, {0x5001, 0xa3, 0, 0},
> +	{0x4407, 0x04, 0, 0}, {0x460b, 0x35, 0, 0}, {0x460c, 0x22, 0, 0},
> +	{0x3824, 0x02, 0, 0}, {0x5001, 0xa3, 0, 0},
>  };
>  
> -static const struct reg_value ov5640_setting_QCIF_176_144[] = {
> +static const struct reg_value ov5640_setting_NTSC_720_480[] = {
>  	{0x3c07, 0x08, 0, 0},
>  	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
>  	{0x3814, 0x31, 0, 0},
> @@ -502,7 +502,7 @@ static const struct reg_value ov5640_setting_QCIF_176_144[] = {
>  	{0x3824, 0x02, 0, 0}, {0x5001, 0xa3, 0, 0},
>  };
>  
> -static const struct reg_value ov5640_setting_NTSC_720_480[] = {
> +static const struct reg_value ov5640_setting_PAL_720_576[] = {
>  	{0x3c07, 0x08, 0, 0},
>  	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
>  	{0x3814, 0x31, 0, 0},
> @@ -517,7 +517,7 @@ static const struct reg_value ov5640_setting_NTSC_720_480[] = {
>  	{0x3824, 0x02, 0, 0}, {0x5001, 0xa3, 0, 0},
>  };
>  
> -static const struct reg_value ov5640_setting_PAL_720_576[] = {
> +static const struct reg_value ov5640_setting_XGA_1024_768[] = {
>  	{0x3c07, 0x08, 0, 0},
>  	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
>  	{0x3814, 0x31, 0, 0},

Is it me, or does this mean that ov5640_setting_XGA_1024_768,
ov5640_setting_QCIF_176_144, ov5640_setting_PAL_720_576 and
ov5640_setting_NTSC_720_480 are all identical ?

-- 
Regards,

Laurent Pinchart
