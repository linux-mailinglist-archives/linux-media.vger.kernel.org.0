Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 515EA252272
	for <lists+linux-media@lfdr.de>; Tue, 25 Aug 2020 23:06:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726391AbgHYVGk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Aug 2020 17:06:40 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:41944 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726222AbgHYVGk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Aug 2020 17:06:40 -0400
Received: by mail-il1-f196.google.com with SMTP id q14so170296ilj.8;
        Tue, 25 Aug 2020 14:06:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3X1NqT5A+cySDgCFQQiNu5MRA8ZaigPXSkYW97Cnxog=;
        b=t8ySb2sqdHufvDvv7BgZ/7xf2L2Oz/BuYmuhXTd/02BFwqRYoPdvRHXJvrDlyhhFVf
         SCW5i7vgO8S3rOHnYIeyqRKO6GNWolo6pH6kSLZ3x0+Ou1j2qZ5c+zA4MxJ7FOePxOQN
         faCjtMn2aup8mqxckhItxagCJZzwSiXJ1Q49jLzhj7kMgNvO8dkVlbQlYf9ODoDAhYhO
         O6WERUZu9P+uZWQwRbp025vO0HATmIJF6K4fsEZEtk10uZTq8b7nONPSE4c8weRlXQnG
         tpJZbnptIF5slCIH04Fc+YPl590claSwVxT4dIk8284620f9FM1TPMUBLJWZ2DZGxzpL
         Vv8g==
X-Gm-Message-State: AOAM532oSilvIt7V0nyEIYsZ9CUtstIEYDXYtWI3wFEJFy40MubVhpTS
        G92/f+qzG0zLMhovJZUVPg==
X-Google-Smtp-Source: ABdhPJxYsxHHKAA+ZuE7WE9u5m3Ev9HuMupIV6b4bAnJbmky8o0ZMD2wD0uKgxWbPd0FGvqbyZdAoQ==
X-Received: by 2002:a92:4184:: with SMTP id o126mr11211031ila.6.1598389598801;
        Tue, 25 Aug 2020 14:06:38 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id e68sm9019182iof.36.2020.08.25.14.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 14:06:38 -0700 (PDT)
Received: (nullmailer pid 1330191 invoked by uid 1000);
        Tue, 25 Aug 2020 21:06:35 -0000
Date:   Tue, 25 Aug 2020 15:06:35 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        linux-renesas-soc@vger.kernel.org, sakari.ailus@linux.intel.com,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH 2/3] dt-bindings: media: ov772x: Make bus-type mandatory
Message-ID: <20200825210635.GA1327534@bogus>
References: <20200818122012.37956-1-jacopo+renesas@jmondi.org>
 <20200818122012.37956-3-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200818122012.37956-3-jacopo+renesas@jmondi.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 18 Aug 2020 14:20:11 +0200, Jacopo Mondi wrote:
> In order to establish required properties based on the selected
> bus type, make the 'bus-type' property mandatory.
> 
> Binary compatibility with existing DTB is kept as the driver does not
> enforce the property to be present, and shall fall-back to default
> parallel bus configuration, which was the only supported bus type, if
> the property is not specified.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  Documentation/devicetree/bindings/media/i2c/ov772x.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
