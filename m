Return-Path: <linux-media+bounces-52444-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KN5eOxEiimnLHQAAu9opvQ
	(envelope-from <linux-media+bounces-52444-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 19:06:09 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 65ACD113619
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 19:06:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 49C12302C35E
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 18:05:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AD67385ED8;
	Mon,  9 Feb 2026 18:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mattwardle.net header.i=@mattwardle.net header.b="YUW9PIfB"
X-Original-To: linux-media@vger.kernel.org
Received: from s.wfbtzhsv.outbound-mail.sendgrid.net (s.wfbtzhsv.outbound-mail.sendgrid.net [159.183.224.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C924B38734A
	for <linux-media@vger.kernel.org>; Mon,  9 Feb 2026 18:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.183.224.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770660328; cv=none; b=jfvgd7euaZdSf1tMxf2MsVScr9RX5My6nX3UE+35yUZ3qxSPKSL4blpbjWBKTtNSNl1kIYi3JUAezf4J2G5UlZG1kfY8bRdwgzjZ2qoI4IoqyDV7xe4GjwZ+f75wKMWkMEzuwBSm//gaqrzdY0lNnJ30aHerUAhcxM9eKh25IWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770660328; c=relaxed/simple;
	bh=c5lcch9eBeH/WsqUplq73u5Wv26qlczvun+Ec4QEojo=;
	h=Date:From:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:To:Cc; b=iDMd0GqRkXD1QLbm7xpw9vhUPv/I7i/zEN/z3NE56Rb26ZClHJhiSqDgAXx7X0vNsTBsb4eOqC72/qS3+KFA9qjOJt/j81nmCbQWjvZByka9/2JQa5UJhM+IXn7LNT1hlxDAIq/IWMpcrerzjZcK0zTIOJfMCYD58ZiNjTPeeHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mattwardle.net; spf=pass smtp.mailfrom=em431.mattwardle.net; dkim=pass (2048-bit key) header.d=mattwardle.net header.i=@mattwardle.net header.b=YUW9PIfB; arc=none smtp.client-ip=159.183.224.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mattwardle.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em431.mattwardle.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mattwardle.net;
	h=date:from:subject:references:mime-version:content-type:in-reply-to:to:
	cc:content-transfer-encoding:cc:content-type:date:from:subject:to;
	s=s1; bh=lgS/OZ4YUXSutx3plb6B0KGIzVEkg1mCoOcPVfl0B78=;
	b=YUW9PIfBehj62/tthyP3+6dfLOFq+dTK07OyxGkq/4tfaf6cAt1sESQ/867Jk+n3aVu+
	joR3/3C1r0RPZIj3XmzedF1JL85D+XdwdfhLjBnh8bNLaW6td0z/mSJVJ+upSKaaITqV1M
	FYsC3QongT9q6Wce1c/KhqFxFEjSCJDQNUR1uw8GZBLPUvXagPXh58I8U2vtiulme1r4hn
	FurkJgls64gZh33khxiNpJR+Tr1rePInXRCFmYkBePk/2vKypETleWAWtsLgKmvqzLkSxb
	NyfG0KLE3b1HFCtPdRVCXhix2/7BkKKU6/QHpzcXoMhDii9MWLAzucbFieg1lFRg==
Received: by recvd-5fb7fdbd94-dvqlf with SMTP id recvd-5fb7fdbd94-dvqlf-1-698A21E5-7C
	2026-02-09 18:05:25.659793006 +0000 UTC m=+564.030125513
Received: from mail.3n0xdopx5uce3ivigaxioahche.ix.internal.cloudapp.net (unknown)
	by geopod-ismtpd-3 (SG) with ESMTP
	id ts6tOhX2S_CAgd8WHWMOxA
	Mon, 09 Feb 2026 18:05:25.144 +0000 (UTC)
Authentication-Results: mail.3n0xdopx5uce3ivigaxioahche.ix.internal.cloudapp.net; dmarc=fail (p=reject dis=none) header.from=mattwardle.net
Received: from thinkpad (unknown [161.142.117.49])
	by mail.3n0xdopx5uce3ivigaxioahche.ix.internal.cloudapp.net (Postfix) with ESMTPSA id 524D841178;
	Mon,  9 Feb 2026 18:05:24 +0000 (UTC)
Date: Mon, 09 Feb 2026 18:05:25 +0000 (UTC)
From: Matt Wardle <matt@mattwardle.net>
Subject: Re: [PATCH 1/3] staging: media: atomisp: Fix braces on incorrect
 lines
Message-ID: <aYoh4RKXOoezheVj@thinkpad>
References: <20260209142820.650334-1-matt@mattwardle.net>
 <20260209142820.650334-2-matt@mattwardle.net>
 <aYoATsI9KB8bgwjz@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYoATsI9KB8bgwjz@smile.fi.intel.com>
X-SG-EID: 
 =?us-ascii?Q?u001=2EFlbIg1=2FBrpD1HWcEBlj1tgh=2F0VDwewqbkmeZ1SFD9tLmzlDepFYnLmfnO?=
 =?us-ascii?Q?moWHy7n5HdVZTdyWWeMojZeck4braeM+CVUrqV9?=
 =?us-ascii?Q?X7l8FP0lHVc6s0RrRscQNVCifXaX3Vd3+QloNIE?=
 =?us-ascii?Q?9sDjccy+Oj3cKGPmamFj4ClSSmnZGWaDu75=2Fcc3?=
 =?us-ascii?Q?glkNK1C57unuihioZO1HPceVNiEjhlVV4ayVFt2?=
 =?us-ascii?Q?5RTdiachH2wPCLNmBPlkHRZ7ktXpNh1EBswuIvk?= =?us-ascii?Q?LBSv?=
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52444-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[checkpatch.pl:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mattwardle.net:dkim]
X-Rspamd-Queue-Id: 65ACD113619
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 05:42:06PM +0200, Andy Shevchenko wrote:
> On Mon, Feb 09, 2026 at 02:29:07PM +0000, Matt Wardle wrote:
> > Fix checkpatch.pl errors:
> > 
> > ERROR: open brace '{' following function definitions go on the next line
> > ERROR: that open brace { should be on the previous line
> 
> Nice! My comments below.
> 
> ...
> 
> > store_dvs_6axis_config(
> 
> >      const struct ia_css_dvs_6axis_config *dvs_6axis_config,
> >      const struct ia_css_binary *binary,
> >      const struct ia_css_frame_info *dvs_in_frame_info,
> > -    ia_css_ptr ddr_addr_y) {
> > +    ia_css_ptr ddr_addr_y)
> > +{
> 
> This makes no sense to touch before the parameters are indented correctly.
> I dunno if open parenthesis is fine at the end of the line, but I would do it
> differently, as
> 
> store_dvs_6axis_config(const struct ia_css_dvs_6axis_config *dvs_6axis_config,
> 		       const struct ia_css_binary *binary,
> 		       ...)
> {
> 
> ...
> 
> The bottom line is, you need to check manually these and make prerequisite
> patch to first fix the indentation.
> 
> ...
> 
> >  int
> >  ia_css_get_dvs2_statistics(
> >      struct ia_css_dvs2_statistics          *host_stats,
> > -    const struct ia_css_isp_dvs_statistics *isp_stats) {
> > +    const struct ia_css_isp_dvs_statistics *isp_stats)
> > +{
> 
> Ditto.
> 
> And when you go with indentation it makes sense to combine (it's fine in this
> case) those changes with the splitting { to the next line.

Thanks, I'll fix the indentation first on the functions then resubmit
without the last patch.

This is happening in many files so it might be best I tackle the other
occurences in a separate patch.

