Return-Path: <linux-media+bounces-57839-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMXWFsTBzGkWWgYAu9opvQ
	(envelope-from <linux-media+bounces-57839-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 08:57:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C7A37576F
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 08:57:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D975A30136A9
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2026 06:55:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F65C346A11;
	Wed,  1 Apr 2026 06:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="izBqki97"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1C9344DB7;
	Wed,  1 Apr 2026 06:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775026504; cv=none; b=nPt6eLFAAsf9OxCvI/dPT6b8XedkJqU21/+HGPEcsbYi4qijXnLpiYwuu3aDWgYFvcLmAAerruuIykuJEuGSViaoR4pH4hdUE+okpbQcOa2scQqNlVLfcfAKgcWiKHJvilaMGNlB1Sxxp3uYOc5oL7u0rsq/yEgqGaS1YzMqWno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775026504; c=relaxed/simple;
	bh=QnDUi1TNc0V+P3FaapvlHetlwKU826/wGm7WQc3ZmvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gwSOBaYl9suin1BMrdmwvBGYkDZMbTCs/RNVxlCJfIAc35YSvbJrUBtTiLJWM0laAtxLPc/GQBSqIWcsQplTyhS2S8tI67zR2APZsdX+16BEq7kdSxHkHmUW29+/8xc4K4oQsL/BwDleqnQnYMrChxiG0DZBKOzcXnwdHS2Rirk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=izBqki97; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775026503; x=1806562503;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QnDUi1TNc0V+P3FaapvlHetlwKU826/wGm7WQc3ZmvI=;
  b=izBqki97h00J55BI9jjT5YMAfUWp9MiveL7ODQSqRlTwNyktMN0E76eF
   JOYkEl4Zz+iEadcErL64i5yvvH4H/tT32A+C9UHpC9wkmgvyJqFphe6Hg
   nk/FWIai1TEQEzkQBycTLlC5xFVgq8SA7qrcLKTDp+UE4YbevWDUXvXsE
   o1X5s2ciGdqeCeukToFTfKPhyNXKrtKWc69qY6ZiOSBmQxcocFz9NEFaw
   uflegELcG0a8NRGXQ6Fpbk9l2+Z7gYXaKGO6Q7Fpv3V0Eyyg707gBrxWx
   ZGI5TwURDCje4kyXQbgKVFhKtfdIFtoPX8HFRiO6h/j7pRfWbSFyiCzlU
   Q==;
X-CSE-ConnectionGUID: QQcgXqwrSeKj5K7c9p2GPA==
X-CSE-MsgGUID: uQx12GHhSeSG2d42Zj2jmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="93635820"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="93635820"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 23:55:02 -0700
X-CSE-ConnectionGUID: AIBRExpSRje8/dm+myjECA==
X-CSE-MsgGUID: a+UcCIC2TmKeL6bLijduDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="225759277"
Received: from amilburn-desk.amilburn-desk (HELO kekkonen.fi.intel.com) ([10.245.244.124])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 23:54:59 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C3606121CEE;
	Wed, 01 Apr 2026 09:55:07 +0300 (EEST)
Date: Wed, 1 Apr 2026 09:55:07 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Anushka B <anushkabadhe@gmail.com>
Cc: andriy.shevchenko@intel.com, andy@kernel.org,
	gregkh@linuxfoundation.org, hansg@kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, mchehab@kernel.org,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Dhruva gole <goledhruva@gmail.com>, m-chawdhry@ti.com,
	Simona Toaca <simona.toaca@nxp.com>
Subject: Re: [PATCH v6] staging: media: atomisp: fix GP_TIMER_BASE scope in
 gp_timer.c
Message-ID: <aczBS_KJQa_j97RP@kekkonen.localdomain>
References: <20260327031106.10386-1-anushkabadhe@gmail.com>
 <acZo5LUXH70-UKUi@kekkonen.localdomain>
 <CAAfE=nNNxCKv0JoRcib7YVQfQ9MxqE34WyYu2GHNYaroxzpw1w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAfE=nNNxCKv0JoRcib7YVQfQ9MxqE34WyYu2GHNYaroxzpw1w@mail.gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57839-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[intel.com,kernel.org,linuxfoundation.org,vger.kernel.org,lists.linux.dev,nxp.com,gmail.com,ti.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.977];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kekkonen.localdomain:mid,intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A4C7A37576F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Anushka,

On Mon, Mar 30, 2026 at 07:02:21AM +0530, Anushka B wrote:
> > There's a lot to cleanup here, but what should be done is roughly:
> >
> > - Make these constants macros (with IPU2_ or ATOMISP2_ prefix?) and move
> >   them into a separate header (perhaps with register definitions?).
> >
> > - Remove my_env and make struct device (or maybe struct atomisp_device?) as
> >   a parameter for register access functions.
> >
> > This may get a bit complicated due to the amount of cleanup needed so
> > having the hardware for testing would be rather essential.
> As a student, I don't currently have access to the hardware needed to
> do the bigger refactor safely. However I'm happy to fix the comment
> formatting and language.
> In earlier versions, I had merged the split declaration of
> GP_TIMER_BASE in place in system_local.c before later moving it to
> gp_timer.c.
> Link: https://lore.kernel.org/linux-media/20260325132434.55775-1-anushkabadhe@gmail.com/
> Would it be okay to proceed with the simpler in-place fix for
> GP_TIMER_BASE declaration instead?

I'm fine with v4.

-- 
Regards,

Sakari Ailus

