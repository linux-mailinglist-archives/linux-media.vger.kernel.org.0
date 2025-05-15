Return-Path: <linux-media+bounces-32596-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 396A1AB888A
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 15:52:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08EA13A9479
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 13:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55BB517A2E6;
	Thu, 15 May 2025 13:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BgtnVlkF"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D0561FCE;
	Thu, 15 May 2025 13:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747317106; cv=none; b=HuDOysybKkHRTPmndNVGKMM90xXNCc5sTOuUSbuKpd+itAQwdxlpW4hw6+uv7VUKjh60XlsJe1S9ptTuGar0TQp1DqCqZQMd338fk5NIecISQejIrAZGtXkW3wCpZNQqCefW/I+8nlwdEaOEyjxsduGQkOhzFbB6P0584CwoUOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747317106; c=relaxed/simple;
	bh=DrqOcpYY6iSo+bqo7rbRmtWp3pEawZuMUwYrphaP4OQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q8r6spm64n5qWZFdCkVZj6VNXF5egvdPZF8L0qc9jqa3AkyB+7f1jBheecfVvAMnCZjUzgRlF06u2xKP8X//rft98fx/NS9CXyQ1kZoTZA2V8OlhWhU1Ng2D45NFzYm64ciTiYJqzg2rsgeoWkua8RqFYvlV8Ru13PuL9C4+oWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BgtnVlkF; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747317105; x=1778853105;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DrqOcpYY6iSo+bqo7rbRmtWp3pEawZuMUwYrphaP4OQ=;
  b=BgtnVlkF+w9YZPzFcs3PtSv40pvQAz+jZeb44ZEzcvrH9Q4GIK3WFwXR
   6pm8fbdRwE3aqgpowDsNjvb8fmd6rDAKSe3s3zezgbyvWjD/xX/DrnUla
   7UTU8LJDXp9piNBT1daI8dLP1esOdhWPQ1+K2Qi8ITdmNu0je+KYhFtuI
   B+Wu6wHPIStALYpQdud8CnFi/7uUDaKOtvd01/dhtDL1HUlD8euMOGk4D
   GPsKrL4E07dwXPOqHGRIPJkEv7spL0sEqExtdtt2schvL/sBxkWcTt7cp
   31XU1hsvh3M/JA2LFVpwQQ5RGpUVO8c+vkxCDPRyAuihDSda7S+1N397H
   g==;
X-CSE-ConnectionGUID: KALY+lD8Q/CppssPxoMAAA==
X-CSE-MsgGUID: TIlKxcEgSIesL0sDE79+Dw==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="59907351"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="59907351"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 06:51:44 -0700
X-CSE-ConnectionGUID: +hI/IbhwRSO5IY0GtRV8Ew==
X-CSE-MsgGUID: ff/CqJhVSHauVZUCBDtDxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="143262650"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.5])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 06:51:40 -0700
Date: Thu, 15 May 2025 15:51:33 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, sakari.ailus@linux.intel.com, 
	tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com, hverkuil@xs4all.nl, 
	kieran.bingham@ideasonboard.com, naush@raspberrypi.com, mchehab@kernel.org, 
	dave.stevenson@raspberrypi.com, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v4] media: v4l2-common: Add a helper for obtaining
 the clock producer
Message-ID: <2egx7hakxleahk5o3ngydrcgtlnpgpdj4kgcijfij2bmss7u4d@2yho4udpzjtm>
References: <20250321130329.342236-1-mehdi.djait@linux.intel.com>
 <f467e4a8-fcb2-4345-b8f7-7557c1a7552b@redhat.com>
 <20250515084403.GQ23592@pendragon.ideasonboard.com>
 <id2ikiio23ahslghpx56niwxrvaqdgmrgk3k647i3u27cptqgz@hwqrkdvljd3b>
 <20250515124050.GA12492@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515124050.GA12492@pendragon.ideasonboard.com>

Hi Laurent,

On Thu, May 15, 2025 at 02:40:50PM +0200, Laurent Pinchart wrote:
> On Thu, May 15, 2025 at 11:17:37AM +0200, Mehdi Djait wrote:
> > On Thu, May 15, 2025 at 10:44:03AM +0200, Laurent Pinchart wrote:
> > > On Sat, May 10, 2025 at 04:21:09PM +0200, Hans de Goede wrote:
> > > > On 21-Mar-25 2:03 PM, Mehdi Djait wrote:
> > > > > Introduce a helper for v4l2 sensor drivers on both DT- and ACPI-based
> > > > > platforms to retrieve a reference to the clock producer from firmware.
> > > > > 
> > > > > This helper behaves the same as clk_get_optional() except where there is
> > > > > no clock producer like in ACPI-based platforms.
> > > > > 
> > > > > For ACPI-based platforms the function will read the "clock-frequency"
> > > > > ACPI _DSD property and register a fixed frequency clock with the frequency
> > > > > indicated in the property.
> > > > > 
> > > > > Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> > > > 
> > > > This certainly looks quite useful, thank you for working
> > > > on this.
> > > > 
> > > > Note on some IPU3 platforms where the clk is provided by
> > > > a clk-generator which is part of a special sensor-PMIC
> > > > the situation is a bit more complicated.
> > > > 
> > > > Basically if there is both a clk provider and a clock-frequency
> > > > property then the clock-frequency value should be set as freq
> > > > to the clk-provider, see:
> > > > 
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/i2c/ov8865.c#n3020
> > > > 
> > > > for an example of a driver which handles this case.
> > > 
> > > On a side note, the DT bindings for the OV8865 doesn't specify the
> > > clock-frequency property...
> > 
> > Is this wrong ?
> > 
> > The OV8865 driver was introduced for DT-based systems, where you will
> > get a reference to the "struct clk corresponding to the clock producer"
> > and then get the clock-rate/frequency with a call to:
> > 
> > 	rate = clk_get_rate(sensor->extclk);
> > 
> > The patch "73dcffeb2ff9 media: i2c: Support 19.2MHz input clock in ov8865"
> > adding support for clock-frequency came later to support ACPI-based
> > systems (IPU3 here)
> 
> I'd expect all device properties to be documented in DT bindings. Is
> that an incorrect assumption ?
> 

I am actually genuinely asking, is the clock-frequency a device property
of the ov8865 camera sensor or the clock source, which is a separate device ?

Example the imx258 with a fixed-clock, which has its own compatible
and DT bindings under bindings/clock/fixed-clock.yaml

So when adding support for ACPI-based systems, the DT bindings should
not be changed because getting the clock-frequency from the ACPI _DSD
property is a workaround only needed on ACPI-based systems.

    i2c {
        #address-cells = <1>;
        #size-cells = <0>;

        sensor@6c {
            compatible = "sony,imx258";
            reg = <0x6c>;
            clocks = <&imx258_clk>;

            port {
                endpoint {
                    remote-endpoint = <&csi1_ep>;
                    data-lanes = <1 2 3 4>;
                    link-frequencies = /bits/ 64 <320000000>;
                };
            };
        };
    };

    /* Oscillator on the camera board */
    imx258_clk: clk {
        compatible = "fixed-clock";
        #clock-cells = <0>;
        clock-frequency = <19200000>;
    };

--
Kind Regards
Mehdi Djait

