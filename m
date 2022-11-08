Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAD35620CAF
	for <lists+linux-media@lfdr.de>; Tue,  8 Nov 2022 10:50:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233418AbiKHJuf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Nov 2022 04:50:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233333AbiKHJue (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Nov 2022 04:50:34 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 393E6F67
        for <linux-media@vger.kernel.org>; Tue,  8 Nov 2022 01:50:33 -0800 (PST)
Received: from pyrite.rasen.tech (h175-177-042-159.catv02.itscom.jp [175.177.42.159])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4D8C5492;
        Tue,  8 Nov 2022 10:50:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1667901030;
        bh=BEMRkTg4iU4cvwxwJvygXqRZp7hRHN+rta5L/4Z5b2o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MsTieU+WuvLsz+FgXH1PGw3RFfLbJUrLxrWiJniaMMGc+guSYd1AqtUZN0Iw/Tp78
         T8VV0BTaST9p/y3915qG3x3UWSRmbmin4DvJSz8HSn7CuMaRDD9yz7CWI9IEft7bFI
         lyUxSLNkrQTJmyiZW6zWrPjxKi8vKnYjHGWiz/MU=
Date:   Tue, 8 Nov 2022 18:50:22 +0900
From:   Paul Elder <paul.elder@ideasonboard.com>
To:     Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc:     linux-media@vger.kernel.org, alain.volmat@foss.st.com,
        hugues.fruchet@foss.st.com, sylvain.petinot@foss.st.com,
        dave.stevenson@raspberrypi.com, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com,
        nicolas@ndufresne.ca, hverkuil@xs4all.nl
Subject: Re: [PATCH v7 1/5] media: v4l: Add 1X16 16-bit greyscale media bus
 code definition
Message-ID: <Y2omXpfvxxEUgMTt@pyrite.rasen.tech>
References: <20221011120555.28889-1-benjamin.mugnier@foss.st.com>
 <20221011121605.30260-1-benjamin.mugnier@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221011121605.30260-1-benjamin.mugnier@foss.st.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 11, 2022 at 02:16:01PM +0200, Benjamin Mugnier wrote:
> This extends the greyscale media bus family originally from
> MEDIA_BUS_FMT_Y8_1X8 up to MEDIA_BUS_FMT_Y14_1X14 by adding
> MEDIA_BUS_FMT_Y16_1X16, and behaves the same way with 16 bits.
> Add its documentation in subdev-formats.rst
> 
> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

> ---
>  .../media/v4l/subdev-formats.rst              | 37 +++++++++++++++++++
>  include/uapi/linux/media-bus-format.h         |  3 +-
>  2 files changed, 39 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> index d21d532eee15..16ef3b41932e 100644
> --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> @@ -6057,6 +6057,43 @@ the following codes.
>        - y\ :sub:`2`
>        - y\ :sub:`1`
>        - y\ :sub:`0`
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
>      * .. _MEDIA-BUS-FMT-UYVY8-1X16:
>  
>        - MEDIA_BUS_FMT_UYVY8_1X16
> diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
> index ec3323dbb927..ca9a24c874da 100644
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
> @@ -92,6 +92,7 @@
>  #define MEDIA_BUS_FMT_YUYV12_2X12		0x201e
>  #define MEDIA_BUS_FMT_YVYU12_2X12		0x201f
>  #define MEDIA_BUS_FMT_Y14_1X14			0x202d
> +#define MEDIA_BUS_FMT_Y16_1X16			0x202e
>  #define MEDIA_BUS_FMT_UYVY8_1X16		0x200f
>  #define MEDIA_BUS_FMT_VYUY8_1X16		0x2010
>  #define MEDIA_BUS_FMT_YUYV8_1X16		0x2011
> -- 
> 2.25.1
> 
