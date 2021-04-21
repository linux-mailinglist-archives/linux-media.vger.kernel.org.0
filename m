Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF86036684F
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 11:43:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238506AbhDUJoT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 05:44:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238011AbhDUJoS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 05:44:18 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7E3AC06174A;
        Wed, 21 Apr 2021 02:43:45 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D6D053EE;
        Wed, 21 Apr 2021 11:43:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618998224;
        bh=fXSQ7uuE6rzA5EIycOaFjl7JThIRYMSIJXndP2xp+zg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dyESnYF9tGHS4Ek3mTThk18jPFrq3PczHy2J1/P4uGx6Iwr6h81Q4/dTl6CWYx5Nx
         so3UhbPpENCLtZBFNi2I2fq7ayLShkITfhAFoC9OmuXLHU3fXcM3fF3VXIu+IM9Ssx
         PVFttaBiGRxtF+AOK4Ek2oUsqcQ1DXFSJhyvNSX8=
Date:   Wed, 21 Apr 2021 12:43:39 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: dt-bindings: media: renesas,csi2: Node port@0 is
 not mandatory
Message-ID: <YH/zyzfgpmXvkDpB@pendragon.ideasonboard.com>
References: <20210413155346.2471776-1-niklas.soderlund+renesas@ragnatech.se>
 <YHiPWPTjWeEQ522E@pendragon.ideasonboard.com>
 <YHlFWvVBps2vYnPM@oden.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YHlFWvVBps2vYnPM@oden.dyn.berto.se>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Fri, Apr 16, 2021 at 10:05:46AM +0200, Niklas Söderlund wrote:
> On 2021-04-15 22:09:12 +0300, Laurent Pinchart wrote:
> > On Tue, Apr 13, 2021 at 05:53:46PM +0200, Niklas Söderlund wrote:
> > > When converting the binding to use the video-interfaces schemas the node
> > > port@0 was incorrectly made a mandatory property.
> > > 
> > > The port@0 node describes which CSI-2 transmitter the R-Car CSI-2
> > > receiver is connected too. Not all boards connects all CSI-2 receivers
> > > to an CSI-2 transmitter.
> > 
> > Ports are properties of the device, they should always be there,
> > regardless of connections. It's the endpoints that describe connections.
> 
> I understand what you are saying and if that is the way things are done 
> I'm fine with it. As this was brought to light by a recent change in the 
> bindings I wish to understand if this was always the case the bindings 
> have been wrong all along or not.
> 
> I only ask as because if we keep the port@0 mandatory there will be 
> board files that needs to add empty port@0 nodes as we know they are not 
> used. And as the media bindings are already quiet large for some Renesas 
> boards I want to understand this before spewing out a lot of patches 
> adding empty nodes ;-)

In my opinion port@0 should be in the SoC .dtsi, not in the board .dts.
Individual boards can then add endpoints when the CSI-2 receiver is
connected. Would that make sense for you ?

> > > Fixes: 066a94e28a23e04c ("media: dt-bindings: media: Use graph and video-interfaces schemas")
> > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > ---
> > >  Documentation/devicetree/bindings/media/renesas,csi2.yaml | 1 -
> > >  1 file changed, 1 deletion(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/media/renesas,csi2.yaml b/Documentation/devicetree/bindings/media/renesas,csi2.yaml
> > > index 20396f1be9993461..395484807dd5ed47 100644
> > > --- a/Documentation/devicetree/bindings/media/renesas,csi2.yaml
> > > +++ b/Documentation/devicetree/bindings/media/renesas,csi2.yaml
> > > @@ -78,7 +78,6 @@ properties:
> > >            modules connected the CSI-2 receiver.
> > >  
> > >      required:
> > > -      - port@0
> > >        - port@1
> > >  
> > >  required:

-- 
Regards,

Laurent Pinchart
