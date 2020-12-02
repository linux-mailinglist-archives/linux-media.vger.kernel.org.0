Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BC812CC0B9
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 16:24:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730273AbgLBPXa convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 2 Dec 2020 10:23:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729081AbgLBPXa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Dec 2020 10:23:30 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75E3DC0613D4
        for <linux-media@vger.kernel.org>; Wed,  2 Dec 2020 07:22:50 -0800 (PST)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kkTxq-0008L2-BK; Wed, 02 Dec 2020 16:22:42 +0100
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kkTxp-0007sg-Kb; Wed, 02 Dec 2020 16:22:41 +0100
Message-ID: <880ad9cc8fd0cc1750535ab9481d277de9acf9e1.camel@pengutronix.de>
Subject: Re: [PATCH v5 09/10] media: Avoid parsing quantization and huffman
 tables
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
Date:   Wed, 02 Dec 2020 16:22:41 +0100
In-Reply-To: <20201112030557.8540-10-mirela.rabulea@oss.nxp.com>
References: <20201112030557.8540-1-mirela.rabulea@oss.nxp.com>
         <20201112030557.8540-10-mirela.rabulea@oss.nxp.com>
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

Hi Mirela,

On Thu, 2020-11-12 at 05:05 +0200, Mirela Rabulea (OSS) wrote:
> From: Mirela Rabulea <mirela.rabulea@nxp.com>
> 
> These are optional in struct v4l2_jpeg_header, so do not parse if
> not requested, save some time.
> 
> Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> ---
>  drivers/media/v4l2-core/v4l2-jpeg.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-jpeg.c b/drivers/media/v4l2-core/v4l2-jpeg.c
> index d77e04083d57..7576cd0ce6b9 100644
> --- a/drivers/media/v4l2-core/v4l2-jpeg.c
> +++ b/drivers/media/v4l2-core/v4l2-jpeg.c
> @@ -307,6 +307,9 @@ static int jpeg_parse_quantization_tables(struct jpeg_stream *stream,
>  {
>  	int len = jpeg_get_word_be(stream);
>  
> +	if (!tables)
> +		return 0;
> +
>  	if (len < 0)
>  		return len;
>  	/* Lq = 2 + n * 65 (for baseline DCT), n >= 1 */
> @@ -361,6 +364,9 @@ static int jpeg_parse_huffman_tables(struct jpeg_stream *stream,
>  	int mt;
>  	int len = jpeg_get_word_be(stream);
>  
> +	if (!tables)
> +		return 0;
> +
>  	if (len < 0)
>  		return len;
>  	/* Table B.5 - Huffman table specification parameter sizes and values */

I don't understand this. jpeg_parse_quantization_tables() is only called
if v4l2_jpeg_parse_header() finds a DQT marker. The entire quantization
table-specification parameter block is optional, but when a DQT marker
is present, IIUC the block must contain at least one table (see B.2.4.1,
specifically figure B.6).

regards
Philipp
