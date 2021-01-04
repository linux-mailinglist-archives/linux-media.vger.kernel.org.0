Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D4282E9B8F
	for <lists+linux-media@lfdr.de>; Mon,  4 Jan 2021 18:01:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728106AbhADRBo convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 4 Jan 2021 12:01:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727756AbhADRBn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Jan 2021 12:01:43 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56E0BC061574
        for <linux-media@vger.kernel.org>; Mon,  4 Jan 2021 09:01:03 -0800 (PST)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kwTE0-0002WN-FS; Mon, 04 Jan 2021 18:00:56 +0100
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kwTDz-0007W2-J6; Mon, 04 Jan 2021 18:00:55 +0100
Message-ID: <eb68242108a6ad7ad604616fb78bea2fb09dffc2.camel@pengutronix.de>
Subject: Re: [PATCH v6 8/9] media: Avoid parsing quantization and huffman
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
Date:   Mon, 04 Jan 2021 18:00:55 +0100
In-Reply-To: <20201215111843.30269-9-mirela.rabulea@oss.nxp.com>
References: <20201215111843.30269-1-mirela.rabulea@oss.nxp.com>
         <20201215111843.30269-9-mirela.rabulea@oss.nxp.com>
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

On Tue, 2020-12-15 at 13:18 +0200, Mirela Rabulea (OSS) wrote:
> From: Mirela Rabulea <mirela.rabulea@nxp.com>
> 
> These are optional in struct v4l2_jpeg_header, so skip DHT/DQT segment
> parsing if huffman_tables/quantization_tables were not requested by user,
> to save time.
> However, do count them (num_dht/num_dqt).
> 
> Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> ---
> Changes in v6:
>   Call jpeg_skip_segment() instead of jpeg_parse_quantization_table()/jpeg_parse_huffman_tables(),
>   when quantization/huffman tables are not requested by user.
>   Remove the NULL pointer check in the lower-level function.
>   Thanks Philipp & Hans for feedback
> 
>  drivers/media/v4l2-core/v4l2-jpeg.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-jpeg.c b/drivers/media/v4l2-core/v4l2-jpeg.c
> index dc9def4c2648..f3d03d39defb 100644
> --- a/drivers/media/v4l2-core/v4l2-jpeg.c
> +++ b/drivers/media/v4l2-core/v4l2-jpeg.c
> @@ -537,6 +537,10 @@ int v4l2_jpeg_parse_header(void *buf, size_t len, struct v4l2_jpeg_header *out)
>  					&out->dht[out->num_dht++ % 4]);
>  			if (ret < 0)
>  				return ret;
> +			if (!out->huffman_tables) {
> +				ret = jpeg_skip_segment(&stream);
> +				break;
> +			}
>  			ret = jpeg_parse_huffman_tables(&stream,
>  							out->huffman_tables);
>  			break;
> @@ -545,6 +549,10 @@ int v4l2_jpeg_parse_header(void *buf, size_t len, struct v4l2_jpeg_header *out)
>  					&out->dqt[out->num_dqt++ % 4]);
>  			if (ret < 0)
>  				return ret;
> +			if (!out->quantization_tables) {
> +				ret = jpeg_skip_segment(&stream);
> +				break;
> +			}
>  			ret = jpeg_parse_quantization_tables(&stream,
>  					out->frame.precision,
>  					out->quantization_tables);

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
