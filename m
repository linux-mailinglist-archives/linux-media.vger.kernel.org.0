Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 645CA2F74D7
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 10:04:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726451AbhAOJDy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 04:03:54 -0500
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:37033 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725995AbhAOJDy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 04:03:54 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 15FED1C0017;
        Fri, 15 Jan 2021 09:03:07 +0000 (UTC)
Date:   Fri, 15 Jan 2021 10:03:26 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        roman.kovalivskyi@globallogic.com,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        naush@raspberrypi.com, Eugeniu Rosca <erosca@de.adit-jv.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4 01/30] dt-bindings: media: i2c: Rename ov5647.yaml
Message-ID: <20210115090326.qufukw5cd73ansby@uno.localdomain>
References: <20201119161956.756455-1-jacopo@jmondi.org>
 <20201119161956.756455-2-jacopo@jmondi.org>
 <20201125091526.GI3940@paasikivi.fi.intel.com>
 <CAL_JsqLfdGumeicqqhkfn5K40GaXX93NuNZTOpgcCLycHmVQbg@mail.gmail.com>
 <20201222095025.GS26370@paasikivi.fi.intel.com>
 <CAL_JsqL6e3Ko=gwPZj6SeFHofiebeR3-HzsEHcNiXrabruJtLA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAL_JsqL6e3Ko=gwPZj6SeFHofiebeR3-HzsEHcNiXrabruJtLA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Ups,

   I'll fix. A question for Mauro though

On Thu, Jan 14, 2021 at 02:20:34PM -0600, Rob Herring wrote:
> On Tue, Dec 22, 2020 at 3:50 AM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > Hi Rob,
> >
> > On Mon, Dec 21, 2020 at 01:23:29PM -0700, Rob Herring wrote:
> > > On Wed, Nov 25, 2020 at 2:15 AM Sakari Ailus
> > > <sakari.ailus@linux.intel.com> wrote:
> > > >
> > > > Cc Rob + DT list.
> > >
> > > You have to resend if you really want me to see things. In this case,
> > > I don't think you need to wait on me for a rename.
> >
> > I merged the patch earlier based on the IRC discussion.
>
> Seems this landed in -next:
>
> ./Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml: $id:
> relative path/filename doesn't match actual path or filename
> expected: http://devicetree.org/schemas/media/i2c/ovti,ov5647.yaml#
>

The fix is worth a Fixes: tag, should I refer to the current commit
sha1 in linux-media/master or is there any risk for a rebase before
the tree is merged in the v5.12 merge window ?

Thanks
    j

> Rob
