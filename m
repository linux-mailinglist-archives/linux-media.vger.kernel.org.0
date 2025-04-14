Return-Path: <linux-media+bounces-30115-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A83C3A87B0C
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 10:52:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0B6E37A9232
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 08:51:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CA4325DAF4;
	Mon, 14 Apr 2025 08:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JFcGHdyZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B5225A32D;
	Mon, 14 Apr 2025 08:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744620753; cv=none; b=tpkb012BQkykIssfFf7dAgKO4Fkc9k4q5R2WYGhgXB01l+efHn+zPsWvL94fix6hadfrI7oTVtQXqu2a0MS1X6oFnbh/dAMYyRIsPsV6uD45XydGp7Agamw9I4ZVOtCWJuUUQTOnUIAa8/aeHbsx3u5WfXnmqHRtcRERdhdXBR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744620753; c=relaxed/simple;
	bh=a+UyqqBZ3qHlcRVEHyB9KT3Hd3Ym9c5aYmE1OsjWZ/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uZdIzGl5/zH8pils7v8imMJvIP5r9eB5g9ItkBYmjpUOrgo8qrhnlOV/Cuw0StxdQ5NhkQg1Q5RYAPoOK7hUUqaThg4liExza0P/k2l0Z844IzYagJRE87ScwaDj9QflvA6yZMbh/bqitFLT/5kqulVOSR2t5FIh6MakANl8oaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JFcGHdyZ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744620752; x=1776156752;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a+UyqqBZ3qHlcRVEHyB9KT3Hd3Ym9c5aYmE1OsjWZ/o=;
  b=JFcGHdyZi/E8OaTQp6gT0wLg1JuMzXTEOySGLewRxCWXZ8/xmxPZj51z
   HxY5QhFUWK7iI3rdU5iuyiCwY1yWHDJLpDo9bKRhN6hnMBC91yhZNYVuY
   bkuMdWClSm7VdXOdZKYCprLRkkw7Ja6nUVbjtqhtj9LcOSMT4o9NdW4wT
   SfPdrEDPDMvu55SbjBsyLf6VVtt1XWVptpusYaXGF63s1jlrYOuvTfsXH
   DlrXAa7bvmeYqDUtb+ltukVNekbq/wXXPtRdZTU2XT7kTP+N5EhygzZJF
   417dETKDU56mc2iMV7Geo9gDL3qP0KmTvr0Hu6X05CWi07X/VNoCm2VIa
   w==;
X-CSE-ConnectionGUID: jwBu1aZnTCauMZlsPNHosA==
X-CSE-MsgGUID: jW5SVFaUT+qtCEepCsLW/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="57464458"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="57464458"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 01:52:32 -0700
X-CSE-ConnectionGUID: 2dtfH+mQTLaHmAaeO+td4A==
X-CSE-MsgGUID: T/Ie1eAGQXOG0fdRoMIkjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="160714477"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 01:52:29 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 81F9211F871;
	Mon, 14 Apr 2025 11:52:26 +0300 (EEST)
Date: Mon, 14 Apr 2025 08:52:26 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: "Yan, Dongcheng" <dongcheng.yan@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	hverkuil@xs4all.nl, u.kleine-koenig@baylibre.com,
	ricardo.ribalda@gmail.com, bingbu.cao@linux.intel.com,
	hao.yao@intel.com
Subject: Re: [PATCH v1 1/2] platform/x86: int3472: add hpd pin support
Message-ID: <Z_zMyodMQoH6EtSR@kekkonen.localdomain>
References: <20250411082357.392713-1-dongcheng.yan@intel.com>
 <cfc709a8-85fc-4e44-9dcf-ae3ef7ee0738@redhat.com>
 <c8ae2d43-157c-408a-af89-7248b30d52d1@linux.intel.com>
 <Z_zDGYD1QXZYWwI9@smile.fi.intel.com>
 <d9cab351-4850-42c7-8fee-a9340d157ed9@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d9cab351-4850-42c7-8fee-a9340d157ed9@linux.intel.com>

Hi Dongcheng,

On Mon, Apr 14, 2025 at 04:40:26PM +0800, Yan, Dongcheng wrote:
> Hi Andy,
> 
> On 4/14/2025 4:11 PM, Andy Shevchenko wrote:
> > On Mon, Apr 14, 2025 at 03:52:50PM +0800, Yan, Dongcheng wrote:
> >> On 4/11/2025 4:33 PM, Hans de Goede wrote:
> >>> On 11-Apr-25 10:23 AM, Dongcheng Yan wrote:
> > 
> > ...
> > 
> >>>> +	case INT3472_GPIO_TYPE_HOTPLUG_DETECT:
> >>>> +		*con_id = "hpd";
> >>>> +		*gpio_flags = GPIO_LOOKUP_FLAGS_DEFAULT;
> >>>
> >>> This looks wrong, we really need to clearly provide a polarity
> >>> here since the ACPI GPIO resources do not provide one.
> >>>
> >> I tested gpio_flags=GPIO_LOOKUP_FLAGS_DEFAULT/HIGH/LOW, the lt6911uxe
> >> driver can pass the test and work normally.
> > 
> > I doubt you tested that correctly. It's impossible to have level triggered
> > event to work with either polarity. It might be also a bug in the code lurking
> > somewhere, but it would be unlikely (taking into account amount of systems
> > relying on this).
> > 
> > Is it edge triggered event?
> > 
> 
> It is an edge triggered event in lt6911uxe. In order to better adapt to
> other uses, "hpd" is meaningful to specify a polarity here.
> 
> In lt6911uxe, GPIO "hpd" is used as irq, and set irq-flag to
> IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING | IRQF_ONESHOT. So no matter
> rising or falling, driver can work normally.
> "
> ret = request_threaded_irq(gpiod_to_irq(lt6911uxe->irq_gpio),	NULL,
> lt6911uxe_threaded_irq_fn, IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING |
> IRQF_ONESHOT, NULL, lt6911uxe);
> "

include/linux/gpio/machine.h:

	GPIO_PERSISTENT                 = (0 << 3),
...
	GPIO_LOOKUP_FLAGS_DEFAULT       = GPIO_ACTIVE_HIGH | GPIO_PERSISTENT,

I.e. you effectively have GPIO_ACTIVE_HIGH there.

Btw. no need to cc this set to stable@vger.kernel.org, I've dropped it from
the cc list. See Documentation/process/submitting-patches.rst .

-- 
Regards,

Sakari Ailus

