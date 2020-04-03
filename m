Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7566819D540
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2020 12:48:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727882AbgDCKsO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Apr 2020 06:48:14 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:43494 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727792AbgDCKsN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Apr 2020 06:48:13 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4A9C9321;
        Fri,  3 Apr 2020 12:48:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1585910891;
        bh=lGzuNQEbCzLF8Wpv9hZcBeG9DrOSn6prwv9DbueiK6k=;
        h=Reply-To:Subject:To:References:From:Date:In-Reply-To:From;
        b=W1vHFe2kyiBzZukEv5lmzrRtdXIUZ60HJvVVADrbJnsoMzagOF+w1ll8dHlZPUrjX
         soE/dto283J/5+CfiXr37qgaUzKqDKXAymi3Xijxw/XbaMFCyb6fkNulO+hlYGsTb4
         uygqxbOCQ4oPxqXYI0biS70+OrFkDVLA2jwRYfjE=
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v5 2/9] media: adv748x: include everything adv748x.h needs
 into the file
To:     Alex Riesen <alexander.riesen@cetitec.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        devel@driverdev.osuosl.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <cover.1585852001.git.alexander.riesen@cetitec.com>
 <046f909122e03286faf0a8916f30d56259656e14.1585852001.git.alexander.riesen@cetitec.com>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Openpgp: preference=signencrypt
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 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
 WZw01QYHU/GUV/zHJSFk
Organization: Ideas on Board
Message-ID: <b56c7c08-d5f7-0b2a-350c-322401e07005@ideasonboard.com>
Date:   Fri, 3 Apr 2020 11:48:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <046f909122e03286faf0a8916f30d56259656e14.1585852001.git.alexander.riesen@cetitec.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alex,

On 02/04/2020 19:34, Alex Riesen wrote:
> To follow the established practice of not depending on others to
> pull everything in. While at it, make sure it stays like this.

Good call!

Small extra trivial comment below...

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> Signed-off-by: Alexander Riesen <alexander.riesen@cetitec.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/adv748x/adv748x-afe.c  | 6 ++----
>  drivers/media/i2c/adv748x/adv748x-core.c | 6 ++----
>  drivers/media/i2c/adv748x/adv748x-csi2.c | 6 ++----
>  drivers/media/i2c/adv748x/adv748x-hdmi.c | 6 ++----
>  drivers/media/i2c/adv748x/adv748x.h      | 2 ++
>  5 files changed, 10 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/media/i2c/adv748x/adv748x-afe.c b/drivers/media/i2c/adv748x/adv748x-afe.c
> index dbbb1e4d6363..5a25d1fbe25f 100644
> --- a/drivers/media/i2c/adv748x/adv748x-afe.c
> +++ b/drivers/media/i2c/adv748x/adv748x-afe.c
> @@ -6,18 +6,16 @@
>   * Copyright (C) 2017 Renesas Electronics Corp.
>   */
>  
> +#include "adv748x.h"
> +
>  #include <linux/delay.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  #include <linux/v4l2-dv-timings.h>
>  
> -#include <media/v4l2-ctrls.h>
> -#include <media/v4l2-device.h>
>  #include <media/v4l2-dv-timings.h>
>  #include <media/v4l2-ioctl.h>
>  
> -#include "adv748x.h"
> -
>  /* -----------------------------------------------------------------------------
>   * SDP
>   */
> diff --git a/drivers/media/i2c/adv748x/adv748x-core.c b/drivers/media/i2c/adv748x/adv748x-core.c
> index c3fb113cef62..5c59aad319d1 100644
> --- a/drivers/media/i2c/adv748x/adv748x-core.c
> +++ b/drivers/media/i2c/adv748x/adv748x-core.c
> @@ -10,6 +10,8 @@
>   *	Kieran Bingham <kieran.bingham@ideasonboard.com>
>   */
>  
> +#include "adv748x.h"
> +
>  #include <linux/delay.h>
>  #include <linux/errno.h>
>  #include <linux/i2c.h>

As linux/i2c.h is included in adv748x.h, we can remove this entry.

> @@ -20,14 +22,10 @@
>  #include <linux/slab.h>
>  #include <linux/v4l2-dv-timings.h>
>  
> -#include <media/v4l2-ctrls.h>
> -#include <media/v4l2-device.h>
>  #include <media/v4l2-dv-timings.h>
>  #include <media/v4l2-fwnode.h>
>  #include <media/v4l2-ioctl.h>
>  
> -#include "adv748x.h"
> -
>  /* -----------------------------------------------------------------------------
>   * Register manipulation
>   */
> diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
> index c43ce5d78723..c00d4f347d95 100644
> --- a/drivers/media/i2c/adv748x/adv748x-csi2.c
> +++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
> @@ -5,15 +5,13 @@
>   * Copyright (C) 2017 Renesas Electronics Corp.
>   */
>  
> +#include "adv748x.h"
> +
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  
> -#include <media/v4l2-ctrls.h>
> -#include <media/v4l2-device.h>
>  #include <media/v4l2-ioctl.h>
>  
> -#include "adv748x.h"
> -
>  static int adv748x_csi2_set_virtual_channel(struct adv748x_csi2 *tx,
>  					    unsigned int vc)
>  {
> diff --git a/drivers/media/i2c/adv748x/adv748x-hdmi.c b/drivers/media/i2c/adv748x/adv748x-hdmi.c
> index c557f8fdf11a..f598acec3b5c 100644
> --- a/drivers/media/i2c/adv748x/adv748x-hdmi.c
> +++ b/drivers/media/i2c/adv748x/adv748x-hdmi.c
> @@ -5,18 +5,16 @@
>   * Copyright (C) 2017 Renesas Electronics Corp.
>   */
>  
> +#include "adv748x.h"
> +
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  
> -#include <media/v4l2-ctrls.h>
> -#include <media/v4l2-device.h>
>  #include <media/v4l2-dv-timings.h>
>  #include <media/v4l2-ioctl.h>
>  
>  #include <uapi/linux/v4l2-dv-timings.h>
>  
> -#include "adv748x.h"
> -
>  /* -----------------------------------------------------------------------------
>   * HDMI and CP
>   */
> diff --git a/drivers/media/i2c/adv748x/adv748x.h b/drivers/media/i2c/adv748x/adv748x.h
> index fccb388ce179..09aab4138c3f 100644
> --- a/drivers/media/i2c/adv748x/adv748x.h
> +++ b/drivers/media/i2c/adv748x/adv748x.h
> @@ -19,6 +19,8 @@
>   */
>  
>  #include <linux/i2c.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
>  
>  #ifndef _ADV748X_H_
>  #define _ADV748X_H_
> 

-- 
Regards
--
Kieran
