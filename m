Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D9014D7148
	for <lists+linux-media@lfdr.de>; Sat, 12 Mar 2022 23:20:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232026AbiCLWTv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Mar 2022 17:19:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231289AbiCLWTu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Mar 2022 17:19:50 -0500
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99709C792E
        for <linux-media@vger.kernel.org>; Sat, 12 Mar 2022 14:18:43 -0800 (PST)
Received: from hillosipuli.retiisi.eu (dkvn5pty0gzs3nltj987t-3.rev.dnainternet.fi [IPv6:2001:14ba:4457:9640:1e2d:1f75:a607:ef37])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 3B9E31B00266;
        Sun, 13 Mar 2022 00:18:40 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1647123520;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=X3qtvXIrksbU9lJ1+kHwpkLzI+HsRyHvPCGq63P3Go8=;
        b=ttYU8Vc1F+EcoAJw6B3d1GCH0IXwgG3I9ddiHhznrkCIgzq9/eSgH9KgiMjKKtq0tDOFND
        mHaSSrlAkAsFcOMjSgGYE/qtYkOXp5VAox8gO/TbzGMCmspN4AkAFMMdhVQB4RJYicYHRK
        HN5E7e2ZKH+l6jxzsI6y+u99Q7O2WYGYHuQL4HrPd9pAsUQeo6Ob/U5x9ZDfVi0yzM7nqD
        1vqNOvuKjegTVzGunzxwNuHCIS32gBHPhKFclloD2J18FqSfsMUQ9vYq7pXgjmdXmzO6mZ
        Hd8Q36quFLpD3u4vbx3abHu9O6RiCVmzG8HjxnSHzXBpDdYJlLvGtothw9SWfA==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id BF88A634C90;
        Sun, 13 Mar 2022 00:18:39 +0200 (EET)
Date:   Sun, 13 Mar 2022 00:18:39 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        Jacopo Mondi <jacopo@jmondi.org>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: Re: [PATCH 4/4] media: imx: imx-mipi-csis: Simplify runtime PM
 implementation
Message-ID: <Yi0cP9pJTQSUFRAp@valkosipuli.retiisi.eu>
References: <20220311135535.30108-1-laurent.pinchart@ideasonboard.com>
 <20220311135535.30108-5-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220311135535.30108-5-laurent.pinchart@ideasonboard.com>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1647123520; a=rsa-sha256;
        cv=none;
        b=OhsZEqT2KEOkHPaUau0nfUdRuCbvUx/QgpF1wljnXROxQI3uFO4xnCxYOBWzjqS3md7emf
        1qT7a03yDiCKvvZGafR+dHTo4PUsiZMWsh79RVV7KtNHweFcZgY7Vj5SSJlSzkGSnIVhHQ
        6BbyjOr4CiRPiWPvbgLPEb6MOYi8M5WszyMvXfeVTi2LoKxukUuokUdK8kRqyPzQ6A4urG
        qBEh2Ot45/RtaFuDCcGQeE0rDnvsHuwgA3voxQqSUTbVKzX7g/dY+61+7TVCQw/TI+yNxr
        BJTGuMGno0Dcxdo+wTZZai39FAwFZEYRjCV2y0EoC/tvPKeAT+mLK0n+DMtR9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1647123520;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=X3qtvXIrksbU9lJ1+kHwpkLzI+HsRyHvPCGq63P3Go8=;
        b=Fn/SQJ+SQZU/4KIUTGllsb3PqRTZSskc655f5Q3oESYAqXJyHrCzNgJJ/XWtrGM4fbLyW+
        uT5hfgq5xEHjql4s0+7FZwl1FS7rg7G7JfIdbIGmb8xawhX2p6pyDlVE0dpGYulHwoaDWl
        5IM3k6AvUDExb/wLnEgHZfwdI9oFuDLg8tN0eTCJnhHLuiY2H4DFhU76OUzcTBS8tnLsdV
        ZNK33HwCoHX1fXvR8xLAA//6ZB836Ei3FD7PEzvswQealvAyfALu9SkhFE3W/BJL26kLHi
        BbTGBCJqSATkzInoX25Hn15WeJ9qUTI2hXGDw3ulv5AwoYM7o+GjQs6y02aJ6A==
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Fri, Mar 11, 2022 at 03:55:35PM +0200, Laurent Pinchart wrote:
> The runtime PM resume handler is guaranteed to be called on a suspended
> device, and the suspend handler on a resumed device. The implementation
> can thus be simplified.
> 
> While at it, rename the mipi_csis_device state field to powered, as the
> now state contains a single flag only.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/platform/imx/imx-mipi-csis.c | 38 ++++++++++------------
>  1 file changed, 17 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/media/platform/imx/imx-mipi-csis.c b/drivers/media/platform/imx/imx-mipi-csis.c
> index d656b8bfcc33..f6ff8d50843c 100644
> --- a/drivers/media/platform/imx/imx-mipi-csis.c
> +++ b/drivers/media/platform/imx/imx-mipi-csis.c
> @@ -248,10 +248,6 @@
>  #define MIPI_CSI2_DATA_TYPE_RAW14		0x2d
>  #define MIPI_CSI2_DATA_TYPE_USER(x)		(0x30 + (x))
>  
> -enum {
> -	ST_POWERED	= 1,
> -};
> -
>  struct mipi_csis_event {
>  	bool debug;
>  	u32 mask;
> @@ -331,10 +327,10 @@ struct mipi_csis_device {
>  	u32 hs_settle;
>  	u32 clk_settle;
>  
> -	struct mutex lock;	/* Protect csis_fmt, format_mbus and state */
> +	struct mutex lock;	/* Protect csis_fmt, format_mbus and powered */
>  	const struct csis_pix_format *csis_fmt;
>  	struct v4l2_mbus_framefmt format_mbus[CSIS_PADS_NUM];
> -	u32 state;
> +	bool powered;
>  
>  	spinlock_t slock;	/* Protect events */
>  	struct mipi_csis_event events[MIPI_CSIS_NUM_EVENTS];
> @@ -1193,7 +1189,7 @@ static int mipi_csis_log_status(struct v4l2_subdev *sd)
>  
>  	mutex_lock(&csis->lock);
>  	mipi_csis_log_counters(csis, true);
> -	if (csis->debug.enable && (csis->state & ST_POWERED))
> +	if (csis->debug.enable && csis->powered)

Could you use instead pm_runtime_get_if_active() instead? You could then
drop the field.

>  		mipi_csis_dump_regs(csis);
>  	mutex_unlock(&csis->lock);
>  
> @@ -1354,13 +1350,14 @@ static int __maybe_unused mipi_csis_runtime_suspend(struct device *dev)
>  	int ret = 0;
>  
>  	mutex_lock(&csis->lock);
> -	if (csis->state & ST_POWERED) {
> -		ret = mipi_csis_phy_disable(csis);
> -		if (ret)
> -			goto unlock;
> -		mipi_csis_clk_disable(csis);
> -		csis->state &= ~ST_POWERED;
> -	}
> +
> +	ret = mipi_csis_phy_disable(csis);
> +	if (ret)
> +		goto unlock;
> +
> +	mipi_csis_clk_disable(csis);
> +
> +	csis->powered = false;
>  
>  unlock:
>  	mutex_unlock(&csis->lock);
> @@ -1376,14 +1373,13 @@ static int __maybe_unused mipi_csis_runtime_resume(struct device *dev)
>  
>  	mutex_lock(&csis->lock);
>  
> -	if (!(csis->state & ST_POWERED)) {
> -		ret = mipi_csis_phy_enable(csis);
> -		if (ret)
> -			goto unlock;
> +	ret = mipi_csis_phy_enable(csis);
> +	if (ret)
> +		goto unlock;
>  
> -		csis->state |= ST_POWERED;
> -		mipi_csis_clk_enable(csis);
> -	}
> +	mipi_csis_clk_enable(csis);
> +
> +	csis->powered = true;
>  
>  unlock:
>  	mutex_unlock(&csis->lock);

-- 
Regards,

Sakari Ailus
