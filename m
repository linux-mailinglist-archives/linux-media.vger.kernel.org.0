Return-Path: <linux-media+bounces-57220-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIjxKShmxmnnJgUAu9opvQ
	(envelope-from <linux-media+bounces-57220-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 12:12:40 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 418293432C8
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 12:12:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 39F18304307F
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 11:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7C823DFC80;
	Fri, 27 Mar 2026 11:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d7MluYe9"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A301C3ACA4E;
	Fri, 27 Mar 2026 11:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774609869; cv=none; b=dtbqgxqpmkr9IYUi0906NjJTyAa2dhlPx4Z4TQFWQJB3RPnXXS+r2k9LbTuCAPlVNhwJstxkcIYBOvaOf+vfU2d7IgG7GTaV6nQc6dOzrnm7O8z3sN2yiwjCdlvkZGvUESJOGmJs9Pb6WEQDGbqo/SUwNwYrlNjbeDa2b/URizY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774609869; c=relaxed/simple;
	bh=KWTxbWtHXsjI+mpUK5s7SUAbfDdT7EgWH8G6b4L95CA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IBLP834v2OKFdEsGiYXFobz6228egf7HL30nV2HGTj1k+Gem6b90/3Q73z8jNglKqPlgal9zTcm6qZ8cOTmgcz/Pq9UOZgGaHJYr/VUAzMP7vI6+2EqMyomw5QQ/O23KyndQx7NiIIWeSyUywJyUNUWvJlJmlryfKFuo04jFhF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d7MluYe9; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774609863; x=1806145863;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KWTxbWtHXsjI+mpUK5s7SUAbfDdT7EgWH8G6b4L95CA=;
  b=d7MluYe9A71Hxd1SUbDc31z3SB10y8ie7TLjuXzvEBx2ddYCyA3rjTtz
   bkPsiboo3SRIQlJRCWkaDw+8l/Bo77o/zSqHZZUjokOg+8inycOK6Ui3G
   Teo5iqkY2fOhlBq4f1uj28YI4ETx6az+tHIjpWPfgbdiuSm1N6XNinSyz
   xRhtvrIdPlDDnrYObziCiBlgjlFSYc7Lo2o6SE/X0wQeRa5X21zUrnPPG
   /IeUhnJvJHJQ4cGFXNRTr9p9doAB+02pb4vU3aZ4H1zYUXKd/er8vnZGm
   55zPjBo0pRpT+HODFUnYokH6AMoGTPXXJnKPtVbrkAhxstCb/Xd98YnVY
   Q==;
X-CSE-ConnectionGUID: cGDZ/5ZxTTKJXjzcWcpuOA==
X-CSE-MsgGUID: eQxjLCpVR7GNy0UjP8Xlxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75746792"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="75746792"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 04:11:01 -0700
X-CSE-ConnectionGUID: 0PUrURj5T4e0KoJal+Tmpg==
X-CSE-MsgGUID: MfH00wg2SheleZ0qmdwWdQ==
X-ExtLoop1: 1
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.127])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 04:10:58 -0700
Date: Fri, 27 Mar 2026 13:10:56 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chethan C <mail.chethanc@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Petr Mladek <pmladek@suse.com>,
	Osama Albahrani <osalbahr@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] staging: media: av7110: fix coding style
Message-ID: <acZlwLpm9oMODXjc@ashevche-desk.local>
References: <20260324184259.694280-1-mail.chethanc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324184259.694280-1-mail.chethanc@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57220-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:dkim,ashevche-desk.local:mid]
X-Rspamd-Queue-Id: 418293432C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 12:12:44AM +0530, Chethan C wrote:
> Fix indentation and alignment issues reported by checkpatch.pl.
> 
> Rename enums av7110_rec_play_state, av7110_type_rec_play_format,
> and av7110_encoder_command to follow kernel naming style.
> 
> Rename wssData and wssMode to wss_data and wss_mode to avoid
> camelCase identifiers.

TL;DR: one hunk should be not touched (see below).
Otherwise LGTM.

...

> @@ -551,7 +573,7 @@ static ssize_t dvb_aplay(struct av7110 *av7110, const char __user *buf,
>  			if (nonblock)
>  				return count - todo;
>  			if (wait_event_interruptible(av7110->aout.queue,
> -						     (dvb_ringbuffer_free(&av7110->aout) >= 20 * 1024)))
> +			(dvb_ringbuffer_free(&av7110->aout) >= 20 * 1024)))

This change is wrong.

Also one may consider to replace 20*1024 with proper HZ-dependent value.
(But the latter one should be done separately.)

>  				return count - todo;
>  		}

...

> -		av7110->wssData = ((d.data[1] << 8) & 0x3f00) | d.data[0];
> +		av7110->wss_data = ((d.data[1] << 8) & 0x3f00) | d.data[0];

Another side note: This kind of changes can be properly converted to use
get_unaligned_le16() & GENMASK(). But it's another story.

-- 
With Best Regards,
Andy Shevchenko



