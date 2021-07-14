Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2124A3C9440
	for <lists+linux-media@lfdr.de>; Thu, 15 Jul 2021 01:14:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233627AbhGNXQ4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jul 2021 19:16:56 -0400
Received: from mail-io1-f53.google.com ([209.85.166.53]:38700 "EHLO
        mail-io1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229928AbhGNXQz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jul 2021 19:16:55 -0400
Received: by mail-io1-f53.google.com with SMTP id k11so4219029ioa.5;
        Wed, 14 Jul 2021 16:14:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yctG1YdIV6Px1SU8AGyelV3I04Eay9VEBZw3/gPji0I=;
        b=J7WtvQXYABOKqMy9t0fVEhBaknmr0kCM3XDtpratd1Eds9/9J1vZFDqHEBIH0yd8Rw
         2W+kk0UlIY/VZdLiW2uPqICi8iA5CfK0xvSBPUKWOwyR42IevIOU6dz9FPtKltkxVcYE
         JcTmk1KyUpqWSDDkLeTp3RAAHkDb5sCQef49D5LQ+/f7l9R9BN5INL0v26ATcoTqxbtZ
         WNShKZw6K3WXjrRZkL6KHVD+5gLK7MhQxNeeV9gcwfm1IcX6GPGrj6DgcyrESdbzeg56
         IL7qHxoDX19ih4sh/wSBmFkwkP4dAKBKHDlcWb+z2GDFP1LuBZIM2o1gpYoPqcwoQmb+
         gMTQ==
X-Gm-Message-State: AOAM532xxlWPlr+vdL1CLn/BYUmcUsiZJxmlQrUcQSSzc8UmJYhd8Mqz
        tZ62P80m9t7KAzfg+Lv2Aw==
X-Google-Smtp-Source: ABdhPJwGGiAhes2rUVASRwJcoN46W1Ft9CMHVmWXDoXe7onpUc9CAAeihSmKlq4JbiFGP1n65a40Fg==
X-Received: by 2002:a5e:9917:: with SMTP id t23mr426233ioj.158.1626304442393;
        Wed, 14 Jul 2021 16:14:02 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id q1sm2119376ioi.42.2021.07.14.16.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 16:14:01 -0700 (PDT)
Received: (nullmailer pid 3720101 invoked by uid 1000);
        Wed, 14 Jul 2021 23:13:59 -0000
Date:   Wed, 14 Jul 2021 17:13:59 -0600
From:   Rob Herring <robh@kernel.org>
To:     Tzung-Bi Shih <tzungbi@google.com>
Cc:     Yunfei Dong <Yunfei.Dong@mediatek.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Irui Wang <irui.wang@mediatek.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v1, 04/14] dt-bindings: media: mtk-vcodec: Separate video
 encoder and decoder dt-bindings
Message-ID: <20210714231359.GA3715372@robh.at.kernel.org>
References: <20210707062157.21176-1-yunfei.dong@mediatek.com>
 <20210707062157.21176-5-yunfei.dong@mediatek.com>
 <CA+Px+wWQREny2KSjDfgdnMvk8GKKqr+QvRdSR8YXc1i73wbJSQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+Px+wWQREny2KSjDfgdnMvk8GKKqr+QvRdSR8YXc1i73wbJSQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jul 08, 2021 at 06:04:54PM +0800, Tzung-Bi Shih wrote:
> On Wed, Jul 7, 2021 at 2:22 PM Yunfei Dong <yunfei.dong@mediatek.com> wrote:
> >  .../media/mediatek-vcodec-decoder.txt         | 169 ++++++++++++++++++
> >  .../media/mediatek-vcodec-encoder.txt         |  73 ++++++++
> >  2 files changed, 242 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/mediatek-vcodec-decoder.txt
> >  create mode 100644 Documentation/devicetree/bindings/media/mediatek-vcodec-encoder.txt
> The patch is weird.  Its title says "separate" but the changes are all
> creating new content.
> 
> Would expect the patch to remove content from some files (e.g.
> Documentation/devicetree/bindings/media/mediatek-vcodec.txt) and
> separate into 2 files.

Except h/w doesn't change. Using the component framework is not a reason 
to change bindings.

Also, note that any major changes or additions should be in schema 
format now.

Rob
