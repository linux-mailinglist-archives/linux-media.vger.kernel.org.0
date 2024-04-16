Return-Path: <linux-media+bounces-9546-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD128A6F04
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 16:52:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1E1D1F21A1A
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 14:52:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A81E12F389;
	Tue, 16 Apr 2024 14:52:53 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F9312CDB2
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 14:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713279172; cv=none; b=FKsgi9KMEEjG0rP1zr//kjZmazATinpwgNJJ5CEyWdOHJzTaJ6dE/XO9T0DF95+htGNT3Ah3GW4SrvnweVFcIdd0IR04O+WPvk2tvZsjfyOSaTobJf9kP80S/z3txPyTl/s+bbuqDQfkpCV/O1f/1fEbX6aoCiX7tsKo/O3TGdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713279172; c=relaxed/simple;
	bh=hZ4NQt+dAJTqjnExGM9uRzavMCCLXiAb/BELBtOgEC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JXjU08ijfZsOwsyllDM+X6L3+Y6atsNi4a+NdZ3P2Zki1r0DTbwqe98w2Jg4MHTuZqeXpGM/KEtFf10jeyLnLH4IY+b/m+lyKAA5J3qNyNlcURlfUSHJPU6XkU4AkLHyIIGk4OK0ZAj4pEgk8aKPHb/beoXyKE5AvcI72UyrZQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
X-CSE-ConnectionGUID: WhUFJxX/TmG+IC+xXhl2fA==
X-CSE-MsgGUID: kVe3R5CRTWez6qpJSmtVQA==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8834411"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="8834411"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 07:52:51 -0700
X-CSE-ConnectionGUID: kqF9Uzu7S5SVxjodDeZDZA==
X-CSE-MsgGUID: fUBg/DpwRPOyJwH1V7+ZIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="22348143"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 07:52:48 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy.shevchenko@gmail.com>)
	id 1rwkAv-00000004j5M-2zXE;
	Tue, 16 Apr 2024 17:52:45 +0300
Date: Tue, 16 Apr 2024 17:52:45 +0300
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>,
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 11/23] media: atomisp: Remove test pattern generator
 (TPG) support
Message-ID: <Zh6QvSo_ic-4OSuV@smile.fi.intel.com>
References: <20240415120220.219480-1-hdegoede@redhat.com>
 <20240415120220.219480-12-hdegoede@redhat.com>
 <Zh08SP60QytSz3aQ@smile.fi.intel.com>
 <294058a6-72dd-4973-95ee-eaed0c908131@redhat.com>
 <CAHp75Ve2tyqYM0ChjW=ETjJ27xNmtJ3dDK-2pneanuQEwyFRxg@mail.gmail.com>
 <171327825938.342316.14749757279066216268@ping.linuxembedded.co.uk>
 <171327844339.342316.3750832654489118780@ping.linuxembedded.co.uk>
 <Zh6QOmFbeC-G6RMe@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zh6QOmFbeC-G6RMe@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Apr 16, 2024 at 05:50:34PM +0300, Andy Shevchenko wrote:
> On Tue, Apr 16, 2024 at 03:40:43PM +0100, Kieran Bingham wrote:

...

> Thanks for playing with this.
> 
> The issue with the original code is readability and potential oddity about
> boolean to integer conversion. That said, I prefer my variant for the sake
> of clarity.

Hans, in case you are going to update your PR once again, I still think the
LM3554 driver removal commit message may be improved by pointing out to the
existing driver.

-- 
With Best Regards,
Andy Shevchenko



