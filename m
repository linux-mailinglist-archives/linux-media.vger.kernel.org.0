Return-Path: <linux-media+bounces-58184-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJqoC2X61GmgzQcAu9opvQ
	(envelope-from <linux-media+bounces-58184-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 14:36:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 865383AE7CF
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 14:36:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CAF82308FD6D
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2026 12:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 029513B3C1D;
	Tue,  7 Apr 2026 12:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gl2u2o3l"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677CB332EBA;
	Tue,  7 Apr 2026 12:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775565176; cv=none; b=CQ+9W6P3NYPjcZS3a3KeaBrqwba36ZtGZEKYlGAMnJAFSNrT74iQzdmdwzAEGPR3Fb9i+hr6UnjYEbOcT1X79O6SwJZ8UcwwAKczKLIYyFNIMicJlMuga1+Lfaw0EPnha3fFhsXzCvJcSTw1prG7+H0jVeY4Sx8/5jNPEO4Upx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775565176; c=relaxed/simple;
	bh=dwFJL+OYIZPS8P61HUA+yq/lpE+czBOQa1XF3gj8u/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c5RLuFXewfk8D+COsz/Zzlb6CWBnBr2+AWc4ZNB5nT+m9GuRDTgz7/w/7qpzZ8HeVT2ympU+puytKAal4RLc8hMMwQoNh046jCg+ecs6n6y8iW8GCXteZOXKVxNMy3HWWDtttAgYfiI6jpOonhccFWeRh3PLnP1IXagYYZlDcgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gl2u2o3l; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775565175; x=1807101175;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dwFJL+OYIZPS8P61HUA+yq/lpE+czBOQa1XF3gj8u/s=;
  b=Gl2u2o3lMXpExswaRj8gsRZWnMbNxQ+CKx1E+YCgDk0LNOw36VsAWVa5
   FGLc0wb/A8Vsb1YgSilcs6mHAIAn2IGldx0JyI9AVGDMI6qX1OGBBZwOS
   toQRcAa42MahX1RB+lS9g1am70vS6G9bNJiF3e2rU3ywzp9dEiHavUt+c
   1x8IauQPQSRxE98b7ZeAz36P9UJv2MbpU2ZmSg1AsRXCJrys1VQWZjOkJ
   jZbltADPZLAX6TjxTTbXEYubKDOYCDdCTQlN6Te0AubS7euM82yWYY8S8
   6y2TqvcBy4aBd7Nb4E9CXatkn/OFfrYmzXmviVYpH4Bt+ZmwWdKT3Z1BY
   g==;
X-CSE-ConnectionGUID: zJ47xQbkR/qJ/hjVfpBSlQ==
X-CSE-MsgGUID: jow92E07TwqdzmH5iXwfhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="80384823"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="80384823"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 05:32:55 -0700
X-CSE-ConnectionGUID: 3NCdu8PMSq63/EpxP2+j8A==
X-CSE-MsgGUID: Emk70GcxR5aIWGOmYYQ7uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="266138208"
Received: from amilburn-desk.amilburn-desk (HELO kekkonen.fi.intel.com) ([10.245.244.123])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 05:32:54 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 489F611FBE3;
	Tue, 07 Apr 2026 15:33:06 +0300 (EEST)
Date: Tue, 7 Apr 2026 15:33:06 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Lukas Larson <lukaslarson@gmail.com>
Cc: mchehab@kernel.org, hverkuil+cisco@kernel.org,
	johannes.goede@oss.qualcomm.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: ipu-bridge: Add upside-down sensor quirk for Dell
 16 Premium DA16250
Message-ID: <adT5gpw-DjHAEUuB@kekkonen.localdomain>
References: <20260331190145.11592-1-lukaslarson@gmail.com>
 <ac6btfUsok-Y0Dw2@kekkonen.localdomain>
 <CAMCiyfoVxS_iQWVEiak+mv1i9uF2WtqMqyfCgeQyO_q5XS4LgA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMCiyfoVxS_iQWVEiak+mv1i9uF2WtqMqyfCgeQyO_q5XS4LgA@mail.gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58184-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: 865383AE7CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Lukas,

On Fri, Apr 03, 2026 at 11:02:54PM +0200, Lukas Larson wrote:
> Hi Sakari,
> 
> When testing on sailus/media_tree pld I could not get the camera to power
> on.
> Not well versed in the stack so perhaps that is a totally separate issue.
> 
> sudo dmesg | grep -e ov02 -e 0000:00:05 -e sailus -e ovti
> [    0.345193] pci 0000:00:05.0: [8086:7d19] type 00 class 0x048000 PCIe
> Root Complex Integrated Endpoint
> [    0.345207] pci 0000:00:05.0: BAR 0 [mem 0x622c000000-0x622cffffff 64bit]
> [    0.345212] pci 0000:00:05.0: enabling Extended Tags
> [    0.424651] pci 0000:00:05.0: Adding to iommu group 4
> [    6.887487] intel-ipu6 0000:00:05.0: enabling device (0000 -> 0002)
> [    6.892671] acpi OVTI02C1:00: ipu-bridge media running sailus custom
> media_tree
> [    6.894955] intel-ipu6 0000:00:05.0: Found supported sensor OVTI02C1:00
> [    6.895027] intel-ipu6 0000:00:05.0: Connected 1 cameras
> [    6.896600] intel-ipu6 0000:00:05.0: Sending BOOT_LOAD to CSE
> [    6.933436] intel-ipu6 0000:00:05.0: Sending AUTHENTICATE_RUN to CSE
> [    6.982574] intel-ipu6 0000:00:05.0: CSE authenticate_run done
> [    6.982583] intel-ipu6 0000:00:05.0: IPU6-v4[7d19] hardware version 6
> [    7.158144] ov02c10 i2c-OVTI02C1:00: supply dovdd not found, using dummy
> regulator
> [    7.158169] ov02c10 i2c-OVTI02C1:00: supply avdd not found, using dummy
> regulator
> [    7.158173] ov02c10 i2c-OVTI02C1:00: supply dvdd not found, using dummy
> regulator
> [    7.159480] ov02c10 i2c-OVTI02C1:00: Error reading reg 0x300a: -121
> [    7.159495] ov02c10 i2c-OVTI02C1:00: failed to find sensor: -121
> [    7.159539] ov02c10 i2c-OVTI02C1:00: probe with driver ov02c10 failed
> with error -121

There seems to be another problem here. :-(

> 
> Then tested applying just the "Prioritise _PLD over SSDB in rotationpld"
> change on v6.19,
> but without all the related changes to v4l2, both ssdb->degree and
> pld->rotation were 0,
> and image still flipped. Guessing not much useful info, sorry, appreciate
> your work on this.

You'll also need at least another patch, "media: v4l: fwnode: Support
ACPI's _PLD for v4l2_fwnode_device_parse", in order for this to work. I've
rebased the patches on plain v6.19 and pushed that to the pld branch. Would
you be able to test this again?

-- 
Kind regards,

Sakari Ailus

