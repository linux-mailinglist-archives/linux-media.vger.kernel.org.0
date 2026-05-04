Return-Path: <linux-media+bounces-60261-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id LfZ5I9Bk+GkAuAIAu9opvQ
	(envelope-from <linux-media+bounces-60261-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 11:20:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C98094BAD91
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 11:20:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 67FCE3006003
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2026 09:20:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1958537756E;
	Mon,  4 May 2026 09:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ypn+5Ppj"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4F937702A;
	Mon,  4 May 2026 09:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777886405; cv=none; b=Bv57R0v9VXb8SGlHQ+44/3U1oL8eoQRPMCUL7duPoKs63urbTF7VRT9d7XH2ICvrEWUwUBy5orczxVFm144RouGnq+CPiMS8oyfWhTkJSYNACT/QVIftmtrE3Ue7znwKtApV2l4A4WRcotmm9FBKQHTX072PSApCIrQQqjbVrUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777886405; c=relaxed/simple;
	bh=yupxrrPMZBoEUv4zEx6yv+pw0K30bFRGJXzOH7fKlYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=riJjUv1ljW8FwGETwt9TFwwswOqr/zR4W2u9NIN0Uu7ostNFIKHgapdvdcTNXR3NjOBvUBl+a82GSJgxM3gfn8C4thf450ZpplQBi455gvIyzlEThw0V8VHjZXwaTicqZz+dVw8Ws+HnIh3oklmZ1xLLbqa78UJ2ya4ibe08R+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ypn+5Ppj; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777886403; x=1809422403;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yupxrrPMZBoEUv4zEx6yv+pw0K30bFRGJXzOH7fKlYQ=;
  b=Ypn+5PpjnuDhYsdfrhvlC6RKCW+uoEyAqlpVm8nLIxnBfjfB4a/uJPsZ
   uDNyCyW1AFMSXjo5GpA+6XuR2TrLLEcNVxp6ppxDNFComX59CSBD4AOB1
   QbdyZQhFZ9VrbXjtx0oW8JGFPu1ptD2NpkX0AiaEhhvWwS/6wtObH6eZi
   EdbL8RB9yiCvI8vBU/GNuUjMTVBLwpbidZ+ywy3p+GFpzdNY9/EL5kCk7
   sCJE6QIfmkPbdNkF8xjuWPCAGKBPdgRbnnjK9LMceNjrC9xL6gRftQByR
   krfvxeUfEwFA3w6dGup4X6p326aBOjOK6ryZ50CEv56OOZji2PRHYbVKp
   g==;
X-CSE-ConnectionGUID: anH+5T9BR/Ogvp77HIGZtg==
X-CSE-MsgGUID: WxFXfdLFS2uxweXn378INw==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="78732170"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="78732170"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 02:20:03 -0700
X-CSE-ConnectionGUID: dUg4em3cRuiM6xkO6m9NfA==
X-CSE-MsgGUID: jCnSynjuRaO8TvxDy36VuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="265814320"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.78])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 02:20:01 -0700
Date: Mon, 4 May 2026 12:19:58 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Stepan Ionichev <sozdayvek@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: fix typos in
 input_formatter_rst() comment
Message-ID: <afhkvt283Okjs0Xy@ashevche-desk.local>
References: <20260503164755.1899-1-sozdayvek@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260503164755.1899-1-sozdayvek@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: C98094BAD91
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-60261-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ashevche-desk.local:mid,intel.com:dkim]

On Sun, May 03, 2026 at 09:47:55PM +0500, Stepan Ionichev wrote:
> Fix two typos in the TEMPORARY HACK comment in input_formatter_rst():
> 
>   WICH         -> WHICH
>   STREAM2MEMRY -> STREAM2MEMORY
> 
> No functional change.

NAK. There are a few reasons why, please start reviewing others' changes
and learn from other reviews.

-- 
With Best Regards,
Andy Shevchenko



