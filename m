Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B127F777F5
	for <lists+linux-media@lfdr.de>; Sat, 27 Jul 2019 11:43:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387494AbfG0Jnm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 Jul 2019 05:43:42 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:43315 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387400AbfG0Jnm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 Jul 2019 05:43:42 -0400
X-Originating-IP: 176.158.46.5
Received: from aptenodytes (static-176-158-46-5.ftth.abo.bbox.fr [176.158.46.5])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 10BF820004;
        Sat, 27 Jul 2019 09:43:39 +0000 (UTC)
Date:   Sat, 27 Jul 2019 11:43:39 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Maxime Jourdan <mjourdan@baylibre.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 04/14] videodev2.h.rst.exceptions: tymecode -> timecode
Message-ID: <20190727094339.GC16618@aptenodytes>
References: <20190724110523.29248-1-hverkuil-cisco@xs4all.nl>
 <20190724110523.29248-5-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190724110523.29248-5-hverkuil-cisco@xs4all.nl>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Wed 24 Jul 19, 13:05, Hans Verkuil wrote:
> Fix typo.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Looks good!

Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Cheers,

Paul

> ---
>  Documentation/media/videodev2.h.rst.exceptions | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/media/videodev2.h.rst.exceptions b/Documentation/media/videodev2.h.rst.exceptions
> index 0a9a1b386443..b6cb9fa6c8a8 100644
> --- a/Documentation/media/videodev2.h.rst.exceptions
> +++ b/Documentation/media/videodev2.h.rst.exceptions
> @@ -183,14 +183,14 @@ replace define V4L2_FMT_FLAG_EMULATED fmtdesc-flags
>  replace define V4L2_FMT_FLAG_HAS_BITSTREAM_PARSER fmtdesc-flags
>  replace define V4L2_FMT_FLAG_DYN_RESOLUTION fmtdesc-flags
>  
> -# V4L2 tymecode types
> +# V4L2 timecode types
>  replace define V4L2_TC_TYPE_24FPS timecode-type
>  replace define V4L2_TC_TYPE_25FPS timecode-type
>  replace define V4L2_TC_TYPE_30FPS timecode-type
>  replace define V4L2_TC_TYPE_50FPS timecode-type
>  replace define V4L2_TC_TYPE_60FPS timecode-type
>  
> -# V4L2 tymecode flags
> +# V4L2 timecode flags
>  replace define V4L2_TC_FLAG_DROPFRAME timecode-flags
>  replace define V4L2_TC_FLAG_COLORFRAME timecode-flags
>  replace define V4L2_TC_USERBITS_field timecode-flags
> -- 
> 2.20.1
> 

-- 
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
