Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 025FE4A6FAC
	for <lists+linux-media@lfdr.de>; Wed,  2 Feb 2022 12:12:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343781AbiBBLMD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Feb 2022 06:12:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239930AbiBBLMC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Feb 2022 06:12:02 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73178C06173D
        for <linux-media@vger.kernel.org>; Wed,  2 Feb 2022 03:12:02 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id b9so39852992lfq.6
        for <linux-media@vger.kernel.org>; Wed, 02 Feb 2022 03:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=WowO/tbBN3GmrEExtkfItSPMYGr3cW8sawMMl7HgwRs=;
        b=Ki7UBLEWceEgRkfHsxjilLw1gR6tQ8CpS1Tg7mAJDBKSXFbfEyA38UjP2Yhlow49IC
         ty+tq4RdOraeZymEoliHNo1njGTay9iCfW0hrCpNg2Hh/hA/WMfTPILoQvrgJkAbm+wq
         ImcJHUclBiftxNxSpPPqYmp9W4ceyQrxv114GGa5t2KUjdBDBLMD/zpJzK4NLyUjFZgT
         D9pJ291zEH4TPHYuDMuYM5qPtgWS07uKbGNRdDRSYbl+lRDBhgOYP7cLo5dKWoL3qThc
         s9oTLqr+wayFfAmek0bgiw7uzuwUNhy+eqjZVe003WCLmI8b15p7Mu5Sr6UFsnLd37Mx
         1MRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=WowO/tbBN3GmrEExtkfItSPMYGr3cW8sawMMl7HgwRs=;
        b=b9zLFA5t1mr+GvZx+nKoeXjD+S5KRgSWzvLiR8dpbKZaP+okwYnPWXAHqI7beMkfwC
         3N1qQR7bLDh6WpB5KcxEugZcjKKFgLV3P3iLUXNm/Fm8JmLYAw7KtbNA+1h41nXXNUzz
         UyQAvVIVEZ46PzuR1c9dLsaJuhfOIhEJYg8w1trKkEH73g3OO7gTzYuro3szMlJtZKo0
         LMzpOgN6+3jugs4GyylS4AO7KVnewIo/RpI7gVCaA572rANbFGH0YfA3fkko85HnW1KH
         1fc3D/o//BxX/63PaKHQZehTB5U5DV3h/yPvWafjt6AK3UIh/1CZzsEg1C7kqSTUPLSa
         85ZA==
X-Gm-Message-State: AOAM532Ns8HzMmOXBIUJpDhUFkO0/lzAO/kjyEZuL3NEQd1tDa/lBsEl
        XYWpbepvq/1uVMa7mvOPUzKXHA==
X-Google-Smtp-Source: ABdhPJzoVKGNC+ExaA03bZR1aySv64t3gjKX6TLygqnlu+9A3J0QrBXVTKdXgTFqcG41WMKwf+xPvA==
X-Received: by 2002:a05:6512:1043:: with SMTP id c3mr22674272lfb.103.1643800320805;
        Wed, 02 Feb 2022 03:12:00 -0800 (PST)
Received: from localhost (h-85-24-188-65.A463.priv.bahnhof.se. [85.24.188.65])
        by smtp.gmail.com with ESMTPSA id u21sm2433153ljo.81.2022.02.02.03.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 03:12:00 -0800 (PST)
Date:   Wed, 2 Feb 2022 12:11:59 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: Re: [PATCH] media: rcar-vin: require master VIN only for CSI source
Message-ID: <Yfpm/7p/O4WPpx3m@oden.dyn.berto.se>
References: <20220202104700.3329055-1-nikita.yoush@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220202104700.3329055-1-nikita.yoush@cogentembedded.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nikita,

Thanks for your work.

On 2022-02-02 13:47:00 +0300, Nikita Yushchenko wrote:
> Hardware limitations on VINs that can be used at the same time cover only
> CSI data source. For parallel source, any single VIN can work.
> 
> This patch moves check for master VIN availability in
> rvin_csi2_link_notify() below processing the parallel case.
> 
> This fixes media-ctl usage on KF board when both CSI and parallel cameras
> are in use on the same system. In such a setup, VINs 0-3 are used for
> CSI cameras and VIN5 is used for parallel camera.

I agree this issue needs to be addressed and I think the use-case is 
covered in the patch 1/3 in the VIN routing series [1]. I don't have 
access to King Fisher hardware so I can't test it, if you do could you 
test that series and see if it fix the issue?

1. [PATCH v3 0/3] media: rcar-{csi2,vin}: Move to full Virtual Channel routing per CSI-2 IP
   https://lore.kernel.org/linux-renesas-soc/20220124124858.571363-4-niklas.soderlund+renesas@ragnatech.se/T/

> 
> Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
> ---
>  drivers/media/platform/rcar-vin/rcar-core.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
> index 0186ae235113..038ee187f95a 100644
> --- a/drivers/media/platform/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> @@ -826,11 +826,6 @@ static int rvin_csi2_link_notify(struct media_link *link, u32 flags,
>  	vin = container_of(vdev, struct rvin_dev, vdev);
>  	master_id = rvin_group_id_to_master(vin->id);
>  
> -	if (WARN_ON(!group->vin[master_id])) {
> -		ret = -ENODEV;
> -		goto out;
> -	}
> -
>  	/* Build a mask for already enabled links. */
>  	for (i = master_id; i < master_id + 4; i++) {
>  		if (!group->vin[i])
> @@ -878,6 +873,11 @@ static int rvin_csi2_link_notify(struct media_link *link, u32 flags,
>  		goto out;
>  	}
>  
> +	if (WARN_ON(!group->vin[master_id])) {
> +		ret = -ENODEV;
> +		goto out;
> +	}
> +
>  	channel = rvin_group_csi_pad_to_channel(link->source->index);
>  	mask_new = mask & rvin_csi2_get_mask(vin, csi_id, channel);
>  	vin_dbg(vin, "Try link change mask: 0x%x new: 0x%x\n", mask, mask_new);
> -- 
> 2.30.2
> 

-- 
Kind Regards,
Niklas S�derlund
