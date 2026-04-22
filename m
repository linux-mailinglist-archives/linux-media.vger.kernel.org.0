Return-Path: <linux-media+bounces-59293-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PHkBAmC6GnJLAIAu9opvQ
	(envelope-from <linux-media+bounces-59293-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 10:08:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F7C44344F
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 10:08:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B040307AAFC
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 08:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A4B437D105;
	Wed, 22 Apr 2026 08:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g+sXXXUk"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C0037B40E;
	Wed, 22 Apr 2026 08:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776844977; cv=none; b=jlsRnFBIIpQImC1MCK5SurNmMXKznN3XWuRErXWa/B3bF2KJ7GSIBucZ8BSo9+Z5VWan3IzhHIqLAuLU0YxYFWp6dNroCnNSEwH5tx4SYmvq4SFBvgabe87ko84R3eHvf9qQdA3zcb6vjoD/+XCDUvEdS7uTk+iViFSdfxiAbNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776844977; c=relaxed/simple;
	bh=Omg1d/W+ndiF9bFlPfj5R1718GeliZQAVgOpErVhKno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lBtK4pE5hqGIb/wVdBGSXs66POUmz0vesqUIE9cSVQIcQJFpL8ptNXxE5ffBz2aVGmQ5Wq2UPBzOxvJ9Fzu+6GzO1QkQ2vCcG7TGYLaEnPmhN7cEdWPmzDZXhUwNixlxKFOlIpK+grhvN3rZe4F00+ZdadNE//g3+NGVCRbiIsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g+sXXXUk; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776844976; x=1808380976;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Omg1d/W+ndiF9bFlPfj5R1718GeliZQAVgOpErVhKno=;
  b=g+sXXXUkWcfjFdS8xmK0Aa5wlniVnOAhyqHMazof+LpyrK+U/fAKkFFs
   Qm1ULd5Iyb5PerFwEcVJ114w4mVsQGL5OH1kZZcpbqWhm1vhvw+JduzMS
   XMF/WaarhnhrkCngDdiUO82FGiF8xrQlbTVfyEC6oNviLyjyPBAXcBgec
   ka96ylJ8VlFYGqpkN6SVP2wLS2qd2NR/jl846s2tdlyvxl6LKuW6HnZ0T
   WYf1MH4BffzKAMSrr9NxELAy7YT5wAOiwYeWhC2RBf4cer3l/CS92dBB8
   STfUuJQcsKS7k5rkh4de6uIJ75zvR9jsnLCpRSpbY58GXK6U7+3nAEr1z
   A==;
X-CSE-ConnectionGUID: rMCSCoJZS4GLl9MeECxU5A==
X-CSE-MsgGUID: IcaKg7BKQq6JBaZszxxoMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="80379608"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="80379608"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 01:02:55 -0700
X-CSE-ConnectionGUID: D4sHSJ+nSHCfYiL2yUWOOA==
X-CSE-MsgGUID: s1eMzOccSOaEu9y1smyTpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="237325545"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.208])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 01:02:53 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 74643121CC8;
	Wed, 22 Apr 2026 11:02:51 +0300 (EEST)
Date: Wed, 22 Apr 2026 11:02:51 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 5/5] media: i2c: lm3560: Add support for PM features
Message-ID: <aeiAq_eep_fqwewN@kekkonen.localdomain>
References: <20260419093412.40796-1-clamor95@gmail.com>
 <20260419093412.40796-6-clamor95@gmail.com>
 <aeepbB72uWDxvnE_@kekkonen.localdomain>
 <CAPVz0n1sNoJv=JcAZdv3srRY0vecrRO0spnqg58-VLnYdkfPSw@mail.gmail.com>
 <aefXJebe2F4Z193F@kekkonen.localdomain>
 <CAPVz0n111oHa2UdJ9LO8PTYcRuAmUem6tQdPKABRq1YHH8ZDgw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPVz0n111oHa2UdJ9LO8PTYcRuAmUem6tQdPKABRq1YHH8ZDgw@mail.gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-59293-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 73F7C44344F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Svyatoslav,

On Wed, Apr 22, 2026 at 09:29:51AM +0300, Svyatoslav Ryhel wrote:
> Noted. Any changes required into the other patches of the patchset?

Please see my reply to the bindings.

-- 
Regards,

Sakari Ailus

