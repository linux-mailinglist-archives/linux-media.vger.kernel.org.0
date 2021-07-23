Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 585783D39B8
	for <lists+linux-media@lfdr.de>; Fri, 23 Jul 2021 13:44:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234422AbhGWLEK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Jul 2021 07:04:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234255AbhGWLEJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Jul 2021 07:04:09 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA5EFC061575
        for <linux-media@vger.kernel.org>; Fri, 23 Jul 2021 04:44:42 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 631F73F2;
        Fri, 23 Jul 2021 13:44:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1627040681;
        bh=JHz/Csmf+EYiqA9Bpq8OJoQQuG3Ke8RVgt/voA3SM2c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cPe1by62EgaF/Rck2LOGzJjR6EhSQ1lXVxu3gNb0186l0a2TrY1KRvr5Spp3A1PC/
         NWuoSrL5XyY8c6Yf6Al8TPbiWsixWBusIvLN+E1hrMuQfJhmwy2HIhzouwiLQ+vjJe
         xU/UaIuEgMvKcy+JNDoeu7gBi34fZLwD98ImfV8k=
Date:   Fri, 23 Jul 2021 14:44:39 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Umang Jain <umang.jain@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [libcamera-devel] [PATCH 2/2] media: imx258: Limit the max
 analogue gain to 480
Message-ID: <YPqrp7BKNhzKN8xa@pendragon.ideasonboard.com>
References: <20210723112233.1361319-1-umang.jain@ideasonboard.com>
 <20210723112233.1361319-3-umang.jain@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210723112233.1361319-3-umang.jain@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Umang,

Thank you for the patch.

CC'ing Sakari. For future kernel patches, you can use the
./scripts/get_maintainer.pl script in the kernel sources to get a list
of appropriate recipients. The list should be taken with a grain of salt
though, it has a tendency to return too many recipients. For this
particular patch, for instance, it also recommends Mauro and LKML.
Whether to CC the subsystem maintainer on every patch depends on the
subsystem (it's more common for small ones than big ones) and on the
maintainer's preferences. LKML is a catch-all mailing list with very
high traffic, and when more appropriate venues exist for patches, I
usually recommend skipping LKML.

On Fri, Jul 23, 2021 at 04:52:33PM +0530, Umang Jain wrote:
> The range for analog gain mentioned in the datasheet is [0, 480].
> The real gain formula mentioned in the datasheet is:
> 
> 	Gain = 512 / (512 – X)
> 
> Hence, values larger than 511 clearly makes no sense. The gain
> register field is also documented to be of 9-bits in the datasheet.
> 
> Certainly, it is enough to infer that, the kernel driver currently
> advertises an arbitrary analog gain max. Fix it by rectifying the
> value as per the data sheet i.e. 480.
> 
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/imx258.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
> index 4e695096e5d0..81cdf37216ca 100644
> --- a/drivers/media/i2c/imx258.c
> +++ b/drivers/media/i2c/imx258.c
> @@ -47,7 +47,7 @@
>  /* Analog gain control */
>  #define IMX258_REG_ANALOG_GAIN		0x0204
>  #define IMX258_ANA_GAIN_MIN		0
> -#define IMX258_ANA_GAIN_MAX		0x1fff
> +#define IMX258_ANA_GAIN_MAX		480
>  #define IMX258_ANA_GAIN_STEP		1
>  #define IMX258_ANA_GAIN_DEFAULT		0x0
>  

-- 
Regards,

Laurent Pinchart
