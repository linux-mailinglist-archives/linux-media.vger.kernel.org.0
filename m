Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A74D331602
	for <lists+linux-media@lfdr.de>; Mon,  8 Mar 2021 19:27:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231215AbhCHS1U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Mar 2021 13:27:20 -0500
Received: from mail-io1-f48.google.com ([209.85.166.48]:36638 "EHLO
        mail-io1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231195AbhCHS1P (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Mar 2021 13:27:15 -0500
Received: by mail-io1-f48.google.com with SMTP id n14so11033937iog.3;
        Mon, 08 Mar 2021 10:27:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=97Qo41nmcqQCSePForLjj7qoU92V44P+OYA/wPDxOHs=;
        b=OmTIBErlYioIBfVsVJof7apJXSIq1ruBak+cRDiRTFRyKn1MwGPpRfsAIJrom2Rsdz
         siB2/NDXwTb86Besn82sUBJt5LQCYKz7IMx2J4XYW4rLc84RXuGYBaI1D2Bil99INKF5
         BzjRbIhmeJxjUHd4/brex/9mISL+NQqgFIA6h4r0P4jrS2xX9H65Q0qsq5uxuewgwE75
         1O9Y7+WiEHbf1xVVig5UloWiRdznwCMVtmo2uchesEZFUMAtFY7jMJzfRR+0hxfdYTep
         aueypO4EVnr8J+hTko0/7/Jm5+hrvtV8PVt+s3xJR4llb/SzAtXq625Ih/bx+XfSXPGf
         E0TQ==
X-Gm-Message-State: AOAM5308y2qv1ovdXGOC3RvnNyO3HHxDkM0O4OJVTx0l6dYP9zij4rIv
        +OfqudpjjuLVBYXi1emuhg==
X-Google-Smtp-Source: ABdhPJz/2LyQxTwCb3KhHlojVzK95l7nGBwrQMjXL50voTRYFspz2SZAuyeE6UmKqRKqZ/5U8DGFZw==
X-Received: by 2002:a05:6638:1653:: with SMTP id a19mr24584428jat.113.1615228033721;
        Mon, 08 Mar 2021 10:27:13 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id f11sm5221050ilr.5.2021.03.08.10.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 10:27:12 -0800 (PST)
Received: (nullmailer pid 2745467 invoked by uid 1000);
        Mon, 08 Mar 2021 18:27:10 -0000
Date:   Mon, 8 Mar 2021 11:27:10 -0700
From:   Rob Herring <robh@kernel.org>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        ezequiel@collabora.com, linux-imx@nxp.com,
        linux-rockchip@lists.infradead.org, kernel@pengutronix.de,
        robh+dt@kernel.org, gregkh@linuxfoundation.org,
        s.hauer@pengutronix.de, kernel@collabora.com,
        linux-arm-kernel@lists.infradead.org, devel@driverdev.osuosl.org,
        festevam@gmail.com, devicetree@vger.kernel.org, mchehab@kernel.org,
        shawnguo@kernel.org, p.zabel@pengutronix.de
Subject: Re: [PATCH v3 2/5] dt-bindings: media: IMX8MQ VPU: document reset
 usage
Message-ID: <20210308182710.GA2745438@robh.at.kernel.org>
References: <20210301151754.104749-1-benjamin.gaignard@collabora.com>
 <20210301151754.104749-3-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210301151754.104749-3-benjamin.gaignard@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 01 Mar 2021 16:17:51 +0100, Benjamin Gaignard wrote:
> Document IMX8MQ VPU bindings to add the phandle to the reset driver.
> 
> Provide an independent reset driver allow to the both VPUs to share
> their control/reset hardware block. The reset driver replace what
> was previously done be using the 'ctrl' registers inside the driver.
> 
> This breaks the compatibility between DTB and kernel but the driver
> is still in staging directory and limited to IMX8MQ SoC.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
> version 3:
> - Fix error in VPU example node
> 
>  .../devicetree/bindings/media/nxp,imx8mq-vpu.yaml  | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
