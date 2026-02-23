Return-Path: <linux-media+bounces-53186-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEuSGR9XnGkAEQQAu9opvQ
	(envelope-from <linux-media+bounces-53186-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 14:33:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B8226176F8E
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 14:33:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 62EBA3040743
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 13:29:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0FC01DE4FB;
	Mon, 23 Feb 2026 13:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IXi6npOI"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7063A1D2
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 13:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771853354; cv=none; b=inBP/YY1sUYjlUHPYpMQa1t4sf5d6viDbzAJRws+/A4U20iqy0TiBRaMxbNy4x3JQzu+4Y5p1qIRZVqfNZr/c0xpGut4dcrn5oXNVOKQwXgCyKlfaeDI1WykI7VPmbpKwdFm3juR6ILF2k2IPPZPPIxwRD2TdHM8Io/actLwFRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771853354; c=relaxed/simple;
	bh=5q5RNJG7FoW5rrgjMgTpN3CcF2dMjodK+11/ePnkvWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=km7QtKm5nq5ZdayvnWh+o5rRe7viVD7EIshC3Eb4mtdx/Y7/7LCVDQum8eFbhM1FM6snHeVhuKne7PTx7ygHdGUckTMWwLo0kn9DhweJbjIeiatTJ9TCo5ZUl9p8X4pIUS0eqdBW9fr0Betvyw56j4bUlAv9WQxyzOc+h85QLvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IXi6npOI; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771853353; x=1803389353;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5q5RNJG7FoW5rrgjMgTpN3CcF2dMjodK+11/ePnkvWk=;
  b=IXi6npOIFMrUPF8CrssoIUBYubwJAFaFg3USySHU2igXvnMhH/VhnzeO
   jiEaNhmcaMq7lVrEo4FlWJtXENioND7WLhJDTVJQbPspB8KiVWqNwmWpB
   6GkVN2pZMNRLyq2F0nXLtlYjIzjVuTmnvh6i08ss2yhRdOO/bxq4EJzaq
   hXEvwPsFXYXxhT6necYwnaHrz/EeEzChR0KvHFZ2sDif3E5RaeRONBilt
   zl/2sRlq+u5oDd4+5Au8JarLvzw1RQnuwI5Gufhc7YF1XwpTsiLfENAJX
   /VRTEPmSk88YY8jCWTSVU5+OJj41fIJSApsSAsTzGmYUKx8gFCc/L04jq
   w==;
X-CSE-ConnectionGUID: sVAjEU9bQ56bvPr4cKMD8Q==
X-CSE-MsgGUID: lxKBX3JHR0u3OypHbN5mXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="72724058"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="72724058"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 05:29:13 -0800
X-CSE-ConnectionGUID: iqX//IrKRUa3YId91WUidA==
X-CSE-MsgGUID: +aJBjRS7TQilWgVJxB8XLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="215580024"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.225])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 05:29:12 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C212211F908;
	Mon, 23 Feb 2026 15:29:36 +0200 (EET)
Date: Mon, 23 Feb 2026 15:29:36 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Juliusz Chroboczek <jch@irif.fr>
Cc: linux-media@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Antti Laakso <antti.laakso@linux.intel.com>
Subject: Re: OVTI08F4:00 sensor not in media graph
Message-ID: <aZxWQHpxWJXciuWU@kekkonen.localdomain>
References: <875x7niplz.wl-jch@irif.fr>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875x7niplz.wl-jch@irif.fr>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53186-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: B8226176F8E
X-Rspamd-Action: no action

Hi Julius,

On Mon, Feb 23, 2026 at 01:58:00PM +0100, Juliusz Chroboczek wrote:
> Hello,
> 
> This has been reported at
> 
>     <https://gitlab.freedesktop.org/camera/libcamera/-/issues/318>
> 
> A kind gentleman there recommended that I contact linux-media.  Since I am
> not subscribed, please CC me with any followups.
> 
> Dell Pro Max 14 Premium MA14250 laptop (Arrow Lake CPU), Debian testing,
> kernel 6.18.9+deb14-amd64, libcamera 0.7.0-2.
> 
> The camera appears to be recognised by the kernel:
> 
>     $ sudo dmesg | grep -i ipu
>     [    0.004960] ACPI: SSDT 0x0000000051FDB000 0000F9 (v02 INTEL  IpuSsdt  00001000 INTL 20210930)
>     [    6.716232] intel-ipu6 0000:00:05.0: enabling device (0000 -> 0002)
>     [    6.731807] intel-ipu6 0000:00:05.0: Found supported sensor OVTI08F4:00
>     [    6.731872] intel-ipu6 0000:00:05.0: Connected 1 cameras
>     [    6.734633] intel-ipu6 0000:00:05.0: Sending BOOT_LOAD to CSE
>     [    6.774011] intel-ipu6 0000:00:05.0: Sending AUTHENTICATE_RUN to CSE
>     [    6.822558] intel-ipu6 0000:00:05.0: CSE authenticate_run done
>     [    6.822568] intel-ipu6 0000:00:05.0: IPU6-v4[7d19] hardware version 6
> 
> However, libcamera complains that it cannot find a sensor:
> 
>      $ cam -l
>      [1:56:27.699418955] [20417]  INFO Camera camera_manager.cpp:340 libcamera v0.7.0
>      [1:56:27.724735682] [20420]  INFO SimplePipeline simple.cpp:1899 No sensor found for /dev/media0
>      Available cameras:
> 
> Running "media-ctl -d /dev/media0 -p" indicates that the sensor is not in
> the media graph:
> 
>     https://gitlab.freedesktop.org/camera/libcamera/-/issues/318#note_3342927
> 
> Please let me know if any further information would be useful.

This laptop should start working with the CVS driver makes it to upstream.
I'd hope this happens for Linux v7.1, there are no guarantees though. The
ov08x40 and USBIO drivers already exist in the upstream kernel.

Cc Antti, too.

-- 
Kind regards,

Sakari Ailus

