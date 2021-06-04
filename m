Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E25039C18E
	for <lists+linux-media@lfdr.de>; Fri,  4 Jun 2021 22:45:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231148AbhFDUrg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Jun 2021 16:47:36 -0400
Received: from mail-oo1-f43.google.com ([209.85.161.43]:38489 "EHLO
        mail-oo1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229854AbhFDUrf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Jun 2021 16:47:35 -0400
Received: by mail-oo1-f43.google.com with SMTP id o66-20020a4a44450000b029020d44dea886so2545038ooa.5;
        Fri, 04 Jun 2021 13:45:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=J9wbO4iepQS7fHLsPG9Sl+dEG0o3lIQGorDKRuT1O+A=;
        b=AK+ESFzF28FQw1uxdUzyz01mrlbjA4fTaYINfeRizcVVD5M9jGHpobfmp2Uhm4C189
         qy+XdPeIVJqnP6VdhmxCkkVz7+sTBLgORMtNl1ie4JNGNQWclfR0PWd42798cpSVjb9b
         V3NBrRA/QIWueEXZH+thyVD/Ejp2v0/tTYDNfOP6DXF/h+ie01C1uAgwRtDPxLqPXeGk
         XQw6A7U+ukfF7z5fXxqjI0V/I/15Nc3ScgLekpzwpyikE0gx455Si0ZnnJoadHydYWIe
         zQdPIhly93jfjE2FyEFIVJnzIt57et7JAxpu4MEG7RWVLyzgw273Ht5WKCLrl62Cmi4h
         7u2A==
X-Gm-Message-State: AOAM530o8jQLeQIi0/591e3Ytgc4d+R6qpCfHB+mMQ9nXjW+z+LwN4Z0
        aLQgiO3Y2+7dG0+Ni7ApSw==
X-Google-Smtp-Source: ABdhPJynR4v6IWpcD8BCd5FuJd4Zwv4puzVbEb52RaGPB7CaRl9pN48d8jqREDRRIQChZUZN/E8DJw==
X-Received: by 2002:a4a:94ef:: with SMTP id l44mr5043933ooi.84.1622839539471;
        Fri, 04 Jun 2021 13:45:39 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 21sm79912otd.21.2021.06.04.13.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 13:45:38 -0700 (PDT)
Received: (nullmailer pid 3884907 invoked by uid 1000);
        Fri, 04 Jun 2021 20:45:37 -0000
Date:   Fri, 4 Jun 2021 15:45:37 -0500
From:   Rob Herring <robh@kernel.org>
To:     Alex Bee <knaerzche@gmail.com>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        linux-rockchip@lists.infradead.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v2 03/12] dt-bindings: media: rockchip-vdec: add RK3228
 compatible
Message-ID: <20210604204537.GA3884845@robh.at.kernel.org>
References: <20210525152225.154302-1-knaerzche@gmail.com>
 <20210527154455.358869-1-knaerzche@gmail.com>
 <20210527154455.358869-4-knaerzche@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210527154455.358869-4-knaerzche@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 27 May 2021 17:44:46 +0200, Alex Bee wrote:
> Document the RK3228 compatible for rockchip-vdec.
> Also add the optional assigned-clocks and assigned-clock-rates
> properties.
> 
> Signed-off-by: Alex Bee <knaerzche@gmail.com>
> ---
> 
>  Changes in v2:
>  - fix indentation
> 
>  .../devicetree/bindings/media/rockchip,vdec.yaml       | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
