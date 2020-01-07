Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 394BB132243
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2020 10:29:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727662AbgAGJ2u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jan 2020 04:28:50 -0500
Received: from gloria.sntech.de ([185.11.138.130]:58290 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726485AbgAGJ2u (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 7 Jan 2020 04:28:50 -0500
Received: from ip5f5a5f74.dynamic.kabel-deutschland.de ([95.90.95.116] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <heiko@sntech.de>)
        id 1iolA5-0001Tu-Jm; Tue, 07 Jan 2020 10:28:29 +0100
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Helen Koike <helen.koike@collabora.com>,
        linux-rockchip@lists.infradead.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, eddie.cai.linux@gmail.com,
        mchehab@kernel.org, gregkh@linuxfoundation.org,
        andrey.konovalov@linaro.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org, robh+dt@kernel.org, hans.verkuil@cisco.com,
        sakari.ailus@linux.intel.com, joacim.zetterling@gmail.com,
        kernel@collabora.com, linux-media@vger.kernel.org,
        jacob-chen@iotwrt.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v12 09/11] media: staging: dt-bindings: add Rockchip MIPI RX D-PHY yaml bindings
Date:   Tue, 07 Jan 2020 10:28:28 +0100
Message-ID: <2549505.MsbA2le1sL@diego>
In-Reply-To: <20200107023721.GG22189@pendragon.ideasonboard.com>
References: <20191227200116.2612137-1-helen.koike@collabora.com> <cfd5156f09358a428d0c40cfcd17d688e0225f2b.camel@collabora.com> <20200107023721.GG22189@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Dienstag, 7. Januar 2020, 03:37:21 CET schrieb Laurent Pinchart:
> On Mon, Jan 06, 2020 at 11:06:12PM -0300, Ezequiel Garcia wrote:
> > On Tue, 2020-01-07 at 02:10 +0200, Laurent Pinchart wrote:
> > > Hi Helen,
> > > 
> > > Thank you for the patch.
> > > 
> > > On Fri, Dec 27, 2019 at 05:01:14PM -0300, Helen Koike wrote:
> > > > Add yaml DT bindings for Rockchip MIPI D-PHY RX
> > > > 
> > > > This was tested and verified with:
> > > > mv drivers/staging/media/phy-rockchip-dphy/Documentation/devicetree/bindings/phy/rockchip-mipi-dphy.yaml  Documentation/devicetree/bindings/phy/
> > > > make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/phy/rockchip-mipi-dphy.yaml
> > > > make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/phy/rockchip-mipi-dphy.yaml
> > > > 
> > > > Signed-off-by: Helen Koike <helen.koike@collabora.com>
> > > > 
> > > > ---
> > > > 
> > > > Changes in v12:
> > > > - The commit replaces the following commit in previous series named
> > > > media: staging: dt-bindings: Document the Rockchip MIPI RX D-PHY bindings
> > > > This new patch adds yaml binding and was verified with
> > > > make dtbs_check and make dt_binding_check
> > > > 
> > > > Changes in v11: None
> > > > Changes in v10:
> > > > - unsquash
> > > > 
> > > > Changes in v9:
> > > > - fix title division style
> > > > - squash
> > > > - move to staging
> > > > 
> > > > Changes in v8: None
> > > > Changes in v7:
> > > > - updated doc with new design and tested example
> > > > 
> > > >  .../bindings/phy/rockchip-mipi-dphy.yaml      | 75 +++++++++++++++++++
> > > >  1 file changed, 75 insertions(+)
> > > >  create mode 100644 drivers/staging/media/phy-rockchip-dphy/Documentation/devicetree/bindings/phy/rockchip-mipi-dphy.yaml
> > > > 
> > > > diff --git a/drivers/staging/media/phy-rockchip-dphy/Documentation/devicetree/bindings/phy/rockchip-mipi-dphy.yaml b/drivers/staging/media/phy-
> > > > rockchip-dphy/Documentation/devicetree/bindings/phy/rockchip-mipi-dphy.yaml
> > > > new file mode 100644
> > > > index 000000000000..af97f1b3e005
> > > > --- /dev/null
> > > > +++ b/drivers/staging/media/phy-rockchip-dphy/Documentation/devicetree/bindings/phy/rockchip-mipi-dphy.yaml
> > > > @@ -0,0 +1,75 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/phy/rockchip-mipi-dphy.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Rockchip SoC MIPI RX0 D-PHY Device Tree Bindings
> > > 
> > > Should this be s/RX0/RX/ ? Or do you expect different bindings for RX1 ?
> > 
> > The driver currently only supports RX0, but I think you are right,
> > it should say RX here. This binding could be extended for RX1.
> > 
> > > Looking at the PHY driver, it seems to handle all PHYs with a single
> > > struct device. Should we thus use #phy-cells = <1> to select the PHY ?
> > 
> > I am not following this. The driver handles just one PHY. Each PHY
> > should have its own node.
> 
> Looking at the registers, it seems that the different PHYs are
> intertwined and we would could have trouble handling the different PHYs
> with different DT nodes and thus struct device instances.

I have to confess to not following _ALL_ of the threads, so may say
something stupid, but I don't think the PHYs are intertwined so much.

Where RX0 is controlled from the "General Register Files" alone
[register dumping ground for soc designers], the TX1RX1-phy
actually gets controlled from inside the dsi1 register area it seems.

So in my previous (still unsucessful) tests, I was rolling with something like
https://github.com/mmind/linux-rockchip/commit/e0d4b03976d2aab85a8c1630be937ea003b5df88

With the actual "logic" picked from the vendor kernel, that just double-
maps the dsi1-registers in both dsi and dphy driver, which was strange.


Heiko


