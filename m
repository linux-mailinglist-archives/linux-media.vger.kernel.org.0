Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BB2439C13A
	for <lists+linux-media@lfdr.de>; Fri,  4 Jun 2021 22:22:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231154AbhFDUYa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Jun 2021 16:24:30 -0400
Received: from mail-ot1-f41.google.com ([209.85.210.41]:33340 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229854AbhFDUY3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Jun 2021 16:24:29 -0400
Received: by mail-ot1-f41.google.com with SMTP id q9-20020a9d66490000b02903c741e5b703so9156859otm.0;
        Fri, 04 Jun 2021 13:22:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HCl886kpn3SG8C1p3DCb+d+Lmx3Gbrd8ytIpkR36miA=;
        b=g6Ent5BXciGHXc87bcFPKPGD3kaDzoKKyNo3Sq1sRYJgkYaaqIT5Aw4FHquH2evVNn
         FSvIpfGPGwDZgt3ZvrF2Nm+5HX9n1drZzWK802KsWuW9oUW1CCIcFAHctRN0kREpXEFi
         4E5F+3MILT809ktKjXPMXSm6TexCQH9BS9X2enD0zbGUDxjoc8Hge6/YVJfZPZqxmlAq
         aAnnKvsDqk+T/vp/nRh84vXhKOEO+VaCFU8QvAq0TByxvFwrFRAqlGNMnC3qsxfTCpaI
         g5FVKa6GitmPfRCgQ4fKRe/Kk5GwmW1934yTNSaWsXBnjtPXw3ofJCHYzMAoxCU4tWmm
         VZUA==
X-Gm-Message-State: AOAM532CB9uVeFURmIlTJByGNjC9VcKEcqGeMcqebs+6MZZAx7f4stz8
        Wx/aXgRfvPfsvR78AQMT1gDgijKu9w==
X-Google-Smtp-Source: ABdhPJwNl3W4t1+G4/E8zq5p7WppEkdkmE1Mg2PYLPOVrxh0SEI5mSn44jdcuwixgBGUna0Jaf1F8Q==
X-Received: by 2002:a05:6830:1507:: with SMTP id k7mr5007310otp.71.1622838162479;
        Fri, 04 Jun 2021 13:22:42 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id b8sm726766ots.6.2021.06.04.13.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 13:22:41 -0700 (PDT)
Received: (nullmailer pid 3849703 invoked by uid 1000);
        Fri, 04 Jun 2021 20:22:40 -0000
Date:   Fri, 4 Jun 2021 15:22:40 -0500
From:   Rob Herring <robh@kernel.org>
To:     Martina Krasteva <martinax.krasteva@linux.intel.com>
Cc:     devicetree@vger.kernel.org, paul.j.murphy@linux.intel.com,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        gjorgjix.rosikopulos@linux.intel.com, robh+dt@kernel.org,
        daniele.alessandrelli@linux.intel.com, sakari.ailus@linux.intel.com
Subject: Re: [PATCH v2 1/6] dt-bindings: media: Add bindings for imx335
Message-ID: <20210604202240.GA3849647@robh.at.kernel.org>
References: <20210527142145.173-1-martinax.krasteva@linux.intel.com>
 <20210527142145.173-2-martinax.krasteva@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210527142145.173-2-martinax.krasteva@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 27 May 2021 15:21:40 +0100, Martina Krasteva wrote:
> From: Martina Krasteva <martinax.krasteva@intel.com>
> 
> - Add dt-bindings documentation for Sony imx335 sensor driver
> - Add MAINTAINERS entry for Sony imx335 binding documentation
> 
> Signed-off-by: Martina Krasteva <martinax.krasteva@intel.com>
> Acked-by: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
> Acked-by: Paul J. Murphy <paul.j.murphy@intel.com>
> ---
>  .../devicetree/bindings/media/i2c/sony,imx335.yaml | 91 ++++++++++++++++++++++
>  MAINTAINERS                                        |  8 ++
>  2 files changed, 99 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
