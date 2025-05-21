Return-Path: <linux-media+bounces-33007-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F236EABF21E
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 12:52:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A60547A3CB6
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 10:50:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F18522609DE;
	Wed, 21 May 2025 10:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="F3vfg4hw"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C671125A2AE;
	Wed, 21 May 2025 10:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747824710; cv=none; b=a0tT060Kc13fmdcwS5frGdguoUEpK6+hpiyJOdykEF3p/xY4VFHXDaw4i4vlAzYHKS70i1zLf2I44HTqLHw2iUYPTXcAdWyKv9P/wB00QQPT6gMQX5Q4cw/1CRmLUXMM5wiu94kwAooKtI7oP+u2G3G4r/WmxAAHStbyiHvpuYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747824710; c=relaxed/simple;
	bh=nxYzDPN+X49cwc9odeFIDkMd7Y9t1SaTd72n6XudqxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UjuSpOYgwTg7kWYR9u3wxa1Bc8McQFX4nVNdOdWtmkc+Q1JnAfLbsPUbZOiDNhjAKa2JmwlbobazuaNYXLJpnMJAQQJZ9FedklADjrJTf8wcKjYdPtxPDsDZjtxQrR+LwoLfuBik86vH2R51TI+1901bpWqcR2moff4a8uNGXYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=F3vfg4hw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (179.218-130-109.adsl-dyn.isp.belgacom.be [109.130.218.179])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7658E6B5;
	Wed, 21 May 2025 12:51:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747824685;
	bh=nxYzDPN+X49cwc9odeFIDkMd7Y9t1SaTd72n6XudqxU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F3vfg4hwYqtBuOdlwPfxx3NTONcOhLLgjtrNovU+JAyX7ABU+sbVb0U3f9SMnx1x7
	 i+bBWWjR3cx0yJ2tf1NtnvUa62FdkJJCe1qY12cPiUMyRIJzISdlWRI0kYCwILxQo0
	 fenRMeqlzGWp0QquHjLcvMQ+ZvQ74rANEgubVoqE=
Date: Wed, 21 May 2025 12:51:41 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
	hverkuil@xs4all.nl, kieran.bingham@ideasonboard.com,
	naush@raspberrypi.com, mchehab@kernel.org,
	dave.stevenson@raspberrypi.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v4] media: v4l2-common: Add a helper for obtaining
 the clock producer
Message-ID: <20250521105141.GF12514@pendragon.ideasonboard.com>
References: <20250321130329.342236-1-mehdi.djait@linux.intel.com>
 <f467e4a8-fcb2-4345-b8f7-7557c1a7552b@redhat.com>
 <20250515084403.GQ23592@pendragon.ideasonboard.com>
 <id2ikiio23ahslghpx56niwxrvaqdgmrgk3k647i3u27cptqgz@hwqrkdvljd3b>
 <20250515124050.GA12492@pendragon.ideasonboard.com>
 <2egx7hakxleahk5o3ngydrcgtlnpgpdj4kgcijfij2bmss7u4d@2yho4udpzjtm>
 <aCZTi2odVXVZjJE8@svinhufvud>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aCZTi2odVXVZjJE8@svinhufvud>

On Thu, May 15, 2025 at 11:50:19PM +0300, Sakari Ailus wrote:
> On Thu, May 15, 2025 at 03:51:33PM +0200, Mehdi Djait wrote:
> > On Thu, May 15, 2025 at 02:40:50PM +0200, Laurent Pinchart wrote:
> > > On Thu, May 15, 2025 at 11:17:37AM +0200, Mehdi Djait wrote:
> > > > On Thu, May 15, 2025 at 10:44:03AM +0200, Laurent Pinchart wrote:
> > > > > On Sat, May 10, 2025 at 04:21:09PM +0200, Hans de Goede wrote:
> > > > > > On 21-Mar-25 2:03 PM, Mehdi Djait wrote:
> > > > > > > Introduce a helper for v4l2 sensor drivers on both DT- and ACPI-based
> > > > > > > platforms to retrieve a reference to the clock producer from firmware.
> > > > > > > 
> > > > > > > This helper behaves the same as clk_get_optional() except where there is
> > > > > > > no clock producer like in ACPI-based platforms.
> > > > > > > 
> > > > > > > For ACPI-based platforms the function will read the "clock-frequency"
> > > > > > > ACPI _DSD property and register a fixed frequency clock with the frequency
> > > > > > > indicated in the property.
> > > > > > > 
> > > > > > > Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> > > > > > 
> > > > > > This certainly looks quite useful, thank you for working
> > > > > > on this.
> > > > > > 
> > > > > > Note on some IPU3 platforms where the clk is provided by
> > > > > > a clk-generator which is part of a special sensor-PMIC
> > > > > > the situation is a bit more complicated.
> > > > > > 
> > > > > > Basically if there is both a clk provider and a clock-frequency
> > > > > > property then the clock-frequency value should be set as freq
> > > > > > to the clk-provider, see:
> > > > > > 
> > > > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/i2c/ov8865.c#n3020
> > > > > > 
> > > > > > for an example of a driver which handles this case.
> > > > > 
> > > > > On a side note, the DT bindings for the OV8865 doesn't specify the
> > > > > clock-frequency property...
> > > > 
> > > > Is this wrong ?
> > > > 
> > > > The OV8865 driver was introduced for DT-based systems, where you will
> > > > get a reference to the "struct clk corresponding to the clock producer"
> > > > and then get the clock-rate/frequency with a call to:
> > > > 
> > > > 	rate = clk_get_rate(sensor->extclk);
> > > > 
> > > > The patch "73dcffeb2ff9 media: i2c: Support 19.2MHz input clock in ov8865"
> > > > adding support for clock-frequency came later to support ACPI-based
> > > > systems (IPU3 here)
> > > 
> > > I'd expect all device properties to be documented in DT bindings. Is
> > > that an incorrect assumption ?
> > > 
> > 
> > I am actually genuinely asking, is the clock-frequency a device property
> > of the ov8865 camera sensor or the clock source, which is a separate device ?
> 
> The sensor's.
>
> Could we document how this is supposed to work on DT and ACPI?

Yes please. Would you like to send a patch ? :-)

> I think we should also select COMMON_CLK on ACPI systems for sensor
> drivers (in a separate patch maybe?), instead of relying on distributions
> enabling it.
> 
> > Example the imx258 with a fixed-clock, which has its own compatible
> > and DT bindings under bindings/clock/fixed-clock.yaml
> > 
> > So when adding support for ACPI-based systems, the DT bindings should
> > not be changed because getting the clock-frequency from the ACPI _DSD
> > property is a workaround only needed on ACPI-based systems.
> 
> I wouldn't say it's a workaround, but something that's only needed on ACPI
> systems.

Does that mean that the clock-frequency property should be deprecated on
DT-based systems, and not used in any new sensor bindings ?

> > 
> >     i2c {
> >         #address-cells = <1>;
> >         #size-cells = <0>;
> > 
> >         sensor@6c {
> >             compatible = "sony,imx258";
> >             reg = <0x6c>;
> >             clocks = <&imx258_clk>;
> > 
> >             port {
> >                 endpoint {
> >                     remote-endpoint = <&csi1_ep>;
> >                     data-lanes = <1 2 3 4>;
> >                     link-frequencies = /bits/ 64 <320000000>;
> >                 };
> >             };
> >         };
> >     };
> > 
> >     /* Oscillator on the camera board */
> >     imx258_clk: clk {
> >         compatible = "fixed-clock";
> >         #clock-cells = <0>;
> >         clock-frequency = <19200000>;
> >     };
> > 

-- 
Regards,

Laurent Pinchart

