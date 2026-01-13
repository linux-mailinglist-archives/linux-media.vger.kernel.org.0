Return-Path: <linux-media+bounces-50622-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AC77CD1B8B7
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 23:07:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F21B6303F787
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 22:07:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61CF934F254;
	Tue, 13 Jan 2026 22:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aAPUZwzd"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3EC34FF46
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 22:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768342050; cv=none; b=YwpswUFCM49ZGByv44YRpk95ga6ObL2m30aE5Wl3n1VFoJxraIAx4JaJvbRJc9c4+6Er2aUAHwQnU2uMYC5RXr230hGH6THE0X+JRnv4snx5VEyP/JO1HO3cFBJlliol1EBgTVRLoAS9Dl740sxc+5Rd6q+C/JKTYPebvCpNpic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768342050; c=relaxed/simple;
	bh=lF1/vAw2xitF60/bBIUa2DemF/sS4dVo8tNu5HVIAc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h2qxhczUIP6eYjdO6iZ0clkKhuZK99X9wVRBLiAswPAbyUWzSg9G9gbHohx0G8hCoxGwe2leOoyF3EQO4w8Y57mAqTGHIVG1w7OKTUfBd0kom2BwBorWlCMKkRHvBl0fIhb35HiuRe45k+Rcl/DBFs/e6PV4vtKQWnwCEeoNw44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aAPUZwzd; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768342050; x=1799878050;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lF1/vAw2xitF60/bBIUa2DemF/sS4dVo8tNu5HVIAc8=;
  b=aAPUZwzdOTFfUhbVtcBtIZe2uJeo3xAVSU1LjVhOv1z8rYNYfgBkgGVN
   0c5uRZCqA8jWiiADPiE8yezbo6zgE5KZYh8Q+1OhfR6GTD9NgTByUOcX0
   r2mPgWVWZc90k/B02r1kn+FS7igwa5JWv/y2tgBbqaWOB4hWtNOFZRFNg
   01m/NxvNQ/hv7eqZodjENk2U9pvPJRAiiHe8uSV48MgeXDbX+pnlHlrtU
   ZweG0F2rER/tINpIwQOdAo+yJQQnkX0BI6T4nqRvVRlXLsCT8AH2LU7C2
   vasCRl/jCHZKCTYY5VS5rkYm0ooPWUBwnCDr8X2R+9nfeMngUGsKKw9kf
   Q==;
X-CSE-ConnectionGUID: wziZAZDtTjyqfPjw1jvmKA==
X-CSE-MsgGUID: iDrHv1+VRs2MIBnkOAYOpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="80359040"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="80359040"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 14:07:29 -0800
X-CSE-ConnectionGUID: aeysii/OSOi5kJX1Qzelag==
X-CSE-MsgGUID: AYoS88MzQaGrpApsuyhVgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="208963948"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.58])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 14:07:23 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 0F1DC120831;
	Wed, 14 Jan 2026 00:07:21 +0200 (EET)
Date: Wed, 14 Jan 2026 00:07:21 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	"Wang, Hongju" <hongju.wang@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v10 40/64] media: Documentation: Add subdev configuration
 models, raw sensor model
Message-ID: <aWbCGaFK-5STHKjz@kekkonen.localdomain>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
 <20250619115836.1946016-41-sakari.ailus@linux.intel.com>
 <b6tut2zockb2fwdmenmmrmgnmepqgzvrl2heeuqvf4wilnqfbq@afs5nzielzsc>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b6tut2zockb2fwdmenmmrmgnmepqgzvrl2heeuqvf4wilnqfbq@afs5nzielzsc>

Hi Jacopo,

On Mon, Jul 28, 2025 at 05:00:59PM +0200, Jacopo Mondi wrote:
> > +This is shown in :ref:`media_subdev_config_model_common_raw_sensor_subdev`.
> > +
> > +.. _media_subdev_config_model_common_raw_sensor_subdev:
> > +
> > +.. kernel-figure:: common-raw-sensor.svg
> > +    :alt:    common-raw-sensor.svg
> > +    :align:  center
> > +
> > +    **Common raw sensor sub-device with n pads (n == 2)**
> 
> Can we just say "2 pads" ? :)

Sounds good.

> > +Also refer to :ref:`Selection targets <v4l2-selection-targets-table>`.
> > +
> > +.. flat-table:: Selection targets on pads
> > +    :header-rows: 1
> > +
> > +    * - Pad/Stream
> > +      - Selection target/format
> > +      - Mandatory (X/-)
> > +      - Modifiable (X/-)
> > +      - Synopsis
> > +    * - 1/0
> > +      - Format
> > +      - X
> > +      - \-
> > +      - Image data format. The width and the height fields indicates the full
> > +        size of the pixel array, including non-visible pixels. The media bus
> > +        code of this format reflects the native pixel depth of the sensor.
> > +    * - 1/0
> > +      - ``V4L2_SEL_TGT_CROP_DEFAULT``
> > +      - X
> > +      - \
> 
> Other entries have an hyphen here
> 
>          - \-
> 
> Is the fact that it's missing here intentional ?

It was a bug.

> 
> nitpicks apart
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thank you!

-- 
Sakari Ailus

