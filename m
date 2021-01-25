Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51B5B302BBF
	for <lists+linux-media@lfdr.de>; Mon, 25 Jan 2021 20:37:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731981AbhAYThO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Jan 2021 14:37:14 -0500
Received: from mail-ot1-f47.google.com ([209.85.210.47]:43639 "EHLO
        mail-ot1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731959AbhAYTgr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jan 2021 14:36:47 -0500
Received: by mail-ot1-f47.google.com with SMTP id v1so13898520ott.10;
        Mon, 25 Jan 2021 11:36:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mH2q1AZz5irHrvq/3t1+Obhg0JHH2TFjERBNOT0hM0Q=;
        b=kHRTcon5gkg8SRuDD2vKcTtr8mLEKrRVRfUepR+vwUkVTALUi0qhZHnOLAQfpGA8nO
         v9hFkNl7ovck8fRU91TRDhgHikzmEieptoGufXz5mz1YGNtSACKppmmrX4NykT7g6VpR
         72t+3vJcc+u7J78XwED+D5a2C8oh5EsKfGVxXkHybN9qVQHSWGWB9FEM/DWi+nLX3jDI
         fi/m+93Lu8UikDho+vYay+J8XTaltFtYD7c5Mr/t5PlVy1HW3gqwXT9wuKDsQwC4MRgH
         tgKLdFoaYykFv+KNMEqnUInQJdCd58X/AEALBrPPGHz2TVuuBu6/Y3R0DbWsc1CiCXvL
         IyUg==
X-Gm-Message-State: AOAM530SgHShS7lzmroF8duZEsmO+lmdV2ltjkhGO+gpcXiIMyQJFtVO
        Rf6UVEG7ZrBo77I7NQdNfQ==
X-Google-Smtp-Source: ABdhPJwBqs6kpkcYrx/aXfe/1e/07a9bQgMjrd1YtHP4Jbg6s9G1TE28GLJ8saSbZE8IZ5BXrEU1qg==
X-Received: by 2002:a05:6830:2f3:: with SMTP id r19mr1513671ote.299.1611603366943;
        Mon, 25 Jan 2021 11:36:06 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id z4sm551224ooz.5.2021.01.25.11.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 11:36:06 -0800 (PST)
Received: (nullmailer pid 830007 invoked by uid 1000);
        Mon, 25 Jan 2021 19:36:04 -0000
Date:   Mon, 25 Jan 2021 13:36:04 -0600
From:   Rob Herring <robh@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Bin Liu <bin.liu@mediatek.com>, David Airlie <airlied@linux.ie>,
        Jonathan Corbet <corbet@lwn.net>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org,
        Houlong Wei <houlong.wei@mediatek.com>,
        dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Daniel Vetter <daniel@ffwll.ch>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        linux-mediatek@lists.infradead.org,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rick Chang <rick.chang@mediatek.com>
Subject: Re: [PATCH 22/24] dt-bindings: memory: mediatek: update mediatek,
 smi-larb.yaml references
Message-ID: <20210125193604.GA829546@robh.at.kernel.org>
References: <cover.1610535349.git.mchehab+huawei@kernel.org>
 <c70bd79b311a65babe7374eaf81974563400a943.1610535350.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c70bd79b311a65babe7374eaf81974563400a943.1610535350.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 13 Jan 2021 11:59:23 +0100, Mauro Carvalho Chehab wrote:
> Changeset 27bb0e42855a ("dt-bindings: memory: mediatek: Convert SMI to DT schema")
> renamed: Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
> to: Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml.
> 
> Update its cross-references accordingly.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,disp.txt      | 2 +-
>  .../devicetree/bindings/media/mediatek-jpeg-decoder.txt         | 2 +-
>  .../devicetree/bindings/media/mediatek-jpeg-encoder.txt         | 2 +-
>  Documentation/devicetree/bindings/media/mediatek-mdp.txt        | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 

Applied, thanks!
