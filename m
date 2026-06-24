Return-Path: <linux-media+bounces-65546-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3ye8HBrJO2pxdAgAu9opvQ
	(envelope-from <linux-media+bounces-65546-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 14:10:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B09476BDFEC
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 14:10:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=L4Q6lZc9;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65546-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65546-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13FC8302C917
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 12:06:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 494FB3603C3;
	Wed, 24 Jun 2026 12:06:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E6C279917;
	Wed, 24 Jun 2026 12:06:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782302801; cv=none; b=Y6WLAf8IF31cgB3MnVXF2EmX7ymT1sP2unduSY3BUQaLAG9GPTYJosEMu8ej4JgRh2J9PqeWpS1SamvxFkuikeR5t7GNbmQRf2+MFc8jRZ3NfAZSimJX7LDXnos0fo1vTYtiNWicRvkrOhT0MJMkDv5t1ce6DVle9GyQpxBpM5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782302801; c=relaxed/simple;
	bh=rCt9n22ce6w937Nlwxj2mRTyBoW3uwZl2eYmkKm4aqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QNSICkTEHAhncvZZxBsH7eNEcbZb2OIWylLBcX1fpzF9QjyXRK1b/fJ0XaQ5Y1T8QLeSswTdtcUhYVgSbOapM7AN/cR9Tsog/7HdEAvzt5b4HaP8vAF3JU9bTJeNRkLgq3b6f8iDs4eTza0eBDxbx0DQTH19tGfYRAF9MUCtO2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L4Q6lZc9; arc=none smtp.client-ip=192.198.163.8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782302800; x=1813838800;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rCt9n22ce6w937Nlwxj2mRTyBoW3uwZl2eYmkKm4aqc=;
  b=L4Q6lZc9C3jKZ0SonE6shxs4YGE97GsyhGCnxuiD/NEXQW5rnBLU5fLk
   +tNuFp7datPxciprv+TIY9HVm4jPBhzqYGrDdd9GGfaCg2hLnfqy0K/6v
   eAUc+1fyc50cu6S08atrlgaWMUVv4GsBMqVQpZU0hU6DeUrMhYCEPm6QR
   X92KAC1qSZT+2FcYIxQVd9Ycjyt7bzIJB3L52n8jQ00IwgMNET+tDhMsI
   ifF9C0Vqln4a31Hg3j3/vvO5QG/PZ3xa5p810+1/6t+BbwYScsavFRCUG
   Ei0WlLXcD8CGI64v55qS5AnTDc943HgGA30MxqXhkNx32IKDLuNF2+TZD
   g==;
X-CSE-ConnectionGUID: PJCXjMleSj2H80oC8+h8fQ==
X-CSE-MsgGUID: KiC7y6Q3Ssua2/veNc3HXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="100609911"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; 
   d="scan'208";a="100609911"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 05:06:40 -0700
X-CSE-ConnectionGUID: wNAm3FOORqa/+VdXSnvtAg==
X-CSE-MsgGUID: VyqlAjbGR4S1xVFo9Wz/Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; 
   d="scan'208";a="254797297"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.156])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 05:06:37 -0700
Date: Wed, 24 Jun 2026 15:06:35 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Igor Putko <igorpetindev@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] staging: media: atomisp: remove dead
 platform_support.h header
Message-ID: <ajvIS13S9rJgsORe@ashevche-desk.local>
References: <20260618120951.42956-1-igorpetindev@gmail.com>
 <20260618151246.6678-1-igorpetindev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618151246.6678-1-igorpetindev@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:igorpetindev@gmail.com,m:hansg@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@intel.com,m:gregkh@linuxfoundation.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-65546-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,intel.com:dkim,intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B09476BDFEC

On Thu, Jun 18, 2026 at 06:12:43PM +0300, Igor Putko wrote:
> 
> Following your feedback, this series replaces the custom CSS_ALIGN() macro
> with the standard __aligned attribute and completely removes the dead
> platform_support.h header file from the driver.

Thank you much for doing this! I have given a few comments, I think the v3 will
be final if you address them. Expecting a v3 with 4 patches.

-- 
With Best Regards,
Andy Shevchenko



