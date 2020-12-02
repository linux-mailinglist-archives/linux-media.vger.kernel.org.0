Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 510B52CC159
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 16:53:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728544AbgLBPxB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 10:53:01 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:57572 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727889AbgLBPxB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Dec 2020 10:53:01 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 264022A4;
        Wed,  2 Dec 2020 16:52:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1606924339;
        bh=jIzvV/pEWrFYp4QKPY1SEkIzHhveizFOWnIQjWHJ6dI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PG6cjF9G1JWqBnCPV0uxzBrpzcf+WU/pob/81L8AheKpZCzVByhXOi017ePk5rDfF
         5f5fCWgNyJtZiebWrhVaKn87IQQ1Ryk1WxFZZUkbHGuDPwPXT4MlZvsU6tIm7r9Gka
         YwToIWRlKC2NZZgCNBCt/gmzVEcQIHhg0/uhUNno=
Date:   Wed, 2 Dec 2020 17:52:10 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linuxtv-commits@linuxtv.org, Jacopo Mondi <jacopo@jmondi.org>,
        Maxime Ripard <mripard@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [git:media_tree/master] media: dt-bindings: media: Use OF graph
 schema
Message-ID: <20201202155210.GA13750@pendragon.ideasonboard.com>
References: <E1kkTsj-0029fe-8O@www.linuxtv.org>
 <CAL_JsqL5RQkgGEpVadZC-BOB02sMk81q6LvKevcCt-oqkMK-gA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAL_JsqL5RQkgGEpVadZC-BOB02sMk81q6LvKevcCt-oqkMK-gA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Dec 02, 2020 at 08:45:59AM -0700, Rob Herring wrote:
> On Wed, Dec 2, 2020 at 8:17 AM Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
> >
> > This is an automatic generated email to let you know that the following patch were queued:
> >
> > Subject: media: dt-bindings: media: Use OF graph schema
> > Author:  Rob Herring <robh@kernel.org>
> > Date:    Tue Nov 17 02:39:47 2020 +0100
> >
> > Now that we have a graph schema, rework the media related schemas to
> > use it. Mostly this is adding a reference to graph.yaml and dropping
> > duplicate parts from schemas.
> >
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Jacopo Mondi <jacopo@jmondi.org>
> > Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Laurent did not ack this. There was discussion on this and it needs a
> v2. Please drop.

I told Sakari in an IRC conversation I was fine with the patches, and he
asked if that meant an ack. I said yes, but didn't realize he wanted to
apply your v1. Sorry about the confusion :-S

> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> >
> >  .../bindings/media/allwinner,sun4i-a10-csi.yaml    |  1 +
> >  .../bindings/media/allwinner,sun6i-a31-csi.yaml    |  1 +
> >  .../devicetree/bindings/media/i2c/adv7180.yaml     | 31 ++-------
> >  .../devicetree/bindings/media/i2c/adv7604.yaml     | 32 ++-------
> >  .../bindings/media/i2c/aptina,mt9v111.yaml         |  2 +-
> >  .../bindings/media/i2c/imi,rdacm2x-gmsl.yaml       | 25 +------
> >  .../devicetree/bindings/media/i2c/imx219.yaml      |  4 ++
> >  .../bindings/media/i2c/maxim,max9286.yaml          | 76 +++++-----------------
> >  .../devicetree/bindings/media/i2c/ov5647.yaml      |  5 +-
> >  .../devicetree/bindings/media/i2c/ov8856.yaml      |  5 +-
> >  .../devicetree/bindings/media/i2c/ovti,ov772x.yaml |  1 +
> >  .../devicetree/bindings/media/i2c/sony,imx214.yaml |  1 +
> >  .../devicetree/bindings/media/i2c/sony,imx274.yaml |  3 +-
> >  .../bindings/media/marvell,mmp2-ccic.yaml          |  1 +
> >  .../devicetree/bindings/media/renesas,ceu.yaml     |  1 +
> >  .../devicetree/bindings/media/renesas,csi2.yaml    | 36 ++--------
> >  .../devicetree/bindings/media/renesas,vin.yaml     |  7 +-
> >  .../devicetree/bindings/media/st,stm32-dcmi.yaml   |  7 +-
> >  .../devicetree/bindings/media/ti,cal.yaml          | 15 ++---
> >  .../bindings/media/xilinx/xlnx,csi2rxss.yaml       | 21 +-----
> >  20 files changed, 61 insertions(+), 214 deletions(-)

-- 
Regards,

Laurent Pinchart
