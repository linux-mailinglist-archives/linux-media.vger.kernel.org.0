Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B2201E8356
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2020 18:14:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726757AbgE2QOT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 May 2020 12:14:19 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:45405 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725795AbgE2QOS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 May 2020 12:14:18 -0400
Received: by mail-il1-f193.google.com with SMTP id 9so2971724ilg.12;
        Fri, 29 May 2020 09:14:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6nfDO8tXYNOep2brkAvXF5zbOelR4aGWgBOnUITKsRY=;
        b=a/dd5bVcUf0T1BGip0H1c0xH69gt4bWMgoLAIoxFxqM2cDs/p82VrhSJ7zNraLZmKC
         yTHElaRJozBLwe266IGT3xRwt38iHVZpK0LmwXERjGYofpXeh3jjX2BYGLBv+45KPZcC
         vSyWRfWksrn6kfEYhbvXUrO9OKrenetPoDpyfyqmGq9/+2JBvvguoQRN2iF2J7vLucAw
         iL6a2Um09416uNDjHGfMgt3qGNmktO23ERtOS1KHQshtUEgA+ze7VcVatd9wrkH9l33x
         nKRKpJNQY1KJ+lsSsdH9rJieoPrz+UzaB/tIcxc5+WLehfr7IoO+caEUsCPpZh6HAf0E
         KBFw==
X-Gm-Message-State: AOAM533mXO+S3j6nfGXBDUQvYpUl8+IFRE5KMcyUra5pS5NFgTQlTMqL
        Zdw3GFgCVoQmeveaPFaUXw==
X-Google-Smtp-Source: ABdhPJzuA2ktlJSd7UpbtEyBcgxYph+D4vfBmHw7TqTGpIjDXq5GoyDnI8okzTy3qfkjCk3IZhpDPA==
X-Received: by 2002:a92:c90a:: with SMTP id t10mr8539976ilp.39.1590768857895;
        Fri, 29 May 2020 09:14:17 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id 129sm3806916ioy.0.2020.05.29.09.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 09:14:16 -0700 (PDT)
Received: (nullmailer pid 2487571 invoked by uid 1000);
        Fri, 29 May 2020 16:14:15 -0000
Date:   Fri, 29 May 2020 10:14:15 -0600
From:   Rob Herring <robh@kernel.org>
To:     Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-rockchip@lists.infradead.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Mark Rutland <mark.rutland@arm.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] media: dt-bindings: media: Document Rockchip CIF
 bindings
Message-ID: <20200529161415.GA2486902@bogus>
References: <20200529130405.929429-1-maxime.chevallier@bootlin.com>
 <20200529130405.929429-2-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200529130405.929429-2-maxime.chevallier@bootlin.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 29 May 2020 15:04:03 +0200, Maxime Chevallier wrote:
> Add a documentation for the Rockchip Camera Interface controller
> binding.
> 
> This controller can be found on platforms such as the PX30 or the
> RK3288, the PX30 being the only platform supported so far.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
> 
> Changes since V1
> 
>  - Updated the clock and reset names
>  - Added missing includes in the example, so that the make dt_binding_check passes
> 
>  .../bindings/media/rockchip-cif.yaml          | 100 ++++++++++++++++++
>  1 file changed, 100 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/rockchip-cif.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/rockchip-cif.example.dt.yaml: cif@ff490000: clock-names: Additional items are not allowed ('cif_out' was unexpected)
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/rockchip-cif.example.dt.yaml: cif@ff490000: clock-names:0: 'aclk' was expected
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/rockchip-cif.example.dt.yaml: cif@ff490000: clock-names:1: 'hclkf' was expected
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/rockchip-cif.example.dt.yaml: cif@ff490000: clock-names:2: 'pclkin' was expected
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/rockchip-cif.example.dt.yaml: cif@ff490000: clock-names: ['aclk_cif', 'hclk_cif', 'pclk_cif', 'cif_out'] is too long
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/rockchip-cif.example.dt.yaml: cif@ff490000: clocks: Additional items are not allowed ([4294967295, 52] was unexpected)
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/rockchip-cif.example.dt.yaml: cif@ff490000: clocks: [[4294967295, 179], [4294967295, 249], [4294967295, 352], [4294967295, 52]] is too long
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/rockchip-cif.example.dt.yaml: cif@ff490000: reset-names:0: 'axi' was expected
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/rockchip-cif.example.dt.yaml: cif@ff490000: reset-names:1: 'ahb' was expected
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/rockchip-cif.example.dt.yaml: cif@ff490000: reset-names:2: 'pclkin' was expected

See https://patchwork.ozlabs.org/patch/1300680

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

