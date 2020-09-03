Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E36925C665
	for <lists+linux-media@lfdr.de>; Thu,  3 Sep 2020 18:13:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728304AbgICQNu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Sep 2020 12:13:50 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:35600 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726025AbgICQNt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Sep 2020 12:13:49 -0400
Received: by mail-il1-f193.google.com with SMTP id l4so3176113ilq.2;
        Thu, 03 Sep 2020 09:13:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KSaYDFKB9d3Xzaft2AwH2tdylPesgPoWd1Kd8HYa4NA=;
        b=novnawPU7NKrCTsJVDqfUwWMQdRd4NMSdsvXQQxVCGCKFYKfmxBDj6EJzdlfyIdR3c
         FT2LvaApHiazME0mJMWNzjRh9oH6ilPWbLMVxwAhHyIG+KAITD6NVeZweogQKL3C2fKn
         1K7kxDxQ45C131PzTCw4mZR7vY7W7RE5qBIShOkN9C3DiO0WK//e8WaTwGYDJfj1N0+J
         yQA7gvAebWx19qqvcxtD57dBqV7Vyhsyna1+jLX6NI4fkgNzzYYrcdWDR8m6YirWF0ll
         jfMaln5ZB8Z+Z9plQF9SWtkB6InJ3yZwr8P8heoUPJVL8gt0xtx4VEMraaHZ8P155KuW
         BMJg==
X-Gm-Message-State: AOAM532CwBmwU7e0gxLKLAkbypkCNzSJe/uxX2Olk6fnEaTxJDpLrnxb
        MjTCqoNQLiQDdVwdI97aDg==
X-Google-Smtp-Source: ABdhPJxQkdynaDRsdchZHJFTnnExJD9kk3HJ8bWg1hLyJkv+YGejuGak1vz9fxVYkxnuwvJJECe9SA==
X-Received: by 2002:a05:6e02:e07:: with SMTP id a7mr3556940ilk.277.1599149628555;
        Thu, 03 Sep 2020 09:13:48 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id 137sm1554980ioc.20.2020.09.03.09.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 09:13:48 -0700 (PDT)
Received: (nullmailer pid 2875634 invoked by uid 1000);
        Thu, 03 Sep 2020 16:13:46 -0000
Date:   Thu, 3 Sep 2020 10:13:46 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     robh+dt@kernel.org, linux-media@vger.kernel.org,
        mark.rutland@arm.com, shengnan.wang@mediatek.com,
        linux-mediatek@lists.infradead.org,
        andriy.shevchenko@linux.intel.com, matthias.bgg@gmail.com,
        devicetree@vger.kernel.org, sj.huang@mediatek.com,
        sakari.ailus@linux.intel.com, louis.kuo@mediatek.com,
        drinkcat@chromium.org, tfiga@chromium.org,
        srv_heupstream@mediatek.com, mchehab@kernel.org,
        linux-arm-kernel@lists.infradead.org, bingbu.cao@intel.com
Subject: Re: [PATCH v14 1/2] media: dt-bindings: media: i2c: Document OV02A10
 bindings
Message-ID: <20200903161346.GA2875415@bogus>
References: <20200902120122.24456-1-dongchun.zhu@mediatek.com>
 <20200902120122.24456-2-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200902120122.24456-2-dongchun.zhu@mediatek.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 02 Sep 2020 20:01:21 +0800, Dongchun Zhu wrote:
> Add YAML device tree binding for OV02A10 CMOS image sensor,
> and the relevant MAINTAINERS entries.
> 
> Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> ---
>  .../bindings/media/i2c/ovti,ov02a10.yaml           | 161 +++++++++++++++++++++
>  MAINTAINERS                                        |   7 +
>  2 files changed, 168 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

Error: Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.example.dts:28.45-46 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:342: Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1366: dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1355723

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

