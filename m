Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 929B9281718
	for <lists+linux-media@lfdr.de>; Fri,  2 Oct 2020 17:48:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387990AbgJBPsz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Oct 2020 11:48:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726090AbgJBPsy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Oct 2020 11:48:54 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA0D7C0613D0
        for <linux-media@vger.kernel.org>; Fri,  2 Oct 2020 08:48:53 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id z17so2409077lfi.12
        for <linux-media@vger.kernel.org>; Fri, 02 Oct 2020 08:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=lZ7K5vxjG+af3Rsfqys+/S17MV8AKnaXQCfsU/iKvls=;
        b=i+MylcBommjt1hb275tAaIfcw7EBbceY8x3Cms5FjqXlMaehKaMeQN8AElD+H+5gCP
         Gd1nDm8EwobbQptIxatYaUokXHkxrrl4B9ZTQ0KnPkUNXU/RDhpVn7LUQMSY4ryyVQ+L
         jl6/xRnVGyjSlYV7CVFagcknQOv8WKBahDpv5LZQbj26lupYgTBsT057snMmr4DMdkMy
         ptwbQrW1fC/hSYGeuMllkr/n9PxXbFD88bxPYJruwk/gsl2n0ZgHj1hjJoPbhIJgvLI3
         B42w7bbbFgyIbTO4wYsD+FYaibBGG0YfSOaWKVSLHkuN2BFCPKCXxiUBECi+xuJrVyKA
         gSjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=lZ7K5vxjG+af3Rsfqys+/S17MV8AKnaXQCfsU/iKvls=;
        b=p/7rqbdxK7465+I7h8GJ8dhzUKq5e/v8Ku84EKknnr2obf6O3bmuc9uq3B02Kme1xM
         YH/EExQd7GFSeQGZy6CPUtZeZRT+99hM1EZWXDpDskEuZFdvKaq305sHJEq33iYwdnsj
         d+I0KJXrTfF7BD3dT3sdiagubgZtPD+3UM5zIF8Wgz6SjbUREAyA+nRblJraBrQjdIA9
         GliGrqvEK96j81fjtO0p9E/oNkqnZ4k4/H9xR3iJPqNnZFN3DIVSn6x2nIHSA+bZ9OgU
         mv0n1mQxN9stylWkdN/d1s5GciXceeRF5oz9OgvVvc3Nqm5n2wEokit313PEQyIsVvp4
         bsWw==
X-Gm-Message-State: AOAM532Q63HkbFYNau8PzbgfnWhLw/t+tIikIojAJkGIbBuVsloSvm0j
        06BtsR8wRAnOheQvz/ui2lUolZQc5Uq3wQ==
X-Google-Smtp-Source: ABdhPJxcCC8/iVTCCT8fP/lgc84dz+uilKkBccH1tHevmpyEcnkkq+qMy3cZo5T66yzi1w6f0sZRyA==
X-Received: by 2002:a19:4f03:: with SMTP id d3mr977883lfb.369.1601653732124;
        Fri, 02 Oct 2020 08:48:52 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id v196sm352933lfa.96.2020.10.02.08.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 08:48:51 -0700 (PDT)
Date:   Fri, 2 Oct 2020 17:48:51 +0200
From:   Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        jmondi@jmondi.org
Subject: Re: [PATCH 1/5] adv748x: Zero entire struct v4l2_fwnode_endpoint
Message-ID: <20201002154851.vothhp5d2yhdouoi@oden.dyn.berto.se>
References: <20200930144811.16612-1-sakari.ailus@linux.intel.com>
 <20200930144811.16612-2-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200930144811.16612-2-sakari.ailus@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thanks for your patch.

On 2020-09-30 17:48:07 +0300, Sakari Ailus wrote:
> The v4l2_fwnode_parse_endpoint() function can make use of defaults in
> multiple bus types. To use this feature, all callers must zero the rest of
> the fields of this struct, too. All other drivers appear to do that
> already apart from this one.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/i2c/adv748x/adv748x-core.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/adv748x/adv748x-core.c b/drivers/media/i2c/adv748x/adv748x-core.c
> index 1fe7f97c6d52..ae8b7ebf3830 100644
> --- a/drivers/media/i2c/adv748x/adv748x-core.c
> +++ b/drivers/media/i2c/adv748x/adv748x-core.c
> @@ -589,14 +589,13 @@ static int adv748x_parse_csi2_lanes(struct adv748x_state *state,
>  				    unsigned int port,
>  				    struct device_node *ep)
>  {
> -	struct v4l2_fwnode_endpoint vep;
> +	struct v4l2_fwnode_endpoint vep = { .bus_type = V4L2_MBUS_CSI2_DPHY };
>  	unsigned int num_lanes;
>  	int ret;
>  
>  	if (port != ADV748X_PORT_TXA && port != ADV748X_PORT_TXB)
>  		return 0;
>  
> -	vep.bus_type = V4L2_MBUS_CSI2_DPHY;
>  	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep), &vep);
>  	if (ret)
>  		return ret;
> -- 
> 2.27.0
> 
> 

-- 
Regards,
Niklas Söderlund
