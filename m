Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F7221BCDD5
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2020 22:58:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726666AbgD1U6k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Apr 2020 16:58:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726661AbgD1U6j (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Apr 2020 16:58:39 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E575C03C1AC
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2020 13:58:38 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id u127so301364wmg.1
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2020 13:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Fy0Mri3DDQ3BqqDpw5/rR7523O6oLN3hn9ttHJ8oMYE=;
        b=WIwrgocBZAZWETOWe23sa/ybzkvhEk4ZLJSGaM55H//GpLGBUGmriS0D7WmX5I1ELw
         AGLPYDwQmFKJneV/TBxXyKJ+YT0M8lcDY751G3UZ/5PUabFlcCZqdKIPFzm12kpgXts5
         Bwu2ge0Re7c91nRazrkj3ChCcibJIvtzhTm5TywtQzZsU96yYqZg2BCDoOz0D+K8u8qM
         cBL7uDKVEiusAjt9EBabe4M4O9Wnd/XOfzqeigi4CnAfL3dUtFG5vnAHKpL7mFGo2CUi
         CBHzG/nsXxbyJD+3Mgu1BD+0k3nefuy6jaBbXqWwZIEAncOeNZmuL/mXaqoLvENEq8or
         QUGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Fy0Mri3DDQ3BqqDpw5/rR7523O6oLN3hn9ttHJ8oMYE=;
        b=PAmDc8U1jwrN1a4p3wbBNtSXU/jdnFIDXNXNbhh//VPjfVoN5HVflUk1757UhbsDC1
         gNEjYoFwTvYymxuqoVmw1SriBx2Sht+2KOiT0mHkDoIKAW5C/gHXe+iKlvg9tAtXIxDx
         N7UA96Z7Jrfqtl3KfZQIZjJYkmiMMfO2YH86dk0oOrH3mNfT3JDKAoVXdaayv1858dSB
         74UGS+wpwhqGJ3wDyLdGfwrPI9i9j0u1L3+ATeAINJsnF/FUI7O/2aRoUf0t1wwAztWj
         vYI40efJkD9luwFdlGlzbNRnk7rCEGNLqzjHgvQvm+CGmdeFZjrFpykRd9jyHEw3MsA9
         db/A==
X-Gm-Message-State: AGi0PuYDeoIZEPgCz+8H8gtsSDfqhRJTsS5ZJaXlv6AAjcNYql9Wv90G
        p57dx9Hfymf5geY6tpNrTj98m+uC
X-Google-Smtp-Source: APiQypIY1nXnuxrxzVd4QQ89AdAOLunLhbEfEeYnMqwIN51PdLCoQmDXD5PSISF3jHh4cgoJPiM8MA==
X-Received: by 2002:a05:600c:2314:: with SMTP id 20mr6908369wmo.118.1588107516885;
        Tue, 28 Apr 2020 13:58:36 -0700 (PDT)
Received: from arch-thunder.localdomain (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id m14sm26749246wrs.76.2020.04.28.13.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 13:58:36 -0700 (PDT)
Date:   Tue, 28 Apr 2020 21:58:33 +0100
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org
Subject: Re: [PATCH] staging: media: imx: no need to check return value of
 debugfs_create functions
Message-ID: <20200428205833.ape7kvi5pgrap3ps@arch-thunder.localdomain>
References: <20200428170405.GA1649098@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200428170405.GA1649098@kroah.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Greg,
Thanks for the cleanup.

On Tue, Apr 28, 2020 at 07:04:05PM +0200, Greg Kroah-Hartman wrote:
> When calling debugfs functions, there is no need to ever check the
> return value.  The function can work or not, but the code logic should
> never do something different based on this.
> 
> Cc: Rui Miguel Silva <rmfrfs@gmail.com>
> Cc: Steve Longerbeam <slongerbeam@gmail.com>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: linux-media@vger.kernel.org
> Cc: devel@driverdev.osuosl.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>


Cheers,
     Rui
> ---
>  drivers/staging/media/imx/imx7-mipi-csis.c | 29 ++++------------------
>  1 file changed, 5 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
> index fbc1a924652a..d7c9e7343f1f 100644
> --- a/drivers/staging/media/imx/imx7-mipi-csis.c
> +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
> @@ -915,33 +915,14 @@ static int mipi_csis_dump_regs_show(struct seq_file *m, void *private)
>  }
>  DEFINE_SHOW_ATTRIBUTE(mipi_csis_dump_regs);
>  
> -static int mipi_csis_debugfs_init(struct csi_state *state)
> +static void mipi_csis_debugfs_init(struct csi_state *state)
>  {
> -	struct dentry *d;
> -
> -	if (!debugfs_initialized())
> -		return -ENODEV;
> -
>  	state->debugfs_root = debugfs_create_dir(dev_name(state->dev), NULL);
> -	if (!state->debugfs_root)
> -		return -ENOMEM;
> -
> -	d = debugfs_create_bool("debug_enable", 0600, state->debugfs_root,
> -				&state->debug);
> -	if (!d)
> -		goto remove_debugfs;
> -
> -	d = debugfs_create_file("dump_regs", 0600, state->debugfs_root,
> -				state, &mipi_csis_dump_regs_fops);
> -	if (!d)
> -		goto remove_debugfs;
> -
> -	return 0;
> -
> -remove_debugfs:
> -	debugfs_remove_recursive(state->debugfs_root);
>  
> -	return -ENOMEM;
> +	debugfs_create_bool("debug_enable", 0600, state->debugfs_root,
> +			    &state->debug);
> +	debugfs_create_file("dump_regs", 0600, state->debugfs_root, state,
> +			    &mipi_csis_dump_regs_fops);
>  }
>  
>  static void mipi_csis_debugfs_exit(struct csi_state *state)
> -- 
> 2.26.2
> 
