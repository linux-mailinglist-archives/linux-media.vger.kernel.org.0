Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C71922DC2BC
	for <lists+linux-media@lfdr.de>; Wed, 16 Dec 2020 16:08:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726237AbgLPPIf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Dec 2020 10:08:35 -0500
Received: from mout.gmx.net ([212.227.17.20]:37333 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725878AbgLPPIf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Dec 2020 10:08:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1608131216;
        bh=0Mxtf1m4JbBeKNdc0dADWe1cE6qvEFwhrDWcQ4UYmJc=;
        h=X-UI-Sender-Class:Date:From:To:cc:Subject:In-Reply-To:References;
        b=aeJk43EZJu8nCRWurpfCHkPoE0ciFPOkpJKA8NS9ygdz+yhqF1zUCFCAG2ADdKNE6
         Qzk6UvHOMEwMMF10jONC8Wjwq4WVCbdUk/c84JdlNNWzH9X56kX5B+2brtwca6E15G
         zKCQe80bdASlYLt6j0SqXEpfmC61emnTOZEaPiBk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from axis700.grange ([87.79.50.253]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MDQic-1kys461NBe-00ATBa; Wed, 16
 Dec 2020 16:06:56 +0100
Received: by axis700.grange (Postfix, from userid 1000)
        id DEE4961F51; Wed, 16 Dec 2020 16:06:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by axis700.grange (Postfix) with ESMTP id C5D8F616B7;
        Wed, 16 Dec 2020 16:06:54 +0100 (CET)
Date:   Wed, 16 Dec 2020 16:06:54 +0100 (CET)
From:   Guennadi Liakhovetski <g.liakhovetski@gmx.de>
X-X-Sender: lyakh@axis700.grange
To:     Rob Herring <robh@kernel.org>
cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2 1/2] media: dt-bindings: Convert video-interfaces.txt
 properties to schemas
In-Reply-To: <20201216141210.GB651087@robh.at.kernel.org>
Message-ID: <alpine.DEB.2.20.2012161605110.17656@axis700.grange>
References: <20201210211625.3070388-1-robh@kernel.org> <20201210211625.3070388-2-robh@kernel.org> <alpine.DEB.2.20.2012161113060.15676@axis700.grange> <20201216141210.GB651087@robh.at.kernel.org>
User-Agent: Alpine 2.20 (DEB 67 2015-01-07)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Provags-ID: V03:K1:Y8tsCGu8N/VT319T01N6iPvC8BeBUDCRTi2OKpL6EMPuKoVWvFx
 RnRdio7A4vFb2ArpEKq1DTKqzCcaeQNfxX4XRu1aXwQy+bnrTZ9Lrh703GWJe2SVpi8qukj
 49fB1TxZq626Lgwo6dPeFmFS1YptRMyZYEs2cZOv56WCX5eVrqpjk8peHHJJCY5qYWZzpmy
 ScgzzsKGqOKpslwthpRsQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:R+pITJ5tPIQ=:7iXQK5jVv3ZfTtbrwzhqly
 54iEazIA0szeWR3tEdN/s2SrSoo+Zqcb21xchhEgxBkcHu8el8wAlFXDIZOFViPlLHue0mws2
 ySHNEsDIH9TYfn1ocmZG7jAJnoMQNBeJZjFaNY0RyStTHQkP4TV1ksOcozbPd89nmLbZgvRcj
 C++Fm8YqNpbU6mpYgPjHp6kuH54/uc845sIAjbAot+TKEE4UuyEDqQhr/EOFaBTkEiOL+tYkB
 SiE3X7Gclx7PhkaSGvhPVx+QVWO0YEPlTAfx+3y89KzG0ilhuzJ2qmrkB8Q4GZjtEVYav8fhF
 OaamhblJcS8PwFTO9bW8SjtuvtGMxIqJ5hHCy3qYX4wj6MW+ypQ5vn4OYuOJBInCc19p3GjiE
 E1HNlwwN8JX9Ov1FycVofCXWmoaujYrQbjMw1ZTQnfjVW23Z3dlxfu4jgIBuMWZC+8OsbJEL5
 CtHydYXHAhIo74Zk76M77G4RynmGk1sJ67jY3t2hTckMN+/R51VoaYcOat3/6O77EnDqANVBM
 kYOuE5uXgPnsKic+curQXUX0AiV2dyjZNuctZEAebuKtMzgDq6ISsNr5uUEImgDlxnSo2mxTp
 3FKkSsdZpOrCfaZO1HGGO45UKfF8Af0YbmoPdI4Orw2ySfPLbwRipwosGDF7MPO3byix+j3ys
 MwxNjYPioYSPoLRSpxuZ0x0U97OgvD95dUd5DSjiku1egcEDbNIwQ3oUk5CyPn+npo3QyiQ8M
 vD48YLtJ1Uig6SQevAZ8RBC848JoF0xX95gyf5oYGstRrJh357Ut1+eymsCaHg3oICHWRlf85
 K9P12U4eyUo1GLUUR95SPUu6eTJe7FKadQw/2Dc7RoJQfgPKAVRYHdKKscscfhY0I+Drmu23V
 cP3u9OU1hF/mCu3vdoRA==
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 16 Dec 2020, Rob Herring wrote:

> On Wed, Dec 16, 2020 at 11:18:03AM +0100, Guennadi Liakhovetski wrote:
> > Hi Rob,
> >
> > Sorry for the delay! I didn't realise my ack was required for this pat=
ch.
> > I won't object against the licence change, but please don't add me as =
a
> > maintainer of
>
> Okay, so that's an Ack?

A conditional one, yes. You'll have to send a new version of this your
patch without me among maintainers, to that version you can add

Acked-by: Guennadi Liakhovetski <g.liakhovetski@gmx.de>

Thanks
Guennadi

> > On Thu, 10 Dec 2020, Rob Herring wrote:
> >
> > [snip]
> >
> > > diff --git a/Documentation/devicetree/bindings/media/video-interface=
s.yaml b/Documentation/devicetree/bindings/media/video-interfaces.yaml
> > > new file mode 100644
> > > index 000000000000..7415a4df1576
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/video-interfaces.yaml
> > > @@ -0,0 +1,344 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/video-interfaces.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Common bindings for video receiver and transmitter interface=
 endpoints
> > > +
> > > +maintainers:
> > > +  - Guennadi Liakhovetski <g.liakhovetski@gmx.de>
> >
> > I did commit the original version of
> > Documentation/devicetree/bindings/media/video-interfaces.txt but that =
was
> > more than 8 years ago, I haven't worked in media / V4L for several yea=
rs
> > now, so, I don't think I can meaningfully maintain that file now.
>
> Okay, I'll drop you.
>
> Anyone else want to sign up? Laurent?
>
> Rob
>
