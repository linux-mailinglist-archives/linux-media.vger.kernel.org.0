Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFA14261368
	for <lists+linux-media@lfdr.de>; Tue,  8 Sep 2020 17:21:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730346AbgIHPTz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Sep 2020 11:19:55 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:51082 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730287AbgIHPTS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Sep 2020 11:19:18 -0400
Received: from relay6-d.mail.gandi.net (unknown [217.70.183.198])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 961383B1372;
        Tue,  8 Sep 2020 14:39:05 +0000 (UTC)
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 28C8EC0002;
        Tue,  8 Sep 2020 14:31:09 +0000 (UTC)
Date:   Tue, 8 Sep 2020 16:34:59 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, hverkuil@xs4all.nl,
        jacopo+renesas@jmondi.org, luca@lucaceresoli.net,
        leonl@leopardimaging.com, robh+dt@kernel.org, lgirdwood@gmail.com,
        broonie@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] dt-bindings: media: imx274: Add optional input
 clock and supplies
Message-ID: <20200908143459.cn7luzj27nhjzymt@uno.localdomain>
References: <1599012278-10203-1-git-send-email-skomatineni@nvidia.com>
 <1599012278-10203-3-git-send-email-skomatineni@nvidia.com>
 <20200903125542.nxiafnysatoexken@uno.localdomain>
 <d3a1843c-5d73-cfa6-9611-405b905ddcd1@nvidia.com>
 <20200903163525.p5z2adhp4wq453bs@uno.localdomain>
 <f38bb328-b282-783b-3ac5-5441001d10b6@nvidia.com>
 <20200908093341.GB834@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200908093341.GB834@valkosipuli.retiisi.org.uk>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari, Sowjanya,

On Tue, Sep 08, 2020 at 12:33:41PM +0300, Sakari Ailus wrote:
> On Thu, Sep 03, 2020 at 09:40:57AM -0700, Sowjanya Komatineni wrote:
> >
> > On 9/3/20 9:35 AM, Jacopo Mondi wrote:
> > > Hi Sowjanya,
> > >
> > > On Thu, Sep 03, 2020 at 09:05:27AM -0700, Sowjanya Komatineni wrote:
> > > > On 9/3/20 5:55 AM, Jacopo Mondi wrote:
> > > > > Hello Sowjanya,
> > > > >
> > > > > On Tue, Sep 01, 2020 at 07:04:37PM -0700, Sowjanya Komatineni wrote:
> > > > > > This patch adds IMX274 optional external clock input and voltage
> > > > > > supplies to device tree bindings.
> > > > > >
> > > > > > Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
> > > > > > Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> > > > > > ---
> > > > > >    .../devicetree/bindings/media/i2c/sony,imx274.yaml  | 21 +++++++++++++++++++++
> > > > > >    1 file changed, 21 insertions(+)
> > > > > >
> > > > > > diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml
> > > > > > index 7ae47a6..57e7176 100644
> > > > > > --- a/Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml
> > > > > > +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml
> > > > > > @@ -25,6 +25,27 @@ properties:
> > > > > >      reset-gpios:
> > > > > >        maxItems: 1
> > > > > >
> > > > > I just sent an update to my json-schema conversion of this bindings
> > > > > document (not yet on patchwork, sorry) and Sakari pointed me to the
> > > > > fact in between my v2 and my v4 this patch from you went in:
> > > > > 4ea3273d24b ("dt-bindings: media: imx274: Add optional input clock and supplies")
> > > > >
> > > > > I should probably now update my bindings conversion patch, basically
> > > > > taking in what you've done here, but I would have one question.
> > > > >
> > > > > > +  clocks:
> > > > > > +    maxItems: 1
> > > > > > +    description: Reference to the sensor input clock
> > > > > > +
> > > > > > +  clock-names:
> > > > > > +    maxItems: 1
> > > > > > +    items:
> > > > > > +      - const: inck
> > > > > > +
> > > > > > +  vana-supply:
> > > > > > +    description:
> > > > > > +      Analog voltage supply, 2.8 volts
> > > > > > +
> > > > > > +  vdig-supply:
> > > > > > +    description:
> > > > > > +      Digital IO voltage supply, 1.8 volts
> > > > > > +
> > > > > > +  vddl-supply:
> > > > > > +    description:
> > > > > > +      Digital core voltage supply, 1.2 volts
> > > > > 4ea3273d24b introduced these regulators as VANA-supply, VDIG-supply
> > > > > and VDDL-supply (please note the upper-case names). This version uses
> > > > > lower-case ones instead. Is this intentional ? The driver currently
> > > > > does not parse any of these if I'm not mistaken, but as the bindings
> > > > > in textual form defines an ABI which should be preserved during the
> > > > > conversion to json-schema, should these be kept in upper-case ?
> > > > >
> > > > > Thanks
> > > > >      j
> > > > Yes, based on feedback lower case was recommended. So, changed to use
> > > > lower-case names.
> > > >
> > > > These properties were not used by driver currently and from my prior series
> > > > only dt-binding got merged as  no feedback was received on it for all prior
> > > > versions.
> > > >
> > > > So, should be ok to change to lower-case as there properties are introduced
> > > > now and driver update using these properties is under review
> > > >
> > > Well, I see that patch went in v5.9-rc1, so it will be part of v5.9.
> > >
> > > If the bindings update goes in in v5.10 (or whatever comes after v5.9)
> > > then we have a problem, as the DTB created for v5.9 won't work anymore
> > > on any later version, and that should not happen. Alternatively, a fix
> > > for the next -rc release could be fast-tracked, but you would
> > > need to synchronize with the dt maintainers for that and make a patch
> > > for the existing .txt bindings file.
> > >
> > > If the name change happens in the yaml file and one release is made
> > > with the old names, then we're stuck with those forever and ever, if I
> > > got the situation right.
> > >
> > > Please check with the dt and media maintainers, or they can comment
> > > here if they glance through these lines.
> > >
> > > Thanks
> > >    j
> >
> > Hi Leon Luo,
> >
> > I used upper case for regulator supply names in all prior 4 versions of
> > IMX274 patch series as I see some other media i2c drivers doing it and
> > dt-binding patch from v3 got merged in 5.9-rc1 which was using upper-case.
> >
> > Later received feedback from Sakari requesting to use lower-case names so
> > updated to use lower case name now in v5.
> >
> > Not sure if we have timeline to squeeze in patch to change names to
> > lower-case before they get into 5.10.
> >
> > Can you please comment?
>
> We can merge patches through the fixes branch if needed. That is not an
> issue.
>

Good! So I'll make a v5 of the json-schema bindings soon that includes
the lower-case supplies and clock names and let's merge it as a fix in
this release cycle.

Sowjanya is this ok with you ?
Sakari, I'll then trust you to fast-track the patch if no other
issues!

Thanks
  j

> >
> > Sakari,
> >
> > Can you also help understand why can't we keep upper case for regulator
> > supplies?
> >
> > I see some other media i2c drivers using upper case as well.
>
> The vast majority of bindings use lower case, that's it, simply.
>
> --
> Regards,
>
> Sakari Ailus
