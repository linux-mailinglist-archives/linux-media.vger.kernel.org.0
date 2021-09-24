Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9757417123
	for <lists+linux-media@lfdr.de>; Fri, 24 Sep 2021 13:46:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343630AbhIXLsG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Sep 2021 07:48:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343615AbhIXLsG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Sep 2021 07:48:06 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD377C061574
        for <linux-media@vger.kernel.org>; Fri, 24 Sep 2021 04:46:32 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <pza@pengutronix.de>)
        id 1mTjej-0003Uj-Tv; Fri, 24 Sep 2021 13:46:17 +0200
Received: from pza by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <pza@pengutronix.de>)
        id 1mTjeh-00065F-Rv; Fri, 24 Sep 2021 13:46:15 +0200
Date:   Fri, 24 Sep 2021 13:46:15 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
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
Subject: Re: [PATCH] media: imx: Fix rounding
Message-ID: <20210924114615.GA21343@pengutronix.de>
References: <20210924120631.7060da0f.dorota.czaplejewicz@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210924120631.7060da0f.dorota.czaplejewicz@puri.sm>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 13:34:50 up 218 days, 14:58, 111 users,  load average: 0.12, 0.18,
 0.17
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: pza@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dorota,

On Fri, Sep 24, 2021 at 12:06:31PM +0200, Dorota Czaplejewicz wrote:
> Change rounding to the minimal burst size from 2^n to n.
> 
> This fixes images with sizes that are a multiple of 8 pixels.

Could you elaborate on what is currently wrong with images that are a
multiple of 8 pixels wide? Or are you rather trying to add support
for images that are not a multiple of 8 pixels wide?

> 
> See section 13.7.6.13 CSI Image Parameter Register of the
> i.MX 8M Quad Applications Processors Reference Manual.
> 
> Fixes: 451a7b7815d0b ("media: imx: lift CSI and PRP ENC/VF width
> alignment restriction")
> Signed-off-by: Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>
> ---
> Hi,
> 
> I tested this patch on the Librem 5 with the main camera.
> 
> --Dorota
>  drivers/staging/media/imx/imx-media-utils.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
> index 5128915a5d6f..a2d8fab32a39 100644
> --- a/drivers/staging/media/imx/imx-media-utils.c
> +++ b/drivers/staging/media/imx/imx-media-utils.c
> @@ -545,13 +545,13 @@ int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
>  	}
>  
>  	/* Round up width for minimum burst size */
> -	width = round_up(mbus->width, 8);
> +	width = round_up(mbus->width, 3);

That is not a valid use of the round_up() macro anymore.
The second parameter must be a power of 2.

regards
Philipp
