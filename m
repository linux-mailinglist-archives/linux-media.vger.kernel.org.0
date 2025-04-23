Return-Path: <linux-media+bounces-30796-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0976AA989B6
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 14:24:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F05C63BC572
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 12:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4902E217709;
	Wed, 23 Apr 2025 12:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VRwyAnWG"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B323262FC6;
	Wed, 23 Apr 2025 12:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745411064; cv=none; b=FyOEDBqboY/RRlMmEN46Zp4OqkRgTXdrEZpIJWVyd9MAvXLEN+pL3XhukEIApE00x5CmGCwuEqurtAH8zydV79gQ8y51BCwOqyZZ5uABDzMAqQF18mVBLf+Xd2Rn0mj5DhQ0iDz5DeZSS0C0p3mlJ3AtlFnQSngNNSaqNiGS1ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745411064; c=relaxed/simple;
	bh=J5Uj4zApAgSWIs2Z1zPphWhwvi7rWKbh4gi47KrbqXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NTBawr4IUKn73xwAZOvSP8ggliCIcX03onEFaqfJIOAC2dcire9vGiyAWMnXON57Y7J6hmcRJlc5UIk5JaYuRP0PJJwYkmJfcENLJ7LPdKIUztUxyRxrIZRPudYaPKYW6tWbDG4omTDECFnWD4KptLNiE4nDcouDktyV/AsBtHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VRwyAnWG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9F7521AE2;
	Wed, 23 Apr 2025 14:24:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745411059;
	bh=J5Uj4zApAgSWIs2Z1zPphWhwvi7rWKbh4gi47KrbqXg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VRwyAnWGu0VJjccG89WkUoIrKRRitkyur4DbD1YuMbyS96DLV4koHQAAbDFmmSGU+
	 vE3uGVbjl7I1heVAq3ttO5AUTH7g4ahN9wk2IejATFhYIoiToGOI4ZGjUcnUdrw9yr
	 ANTG7l5moNCEg1wIkJVnI2v/cY92WCBIADBCxSXI=
Date: Wed, 23 Apr 2025 15:24:18 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/7] dt-bindings: media: renesas,isp: Add ISP core
 function block
Message-ID: <20250423122418.GF17813@pendragon.ideasonboard.com>
References: <20250421111240.789510-1-niklas.soderlund+renesas@ragnatech.se>
 <20250421111240.789510-2-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdVJ=KaF-sJEga9kLbdFdkhKDGDPkacTOn-D-2E7dQY7dw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdVJ=KaF-sJEga9kLbdFdkhKDGDPkacTOn-D-2E7dQY7dw@mail.gmail.com>

On Wed, Apr 23, 2025 at 01:24:25PM +0200, Geert Uytterhoeven wrote:
> On Mon, 21 Apr 2025 at 13:12, Niklas Söderlund wrote:
> > Some R-Car ISP instances have in addition to the channel selector (CS)
> > an ISP core (CORE )to perform operations on an image stream. The core
> > function is mapped to a different memory region and have a separate
> > interrupt then CS, extend the bindings to allow describing this.
> >
> > On the same SoC different instances of the ISP IP may have, or not have,
> > the CORE functionality. The CS function on all instances on the SoC are
> > the same and the documentation describes the full ISP (CS + CORE) as a
> > single IP block. Where instances not having the CORE function simple
> > lacking the functionality to modify the image data. There dependencies
> > on the CS functionality while operating the CORE functionality.
> >
> > In order for the ISP core to function in memory-to-memory mode it needs
> > to be feed input data from a Streaming Bridge interface. This interface
> > is provided thru the VSP-X device. Add an optional new property
> > "renesas,vspx" to provide a phandle to describe this relationship.
> >
> > While adding mandatory reg-names and interrupt-names breaks existing
> > bindings the driver itself remains backward compatible and provides CS
> > functionality if a single unnamed reg and interrupt property is present.
> > Furthermore all existing users of the bindings are updated in following
> > work to add these new mandatory properties.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> > * Changes since v1
> > - Extend the commit message to make it explicit that different ISP
> >   instances on the same SoC (same compatible value) can have, or not
> >   have, a CORE function block attached.
> > - Update documentation for renesas,vspx property.
> > - Update example to cover all new properties.
> 
> Thanks for the update!
> 
> > --- a/Documentation/devicetree/bindings/media/renesas,isp.yaml
> > +++ b/Documentation/devicetree/bindings/media/renesas,isp.yaml
> 
> > @@ -119,11 +159,18 @@ examples:
> >
> >      isp1: isp@fed20000 {
> >              compatible = "renesas,r8a779a0-isp", "renesas,rcar-gen4-isp";
> > -            reg = <0xfed20000 0x10000>;
> > -            interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
> > -            clocks = <&cpg CPG_MOD 613>;
> > +            reg = <0xfed20000 0x10000>, <0xfee00000 0x10000>;
> 
> IThe second size should be 0x100000.
> 
> > +            reg-names = "cs", "core";
> > +            interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>,
> > +                         <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
> > +            interrupt-names = "cs", "core";
> > +            clocks = <&cpg CPG_MOD 613>, <&cpg CPG_MOD 17>;
> > +            clock-names = "cs", "core";
> >              power-domains = <&sysc R8A779A0_PD_A3ISP01>;
> 
> With the above and the wording issues pointed out by Laurent fixed:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Once we get a review from the DT bindings maintainers for this patch,
I'll take the next version addressing the small issues in my tree for
1/7 and 5/7 to 7/7. I'll let Geert merge 2/7 to 4/7.

-- 
Regards,

Laurent Pinchart

