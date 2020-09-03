Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 624F425C6F3
	for <lists+linux-media@lfdr.de>; Thu,  3 Sep 2020 18:34:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728304AbgICQeS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Sep 2020 12:34:18 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:44597 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726327AbgICQeQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Sep 2020 12:34:16 -0400
Received: by mail-io1-f66.google.com with SMTP id g128so3530683iof.11;
        Thu, 03 Sep 2020 09:34:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6gSOm8OgxiG97XEUzZRkUwS5JBrdCqtaN4okFjD6uNs=;
        b=AeXxkflCHi6WcQ06hguC2s76W5HuIpNxebvzfNRX4/gcUmQZ0vO/xJq1b/NZHd4qfv
         zX6WwMYmqCgOVHqj7ewKuVUC9U3jUUyh15sC1CRaNqrPHDS5h2zrjmpJLinrH68OfsTV
         AQxARg0Vl09u4OD4goDi+UbAIRLgBUGmaSuH+Fow69m/0Ki5VvbZHr12IC85Sys13LVS
         ZfDZvfcUPuzzRejedd2IkYTzl2Pgsu6DggqgMIAzXaa1QVSNhqw70ZTvdnHHgIDKiLYZ
         aEMpx9mykrpdzNwOsQM389r4MjlPxz7Qx4C/Y0ElgwLq3WY7Fd1vVQVKtTF0NmTzhwg8
         xg6w==
X-Gm-Message-State: AOAM533II7vtZPvSLmGnbeUhWu8bp2S8R7A7eVdu0yCpc5CtBR9VY0Ws
        v5LLWKowG2KMPl5e8UKDZhUpTmgzFxPp
X-Google-Smtp-Source: ABdhPJwxRGPAz0UbJQIhgX/WsF8U50D3/9nCBzjWTC2j9ZsdYhNO0FtVXG94pcYyvliB2Qlj2/005A==
X-Received: by 2002:a02:1a83:: with SMTP id 125mr4190077jai.48.1599150855558;
        Thu, 03 Sep 2020 09:34:15 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id c85sm1722831ilg.10.2020.09.03.09.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 09:34:14 -0700 (PDT)
Received: (nullmailer pid 2908721 invoked by uid 1000);
        Thu, 03 Sep 2020 16:34:12 -0000
Date:   Thu, 3 Sep 2020 10:34:12 -0600
From:   Rob Herring <robh@kernel.org>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        hao.he7@gmail.com, Xingyu Wu <wuxy@bitland.com.cn>,
        linux-media@vger.kernel.org, drinkcat@chromium.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hao He <hao.he@bitland.com.cn>, sj.huang@mediatek.com,
        dongchun.zhu@mediatek.com, darfur_liu@gcoreinc.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] media: dt-bindings: media: i2c: Add bindings for
 GC5035
Message-ID: <20200903163412.GA2907310@bogus>
References: <20200902224813.14283-1-tfiga@chromium.org>
 <20200902224813.14283-3-tfiga@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200902224813.14283-3-tfiga@chromium.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 02 Sep 2020 22:48:11 +0000, Tomasz Figa wrote:
> Add YAML device tree bindings for Galaxycore Inc. GC5035 imaging sensor.
> 
> Signed-off-by: Tomasz Figa <tfiga@chromium.org>
> ---
>  .../devicetree/bindings/media/i2c/gc5035.yaml | 142 ++++++++++++++++++
>  1 file changed, 142 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/gc5035.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/i2c/gc5035.yaml: $id: 'http://devicetree.org/schemas/media/i2c/gc5035.yaml' does not match 'http://devicetree.org/schemas/.*\\.yaml#'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/i2c/gc5035.yaml: ignoring, error in schema: $id
warning: no schema found in file: ./Documentation/devicetree/bindings/media/i2c/gc5035.yaml


See https://patchwork.ozlabs.org/patch/1356170

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

