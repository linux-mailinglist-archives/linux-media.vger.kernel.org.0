Return-Path: <linux-media+bounces-59068-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBsoOtxJ42lKEQEAu9opvQ
	(envelope-from <linux-media+bounces-59068-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2026 11:07:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 32326420860
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2026 11:07:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B2B7303FDF5
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2026 09:07:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE13B37B413;
	Sat, 18 Apr 2026 09:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="W1iyagc2"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A2D1A9B58;
	Sat, 18 Apr 2026 09:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776503246; cv=pass; b=BiyLhpoYw5gZ0j00V/t7T3/cRxqV9yhxJeIMdBfUBmwGtOWihk9F7AOYr+i6xvs3Psk2Dtp48PG4gDG9S7IRczWv5A8R2jK/TPXzyJ7kq87rYvP693DaWUMk1fHaXgwVrsFWPIukjsnVu9k6OidDs1WoKJbNDQsgWLvbMo3xx8E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776503246; c=relaxed/simple;
	bh=zJvOvGFGljgyGGyub/qQBa/sP8MI64dLAdge7+sgA74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VP6Y9yWlah9I4UyP3zBm4nH+KE/C/kbf31rCY42ZUObba1Zt92naC2zeMiJz0iVIyn2xdVnLgWl2Z1Yof/sL+hngM8UjqQ+eEgqbOIbr1TKq1J1sYIGdC+bdO8iXLDEkhJYwWSctUjAPzMHxg8blNtlNe2G6aExLJylmYliBg9M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=W1iyagc2; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4fyQqs18dvzyRd;
	Sat, 18 Apr 2026 12:07:21 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1776503241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QQjEUuUB+N2S6hVUO8FSKVJdeU164HtrQ/38DjNprbw=;
	b=W1iyagc2WKoVlhZYdZknlzJA3vm+ZJ1UmtyQ+h8BNUxEW2754o4D6NLd+33OH58DTRC6jK
	/MI/LZO5dbjjIWmzL8Lxf431HPHUTw1oQmUMApddPi7kurRH6J2n4XLnb2kQ1htMP6M0my
	tk/U/tYIpP30630ZNszaVxDM0keKG9U=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1776503241;
	b=c0V1z74iZQS3ArUrCzA8LGlYLtAqUKTnrx704IFAMG341c8d2z9evytwx2l60d4M4ypOdf
	OeV13v85ZkPdioZ/vUlcXizqJJ1UbitVVUTob6DSz18u1oDU73LSyEj8imnR8iBk6NI506
	HYBGCqMrfOLVXXrUal27y+uI4mkpZXw=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1776503241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QQjEUuUB+N2S6hVUO8FSKVJdeU164HtrQ/38DjNprbw=;
	b=fWobJiQ5yX9fqjJZw88YqcuUMMbpJrYXxtSS73nMH3eV0D8kCUowjqfBul6EHWeg6rJvyg
	GdRMAoO8Ib/64jQ6M+JjQIhYIgDwbq8WW2NrQtRSgwLpIOvmQiVze9EY9zo5cMGHSVI3T1
	j83MdXSr1BoTzqZfMAZC6/jfkYgpCe4=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 82521634C4E;
	Sat, 18 Apr 2026 12:07:20 +0300 (EEST)
Date: Sat, 18 Apr 2026 12:07:20 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Martin Weidenauer <martin@weidenauer.cc>, hansg@kernel.org,
	mchehab@kernel.org, sakari.ailus@linux.intel.com, andy@kernel.org,
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	~lkcamp/patches@lists.sr.ht, koike@igalia.com
Subject: Re: [PATCH] staging: atomisp: isp: fix open brace on new line
Message-ID: <aeNJyPr_2tW8CFJa@valkosipuli.retiisi.eu>
References: <20250714153409.46085-1-martin@weidenauer.cc>
 <aHYJD4aJDOxZJmQT@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aHYJD4aJDOxZJmQT@smile.fi.intel.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_DKIM_ALLOW(-0.20)[iki.fi:s=meesny];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59068-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[iki.fi];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[iki.fi:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@iki.fi,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[valkosipuli.retiisi.eu:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 32326420860
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Tue, Jul 15, 2025 at 10:53:51AM +0300, Andy Shevchenko wrote:
> On Mon, Jul 14, 2025 at 05:34:09PM +0200, Martin Weidenauer wrote:
> > Fix checkpatch error "ERROR: that open brace { should be on the previous line"
> > in ia_css_dvs.host.c:277.
> 
> ...
> 
> 
> > Hi, I hope this should fix the indentation problems.
> 
> Missed versioning and changelog, but otherwise okay.
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

This is addressed (among other things) by commit
0d321169bda4ada7ffc9a1ff6fdcd5e753f82878 in my atomisp branch.

-- 
Kind regards,

Sakari Ailus

