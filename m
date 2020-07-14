Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABD0322012E
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2020 01:57:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726752AbgGNX5e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jul 2020 19:57:34 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:47384 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726472AbgGNX5d (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jul 2020 19:57:33 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8D17B71D;
        Wed, 15 Jul 2020 01:57:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594771051;
        bh=505PYOaKOPtxIkgSfLsWoYDZ4c4pYIGlrcD54+Ayto8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ajYc/TZc9lE55KX5vnNGC3EghFXg1qJW0EG6Ic+sPkWFVqGgDaYGUGP9VFFuCVCbR
         KZY/V124cShD0rM+RtV+CTJhqfSXy5V9jTrOEHmQd+Lu/mGc3nv2Zb4OxT73j8MO5q
         5S1/dDIN5400zBk5R3NcLyeoLvRr5IsgeUxOl+Qk=
Date:   Wed, 15 Jul 2020 02:57:24 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc:     hyun.kwon@xilinx.com, mchehab@kernel.org, robh+dt@kernel.org,
        michal.simek@xilinx.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Replace HTTP links with HTTPS ones: Xilinx video IP cores
Message-ID: <20200714235724.GR5854@pendragon.ideasonboard.com>
References: <20200705075524.22657-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200705075524.22657-1-grandmaster@al2klimov.de>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexander,

Thank you for the patch.

The subject line should be

dt-bindings: media: xilinx: Replace HTTP links with HTTPS ones

On Sun, Jul 05, 2020 at 09:55:24AM +0200, Alexander A. Klimov wrote:
> Rationale:
> Reduces attack surface on kernel devs opening the links for MITM
> as HTTPS traffic is much harder to manipulate.
> 
> Deterministic algorithm:
> For each file:
>   If not .svg:
>     For each line:
>       If doesn't contain `\bxmlns\b`:
>         For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
>           If both the HTTP and HTTPS versions
>           return 200 OK and serve the same content:
>             Replace HTTP with HTTPS.
> 
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Will you get this patch merged as part of a bigger series, or do you
expect us to take care of it ? In the latter case, if you agree with the
subject line change, there's no need to resubmit, I can fix this when
applying the patch.

> ---
>  Continuing my work started at 93431e0607e5.
> 
>  If there are any URLs to be removed completely or at least not HTTPSified:
>  Just clearly say so and I'll *undo my change*.
>  See also https://lkml.org/lkml/2020/6/27/64
> 
>  If there are any valid, but yet not changed URLs:
>  See https://lkml.org/lkml/2020/6/26/837
> 
>  Documentation/devicetree/bindings/media/xilinx/video.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/xilinx/video.txt b/Documentation/devicetree/bindings/media/xilinx/video.txt
> index 68ac210e688e..d0335ca0cd57 100644
> --- a/Documentation/devicetree/bindings/media/xilinx/video.txt
> +++ b/Documentation/devicetree/bindings/media/xilinx/video.txt
> @@ -32,4 +32,4 @@ The following properties are common to all Xilinx video IP cores.
>    defaults to "mono".
>  
>  
> -[UG934] http://www.xilinx.com/support/documentation/ip_documentation/axi_videoip/v1_0/ug934_axi_videoIP.pdf
> +[UG934] https://www.xilinx.com/support/documentation/ip_documentation/axi_videoip/v1_0/ug934_axi_videoIP.pdf

-- 
Regards,

Laurent Pinchart
