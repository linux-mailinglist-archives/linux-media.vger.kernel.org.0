Return-Path: <linux-media+bounces-30834-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65119A994BD
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 18:20:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C98FD1BA5272
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 16:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67D2E298CCA;
	Wed, 23 Apr 2025 15:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B9YnfKIn"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA012989AA;
	Wed, 23 Apr 2025 15:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745423303; cv=none; b=DjJn998uFCdakGx5TUDRGRLegHI7y03+BuqAQgNCVotMIicOAf94voA5VxE6rrraT8UhgKW79xnFnbADkuoClpzuXckM0prvy8JxvmbmzCAOOxijBwA3yviRVy7865lofArfU4Xzogy58d28lPJ3M7E1AngDB73OS6cCSq2yfiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745423303; c=relaxed/simple;
	bh=4WyWXiBZlLAYmPUiyPkMd/zqqMYaA8iQvgehTct4eVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q7gbViDo727oy5FJjG+Kd5IaX//B4Wwbm3+3eWuqILo3nILHmtfArbS6DI26sZCT4Z+WJRRNoJdMG25hWkaKYkLstTtq0D2EL9fOlDWIu436q8j9+9cApzZbxPdcWV9X0SVFKrZpgzcE6Y0NFWC/Qvg/1Cpe7+hZKDK5nzY+68Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B9YnfKIn; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745423302; x=1776959302;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=4WyWXiBZlLAYmPUiyPkMd/zqqMYaA8iQvgehTct4eVI=;
  b=B9YnfKIn4nmHR8kfQbvejmCwBbbzS3ZM5uBfL3CLYjpHq5CJuJSKHB3b
   dfa2QRzbPgkRO+x6YggZaI80oKl4w7f0IMiCytCkRJuzJ3ElQvaPcq/De
   idfYraYizuOVyYrCgsuOp078mhgv4uMOb5thuRkZ5rZxBLBk89PvAI8vV
   170VeolI3Im6/7+Tn/ogpPI8V48yyIrWxu23BJI37lQbFthXsvE6HHyI+
   CwcvCHdG4SUt2M2/5YWPneeX36KwFxZ1etmwNr3eYjFubCQUCMXYtfy29
   5W5cmFgFKTmjCeoFRTQu9IMS9/iSPMoLHFqvoHzVBbaLOIkObRxOsNTGX
   w==;
X-CSE-ConnectionGUID: aVTBtnZHQC+HJR1ETrZiqw==
X-CSE-MsgGUID: 1gvgl+CCTi+tMfa1WEq1eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="46258024"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="46258024"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 08:48:21 -0700
X-CSE-ConnectionGUID: ypmLoP8WSymIQf+IK0oKGg==
X-CSE-MsgGUID: UUyQ1S+FR/KyGISpmBtYhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="169560586"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 08:48:19 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id C4DF511F9FE;
	Wed, 23 Apr 2025 18:48:12 +0300 (EEST)
Date: Wed, 23 Apr 2025 15:48:12 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] media: i2c: Add driver for ST VD55G1 camera sensor
Message-ID: <aAkLvCqsJ9Tf-O2d@kekkonen.localdomain>
References: <20250404-b4-vd55g1-v5-0-98f2f02eec59@foss.st.com>
 <20250404-b4-vd55g1-v5-2-98f2f02eec59@foss.st.com>
 <20250422150746.GA23173@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250422150746.GA23173@pendragon.ideasonboard.com>

Hi Laurent,

On Tue, Apr 22, 2025 at 06:07:46PM +0300, Laurent Pinchart wrote:
> Hi Benjamin,
> 
> Thank you for the patch.
> 
> On Fri, Apr 04, 2025 at 04:50:52PM +0200, Benjamin Mugnier wrote:
> > The VD55G1 is a monochrome global shutter camera with a 804x704 maximum
> > resolution with RAW8 and RAW10 bytes per pixel.
> > The driver supports :
> > - Auto exposure from the sensor, or manual exposure mode
> > - HDR subtraction mode, allowing edge detection and background removal
> > - Auto exposure cold start, using configuration values from last stream
> > to start the next one
> > - LED GPIOs for illumination
> > - Most standard camera sensor features (hblank, vblank, test patterns,
> > again, dgain, hflip, vflip, auto exposure bias, etc.)
> > Add driver source code to MAINTAINERS file.
> > 
> > Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> > ---
> >  MAINTAINERS                |    2 +
> >  drivers/media/i2c/Kconfig  |   11 +
> >  drivers/media/i2c/Makefile |    1 +
> >  drivers/media/i2c/vd55g1.c | 2005 ++++++++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 2019 insertions(+)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 4f5e9005063a157de69e81b10f8def9da9e6c04c..9991c5f63e3d49a4e7a6ef0071f3b81825e84eee 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -22416,6 +22416,7 @@ M:	Sylvain Petinot <sylvain.petinot@foss.st.com>
> >  L:	linux-media@vger.kernel.org
> >  S:	Maintained
> >  F:	Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
> > +F:	drivers/media/i2c/vd55g1.c
> >  
> >  ST VGXY61 DRIVER
> >  M:	Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> > @@ -24801,6 +24802,7 @@ F:	drivers/media/i2c/mt*
> >  F:	drivers/media/i2c/og*
> >  F:	drivers/media/i2c/ov*
> >  F:	drivers/media/i2c/s5*
> > +F:	drivers/media/i2c/vd55g1.c
> >  F:	drivers/media/i2c/vgxy61.c
> 
> I suppose that
> 
> F:	drivers/media/i2c/v*
> 
> would be too broad. Sakari, is it time to create a sensors subdirectory
> (not as a prerequisite for this series of course) ?

Good question. Right now everything is arranged according to the bus the
device attaches to, and camera sensors are practically all I²C devices. I
do anticipate to get some I3C devices in the future, but it's been slow.

Would you create a new directory for cameras under i2c? Should the same be
done to various bridge chips, TV tuners and the few flash controller
drivers we have left?

I don't have much of an opinion on this right now. While the current
arrangement requires some care when changing MAINTAINERS, it works for me.

-- 
Regards,

Sakari Ailus

