Return-Path: <linux-media+bounces-55076-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oORQDMj7r2mmdwIAu9opvQ
	(envelope-from <linux-media+bounces-55076-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 12:08:56 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8F624A027
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 12:08:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B0433303D5F0
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 11:08:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E4733859DC;
	Tue, 10 Mar 2026 11:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xyk6G+f3"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72341383C64
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 11:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773140887; cv=none; b=YMirCWaHBaa9uivJe2JJ5FBN9mjSlKpSxYfUfW5X6OKfGsSD7pgelI+hxKzCYeTO8Cxt5Pz4DI7oL5yqzl2sEYGmLJfvdK+djugJe+VqlTk0OL69qjL4EYVlYyEmhkdPIwXdFlE/fSWJ+W0oEakLcMdN5tCKTAcOdnFN4eH9cT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773140887; c=relaxed/simple;
	bh=U+kTVIi4DIwOF3yJfvB1v4x1/RdF+BoibNgxQdUXGfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mqnkymhV8dXrSLa9HKqIlfxWhD1uYE+2Bw6wYFXsKQ3ZmvCaX6FUNhK6WdVyMa0Qo46PkOEEdt+AXiGl01Qy8m5UFQ/GpUSTTJfmodKpA9Djd7Ef76JeuATyw+V+5SnMV0PAq3oqwr2hPnSvTPFMlu5lMO01+7Yn9QYUf1ing6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xyk6G+f3; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773140886; x=1804676886;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=U+kTVIi4DIwOF3yJfvB1v4x1/RdF+BoibNgxQdUXGfI=;
  b=Xyk6G+f3ZvwgSIIX4Kub2M8tfvOuifX3jVeHQ1P4AB/DAOV5pXRnOsnf
   bYjTdSzp3jgnqDFqZWEutaElgDWV4BEK4Sr/xSQSNJ7jzkJYIhHhiwxdW
   ENDqL7K15vOb/rmh322mQQ0xVTXxBcA4qq2MyyrcH+V1M4oS/QtVhqnTA
   DM5JoE9JqeGjYdOnD4GaZCO5F9B9V6x0nwKGa6l8CQAn2EDg7AsWc5D1z
   yvMAIwgcrkJME8sto4FodJZDfpAHI7thOxzkH0AgXpr1WhMtchkC1GTk8
   NuEj2A1NTYOMD0B3htGua2qyF9dsnXDqVjT3ltXiajWDb30+cvURBhy2y
   A==;
X-CSE-ConnectionGUID: ZqEQ7rZ1QBmZn3N0XoCImg==
X-CSE-MsgGUID: XDj8MvGGSNqJ9GLKsTfJLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="74260522"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="74260522"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 04:08:06 -0700
X-CSE-ConnectionGUID: 9OKHpB0iQ+K3wuRpVfNcfQ==
X-CSE-MsgGUID: mfNRDiPTT9y+R9U1noWWyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="224762949"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.26])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 04:08:04 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 53BBC1206B6;
	Tue, 10 Mar 2026 13:08:36 +0200 (EET)
Date: Tue, 10 Mar 2026 13:08:36 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, Shawn Tu <shawnx.tu@intel.com>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH 6/6] media: i2c: og01a1b: Add support of 8-bit media bus
 format
Message-ID: <aa_7tBqp9Qk_yvdg@kekkonen.localdomain>
References: <20260226133739.4050870-1-vladimir.zapolskiy@linaro.org>
 <20260226133739.4050870-7-vladimir.zapolskiy@linaro.org>
 <aa61R5mcCE1zu125@kekkonen.localdomain>
 <aaea7acb-87d9-4cfc-8af2-fe630c3c0095@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaea7acb-87d9-4cfc-8af2-fe630c3c0095@linaro.org>
X-Rspamd-Queue-Id: BA8F624A027
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55076-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,kekkonen.localdomain:mid]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 11:56:03PM +0200, Vladimir Zapolskiy wrote:
> Hi Sakari,
> 
> thank you for your review.

I fixed a few issues on error path of enable_streams callback while
applying the set , no need to resend.

-- 
Sakari Ailus

