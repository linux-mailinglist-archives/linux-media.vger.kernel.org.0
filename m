Return-Path: <linux-media+bounces-57207-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0P2tBldRxmk2IgUAu9opvQ
	(envelope-from <linux-media+bounces-57207-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 10:43:51 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9A6341F16
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 10:43:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E9F403032DDF
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 09:43:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E94163DBD64;
	Fri, 27 Mar 2026 09:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bqMgOzzm"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF393D6689;
	Fri, 27 Mar 2026 09:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774604622; cv=none; b=RhpFw/6mMTORpZnt/akUuAPjA0tNS34+yHPX4NRP4szRlrR/aZ0fMsFSS1P1WE9jwUyjqHCf97UN1qxKHmBTjBS7hxY+OV9cMK89lGuMqRZGElsdl4BH2ght3sxh/Caf3BLMc4lxqG+A/V4+RrBgQWyElcK/RD3rv00E/Hq2oZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774604622; c=relaxed/simple;
	bh=bamylWmR1vZQv59hRve1pmEGjn26j2CB5bErqvtB8Qg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iu6xfKvfkHQMQX3TjYAfViTxtYulLIMFxEB45VSooloi7Fbfu5WGWwFVoCfAvsK0iVS+9DHRKDEu+ra/lnyqu3E11MI/AoC7+8+s9fBYQAnBZW25bRDIvXQrz4FO83EHG+u7UfEjb6f7UPu18+bMpnnc7X5MqOw9/EAK5Qo/qjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bqMgOzzm; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774604619; x=1806140619;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bamylWmR1vZQv59hRve1pmEGjn26j2CB5bErqvtB8Qg=;
  b=bqMgOzzmuBA/1W2+xaRLy0SNkwuCHnMNyVRGTNvZqqshQJTd2FGXXSpP
   Q6fXq8lyKMzQ+rS6vGKZom1Zt2LwdP1HxW5bHuacCteuWUMqf8Et97+6z
   ziFJch7/Uun2UDoae8Vxt2YFXtFrUQ/g5n/ZVn56LnQF25X0NATJiDdya
   71SsXemvALxSe1urjHsKZFgg3UjJ7nZOxz9bjXA/SuBSNFjCltd8M9+V0
   FXfSdOlohXnratP3CCotKCHHJL/YbQJldlIndLsEIp8p9U7wBSkW0KkKA
   cmMeCkyq1KuZafzsyFtdJYMXdppV4CSebzJqKdxpoWwdPImFMZRkhoi+u
   w==;
X-CSE-ConnectionGUID: 9NLwlnOZROWxKmqlcrx3/g==
X-CSE-MsgGUID: mhN7TAWSTV2CyETtNaLe7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75874415"
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="75874415"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 02:43:38 -0700
X-CSE-ConnectionGUID: yHth6d7qQe2fetxs3XPzqg==
X-CSE-MsgGUID: IwziyWdCTkeiB3hJCQoLjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="224313057"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.127])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 02:43:36 -0700
Date: Fri, 27 Mar 2026 11:43:33 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Anushka Badhe <anushkabadhe@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, hansg@kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Subject: Re: [PATCH v6] staging: media: atomisp: fix GP_TIMER_BASE scope in
 gp_timer.c
Message-ID: <acZRRXXBoflHV0rt@ashevche-desk.local>
References: <20260327031106.10386-1-anushkabadhe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327031106.10386-1-anushkabadhe@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-57207-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ashevche-desk.local:mid,intel.com:dkim]
X-Rspamd-Queue-Id: 9F9A6341F16
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 08:41:06AM +0530, Anushka Badhe wrote:
> GP_TIMER_BASE is only used in gp_timer.c and it does not need to be
> globally visible.
> 
> Move its declaration from system_local.c to gp_timer.c and make it file
> local by marking it static. Remove external declaration from system_local.h
> and its usage in gp_timer.h
> 
> This fixes a sparse warning about global visibility and cleans up
> unnecessary global exposure.

...

> ---
> Changes in v6:
> - Mark scope of GP_TIMER_BASE static

Good catch, but read my comment against v5. And slow down with new versions,
no new version within 24h, please!

-- 
With Best Regards,
Andy Shevchenko



