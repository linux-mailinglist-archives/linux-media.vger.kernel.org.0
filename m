Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FA952D1E08
	for <lists+linux-media@lfdr.de>; Tue,  8 Dec 2020 00:02:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727916AbgLGXCh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 18:02:37 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:40941 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726667AbgLGXCg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Dec 2020 18:02:36 -0500
Received: by mail-oi1-f194.google.com with SMTP id p126so17371698oif.7;
        Mon, 07 Dec 2020 15:02:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+pU2nsQGKQc0tmhJIlZKY1b80u/yOE+8X52UsR6x8wI=;
        b=bUEr2OLQ6KWfzTAdmDNk0VZqyqgH0fKApdwtYddP7TQhgUpztDmao4zLuARgKO7yK6
         z2OPxqKCjISWPtGWSHQtBj1l810vh1HFSDQTM0CA27YQRxgxcL4TVy4YQqsteqUZryYC
         RRCSURtVB011cvAFtJ/ftjls7R8V4ZhPTjtDx66jYSJOntyKyVEBgdLlEqX6vDywTxyZ
         dCGn1NWeebRy9IokPItGW/hHllWVTPY9trIvkggFc3xhhrO+Dbg4SqNP0NZ7R13+jFVt
         XtTRW8eESLoxbnTtfEZNuJUqNnOGDA12mx9BISiif4GCs1zhaVWCaXojqvZoNrrFqyNq
         oemA==
X-Gm-Message-State: AOAM531JLlesFBC4kQjBpnyipca4TK4YP+QJrNkLxKMhMxFs6UMlbl7f
        sy6MmNY9ihldWE3r0znwGg==
X-Google-Smtp-Source: ABdhPJwvpBBcSdcsjFI6wMSczJScgGyWaUUhmNoQYRyAoV00Zna4Rt0osE/1UZ1+xkTMn8+xm5I49A==
X-Received: by 2002:aca:db06:: with SMTP id s6mr817838oig.52.1607382115761;
        Mon, 07 Dec 2020 15:01:55 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n63sm3279931oih.39.2020.12.07.15.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 15:01:54 -0800 (PST)
Received: (nullmailer pid 1009782 invoked by uid 1000);
        Mon, 07 Dec 2020 23:01:53 -0000
Date:   Mon, 7 Dec 2020 17:01:53 -0600
From:   Rob Herring <robh@kernel.org>
To:     Zhen Lei <thunder.leizhen@huawei.com>
Cc:     devicetree <devicetree@vger.kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Fabio Estevam <festevam@gmail.com>,
        Ricardo Ribalda <ribalda@kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH 2/4] dt-bindings: media: nokia, smia: eliminate yamllint
 warnings
Message-ID: <20201207230153.GA1009697@robh.at.kernel.org>
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

Reviewed-by: Rob Herring <robh@kernel.org>
