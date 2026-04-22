Return-Path: <linux-media+bounces-59319-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHW6JiKw6GldOwIAu9opvQ
	(envelope-from <linux-media+bounces-59319-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 13:25:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB447445418
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 13:25:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF1F430580B2
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 11:18:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBD343CAE88;
	Wed, 22 Apr 2026 11:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U9oLlnPX"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8395734889F;
	Wed, 22 Apr 2026 11:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776856717; cv=none; b=DVUELnomajjiGLHv05Uya+kEILjV7gx61ZJVxpgwlAt/RlyJYyKqoSkktb+iH1IumLHVp/QEhSTek70uoP7Qc5E0wCleaBKOEvjFig0MuR9F+qoa4OX8I3TGsTQ6YZiP4vO8wxEMf3iYm2jzttGCVulBLHVmUL+gMRFdTiwEnig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776856717; c=relaxed/simple;
	bh=gDjwcCChdvtAeH+MMfliaxGsFvRSGqlQr5pYzGSE8Sw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QCgA6JCUwKuV2l12nhxpGnURq1s3FqXLRinbfTaKTVX9AKN2yWFSkeIjbvzyuXusrQzwWIzRxD/VHewG3Nj2voHpla9xKblFwP/NumjPDUXd4OAqw2951ngjhifEOWQfg6X0tPpCMIMZnVxDvKL56uOCg/z7KTlEYRQE88i1B0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U9oLlnPX; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776856716; x=1808392716;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gDjwcCChdvtAeH+MMfliaxGsFvRSGqlQr5pYzGSE8Sw=;
  b=U9oLlnPXtwOAO4+Hh8Q+6HHEfVbGaCbydkohltxx7PCiwkqTE1HJi+us
   rCkvPPEeMLJxA2c20i4pVleRAH6KvPbh/ZKcZISHqpnjdO8PdinPzLtfw
   Dhc2JCqv34wb59lbR4KZHcU3DC+LIvs1XbXLmgdgFZIEtz2CsysTQb7gI
   GZA3aivKVAaiSefgS9T25vkgjvlo59OBNO+eIDyA1LiHHPiU0eSm/SgqP
   i5+Pl0z6DaTFGxQTztcq/wskMthhKAb5i2cvqqig6VRM23mXUflqGwsGc
   cjyoUoklfu8tW/zcaB+sqXB55b2QONlizbT3TUJqMwvpEImmnd0QQvDfn
   w==;
X-CSE-ConnectionGUID: ih+sNJPzRz+OHeOA7+Fnaw==
X-CSE-MsgGUID: PvFS2tr/TmyXUc4OUWMLBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="77682460"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="77682460"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 04:18:35 -0700
X-CSE-ConnectionGUID: Y/PVAj7fS6+NKBe3uM1AlA==
X-CSE-MsgGUID: NQN6LeeNQtaZIPVgLRNMKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="232231203"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.208])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 04:18:33 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8B7EA120D05;
	Wed, 22 Apr 2026 14:18:30 +0300 (EEST)
Date: Wed, 22 Apr 2026 14:18:30 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Debjeet Banerjee <debjeetbanerjee48@gmail.com>
Cc: andy.shevchenko@gmail.com, andy@kernel.org, gregkh@linuxfoundation.org,
	hansg@kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	mchehab@kernel.org
Subject: Re: [PATCH v3] media: atomisp: csi2: Fix DPCM decompression for
 source pad format
Message-ID: <aeiuhvqcT189lL5U@kekkonen.localdomain>
References: <aeinCTZwB871zRAd@kekkonen.localdomain>
 <20260422111649.9604-1-debjeetbanerjee48@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422111649.9604-1-debjeetbanerjee48@gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59319-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,vger.kernel.org,lists.linux.dev];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kekkonen.localdomain:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim]
X-Rspamd-Queue-Id: DB447445418
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Dabjeet,

On Wed, Apr 22, 2026 at 04:46:49PM +0530, Debjeet Banerjee wrote:
> On Wed, Apr 22, 2026 at 01:46:33PM +0300, Sakari Ailus wrote:
> > It may well be but the rest of the driver doesn't appear to support DPCM
> > uncompression. Rather than trying to pretend it does, I'd instead just
> > remove any references to it.
> 
> Thanks for the feedback Sakari.
> 
> So if I understand correctly, the right fix here is to remove all the
> DPCM-related dead code: compressed_codes[], atomisp_subdev_uncompressed_code(),
> atomisp_subdev_is_compressed(), and atomisp_find_in_fmt_conv_compressed()
> declaration 
> 
> And in atomisp_csi2.c just keep the source pad copying the sink format as before, 
> but drop the FIXME comment since we're explicitly acknowledging DPCM is not supported?
> 
> Please let me know if I'm on the right track before I send v4 of this patch.

That's how it looks like to me, too.

-- 
Regards,

Sakari Ailus

