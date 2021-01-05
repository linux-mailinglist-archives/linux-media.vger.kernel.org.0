Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C30682EA49E
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 06:02:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725535AbhAEFAH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 00:00:07 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:60874 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725287AbhAEFAH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 00:00:07 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 27DDB3D7;
        Tue,  5 Jan 2021 05:59:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609822765;
        bh=jsaMiiWsfzCQXoVEopoik0qHzSps0+m29wGk7mVkolE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NflZpHsyBJjbM569jaM91mhBk05kxTYm+IrLf+WnI6K1TF1wZva+cxT2ZYXRKKtGb
         M25XvkgFVH3QoHMr9ZENNiHbbIyGc76EJafmhXHdFwVxcX8DXt69g6aMVRMhR8I95z
         LQCW9wUx2Fg8gLupdUKJQWp9RDs8fLDurHXSYE08=
Date:   Tue, 5 Jan 2021 06:59:12 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Guennadi Liakhovetski <g.liakhovetski@gmx.de>,
        Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v4 2/2] dt-bindings: media: Use graph and
 video-interfaces schemas
Message-ID: <X/PyIC2xHcEl0elF@pendragon.ideasonboard.com>
References: <20210104165808.2166686-1-robh@kernel.org>
 <20210104165808.2166686-3-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210104165808.2166686-3-robh@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rob,

Thank you for the patch.

On Mon, Jan 04, 2021 at 09:58:08AM -0700, Rob Herring wrote:
> Now that we have graph and video-interfaces schemas, rework the media
> related schemas to use them.
> 
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Jacopo Mondi <jacopo@jmondi.org>
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: linux-media@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I'm very happy to see this landing in v5.12 :-)

> ---
> v4:
> - Fix incorrect ref 'video-interface-device.yaml' in ovti,ov02a10.yaml
> - Explicitly list common properties used in mipi-ccs and ovti,ov02a10
> - Add back description of link-frequencies driver limitations in ov8856
> 
> v3:
> - Add mipi-ccs.yaml, ovti,ov02a10.yaml
> 
> v2:
>  - Update based on graph schema changes and addition of video-interfaces
>    schemas
> ---
>  .../media/allwinner,sun4i-a10-csi.yaml        |  11 +-
>  .../media/allwinner,sun6i-a31-csi.yaml        |  12 +-
>  .../bindings/media/i2c/adv7180.yaml           |  36 ++----
>  .../bindings/media/i2c/adv7604.yaml           |  37 ++----
>  .../bindings/media/i2c/aptina,mt9v111.yaml    |   4 +-
>  .../bindings/media/i2c/imi,rdacm2x-gmsl.yaml  |  30 +----
>  .../devicetree/bindings/media/i2c/imx219.yaml |  21 ++--
>  .../bindings/media/i2c/maxim,max9286.yaml     | 101 ++++------------
>  .../bindings/media/i2c/mipi-ccs.yaml          |  17 ++-
>  .../devicetree/bindings/media/i2c/ov5647.yaml |  20 +---
>  .../devicetree/bindings/media/i2c/ov8856.yaml |  22 ++--
>  .../bindings/media/i2c/ovti,ov02a10.yaml      |  29 ++---
>  .../bindings/media/i2c/ovti,ov2680.yaml       |   6 +-
>  .../bindings/media/i2c/ovti,ov772x.yaml       |   9 +-
>  .../bindings/media/i2c/sony,imx214.yaml       |  25 ++--
>  .../bindings/media/i2c/sony,imx274.yaml       |   3 +-
>  .../bindings/media/marvell,mmp2-ccic.yaml     |  15 +--
>  .../bindings/media/nxp,imx7-csi.yaml          |   5 +-
>  .../bindings/media/nxp,imx7-mipi-csi2.yaml    |  32 +----
>  .../bindings/media/renesas,ceu.yaml           |  17 +--
>  .../bindings/media/renesas,csi2.yaml          |  54 ++-------
>  .../bindings/media/renesas,vin.yaml           | 113 +++---------------
>  .../bindings/media/rockchip-isp1.yaml         |  40 +------
>  .../bindings/media/st,stm32-dcmi.yaml         |  18 +--
>  .../devicetree/bindings/media/ti,cal.yaml     |  55 ++-------
>  .../bindings/media/xilinx/xlnx,csi2rxss.yaml  |  39 +-----
>  26 files changed, 172 insertions(+), 599 deletions(-)

-- 
Regards,

Laurent Pinchart
