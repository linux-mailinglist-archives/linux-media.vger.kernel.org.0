Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2A643173BE
	for <lists+linux-media@lfdr.de>; Wed, 10 Feb 2021 23:56:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233358AbhBJWzz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Feb 2021 17:55:55 -0500
Received: from mail-oi1-f172.google.com ([209.85.167.172]:44225 "EHLO
        mail-oi1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232428AbhBJWzs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Feb 2021 17:55:48 -0500
Received: by mail-oi1-f172.google.com with SMTP id r75so3975322oie.11;
        Wed, 10 Feb 2021 14:55:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RP/1fWgQSpnhyqyUYQC54WPzfZsZ61OQZSW7jfdfAz4=;
        b=Ju6RTOTLROxombkS5TcBXA4s4RibtmG+t8CAbwrKTKj0oxu0uPlBg/GZwcJMmXyiJS
         9lPjJU/D4H64lkhoSMg8qTZ8/0jRJNxIfRtM8E062dv0NqZje0JznJZ2vWT2/zWIVlEc
         5BQxYkRHQtRmgZMaJVnYZtu+NfwP8RLyxPgXl/bcTd2dniCObncnmKlSTSY98/QKCno1
         ClT0D7nVFZa6t3ZBTPrZBDdfnMvKT17ok5+EICEcb1WGHK9wyLw9sVzzhjQV+nPO3oCI
         s8Vj0ZkRHAR7ddFKGkotMAI40i35tqJ570uRTla9o2gpur5HTBKHhkI3hl5g7+3iN1xT
         cVpg==
X-Gm-Message-State: AOAM531LWmPbXpqDIBGOQybYdj7g2wZ+dNQnj/6VtVPvcxFfNMYoSY2i
        cfMFjunt92AeXDm25JkAnQ==
X-Google-Smtp-Source: ABdhPJw/ziPtOmnTH37OtDhwg5KsWreepQYebmeB6EPWMZJ3RNDdWVHQ1zbiL7IyFGFQo3ItwY1yYA==
X-Received: by 2002:aca:1903:: with SMTP id l3mr897629oii.133.1612997706959;
        Wed, 10 Feb 2021 14:55:06 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r4sm772458oig.52.2021.02.10.14.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 14:55:05 -0800 (PST)
Received: (nullmailer pid 2966346 invoked by uid 1000);
        Wed, 10 Feb 2021 22:53:23 -0000
Date:   Wed, 10 Feb 2021 16:53:23 -0600
From:   Rob Herring <robh@kernel.org>
To:     Irui Wang <irui.wang@mediatek.com>
Cc:     Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Fritz Koenig <frkoenig@chromium.org>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        Longfei Wang <longfei.wang@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/5] dt-bindings: media: mtk-vcodec: Add dma-ranges
 property
Message-ID: <20210210225323.GA2961490@robh.at.kernel.org>
References: <20210203083752.12586-1-irui.wang@mediatek.com>
 <20210203083752.12586-2-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210203083752.12586-2-irui.wang@mediatek.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Feb 03, 2021 at 04:37:48PM +0800, Irui Wang wrote:
> Adds dma-ranges property for DMA addresses translation.
> 
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/media/mediatek-vcodec.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> index f85276e629bf..e4644f8caee9 100644
> --- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> +++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> @@ -23,6 +23,8 @@ Required properties:
>  - iommus : should point to the respective IOMMU block with master port as
>    argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
>    for details.
> +- dma-ranges : describes how the physical address space of the IOMMU maps
> +  to memory.

dma-ranges is supposed to be in a bus/parent node.

>  One of the two following nodes:
>  - mediatek,vpu : the node of the video processor unit, if using VPU.
>  - mediatek,scp : the node of the SCP unit, if using SCP.
> -- 
> 2.25.1
> 
