Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AC3B30F71D
	for <lists+linux-media@lfdr.de>; Thu,  4 Feb 2021 17:04:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237731AbhBDQCP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Feb 2021 11:02:15 -0500
Received: from mail-oi1-f173.google.com ([209.85.167.173]:40642 "EHLO
        mail-oi1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237251AbhBDPVr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Feb 2021 10:21:47 -0500
Received: by mail-oi1-f173.google.com with SMTP id k142so4048663oib.7;
        Thu, 04 Feb 2021 07:21:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=0Xz1ybUurg+f25NNPsQWdKN8LBDg+PlVPnnnyR6Rc1U=;
        b=koqPMIe2ECoHBDHI6zKQCunbreQRkM0XINGtJOLXtI5EB9ePj8a+FdIEI40HpC+SOe
         XXXeU5V1PkP1fHyUnQuDRdkILIqx/mQwqV+/+Ew0YBlX9bQQC8zdhLqr9zmvg/eJrKDM
         DCNCODvE0YcaXziYdMw6z7iW6mFOEnioLUw5A/w5Yd8xBM9Wtr2224SeRSG6jAyrK/+e
         Fh23rYHSS1GJohvmLg2usiNZxB9dgohk0XS08p/5YTLFONSkFbXmF48mMBJJygzOPg9F
         DrNy4Nz2JWdCkGBG2P0dluefXHVpqlqwWLYLd59j5RmBxX4O8RDypYvaEP9Urv5A+q3I
         rV4g==
X-Gm-Message-State: AOAM533MVttGQKKIKrGiyPEj9p5HsRxcLwFIiRDE1XH+J3vkv9rsU3gp
        EJCpLk2M6N3oNt5KXC6fDd5G20PmAQ==
X-Google-Smtp-Source: ABdhPJzC7FiNBWX3zaBTJ9JJlU/bqOBsrbewNufb2sOsil4SMXvP/WRhJk9mzBX1NxSMUn0HFYhvcg==
X-Received: by 2002:a54:4e87:: with SMTP id c7mr30959oiy.94.1612452062575;
        Thu, 04 Feb 2021 07:21:02 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q195sm1163904oic.15.2021.02.04.07.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 07:21:01 -0800 (PST)
Received: (nullmailer pid 452038 invoked by uid 1000);
        Thu, 04 Feb 2021 15:20:57 -0000
From:   Rob Herring <robh@kernel.org>
To:     Martina Krasteva <martinax.krasteva@linux.intel.com>
Cc:     robh+dt@kernel.org, gjorgjix.rosikopulos@linux.intel.com,
        devicetree@vger.kernel.org, daniele.alessandrelli@linux.intel.com,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        sakari.ailus@linux.intel.com, paul.j.murphy@linux.intel.com
In-Reply-To: <20210203135441.136-2-martinax.krasteva@linux.intel.com>
References: <20210203135441.136-1-martinax.krasteva@linux.intel.com> <20210203135441.136-2-martinax.krasteva@linux.intel.com>
Subject: Re: [PATCH v7 1/2] dt-bindings: media: Add bindings for imx334
Date:   Thu, 04 Feb 2021 09:20:57 -0600
Message-Id: <1612452057.710530.452037.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 03 Feb 2021 13:54:40 +0000, Martina Krasteva wrote:
> From: Martina Krasteva <martinax.krasteva@intel.com>
> 
> - Add dt-bindings documentation for Sony imx334 sensor driver.
> - Add MAINTAINERS entry for Sony imx334 binding documentation.
> 
> Signed-off-by: Martina Krasteva <martinax.krasteva@intel.com>
> Reviewed-by: Gjorgji Rosikopulos <gjorgjix.rosikopulos@intel.com>
> Acked-by: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
> Acked-by: Paul J. Murphy <paul.j.murphy@intel.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/media/i2c/sony,imx334.yaml | 90 ++++++++++++++++++++++
>  MAINTAINERS                                        |  8 ++
>  2 files changed, 98 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/media/i2c/sony,imx334.example.dts:28.17-18 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:344: Documentation/devicetree/bindings/media/i2c/sony,imx334.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1370: dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1435383

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

