Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1925F35E357
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 18:00:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238707AbhDMQAt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 12:00:49 -0400
Received: from mail-oi1-f175.google.com ([209.85.167.175]:36527 "EHLO
        mail-oi1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbhDMQAr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 12:00:47 -0400
Received: by mail-oi1-f175.google.com with SMTP id c16so17495453oib.3;
        Tue, 13 Apr 2021 09:00:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Hf71HnfjaYarecOimAnAmtORkCXf+7TlGhiC07dVSSk=;
        b=RZENcQdYxQfRmvk0w9IXjVNRecnZsyLbcwXkDcHP4D44yvaixLIQwOxsC/zDtnGzWd
         5UopLDBpxpixhKA9KMwM7RTCve1eUOPfMFeSgFTULOUUGsvpnRMZyh1VdSCVj23E7Znp
         7RldkLuFzpZYOFed+54P3yuKu9UFoRKjGNJtwTREhK31gssA2uwWAXfCftwWWrpn3SMC
         vjrNOSxBfWXRBuR4gtm6RwXFL8a72Y6DCn4EGCNR1KQqH8C8VCkH5tQ2+EN4PL2rbWJc
         0SI1jrWSttRDx6sFdMrx5B91IQMgI0MqRx2UiQzjHx3zHcj0LFdRk7C8AgSz1exC4zEg
         IDFg==
X-Gm-Message-State: AOAM533Re44cNo8olWkrRe/j5tYn+mVPDFYBpltflzUDdToJaCEOj4qR
        D+wZzjta6gLkINQdGh9f1QIWr4AZqQ==
X-Google-Smtp-Source: ABdhPJymbM/isAJMJCc1wHnk+yvEtGmuDobqXx8udlWq6Wc6/HZpIfyPbj1/Zan303sALN4yTfl6Og==
X-Received: by 2002:aca:3bc4:: with SMTP id i187mr508711oia.174.1618329627570;
        Tue, 13 Apr 2021 09:00:27 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id h28sm850702oof.47.2021.04.13.09.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 09:00:25 -0700 (PDT)
Received: (nullmailer pid 1749085 invoked by uid 1000);
        Tue, 13 Apr 2021 16:00:23 -0000
Date:   Tue, 13 Apr 2021 11:00:23 -0500
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Marek Vasut <marex@denx.de>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 22/23] dt-bindings: media: nxp,imx7-mipi-csi2: Add
 i.MX8MM support
Message-ID: <20210413160023.GA1749037@robh.at.kernel.org>
References: <20210413023014.28797-1-laurent.pinchart@ideasonboard.com>
 <20210413023014.28797-23-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210413023014.28797-23-laurent.pinchart@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 13 Apr 2021 05:30:13 +0300, Laurent Pinchart wrote:
> The i.MX8MM integrates a newer version of the CSIS CSI-2 receiver as the
> i.MX7 family. Differences in integration are are:
> 
> - An additional clock is required
> - Up to 4 data lanes are supported
> - No reset or PHY supply is present
> 
> Support it in the DT binding.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../bindings/media/nxp,imx7-mipi-csi2.yaml    | 108 +++++++++++++++---
>  1 file changed, 94 insertions(+), 14 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
