Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E75B74315D9
	for <lists+linux-media@lfdr.de>; Mon, 18 Oct 2021 12:20:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231182AbhJRKXE convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 18 Oct 2021 06:23:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231341AbhJRKXB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Oct 2021 06:23:01 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB487C06161C
        for <linux-media@vger.kernel.org>; Mon, 18 Oct 2021 03:20:50 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mcPl3-0000Du-8U; Mon, 18 Oct 2021 12:20:41 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mcPl2-0005I1-UB; Mon, 18 Oct 2021 12:20:40 +0200
Message-ID: <7eed841351748709ec9a173532cd3db99139d69e.camel@pengutronix.de>
Subject: Re: [PATCHv2 3/4] media: imx: Forward type of hardware
 implementation
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@puri.sm, phone-devel@vger.kernel.org
Date:   Mon, 18 Oct 2021 12:20:40 +0200
In-Reply-To: <20211017102904.756408-3-dorota.czaplejewicz@puri.sm>
References: <20211017102904.756408-1-dorota.czaplejewicz@puri.sm>
         <20211017102904.756408-3-dorota.czaplejewicz@puri.sm>
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

On Sun, 2021-10-17 at 13:08 +0200, Dorota Czaplejewicz wrote:
> Signed-off-by: Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>
> ---
>  drivers/staging/media/imx/imx-media-capture.c | 14 ++++++++------
>  drivers/staging/media/imx/imx-media-utils.c   |  3 ++-
>  drivers/staging/media/imx/imx-media.h         |  3 ++-
>  3 files changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
> index fdf0f3a8f253..22208b7ce825 100644
> --- a/drivers/staging/media/imx/imx-media-capture.c
> +++ b/drivers/staging/media/imx/imx-media-capture.c
[...]
> @@ -184,7 +185,8 @@ __capture_try_fmt(struct v4l2_pix_format *pixfmt, struct v4l2_rect *compose)
>  static int capture_try_fmt_vid_cap(struct file *file, void *fh,
>  				   struct v4l2_format *f)
>  {
> -	__capture_try_fmt(&f->fmt.pix, NULL);
> +	struct capture_priv *priv = video_drvdata(file);

Missing blank line.

> +	__capture_try_fmt(&f->fmt.pix, NULL, priv->type);
>  	return 0;
>  }
>  

With that fixed,

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
