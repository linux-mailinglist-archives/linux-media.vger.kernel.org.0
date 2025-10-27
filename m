Return-Path: <linux-media+bounces-45634-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13501C0C3C9
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 09:09:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B92AF3A5B65
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 08:08:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB9652E7199;
	Mon, 27 Oct 2025 08:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W7xw1EM4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BBC2DF706;
	Mon, 27 Oct 2025 08:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761552528; cv=none; b=DMYeP3IEiOyDgiSgOt28ptbDJu9qrmbHVNHiqs73x/k2JkYYVLfVQMAS6gdR326xSvRdTLMlZcmL+TWVJ75jzHjfp3wQQsethJbJMRQZ561YgZ9dwLmZr/GSrXLvH6V74jgUfKDp0Z9FxdLULo9VMSRBDU0FcvE7NzKOvsnH/6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761552528; c=relaxed/simple;
	bh=YcQY+sb9by68e/ghelh68UmYn8yBJemTa+gthGrgaWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KVx3zRH3FMTLNrq31YFgawhPNYIyN/3+iCT6oRw4Ik96ImvFr9RImyQv8AcOO7VofKmY8eOktvEovG3OHlExBca9fvZZdUpueN38/bDcqXFNnEiOysv+haNah2JAgxOvEETGmjIuntAtMCWEb9EzMfrMsSXAO4xv9MCABz0bm4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W7xw1EM4; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761552526; x=1793088526;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YcQY+sb9by68e/ghelh68UmYn8yBJemTa+gthGrgaWo=;
  b=W7xw1EM4wkpi75F/qKhBEOYsWMbtgrqTQPCPCj0NS8otAfgjALPv7PGk
   baV8L2dAAdWur3EmTWzHlNeO3u2kd6jiYrsYYMJQrO4FfLKlcH04PPBjj
   uNMepNm1aqX/hTsL7Y4BtGJtnZ0WaVk2E2Ni1bf3sluu9T9QDJ3ZEaa3t
   uQ7zo8Dm6bIhANVwgRcPWDCo+yQ+pJsRpF6yh5FtSFRCI3AC6Vlb9T50n
   9OMfltTeRLVdM0EX1VT+vzc+3dS3IfreT82rJdq9h9JCy9/ER/68j1H/H
   7Z5mUgcAMBX2JRrh/+eOHUammEVOxT2y66lr1AWitvA6rklNf43coHOiZ
   A==;
X-CSE-ConnectionGUID: B4dBH7TJSDmwHbsNTQI8Ng==
X-CSE-MsgGUID: NuV+f4FYRuWjW2z/rulVUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63516855"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="63516855"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 01:08:46 -0700
X-CSE-ConnectionGUID: UTU4X3wrToybhy/mbYBciA==
X-CSE-MsgGUID: VBcxquuMQOmdnpja3yEBKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="185067813"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.253])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 01:08:44 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 220F2121E4A;
	Mon, 27 Oct 2025 10:08:41 +0200 (EET)
Date: Mon, 27 Oct 2025 10:08:41 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Frank Li <Frank.Li@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" <linux-media@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/1] media: dt-bindings: video-interfaces: add
 video-interfaces.h information
Message-ID: <aP8oibCu-UsOFtNX@kekkonen.localdomain>
References: <20251021154922.2874390-1-Frank.Li@nxp.com>
 <20251026184933.GB1025@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251026184933.GB1025@pendragon.ideasonboard.com>

Hi Laurent,

On Sun, Oct 26, 2025 at 08:49:33PM +0200, Laurent Pinchart wrote:
> Hi Frank,
> 
> Thank you for the patch.
> 
> On Tue, Oct 21, 2025 at 11:49:22AM -0400, Frank Li wrote:
> > Mention include/dt-bindings/media/video-interfaces.h in descriptions to
> > help avoid use hardcode in dts.
> > 
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > changes in v2
> > - update commit message "mention ..."
> > - use full path include/dt-bindings/media/video-interfaces.h
> > ---
> >  Documentation/devicetree/bindings/media/video-interfaces.yaml | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/video-interfaces.yaml b/Documentation/devicetree/bindings/media/video-interfaces.yaml
> > index 038e85b45befa..6ed4695cacf7e 100644
> > --- a/Documentation/devicetree/bindings/media/video-interfaces.yaml
> > +++ b/Documentation/devicetree/bindings/media/video-interfaces.yaml
> > @@ -95,7 +95,7 @@ properties:
> >        - 6 # BT.656
> >        - 7 # DPI
> 
> I wondered if we should reference the macros here as well:
> 
>     enum:
>       - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
>       - 2 # MEDIA_BUS_TYPE_CSI1
>       - 3 # MEDIA_BUS_TYPE_CCP2
>       - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
>       - 5 # MEDIA_BUS_TYPE_PARALLEL
>       - 6 # MEDIA_BUS_TYPE_BT656
>       - 7 # DPI
> 
> (Annoyingly we don't have a macro for DPI.)

I'd actually add one: there's certainly no harm from doing so even though
it's for display, not for cameras (or receivers alike).

This patch is already in my tree so the macro name comments should go to a
new one.

> 
> This can be done separately if desired, so
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks!

-- 
Sakari Ailus

