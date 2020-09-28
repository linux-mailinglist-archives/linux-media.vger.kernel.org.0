Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5484627B4BB
	for <lists+linux-media@lfdr.de>; Mon, 28 Sep 2020 20:46:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726600AbgI1Sqq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Sep 2020 14:46:46 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:42485 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726424AbgI1Sqq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Sep 2020 14:46:46 -0400
Received: by mail-oi1-f193.google.com with SMTP id x14so2457170oic.9;
        Mon, 28 Sep 2020 11:46:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZsO+0dOkTfFrneLA3Q6gehi2a2DpYqaQu7pYQU0AcFI=;
        b=Fzjrzdd3pk58sYHxcjd2j7Em5rj5JyoiJBSfZb0BSQeTz4H20INpMzDr/9Vef9wK18
         A3CwEvSKlHtJ6cxrmNntszx/jxXnxPKHwIhGouNfboAWmGr3tQQlmrQxqsTJ3c66rc2k
         ZZJwUrcBilI1bWfwrEOuUHVYNVJOnXbH3pkW7kd7H8qSmBlAFomlbNS3YcCLFYWE18Mu
         VscRRhAJDjyqxgvjUUZvx50H03AwxB3THDhGT0IJDlQet07e13n/1Vu0mWROhPsHi0st
         8ATmz4V/yFQGgdM9auWuD/zxg9MQ0LxdodDj7fSLxBRVdH/Ci7XPAvsRMjP9JBkhLJhI
         u6+Q==
X-Gm-Message-State: AOAM5312noutihSYIWW0pVMES8MyWA2XVWcZzl+9tPxBAoAUQP79svUq
        M3QmDAUeBB9UH0tOXl712w==
X-Google-Smtp-Source: ABdhPJxms9mwVHOyV/K+oBb0XHUlHB6dtItUlVB+q03PHYloIwRU7Lv2a6PPG9A8ahLFN11ImDuvKQ==
X-Received: by 2002:aca:5650:: with SMTP id k77mr145267oib.105.1601318805340;
        Mon, 28 Sep 2020 11:46:45 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w4sm418896otm.57.2020.09.28.11.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 11:46:44 -0700 (PDT)
Received: (nullmailer pid 3062883 invoked by uid 1000);
        Mon, 28 Sep 2020 18:46:43 -0000
Date:   Mon, 28 Sep 2020 13:46:43 -0500
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v4 1/4] dt-bindings: media: imx258: add bindings for
 IMX258 sensor
Message-ID: <20200928184643.GA3062828@bogus>
References: <20200923152129.21736-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200923152129.21736-1-krzk@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 23 Sep 2020 17:21:26 +0200, Krzysztof Kozlowski wrote:
> Add bindings for the IMX258 camera sensor.  The bindings, just like the
> driver, are quite limited, e.g. do not support regulator supplies.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v3:
> 1. Document also two lane setup.
> 
> Changes since v2:
> 1. Remove clock-frequency, add reset GPIOs, add supplies.
> 2. Use additionalProperties.
> 
> Changes since v1:
> 1. None
> ---
>  .../devicetree/bindings/media/i2c/imx258.yaml | 100 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 101 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/imx258.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
