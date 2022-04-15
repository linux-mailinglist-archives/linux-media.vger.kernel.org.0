Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10A4B502C20
	for <lists+linux-media@lfdr.de>; Fri, 15 Apr 2022 16:47:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244467AbiDOOth (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Apr 2022 10:49:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235565AbiDOOth (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Apr 2022 10:49:37 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3387114
        for <linux-media@vger.kernel.org>; Fri, 15 Apr 2022 07:47:08 -0700 (PDT)
Received: from pendragon.ideasonboard.com (85-76-6-25-nat.elisa-mobile.fi [85.76.6.25])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 01AC725B;
        Fri, 15 Apr 2022 16:47:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650034026;
        bh=FG9D2rvgfW71jjsD9q0nsuHxXKZ8qUsOorPzx2s7WeY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=q6gjUQZ2XIQ8SHNXEJ6a5U4rFiaI3hv3g4qbjdwmcKbNuUtyD9WmWMCFRcQcHP34Q
         Uc3dySeSgoJtkswGoo6xRn+prNSyQ22ThzuzU8RX6qsbpRCTKHPtQ47TXBO0d+w1ib
         Wl0xyYXKM19K7M/AwkdndJP925KHLfB3LQOz/cVE=
Date:   Fri, 15 Apr 2022 17:47:03 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc:     linux-media@vger.kernel.org, alain.volmat@foss.st.com,
        hugues.fruchet@foss.st.com, sylvain.petinot@foss.st.com,
        dave.stevenson@raspberrypi.com, sakari.ailus@linux.intel.com,
        kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 1/5] media: v4l: Add 1X16 16-bit greyscale media bus
 code definition
Message-ID: <YlmFZ3M8qErsXGow@pendragon.ideasonboard.com>
References: <20220415111845.27130-1-benjamin.mugnier@foss.st.com>
 <20220415111845.27130-2-benjamin.mugnier@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220415111845.27130-2-benjamin.mugnier@foss.st.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin,

Thank you for the patch.

On Fri, Apr 15, 2022 at 01:18:41PM +0200, Benjamin Mugnier wrote:
> This extends the greyscale media bus family originally from
> MEDIA_BUS_FMT_Y8_1X8 up to MEDIA_BUS_FMT_Y14_1X14 by adding
> MEDIA_BUS_FMT_Y16_1X16, and behaves the same way with 16 bits.
> Add its documentation in subdev-formats.rst
> 
> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../media/v4l/subdev-formats.rst              | 37 +++++++++++++++++++
>  include/uapi/linux/media-bus-format.h         |  3 +-
>  2 files changed, 39 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> index 0cbc045d5df6..b8bb16c70d62 100644
> --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> @@ -7387,6 +7387,43 @@ The following table list existing packed 36bit wide YUV formats.
>        - v\ :sub:`2`
>        - v\ :sub:`1`
>        - v\ :sub:`0`
> +    * .. _MEDIA-BUS-FMT-Y16-1X16:
> +
> +      - MEDIA_BUS_FMT_Y16_1X16
> +      - 0x202e
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      - y\ :sub:`15`
> +      - y\ :sub:`14`
> +      - y\ :sub:`13`
> +      - y\ :sub:`12`
> +      - y\ :sub:`11`
> +      - y\ :sub:`10`
> +      - y\ :sub:`9`
> +      - y\ :sub:`8`
> +      - y\ :sub:`7`
> +      - y\ :sub:`6`
> +      - y\ :sub:`5`
> +      - y\ :sub:`4`
> +      - y\ :sub:`3`
> +      - y\ :sub:`2`
> +      - y\ :sub:`1`
> +      - y\ :sub:`0`
>  
>  
>  .. raw:: latex
> diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
> index 0dfc11ee243a..0b436759d94d 100644
> --- a/include/uapi/linux/media-bus-format.h
> +++ b/include/uapi/linux/media-bus-format.h
> @@ -65,7 +65,7 @@
>  #define MEDIA_BUS_FMT_RGB121212_1X36		0x1019
>  #define MEDIA_BUS_FMT_RGB161616_1X48		0x101a
>  
> -/* YUV (including grey) - next is	0x202e */
> +/* YUV (including grey) - next is	0x202f */
>  #define MEDIA_BUS_FMT_Y8_1X8			0x2001
>  #define MEDIA_BUS_FMT_UV8_1X8			0x2015
>  #define MEDIA_BUS_FMT_UYVY8_1_5X8		0x2002
> @@ -111,6 +111,7 @@
>  #define MEDIA_BUS_FMT_YUV12_1X36		0x2029
>  #define MEDIA_BUS_FMT_YUV16_1X48		0x202a
>  #define MEDIA_BUS_FMT_UYYVYY16_0_5X48		0x202b
> +#define MEDIA_BUS_FMT_Y16_1X16			0x202e

I was going to ask for this to be moved before MEDIA_BUS_FMT_YUV16_1X48
to match the order of the other formats, but it looks like we have
already messed up ordering, so I suppose it's ok. Please still feel free
to move it to a more appropriate place, if any.

>  
>  /* Bayer - next is	0x3021 */
>  #define MEDIA_BUS_FMT_SBGGR8_1X8		0x3001

-- 
Regards,

Laurent Pinchart
