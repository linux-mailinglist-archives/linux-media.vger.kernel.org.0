Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5652039C144
	for <lists+linux-media@lfdr.de>; Fri,  4 Jun 2021 22:24:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231327AbhFDUZx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Jun 2021 16:25:53 -0400
Received: from mail-ot1-f51.google.com ([209.85.210.51]:40924 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230177AbhFDUZx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Jun 2021 16:25:53 -0400
Received: by mail-ot1-f51.google.com with SMTP id c31-20020a056830349fb02903a5bfa6138bso10277966otu.7;
        Fri, 04 Jun 2021 13:24:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=G0QHStQ4MeKyA5yTSpuMKVPFHqDwVDi3XzL9FYi2HRo=;
        b=Y2S1mU4vAGDNwxsmI2smYnXV9YXBHCF1WkNs1eVV8gu5sIjaUHyFqjOP9OVd3cC+tQ
         jFZOZnufICLnxBIcleZYO94VXgqBrD5h1hlqID4ky84IN1LUEBvQF5ttXveLtX3ByPq4
         s/wnoE/+H+UmFiK8B3tnprrPDYpDDf1V0wvaD2noyUIz/2Ru4o/vF/IFmPrk9cS5oC8E
         yJFm4pUtM/sqqlXO3TH3MIASGWFa8HhbO49xGWnRSyI2MH6LZpTR9rAz1LLnGgbokpGH
         hRtOEpVa7Dm1DTDyc4Zv+Cs96B+vKd+3GZrUxd3NideFkCI5spVY4S87oTIQDLJBvAb0
         rHGQ==
X-Gm-Message-State: AOAM531//25jHrBSls6sAyPodVXHS6r4MhrkPfzpVRDpG1TNlwD+FabY
        F8LmiE5hUT7mWHsdfyeiMQ==
X-Google-Smtp-Source: ABdhPJyDRq8Forpnhpj29V25n4Eu8aizEobJWojsmd+maF+OG8QNBlFlx8255tS9a4i+ZtmpghHtEg==
X-Received: by 2002:a9d:6016:: with SMTP id h22mr4944272otj.158.1622838246117;
        Fri, 04 Jun 2021 13:24:06 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t26sm705154otc.23.2021.06.04.13.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 13:24:05 -0700 (PDT)
Received: (nullmailer pid 3852121 invoked by uid 1000);
        Fri, 04 Jun 2021 20:24:04 -0000
Date:   Fri, 4 Jun 2021 15:24:04 -0500
From:   Rob Herring <robh@kernel.org>
To:     Alex Bee <knaerzche@gmail.com>
Cc:     linux-rockchip@lists.infradead.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Lee Jones <lee.jones@linaro.org>, linux-media@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH v2 01/12] dt-bindings: mfd: syscon: add Rockchip
 RK3036/RK3228 qos compatibles
Message-ID: <20210604202404.GA3852087@robh.at.kernel.org>
References: <20210525152225.154302-1-knaerzche@gmail.com>
 <20210527154455.358869-1-knaerzche@gmail.com>
 <20210527154455.358869-2-knaerzche@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210527154455.358869-2-knaerzche@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 27 May 2021 17:44:44 +0200, Alex Bee wrote:
> Document Rockchip RK3036/RK3228 qos compatibles
> 
> Signed-off-by: Alex Bee <knaerzche@gmail.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> ---
> 
>  Changes in v2:
>  - collect Reviewed tag
> 
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
