Return-Path: <linux-media+bounces-57890-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id df/iAJlKzWl6bgYAu9opvQ
	(envelope-from <linux-media+bounces-57890-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 18:40:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6560937E0B2
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 18:40:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E1FD30CBE28
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2026 16:26:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2222147A0DA;
	Wed,  1 Apr 2026 16:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b="AW2WpwAg"
X-Original-To: linux-media@vger.kernel.org
Received: from spark.kcore.it (spark.kcore.it [49.13.27.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FB94611FC;
	Wed,  1 Apr 2026 16:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.13.27.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775060747; cv=none; b=Zykm6fhxMEt40dDigDaNOZQUSjJKYrb8FJBqw9JbyY/QgdCDJdT8/O2jAxFpQQc5YKS2hL4ApJzVKwh47DUk0fPyO4cpsDUoj56vdcm7+DNC2Igj4M9Jof2S17nBnYNCNxOYOFmYzJhzPCgTCpjIAB5Ot3QRqJKBytO/P2XrbKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775060747; c=relaxed/simple;
	bh=wpnjhx/C68btOAdCBWC8ZJgFz4cAl1hElwC12d8xbmk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:References; b=m4KuO/bUF7F5sKej+uFS3gAdnWdE7HUggWleokw6d3aevhGZ8C5gEPPrdCtIqKyPogc8lbsFneABbCgxIcTBEFwLktmasJVyyE3XoPRXX5m0gjyD0cHavBjKrKE6fojUDWy5jBQO/Zg84AsJAnHhC+3V0/YC2ZmVqs1bI51F52M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it; spf=pass smtp.mailfrom=kcore.it; dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b=AW2WpwAg; arc=none smtp.client-ip=49.13.27.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kcore.it
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kcore.it;
	s=spark; h=References:In-Reply-To:Content-Type:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=wpnjhx/C68btOAdCBWC8ZJgFz4cAl1hElwC12d8xbmk=; b=AW2WpwAgZJJyoh+NItKgrha/+P
	fyvQFIJ9C3Pzgq4jgmg8El0cz+xyraDZYEBCAqNphc3JH4M4UhCxOQr7EDH0VKV6HzKG2y6ljvd7l
	SyvU41aSDUHNmyDR6C5+alrjhj+6+P8+uMsbuJYsjj8bqvfaYYjVO1whhXDRHRlk0fRU=;
Received: from mnencia by spark.kcore.it with local (Exim 4.96)
	(envelope-from <mnencia@kcore.it>)
	id 1w7yNn-006hhJ-06;
	Wed, 01 Apr 2026 18:25:31 +0200
Date: Wed, 1 Apr 2026 18:25:31 +0200
From: Marco Nenciarini <mnencia@kcore.it>
To: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com
Cc: bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
	stable@vger.kernel.org, andriy.shevchenko@linux.intel.com
Subject: Re: [PATCH v2] media: intel/ipu6: Improve DWC PHY HSFREQRANGE band
 selection for overlapping ranges
Message-ID: <ac1G-zhysXIJcOO9@spark.kcore.it>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac0BVwO4XGhzcMu3@kekkonen.localdomain>
References: <20260325093241.1441512-1-mnencia@kcore.it>
 <ac0BVwO4XGhzcMu3@kekkonen.localdomain>
X-Spamd-Result: default: False [-0.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[kcore.it:s=spark];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DKIM_TRACE(0.00)[kcore.it:-];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-57890-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[kcore.it];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mnencia@kcore.it,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-0.900];
	RCPT_COUNT_SEVEN(0.00)[7];
	MIME_TRACE(0.00)[0:+]
X-Rspamd-Queue-Id: 6560937E0B2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari,

Thanks for the review. All three points addressed in v3.

On the exact default_mbps match: yes, the range check covers it
since default_mbps always falls within [min, max] for every entry,
so the early return was redundant.

On the early exit: I adopted your suggestion to use separate
continue/break, but swapped the two. Since both min and max
increase monotonically through the table, mbps > max needs to
continue (later entries have higher max) while mbps < min can
break (no later entry can match).

Marco

