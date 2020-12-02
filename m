Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2865F2CC09C
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 16:19:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730418AbgLBPTV convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 2 Dec 2020 10:19:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727889AbgLBPTV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Dec 2020 10:19:21 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02766C0613CF
        for <linux-media@vger.kernel.org>; Wed,  2 Dec 2020 07:18:41 -0800 (PST)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kkTto-0007hc-Sq; Wed, 02 Dec 2020 16:18:32 +0100
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kkTtn-0007QQ-9N; Wed, 02 Dec 2020 16:18:31 +0100
Message-ID: <6acf2724130aa2e927cd116ecd216bec3e0321a5.camel@pengutronix.de>
Subject: Re: [PATCH v5 07/10] media: Add parsing for APP14 data segment in
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
Date:   Wed, 02 Dec 2020 16:18:31 +0100
In-Reply-To: <20201112030557.8540-8-mirela.rabulea@oss.nxp.com>
References: <20201112030557.8540-1-mirela.rabulea@oss.nxp.com>
         <20201112030557.8540-8-mirela.rabulea@oss.nxp.com>
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
> Changes in v5:
> This was patch 8 in previous version
> Replaced a struct for app14 data with just an int, since the 
> transform flag is the only meaningfull information from this segment

Could we turn this into an enum for the transform flag, and include the
above spec reference in its kerneldoc comment? I think this would be
better than checking for (app14_tf == <magic_number>) in the drivers.

>  drivers/media/v4l2-core/v4l2-jpeg.c | 39 +++++++++++++++++++++++++++--
>  include/media/v4l2-jpeg.h           |  6 +++--
>  2 files changed, 41 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-jpeg.c b/drivers/media/v4l2-core/v4l2-jpeg.c
> index 8947fd95c6f1..3181ce544f79 100644
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
> @@ -444,8 +445,37 @@ static int jpeg_skip_segment(struct jpeg_stream *stream)
>  	return jpeg_skip(stream, len - 2);
>  }
>  
> +/* Rec. ITU-T T.872 (06/2012) 6.5.3 */
> +static int jpeg_parse_app14_data(struct jpeg_stream *stream)
> +{
> +	int ret;
> +	int Lp;

Let's keep variables lower case.

> +	int skip;
> +	int tf;
> +
> +	Lp = jpeg_get_word_be(stream);
> +	if (Lp < 0)
> +		return Lp;

Should we check that Ap1 to 6 are actually "Adobe\0"?

> +	/* get to Ap12 */
> +	ret = jpeg_skip(stream, 11);
> +	if (ret < 0)
> +		return -EINVAL;
> +
> +	tf = jpeg_get_byte(stream);
> +	if (tf < 0)
> +		return tf;
> +
> +	skip = Lp - 2 - 11;
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
> @@ -476,6 +506,9 @@ int v4l2_jpeg_parse_header(void *buf, size_t len, struct v4l2_jpeg_header *out)
>  	if (marker != SOI)
>  		return -EINVAL;
>  
> +	/* init value to signal if this marker is not present */
> +	out->app14_tf = -EINVAL;
> +
>  	/* loop through marker segments */
>  	while ((marker = jpeg_next_marker(&stream)) >= 0) {
>  		switch (marker) {
> @@ -519,7 +552,9 @@ int v4l2_jpeg_parse_header(void *buf, size_t len, struct v4l2_jpeg_header *out)
>  			ret = jpeg_parse_restart_interval(&stream,
>  							&out->restart_interval);
>  			break;
> -
> +		case APP14:
> +			out->app14_tf = jpeg_parse_app14_data(&stream);
> +			break;
>  		case SOS:
>  			ret = jpeg_reference_segment(&stream, &out->sos);
>  			if (ret < 0)
> diff --git a/include/media/v4l2-jpeg.h b/include/media/v4l2-jpeg.h
> index ddba2a56c321..008e0476d928 100644
> --- a/include/media/v4l2-jpeg.h
> +++ b/include/media/v4l2-jpeg.h
> @@ -100,10 +100,11 @@ struct v4l2_jpeg_scan_header {
>   *                  order, optional
>   * @restart_interval: number of MCU per restart interval, Ri
>   * @ecs_offset: buffer offset in bytes to the entropy coded segment
> + * @app14_tf: transform flag from app14 data
>   *
>   * When this structure is passed to v4l2_jpeg_parse_header, the optional scan,
> - * quantization_tables, and huffman_tables pointers must be initialized to NULL
> - * or point at valid memory.
> + * quantization_tables and huffman_tables pointers must be initialized
> + * to NULL or point at valid memory.

Unnecessary, unrelated change? I'd drop this.

>   */
>  struct v4l2_jpeg_header {
>  	struct v4l2_jpeg_reference sof;
> @@ -119,6 +120,7 @@ struct v4l2_jpeg_header {
>  	struct v4l2_jpeg_reference *huffman_tables;
>  	u16 restart_interval;
>  	size_t ecs_offset;
> +	int app14_tf;
>  };
>  
>  int v4l2_jpeg_parse_header(void *buf, size_t len, struct v4l2_jpeg_header *out);

regards
Philipp
