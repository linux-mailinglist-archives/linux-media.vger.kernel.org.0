Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76FE527594B
	for <lists+linux-media@lfdr.de>; Wed, 23 Sep 2020 16:01:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726600AbgIWOBH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Sep 2020 10:01:07 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:32916 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726156AbgIWOBH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Sep 2020 10:01:07 -0400
Received: by mail-io1-f68.google.com with SMTP id r25so23837998ioj.0;
        Wed, 23 Sep 2020 07:01:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=q/hlUq8eobAiNDFlqZ0J4DKuozfT+DsWKCaiVpcoTk4=;
        b=arnSDQ7qRvMmfTm688Hdbqo9jta44qxnNEmt04CLeXvsFDD6uxA6eFutITV/uMTBMm
         oruo+wEhHoSWtQjSDm6n79Z49QTBLvs1y8kx3/fCe6sDwoc5+rsBnjlYzP8X74Fs7qm2
         vqWo6YV0/X7UiHDyujfuqbOWAYgnSYLn2BD7d3itk5uutiA0/wMqAvZNCDIe38mNTHEq
         8nKHHhOB4nJjF+AjtirQknLZe+wsby+8z5zBnxcKdnia242Xx4izJpFs5+iZlZOMhqqU
         TBjh1c3k7IryFQtCGCvt1wjRwqd8wg726VvPc92pzE/xPh5Ggme7+qoJwZkj0a8arY8d
         /NUA==
X-Gm-Message-State: AOAM532A/p3ZWM9eYz4mnbP1g/ZyvCkWW8NJDliA5CNDOhhEL1o3u3qC
        8W5gQkn0FqIx0tfOGOR7Kw==
X-Google-Smtp-Source: ABdhPJznZjM8RaB9aIdih0M5tEoPWkoWPTVzxIxxSw1QLzjFSVZJpxrNBxqIO2viIsDgtS9I8UaItw==
X-Received: by 2002:a02:69d1:: with SMTP id e200mr8447649jac.96.1600869666402;
        Wed, 23 Sep 2020 07:01:06 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id b3sm8484259iow.28.2020.09.23.07.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 07:01:05 -0700 (PDT)
Received: (nullmailer pid 638883 invoked by uid 1000);
        Wed, 23 Sep 2020 14:01:04 -0000
Date:   Wed, 23 Sep 2020 08:01:04 -0600
From:   Rob Herring <robh@kernel.org>
To:     Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc:     linux-media@vger.kernel.org,
        Helen Koike <helen.koike@collabora.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mark Rutland <mark.rutland@arm.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-rockchip@lists.infradead.org,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 1/3] media: dt-bindings: media: Document Rockchip VIP
 bindings
Message-ID: <20200923140104.GA638635@bogus>
References: <20200922165535.1356622-1-maxime.chevallier@bootlin.com>
 <20200922165535.1356622-2-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200922165535.1356622-2-maxime.chevallier@bootlin.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 22 Sep 2020 18:55:33 +0200, Maxime Chevallier wrote:
> Add a documentation for the Rockchip Camera Interface controller
> binding.
> 
> This controller can be found on platforms such as the PX30 or the
> RK3288, the PX30 being the only platform supported so far.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
> V3 :
>  - renamed the controller
> 
>  .../bindings/media/rockchip-vip.yaml          | 100 ++++++++++++++++++
>  1 file changed, 100 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/rockchip-vip.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/rockchip-vip.example.dt.yaml: example-0: vip@ff490000:reg:0: [0, 4282974208, 0, 512] is too long
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/rockchip-vip.example.dt.yaml: vip@ff490000: clocks: [[4294967295, 179], [4294967295, 249], [4294967295, 352], [4294967295, 52]] is too long
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/rockchip-vip.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/rockchip-vip.example.dt.yaml: vip@ff490000: clocks: Additional items are not allowed ([4294967295, 52] was unexpected)
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/rockchip-vip.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/rockchip-vip.example.dt.yaml: vip@ff490000: clock-names:1: 'hclkf' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/rockchip-vip.yaml


See https://patchwork.ozlabs.org/patch/1369131

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

