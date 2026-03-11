Return-Path: <linux-media+bounces-55353-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGGtOX8zsWm0rwIAu9opvQ
	(envelope-from <linux-media+bounces-55353-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 10:18:55 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2170E2602A6
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 10:18:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 249253000518
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 09:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF50F3BF671;
	Wed, 11 Mar 2026 09:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fyj1QwQ1"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EF53C555E;
	Wed, 11 Mar 2026 09:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773220510; cv=none; b=Sn+25s+mhgc9w06RjlFTVnuQX+n1ZclHBsUtUzBxJw49ClMEvRcxeDBrg4DHyaBZagpOkN3MPsw/lrE/GUI+JA/lT6Ak0pNPOUIlwkhVUwRcuOPqMk8pmJqt6HQVg+KoUexQoPq8C3kR/1LeQd3tNxuGhdslR6h73ZyJAmz5zZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773220510; c=relaxed/simple;
	bh=gep9q6y8/u2CtlHp6ylZWa2AkWo3bjFyDR/+rL2T62U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DZOzLryfOsaGItbniCAn/tBttD4H4jKQVMWiEDXyVyPyfNy26I/3tDPN5q3Q6EBsDxZofeFvndBmvzy9TcX7vPmZjpIQcJy8HAGlSdXm55CrI6s9o31QHMHb+1GCtx2L97YMFkQKrAPdCe03tQObVuZt0+V4BLH7Y80g7lhVcwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fyj1QwQ1; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773220502; x=1804756502;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=gep9q6y8/u2CtlHp6ylZWa2AkWo3bjFyDR/+rL2T62U=;
  b=fyj1QwQ1kb+fApAiN9J1rZmT3PWbqvq/EBfN8zosGObdTh0BTSw9K0id
   dLzqKszIOEkLd6YEO2DsxnVfYvTrloqv7sScLUEnx3jUii7JcVuMyKZ+C
   1GOhfLASAYXzZvIQqt6m72sCwqtIwrxulVxtk7mLeG6hCrXxbE4SO612x
   5f2hx4VyVpg5qd/WeI48kCUiVNODa/zh/1QqVCSkjSStDdu6D5T/+Qw1d
   WbsAFtJv1/+D/xWL/2EwdSPo7wi19OkZHg4gyJVeEm9LxVXrruWRTneU7
   12iKnG8CaUeSK0WTzITTVzuHHr0sBw6OFFmBl3VylsPKX6mseBkfp2xnt
   Q==;
X-CSE-ConnectionGUID: qGDmvqK8S+uUMD+nWT4KUQ==
X-CSE-MsgGUID: sDirN69xTDGjz0Z/Cv8K7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="61855826"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="61855826"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 02:14:58 -0700
X-CSE-ConnectionGUID: Mwmg/vQmRGWsDmSoRZuG2g==
X-CSE-MsgGUID: GCx5odoySSqeDRcpARBtTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="258313001"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.171])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 02:14:57 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 013CF121D1C;
	Wed, 11 Mar 2026 11:16:51 +0200 (EET)
Date: Wed, 11 Mar 2026 11:16:51 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: "luo.liu.linux" <luo.liu.linux@163.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH v2] media:v4l2-async:add debugfs under CONFIG_DEBUG_FS
Message-ID: <abEzA_aZyr125D07@kekkonen.localdomain>
References: <20260121031456.1125096-1-luo.liu.linux@163.com>
 <abET_OcHYr5_wpdK@kekkonen.localdomain>
 <24d41d72.7da6.19cdc1e683e.Coremail.luo.liu.linux@163.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <24d41d72.7da6.19cdc1e683e.Coremail.luo.liu.linux@163.com>
X-Rspamd-Queue-Id: 2170E2602A6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55353-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[163.com];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:dkim]
X-Rspamd-Action: no action

On Wed, Mar 11, 2026 at 04:58:26PM +0800, luo.liu.linux wrote:
> 
> Hi Sakari,
> 
>          Thank you very much for your reply and reminder.
> 
>  I think  two latter #if's  is useful，While modern compilers (such as GCC and Clang) possess "Dead Code Elimination" (DCE) capabilities and can optimize away function calls when CONFIG_DEBUG_FS is disabled, 
> 
>  explicitly wrapping the relevant code blocks with #ifdef CONFIG_DEBUG_FS remains a standard and necessary practice in Linux kernel development.

Just fix it, please?

-- 
Sakari Ailus

