Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE691246917
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 17:09:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729082AbgHQPJQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 11:09:16 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:51969 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728651AbgHQPJO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 11:09:14 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 8DDEC4000A;
        Mon, 17 Aug 2020 15:09:10 +0000 (UTC)
Date:   Mon, 17 Aug 2020 17:12:53 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/8] dt-bindings: media: i2c: Convert to json-schema
Message-ID: <20200817151253.drfgqojchbbfud5b@uno.localdomain>
References: <20200715140951.90753-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200715140951.90753-1-jacopo+renesas@jmondi.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello
   Mauro, Hans or Sakari (whoever maintains the media patchwork
instance), could you mark patches in this series as super-seded,
as I will re-send them out for each individual sensor ?

Thanks
   j

On Wed, Jul 15, 2020 at 04:09:43PM +0200, Jacopo Mondi wrote:
> Convert to json schema the bindings file for the following sensor
> drivers:
>
> - ov5640
> - ov5645
> - ov772x
> - mt9v111
> - imx214
> - imx274
> - imx290
>
> On top of the conversion to yaml, rename the files to include the
> vendor prefix (I kept this separate as I'm not sure it's actually desired).
>
> The series requires:
> [PATCH v3 0/3] dt-bidings: media: ov5647 bindings + small fix
> which converts the ov5647 bindings to yaml which I sent separately
> as it was already in review.
>
> Individual maintainers Cc-ed for each single patch where available.
>
> Thanks
>   j
>
> Jacopo Mondi (8):
>   dt-bindings: media: ov5640: Convert to json-schema
>   dt-bindings: media: ov5645: Convert to json-schema
>   dt-bindings: media: mt9v111: Convert to json-schema
>   dt-bindings: media: imx290: Convert to json-schema
>   dt-bindings: media: imx274: Convert to json-schema
>   dt-bindings: media: imx214: Convert to json-schema
>   dt-bindings: media: ov772x: Convert to json-schema
>   dt-bindings: media: i2c: Add prefix to yaml bindings
>
>  .../bindings/media/i2c/aptina,mt9v111.txt     |  46 -----
>  .../bindings/media/i2c/aptina,mt9v111.yaml    |  87 +++++++++
>  .../devicetree/bindings/media/i2c/imx274.txt  |  33 ----
>  .../devicetree/bindings/media/i2c/imx290.txt  |  57 ------
>  .../devicetree/bindings/media/i2c/ov5640.txt  |  92 ---------
>  .../devicetree/bindings/media/i2c/ov5645.txt  |  54 ------
>  .../devicetree/bindings/media/i2c/ov772x.txt  |  40 ----
>  .../bindings/media/i2c/ovti,ov5640.yaml       | 181 ++++++++++++++++++
>  .../bindings/media/i2c/ovti,ov5645.yaml       | 123 ++++++++++++
>  .../i2c/{ov5647.yaml => ovti,ov5647.yaml}     |   0
>  .../bindings/media/i2c/ovti,ov772x.yaml       |  89 +++++++++
>  .../i2c/{ov8856.yaml => ovti,ov8856.yaml}     |   0
>  .../bindings/media/i2c/sony,imx214.txt        |  53 -----
>  .../bindings/media/i2c/sony,imx214.yaml       | 124 ++++++++++++
>  .../i2c/{imx219.yaml => sony,imx219.yaml}     |   0
>  .../bindings/media/i2c/sony,imx274.yaml       |  74 +++++++
>  .../bindings/media/i2c/sony,imx290.yaml       | 124 ++++++++++++
>  MAINTAINERS                                   |  25 ++-
>  18 files changed, 819 insertions(+), 383 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/i2c/aptina,mt9v111.txt
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/aptina,mt9v111.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/i2c/imx274.txt
>  delete mode 100644 Documentation/devicetree/bindings/media/i2c/imx290.txt
>  delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov5640.txt
>  delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov5645.txt
>  delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov772x.txt
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov5640.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov5645.yaml
>  rename Documentation/devicetree/bindings/media/i2c/{ov5647.yaml => ovti,ov5647.yaml} (100%)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
>  rename Documentation/devicetree/bindings/media/i2c/{ov8856.yaml => ovti,ov8856.yaml} (100%)
>  delete mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx214.txt
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
>  rename Documentation/devicetree/bindings/media/i2c/{imx219.yaml => sony,imx219.yaml} (100%)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
>
> --
> 2.27.0
>
