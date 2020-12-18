Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDE862DEAFA
	for <lists+linux-media@lfdr.de>; Fri, 18 Dec 2020 22:20:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728292AbgLRVSx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Dec 2020 16:18:53 -0500
Received: from mail-oo1-f43.google.com ([209.85.161.43]:36294 "EHLO
        mail-oo1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725938AbgLRVSw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Dec 2020 16:18:52 -0500
Received: by mail-oo1-f43.google.com with SMTP id j8so897880oon.3;
        Fri, 18 Dec 2020 13:18:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Wt0mUTvYjgEGXoROiBGL2mhX+iiLbtYyfxaY4AlF4b0=;
        b=gQOlriaV5LdmqkDxpyuItd4izHsUl7jkHvmd20z08swmx7Ce3PMmEetaXLXQGSypNx
         pmPVtQpJsVWWd1TNgmVFebQ7/LtRwdImqQJCfsXe8/nj/8z70GTmt0Z1whR+00KVYJGZ
         zSM/YVQCWogUU0qwqDICxxkFm2PIYzh5/GNjGPNc6poekDW3xnKjxRv//SbcVsa2i/tQ
         5Id+UAh5aOia3nUl5Bq5mtbCGpPlNgXwcfbwjw4qokZiNvWF+MyZHlQueaWkm6czmzIO
         Z/XzHG6xvYCynUqAE2Wq3B53ZtmVi6vvh6Vilkag6rsv0iT+YjieHi7ds+A3bbDIsoFV
         SNjg==
X-Gm-Message-State: AOAM531Je812r59fzuoPUmJaDU+fAyGE3I/iunz3f34pE1slBk6kbN+H
        K4OgCitgd2gz231F4TVafQ==
X-Google-Smtp-Source: ABdhPJwT6F2L2kbZlfz78TAQW12p5MPMaWCcTiZJv/kmxWXY9jGqABo5u7uXi2dOQHOzcAfCzvikWw==
X-Received: by 2002:a4a:d126:: with SMTP id n6mr4253081oor.47.1608326291623;
        Fri, 18 Dec 2020 13:18:11 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i25sm2125830oto.56.2020.12.18.13.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Dec 2020 13:18:10 -0800 (PST)
Received: (nullmailer pid 2192063 invoked by uid 1000);
        Fri, 18 Dec 2020 21:18:09 -0000
Date:   Fri, 18 Dec 2020 15:18:09 -0600
From:   Rob Herring <robh@kernel.org>
To:     Zhen Lei <thunder.leizhen@huawei.com>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        devicetree <devicetree@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Fabio Estevam <festevam@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ricardo Ribalda <ribalda@kernel.org>,
        linux-media <linux-media@vger.kernel.org>
Subject: Re: [PATCH 2/4] dt-bindings: media: nokia, smia: eliminate yamllint
 warnings
Message-ID: <20201218211809.GE2190633@robh.at.kernel.org>
References: <20201207042400.1498-1-thunder.leizhen@huawei.com>
 <20201207042400.1498-3-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201207042400.1498-3-thunder.leizhen@huawei.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 07 Dec 2020 12:23:58 +0800, Zhen Lei wrote:
> Eliminate the following yamllint warnings:
> ./Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
> :4:1: [error] missing document start "---" (document-start)
> :29:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
> :32:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
> 
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 

Applied, thanks!
