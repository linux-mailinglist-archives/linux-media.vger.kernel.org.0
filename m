Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3290B32F568
	for <lists+linux-media@lfdr.de>; Fri,  5 Mar 2021 22:43:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229637AbhCEVnC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Mar 2021 16:43:02 -0500
Received: from mail-ot1-f46.google.com ([209.85.210.46]:42466 "EHLO
        mail-ot1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbhCEVmq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Mar 2021 16:42:46 -0500
Received: by mail-ot1-f46.google.com with SMTP id e45so3215245ote.9;
        Fri, 05 Mar 2021 13:42:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hIjE2Ie2dJUdbNUp6C8zbQpqMJ06oRCT6SDUJTjFxzI=;
        b=Hct+TuFcAorfuV8E3IOYNrnQEEwmajEK/FTIzeygpfUGkMTP5YrBbTn2gaSlYpC9au
         pYbtYnO0OE/6t3roWhfA4VP5lTfVHV3hpoDMdSUp4BAU3WBs8YD2evbHjDOqHW5Wy9mm
         DjmPtuO/xYqOVAiZHY7PmF4tm7czbyJqxIAvHb9caRxc+H3osHe2z6jKpYYZd7LUon3b
         Tq+RvJ0nrP8r1gytsI0ifHa62jubHXChFUkm0dlx6NiZ9HeEUX0cvzYuBiByhsCjsM7W
         GzmSE5cZ5Ck7ia7uf33Ou9/FL/2RkmDeaMbHzksVcRreVB2C70c5KaEGFCrGyG3RNs1/
         PSPQ==
X-Gm-Message-State: AOAM533gAMtNDV2yCXRhVXwQhrVMcqgajBlL6ynbA3vsWno983DVpjAZ
        4y66ia0K/KoyKrOZwgVoGroR1bC22w==
X-Google-Smtp-Source: ABdhPJyJvwsN82cjjH+If7JPA/dtCSS11++ge6xrLEzJJ9R2SMbCyM4K1cO1QYJarJWUgH05j2VUtA==
X-Received: by 2002:a9d:6a9:: with SMTP id 38mr9620972otx.365.1614980565505;
        Fri, 05 Mar 2021 13:42:45 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id g6sm817104ooh.29.2021.03.05.13.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 13:42:45 -0800 (PST)
Received: (nullmailer pid 696287 invoked by uid 1000);
        Fri, 05 Mar 2021 21:42:44 -0000
Date:   Fri, 5 Mar 2021 15:42:44 -0600
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v2 60/77] dt-bindings: media: nxp,imx7-mipi-csi2: Indent
 example with 4 spaces
Message-ID: <20210305214244.GA696230@robh.at.kernel.org>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
 <20210215042741.28850-61-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210215042741.28850-61-laurent.pinchart@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 15 Feb 2021 06:27:24 +0200, Laurent Pinchart wrote:
> DT bindings examples are customarily indented with 4 spaces.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../bindings/media/nxp,imx7-mipi-csi2.yaml    | 54 +++++++++----------
>  1 file changed, 27 insertions(+), 27 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
