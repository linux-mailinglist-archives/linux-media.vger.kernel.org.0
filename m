Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA5F7295030
	for <lists+linux-media@lfdr.de>; Wed, 21 Oct 2020 17:52:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2444166AbgJUPwK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Oct 2020 11:52:10 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:58925 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731691AbgJUPwK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Oct 2020 11:52:10 -0400
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 35F4C100006;
        Wed, 21 Oct 2020 15:52:05 +0000 (UTC)
Date:   Wed, 21 Oct 2020 17:52:04 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>, sakari.ailus@linux.intel.com,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: ov2680: convert bindings to yaml
Message-ID: <20201021155204.off4fdyr2heuuhho@uno.localdomain>
References: <20201014142759.726823-1-rmfrfs@gmail.com>
 <20201014142759.726823-2-rmfrfs@gmail.com>
 <20201015144905.4b23k5uy7ycuhvlo@uno.localdomain>
 <20201016144204.3viee7spmvwtms5i@arch-thunder.localdomain>
 <20201019203359.GA3550266@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201019203359.GA3550266@bogus>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rob,

On Mon, Oct 19, 2020 at 03:33:59PM -0500, Rob Herring wrote:
> On Fri, Oct 16, 2020 at 03:42:04PM +0100, Rui Miguel Silva wrote:
> > Hey Jacopo,
> > Thanks for the review.
> >
> > On Thu, Oct 15, 2020 at 04:49:05PM +0200, Jacopo Mondi wrote:
> > > Hi Rui,
> > >
> > > On Wed, Oct 14, 2020 at 03:27:57PM +0100, Rui Miguel Silva wrote:
> > > > Convert ov2680 sensor bindings documentation to yaml schema, remove
> > > > the textual bindings document and update MAINTAINERS entry.
> > > >
> > > > Signed-off-by: Rui Miguel Silva <rmfrfs@gmail.com>
>
> > > > +  clock-names:
> > > > +    description:
> > >
> > > I'll never get yaml right, doesn't breaking lines require '|' after
> > > the semicolon ? The validator does not complain, so I guess not.
> >
> > I also had that idea, but looking also to other cases, and also in the
> > examlpe-schema where you have both cases, looks like it is not needed.
>
> '|' will preserve line breaks and formatting. For a single line like
> this it doesn't really matter. Though ruamel's round trip will make it a
> single line when writing back out.

Thanks for the explanation.

I'll take the occasion to ask the difference between '|', '|-' and
'-|' as I haven't find it documented anywhere.

Thanks
  j

>
> > >
> > > > +      Input clock for the sensor.
>
> Really, you can just drop the description. Doesn't really add anything
> specific for this device.
>
> > > > +    items:
> > > > +      - const: xvclk
