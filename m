Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 532CF5F703A
	for <lists+linux-media@lfdr.de>; Thu,  6 Oct 2022 23:27:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232488AbiJFV1a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Oct 2022 17:27:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232491AbiJFV1K (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Oct 2022 17:27:10 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A1D5BA259
        for <linux-media@vger.kernel.org>; Thu,  6 Oct 2022 14:27:04 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B00AE4DD;
        Thu,  6 Oct 2022 23:27:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1665091621;
        bh=cqqRwe6+FTyGXgQygJKcIo4dlMKHnXVyM3ng7hZZqaA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jdHnXRhX8Z3IKTW9No0R/wY/VlH5wJEbOy8z9vfq0yeSojnkOSYt5SbNTmdQM+MhM
         feJ0BG/FzlFK5qgWmeo+95X8a+kjoaumYD3+LWFFjJTP21xKQZr13dyrY9PSQGx4qJ
         R99qA3sPA8K823Nqy76NUf1EleqViu9baGnNc3w0=
Date:   Fri, 7 Oct 2022 00:26:56 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc:     linux-media@vger.kernel.org, alain.volmat@foss.st.com,
        hugues.fruchet@foss.st.com, sylvain.petinot@foss.st.com,
        dave.stevenson@raspberrypi.com, sakari.ailus@linux.intel.com,
        kieran.bingham@ideasonboard.com, nicolas@ndufresne.ca,
        hverkuil@xs4all.nl
Subject: Re: [PATCH v6 1/4] media: v4l: Add 1X16 16-bit greyscale media bus
 code definition
Message-ID: <Yz9IIN2Jgum27tk0@pendragon.ideasonboard.com>
References: <20220927083702.14138-1-benjamin.mugnier@foss.st.com>
 <20220927083702.14138-2-benjamin.mugnier@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220927083702.14138-2-benjamin.mugnier@foss.st.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin,

Thank you for the patch.

On Tue, Sep 27, 2022 at 10:36:59AM +0200, Benjamin Mugnier wrote:
> This extends the greyscale media bus family originally from
> MEDIA_BUS_FMT_Y8_1X8 up to MEDIA_BUS_FMT_Y14_1X14 by adding
> MEDIA_BUS_FMT_Y16_1X16, and behaves the same way with 16 bits.
> Add its documentation in subdev-formats.rst
> 
> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> ---
>  .../media/v4l/subdev-formats.rst              | 37 +++++++++++++++++++
>  include/uapi/linux/media-bus-format.h         |  3 +-
>  2 files changed, 39 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> index d21d532eee15..19025e9ba447 100644
> --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> @@ -7355,6 +7355,43 @@ the following codes.
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

Could you please add this right after MEDIA_BUS_FMT_Y14_1X14 ? Same in include/uapi/linux/media-bus-format.h. With this change,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  
>  
>  .. raw:: latex
> diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
> index ec3323dbb927..b078dd125e57 100644
> --- a/include/uapi/linux/media-bus-format.h
> +++ b/include/uapi/linux/media-bus-format.h
> @@ -69,7 +69,7 @@
>  #define MEDIA_BUS_FMT_RGB121212_1X36		0x1019
>  #define MEDIA_BUS_FMT_RGB161616_1X48		0x101a
>  
> -/* YUV (including grey) - next is	0x202e */
> +/* YUV (including grey) - next is	0x202f */
>  #define MEDIA_BUS_FMT_Y8_1X8			0x2001
>  #define MEDIA_BUS_FMT_UV8_1X8			0x2015
>  #define MEDIA_BUS_FMT_UYVY8_1_5X8		0x2002
> @@ -115,6 +115,7 @@
>  #define MEDIA_BUS_FMT_YUV12_1X36		0x2029
>  #define MEDIA_BUS_FMT_YUV16_1X48		0x202a
>  #define MEDIA_BUS_FMT_UYYVYY16_0_5X48		0x202b
> +#define MEDIA_BUS_FMT_Y16_1X16			0x202e
>  
>  /* Bayer - next is	0x3021 */
>  #define MEDIA_BUS_FMT_SBGGR8_1X8		0x3001

-- 
Regards,

Laurent Pinchart
