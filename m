Return-Path: <linux-media+bounces-62975-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOruIuyTGGoMlQgAu9opvQ
	(envelope-from <linux-media+bounces-62975-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 21:13:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE295F6EEC
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 21:13:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7556030B08E1
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 19:06:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBD1E33CE8A;
	Thu, 28 May 2026 19:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kKBPMUq8"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045ED324B2D;
	Thu, 28 May 2026 19:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779995206; cv=none; b=HCKeihxmEWUel2jWHBpfI98Zd78AK8NFMNs+sDtog8kw3kCEZvrxoNHmrHVIeF/I7OxBG4oHN5yeu0T9VO64LWvkzZqc2KNoLljlS+0Vr+OVVG898MPhPFzXoDiY7jfP9AKvVnB9VC1GOWJoBmH0SUEAiBSQmkhftTC8HgHXvfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779995206; c=relaxed/simple;
	bh=1PHZvUf8rUiNG1427am34Hzkk8b7N19w5O5YChuFLWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r9kweV0eXlLZbBczt3LLsQVNsam47mCCZt53QPC5AeRV7KYWwvSMiN1OldvfmqYzAZlsYj9fPbrs1yQ0625THWk47bfUe/KgyMUsu6ybSLdd5UFOwZ8thoU0tsME61sFgKxxfIrxJ0osoUY4CCRWWW3qC6vxhR2xjWlo6TKw4Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kKBPMUq8; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779995205; x=1811531205;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1PHZvUf8rUiNG1427am34Hzkk8b7N19w5O5YChuFLWc=;
  b=kKBPMUq8P8NIjteQM3UESA2wdBCdgYSqpW1TrQrkJd1ie4UK70Y5xvI7
   o2V7tIxl2hm0JHvo34if0HHFdKseeaVlAJ/IqwEsF48w1dkZRS0xHCC5u
   1qltE0jPPq7Gd4cEtwdZ7/aa73bcuD/guLNLqa7eJzbGwv7EcS6DyQ4fv
   8h3vgronT0G2hl4HstNjVTpluDOh5xw8kIqBnUFcj+TWnRNYjbupfRzKT
   5ZxTQBJeDc3ENuTKUWAG+LHma83cJ/80ZdOb33XeFkAxmTkUKu87uMYsW
   taKv9ByMqA8FBcTIXi3OK+tSIx9TEk/+g4EqcXNca2VQBgzmVac8V5T3p
   w==;
X-CSE-ConnectionGUID: KC48uvJXTUuGkXL4D1n8zw==
X-CSE-MsgGUID: j6LjaeiMTOCMQzDJrF+0xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="106298999"
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="106298999"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 12:06:44 -0700
X-CSE-ConnectionGUID: ser+wkGpRRqwVFuffzYjUA==
X-CSE-MsgGUID: RDmyMl7MSa+MkOLJzjT2fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="247584499"
Received: from amilburn-desk.amilburn-desk (HELO kekkonen.fi.intel.com) ([10.245.245.232])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 12:06:41 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 0B80911F984;
	Thu, 28 May 2026 22:06:35 +0300 (EEST)
Date: Thu, 28 May 2026 22:06:34 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
	Yong Zhi <yong.zhi@intel.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lixu Zhang <lixu.zhang@intel.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH] MAINTAINERS: Remove bouncing Intel media maintainers
Message-ID: <ahiSOvQ2zQuHDHWI@kekkonen.localdomain>
References: <20260526214131.51118-1-dave.hansen@linux.intel.com>
 <aham35tbJEbDc1Ee@kekkonen.localdomain>
 <CAPY8ntBFG=FzJdWjU+jnjx9k5H=pSyb9AVGiYwH+Kqu2kLMLTw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPY8ntBFG=FzJdWjU+jnjx9k5H=pSyb9AVGiYwH+Kqu2kLMLTw@mail.gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62975-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: CCE295F6EEC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Dave,

On Thu, May 28, 2026 at 11:21:47AM +0100, Dave Stevenson wrote:
> Hi Sakari & Dave
> 
> On Wed, 27 May 2026 at 09:10, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> >
> > Hi Dave,
> >
> > On Tue, May 26, 2026 at 02:41:31PM -0700, Dave Hansen wrote:
> > > Tianshu Qiu and Bingbu Cao are maintainers and reviewers of a bunch of
> > > media drivers (7 and 9 respectively). Both of their emails are
> > > bouncing.
> > >
> > > Remove the bouncing entries and update driver status in cases where
> > > there are no M:'s left.
> >
> > I can pick at least some of these. I'll send v2.
> 
> If Intel have no/limited interest in IMX355 any more, then I'm happy
> to step up as the maintainer as we have a customer looking to use it.
> I was going to add that as an extra patch to v2 of my recent patchset
> for it, but haven't sent it out yet.
> 
> Based on recent commits I had pinged David Heidelberg (added to cc)
> and Richard Acayan too as other potential folk with an interest. David
> has agreed to be a reviewer, but Richard hasn't the spare capacity at
> present.
> 
> I don't mind if you add that to your V2 of this set, or I'll try and
> get my v2 imx355 set out in the next week.

The sensor is present in a Chromebook and so I think there's some interest.

I'll add us both as M: and David as R: in v2.

-- 
Regards,

Sakari Ailus

