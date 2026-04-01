Return-Path: <linux-media+bounces-57840-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0N7kFj7HzGn5WgYAu9opvQ
	(envelope-from <linux-media+bounces-57840-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 09:20:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EB5375B92
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 09:20:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7ACB4303266F
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2026 07:12:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF1581AF0BB;
	Wed,  1 Apr 2026 07:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b="AUYclloR"
X-Original-To: linux-media@vger.kernel.org
Received: from spark.kcore.it (spark.kcore.it [49.13.27.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E7626C3BD;
	Wed,  1 Apr 2026 07:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.13.27.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775027524; cv=none; b=mYzVDN4bfi7JVbur68JMfU2W2yiiyCk/arM/vZEJGDvvWNWFCElQWA7FVbVoZ/vekHjYwD/kn+E+XBMXfnP0zjP0+q0tA5NR6gQ2J82OASlTJ3lU5rFzn51YRolJr4qZh6c2GOuotMB8uyxcRuv8fN9OZMtKSvsCzBnGWl3XPKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775027524; c=relaxed/simple;
	bh=cBGliewdJJUADavazV6ZvXLVcK1PVnXVyMKwTsGTasA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:References; b=iCKeMVRA55xO9g+kfNQVJyTZdDM9rQSBcRLsc93vsF/S1qlwyE2xWHmnLvuAjZCiu55CofBX2WgoAsp/wHJKf6Kh6G+PmjTyLuPToep3wy5/8TCqKvCpbT0bBrU6gEwkT09atXCWUotVgDLbC46SQ1xVWHKPBMvL8M2HuiGQa/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it; spf=pass smtp.mailfrom=kcore.it; dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b=AUYclloR; arc=none smtp.client-ip=49.13.27.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kcore.it
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kcore.it;
	s=spark; h=References:In-Reply-To:Content-Type:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=cBGliewdJJUADavazV6ZvXLVcK1PVnXVyMKwTsGTasA=; b=AUYclloROaFf0JmovIozdriWtW
	DOlGQOdN79C0Q6JDOCz0KlED19ldAXFXLJVyqgjAFHKTpbAonh9Up+YBVmJETm7x83sHu7PQL4Roc
	p5SxNkswC3CYaaXCGwegFZ7/aGSHSQ/IeSQG2VJbtCkBJidH5gLbnuo1hb4DODjuR8Fw=;
Received: from mnencia by spark.kcore.it with local (Exim 4.96)
	(envelope-from <mnencia@kcore.it>)
	id 1w7pju-006f7I-08;
	Wed, 01 Apr 2026 09:11:46 +0200
Date: Wed, 1 Apr 2026 09:11:46 +0200
From: Marco Nenciarini <mnencia@kcore.it>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
	tian.shu.qiu@intel.com, mchehab@kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] media: intel/ipu6: Improve DWC PHY HSFREQRANGE band
 selection for overlapping ranges
Message-ID: <aczFMjPPs-KzxOBC@spark.kcore.it>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325093241.1441512-1-mnencia@kcore.it>
References: <20260325093241.1441512-1-mnencia@kcore.it>
X-Spamd-Result: default: False [-0.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[kcore.it:s=spark];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-57840-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[kcore.it];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kcore.it:-];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[mnencia@kcore.it,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-0.903];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[spark.kcore.it:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E3EB5375B92
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari,

Gentle ping on this patch. Any feedback on v2?

Thanks,
Marco

