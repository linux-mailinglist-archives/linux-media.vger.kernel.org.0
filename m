Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 880962F336F
	for <lists+linux-media@lfdr.de>; Tue, 12 Jan 2021 16:00:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389430AbhALO7M convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 12 Jan 2021 09:59:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387818AbhALO7M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jan 2021 09:59:12 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CA60C061786
        for <linux-media@vger.kernel.org>; Tue, 12 Jan 2021 06:58:31 -0800 (PST)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kzL7j-00020s-4W; Tue, 12 Jan 2021 15:58:19 +0100
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kzL7h-0007qp-JE; Tue, 12 Jan 2021 15:58:17 +0100
Message-ID: <c47df7713b41d2714a36c0c17b9d01aa90a72601.camel@pengutronix.de>
Subject: Re: [PATCH v7 6/9] media: Add parsing for APP14 data segment in
 jpeg helpers
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Mirela Rabulea <mirela.rabulea@oss.nxp.com>, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, shawnguo@kernel.org, robh+dt@kernel.org
Cc:     paul.kocialkowski@bootlin.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-imx@nxp.com,
        s.hauer@pengutronix.de, aisheng.dong@nxp.com,
        daniel.baluta@nxp.com, robert.chiras@nxp.com,
        laurentiu.palcu@nxp.com, mark.rutland@arm.com,
        devicetree@vger.kernel.org, ezequiel@collabora.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se,
        dafna.hirschfeld@collabora.com
Date:   Tue, 12 Jan 2021 15:58:17 +0100
In-Reply-To: <20210111192822.12178-7-mirela.rabulea@oss.nxp.com>
References: <20210111192822.12178-1-mirela.rabulea@oss.nxp.com>
         <20210111192822.12178-7-mirela.rabulea@oss.nxp.com>
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

On Mon, 2021-01-11 at 21:28 +0200, Mirela Rabulea wrote:
> From: Mirela Rabulea <mirela.rabulea@nxp.com>
> 
> According to Rec. ITU-T T.872 (06/2012) 6.5.3
> APP14 segment is for color encoding, it contains a transform flag, which
> may have values of 0, 1 and 2 and are interpreted as follows:
> 0 - CMYK for images that are encoded with four components
>   - RGB for images that are encoded with three components
> 1 - An image encoded with three components using YCbCr colour encoding.
> 2 - An image encoded with four components using YCCK colour encoding.
> 
> This is used in imx-jpeg decoder, to distinguish between
> YUV444 and RGB24.
> 
> Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> ---
> Changes in v7:
>   Check there are 6 bytes available in the stream before checking for "Adobe\0"
>   Change jpeg_parse_app14_data function to differentiate between the 3 scenarios: app14 missing, or app14 present but with/without parsing errors:
>     App14 missing => Added V4L2_JPEG_APP14_TF_UNKNOWN to the enum v4l2_jpeg_app14_tf, use it to indicate app14 & TF is missing
> 	App14 present without parsing errors => Return the transform flag value as enum v4l2_jpeg_app14_tf (new paramater of jpeg_parse_app14_data function)
>     App14 present with parsing errors => Return -EINVAL from jpeg_parse_app14_data, also return from calling function (v4l2_jpeg_parse_header) when this error is met.
>
>  drivers/media/v4l2-core/v4l2-jpeg.c | 47 +++++++++++++++++++++++++++--
>  include/media/v4l2-jpeg.h           | 20 ++++++++++++
>  2 files changed, 65 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-jpeg.c b/drivers/media/v4l2-core/v4l2-jpeg.c
> index 8947fd95c6f1..8d5fedb136dd 100644
> --- a/drivers/media/v4l2-core/v4l2-jpeg.c
> +++ b/drivers/media/v4l2-core/v4l2-jpeg.c
> @@ -45,6 +45,7 @@ MODULE_LICENSE("GPL");
>  #define DHP	0xffde	/* hierarchical progression */
>  #define EXP	0xffdf	/* expand reference */
>  #define APP0	0xffe0	/* application data */
> +#define APP14	0xffee	/* application data for colour encoding */
>  #define APP15	0xffef
>  #define JPG0	0xfff0	/* extensions */
>  #define JPG13	0xfffd
> @@ -444,8 +445,44 @@ static int jpeg_skip_segment(struct jpeg_stream *stream)
>  	return jpeg_skip(stream, len - 2);
>  }
>  
> +/* Rec. ITU-T T.872 (06/2012) 6.5.3 */
> +static int jpeg_parse_app14_data(struct jpeg_stream *stream,
> +				 enum v4l2_jpeg_app14_tf *tf)
> +{
> +	int ret;
> +	int lp;
> +	int skip;
> +
> +	lp = jpeg_get_word_be(stream);
> +	if (lp < 0)
> +		return lp;
> +
> +	/* Check for "Adobe\0" in Ap1..6 */
> +	if (stream->curr + 6 > stream->end ||
> +	    strncmp(stream->curr, "Adobe\0", 6))
> +		return -EINVAL;
> +
> +	/* get to Ap12 */
> +	ret = jpeg_skip(stream, 11);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = jpeg_get_byte(stream);
> +	if (ret < 0)
> +		return ret;
> +
> +	*tf = ret;
> +
> +	skip = lp - 2 - 11;

> +	ret = jpeg_skip(stream, skip);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;

This could be simplified to

	return jpeg_skip(stream, skip);

although it would be better style to move the *tf = ... assignment down
past the last error return instead. Either way,

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
