Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9493134B7D9
	for <lists+linux-media@lfdr.de>; Sat, 27 Mar 2021 16:09:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230176AbhC0PI1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 Mar 2021 11:08:27 -0400
Received: from mail-ot1-f46.google.com ([209.85.210.46]:34652 "EHLO
        mail-ot1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230043AbhC0PH4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 Mar 2021 11:07:56 -0400
Received: by mail-ot1-f46.google.com with SMTP id k14-20020a9d7dce0000b02901b866632f29so8087408otn.1;
        Sat, 27 Mar 2021 08:07:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Cp8tBSKG37JlbRUd0S+dl47e82ISyzxt5fUuG3wWWmo=;
        b=c9jfvRV327scOTXOLWbU0/KKi58aoimmjJ6pj2Ab8iBERJixswZH16WSsUUkTcTQWc
         JrM8mC+MJI2Mp3zAbNhrtmNCKLv5KjiQBC0w6dG3uXgY8oZ2nvDj8Toel/TZyvQQsLRt
         /MJzEsKZdkizWNjHi2mb2TUevpSx4K/n58QCmt4oaWmuh0N+wPgIBqsEUnWmMxZuO678
         JPg/AssaW2AnD8XvJZqq5EI/jPhdX+LKqM7npOZrjYNz5UGTC7Em6l45KsLLUQa84IAc
         R/AOyVqcSx1SceC+qKla7QRBfH/CB0gp2WbZkvMBdxxJC5BY8CPssH7ucAsEEfHD+MTc
         U8vQ==
X-Gm-Message-State: AOAM531xkKrocUm7Be2gmlgHagi7XQAWwneK4d39PRSU+l5n3dfg/hzW
        pBwqy2SCT6WyxvY2a/Hhcg==
X-Google-Smtp-Source: ABdhPJz07TTqTTNWOb3R6lCjghgigOMcf9QXbp9+pHnVlNG73xMxqKiYNmPDO7OowO4jO4ZUAzlghA==
X-Received: by 2002:a9d:4c0a:: with SMTP id l10mr16126579otf.136.1616857676218;
        Sat, 27 Mar 2021 08:07:56 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.102.185])
        by smtp.gmail.com with ESMTPSA id f29sm2958729ots.22.2021.03.27.08.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 08:07:55 -0700 (PDT)
Received: (nullmailer pid 121627 invoked by uid 1000);
        Sat, 27 Mar 2021 15:07:50 -0000
Date:   Sat, 27 Mar 2021 09:07:50 -0600
From:   Rob Herring <robh@kernel.org>
To:     Irui Wang <irui.wang@mediatek.com>
Cc:     devicetree@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Longfei Wang <longfei.wang@mediatek.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomasz Figa <tfiga@google.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        yong.wu@mediatek.com, srv_heupstream@mediatek.com,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4, 1/3] dt-bindings: media: mtk-vcodec: Separating mtk
 vcodec encoder node
Message-ID: <20210327150750.GA121510@robh.at.kernel.org>
References: <20210325122625.15100-1-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210325122625.15100-1-irui.wang@mediatek.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 25 Mar 2021 20:26:23 +0800, Irui Wang wrote:
> Updates binding document since the avc and vp8 hardware encoder in
> MT8173 are now separated. Separate "mediatek,mt8173-vcodec-enc" to
> "mediatek,mt8173-vcodec-enc-vp8" and "mediatek,mt8173-vcodec-enc".
> 
> This patch is not a compatible change, but we must do this modifaction
> because MediaTek IOMMU add the device_link between the smi-larb
> device and venc_device, if the venc device call the pm_runtime_get_sync,
> the smi-larb's pm_runtime_get_sync also be called automatically.
> 
> There is a bit of backward compatibility for avc encoder, the avc
> encoder device node still has compatible "mediatek,mt8173-vcodec-enc".
> 
> Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Signed-off-by: Maoguang Meng <maoguang.meng@mediatek.com>
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> ---
>  .../bindings/media/mediatek-vcodec.txt        | 55 ++++++++++---------
>  1 file changed, 29 insertions(+), 26 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
