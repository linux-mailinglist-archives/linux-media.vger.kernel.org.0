Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA881224F34
	for <lists+linux-media@lfdr.de>; Sun, 19 Jul 2020 06:36:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726012AbgGSEgs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 Jul 2020 00:36:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725272AbgGSEgr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 Jul 2020 00:36:47 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4303C0619D2;
        Sat, 18 Jul 2020 21:36:47 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id x72so7389808pfc.6;
        Sat, 18 Jul 2020 21:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QrQwgA++IOo4LAbcYYksL7Rv2htpSKEdPqiaKrOyg+U=;
        b=D9RLTERalHTdng6E2AnMA0kajdkrfc7hEjZ63ZMEm9vrc4xZuQ3HY/9f9CX2b5MshI
         Uo4zusEBuz8eHFgu2r+cR/oUjC3h1DBJmYmeYbjDPE3V431OfTDkHGxb7mnsrSjY3dxF
         wIReA+tze3YtIczU1uNrgwNuLckBg4eWWQbkuCjv4r0NxkhgW0v79HTK4ywpii0Kx9RY
         jA+FnOZx2vKhz9TLoxhJSl/DX9vvHsRV5I8/CxD4Kt49Op6flhXASSc9L6XkLYHTKRMF
         n2oP6YxhQmuXzMkzgZLGK+w1IuSVFS7gqV9bynXdbBYwEcuRTthw8BMSDwkfDBQ0QbJ1
         ddaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QrQwgA++IOo4LAbcYYksL7Rv2htpSKEdPqiaKrOyg+U=;
        b=Ew30VEjD77tjLqipQ/bniJ+7pzDHrQX3bTgl2IUe+QHBAozBjCK5M6Ys+8C9kk3dDF
         a1w/Opn/i+YfrWPr2m7/Xze66lXYqYxdCuFF6ATi2k0g0MrOqKsKwNzQt8HWcw1Z4NcN
         v2rwerubK+0HTiT+hxVEm0WKuH2Z0nwANDRktM/Urimi4Wm8spO/vQHad1uEWHp6vJk7
         mF3/JcKf8hX8jUk+IBG+mQjOyQUe46YA5S3XZepV9XO1wv9p25YHIKbmAr35OH711u+H
         k/UYNP2z11zMP6XMHTeZjoWsxy5py0758LnML8rseIDGosuveKVgjRuUfxCcGGsJiW9H
         lWLg==
X-Gm-Message-State: AOAM532EOwtQfLdsWoB0LrdAO8WqYyoN9uISm/8YF/jZfIYSDTfEN8Px
        O0WcKdVhMdeD6xXaUWbglBY=
X-Google-Smtp-Source: ABdhPJw22bGnp1N+Em/LFoDNlxfAACLdz2BntWRH2Dp57FTKacaKyq2nroMxWR06hs5KO8UaeZhXNA==
X-Received: by 2002:a63:b511:: with SMTP id y17mr14136438pge.425.1595133407527;
        Sat, 18 Jul 2020 21:36:47 -0700 (PDT)
Received: from blackclown ([2405:204:219:61b6:3945:8436:8c57:56d5])
        by smtp.gmail.com with ESMTPSA id n18sm12475472pfd.99.2020.07.18.21.36.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 18 Jul 2020 21:36:47 -0700 (PDT)
Date:   Sun, 19 Jul 2020 10:06:38 +0530
From:   Suraj Upadhyay <usuraj35@gmail.com>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: Replace depracated MSI API.
Message-ID: <20200719043638.GC28510@blackclown>
References: <20200718132632.GA11527@blackclown>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200718132632.GA11527@blackclown>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Jul 18, 2020 at 06:56:32PM +0530, Suraj Upadhyay wrote:
> Replace depracated pci_enable_msi with pci_alloc_irq_vectors.
> And as a result modify how the returned value is handled.
> 
> Signed-off-by: Suraj Upadhyay <usuraj35@gmail.com>
> ---
>  drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
Hii,
Please don't merge this patch.
It is still incomplete.
It doesn't replace pci_disable_msi.
I hope this wasn't an annoyance.

Thanks,

Suraj Upadhyay.

> diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> index d36809a0182c..b824c6f78a9c 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> @@ -1735,8 +1735,8 @@ static int atomisp_pci_probe(struct pci_dev *dev,
>  	pci_set_master(dev);
>  	pci_set_drvdata(dev, isp);
>  
> -	err = pci_enable_msi(dev);
> -	if (err) {
> +	err = pci_alloc_irq_vectors(dev, 1, 1, PCI_IRQ_MSI);
> +	if (err < 0) {
>  		dev_err(&dev->dev, "Failed to enable msi (%d)\n", err);
>  		goto enable_msi_fail;
>  	}
> -- 
> 2.17.1
> 


