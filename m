Return-Path: <linux-media+bounces-5280-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8907C857DAA
	for <lists+linux-media@lfdr.de>; Fri, 16 Feb 2024 14:28:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD2821C23AEF
	for <lists+linux-media@lfdr.de>; Fri, 16 Feb 2024 13:28:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BE6B129A98;
	Fri, 16 Feb 2024 13:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IZaZNlZ6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FBB126F20;
	Fri, 16 Feb 2024 13:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708090076; cv=none; b=M8ECGxlp91uCc7PqhCDZ2LJmHJs9b39Eh9Fz3wvtg14ZiHIFhxFgjW4uJw4koI0dpc7qlh5bXg3gAadpwAKdjcfKKWinpp0maBooI4Gq81moBF+SMfnD8DER+rpGlTr2/qNzHjo5zP0ZFeDDxXxg5mcLPv5FM7tVsrMPaQksCW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708090076; c=relaxed/simple;
	bh=DVNKQM8UzoLFRwHdVCvWTrQftXuPdsVrLp5GhIq1hdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RILRb6DgQ5elugWlfQD1r9jxUsLLIoLqRWFp8wPyDBZFhT/g7ym4P2rG5Y+g2mxxZQTxrLFVt6l0Dw0miEXHiAryFr1tPDZQ5qKWHpVHUCRVndx6PQhovtzAzPKv0+8lCV6/n0eICw6a+PGpDm3kzPZuJTumQwuD1b4ywi7ogQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IZaZNlZ6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 16E466B3;
	Fri, 16 Feb 2024 14:27:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1708090067;
	bh=DVNKQM8UzoLFRwHdVCvWTrQftXuPdsVrLp5GhIq1hdQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IZaZNlZ6uiKdIj0R95tBupynQmY8FIWAbLHlo37wQgSUDaQgV6elZgQ/tEsDjElLS
	 LsOgSP8OXEdc1zxzT5VhDuPbp6EPb9eBVUSbisUmUMQ66uJnn0Tqj4fRM0WQT8tfUn
	 tSXsPqNvEKzXRwIqlfGmCrz9s3hGRfP4RkkL1K1Q=
Date: Fri, 16 Feb 2024 15:27:55 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dan Scally <dan.scally@ideasonboard.com>
Cc: Conor Dooley <conor@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	jacopo.mondi@ideasonboard.com, nayden.kanchev@arm.com,
	robh+dt@kernel.org, mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 2/5] dt-bindings: media: Add bindings for ARM mali-c55
Message-ID: <20240216132755.GA20376@pendragon.ideasonboard.com>
References: <20240214141906.245685-1-dan.scally@ideasonboard.com>
 <20240214141906.245685-3-dan.scally@ideasonboard.com>
 <20240214142825.GA7873@pendragon.ideasonboard.com>
 <20240214-velcro-pushy-0cbd18b23361@spud>
 <20240215110205.GD7873@pendragon.ideasonboard.com>
 <e06b0792-187d-454b-aa62-d9c1e797df17@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e06b0792-187d-454b-aa62-d9c1e797df17@ideasonboard.com>

On Fri, Feb 16, 2024 at 01:09:15PM +0000, Daniel Scally wrote:
> On 15/02/2024 11:02, Laurent Pinchart wrote:
> > On Wed, Feb 14, 2024 at 05:37:17PM +0000, Conor Dooley wrote:
> >> On Wed, Feb 14, 2024 at 04:28:25PM +0200, Laurent Pinchart wrote:
> >>> On Wed, Feb 14, 2024 at 02:19:03PM +0000, Daniel Scally wrote:
> >>>> Add the yaml binding for ARM's Mali-C55 Image Signal Processor.
> >>>>
> >>>> Acked-by: Nayden Kanchev <nayden.kanchev@arm.com>
> >>>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> >>>> ---
> >>>> Changes in v2:
> >>>>
> >>>> 	- Added clocks information
> >>>> 	- Fixed the warnings raised by Rob
> >>>>
> >>>>   .../bindings/media/arm,mali-c55.yaml          | 77 +++++++++++++++++++
> >>>>   1 file changed, 77 insertions(+)
> >>>>   create mode 100644 Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/media/arm,mali-c55.yaml b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> >>>> new file mode 100644
> >>>> index 000000000000..30038cfec3a4
> >>>> --- /dev/null
> >>>> +++ b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> >>>> @@ -0,0 +1,77 @@
> >>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>>> +%YAML 1.2
> >>>> +---
> >>>> +$id: http://devicetree.org/schemas/media/arm,mali-c55.yaml#
> >>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>>> +
> >>>> +title: ARM Mali-C55 Image Signal Processor
> >>>> +
> >>>> +maintainers:
> >>>> +  - Daniel Scally <dan.scally@ideasonboard.com>
> >>>> +  - Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> >>>> +
> >>>> +properties:
> >>>> +  compatible:
> >>>> +    const: arm,mali-c55
> >>>> +
> >>>> +  reg:
> >>>> +    maxItems: 1
> >>>> +
> >>>> +  interrupts:
> >>>> +    maxItems: 1
> >>>> +
> >>>> +  clocks:
> >>>> +    items:
> >>>> +      - description: ISP video clock
> >>>
> >>> I wonder if we need this clock. Granted, it's an input clock to the ISP,
> >>> but it's part of the input video bus. I don't expect anyone would ever
> >>> need to control it manually, it should be provided by the video source
> >>> automatically.
> >>
> >> I'd say that if there's a clock controller providing this clock, even if
> >> it is implicit in the video feed it's good to have here. Being able to
> >> increment the refcount on that clock would be good, even if you don't
> >> actually control it manually?
> >
> > I don't expect there would be a clock controller to directly reference
> > in most cases. It depends a bit on where the clock domain crossing
> > between the source (often a CSI-2 receiver) and the ISP is. If it's
> > implemented in glue logic bundled with the ISP, which wouldn't be
> > described in DT as a separate node, then there's a higher chance we'll
> > have a clock controller for vclk. If it's implemented in the source,
> > vclk will just come from the source, which won't be listed as a clock
> > controller.
> >
> > One option would be to make this clock optional, by moving it to the end
> > of the clocks list, and setting
> >
> > 	minItems: 2
> > 	maxItems: 3
> >
> >>>> +      - description: ISP AXI clock
> >>>> +      - description: ISP AHB-lite clock
> >>>
> >>> These two other clocks look good to me.
> >>>
> >>>> +
> >>>> +  clock-names:
> >>>> +    items:
> >>>> +      - const: vclk
> >>>> +      - const: aclk
> >>>> +      - const: hclk
> >>
> >> Why not "video" "axi" "ahb-lite"? There's 3 useful letters between the
> >> tree clock names you've provided - they're all clocks, so having "clk"
> >> in them is just noise :)
> >
> > As far as I understand, the names proposed by Dan come directly from the
> > IP core documentation.
> 
> This is the case, but I do take Conor's point that more descriptive names might be nicer - if I'm 
> honest I just didn't think about it particularly given "Xclk" is such a common name for them 
> already, but having been poked into thinking about it I do agree.

Isn't the usual practice in DT bindings is to name GPIOs, clocks and reset
signals based on the hardware documentation ?

-- 
Regards,

Laurent Pinchart

