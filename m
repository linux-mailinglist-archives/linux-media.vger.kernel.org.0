Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CD362CC14D
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 16:51:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728484AbgLBPuu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 10:50:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:37222 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728462AbgLBPuu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Dec 2020 10:50:50 -0500
X-Gm-Message-State: AOAM530oSBtPR3+cEP//qkRIPSaQ+dMyUdTJ+M8HM4cex1iloP0iXfSw
        GLEsnkahel/Ptxq/S4OaDdwYe3PpPvHasv2XKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606924209;
        bh=O0eTkJTs7bcukkuq6FC0TVVJ6CE+ibI9jiewGh0Ue3M=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=fuOvCx95fHkbO0szN529yLqnyJ+0szhgtC7CzBHp0x9D8IMoZwomkxlvIaNaG3vDc
         nIuy/oUaW3kCGIYNIDv15Dw8GBhQ+xiS1QvHL084IYZxhbf+DzmgTFOTqrEAkpQ7YY
         7sWYKUdvJrDkAJ0lK3oESiLGyj11y3YOhZKaRYw8=
X-Google-Smtp-Source: ABdhPJxd1pSE+fRhX8e3Q9Bn0NO1mKBG5A4nyjOZVdIGNh8W2VeNGdOjrCnFR8SmHMiXp/0kqSApyK5YiL9dpDyxTaI=
X-Received: by 2002:aa7:d154:: with SMTP id r20mr539373edo.258.1606924207770;
 Wed, 02 Dec 2020 07:50:07 -0800 (PST)
MIME-Version: 1.0
References: <E1kkTsj-0029fe-8O@www.linuxtv.org>
In-Reply-To: <E1kkTsj-0029fe-8O@www.linuxtv.org>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 2 Dec 2020 08:45:59 -0700
X-Gmail-Original-Message-ID: <CAL_JsqL5RQkgGEpVadZC-BOB02sMk81q6LvKevcCt-oqkMK-gA@mail.gmail.com>
Message-ID: <CAL_JsqL5RQkgGEpVadZC-BOB02sMk81q6LvKevcCt-oqkMK-gA@mail.gmail.com>
Subject: Re: [git:media_tree/master] media: dt-bindings: media: Use OF graph schema
To:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linuxtv-commits@linuxtv.org, Jacopo Mondi <jacopo@jmondi.org>,
        Maxime Ripard <mripard@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Dec 2, 2020 at 8:17 AM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> This is an automatic generated email to let you know that the following patch were queued:
>
> Subject: media: dt-bindings: media: Use OF graph schema
> Author:  Rob Herring <robh@kernel.org>
> Date:    Tue Nov 17 02:39:47 2020 +0100
>
> Now that we have a graph schema, rework the media related schemas to
> use it. Mostly this is adding a reference to graph.yaml and dropping
> duplicate parts from schemas.
>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Jacopo Mondi <jacopo@jmondi.org>
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Laurent did not ack this. There was discussion on this and it needs a
v2. Please drop.

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>
>  .../bindings/media/allwinner,sun4i-a10-csi.yaml    |  1 +
>  .../bindings/media/allwinner,sun6i-a31-csi.yaml    |  1 +
>  .../devicetree/bindings/media/i2c/adv7180.yaml     | 31 ++-------
>  .../devicetree/bindings/media/i2c/adv7604.yaml     | 32 ++-------
>  .../bindings/media/i2c/aptina,mt9v111.yaml         |  2 +-
>  .../bindings/media/i2c/imi,rdacm2x-gmsl.yaml       | 25 +------
>  .../devicetree/bindings/media/i2c/imx219.yaml      |  4 ++
>  .../bindings/media/i2c/maxim,max9286.yaml          | 76 +++++-----------------
>  .../devicetree/bindings/media/i2c/ov5647.yaml      |  5 +-
>  .../devicetree/bindings/media/i2c/ov8856.yaml      |  5 +-
>  .../devicetree/bindings/media/i2c/ovti,ov772x.yaml |  1 +
>  .../devicetree/bindings/media/i2c/sony,imx214.yaml |  1 +
>  .../devicetree/bindings/media/i2c/sony,imx274.yaml |  3 +-
>  .../bindings/media/marvell,mmp2-ccic.yaml          |  1 +
>  .../devicetree/bindings/media/renesas,ceu.yaml     |  1 +
>  .../devicetree/bindings/media/renesas,csi2.yaml    | 36 ++--------
>  .../devicetree/bindings/media/renesas,vin.yaml     |  7 +-
>  .../devicetree/bindings/media/st,stm32-dcmi.yaml   |  7 +-
>  .../devicetree/bindings/media/ti,cal.yaml          | 15 ++---
>  .../bindings/media/xilinx/xlnx,csi2rxss.yaml       | 21 +-----
>  20 files changed, 61 insertions(+), 214 deletions(-)
