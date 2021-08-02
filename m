Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A4803DE01B
	for <lists+linux-media@lfdr.de>; Mon,  2 Aug 2021 21:34:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229946AbhHBTe1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Aug 2021 15:34:27 -0400
Received: from mail-io1-f48.google.com ([209.85.166.48]:33317 "EHLO
        mail-io1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229607AbhHBTeT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Aug 2021 15:34:19 -0400
Received: by mail-io1-f48.google.com with SMTP id n19so21714283ioz.0;
        Mon, 02 Aug 2021 12:34:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8NRXui1lqvJnrd7xBFo3bBD2I7+m2+1hWUHR5Dvpbb0=;
        b=Q/gin5wAn/wpF4uorL3qtMgmcQ1AbgTW9nM5WFVFPZ1lv7M2xApHmcVrAorRA2vXcu
         ZrhFJ09PRizrLf2V72EpI1J23uNrieyEHja3IdGnamBlfMRS487sdUA+dn7v7xUSHi3V
         CpRe2r0ztDA9TMzhAA1OO94bQRNrcs/u24ChAKv4ysaxKudiQkOk+glzXsxxlo7bWcE4
         xVdmS0qbIjcWIbLcUSMi7kqF8NAe3EQ10LNerAEkOxgknnJyFARVXAihAKak0yhPTGtR
         Di21G2jVNqyERUJfuf1op/4ilJAzeLb8HKsxGn4y8Guw9mTiJBcDnUC9ZR5d6LvQiqaX
         HgLA==
X-Gm-Message-State: AOAM531iC87HxYmFfE0aj9KZVpOfymT5lEP6rCAmjKb2OeHUNgO8YYZQ
        m3f5vc4Bvrv/x964vjBZsw==
X-Google-Smtp-Source: ABdhPJzQvf9cEhYJZdC6YTWPHXUM0XAF853fhmk/4tHDU93mGnGpAm7JnJjfXErHNWHiRmgiE4ilWg==
X-Received: by 2002:a05:6638:14c1:: with SMTP id l1mr15829666jak.97.1627932837949;
        Mon, 02 Aug 2021 12:33:57 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id a17sm8116051ios.36.2021.08.02.12.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 12:33:57 -0700 (PDT)
Received: (nullmailer pid 1464986 invoked by uid 1000);
        Mon, 02 Aug 2021 19:33:55 -0000
Date:   Mon, 2 Aug 2021 13:33:55 -0600
From:   Rob Herring <robh@kernel.org>
To:     Ming Qian <ming.qian@nxp.com>
Cc:     kernel@pengutronix.de, aisheng.dong@nxp.com,
        devicetree@vger.kernel.org, linux-imx@nxp.com,
        hverkuil-cisco@xs4all.nl, festevam@gmail.com, mchehab@kernel.org,
        linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, shawnguo@kernel.org
Subject: Re: [PATCH v5 01/14] dt-bindings: media: imx8q: add imx video codec
 bindings
Message-ID: <YQhIo7eNAV6pBY+3@robh.at.kernel.org>
References: <cover.1627353315.git.ming.qian@nxp.com>
 <6ec97ccf157fcad84be33501f0e8f1c90f7e21c6.1627353315.git.ming.qian@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ec97ccf157fcad84be33501f0e8f1c90f7e21c6.1627353315.git.ming.qian@nxp.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 27 Jul 2021 11:20:44 +0800, Ming Qian wrote:
> Add devicetree binding documentation for IMX8Q Video Processing Unit IP
> 
> Signed-off-by: Ming Qian <ming.qian@nxp.com>
> Signed-off-by: Shijie Qin <shijie.qin@nxp.com>
> Signed-off-by: Zhou Peng <eagle.zhou@nxp.com>
> ---
>  .../bindings/media/nxp,imx8q-vpu.yaml         | 178 ++++++++++++++++++
>  1 file changed, 178 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/nxp,imx8q-vpu.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
