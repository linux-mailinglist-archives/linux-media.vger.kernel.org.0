Return-Path: <linux-media+bounces-57935-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOxHMOc6zmmAmAYAu9opvQ
	(envelope-from <linux-media+bounces-57935-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 11:46:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C40387263
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 11:46:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F2E9A30C10CE
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 09:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90C6C3CA480;
	Thu,  2 Apr 2026 09:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b="jbYqsTA0"
X-Original-To: linux-media@vger.kernel.org
Received: from spark.kcore.it (spark.kcore.it [49.13.27.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92583B3899;
	Thu,  2 Apr 2026 09:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.13.27.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775122567; cv=none; b=nLi5lqzs0ToafF8DYAjAnFIwVtuSrUxbzmJ/wIOWMJ9CH2KoO/dB+t6EctOgdNdE3WeUhKt/0q6g55ZmODLifpvvdX8C1EwWmdpsTQcKRLGacKYJa0BM4NfPXjBMbGEeEeEV9BMUbtlu1LaFlGaJbDmBKPYfK04zOHlpPtVs3Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775122567; c=relaxed/simple;
	bh=NMfgMziURrqX6XSEgMuSA6rGZeuKgG2nUkckSwg3Kn8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:References; b=YD3DLsZ1G+JyGBFY+i0tKp1AFu5NQ9BEjVGTxf617nHZ5NmQ6EKqTRwtoQILdqFD8Cv/ws57AaUvkjmdZZUKWbx5DGPqH9u1p3IXmkZEACAkwxk3xjeqpYlACkG+L7Jowar0CquyQ4UKBfv2QQWxYnQAo2NkvQC+0aq3+wSczKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it; spf=pass smtp.mailfrom=kcore.it; dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b=jbYqsTA0; arc=none smtp.client-ip=49.13.27.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kcore.it
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kcore.it;
	s=spark; h=References:In-Reply-To:Content-Type:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=vDevIJ91h5h22e4LEr3y3mrmHUaEYs/7SbN2SyKEq8Q=; b=jbYqsTA0GUJ9Rgdb1ZW/48LOmV
	CPKU/ZMTiUC1YaTAPC/o1jgSOIJwMBXfnGp/qI3lDN0H4euPF/ubaH8M7Mmf//SpyZdqQ2g8/jmHL
	HQzOf5wa82cJKtct1Z0k/e8oCKq0vd/vg3PGXX0MqY1woctdazqt1NXakZIMHlax0fRY=;
Received: from mnencia by spark.kcore.it with local (Exim 4.96)
	(envelope-from <mnencia@kcore.it>)
	id 1w8ESl-006mdl-0t;
	Thu, 02 Apr 2026 11:35:43 +0200
Date: Thu, 2 Apr 2026 11:35:43 +0200
From: Marco Nenciarini <mnencia@kcore.it>
To: andriy.shevchenko@linux.intel.com
Cc: sakari.ailus@linux.intel.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] media: intel/ipu6: Improve DWC PHY HSFREQRANGE band
 selection for overlapping ranges
Message-ID: <ac44b9UAjbSbi8-4@spark.kcore.it>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac4uvf_a-4-fLBPV@ashevche-desk.local>
References: <ac4uvf_a-4-fLBPV@ashevche-desk.local>
X-Spamd-Result: default: False [-0.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[kcore.it:s=spark];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kcore.it:-];
	TAGGED_FROM(0.00)[bounces-57935-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[kcore.it];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[mnencia@kcore.it,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-0.862];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,spark.kcore.it:mid]
X-Rspamd-Queue-Id: 72C40387263
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 02-Apr-26 11:54, Andy Shevchenko wrote:
> Below just a couple of remarks, no need to be addressed, JFYI.

Thanks for the review.

> > +		if (mbps > freqranges[i].max)
> > +			continue;
> > +
> > +		if (mbps < freqranges[i].min)
> > +			break;
> 
> Wondering if this can use bsearch() algo or any linear ranges.

The overlapping ranges and the multi-criteria selection (osc_freq_target
first, then closest default_mbps) make it hard to fit into a single
comparator. The forward scan with early break seemed like the most
straightforward approach.

> > +		     abs((int)mbps - (int)freqranges[i].default_mbps) <
> > +		     abs((int)mbps - (int)freqranges[best].default_mbps)))
> 
> Note, abs(INT_MIN) is UB, I hope this won't be the case IRL in this code.

Good point. The values here are well within range, but an unsigned
abs_diff() helper would be cleaner. I will address it if a v4 is needed
for other reasons.

Marco

