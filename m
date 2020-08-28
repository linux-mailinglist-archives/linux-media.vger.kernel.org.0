Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCD892562BD
	for <lists+linux-media@lfdr.de>; Sat, 29 Aug 2020 00:00:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726584AbgH1WA0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Aug 2020 18:00:26 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:41607 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726033AbgH1WAZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Aug 2020 18:00:25 -0400
Received: by mail-io1-f67.google.com with SMTP id m23so542850iol.8;
        Fri, 28 Aug 2020 15:00:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wMHVWbiPBLcRjA2cjtQwy6nnc0JRKu1LeCAOKufBp48=;
        b=UxlcM5Lke9rROq8Sxg2DL11nkcytwZkS5yrTp6q76WR0cZYHVsGTj/BTbdP+7+8ozr
         nPwIC4noMNJqqdCmZv3m+COqUBhw5KmL+WzauCDqWd3aB86uK3XvPlpjXhQVXJlBixnF
         z92h64H4syZqG1GohIh0fQSJo+8bKiuYKgpPTiMen1nIeI1TaMDlimkl0mkAwe/74xZ4
         lVXKexBBAPdkRFS2cWdDAMWRN01zx9gx3rjKGmUS34TxkRsT7sYhByKnm/x41aDQM0T6
         pNVUpmoTdeW1EG2ib/NVpnQfNNm1EjoJkE5rdTD0HMpiYVLUByfurU0gzobX8tjLsOQD
         Qn0A==
X-Gm-Message-State: AOAM532xcPML73cBc2MqJ8Sptb7JDfuA7JTC4rn7ozZEfcuYygBt+Alq
        hYSshJPYLcb2MofpRfHRgmunkFlz4AXT
X-Google-Smtp-Source: ABdhPJwCx/OejHv5kikm7x+v+SSME8DKxT8DEC7huiH8h7vtJ20q7dk2WOTs1KGDoOVWNyEPsoNmwA==
X-Received: by 2002:a05:6602:2293:: with SMTP id d19mr660780iod.45.1598652024037;
        Fri, 28 Aug 2020 15:00:24 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id y9sm286427ila.65.2020.08.28.15.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2020 15:00:23 -0700 (PDT)
Received: (nullmailer pid 3479570 invoked by uid 1000);
        Fri, 28 Aug 2020 22:00:21 -0000
Date:   Fri, 28 Aug 2020 16:00:21 -0600
From:   Rob Herring <robh@kernel.org>
To:     Alexandre Courbot <acourbot@chromium.org>
Cc:     linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        linux-media@vger.kernel.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-kernel@vger.kernel.org,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tiffany Lin <tiffany.lin@mediatek.com>
Subject: Re: [PATCH v4 02/17] dt-bindings: media: mtk-vcodec: document SCP
 node
Message-ID: <20200828220021.GA3479540@bogus>
References: <20200821103608.2310097-1-acourbot@chromium.org>
 <20200821103608.2310097-3-acourbot@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200821103608.2310097-3-acourbot@chromium.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 21 Aug 2020 19:35:53 +0900, Alexandre Courbot wrote:
> The mediatek codecs can use either the VPU or the SCP as their interface
> to firmware. Reflect this in the DT bindings.
> 
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>
> ---
>  Documentation/devicetree/bindings/media/mediatek-vcodec.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
