Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E21563992D7
	for <lists+linux-media@lfdr.de>; Wed,  2 Jun 2021 20:50:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbhFBSwO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Jun 2021 14:52:14 -0400
Received: from mail-ot1-f45.google.com ([209.85.210.45]:46629 "EHLO
        mail-ot1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229467AbhFBSwN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Jun 2021 14:52:13 -0400
Received: by mail-ot1-f45.google.com with SMTP id 66-20020a9d02c80000b02903615edf7c1aso3329976otl.13;
        Wed, 02 Jun 2021 11:50:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6JSBLV3AbgQUQqZ+//+KR0chbfSCGefVmTRUF4wGaZM=;
        b=es8I3h3Pq6So4Xs/Z73IPNdILD0MshV6K4gJfTxiYHRv/SwE2ltZxbEaFPUS/O/yhR
         MoIMqy+zFs7BCrWCBRXvg+Zx3LSffYIsDb4JhTLRrlayyoypNkOdJnRUPo60N2WNxoX9
         tekKa9UFw6H4rz2GplrPxW32VMDeWUDbPfyg0mrTMe90GhtZEgTMoJHGhhDp2fAmphfJ
         VdQRfsxFQZOrmnRTBZCt+0Oz1tgv4vRhaB04AKI0jc5O9wP1W+K3W4eT41lAoR4fI0DH
         51TyJOU8ZP+ZFK/0fyg0d4oABTc1DWCllz6RsOF3yB22aiWIh/DhLE8M8SsSVR39zwbo
         EKVg==
X-Gm-Message-State: AOAM531g6grBmPtllVE9tVRKduyyRi86CsGJ6M03OfxeDAb3OdjZht5P
        LwRDtZ5Io0tn+6skJjPzRw==
X-Google-Smtp-Source: ABdhPJz6z2k5H2t3bFOQMZBDPa55Sf1dUHpBxRc7unbKawa8fBP3+CT+MRJzYKeSxsOqNbDBtjkziA==
X-Received: by 2002:a05:6830:18ee:: with SMTP id d14mr2298198otf.347.1622659818966;
        Wed, 02 Jun 2021 11:50:18 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x9sm130135ooo.27.2021.06.02.11.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 11:50:18 -0700 (PDT)
Received: (nullmailer pid 3763838 invoked by uid 1000);
        Wed, 02 Jun 2021 18:50:17 -0000
Date:   Wed, 2 Jun 2021 13:50:17 -0500
From:   Rob Herring <robh@kernel.org>
To:     Irui Wang <irui.wang@mediatek.com>
Cc:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        linux-media@vger.kernel.org,
        Longfei Wang <longfei.wang@mediatek.com>,
        Yong Wu <yong.wu@mediatek.com>,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        Tomasz Figa <tfiga@google.com>,
        linux-mediatek@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        devicetree@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        srv_heupstream@mediatek.com, linux-arm-kernel@lists.infradead.org,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4,2/6] dt-bindings: media: mtk-vcodec: Add dma-ranges
 property
Message-ID: <20210602185017.GA3763804@robh.at.kernel.org>
References: <20210521070139.20644-1-irui.wang@mediatek.com>
 <20210521070139.20644-3-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210521070139.20644-3-irui.wang@mediatek.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 21 May 2021 15:01:35 +0800, Irui Wang wrote:
> The mt8192 iommu support 0~16GB iova. We separate it to four banks:
> 0~4G; 4G~8G; 8G~12G; 12G~16G.
> 
> The "dma-ranges" could be used to adjust the bank we locate.
> If we don't set this property. The default range always is 0~4G.
> 
> Here we don't have actual bus/parent concept here.  And the iova
> requirement is for our HW. Thus put the property in our node.
> 
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/media/mediatek-vcodec.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
