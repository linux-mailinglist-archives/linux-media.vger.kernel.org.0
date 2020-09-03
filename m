Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6662725C6D7
	for <lists+linux-media@lfdr.de>; Thu,  3 Sep 2020 18:31:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728654AbgICQbr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Sep 2020 12:31:47 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:33289 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726292AbgICQbp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Sep 2020 12:31:45 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id BC3CD60002;
        Thu,  3 Sep 2020 16:31:39 +0000 (UTC)
Date:   Thu, 3 Sep 2020 18:35:25 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        sakari.ailus@iki.fi, hverkuil@xs4all.nl, jacopo+renesas@jmondi.org,
        luca@lucaceresoli.net, leonl@leopardimaging.com,
        robh+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] dt-bindings: media: imx274: Add optional input
 clock and supplies
Message-ID: <20200903163525.p5z2adhp4wq453bs@uno.localdomain>
References: <1599012278-10203-1-git-send-email-skomatineni@nvidia.com>
 <1599012278-10203-3-git-send-email-skomatineni@nvidia.com>
 <20200903125542.nxiafnysatoexken@uno.localdomain>
 <d3a1843c-5d73-cfa6-9611-405b905ddcd1@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d3a1843c-5d73-cfa6-9611-405b905ddcd1@nvidia.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sowjanya,

On Thu, Sep 03, 2020 at 09:05:27AM -0700, Sowjanya Komatineni wrote:
>
> On 9/3/20 5:55 AM, Jacopo Mondi wrote:
> > Hello Sowjanya,
> >
> > On Tue, Sep 01, 2020 at 07:04:37PM -0700, Sowjanya Komatineni wrote:
> > > This patch adds IMX274 optional external clock input and voltage
> > > supplies to device tree bindings.
> > >
> > > Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
> > > Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> > > ---
> > >   .../devicetree/bindings/media/i2c/sony,imx274.yaml  | 21 +++++++++++++++++++++
> > >   1 file changed, 21 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml
> > > index 7ae47a6..57e7176 100644
> > > --- a/Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml
> > > +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml
> > > @@ -25,6 +25,27 @@ properties:
> > >     reset-gpios:
> > >       maxItems: 1
> > >
> > I just sent an update to my json-schema conversion of this bindings
> > document (not yet on patchwork, sorry) and Sakari pointed me to the
> > fact in between my v2 and my v4 this patch from you went in:
> > 4ea3273d24b ("dt-bindings: media: imx274: Add optional input clock and supplies")
> >
> > I should probably now update my bindings conversion patch, basically
> > taking in what you've done here, but I would have one question.
> >
> > > +  clocks:
> > > +    maxItems: 1
> > > +    description: Reference to the sensor input clock
> > > +
> > > +  clock-names:
> > > +    maxItems: 1
> > > +    items:
> > > +      - const: inck
> > > +
> > > +  vana-supply:
> > > +    description:
> > > +      Analog voltage supply, 2.8 volts
> > > +
> > > +  vdig-supply:
> > > +    description:
> > > +      Digital IO voltage supply, 1.8 volts
> > > +
> > > +  vddl-supply:
> > > +    description:
> > > +      Digital core voltage supply, 1.2 volts
> > 4ea3273d24b introduced these regulators as VANA-supply, VDIG-supply
> > and VDDL-supply (please note the upper-case names). This version uses
> > lower-case ones instead. Is this intentional ? The driver currently
> > does not parse any of these if I'm not mistaken, but as the bindings
> > in textual form defines an ABI which should be preserved during the
> > conversion to json-schema, should these be kept in upper-case ?
> >
> > Thanks
> >     j
>
> Yes, based on feedback lower case was recommended. So, changed to use
> lower-case names.
>
> These properties were not used by driver currently and from my prior series
> only dt-binding got merged as  no feedback was received on it for all prior
> versions.
>
> So, should be ok to change to lower-case as there properties are introduced
> now and driver update using these properties is under review
>

Well, I see that patch went in v5.9-rc1, so it will be part of v5.9.

If the bindings update goes in in v5.10 (or whatever comes after v5.9)
then we have a problem, as the DTB created for v5.9 won't work anymore
on any later version, and that should not happen. Alternatively, a fix
for the next -rc release could be fast-tracked, but you would
need to synchronize with the dt maintainers for that and make a patch
for the existing .txt bindings file.

If the name change happens in the yaml file and one release is made
with the old names, then we're stuck with those forever and ever, if I
got the situation right.

Please check with the dt and media maintainers, or they can comment
here if they glance through these lines.

Thanks
  j

> > > +
> > >     port:
> > >       type: object
> > >       description: |
> > > --
> > > 2.7.4
> > >
