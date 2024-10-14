Return-Path: <linux-media+bounces-19601-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D7B99C903
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 13:35:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24D4C1C2298D
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 11:35:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF0E319F40B;
	Mon, 14 Oct 2024 11:33:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D09619E802
	for <linux-media@vger.kernel.org>; Mon, 14 Oct 2024 11:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728905583; cv=none; b=Mc89ksjiFbOy0fEybvAi7OFN820NdP19VGgWRKQdB9ANt0TXxAqbFhdbMHs0p5uoyuafBinlFXIn+APF1jlK8J9oO4/cKFqKGv/7N5T/JjoDWxG4+SftNdnaGK+kqPPRT8NdBPrh0WfqAcwE8y8G4G1+JvOHae98/gM0XbC2unk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728905583; c=relaxed/simple;
	bh=Y4xQYHSFxmRDxHFcofsXWp373dhLA1T/p5tW7CxXi6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xuea0jdmOZVh8x0P4P4WXvkSm0eVuCYA68T1jXKfAukJDv5ooScwrWUEwY/c8Ov29UpTNmVrbc+Rykilxw7gKYmHWCgSyxElQmkH5IKLKqcjizXjuqsTl9c1X+rH0e/McxXMzHBlMOj2fQJCPom7j74WaRVPlSBp/jkWS1HSz/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: qtZxil2bQiK3sosBYB8EuQ==
X-CSE-MsgGUID: 8U9MRWG+RkGsAcYKMh6dvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="39644679"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="39644679"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 04:33:02 -0700
X-CSE-ConnectionGUID: oF783zPRRtKKQECRyyezvg==
X-CSE-MsgGUID: S6p6lTjTS+qsh/ztTIX0UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="108298846"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 04:33:00 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1t0JJp-00000002siO-0Wfv;
	Mon, 14 Oct 2024 14:32:57 +0300
Date: Mon, 14 Oct 2024 14:32:56 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>, Robert Mast <rn.mast@zonnet.nl>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 0/4] media: atomisp: mt9m114: Make it work on Asus T100TA
Message-ID: <Zw0BaCFy5j5bHeUA@smile.fi.intel.com>
References: <20241013154056.12532-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241013154056.12532-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sun, Oct 13, 2024 at 05:40:52PM +0200, Hans de Goede wrote:
> Hi All,
> 
> Since there is some interest in getting the mt9m114 camera to work on
> the Asus T100TA:
> 
> https://github.com/jfwells/linux-asus-t100ta/issues/4
> https://lore.kernel.org/platform-driver-x86/e0c8c98f-64ec-4297-bbc8-de489414515c@zonnet.nl/
> 
> I have spend some time this weekend poking at this resulting in this
> series which makes things work somewhat.
> 
> Note that for now this will only work if you modify the BIOS settings
> to change the ISP to be listed as a PCI device in lspci:
> 
> 00:03.0 Multimedia controller: Intel Corporation Atom Processor Z36xxx/Z37xxx Series Camera ISP (rev 09)
> 
> If you do not have this in lspci then things will not work. The BIOS
> does not allow changing this setting from its menu, so we need to
> use the grub setup_var_3 command form a patched grub.
> 
> Note this requires your Asus T100TA to be at the latest v314 BIOS version,
> this has not been tested with other versions!
> 
> Download grubia32.efi from here:
> 
> https://fedorapeople.org/~jwrdegoede/grub-efi-setup_var/grubia32.efi
> 
> Boot this once and then run:
> 
> setup_var_3 6f
> 
> If the ISP is not visible in lspci this should show 01 as value
> for the 0x6f offset.
> 
> Now change this to 2:
> 
> setup_var_3 6f 02
> 
> and then reboot. After this the ISP should be visible in lspci.
> 
> For more details on how this works see:
> https://hansdegoede.dreamwidth.org/25589.html
> 
> Note this series is just a quick hack, the proper fix would be to get
> the new drivers/media/i2c/mt9m114 standard v4l2 driver to work and
> atomisp does support standard v4l2 drivers for a while now.
> 
> I plan to take a shot at this as time permits, hopefully sometime
> within a month but no promises.

LGTM, some nit-picks in the individual replies.
Reviewed-by: Andy Shevchenko <andy@kernel.org>

P.S. Can you consider my patch to apply (that removes GPL text
     in the top comments)?

-- 
With Best Regards,
Andy Shevchenko



