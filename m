Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6FE8133557
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2020 22:58:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727080AbgAGV5y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jan 2020 16:57:54 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:46808 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbgAGV5x (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Jan 2020 16:57:53 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0643852F;
        Tue,  7 Jan 2020 22:57:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1578434271;
        bh=P35fKrt/dB02G14EwAgMdPETX01nTBUtFrYN35CPF48=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SpUnAHB3FZa89YS6khrpYSLHAgai/HIRd3QwKnYZmKVP3ldmbLTjPNXTJTjphs2du
         dE9aLqglcbK4VpJT76yZE3SFzoNGqgRaETFuWbz32YeQsh1PJ/xGQWFOnJXck8oVEl
         VZkJlVea8x8GwLZSP+rmiea6Pza/TxScg23u+LUU=
Date:   Tue, 7 Jan 2020 23:57:39 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
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
Subject: Re: [PATCH v12 09/11] media: staging: dt-bindings: add Rockchip MIPI
 RX D-PHY yaml bindings
Message-ID: <20200107215739.GB7869@pendragon.ideasonboard.com>
References: <20191227200116.2612137-1-helen.koike@collabora.com>
 <2549505.MsbA2le1sL@diego>
 <657de953782be2514849bc8bd12a3fbcb6794427.camel@collabora.com>
 <2299954.gvZHxIxoM0@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2299954.gvZHxIxoM0@diego>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Heiko,

On Tue, Jan 07, 2020 at 10:30:28PM +0100, Heiko Stübner wrote:
> Am Dienstag, 7. Januar 2020, 14:20:10 CET schrieb Ezequiel Garcia:
> > On Tue, 2020-01-07 at 10:28 +0100, Heiko Stübner wrote:
> > > Am Dienstag, 7. Januar 2020, 03:37:21 CET schrieb Laurent Pinchart:
> > > > On Mon, Jan 06, 2020 at 11:06:12PM -0300, Ezequiel Garcia wrote:
> > > > > On Tue, 2020-01-07 at 02:10 +0200, Laurent Pinchart wrote:
> > > > > > Hi Helen,
> > > > > > 
> > > > > > Thank you for the patch.
> > > > > > 
> > > > > > On Fri, Dec 27, 2019 at 05:01:14PM -0300, Helen Koike wrote:
> > > > > > > Add yaml DT bindings for Rockchip MIPI D-PHY RX
> > > > > > > 
> > > > > > > This was tested and verified with:
> > > > > > > mv drivers/staging/media/phy-rockchip-dphy/Documentation/devicetree/bindings/phy/rockchip-mipi-
> > > > > > > dphy.yaml  Documentation/devicetree/bindings/phy/
> > > > > > > make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/phy/rockchip-mipi-dphy.yaml
> > > > > > > make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/phy/rockchip-mipi-dphy.yaml
> > > > > > > 
> > > > > > > Signed-off-by: Helen Koike <helen.koike@collabora.com>
> > > > > > > 
> > > > > > > ---
> > > > > > > 
> > > > > > > Changes in v12:
> > > > > > > - The commit replaces the following commit in previous series named
> > > > > > > media: staging: dt-bindings: Document the Rockchip MIPI RX D-PHY bindings
> > > > > > > This new patch adds yaml binding and was verified with
> > > > > > > make dtbs_check and make dt_binding_check
> > > > > > > 
> > > > > > > Changes in v11: None
> > > > > > > Changes in v10:
> > > > > > > - unsquash
> > > > > > > 
> > > > > > > Changes in v9:
> > > > > > > - fix title division style
> > > > > > > - squash
> > > > > > > - move to staging
> > > > > > > 
> > > > > > > Changes in v8: None
> > > > > > > Changes in v7:
> > > > > > > - updated doc with new design and tested example
> > > > > > > 
> > > > > > >  .../bindings/phy/rockchip-mipi-dphy.yaml      | 75 +++++++++++++++++++
> > > > > > >  1 file changed, 75 insertions(+)
> > > > > > >  create mode 100644 drivers/staging/media/phy-rockchip-dphy/Documentation/devicetree/bindings/phy/rockchip-mipi-dphy.yaml
> > > > > > > 
> > > > > > > diff --git a/drivers/staging/media/phy-rockchip-dphy/Documentation/devicetree/bindings/phy/rockchip-mipi-dphy.yaml
> > > > > > > b/drivers/staging/media/phy-
> > > > > > > rockchip-dphy/Documentation/devicetree/bindings/phy/rockchip-mipi-dphy.yaml
> > > > > > > new file mode 100644
> > > > > > > index 000000000000..af97f1b3e005
> > > > > > > --- /dev/null
> > > > > > > +++ b/drivers/staging/media/phy-rockchip-dphy/Documentation/devicetree/bindings/phy/rockchip-mipi-dphy.yaml
> > > > > > > @@ -0,0 +1,75 @@
> > > > > > > +# SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > > > > > > +%YAML 1.2
> > > > > > > +---
> > > > > > > +$id: http://devicetree.org/schemas/phy/rockchip-mipi-dphy.yaml#
> > > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > > +
> > > > > > > +title: Rockchip SoC MIPI RX0 D-PHY Device Tree Bindings
> > > > > > 
> > > > > > Should this be s/RX0/RX/ ? Or do you expect different bindings for RX1 ?
> > > > > 
> > > > > The driver currently only supports RX0, but I think you are right,
> > > > > it should say RX here. This binding could be extended for RX1.
> > > > > 
> > > > > > Looking at the PHY driver, it seems to handle all PHYs with a single
> > > > > > struct device. Should we thus use #phy-cells = <1> to select the PHY ?
> > > > > 
> > > > > I am not following this. The driver handles just one PHY. Each PHY
> > > > > should have its own node.
> > > > 
> > > > Looking at the registers, it seems that the different PHYs are
> > > > intertwined and we would could have trouble handling the different PHYs
> > > > with different DT nodes and thus struct device instances.
> > > 
> > > I have to confess to not following _ALL_ of the threads, so may say
> > > something stupid, but I don't think the PHYs are intertwined so much.
> > > 
> > > Where RX0 is controlled from the "General Register Files" alone
> > > [register dumping ground for soc designers], the TX1RX1-phy
> > > actually gets controlled from inside the dsi1 register area it seems.
> > > 
> > > So in my previous (still unsucessful) tests, I was rolling with something like
> > > https://github.com/mmind/linux-rockchip/commit/e0d4b03976d2aab85a8c1630be937ea003b5df88
> > > 
> > > With the actual "logic" picked from the vendor kernel, that just double-
> > > maps the dsi1-registers in both dsi and dphy driver, which was strange.
> > 
> > Describing each PHY in its own device node (as we currently do)
> > results in:
> > 
> >         mipi_dphy_tx1rx1: mipi-dphy-tx1rx1@ff968000 {
> >                 compatible = "rockchip,rk3399-mipi-dphy";
> >                 reg = <0x0 0xff968000 0x0 0x8000>;
> >                 rockchip,grf = <&grf>;
> >         };
> 
> 0xff968000 actually really is the dsi1 controller, so we'll already
> have a node for that area. That is the reason I went that way to make
> the rockchip-dsi optionally also behave as phy-provider.
> 
> So when it's used in combination with drm and a panel or so it will
> behave as dsi controller, but when requested via the phy-framework
> it will expose the dphy functionality.

Doesn't RX1/TX1 also expose controls through GRF ? For instance
GRF_SOC_CON9 has a dphy_rx1_clk_inv_sel bit.

> >         grf: syscon@ff770000 {
> >                 mipi_dphy_rx0: mipi-dphy-rx0 {
> >                         compatible = "rockchip,rk3399-mipi-dphy";
> >                 };
> >         };
> > 
> > Which is mildly ugly, as it uses two mechanism to describe
> > the GRF resource. In addition, the driver will then _infer_
> > which device node is RX0 and which is TX1RX1, from this.
> > 
> > Perhaps Laurent's proposal, describing each PHY explicitly,
> > would be cleaner?
> 
> so I really think we shouldn't merge these two things together,
> especially to not break the dsi1 controller part.

-- 
Regards,

Laurent Pinchart
