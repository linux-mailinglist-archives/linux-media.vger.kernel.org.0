Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 922C1EE33
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2019 03:15:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729746AbfD3BPJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Apr 2019 21:15:09 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:44013 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729626AbfD3BPI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Apr 2019 21:15:08 -0400
Received: by mail-ot1-f67.google.com with SMTP id u15so10423214otq.10;
        Mon, 29 Apr 2019 18:15:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NeVwMYlomqJ0FeYvQcVMOgeUQOrj8gToq74sIwHDDfs=;
        b=WsE/LpvykVUFXrXmXxpAJilJqADtnP9MVunwzlnVRDx2oYAMiDWV7rGzl37Fho9/DC
         s2xyjoFy4av9XwR149xwt4MAa+3AwCqUi4e0Chto7ihZ2wnJO1PhY6Combr3VJQS/gjn
         IEFwHu8tsaeKoxfHGpJJyeMG60ahQNLPRhPWbWF2z8vlIpS5ciS2PmcSn0Ra8Sq1JG1X
         1LUYznMXC8JUSgnHo2yb4tVlDw9sgcYZq6rZud89Q38xPRx+9L8fdvbTH8m2XCaOt56X
         OnzPtBeMvgxq3buSgceiFWhdQxQeQwS3aVjEqxiKY4DdvxhGZGAlry68FZSgIg01erPJ
         j+uQ==
X-Gm-Message-State: APjAAAW/PrHwgr7xIQzTvyJ1J6bBUIa+ge62YIUe0vp6bBFnLtHZR5b/
        Z9ikrO+j6dtbsgfHN+TMBQ==
X-Google-Smtp-Source: APXvYqze9aYwnpsa/3SpoyY5RkNLINJC4nPMtI/5aHOuoiOQeBQWrG1+vcVxyqtcshxblezJVf+InA==
X-Received: by 2002:a9d:2237:: with SMTP id o52mr1406933ota.272.1556586908019;
        Mon, 29 Apr 2019 18:15:08 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id z2sm17168652ota.56.2019.04.29.18.15.06
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Apr 2019 18:15:06 -0700 (PDT)
Date:   Mon, 29 Apr 2019 20:15:06 -0500
From:   Rob Herring <robh@kernel.org>
To:     Frederic Chen <frederic.chen@mediatek.com>
Cc:     hans.verkuil@cisco.com, laurent.pinchart+renesas@ideasonboard.com,
        tfiga@chromium.org, matthias.bgg@gmail.com, mchehab@kernel.org,
        yuzhao@chromium.org, zwisler@chromium.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, Sean.Cheng@mediatek.com,
        sj.huang@mediatek.com, christie.yu@mediatek.com,
        holmes.chiou@mediatek.com, Jerry-ch.Chen@mediatek.com,
        jungo.lin@mediatek.com, Rynn.Wu@mediatek.com,
        linux-media@vger.kernel.org, srv_heupstream@mediatek.com,
        devicetree@vger.kernel.org, shik@chromium.org,
        suleiman@chromium.org
Subject: Re: [RFC PATCH V1 1/6] dt-bindings: mt8183: Add binding for DIP
 shared memory
Message-ID: <20190430011506.GA8514@bogus>
References: <20190417104511.21514-1-frederic.chen@mediatek.com>
 <20190417104511.21514-2-frederic.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190417104511.21514-2-frederic.chen@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Apr 17, 2019 at 06:45:06PM +0800, Frederic Chen wrote:
> This patch adds the binding for describing the shared memory
> used to exchange configuration and tuning data between the
> co-processor and Digital Image Processing (DIP) unit of the
> camera ISP system on Mediatek SoCs.
> 
> Signed-off-by: Frederic Chen <frederic.chen@mediatek.com>
> ---
>  .../mediatek,reserve-memory-dip_smem.txt      | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reserved-memory/mediatek,reserve-memory-dip_smem.txt
> 
> diff --git a/Documentation/devicetree/bindings/reserved-memory/mediatek,reserve-memory-dip_smem.txt b/Documentation/devicetree/bindings/reserved-memory/mediatek,reserve-memory-dip_smem.txt
> new file mode 100644
> index 000000000000..64c001b476b9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reserved-memory/mediatek,reserve-memory-dip_smem.txt
> @@ -0,0 +1,45 @@
> +Mediatek DIP Shared Memory binding
> +
> +This binding describes the shared memory, which serves the purpose of
> +describing the shared memory region used to exchange data between Digital
> +Image Processing (DIP) and co-processor in Mediatek SoCs.
> +
> +The co-processor doesn't have the iommu so we need to use the physical
> +address to access the shared buffer in the firmware.
> +
> +The Digital Image Processing (DIP) can access memory through mt8183 IOMMU so
> +it can use dma address to access the memory region.
> +(See iommu/mediatek,iommu.txt for the detailed description of Mediatek IOMMU)
> +
> +
> +Required properties:
> +
> +- compatible: must be "mediatek,reserve-memory-dip_smem"

Don't use '_'.

> +
> +- reg: required for static allocation (see reserved-memory.txt for
> +  the detailed usage)
> +
> +- alloc-range: required for dynamic allocation. The range must
> +  between 0x00000400 and 0x100000000 due to the co-processer's
> +  addressing limitation

Generally, you should pick either static or dynamic allocation for a 
given binding. Static if there's some address restriction or sharing, 
dynamic if not.

Sounds like static in this case.

> +
> +- size: required for dynamic allocation. The unit is bytes.
> +  If you want to enable the full feature of Digital Processing Unit,
> +  you need 20 MB at least.
> +
> +
> +Example:
> +
> +The following example shows the DIP shared memory setup for MT8183.
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +		reserve-memory-dip_smem {
> +			compatible = "mediatek,reserve-memory-dip_smem";
> +			size = <0 0x1400000>;
> +			alignment = <0 0x1000>;
> +			alloc-ranges = <0 0x40000000 0 0x50000000>;
> +		};
> +	};
> -- 
> 2.18.0
> 
