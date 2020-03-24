Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7D711908B0
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2020 10:12:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727539AbgCXJL3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Mar 2020 05:11:29 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:60461 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727466AbgCXJL3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Mar 2020 05:11:29 -0400
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <pza@pengutronix.de>)
        id 1jGfao-0004NC-H9; Tue, 24 Mar 2020 10:11:26 +0100
Received: from pza by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <pza@pengutronix.de>)
        id 1jGfan-0005DC-Ou; Tue, 24 Mar 2020 10:11:25 +0100
Date:   Tue, 24 Mar 2020 10:11:25 +0100
From:   Philipp Zabel <pza@pengutronix.de>
To:     Adrian Ratiu <adrian.ratiu@collabora.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ezequiel Garcia <ezequiel@collabora.com>, kernel@collabora.com,
        kernel@pengutronix.de, Tim Harvey <tharvey@gateworks.com>
Subject: Re: [PATCH 1/2] media: coda: jpeg: support optimized huffman tables
Message-ID: <20200324091125.GA12488@pengutronix.de>
References: <20200323130937.3666244-1-adrian.ratiu@collabora.com>
 <20200323130937.3666244-2-adrian.ratiu@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200323130937.3666244-2-adrian.ratiu@collabora.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:58:04 up 33 days, 16:28, 77 users,  load average: 0.06, 0.14,
 0.19
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: pza@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Adrian,

On Mon, Mar 23, 2020 at 03:09:36PM +0200, Adrian Ratiu wrote:
> Each jpeg can have the huffman tables optimized for its specific content
> meaning that the table lenghts and values don't match the standard table
> of substitutions so there's no reason to hardcode and expect the sandard
> lenghts, otherwise we just end up rejecting optimized jpegs altogether.

Thank you, that is a great improvement. There's one issue remaining
below:

> Tested on CODA960.
> 
> Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
> ---
>  drivers/media/platform/coda/coda-jpeg.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/coda/coda-jpeg.c b/drivers/media/platform/coda/coda-jpeg.c
> index 6a11b64efb6b..162ba28a6b95 100644
> --- a/drivers/media/platform/coda/coda-jpeg.c
> +++ b/drivers/media/platform/coda/coda-jpeg.c
> @@ -343,7 +343,8 @@ int coda_jpeg_decode_header(struct coda_ctx *ctx, struct vb2_buffer *vb)
>  			v4l2_err(&dev->v4l2_dev, "missing Huffman table\n");
>  			return -EINVAL;
>  		}
> -		if (huffman_tables[i].length != ((i & 2) ? 178 : 28)) {
> +		if (huffman_tables[i].length < 17 ||
> +		    huffman_tables[i].length > 178) {

The maximum length of the DC tables is 16 + 12, so this should
still be checked for a maximum length of 28 if (i & 2) == 0.

>  			v4l2_err(&dev->v4l2_dev,
>  				 "invalid Huffman table %d length: %zu\n",
>  				 i, huffman_tables[i].length);
> @@ -357,10 +358,12 @@ int coda_jpeg_decode_header(struct coda_ctx *ctx, struct vb2_buffer *vb)
>  			return -ENOMEM;
>  		ctx->params.jpeg_huff_tab = huff_tab;
>  	}
> -	memcpy(huff_tab->luma_dc, huffman_tables[0].start, 16 + 12);
> -	memcpy(huff_tab->chroma_dc, huffman_tables[1].start, 16 + 12);
> -	memcpy(huff_tab->luma_ac, huffman_tables[2].start, 16 + 162);
> -	memcpy(huff_tab->chroma_ac, huffman_tables[3].start, 16 + 162);
> +
> +	memset(huff_tab, 0, sizeof(*huff_tab));
> +	memcpy(huff_tab->luma_dc, huffman_tables[0].start, huffman_tables[0].length);
> +	memcpy(huff_tab->chroma_dc, huffman_tables[1].start, huffman_tables[1].length);

Otherwise these two might overflow the luma_dc and chroma_dc arrays.

regards
Philipp
