Return-Path: <linux-media+bounces-11719-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 174DF8CC0D2
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2024 14:04:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEB201F2371C
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2024 12:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1CDE13D607;
	Wed, 22 May 2024 12:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UucpckXE"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2CB2E419;
	Wed, 22 May 2024 12:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716379456; cv=none; b=b+vIseNORUMq39heqU6WCO6XEnuzJcbY780/ce1WL/5+0nrY7J+qwubADi2Gf2wo3vawFrcU06ts7hZ9ptke4x7R3Ie5TZPXNCC0BcuGrcHF9oM29XkTvom+4AsvOsAA+K2IPljcBeY5XgITjfEvX6ZMBVuFOyOEvJRaU0z3MEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716379456; c=relaxed/simple;
	bh=aYyVv3xyc7WpUrD4DYcfbWhn6/SYDmpkIQ+qEZAfycI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mazstfnk0DMxJ/0l5423P81LnwFLvVoyVuZE83BF3ra3+BkYgP6eVaqPUg7ZxYgGOEFb5koJkTf8+3urAin91CfUYh/Kjwtq9gBXIxV2x1tzNNqC5pZtIq3ADz/9pf0sdKTOYdg2orcL490vVeAbJ9LIqQD1K+wWsNQgyDvkV6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UucpckXE; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716379455; x=1747915455;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aYyVv3xyc7WpUrD4DYcfbWhn6/SYDmpkIQ+qEZAfycI=;
  b=UucpckXEdk7xrW7Skg/ZeNn2IN/OAqtAPfIgDk6bKwYeEmHCmQ7A6Cd+
   KmnPDeHt+MBtinRtQDwvexZHpBl29otuBEyTdu/UKglmlUyfm/lG5Xd75
   ztPwTFA77npW3FjK1xUCyulkFR+vIjBckRu3eCM7WvU77oAuaiZHQA0F6
   boZnVyCTCgdwMWu72ns8I3T1+of7Bj8S0k/yTo9y0qdinsg5hF5un+7Rq
   RZVJ/bRcXA02ocwtADskvHU6coT0/fdDyAOo7uZ3JN2KalkregCTNBx14
   /LPHkAuUesST9MrzjX+FIPWpfygpTcLud45vC1/IYAAb5/ykbdOxWBmya
   A==;
X-CSE-ConnectionGUID: iqplMzPbQJ6Y+q3LQgXEvg==
X-CSE-MsgGUID: 5JevbbASRGOgAKB85+n6ww==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="38008330"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; 
   d="scan'208";a="38008330"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 05:03:42 -0700
X-CSE-ConnectionGUID: AoWu/YYFRCSNZq9VnTjePw==
X-CSE-MsgGUID: RJJl0RkXRxemNU4yKjFDNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; 
   d="scan'208";a="64490169"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 05:03:40 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 020C011F82A;
	Wed, 22 May 2024 15:03:37 +0300 (EEST)
Date: Wed, 22 May 2024 12:03:37 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] media: ipu-bridge: fix error code in ipu_bridge_init()
Message-ID: <Zk3fGRS4FQDW7BTW@kekkonen.localdomain>
References: <f468c4ac-0629-41b5-b5d1-e26f70e44800@moroto.mountain>
 <ZkN2Ow6hASmKvHlz@kekkonen.localdomain>
 <ZkOBaUW1uLw6ildS@smile.fi.intel.com>
 <d2d71851-691f-45cf-9d52-1d16ede09b2b@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d2d71851-691f-45cf-9d52-1d16ede09b2b@redhat.com>

Hi Hans,

On Tue, May 14, 2024 at 05:38:45PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 5/14/24 5:21 PM, Andy Shevchenko wrote:
> > On Tue, May 14, 2024 at 02:33:31PM +0000, Sakari Ailus wrote:
> >> On Fri, May 10, 2024 at 06:43:31PM +0300, Dan Carpenter wrote:
> > 
> > ...
> > 
> >> Neither IPU3-CIO2 or IPU6 ISYS drivers should be of any functional use
> >> without sensors. But the power states of the devices could be affected by
> >> this: the drivers should power off these devices but without drivers they
> >> maybe left powered on. I haven't made any measurements though.
> > 
> > FWIW, Hans mentioned AtomISPv2 case with somewhat 7W consumption on top of
> > the idling machine. That's why we have a stub driver in PDx86 exactly for
> > the purpose of turning it off when not used.
> 
> I'm not sure if I ever mentioned the 7W, that seems a lot. But in
> the atomisp case the SoC will never reach S0i3 when the ISP is not
> properly turned off. And in this case the ISP is special and just letting
> PCI / ACPI put it in D3 is not enough it needs some special writes on
> the IO-Sideband-Fabric to be turned off.
> 
> I don't know if something similar applies to the IPU3 / IPU6, but
> the bridge code is used by the atomisp code now too. So at a minimum
> if an error gets returned when there are no sensors then this must be unique
> enough that the atomisp code can check for it. Maybe -ENODEV ?

-ENODEV is also used for a number of different conditions. Different error
codes are also returned by functions the ipu bridge calls and they seem to
be passed onwards as-is mostly.

Maybe add an argument to ipu_bridge_init() to tell whether to fail if there
are no sensors?

-- 
Regards,

Sakari Ailus

