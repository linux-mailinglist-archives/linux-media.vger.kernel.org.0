Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 185E129908E
	for <lists+linux-media@lfdr.de>; Mon, 26 Oct 2020 16:08:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1783197AbgJZPIZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Oct 2020 11:08:25 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:43661 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729820AbgJZPIZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Oct 2020 11:08:25 -0400
Received: by mail-oi1-f193.google.com with SMTP id x203so5417538oia.10;
        Mon, 26 Oct 2020 08:08:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yOcuixarIvShrKNoofuyYuJVegWbN8b2yE0PdVOlHiU=;
        b=RCVO0nE/mjHsuvZWGEOdOTFDnAyFcXGLaHJmPeBjJ3riCEm6wLsj5BgaD9WUSbrkaJ
         g1IJade/1zu465n2yfLMEbdvfYtOhrl/h5IQ0GPrXx23wnmcyUIfut+Rc5BvRUk3v8qL
         eyeQyUG/BQdpXQ/nEL3SEGrgykotVz+AU9LRsr2TUxORUw8yRLuSvASfqNrfQqc52Lv2
         a+fqafv06eMU/1kJ2NycQ8GnArHGEjQtXvUTVi0qVKG2DS+AXO6RTJ+9ilVVy+1Gf4BW
         S+fRphpkPm879D/kK6jktOo3IPym0wDdgE54AszgKS3GB1UgWxVDrMcSl13PFc3NcIvC
         wYng==
X-Gm-Message-State: AOAM533v2W5jOWTal7nUBl8io/82GymFWGYck9ADY5VLZfT8Ft02r5Pl
        Mk12awFo2O/oKXkmBx+4QQ==
X-Google-Smtp-Source: ABdhPJwHIUXyPr8Om4GSX7384AJPy2VBink+4fO5dNnBiXKmVeOOv36AJ7cX31voy/K4Atprvxx5cA==
X-Received: by 2002:a05:6808:8ea:: with SMTP id d10mr5692283oic.62.1603724903919;
        Mon, 26 Oct 2020 08:08:23 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i190sm4072274oib.28.2020.10.26.08.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 08:08:23 -0700 (PDT)
Received: (nullmailer pid 163840 invoked by uid 1000);
        Mon, 26 Oct 2020 15:08:22 -0000
Date:   Mon, 26 Oct 2020 10:08:22 -0500
From:   Rob Herring <robh@kernel.org>
To:     Rui Miguel Silva <rmfrfs@gmail.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        sakari.ailus@linux.intel.com, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v6 1/3] dt-bindings: ov2680: convert bindings to yaml
Message-ID: <20201026150822.GA163784@bogus>
References: <20201021212543.1920793-1-rmfrfs@gmail.com>
 <20201021212543.1920793-2-rmfrfs@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201021212543.1920793-2-rmfrfs@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 21 Oct 2020 22:25:41 +0100, Rui Miguel Silva wrote:
> Convert ov2680 sensor bindings documentation to yaml schema, remove
> the textual bindings document and update MAINTAINERS entry.
> 
> Signed-off-by: Rui Miguel Silva <rmfrfs@gmail.com>
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  .../devicetree/bindings/media/i2c/ov2680.txt  | 46 ---------
>  .../bindings/media/i2c/ovti,ov2680.yaml       | 99 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 100 insertions(+), 47 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov2680.txt
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
