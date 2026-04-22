Return-Path: <linux-media+bounces-59336-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IjfNfnG6GmYQAIAu9opvQ
	(envelope-from <linux-media+bounces-59336-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 15:02:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7ED446629
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 15:02:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2F54630F4C67
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 12:54:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 168A73E9F98;
	Wed, 22 Apr 2026 12:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KPSOX9hX"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4EAB3E95B8;
	Wed, 22 Apr 2026 12:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776862442; cv=none; b=lgXsChK6ZjpslWACKe7fsGuyHKsNCCGlA8wgdC3FVc+PBIXnTXd8XIRrmofsQED1/OP1w5B0hKHN8+qs09a8zHxkoABHmFym9MC/nxGPjxa/Rr7oJrlij160fTiTbQSGf/PRBCxdHbDcikQe4mLF6BfKNKI0l2knRt9jYgJTGEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776862442; c=relaxed/simple;
	bh=7gkpj/qOcMcl03GcHCkI6ezDE9E9qnuV+tcUt2yxDig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F8GCQUZxX6s7m3BIESgd/wQccAJDVeyDI647TIbDTQc3pcdsKUEwjk6RUDe7VsCyKCvtCstZA2dZZrfcPVNviJwuMiT0jhVrFzX5whBvFyhwAeYJQISLaJoPpZF1L0fJUkM8bK+2vZmSp18Oy2/5tkfmpgWQV089CJrQosZ74lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KPSOX9hX; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776862440; x=1808398440;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=7gkpj/qOcMcl03GcHCkI6ezDE9E9qnuV+tcUt2yxDig=;
  b=KPSOX9hXlfL70rxmhj/obWSFbbOHCxwLbFP0ZfgyF/NPYmligO0ZhjxH
   uMDiY1Y5YR8ku3m8JhAzXhn74zIs5ZQl+egIoVeoI1MFmEnowpD5vA+l5
   qknFlz7gxRtpybZyxxnU7owQj0leFMgazb+Z9EAr/IwVOPFz3D9XuScvI
   5V7TZ0hOeHVmgOj7YpicYIpgx+EcgDuRs3GvriHk7qgeXkF3MJ1pg4bRH
   eayCHlQrX50hkMlA6XFzPo005v2CzR++iA7N37UyUbfpQIW13/b7zLVTM
   XRJhIhO50Hwao5MQ3sWCzhR7QCWtKWyo/jDk6oYBZms861Xcd6iJO1+Ig
   g==;
X-CSE-ConnectionGUID: tlffvhEJQPOaiOcLP5gh9A==
X-CSE-MsgGUID: Tfls1RKcTKirezadZO0bjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="89281148"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="89281148"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 05:54:00 -0700
X-CSE-ConnectionGUID: tb2YmUDMSu6/jCICjOd59Q==
X-CSE-MsgGUID: sQ31ApklTpyvJQ19PfXl5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="229680746"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.208])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 05:53:56 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 544701223DC;
	Wed, 22 Apr 2026 15:53:54 +0300 (EEST)
Date: Wed, 22 Apr 2026 15:53:54 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Sakari Ailus <sakari.ailus@iki.fi>, Ayush Kumar <ayushkr0s@gmail.com>,
	hansg@kernel.org, mchehab@kernel.org, andy@kernel.org,
	gregkh@linuxfoundation.org, hverkuil@kernel.org,
	ribalda@chromium.org, abdelrahmanfekry375@gmail.com,
	santiagorr@riseup.net, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	kernel-newbies@vger.kernel.org
Subject: Re: [PATCH] media: atomisp: coding style: Move trailing statements
 to next line
Message-ID: <aejE4jOqKHt1FL-N@kekkonen.localdomain>
References: <20251126190026.37436-1-ayushkr0s@gmail.com>
 <aeQDxUI8F1b7Hy8s@valkosipuli.retiisi.eu>
 <CAHp75VcyO4rJMyVyUP6aKLugEBik_FPsyO4cgbPkTgnKUzhG+A@mail.gmail.com>
 <aeTOgEq9X192XPgG@valkosipuli.retiisi.eu>
 <CAHp75VcHXFr3PrmxyE7FxvzTwkCrPpHKc+6e=ziXCGFrBY269g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VcHXFr3PrmxyE7FxvzTwkCrPpHKc+6e=ziXCGFrBY269g@mail.gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[iki.fi,gmail.com,kernel.org,linuxfoundation.org,chromium.org,riseup.net,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-59336-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MAILSPIKE_FAIL(0.00)[172.105.105.114:query timed out];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 3F7ED446629
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 09:34:06AM +0300, Andy Shevchenko wrote:
> On Sun, Apr 19, 2026 at 3:46 PM Sakari Ailus <sakari.ailus@iki.fi> wrote:
> > On Sun, Apr 19, 2026 at 11:32:45AM +0300, Andy Shevchenko wrote:
> > > On Sun, Apr 19, 2026 at 1:20 AM Sakari Ailus <sakari.ailus@iki.fi> wrote:
> > > > On Wed, Nov 26, 2025 at 07:00:26PM +0000, Ayush Kumar wrote:
> > > > > Adhering to Linux kernel coding style guidelines (Chapter 3: Indentation).
> > > > >
> > > > > Signed-off-by: Ayush Kumar <ayushkr0s@gmail.com>
> > > >
> > > > This has been addressed by commit 003c2c39ec77c84d704ee8effe170fd8658fde0b
> > > > in my atomisp branch.
> > >
> > > Btw, can you rebase your branch and drop "staging" word from the
> > > Subject in all current patches?
> >
> > Good question. The staging: prefix has been used in the past for atomisp
> > patches and a lot of the rest appears to be doing that as well but
> > definitely not all. I don't really have an opinion but we should do that
> > consistently whichever is chosen.
> 
> I believe you were Cc'ed to the (private) email response from Hans
> where he explained why it should be dropped. Let me find if I still
> have it and bounce to you.

AFAIU, those reasons haven't been applicable for a few years now.

Most patches to the staging tree have staging: prefix and "staging: media:
atomisp: " appears to be most common for atomisp based on a quick look.

-- 
Sakari Ailus

