Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E27B0220C16
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2020 13:47:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729906AbgGOLrN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jul 2020 07:47:13 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:37027 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729546AbgGOLrL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jul 2020 07:47:11 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id D7D1240013;
        Wed, 15 Jul 2020 11:47:06 +0000 (UTC)
Date:   Wed, 15 Jul 2020 13:50:40 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, robh+dt@kernel.org,
        devicetree@vger.kernel.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        dongchun.zhu@mediatek.com, linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>
Subject: Re: [PATCH v2 0/3] dt-bidings: media: ov5647 bindings + small fix
Message-ID: <20200715115040.xic3tzprlxxtbvbf@uno.localdomain>
References: <20200714142856.58365-1-jacopo+renesas@jmondi.org>
 <CAPY8ntAmNoLBumgrwFqLtBU_zHAgxOW6=KY=fDndJtXC42F6XA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntAmNoLBumgrwFqLtBU_zHAgxOW6=KY=fDndJtXC42F6XA@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

On Wed, Jul 15, 2020 at 12:07:16PM +0100, Dave Stevenson wrote:
> Hi Jacopo
>
> On Tue, 14 Jul 2020 at 15:25, Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> >
> > I have added Rob's tag to patches [1/3] and [2/3].
> >
> > I have added to patch [1/3] an entry for the yaml binding file to MAINTAINERS
> > and added a new patch which removes the existing maintainers of the driver,
> > as his email address bounces back, and replaced it with myself.
> >
> > I hope this is not rude, but I have no way to contact Luis Oliveira and
> > ask him, and a bouncing email is not that helpful.
> >
> > Dave, would you like to be added as maintainer as well, as this sensor
> > is the one used by the RPi Camera Module v1 ?
>
> I'm happy to be. I had said I would to Sakari when he went to orphan
> it, but I didn't get around to sending the email (I've not set up git
> send-email since recent changes to our email setup).

I'll then add your name there.

Thanks
  j

>
>   Dave
>
> > Thanks
> >   j
> >
> > Jacopo Mondi (3):
> >   dt-bindings: media: ov5647: Convert to json-schema
> >   dt-bindings: media: i2c: Document 'remote-endpoint'
> >   media: MAINTAINERS: ov5647: Add myself as maintainer
> >
> >  .../devicetree/bindings/media/i2c/imx219.yaml |  5 ++
> >  .../devicetree/bindings/media/i2c/ov5647.txt  | 35 --------
> >  .../devicetree/bindings/media/i2c/ov5647.yaml | 82 +++++++++++++++++++
> >  .../devicetree/bindings/media/i2c/ov8856.yaml |  5 ++
> >  MAINTAINERS                                   |  3 +-
> >  5 files changed, 94 insertions(+), 36 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov5647.txt
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov5647.yaml
> >
> > --
> > 2.27.0
> >
