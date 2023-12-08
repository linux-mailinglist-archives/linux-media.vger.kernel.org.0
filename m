Return-Path: <linux-media+bounces-2024-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7152380AD58
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 20:48:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A117F1C20C84
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 19:48:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D7F15026C;
	Fri,  8 Dec 2023 19:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RJA2R3Wa"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B0EE1729;
	Fri,  8 Dec 2023 11:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702064880; x=1733600880;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yRbHQ00il7PGLZKlUCjgwKSdfXhQB8Ozw+ap9tZaQOQ=;
  b=RJA2R3WaMPCaSCanvoA+qMDWUVHzGe9L4lNPJVuXpLdwLvjM9e3ljc/O
   oBX02dGRhpSn3COWnM2j+n9+5zmkUHO080BgC2rIHyaKAk+QHOFgMlsSq
   zePEewT64FA4oQnmeDQ3HrE7BJUpmbnRI+GPd5Ricg8dbJ5w5Mz0Z+YEr
   ryOMBW2bNCmtmaBy93GmkAL51u9529VQdNI86oRmSAB0J3WNdShoEJuEi
   J3nBpXjBoCFH4t/iQeR83GeYy9IgjAGy9w7QHfTXsHa8ZKlcNycMX9pVL
   4AzcWAZGcaZSs9pY2NDKFVaQpS9boyw/3dbB+u9wAbz4OG8gdgJAcB3rt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="393320789"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; 
   d="scan'208";a="393320789"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 11:47:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="890244949"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; 
   d="scan'208";a="890244949"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 11:47:57 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 7DE3011F995;
	Fri,  8 Dec 2023 21:47:54 +0200 (EET)
Date: Fri, 8 Dec 2023 19:47:54 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Maxime Ripard <mripard@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: dt-bindings: ov8856: decouple lanes and link
 frequency from driver
Message-ID: <ZXNy6iGhgP6HZqKJ@kekkonen.localdomain>
References: <20231207142356.100453-1-krzysztof.kozlowski@linaro.org>
 <ZXNbTUg3QrCwKBpp@kekkonen.localdomain>
 <ce8a7040-2667-4046-8542-f698bd8a9af1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ce8a7040-2667-4046-8542-f698bd8a9af1@linaro.org>

On Fri, Dec 08, 2023 at 08:37:10PM +0100, Krzysztof Kozlowski wrote:
> On 08/12/2023 19:07, Sakari Ailus wrote:
> > Hi Krzysztof,
> > 
> > Thanks for the update.
> > 
> > On Thu, Dec 07, 2023 at 03:23:56PM +0100, Krzysztof Kozlowski wrote:
> >> The data lanes and link frequency were set to match exiting Linux driver
> >> limitations, however bindings should be independent of chosen Linux
> >> driver support.
> >>
> >> Decouple these properties from the driver to match what is actually
> >> supported by the hardware.
> >>
> >> This also fixes DTS example:
> >>
> >>   ov8856.example.dtb: camera@10: port:endpoint:link-frequencies:0: [360000000] is too short
> >>
> >> Fixes: 066a94e28a23 ("media: dt-bindings: media: Use graph and video-interfaces schemas")
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>
> >> ---
> >>
> >> Changes in v2:
> >> 1. Rework approach: decouple bindings from driver instead of fixing
> >>    DTS example (Sakari)
> >> ---
> >>  .../devicetree/bindings/media/i2c/ov8856.yaml | 21 +++++++++++--------
> >>  1 file changed, 12 insertions(+), 9 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/media/i2c/ov8856.yaml b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> >> index 57f5e48fd8e0..71102a71cf81 100644
> >> --- a/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> >> +++ b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> >> @@ -67,19 +67,22 @@ properties:
> >>  
> >>          properties:
> >>            data-lanes:
> >> -            description: |-
> >> -              The driver only supports four-lane operation.
> >> -            items:
> >> -              - const: 1
> >> -              - const: 2
> >> -              - const: 3
> >> -              - const: 4
> >> +            oneOf:
> >> +              - items:
> >> +                  - const: 1
> >> +              - items:
> >> +                  - const: 1
> >> +                  - const: 2
> >> +              - items:
> >> +                  - const: 1
> >> +                  - const: 2
> >> +                  - const: 3
> >> +                  - const: 4
> >>  
> >>            link-frequencies:
> >>              description: Frequencies listed are driver, not h/w limitations.
> > 
> > This should be dropped, too.
> 
> Ack, I forgot.
> 
> > 
> >> -            maxItems: 2
> >>              items:
> >> -              enum: [ 360000000, 180000000 ]
> >> +              enum: [ 1440000000, 720000000, 360000000, 180000000 ]
> > 
> > These frequencies are listed in the datasheet but they're just an
> > example---the sensor hardware isn't limited to these, the resulting
> > frequency on the CSI-2 bus is simply up to the external clock frequency and
> > PLL configuration. I'd remove the values here altogether.
> 
> Hm, are you sure? Isn't it quite difficult to program device to any
> frequency? But if that's not the case here, I can drop it.

The driver doesn't currently do that, no, but that doesn't mean the
hardware wouldn't support that. There are a few sensor drivers that
calculate the PLL configuration, such as ccs and ov5640.

I'd drop it as it's indeed a driver, not a device limitation.

-- 
Sakari Ailus

