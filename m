Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EEF3280E07
	for <lists+linux-media@lfdr.de>; Fri,  2 Oct 2020 09:29:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725995AbgJBH3k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Oct 2020 03:29:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725961AbgJBH3k (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Oct 2020 03:29:40 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F10DFC0613D0
        for <linux-media@vger.kernel.org>; Fri,  2 Oct 2020 00:29:39 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id q9so576691wmj.2
        for <linux-media@vger.kernel.org>; Fri, 02 Oct 2020 00:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8b0A6cXXySZhzyN5vJ2Th5CBcTNhmIXs1uixYeN5QOM=;
        b=mRthvD9jldWVFcQxcApLdq669hQ7gJ+iLMf/7Jl4No9DFN7pKcLMun4KIoZTIUHmVW
         R2vmH7E6c96YE6CsBYwe0AgI6juP9i9NsMiRRp2xNwY9U4RFOq8A0tbl2dZpg6o1yBmS
         2A+tTrQMN1RQqgYJuQmL8HNKB8ECXCLDJokbOk/kr+b0VTVPCU07dcfpEUBs5LHeOdKk
         ds0d7V4sJE7HcBmyzzItmIc+F5TPrueiWBD3ajDMUREC9qQa6VIli85EIWYPQ/GBGNLv
         L1Qg0Z2P/CP4vhQtrnTl+q4p5YAG7ovxYzL6r5mp94pPUHL8NRu7FFFJ8SvgXn+qnZhp
         hilQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8b0A6cXXySZhzyN5vJ2Th5CBcTNhmIXs1uixYeN5QOM=;
        b=N1PJkt1CoI/0PCLbjyX2XdbVJWAxJBDiKrj1Ubp5nhu9G/NX5xVeLthVm//9soJw7d
         0wRvs5qOZgdye77Dx1OqmqAigaK7h5LGImTwHZUoQvJMec+mb/zxmb+uhVPpDe40SGvB
         yztXLPgW3cPW7hOe99cVBGUZoEMnZoGBJmSU8ejEdRpR48Dr0IQLHFXcBPRihvWZ381z
         RWYmeZVb0A6eNmZI9HJzR2yPnGJNvqQCmp1vqVqck668gFr5Ow+nPV3b93p034fwZhfz
         jqa0dQvvo/vkHu6AHTZuMgIWP1yHu27rhHm1ij1soz/HhbXzMaBRDvK/b61xH4DedoYu
         m9wg==
X-Gm-Message-State: AOAM530W/DNYEEMtuQ/IR1ELZHlJ9uGc0r30Tpn94tsLxOTKEldh7YNN
        L9gKhSpd9uPhFMy3tieOVK4HRg==
X-Google-Smtp-Source: ABdhPJxlZTVdC2vl0+I0B15YyaTJHOc4myEO0ink3TwTawN+cuMksKZ7ziID/vZSj4p6GfyURyDNdQ==
X-Received: by 2002:a1c:18e:: with SMTP id 136mr1260091wmb.22.1601623778699;
        Fri, 02 Oct 2020 00:29:38 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id e18sm710930wrx.50.2020.10.02.00.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 00:29:38 -0700 (PDT)
Date:   Fri, 2 Oct 2020 09:29:36 +0200
From:   LABBE Corentin <clabbe@baylibre.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 1/2] zoran: fix smatch warning
Message-ID: <20201002072936.GE15586@Red>
References: <20200928132831.1587872-1-hverkuil-cisco@xs4all.nl>
 <20200928132831.1587872-2-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200928132831.1587872-2-hverkuil-cisco@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Sep 28, 2020 at 03:28:30PM +0200, Hans Verkuil wrote:
> drivers/staging/media/zoran/zoran_device.c:941 zoran_irq() warn: inconsistent indenting
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/staging/media/zoran/zoran_device.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/zoran/zoran_device.c b/drivers/staging/media/zoran/zoran_device.c
> index 1fe91e16658b..ecd6c5293a87 100644
> --- a/drivers/staging/media/zoran/zoran_device.c
> +++ b/drivers/staging/media/zoran/zoran_device.c
> @@ -938,10 +938,10 @@ irqreturn_t zoran_irq(int irq, void *dev_id)
>  				pci_err(zr->pci_dev, "JPG IRQ when not in good mode\n");
>  				return IRQ_HANDLED;
>  			}
> -		zr->frame_num++;
> -		zoran_reap_stat_com(zr);
> -		zoran_feed_stat_com(zr);
> -		return IRQ_HANDLED;
> +			zr->frame_num++;
> +			zoran_reap_stat_com(zr);
> +			zoran_feed_stat_com(zr);
> +			return IRQ_HANDLED;
>  		}
>  		/* unused interrupts */
>  	}
> -- 
> 2.28.0
> 

Hello

Acked-by: Corentin Labbe <clabbe@baylibre.com>

Thanks
