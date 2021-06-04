Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2981F39C13F
	for <lists+linux-media@lfdr.de>; Fri,  4 Jun 2021 22:23:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231189AbhFDUZe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Jun 2021 16:25:34 -0400
Received: from mail-ot1-f54.google.com ([209.85.210.54]:35495 "EHLO
        mail-ot1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230022AbhFDUZe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Jun 2021 16:25:34 -0400
Received: by mail-ot1-f54.google.com with SMTP id 69-20020a9d0a4b0000b02902ed42f141e1so10307680otg.2;
        Fri, 04 Jun 2021 13:23:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SMv44xDMnkH709rKIhr5/xmThhiphV1eApyGd+TmDag=;
        b=VKUbZ1UnLW/v7VirRacETQ8f078hte+A7u9OSKLG34RinPvjLirEcRBQq/JKfCH3KX
         8PLSBNZtjN28hcIl7Ta25/WEQeEa8PascHO3qmPW+tszfKThITEd7uZEwr93ritTIk1l
         02+4SGaCkQ9ki9hrDZ15D/tZ0a4edBwa5u1DgeMDRpMcjKLkKAq47gdbEj+W/9Wn/T2B
         UFL9pDUM7kN/1PSur+kXGYmVtOfv+NLwwg6CUtqwWy2WZRptPJE187bPOga7ToRFXb22
         90/Zj7ejFn0QeMWuy4w9dcpv4Y5R4Zgo61Tnr3vc2vYzbSaIgyHX4bsDLUHc6Sgq9+75
         w3eQ==
X-Gm-Message-State: AOAM532bFlz/TinwNyqF6yMW1f/fDh0rWHbytJeYIGkI4aT6ylaMnt07
        VtH2L/TMu5zAjgCXQfusmE3rOYsn9g==
X-Google-Smtp-Source: ABdhPJwOy9bCEC+n884zkQlbQ+JyAuqZtOf4p0NosG0ZuQpHReuufTVEjW1gRidY/BL5Z4JU9Q2rNw==
X-Received: by 2002:a9d:20a2:: with SMTP id x31mr4710179ota.263.1622838211909;
        Fri, 04 Jun 2021 13:23:31 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w10sm670497ott.75.2021.06.04.13.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 13:23:31 -0700 (PDT)
Received: (nullmailer pid 3851176 invoked by uid 1000);
        Fri, 04 Jun 2021 20:23:30 -0000
Date:   Fri, 4 Jun 2021 15:23:30 -0500
From:   Rob Herring <robh@kernel.org>
To:     Martina Krasteva <martinax.krasteva@linux.intel.com>
Cc:     gjorgjix.rosikopulos@linux.intel.com, mchehab@kernel.org,
        daniele.alessandrelli@linux.intel.com, devicetree@vger.kernel.org,
        paul.j.murphy@linux.intel.com, robh+dt@kernel.org,
        sakari.ailus@linux.intel.com, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 5/6] dt-bindings: media: Add bindings for ov9282
Message-ID: <20210604202330.GA3851146@robh.at.kernel.org>
References: <20210527142145.173-1-martinax.krasteva@linux.intel.com>
 <20210527142145.173-6-martinax.krasteva@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210527142145.173-6-martinax.krasteva@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 27 May 2021 15:21:44 +0100, Martina Krasteva wrote:
> From: Martina Krasteva <martinax.krasteva@intel.com>
> 
> - Add dt-bindings documentation for OmniVision ov9282 sensor driver
> - Add MAINTAINERS entry for OmniVision ov9282 binding documentation
> 
> Signed-off-by: Martina Krasteva <martinax.krasteva@intel.com>
> Acked-by: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
> Acked-by: Paul J. Murphy <paul.j.murphy@intel.com>
> ---
>  .../devicetree/bindings/media/i2c/ovti,ov9282.yaml | 91 ++++++++++++++++++++++
>  MAINTAINERS                                        |  8 ++
>  2 files changed, 99 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
