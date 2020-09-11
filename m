Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8743267635
	for <lists+linux-media@lfdr.de>; Sat, 12 Sep 2020 00:54:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725897AbgIKWy1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Sep 2020 18:54:27 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:33842 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725849AbgIKWy0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Sep 2020 18:54:26 -0400
Received: by mail-io1-f66.google.com with SMTP id m17so12790403ioo.1;
        Fri, 11 Sep 2020 15:54:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KxnqkmKiYoSfOjAffZQgyIAy3RnUUApP9jkI4PU0/FM=;
        b=E3pK0hbU48bZs/Gct7Sx5GSFhYS9IHFd1SiqUkIVPZoVLTQgFUMXaVGJwGpy9095Tg
         Q6jbwojbwA3Jq5bU9zFaPP6me7qyiLH2JSHZEZ2vhM2S5M1JKI+U0qmaPAy2yCFbxGeS
         YVnkj29cpn7oc7tdmVsKcw3JAEJRdIncwstFyV/nhtjZ6OQS/VDSHD8OHmFqwZatM/B3
         KeBwrktY/RWAAoB81QHguykLoghVScGNA/JkFqmKpt6eLHaUUJLwEx8/PbzDMgpvEDCT
         87cMcbQISf+khgVelU9cBbxrOOXSWc4jAEuTm6JJlLbQ5wLLs4iPao5goYk+rHhxbVgl
         E4sA==
X-Gm-Message-State: AOAM530mjqa4EtzqU2kV/ohQiCaxS11EdjYfjsPIxHSwf3CjoSI+QtZP
        JAM83dC+/6ZuBwcQefGdVQ==
X-Google-Smtp-Source: ABdhPJwzPglWJP5g0p51fisEVnFMq+0CMFmjXiePE+XO6bR10rYBH6FPkjGVcjVJTNZpHuTolzcbCg==
X-Received: by 2002:a5e:9613:: with SMTP id a19mr3512976ioq.116.1599864865045;
        Fri, 11 Sep 2020 15:54:25 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id u17sm2048201ilb.44.2020.09.11.15.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2020 15:54:24 -0700 (PDT)
Received: (nullmailer pid 2971774 invoked by uid 1000);
        Fri, 11 Sep 2020 22:54:23 -0000
Date:   Fri, 11 Sep 2020 16:54:23 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bogdan Togorean <bogdan.togorean@analog.com>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bingbu Cao <bingbu.cao@intel.com>,
        linux-kernel@vger.kernel.org, Shawn Tu <shawnx.tu@intel.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        YueHaibing <yuehaibing@huawei.com>, linux-media@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH 2/2] media: dt-bindings: media: i2c: Add bindings for
 ADDI9036
Message-ID: <20200911225423.GA2970927@bogus>
References: <20200910162426.55306-1-bogdan.togorean@analog.com>
 <20200910162426.55306-2-bogdan.togorean@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200910162426.55306-2-bogdan.togorean@analog.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 10 Sep 2020 19:24:07 +0300, Bogdan Togorean wrote:
> Add YAML device tree bindings for Analog Devices Inc. ADDI9036 CCD TOF
> front-end.
> 
> Signed-off-by: Bogdan Togorean <bogdan.togorean@analog.com>
> ---
>  .../bindings/media/i2c/adi,addi9036.yaml      | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/adi,addi9036.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/i2c/adi,addi9036.example.dt.yaml: addi9036_tof@64: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/i2c/adi,addi9036.yaml


See https://patchwork.ozlabs.org/patch/1361583

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

