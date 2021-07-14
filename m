Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3C963C930D
	for <lists+linux-media@lfdr.de>; Wed, 14 Jul 2021 23:26:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235650AbhGNV2v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jul 2021 17:28:51 -0400
Received: from mail-io1-f43.google.com ([209.85.166.43]:40651 "EHLO
        mail-io1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230196AbhGNV2v (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jul 2021 17:28:51 -0400
Received: by mail-io1-f43.google.com with SMTP id l5so3915824iok.7;
        Wed, 14 Jul 2021 14:25:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eB0JXlfGUoRcY25ZNZz1IiOfAvUxPS0GkG64oSP4tsY=;
        b=E9dCy+mHCOUlnPY/9RjfEe7WGPZqRe7TIofRu6ayof4PY2Sn6C1uPDRE7EQw+y5OFV
         iEfpjljPajhN3QGqV6REJtAz7iBI75Ov9NljNiPeOsUwGX8R9JZG7MRcLI4rrzA0J5bX
         PuVOVeLfSO3EPE99fudME6tFpn/L7qKh7+8g9yyMY6kgiOX3tKemPpy7/C9UT0dHa9/v
         5WuNRnMiZyeAGoSDjCrI/jCTvEd23RCM8bBgnSL6EcV3+iAAObTLYrKOSJASUSLMIt1e
         oMZ8dVxC/JT1ZgpfBauY35r02Rdtzt5ckYZgUqBokxul14ZBvIFjUEMnXD8+AanxmvcZ
         FfqQ==
X-Gm-Message-State: AOAM531rQDzJFFg/8IjdrY7aD+n8uZwbMctDi42N9FpLpcuxemgX5njC
        joaOwdxafhwJ3935jIrswg==
X-Google-Smtp-Source: ABdhPJwtENeG5pic57aS0ml8NPRUqqEOnxCFory6AMF/MV2f3K9FBEovaYpCw2SzI7OWEI8CQbrI2w==
X-Received: by 2002:a5e:a816:: with SMTP id c22mr128606ioa.94.1626297958643;
        Wed, 14 Jul 2021 14:25:58 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id l18sm896887ioc.13.2021.07.14.14.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 14:25:57 -0700 (PDT)
Received: (nullmailer pid 3554156 invoked by uid 1000);
        Wed, 14 Jul 2021 21:25:54 -0000
Date:   Wed, 14 Jul 2021 15:25:54 -0600
From:   Rob Herring <robh@kernel.org>
To:     Irui Wang <irui.wang@mediatek.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@google.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Longfei Wang <longfei.wang@mediatek.com>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-media@vger.kernel.org, srv_heupstream@mediatek.com,
        Rob Herring <robh+dt@kernel.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/3] dt-bindings: media: mtk-vcodec: Add binding for
 MT8195 VENC
Message-ID: <20210714212554.GA3554095@robh.at.kernel.org>
References: <20210630085247.27554-1-irui.wang@mediatek.com>
 <20210630085247.27554-3-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210630085247.27554-3-irui.wang@mediatek.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 30 Jun 2021 16:52:46 +0800, Irui Wang wrote:
> Updates binding document for mt8192 encoder driver.
> 
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/media/mediatek-vcodec.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
