Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53AD1211198
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2020 19:06:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732517AbgGARGq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jul 2020 13:06:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728103AbgGARGp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Jul 2020 13:06:45 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5423C08C5DB
        for <linux-media@vger.kernel.org>; Wed,  1 Jul 2020 10:06:44 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id h22so20902057lji.9
        for <linux-media@vger.kernel.org>; Wed, 01 Jul 2020 10:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=tcIQMF02joGJf9PoED6lN7WVG9QYgV665UVlkED6s7M=;
        b=ApapzghEJPkCJtTaj2opXImF/Hme9OqoLIgo+RINEDoctO9HLV9eSes9+qO+wy4siK
         J2iR09/6u5RMl/udCQkFj50vjDHtFTMehZ/l36RHIummt6tcTr9luhSkL15pllNr4cMe
         WSQiNdirT3bU1RBl21vaCWbraFyrKjtU89zzkD2MIxJ1eS3sfLAeogd7bwhTQX+D8Ndl
         /6EBz3ZbayvgUlwP/RyJHIBgn64Au53kMBOIJELYf7014LoOsrqKlxPp/6BRPvOg2Jkp
         a6WkioaUPb2N+/pFqelKeOlVgQpm38ROYK0RZXlkcJq5VmiYj0EiAM7bEYLcns3Ol+o/
         vomA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=tcIQMF02joGJf9PoED6lN7WVG9QYgV665UVlkED6s7M=;
        b=jaM4GL4Uf9yR3fgIxMb/EdnL80IpM44CQwAnGZ8rQEcuxQhJPLGtky49IGDy9vVVnY
         0gM+uAjqW12AeEJhEoksf57ZhwXSYb9ulGMbTfkt9X+jC+Cdi2u187rPq04+jNU+BYE4
         xE6MZgqxdR92FQTezUQrRy5sNyKd40s94LaXb8slIC7Egok/tTX7+bcv3YGTtEsAAwkV
         YXSs3SbfxaXuCw58q/slsSkBJVOHu0oX2iNbGwmWa5tvTGM3d5GMHqdRilO6KwybfSEj
         Yu/WaOlNV56XC9xv3NPa1yASGJHrPjkNbOgYArcahSZpRUjNy0ZoZKdtz4wGZk2FHmD6
         t3Zw==
X-Gm-Message-State: AOAM532+TGqFQu8pSwxwpZ4tJRxClUyW9hNYJPXgiw7rLYus7ZuqNns6
        KYjrFgaXC1/s+NXrNIhzI80Wmw==
X-Google-Smtp-Source: ABdhPJx7+SK6IJp6bSOIKCatkPwOLaV0Qt7gkogizWrPHXb7o3gsqUmjH9/jP2Xicsj0KIhA4gDs6Q==
X-Received: by 2002:a05:651c:1a7:: with SMTP id c7mr13530894ljn.345.1593623203053;
        Wed, 01 Jul 2020 10:06:43 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id c27sm2243714lfm.56.2020.07.01.10.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2020 10:06:42 -0700 (PDT)
Date:   Wed, 1 Jul 2020 19:06:42 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Lad Prabhakar <prabhakar.csengg@gmail.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: [PATCH v4 1/4] device property: Add a function to test is a
 fwnode is a graph endpoint
Message-ID: <20200701170642.GA2703142@oden.dyn.berto.se>
References: <20200701062140.12953-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200701062140.12953-2-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200701062140.12953-2-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thanks for your work.

On 2020-07-01 09:21:37 +0300, Laurent Pinchart wrote:
> Drivers may need to test if a fwnode is a graph endpoint. To avoid
> hand-written solutions that wouldn't work for all fwnode types, add a
> new fwnode_graph_is_endpoint() function for this purpose. We don't need
> to wire it up to different backends for OF and ACPI for now, as the
> implementation can simply be based on checkout the presence of a
> remote-endpoint property.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  include/linux/property.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/include/linux/property.h b/include/linux/property.h
> index 10d03572f52e..9f805c442819 100644
> --- a/include/linux/property.h
> +++ b/include/linux/property.h
> @@ -389,6 +389,11 @@ struct fwnode_handle *
>  fwnode_graph_get_remote_node(const struct fwnode_handle *fwnode, u32 port,
>  			     u32 endpoint);
>  
> +static inline bool fwnode_graph_is_endpoint(struct fwnode_handle *fwnode)
> +{
> +	return fwnode_property_present(fwnode, "remote-endpoint");
> +}
> +
>  /*
>   * Fwnode lookup flags
>   *
> -- 
> Regards,
> 
> Laurent Pinchart
> 

-- 
Regards,
Niklas Söderlund
