Return-Path: <linux-media+bounces-62756-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGAKCbZbFWq5UgcAu9opvQ
	(envelope-from <linux-media+bounces-62756-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 10:37:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CDF5D288F
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 10:37:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F11B4301CDB5
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 08:37:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1A523CB918;
	Tue, 26 May 2026 08:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ccbe85XA"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064E82C181;
	Tue, 26 May 2026 08:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779784619; cv=none; b=i6ggLu0OjVgln//DnFNWj95ynvHXtssKj7lsNRMnblTg1QKM7zfkLtUe5Oiidl5oeFlAAKbNOS863H7dcBc2Bx2vVzeqsBuwddCSKx++n7kes19T4Gc7yZ7c2AJi2p4i7I8+xgNCgkaFJwSGrAdmz3Os1G8e5C8CghYQpcISp94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779784619; c=relaxed/simple;
	bh=l1X4xFGO+4ZWDtL27Jf0ku8rU8j7ghJcF3Bpm4Mf3ws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R1lfcPpauBobeUTV9GR2sQUK8duTtD6UDcYub3qkSp/9a2DOvNr4od80bcKpISnXCtcyT9PhVSzA4bAvAtAjl7GZ1U0lvR6EUHTwDBdVZ+90s8T2y8w6iwHj35svyt0Jbwu2u6FRyrkcVF9hPw6EvO2aH/f+8DpanS5dcwO/qS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ccbe85XA; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779784618; x=1811320618;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l1X4xFGO+4ZWDtL27Jf0ku8rU8j7ghJcF3Bpm4Mf3ws=;
  b=ccbe85XAB7Mf81NrFtbrM+dhFcPnpel/1jho1Fp59AOuWAjkfMXTgic7
   ElsRsQcnlXulJevwaL6fMXg4YT0ts04pxkxHP0XCJUXDTajAPZS5hJNWg
   brIH1P+2OX2J2XUvSfzaP61MEiiMdJYExR7h395egRCjutiA8+2/Ai6kU
   lQWXnx1aFaE50fuG95ncZ2Gpfqp8mawasoA7DYGgM5ueyd1uWGztzWpYG
   YGa+RDSneQ/H3Wl2cVcWc04JepjtYSWRt3MpXhA+THMhLRgmn7wviRFkC
   f2ebm0HyZYk7YfyK2xxGVPh+/UlRbb+s+ydbZEUW3Ufscm8cL5Jf34JYz
   A==;
X-CSE-ConnectionGUID: fFIllAHqSV++vxjxWukGAg==
X-CSE-MsgGUID: AKFaWNLNT/6ps9QMmJ/g4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="106050516"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="106050516"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 01:36:58 -0700
X-CSE-ConnectionGUID: WHklOzkSSuqFevq+cd1CGQ==
X-CSE-MsgGUID: ER/vxmkaTG+G5WFAgFLgPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="245894951"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.103])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 01:36:55 -0700
Date: Tue, 26 May 2026 10:36:47 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v2 00/15] media: i2c: os05b10: Refactor driver and Add
 new features
Message-ID: <ahVbLjqNqFnke8Pe@mdjait-mobl>
References: <20260325114404.95188-1-tarang.raval@siliconsignals.io>
 <PN3P287MB18293C332106D4A13EAC07668B362@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <PN3P287MB1829CAAB606558641ADEA34C8B0B2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PN3P287MB1829CAAB606558641ADEA34C8B0B2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62756-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mehdi.djait@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 89CDF5D288F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Tarang,

On Tue, May 26, 2026 at 07:09:55AM +0000, Tarang Raval wrote:
> Hi Mehdi,                                                      
>                                                                         
> Could you please review this series when you have a chance and          
> help Sakari with it?   

Yes, I will take a look at this series. This week I am busy with
Embedded recipes and the media summit. I will probably have time next
week.

--
Kind Regards
Mehdi Djait

