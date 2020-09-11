Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E2FF265CAE
	for <lists+linux-media@lfdr.de>; Fri, 11 Sep 2020 11:42:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725774AbgIKJml (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Sep 2020 05:42:41 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:34065 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725710AbgIKJmk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Sep 2020 05:42:40 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 08DF9FF803;
        Fri, 11 Sep 2020 09:42:34 +0000 (UTC)
Date:   Fri, 11 Sep 2020 11:46:24 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 2/3] dt-bindings: media: ov772x: Make bus-type
 mandatory
Message-ID: <20200911094624.5k7aqkyf37zjblwt@uno.localdomain>
References: <20200910162055.614089-1-jacopo+renesas@jmondi.org>
 <20200910162055.614089-3-jacopo+renesas@jmondi.org>
 <20200911053757.GF6566@paasikivi.fi.intel.com>
 <20200911085837.kyxx3p465ovowcel@uno.localdomain>
 <OSBPR01MB5048CACE31FB094F753F4F55AA240@OSBPR01MB5048.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <OSBPR01MB5048CACE31FB094F753F4F55AA240@OSBPR01MB5048.jpnprd01.prod.outlook.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar,

On Fri, Sep 11, 2020 at 08:59:13AM +0000, Prabhakar Mahadev Lad wrote:
> Hi Jacopo,
>
> > -----Original Message-----
> > From: Jacopo Mondi <jacopo@jmondi.org>
> > Sent: 11 September 2020 09:59
> > To: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>; robh+dt@kernel.org; devicetree@vger.kernel.org; linux-media@vger.kernel.org; Lad,
> > Prabhakar <prabhakar.csengg@gmail.com>; mchehab@kernel.org; hverkuil-cisco@xs4all.nl; laurent.pinchart@ideasonboard.com; linux-
> > renesas-soc@vger.kernel.org; Rob Herring <robh@kernel.org>; Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Subject: Re: [PATCH v5 2/3] dt-bindings: media: ov772x: Make bus-type mandatory
> >
> > Hi Sakari,
> >
> > On Fri, Sep 11, 2020 at 08:37:57AM +0300, Sakari Ailus wrote:
> > > Hi Jacopo,
> > >
> > > On Thu, Sep 10, 2020 at 06:20:54PM +0200, Jacopo Mondi wrote:
> > > > In order to establish required properties based on the selected
> > > > bus type, make the 'bus-type' property mandatory. As this change
> > > > documents an endpoint property, also document the 'remote-endpoint'
> > > > one now that the 'endpoint' schema has been expanded.
> > > >
> > > > Binary compatibility with existing DTB is kept as the driver does not
> > > > enforce the property to be present, and shall fall-back to default
> > > > parallel bus configuration, which was the only supported bus type, if
> > > > the property is not specified.
> > >
> > > Could you add a comment on this to the driver, so this feature isn't
> > > accidentally removed?
> >
> > Sure, can I send a patch in reply to this series to avoid a v6 ?
> If you don’t mind Ill handle this as part of bt656 additions ?

It's not an issue for me. From a process perspective it might be
better if we know that comment and this series gets merged in the same
release to avoid 'holes', but if you're confident the BT.656 series will
land at the same time please go ahead!

>
> Cheers,
> Prabhakar
>
>
> Renesas Electronics Europe GmbH, Geschaeftsfuehrer/President: Carsten Jauch, Sitz der Gesellschaft/Registered office: Duesseldorf, Arcadiastrasse 10, 40472 Duesseldorf, Germany, Handelsregister/Commercial Register: Duesseldorf, HRB 3708 USt-IDNr./Tax identification no.: DE 119353406 WEEE-Reg.-Nr./WEEE reg. no.: DE 14978647
