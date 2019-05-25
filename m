Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95A3A2A478
	for <lists+linux-media@lfdr.de>; Sat, 25 May 2019 14:51:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726903AbfEYMvm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 May 2019 08:51:42 -0400
Received: from mailoutvs9.siol.net ([185.57.226.200]:53339 "EHLO mail.siol.net"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726585AbfEYMvm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 May 2019 08:51:42 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 37BEE52243C;
        Sat, 25 May 2019 14:51:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta09.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta09.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id mbbF_S_xVf-j; Sat, 25 May 2019 14:51:37 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id BC98B522442;
        Sat, 25 May 2019 14:51:37 +0200 (CEST)
Received: from jernej-laptop.localnet (89-212-178-211.dynamic.t-2.net [89.212.178.211])
        (Authenticated sender: jernej.skrabec@siol.net)
        by mail.siol.net (Postfix) with ESMTPA id 2A20C52243C;
        Sat, 25 May 2019 14:51:35 +0200 (CEST)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@googlegroups.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v5 2/4] media: pixfmt: Add HEVC slice pixel format
Date:   Sat, 25 May 2019 14:51:34 +0200
Message-ID: <9334832.WyQZ0g7QqJ@jernej-laptop>
In-Reply-To: <20190524093635.1832-3-paul.kocialkowski@bootlin.com>
References: <20190524093635.1832-1-paul.kocialkowski@bootlin.com> <20190524093635.1832-3-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi!

Dne petek, 24. maj 2019 ob 11:36:33 CEST je Paul Kocialkowski napisal(a):
> Introduce the V4L2_PIX_FMT_HEVC_SLICE pixel format, which currently
> describes an output buffer with enough appended slice data for
> producing one decoded frame with a stateless video decoder.
> 
> This will need to be reworked (along with the controls and the core) to
> allow passing slice data individually, as it is the natural decoding
> unit in HEVC.
> 
> We also need to figure out the description of the possible source data:
> * Compressed slice data only, with slice controls attached;
> * Slice data in Annex-B format (with raw slice header), without slice
>   controls attached;
> * Slice data in Annex-B format (with raw slice header), with slice
>   controls attached.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  include/media/hevc-ctrls.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
> index 9ea013c88afc..2de83d9f6d47 100644
> --- a/include/media/hevc-ctrls.h
> +++ b/include/media/hevc-ctrls.h
> @@ -11,6 +11,9 @@
>  #ifndef _HEVC_CTRLS_H_
>  #define _HEVC_CTRLS_H_
> 
> +/* The pixel format isn't stable at the moment and will likely be renamed.
> */ +#define V4L2_PIX_FMT_HEVC_SLICE v4l2_fourcc('S', '2', '6', '5') /* HEVC

You should add include to cover v4l2_fourcc() macro.

Best regards,
Jernej

> parsed slices */ +
>  #define V4L2_CID_MPEG_VIDEO_HEVC_SPS		(V4L2_CID_MPEG_BASE + 
1008)
>  #define V4L2_CID_MPEG_VIDEO_HEVC_PPS		(V4L2_CID_MPEG_BASE + 
1009)
>  #define V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS	(V4L2_CID_MPEG_BASE + 
1010)




