Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2204725D315
	for <lists+linux-media@lfdr.de>; Fri,  4 Sep 2020 09:59:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729659AbgIDH7h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Sep 2020 03:59:37 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:49601 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728118AbgIDH7Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Sep 2020 03:59:24 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 144031BF206;
        Fri,  4 Sep 2020 07:59:15 +0000 (UTC)
Date:   Fri, 4 Sep 2020 10:03:02 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hverkuil-cisco@xs4all.nl, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 0/3] dt-bindings: media: i2c: Convert 3 sensor bindings
Message-ID: <20200904080302.47yshw6z6n33xh7k@uno.localdomain>
References: <20200903115143.13717-1-jacopo+renesas@jmondi.org>
 <20200903211420.GF6492@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200903211420.GF6492@pendragon.ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Fri, Sep 04, 2020 at 12:14:20AM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
>
> On Thu, Sep 03, 2020 at 01:51:40PM +0200, Jacopo Mondi wrote:
> > I know I've sent the previous version first as part of a longer list of patches,
> > later individually, and now grouped together again. Sorry for the fuss, hope
> > it's not too confusing.
> >
> > These three sensor bindings conversions go together as they all happen in a
> > single patch, so I deemed it was easier to just group them.
> >
> > In v4 after finalizing the discussion with Laurent and Rob on how to handle
> > of-graph endpoint, I have dropped them from mt9v111 and imx274. For imx214 as I
> > have endpoint properties to document I have also documented 'endpoint' (not
> > mandatory) and 'remote-endpoint' (mandatory). Hope I got the outcome of the
> > discussion right. For imx214 I also took in Laurent's suggestion on how to
> > document the 'data-lanes' supported values.
>
> I think you can drop remote-endpoint, it will be defined in
> of-graph.yaml. Apart from that, it sounds good to me.
>

Will I ever get this right ? Should we record the policy to document
endpoints until we don't have an of-graph.yaml to avoid other to have
go through 5 iterations to do it right ?

On this patch:
I owe an updated to the imx274 patch but I'm waiting for this
discussion to get somewhere (you're welcome to step-in :)
https://patchwork.linuxtv.org/project/linux-media/patch/1599012278-10203-3-git-send-email-skomatineni@nvidia.com/

Then I'll re-send a v5

> > Individual maintainers cc-ed per-patch.
> >
> > Jacopo Mondi (3):
> >   dt-bindings: media: mt9v111: Convert to json-schema
> >   dt-bindings: media: imx274: Convert to json-schema
> >   dt-bindings: media: imx214: Convert to json-schema
> >
> >  .../bindings/media/i2c/aptina,mt9v111.txt     |  46 ------
> >  .../bindings/media/i2c/aptina,mt9v111.yaml    |  75 ++++++++++
> >  .../devicetree/bindings/media/i2c/imx274.txt  |  38 -----
> >  .../bindings/media/i2c/sony,imx214.txt        |  53 -------
> >  .../bindings/media/i2c/sony,imx214.yaml       | 137 ++++++++++++++++++
> >  .../bindings/media/i2c/sony,imx274.yaml       |  59 ++++++++
> >  MAINTAINERS                                   |   6 +-
> >  7 files changed, 274 insertions(+), 140 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/media/i2c/aptina,mt9v111.txt
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/aptina,mt9v111.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/media/i2c/imx274.txt
> >  delete mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx214.txt
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml
>
> --
> Regards,
>
> Laurent Pinchart
