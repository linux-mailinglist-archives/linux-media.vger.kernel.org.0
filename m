Return-Path: <linux-media+bounces-52395-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EM8dNZLViWnRCAAAu9opvQ:T2
	(envelope-from <linux-media+bounces-52395-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 13:39:48 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBE910ED48
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 13:39:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B49443016D18
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 11:23:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A91A36EAB6;
	Mon,  9 Feb 2026 11:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mattwardle.net header.i=@mattwardle.net header.b="XN8b7uhg"
X-Original-To: linux-media@vger.kernel.org
Received: from s.wfbtzhsw.outbound-mail.sendgrid.net (s.wfbtzhsw.outbound-mail.sendgrid.net [159.183.224.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6409236EA95
	for <linux-media@vger.kernel.org>; Mon,  9 Feb 2026 11:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.183.224.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770636179; cv=none; b=hqdGpxjbdhYOWdbpgqlSBbld300oc7DUj/JU06qnS9SX/OhFGdO+kKv6z1JHWyahEjdaYr4Z2+8z/kXRqnbxT5OjRX8jeXFTZp+zRC2qKdhwiFVpVIX33/t9qaAR4SyWZs7Vdsm8fG/rZvLYJl6b3HIIbLsMl3qaTbEueOurEak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770636179; c=relaxed/simple;
	bh=kRWK5/jeb66YQW8U9YAtk1rp0TELFHU8SR+Eu9oDu/Y=;
	h=Date:From:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:To:Cc; b=lN+5KYSHS4rTLvDmUeou+OwosMnZhCfQGZWqiNvrxmDOLrZqeUA1pqkEBr4hm31J6DUWsjWrIzCxjlpunExhXMsMJFwUmpKjQEYkiuLrDMlYskmiJUJMt7I4OxYPQ8VmoccUM3u8akCBEVYNfdI0I/A7hrgNswYBkL+Kvnmd12M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mattwardle.net; spf=pass smtp.mailfrom=em431.mattwardle.net; dkim=pass (2048-bit key) header.d=mattwardle.net header.i=@mattwardle.net header.b=XN8b7uhg; arc=none smtp.client-ip=159.183.224.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mattwardle.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em431.mattwardle.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mattwardle.net;
	h=date:from:subject:references:mime-version:content-type:in-reply-to:to:
	cc:content-transfer-encoding:cc:content-type:date:from:subject:to;
	s=s1; bh=K9dWFOtolyTEaCNfCsSC1vEa9RxBruC41h+Iw+1WvD0=;
	b=XN8b7uhgnqS5Q5+yDuvIlAdATwCx0OhnDYMQkafmYD2j2FVYTzwOgA8z3Pl5xstn+h0O
	YFtg8lt2BUoeWdRvBpJsbSb9tRAi6TZEGUE9btwx9hgvg6N1XwXRf/X2J2EgjZXyfIvVAH
	zDdysAlJKdT1lPp5d3vzDuRGSUBAcNHXZle5AgV0XM9CV1E7ET61vEhjMai1hW6AimZzdl
	L+2mTAHWRPIwmQhMp10Ot/WYb1qUlGUPwXBUAJkoqM6zSbPCWhDfddpGzxSwaZutVXU/a5
	PmJcoQe6FA2W4DGgkhn9ySOBQBjk6P3QIN94Fy8lVUAXzunAt4QZTVITRhWV+7sw==
Received: by recvd-784c64d46-nq24t with SMTP id recvd-784c64d46-nq24t-1-6989C391-9
	2026-02-09 11:22:57.382860039 +0000 UTC m=+99830.720964972
Received: from mail.3n0xdopx5uce3ivigaxioahche.ix.internal.cloudapp.net (unknown)
	by geopod-ismtpd-11 (SG) with ESMTP
	id Uqgr7mgAShyYPtTbvGeS3w
	Mon, 09 Feb 2026 11:22:56.918 +0000 (UTC)
Authentication-Results: mail.3n0xdopx5uce3ivigaxioahche.ix.internal.cloudapp.net; dmarc=fail (p=reject dis=none) header.from=mattwardle.net
Received: from thinkpad (unknown [161.142.117.49])
	by mail.3n0xdopx5uce3ivigaxioahche.ix.internal.cloudapp.net (Postfix) with ESMTPSA id 9DCAA41178;
	Mon,  9 Feb 2026 11:22:55 +0000 (UTC)
Date: Mon, 09 Feb 2026 11:22:57 +0000 (UTC)
From: Matt Wardle <matt@mattwardle.net>
Subject: Re: [PATCH] media: atomisp: Fix brace style issues in binary.c
Message-ID: <aYnDjPDrXQC1CZc5@thinkpad>
References: <20260209044854.83299-1-matt@mattwardle.net>
 <aYmZ20RmdmJY0Pp_@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYmZ20RmdmJY0Pp_@smile.fi.intel.com>
X-SG-EID: 
 =?us-ascii?Q?u001=2EFlbIg1=2FBrpD1HWcEBlj1tgh=2F0VDwewqbkmeZ1SFD9tLmzlDepFYnLmfnO?=
 =?us-ascii?Q?moWHy7n5HdVZTdyWWeMojZeck4brd13h3Tk3YJ+?=
 =?us-ascii?Q?ZaBxuwaNJpDJwbRX2JXpKCg600kHWJO2M+6cSjY?=
 =?us-ascii?Q?pT5P2FLz4immBSk5CRnomCSJs0d3FUDUZCnh7EA?=
 =?us-ascii?Q?ZfUkSTX=2FrN4Rthpe=2FnTiTKPkKIWL+9su6188gFg?=
 =?us-ascii?Q?PXPBJeea3IpMUiret7xBY4gf8Dfz8rKYRkm=2Fv=2F0?=
 =?us-ascii?Q?6Ho+?=
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Andy Shevchenko <andy@kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Entity-ID: u001.OAl4HwJfzvoR6h5DRlrySA==
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mattwardle.net,reject];
	R_DKIM_ALLOW(-0.20)[mattwardle.net:s=s1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52395-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mattwardle.net:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matt@mattwardle.net,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,checkpatch.pl:url]
X-Rspamd-Queue-Id: CBBE910ED48
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 10:24:59AM +0200, Andy Shevchenko wrote:
> On Mon, Feb 09, 2026 at 04:49:22AM +0000, Matt Wardle wrote:
> > Fix checkpatch.pl errors and warnings regarding braces on incorrect
> > lines and braces not required for single statement blocks
> 
> Missing period.
> 
> Note, if you are going to do this file-by-file, it won't scale. So, collect
> (sub)folder and fix all files in that one for the same issue. Then repeat
> the same for other (sub)folders. Make it a series of the patches.

Thanks, will update and submit as a patch series.

