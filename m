Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B23652819F6
	for <lists+linux-media@lfdr.de>; Fri,  2 Oct 2020 19:42:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387789AbgJBRmu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Oct 2020 13:42:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726813AbgJBRmu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Oct 2020 13:42:50 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 111FBC0613D0
        for <linux-media@vger.kernel.org>; Fri,  2 Oct 2020 10:42:49 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id u4so1852656ljd.10
        for <linux-media@vger.kernel.org>; Fri, 02 Oct 2020 10:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=kYaBGE8FDKdSAhGjRudHkqtNpKP27Bbn9L3739HNNks=;
        b=Bt+DePMJ6texOduoUI5XL/A/IhpD+f1x6WkvuR78JEMIvB4Mm3v0wG2Q1Yof0OrFKO
         bb1R4tOY9Lc7nOpuOD3fd5hC+AFxYiLq66n+2xK1T+Pm3OrCNHjdvR6jmdN8hFUsj/T0
         5glHiouQjjXEjSbZ0Zppv3GLTOJFLwEBhn3q7Nub5sBMvKJ0o2Hk8dvqqys80sjWmybL
         loWTpxvgbEuAYIvA7MGqDMAQI48xfHs3Urtp6wHPGATjXs9PcGtokryMxk2ZsUzA2keS
         VHqgsHtyhm4Sm2Ft8rnNLxkenZjlzzaN8hNGKLQO3N7WGyAKTcEqAMDnMHt7RoW2qE37
         WPaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=kYaBGE8FDKdSAhGjRudHkqtNpKP27Bbn9L3739HNNks=;
        b=Hj6luuhZgKiefuIXpdi2BEXACnzgSkLTMqXPJrIAXe3I5jLiukhSb5do+kIcc1OfdW
         xvIACnT57aiGSAVZyDM6kt14LmQXmR0ykEwBD0zBw/BnGuRZXiePUmWYSUfsucMHR724
         CD9iniTOqYUrfExoUVh6Ruj/EZFkN7zwtRW7s/DRTAthW4QaX9Z0h4U9Fs7qAWJBh7vW
         2B50pQOky6dPgGH7lMO9S1kWHkFrwMSZhk/p8BJuq1kxhE8AD2lt8KcpaKyOQdtKhKkf
         iW/JVyq/Ok+hQz/5TqM6rAxlTXOo4397NZeb06jFQrDbe4fuA+X9WkeSxRUCRSfuDUEQ
         cSrQ==
X-Gm-Message-State: AOAM532aHV+cqxEB2w3BkRpHIDsPS82XCx/lPQeze4JVt9aSolhtLQCz
        Dh6nROO7twV0H/UdB+6HO19Sy3f0BBhGvA==
X-Google-Smtp-Source: ABdhPJwic57I6NAt4mcAWPjLOHfB65TNhHVFsIHfl83LCABQHSrznKGVTVRfcWg710sUNG5PC5BdsA==
X-Received: by 2002:a2e:b0d2:: with SMTP id g18mr1092635ljl.198.1601660567494;
        Fri, 02 Oct 2020 10:42:47 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id r4sm361700ljg.123.2020.10.02.10.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 10:42:46 -0700 (PDT)
Date:   Fri, 2 Oct 2020 19:42:46 +0200
From:   Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        jmondi@jmondi.org
Subject: Re: [PATCH 3/5] v4l2-fwnode: Don't zero parts of struct
 v4l2_fwnode_endpoint anymore
Message-ID: <20201002174246.yhfraag6hfdxaprf@oden.dyn.berto.se>
References: <20200930144811.16612-1-sakari.ailus@linux.intel.com>
 <20200930144811.16612-4-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200930144811.16612-4-sakari.ailus@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thanks for your work.

On 2020-09-30 17:48:09 +0300, Sakari Ailus wrote:
> Don't zero parts of the vep argument to v4l2_fwnode_endpoint_parse()
> anymore as this can no longer be done while still supporting defaults on
> multiple bus types.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/v4l2-core/v4l2-fwnode.c | 12 ------------
>  1 file changed, 12 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> index dfc53d11053f..44dd04b05e29 100644
> --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> @@ -416,20 +416,8 @@ static int __v4l2_fwnode_endpoint_parse(struct fwnode_handle *fwnode,
>  	enum v4l2_mbus_type mbus_type;
>  	int rval;
>  
> -	if (vep->bus_type == V4L2_MBUS_UNKNOWN) {
> -		/* Zero fields from bus union to until the end */
> -		memset(&vep->bus, 0,
> -		       sizeof(*vep) - offsetof(typeof(*vep), bus));
> -	}
> -
>  	pr_debug("===== begin parsing endpoint %pfw\n", fwnode);
>  
> -	/*
> -	 * Zero the fwnode graph endpoint memory in case we don't end up parsing
> -	 * the endpoint.
> -	 */
> -	memset(&vep->base, 0, sizeof(vep->base));
> -
>  	fwnode_property_read_u32(fwnode, "bus-type", &bus_type);
>  	pr_debug("fwnode video bus type %s (%u), mbus type %s (%u)\n",
>  		 v4l2_fwnode_bus_type_to_string(bus_type), bus_type,
> -- 
> 2.27.0
> 
> 

-- 
Regards,
Niklas Söderlund
