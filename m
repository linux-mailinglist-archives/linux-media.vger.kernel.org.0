Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C05E20AE9A
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 10:58:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725876AbgFZI6x convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 26 Jun 2020 04:58:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725841AbgFZI6x (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 04:58:53 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35018C08C5C1
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2020 01:58:53 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1jokCB-0001yQ-AA; Fri, 26 Jun 2020 10:58:51 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1jokCA-000141-Ol; Fri, 26 Jun 2020 10:58:50 +0200
Message-ID: <5d8e8b2b8daf8a44fd9650f08bacb423f4beb940.camel@pengutronix.de>
Subject: Re: [PATCH] MEDIA-STAGING: Remove unneeded geometry restrictions
 from i.MX CSI driver
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Krzysztof =?UTF-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Steve Longerbeam <slongerbeam@gmail.com>
Cc:     linux-media@vger.kernel.org
Date:   Fri, 26 Jun 2020 10:58:50 +0200
In-Reply-To: <m31rnmx2cw.fsf@t19.piap.pl>
References: <m31rnmx2cw.fsf@t19.piap.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Krzysztof,

thank you for the patch.

On Thu, 2020-05-14 at 12:00 +0200, Krzysztof Hałasa wrote:
> I don't know what minimal image dimensions are, but 32x32 appears to
> be ok according to the docs.
> This is needed for small sensors like 80x80 thermal imagers.
> 
> Signed-off-by: Krzysztof Halasa <khalasa@piap.pl>

This looks fine to me for the CSI. Steve, are you aware of any
limitations?

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Tested-by: Philipp Zabel <p.zabel@pengutronix.de>
(with CSI crop to 32x32, I have no 32x32 sensors at hand)

regards
Philipp

> diff --git a/drivers/staging/media/imx/imx-ic-prp.c b/drivers/staging/media/imx/imx-ic-prp.c
> index 2a4f77e83ed3..622a52c46229 100644
> --- a/drivers/staging/media/imx/imx-ic-prp.c
> +++ b/drivers/staging/media/imx/imx-ic-prp.c
> @@ -26,8 +26,8 @@
>  /*
>   * Min/Max supported width and heights.
>   */
> -#define MIN_W       176
> -#define MIN_H       144
> +#define MIN_W        32
> +#define MIN_H        32
>  #define MAX_W      4096
>  #define MAX_H      4096
>  #define W_ALIGN    4 /* multiple of 16 pixels */
> diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/staging/media/imx/imx-ic-prpencvf.c
> index 09c4e3f33807..cb46455a1a36 100644
> --- a/drivers/staging/media/imx/imx-ic-prpencvf.c
> +++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
> @@ -35,8 +35,8 @@
>   * has not requested a planar format, we should allow 8 pixel
>   * alignment at the source pad.
>   */
> -#define MIN_W_SINK  176
> -#define MIN_H_SINK  144
> +#define MIN_W_SINK   32
> +#define MIN_H_SINK   32
>  #define MAX_W_SINK 4096
>  #define MAX_H_SINK 4096
>  #define W_ALIGN_SINK  3 /* multiple of 8 pixels */
> diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
> index e76a6a85baa3..d9e5388ffeb5 100644
> --- a/drivers/staging/media/imx/imx-media-csi.c
> +++ b/drivers/staging/media/imx/imx-media-csi.c
> @@ -33,8 +33,8 @@
>   * has not requested planar formats, we should allow 8 pixel
>   * alignment.
>   */
> -#define MIN_W       176
> -#define MIN_H       144
> +#define MIN_W       32
> +#define MIN_H       32
>  #define MAX_W      4096
>  #define MAX_H      4096
>  #define W_ALIGN    1 /* multiple of 2 pixels */
> diff --git a/drivers/staging/media/imx/imx-media-vdic.c b/drivers/staging/media/imx/imx-media-vdic.c
> index 0d83c2c41606..ee71b70d3544 100644
> --- a/drivers/staging/media/imx/imx-media-vdic.c
> +++ b/drivers/staging/media/imx/imx-media-vdic.c
> @@ -49,8 +49,8 @@ struct vdic_pipeline_ops {
>  /*
>   * Min/Max supported width and heights.
>   */
> -#define MIN_W       176
> -#define MIN_H       144
> +#define MIN_W        32
> +#define MIN_H        32
>  #define MAX_W_VDIC  968
>  #define MAX_H_VDIC 2048
>  #define W_ALIGN    4 /* multiple of 16 pixels */
> 
