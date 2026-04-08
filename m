Return-Path: <linux-media+bounces-58225-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OM5IGuA71mlZBwgAu9opvQ
	(envelope-from <linux-media+bounces-58225-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 13:28:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFDB3BB3C0
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 13:28:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 868C73036EE7
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2026 11:25:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75A623B47EE;
	Wed,  8 Apr 2026 11:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RIwHauqU"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8A037AA98;
	Wed,  8 Apr 2026 11:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775647546; cv=none; b=YQj2pvkOUzOdzH4RW6C8hbuukF+IEIMrdUOuB8/8uAgNyni0/miagKK+Ui0zMRIc2bSNdiycjgWVXJmd+dU78y185hIExYLnE3MElUlMXriExq44IJdMvz58F7B1BIeMkdXh9g3ET/eOkCJTXSuRkkA5TIdYbBfo3eZQXmcrt3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775647546; c=relaxed/simple;
	bh=5BrFqpyRJzwsfxl90r+X8WZuBttQIxpUJ1hvL5OfuEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dgp1ofHPrrxZLr1ZsHD7eVzKNnFoKse2u1KqOy9iE76uTeDs9PzlVWXMVnMRo3s44Qiv4GE5sLRHDY3AzZWfNVQh1XNYCwB+kG0dkXqCDP0gHLJyPXNkVWYjh+Y6xpxGLg3Avp3RVlWmunA6ausuiTO4bv3XgrAK7waPfEPq6J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RIwHauqU; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775647545; x=1807183545;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=5BrFqpyRJzwsfxl90r+X8WZuBttQIxpUJ1hvL5OfuEE=;
  b=RIwHauqUlikUSwF6Rfkfw6GaA3T5+11s23qNFlTaA5XioefjxW3R5Ft2
   bdpPgM9bE+H75dl6RSHzgECfMujQgj81GDdKqpPcFqv7puFpHRQfSi37s
   zq3evISwuLbztfraYp2BNdWmoDl9OGpQU/I7iQ1iysoezdIDSwKRk2RGN
   8ZY5ixIlP6Q1uFeqmhy1aU44rPfMwoliaKaEKCe7deOMuVEc9ALU6TSrh
   SUuyH+Z31lES908dZqt0lIqgSk6EiEGYWozFsIRuo4tKBgX5LkqHJFhIP
   ag7yDZDq39CFmwQcSQ9/21PohSIiKifpjAo0exZXgvJiVY9OD9/06um3Z
   Q==;
X-CSE-ConnectionGUID: 6/ZPeImjQUevNZiXgcSxqg==
X-CSE-MsgGUID: k8G7UuP1RQqFPBcTX+JH9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="94016647"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="94016647"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 04:25:45 -0700
X-CSE-ConnectionGUID: ToOl7FcHSTisCYR64WCsuw==
X-CSE-MsgGUID: LReqqUBnSjynZKPSjs1zCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="251592214"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.72])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 04:25:42 -0700
Date: Wed, 8 Apr 2026 14:25:39 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chethan C <mail.chethanc@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Petr Mladek <pmladek@suse.com>, Kees Cook <kees@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Osama Albahrani <osalbahr@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7] staging: media: av7110: fix coding style
Message-ID: <adY7MwE5dorn9FlT@ashevche-desk.local>
References: <20260328165049.899917-1-mail.chethanc@gmail.com>
 <CAGhNHKgiMQ1Km-JZKQTfkw6aXh-KDKM3gjKyNiyhRwQRvyptPA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGhNHKgiMQ1Km-JZKQTfkw6aXh-KDKM3gjKyNiyhRwQRvyptPA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58225-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,suse.com,gmail.com,ideasonboard.com,vger.kernel.org,lists.linux.dev];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[checkpatch.pl:url,ashevche-desk.local:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim]
X-Rspamd-Queue-Id: EEFDB3BB3C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 08, 2026 at 10:33:28AM +0530, Chethan C wrote:
> Hi,
> 
> Just a gentle ping on this patch.
> 
> I wanted to check if there are any comments or changes needed from my side.
> 
> Thanks for your time.

You need to:
- do not top-post!
- do not quote hundreds of lines just for this message!
- wait a bit more, we are almost at the merge window time, quite unlikely
somebody will take this right away
- the Subject should have "staging:" part to be dropped; all media patches
are started with "media: " even for the staging folder

Also note the formatting patches are lowest in the priority.
If you wish to provide a real contribution, try something else. For example,
one of the listed in [1]. It's not that your patch is bad or unwelcome, no,
this is about the change that does almost nothing to the driver that needs
more real work.

> On Sat, Mar 28, 2026 at 10:21 PM Chethan C <mail.chethanc@gmail.com> wrote:

> > Fix indentation and alignment issues reported by checkpatch.pl.
> >
> > Rename enums av7110_rec_play_state, av7110_type_rec_play_format,
> > and av7110_encoder_command to follow kernel naming style.
> >
> > Rename wssData and wssMode to wss_data and wss_mode to avoid
> > camelCase identifiers.

[1]: https://gist.github.com/andy-shev/a2cb1ee4767d6d2f5d20db53ecb9aabc

-- 
With Best Regards,
Andy Shevchenko



