Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54682229381
	for <lists+linux-media@lfdr.de>; Wed, 22 Jul 2020 10:31:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726930AbgGVIbO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jul 2020 04:31:14 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:58349 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726317AbgGVIbO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jul 2020 04:31:14 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 73EA8FF808;
        Wed, 22 Jul 2020 08:31:09 +0000 (UTC)
Date:   Wed, 22 Jul 2020 10:34:47 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 02/13] arm64: dts: qcom: apq8016-sbc: Fix CSI-2 lanes
 routing
Message-ID: <20200722083447.ilffgfhpktcbdobz@uno.localdomain>
References: <20200717132859.237120-1-jacopo+renesas@jmondi.org>
 <20200717132859.237120-3-jacopo+renesas@jmondi.org>
 <20200717193509.GD5961@pendragon.ideasonboard.com>
 <CAMZdPi-wOmbMi-BxB31HoDhcBSxoSnFssceb=KR2Q=SeU9rN=w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMZdPi-wOmbMi-BxB31HoDhcBSxoSnFssceb=KR2Q=SeU9rN=w@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Loic,

On Wed, Jul 22, 2020 at 10:14:52AM +0200, Loic Poulain wrote:
> On Fri, 17 Jul 2020 at 21:35, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > Hi Jacopo,
> >
> > On Fri, Jul 17, 2020 at 03:28:48PM +0200, Jacopo Mondi wrote:
> > > The ov5640 sensor does not support lanes reconfiguration according
> > > to version of the datasheet I have (version 2.03) and the driver
> > > does not parse the properties to try to reconfigure them.
> > >
> > > Fix the properties values in the camera and cci node.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > ---
> > > Loic, I see you added the camera nodes in
> > > 39e0ce6cd1bf ("arm64: dts: qcom: apq8016-sbc: Add CCI/Sensor nodes")
> > >
> > > Do you have any idea how lanes could be swapped if, from my understanding,
> > > nor the sensor nor the driver supports that ?
> >
> > It's not supported on the OV5640 side, so I think the second hunk of
> > this patch is correct, but I believe that the CAMSS supports lane
> > reordering, so the first hunk is likely incorrect and should be dropped.
>
> Indeed, camss supports lane configuration (cf camss_of_parse_endpoint_node).
> The sensor doesn't, so that can be removed on its side.

I removed both as I assumed otherwise lanes assignement doesn't match,
unless there's some lanes re-routing happening in between the two.

I'll drop the property from ov5640 node only.

Thanks
  j

>
> Regards,
> Loic
>
> >
> > > ---
> > >  arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi | 8 ++++----
> > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> > > index 8a4b790aa7ff..fe6613676e45 100644
> > > --- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> > > @@ -591,8 +591,8 @@ ports {
> > >               port@0 {
> > >                       reg = <0>;
> > >                       csiphy0_ep: endpoint {
> > > -                             clock-lanes = <1>;
> > > -                             data-lanes = <0 2>;
> > > +                             clock-lanes = <0>;
> > > +                             data-lanes = <1 2>;
> > >                               remote-endpoint = <&ov5640_ep>;
> > >                               status = "okay";
> > >                       };
> > > @@ -627,8 +627,8 @@ camera_rear@3b {
> > >
> > >               port {
> > >                       ov5640_ep: endpoint {
> > > -                             clock-lanes = <1>;
> > > -                             data-lanes = <0 2>;
> > > +                             clock-lanes = <0>;
> > > +                             data-lanes = <1 2>;
> > >                               remote-endpoint = <&csiphy0_ep>;
> > >                       };
> > >               };
> >
> > --
> > Regards,
> >
> > Laurent Pinchart
