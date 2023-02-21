Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9844A69E0BB
	for <lists+linux-media@lfdr.de>; Tue, 21 Feb 2023 13:48:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230202AbjBUMso (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Feb 2023 07:48:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233489AbjBUMsk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Feb 2023 07:48:40 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C895C3595;
        Tue, 21 Feb 2023 04:48:22 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 140E2519;
        Tue, 21 Feb 2023 13:48:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676983701;
        bh=92SGzzXXowAiCNzfDsVMTyZZXu8ho+adWw8J/+Bd3OA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TqtbnfQ96LQYY5FGsxqNrA7Hf75DXhBIEy6+afsrA0UzoPzYNs5oed4CHs1Wx37Nj
         YeeIbjp6IQkeGW04rIRWPmPoNgVUtAVdDqypaM7rVjYjJWZKsMqwy7qE+vMREylPjP
         8XUpHhc7oyZdzjksNMejXvam2iJ9xNAAoG3AZxDM=
Date:   Tue, 21 Feb 2023 14:48:19 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] media: dt-bindings: media: i2c: Add MT9M114
 camera sensor binding
Message-ID: <Y/S9kx33unHSQpfl@pendragon.ideasonboard.com>
References: <20220207012055.15158-1-laurent.pinchart@ideasonboard.com>
 <20220207012055.15158-2-laurent.pinchart@ideasonboard.com>
 <YgKfdR72TNavj68v@paasikivi.fi.intel.com>
 <YgK6xAgAVHUSsQND@pendragon.ideasonboard.com>
 <YggZqM81nCJcv4vZ@paasikivi.fi.intel.com>
 <YggwuBlEmjzhxYt1@pendragon.ideasonboard.com>
 <Y/QHzsYzwDG2uclC@pendragon.ideasonboard.com>
 <Y/S8N0c8W/qQtjOj@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y/S8N0c8W/qQtjOj@kekkonen.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Tue, Feb 21, 2023 at 02:42:31PM +0200, Sakari Ailus wrote:
> On Tue, Feb 21, 2023 at 01:52:46AM +0200, Laurent Pinchart wrote:
> > > > > > > +        properties:
> > > > > > > +          bus-type:
> > > > > > > +            enum: [4, 5, 6]
> > > > > > 
> > > > > > With bus-type 5, shouldn't you have the parallel interface sync signal
> > > > > > polarity properties? Possibly also others if the hardware supports them.
> > > > > 
> > > > > As far as I can tell, the hardware has fixed polarities for all signals.
> > > > > Both hsync and vsync (called LINE_VALID and FRAME_VALID here) are active
> > > > > high.
> > > > 
> > > > Right, then you won't need these.
> > > > 
> > > > What about the link-frequencies property?
> > > 
> > > That's something I've meant to ask, should the link-frequencies property
> > > be specified for parallel buses too, or only CSI-2 ?
> > 
> > Any feedback on this ?
> 
> Yes.
> 
> It very likely matters there as well but probably less so than on CSI-2.
> 
> link-frequencies isn't specific to CSI-2 either.
> 
> > > We also need to document how a DT writer should select the link
> > > frequencies. The process is complicated, saying that the property is
> > > required without explaining how the values can be computed (EMC
> > > constraints aside, just from a functional point of view) isn't nice. If
> > > you explain this to me, I can put it in a patch :-)
> > 
> > Or on this ? :-)
> 
> Generally the hardware people will tell you this when it matters. :-) But
> on a development board you can probably have anything the hardware
> supports.
> 
> I guess we could add a few words on this to e.g.
> Documentation/driver-api/media/camera-sensor.rst .

Please :-) When the sensor driver supports multiple link frequencies,
and in particular a continuous range of frequencies, I want a document I
can point people to precisely answer the "I have no idea about those
stuff, what value do I put in my device tree?" question. It should
include a clear procedure to calculate a value, not just a generic
statement along the lines of "pick a value that is suitable for you".

> Most drivers will support a few frequencies only and sometimes the vendor,
> due to someone needing it, provides another configuration with a different
> frequency. Many sensors also have datasheets that are precise enough to
> calculate this yourself.

-- 
Regards,

Laurent Pinchart
