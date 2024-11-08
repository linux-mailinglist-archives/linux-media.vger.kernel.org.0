Return-Path: <linux-media+bounces-21186-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 978A19C224B
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 17:43:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57F4F286071
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 16:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3468B194C79;
	Fri,  8 Nov 2024 16:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cCFbyM06"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350C319259B;
	Fri,  8 Nov 2024 16:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731084171; cv=none; b=S3hmGdwk7kvOj0xrtCFll0n2TncPcTwzCeoK/hbDP/Y5ty1lH8+s68SwQrxWLiPzT6QbwFAQCbGumZlLemMIPOfCBi39ApCsKj3fpoxaFXNbCK3JOxqAaYaqDu05dv7S9qZEqP+b2N4dKl7Eg7Pa5T87sai6le9l40UJXngAVZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731084171; c=relaxed/simple;
	bh=cOmuK2V6e26P4LG6w0QT/uZUCTVSlPFetUCXqWcQrW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=msDWYLjZEqoKLoutHIRucfikE3jT6EUnKurk520qZkSIJombF154FHd/zJXVuPJoT9cG9UFbD8wukc+FNZ56TtquB3AqZV/uoWvKd1JrofA6XwaeQNDFoRfNce4snn2jf15Bkxo6+vizk4RY+Fz1ezAkRAkUhGBuyQoJmkOuPl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cCFbyM06; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731084170; x=1762620170;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cOmuK2V6e26P4LG6w0QT/uZUCTVSlPFetUCXqWcQrW0=;
  b=cCFbyM06qrJJxFRMfd1Zuwrv05HggxRLSc1+s1s2KjXdN4/Ho9zIBK6z
   LZ581dD6elO2ZQbJKLtbuVd/5G7aVOJm0b/+XH4kIH/sUiuoPzt0ceXGq
   ohX6M1suwPrO8dHgmGTW5PJLfQTlZ8mdmws99nNfxRrUe02hezxWBeTDf
   M68sFTDp87mawZ1q+NL0nBkmKhvUra6MCFPmXaWLCH02aRySaMljQuNON
   7kg8hl1hh4yIBCfrVZ3A0SobG82k3sd1/1w3Tei8SLlxyzLqWl9yfJEK9
   9fW/q20C+XaSxrsnb+19d41SOn2o8wIajT+aPNeCIhe55cK+MSlrIajvH
   w==;
X-CSE-ConnectionGUID: U5JKE7YTRf6rYwYp5NfkRw==
X-CSE-MsgGUID: AUC1A/8LR3+d9EIEfzlKsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="41592616"
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; 
   d="scan'208";a="41592616"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 08:42:50 -0800
X-CSE-ConnectionGUID: 3fzmy1E0THegMuQl6d+ioA==
X-CSE-MsgGUID: +fIBl4ktQpqDO1teULJE3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; 
   d="scan'208";a="90746105"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 08:42:48 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 353BB11F9BF;
	Fri,  8 Nov 2024 18:42:45 +0200 (EET)
Date: Fri, 8 Nov 2024 16:42:45 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v1 1/1] media: ov7251: Remap "reset" to "enable" for
 OV7251
Message-ID: <Zy4_hR9AsDhmK5MK@kekkonen.localdomain>
References: <20241108145024.1490536-1-andriy.shevchenko@linux.intel.com>
 <Zy43D7wAZLrBDtiX@kekkonen.localdomain>
 <Zy48Fc_nUceCs3PK@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zy48Fc_nUceCs3PK@smile.fi.intel.com>

Hi Andy,

On Fri, Nov 08, 2024 at 06:28:05PM +0200, Andy Shevchenko wrote:
> On Fri, Nov 08, 2024 at 04:06:39PM +0000, Sakari Ailus wrote:
> > On Fri, Nov 08, 2024 at 04:50:24PM +0200, Andy Shevchenko wrote:
> > > The driver of OmniVision OV7251 expects "enable" pin instead of "reset".
> > > Remap "reset" to "enable" and update polarity.
> > > 
> > > In particular, the Linux kernel can't load the camera sensor
> > > driver on Microsoft Surface Book without this change:
> > > 
> > >  ov7251 i2c-INT347E:00: supply vdddo not found, using dummy regulator
> > >  ov7251 i2c-INT347E:00: supply vddd not found, using dummy regulator
> > >  ov7251 i2c-INT347E:00: supply vdda not found, using dummy regulator
> > >  ov7251 i2c-INT347E:00: cannot get enable gpio
> > >  ov7251 i2c-INT347E:00: probe with driver ov7251 failed with error -2
> 
> ...
> 
> > Should this be cc'd to stable? I guess it's not exactly a fix in the driver
> > but a BIOS bug, but it can be worked around in the driver. :-)
> 
> It's everything, but a BIOS bug, it's DT bug and whoever first introduced that
> GPIO in the driver. Even in the DT present in kernel the pin was referred as

How is that a DT (binding?) bug?

> CAM_RST_N, which is exactly how this patch names it.
> 
> OTOH it's a fix to the driver that never worked for ACPI case, so there never
> was a regression to fix.

It probably worked just fine, just not with that Surface Book.

The polarity of the enable gpio appears to be set wrong in devm_gpiod_get()
call. I can post a patch but cannot test it.

Similarly, you should actually set the flags to GPIOD_OUT_HIGH as reset
should be enabled here -- it's disabled only in power_on() as part of the
power-on sequence.

-- 
Regards,

Sakari Ailus

