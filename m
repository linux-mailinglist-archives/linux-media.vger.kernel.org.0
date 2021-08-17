Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 752F53EF41F
	for <lists+linux-media@lfdr.de>; Tue, 17 Aug 2021 22:49:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234360AbhHQUea (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Aug 2021 16:34:30 -0400
Received: from mail-ot1-f43.google.com ([209.85.210.43]:34745 "EHLO
        mail-ot1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235120AbhHQUeP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Aug 2021 16:34:15 -0400
Received: by mail-ot1-f43.google.com with SMTP id e13-20020a9d63cd0000b02904fa42f9d275so5569otl.1;
        Tue, 17 Aug 2021 13:33:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Qk6NGp+xE9TOP3LguIONlFmciWZ7grkB7B+J2N/IzfI=;
        b=lvd0hTy8USB3ESgOJmZYvw7Z3cEld4+Tp7J8+27dptjzrBaZPUdm2Wwg170wRRWZt+
         OZuUbGCTnhE3mME+fA85TW42LKdlYSen4vF5PgfMrsMxLEqahN8C4L7VRRR1x98ZFbI9
         semjmaUKUFihdjC+CprLXBK7rC0z/qcyFQ+lkYUnTz//2UTSQ4kiJY/lX6YO419wfQOK
         c48iHuvlcbw+NHUNSmINTDaUHT4coOUjtHEhHU35BEnBzx1wEFnTiB6VzQ+LFbptlUAR
         u4iCqAyMQ/Bc8vfp1b5JV7X+zg9pszviFiy5SAZqJEoLPE7dfWcqILntwpCcU2a7SIlf
         NP7w==
X-Gm-Message-State: AOAM531aNiqkaaxd7H9yu4tYt8UqvSnFSJBjFVUSAUPELipuJNbfLHzh
        Y182564OCkf1MKEWysQULw==
X-Google-Smtp-Source: ABdhPJyz9ZLACKFVCFOlx9kgV8DMkNjlz3yzfdPCFXr/Q6uhyAKnR/Oq/0tiJKDwIGxRSNPOgxES1Q==
X-Received: by 2002:a9d:7416:: with SMTP id n22mr1780224otk.309.1629232421572;
        Tue, 17 Aug 2021 13:33:41 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n9sm589559otn.54.2021.08.17.13.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 13:33:40 -0700 (PDT)
Received: (nullmailer pid 791869 invoked by uid 1000);
        Tue, 17 Aug 2021 20:33:39 -0000
Date:   Tue, 17 Aug 2021 15:33:39 -0500
From:   Rob Herring <robh@kernel.org>
To:     Yunfei Dong <yunfei.dong@mediatek.com>
Cc:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Tomasz Figa <tfiga@google.com>,
        George Sun <george.sun@mediatek.com>,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        Alexandre Courbot <acourbot@chromium.org>,
        linux-arm-kernel@lists.infradead.org,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        linux-mediatek@lists.infradead.org,
        Irui Wang <irui.wang@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Fritz Koenig <frkoenig@chromium.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        srv_heupstream@mediatek.com, Tzung-Bi Shih <tzungbi@chromium.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5, 05/15] dt-bindings: media: mtk-vcodec: Separate video
 encoder and decoder dt-bindings
Message-ID: <YRwdI7GcPofoSube@robh.at.kernel.org>
References: <20210811025801.21597-1-yunfei.dong@mediatek.com>
 <20210811025801.21597-6-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210811025801.21597-6-yunfei.dong@mediatek.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 11 Aug 2021 10:57:51 +0800, Yunfei Dong wrote:
> Decoder will use component framework to manage hardware, it is big
> difference with encoder.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
> v5: no changes
> ---
>  .../media/mediatek,vcodec-decoder.yaml        | 175 +++++++++++++++++
>  .../media/mediatek,vcodec-encoder.yaml        | 185 ++++++++++++++++++
>  .../bindings/media/mediatek-vcodec.txt        | 130 ------------
>  3 files changed, 360 insertions(+), 130 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
