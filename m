Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9910B3B92DC
	for <lists+linux-media@lfdr.de>; Thu,  1 Jul 2021 16:06:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232076AbhGAOJF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Jul 2021 10:09:05 -0400
Received: from mail-il1-f171.google.com ([209.85.166.171]:42962 "EHLO
        mail-il1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232523AbhGAOJB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Jul 2021 10:09:01 -0400
Received: by mail-il1-f171.google.com with SMTP id h3so6455487ilc.9;
        Thu, 01 Jul 2021 07:06:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=yLHmmEj2mk4rdkuTrjRuXZd3VO0v+sUNL5ijm6xbTJE=;
        b=bgm6N8ydga2V1U4nyi3MnGzf0h/Ca72rRgtTSOFxhcb65ubGJDvL/V5pT3XR3pcbY8
         GzyAkEkK/u0YAVeeTL6LRAnxSEqkX+VT42YKt2zmpQM+EldE++mlbNfTWHZYTqXK/Wza
         1Lvr3ExkLNTEg78f8cEc5mfr8jc75//8J+tlVjVdpomsSh2MMezF2x+VvJrST9vNsznO
         Wl4wJ5GtUUb5u4ePNIO64/cSlYcI4hJlmNTEzBYkODsYHjJlEdJnc4mAXNyYXEr2M48p
         AagyDYz99BLg6UMpXPM0oeesjYz7QHcSQgzIUvT2gFfB/05v7qrwyOMig5XwTr9GeYDK
         inyA==
X-Gm-Message-State: AOAM5312F/ALMCarVjA+X3zHoMRa5tBTX0vPAX0ZNi8/rmvjy04KTG9c
        YIDIZL6t/PaWMLhWM+jQvw==
X-Google-Smtp-Source: ABdhPJzM92Q/jJWim96ayyFCopdaorRNbcbr+6aTWu/nFJcw1tUY8oAEYBHv/5i+4sfTgTRR1g4Ijw==
X-Received: by 2002:a05:6e02:1d16:: with SMTP id i22mr13367772ila.300.1625148390793;
        Thu, 01 Jul 2021 07:06:30 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id o10sm26672ilc.75.2021.07.01.07.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jul 2021 07:06:29 -0700 (PDT)
Received: (nullmailer pid 2285450 invoked by uid 1000);
        Thu, 01 Jul 2021 14:06:23 -0000
Date:   Thu, 1 Jul 2021 08:06:23 -0600
From:   Rob Herring <robh@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     "Paul J. Murphy" <paul.j.murphy@intel.com>,
        linux-renesas-soc@vger.kernel.org,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Fix 'unevaluatedProperties' errors in DT
 graph users
Message-ID: <20210701140623.GA2285366@robh.at.kernel.org>
References: <20210623164344.2571043-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210623164344.2571043-1-robh@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 23 Jun 2021 10:43:44 -0600, Rob Herring wrote:
> In testing out under development json-schema 2020-12 support, there's a
> few issues with 'unevaluatedProperties' and the graph schema. If
> 'graph.yaml#/properties/port' is used, then neither the port nor the
> endpoint(s) can have additional properties. 'graph.yaml#/$defs/port-base'
> needs to be used instead.
> 
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: "Paul J. Murphy" <paul.j.murphy@intel.com>
> Cc: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
> Cc: "Niklas Söderlund" <niklas.soderlund@ragnatech.se>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/display/bridge/lontium,lt8912b.yaml    | 3 ++-
>  Documentation/devicetree/bindings/media/i2c/imx258.yaml        | 2 +-
>  Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml   | 2 +-
>  Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml   | 2 +-
>  Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml   | 2 +-
>  Documentation/devicetree/bindings/media/renesas,vin.yaml       | 3 ++-
>  6 files changed, 8 insertions(+), 6 deletions(-)
> 

Applied, thanks!
