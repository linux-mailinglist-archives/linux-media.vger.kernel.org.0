Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 399E22CC0A7
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 16:21:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387415AbgLBPTc convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 2 Dec 2020 10:19:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387399AbgLBPTc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Dec 2020 10:19:32 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F274DC0617A6
        for <linux-media@vger.kernel.org>; Wed,  2 Dec 2020 07:18:51 -0800 (PST)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kkTu0-0007l1-PA; Wed, 02 Dec 2020 16:18:44 +0100
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kkTu0-0007Qi-7W; Wed, 02 Dec 2020 16:18:44 +0100
Message-ID: <2dfd7785da904e9b518a0e7579d4db79a0b19276.camel@pengutronix.de>
Subject: Re: [PATCH v5 08/10] media: Quit parsing stream if doesn't start
 with SOI
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     "Mirela Rabulea (OSS)" <mirela.rabulea@oss.nxp.com>,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl, shawnguo@kernel.org,
        robh+dt@kernel.org
Cc:     paul.kocialkowski@bootlin.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-imx@nxp.com,
        s.hauer@pengutronix.de, aisheng.dong@nxp.com,
        daniel.baluta@nxp.com, robert.chiras@nxp.com,
        laurentiu.palcu@nxp.com, mark.rutland@arm.com,
        devicetree@vger.kernel.org, ezequiel@collabora.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se,
        dafna.hirschfeld@collabora.com,
        Mirela Rabulea <mirela.rabulea@nxp.com>
Date:   Wed, 02 Dec 2020 16:18:44 +0100
In-Reply-To: <20201112030557.8540-9-mirela.rabulea@oss.nxp.com>
References: <20201112030557.8540-1-mirela.rabulea@oss.nxp.com>
         <20201112030557.8540-9-mirela.rabulea@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 2020-11-12 at 05:05 +0200, Mirela Rabulea (OSS) wrote:
> From: Mirela Rabulea <mirela.rabulea@nxp.com>
> 
> In the case we get an invalid stream, such as from v4l2-compliance
> streaming test, jpeg_next_marker will end up parsing the entire
> stream. The standard describes the high level syntax of a jpeg
> as starting with SOI, ending with EOI, so return error if the very
> first 2 bytes are not SOI.
> 
> Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> ---
>  drivers/media/v4l2-core/v4l2-jpeg.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-jpeg.c b/drivers/media/v4l2-core/v4l2-jpeg.c
> index 3181ce544f79..d77e04083d57 100644
> --- a/drivers/media/v4l2-core/v4l2-jpeg.c
> +++ b/drivers/media/v4l2-core/v4l2-jpeg.c
> @@ -499,11 +499,8 @@ int v4l2_jpeg_parse_header(void *buf, size_t len, struct v4l2_jpeg_header *out)
>  	out->num_dht = 0;
>  	out->num_dqt = 0;
>  
> -	/* the first marker must be SOI */
> -	marker = jpeg_next_marker(&stream);
> -	if (marker < 0)
> -		return marker;
> -	if (marker != SOI)
> +	/* the first bytes must be SOI, B.2.1 High-level syntax */
> +	if (jpeg_get_word_be(&stream) != SOI)
>  		return -EINVAL;
>  
>  	/* init value to signal if this marker is not present */

Yes, shorter, potentially faster code, and it adheres to the
specification more strictly.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
