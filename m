Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EFDE2E9B8B
	for <lists+linux-media@lfdr.de>; Mon,  4 Jan 2021 18:01:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728056AbhADRA7 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 4 Jan 2021 12:00:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728049AbhADRA6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Jan 2021 12:00:58 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4BC3C061574
        for <linux-media@vger.kernel.org>; Mon,  4 Jan 2021 09:00:17 -0800 (PST)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kwTDF-0002Ic-Sc; Mon, 04 Jan 2021 18:00:09 +0100
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kwTD7-00075O-Sl; Mon, 04 Jan 2021 18:00:01 +0100
Message-ID: <b394a7592a67a12f73f6bb758b6b8fda0e88ae97.camel@pengutronix.de>
Subject: Re: [PATCH v6 6/9] media: Add parsing for APP14 data segment in
 jpeg helpers
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
Date:   Mon, 04 Jan 2021 18:00:01 +0100
In-Reply-To: <20201215111843.30269-7-mirela.rabulea@oss.nxp.com>
References: <20201215111843.30269-1-mirela.rabulea@oss.nxp.com>
         <20201215111843.30269-7-mirela.rabulea@oss.nxp.com>
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

thank you for the update. Just two issues below:

On Tue, 2020-12-15 at 13:18 +0200, Mirela Rabulea (OSS) wrote:
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
> Changes in v6:
>   Switch variable to lowercase Lp->lp
>   Check for "Adobe\0" in Ap1..6
>   Make the transform flag an enum
>   Removed a change in comment section, a leftover from a previous version
>   Thanks Philipp for feedback.
> 
>  drivers/media/v4l2-core/v4l2-jpeg.c | 43 +++++++++++++++++++++++++++--
>  include/media/v4l2-jpeg.h           | 18 ++++++++++++
>  2 files changed, 59 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-jpeg.c b/drivers/media/v4l2-core/v4l2-jpeg.c
> index 8947fd95c6f1..d1483e7a775c 100644
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
> @@ -444,8 +445,41 @@ static int jpeg_skip_segment(struct jpeg_stream *stream)
>  	return jpeg_skip(stream, len - 2);
>  }
>  
> +/* Rec. ITU-T T.872 (06/2012) 6.5.3 */
> +static int jpeg_parse_app14_data(struct jpeg_stream *stream)
> +{
> +	int ret;
> +	int lp;
> +	int skip;
> +	int tf;
> +
> +	lp = jpeg_get_word_be(stream);
> +	if (lp < 0)
> +		return lp;

Here we should check that there are still 6 bytes available to compare:

	if (stream->curr + 6 > stream->end)
		return -EINVAL;

> +	/* Check for "Adobe\0" in Ap1..6 */
> +	if (strncmp(stream->curr, "Adobe\0", 6))
> +		return -EINVAL;
> +
> +	/* get to Ap12 */
> +	ret = jpeg_skip(stream, 11);
> +	if (ret < 0)
> +		return -EINVAL;
> +
> +	tf = jpeg_get_byte(stream);
> +	if (tf < 0)
> +		return tf;
> +
> +	skip = lp - 2 - 11;
> +	ret = jpeg_skip(stream, skip);
> +	if (ret < 0)
> +		return -EINVAL;
> +	else
> +		return tf;
> +}
> +
>  /**
> - * jpeg_parse_header - locate marker segments and optionally parse headers
> + * v4l2_jpeg_parse_header - locate marker segments and optionally parse headers
>   * @buf: address of the JPEG buffer, should start with a SOI marker
>   * @len: length of the JPEG buffer
>   * @out: returns marker segment positions and optionally parsed headers
> @@ -476,6 +510,9 @@ int v4l2_jpeg_parse_header(void *buf, size_t len, struct v4l2_jpeg_header *out)
>  	if (marker != SOI)
>  		return -EINVAL;
>  
> +	/* init value to signal if this marker is not present */
> +	out->app14_tf = -EINVAL;
> +

Here we set app14_tf to a value that is not part of the enum.
You could define a value V4L2_JPEG_APP14_TF_UNKNOWN for the
uninitialized / error state.

>  	/* loop through marker segments */
>  	while ((marker = jpeg_next_marker(&stream)) >= 0) {
>  		switch (marker) {
> @@ -519,7 +556,9 @@ int v4l2_jpeg_parse_header(void *buf, size_t len, struct v4l2_jpeg_header *out)
>  			ret = jpeg_parse_restart_interval(&stream,
>  							&out->restart_interval);
>  			break;
> -
> +		case APP14:
> +			out->app14_tf = jpeg_parse_app14_data(&stream);

Same as above in case of -EINVAL return. Apart from this,

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
