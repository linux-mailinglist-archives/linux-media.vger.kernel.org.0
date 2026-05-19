Return-Path: <linux-media+bounces-62151-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AAcSIyl2DGqihwUAu9opvQ
	(envelope-from <linux-media+bounces-62151-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 16:39:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0884E580AF0
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 16:39:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6223D3079D4F
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 14:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74E0D370AEC;
	Tue, 19 May 2026 14:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="SamqBvdr"
X-Original-To: linux-media@vger.kernel.org
Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695903E16B5
	for <linux-media@vger.kernel.org>; Tue, 19 May 2026 14:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779201313; cv=none; b=RD5YNiPHUulF9f41N5iPBtKbWcKu2glkfQSq31N9CRqWp5fIoFT5lx3lUcJMq44pq60vsFoAYckJurm3HVGdTKtIntAG5ZT7oTKA+aX66rBNod/4iTVUeQA62erq69TAdSAdNCOxHFaB6YLjMtOOYU6bh43T1vMw8eUnjEx81H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779201313; c=relaxed/simple;
	bh=+SieRZrelSTKpTtvr2CNxBo56Ky3jnWV7p5H021nHQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OFCK92JF2lZzmqFhHf6FgcAImcPg7m94ThRJvxOCi34yeKMqMd5XQQ8vOhmd9bSkLvodAfAzoZ6sEpC+t469AUI3B4n15njkSNwzMT8zOo1RGfhHpu2W1ZKOrvtOVCxIabTJ3xGugIuhgWmpGGMYTC1UhWRSNUzu6CWuEFyPWf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=SamqBvdr; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Tue, 19 May 2026 16:35:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779201310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=204m71a0OlkuHpE1OUFXdbr8pvbs8gb7LmJCGc7qiUI=;
	b=SamqBvdrqNPkDpO1BFTvAPy+aIbesVTpdxJ92fgbSp1/cOEY5VFS/HvNF4J304VE6ZvCMU
	5Rorb/eHQiMVrqRoIKbl6fZzYaqOcxQvgrjWPVCQtikKOkaK6RuusSyjdMPXVYojtH6lbg
	6JOIdY6uHlg+w2Gi6hYYxlBdix/H8iE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Michael Tretter <m.tretter@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] media: i2c: isl7998x: inline
 i2c_check_functionality check
Message-ID: <agx1FtT14NeJZGf7@linux.dev>
References: <20260517172034.3033-2-thorsten.blum@linux.dev>
 <agxyfLuFArQ464Ea@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agxyfLuFArQ464Ea@pengutronix.de>
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62151-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thorsten.blum@linux.dev,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,linux.dev:mid,linux.dev:dkim,pengutronix.de:email]
X-Rspamd-Queue-Id: 0884E580AF0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 04:23:56PM +0200, Michael Tretter wrote:
> On Sun, 17 May 2026 19:20:35 +0200, Thorsten Blum wrote:
> > Inline the i2c_check_functionality() check, since the function returns a
> > boolean status rather than an error code.
> 
> Actually, i2c_check_functionality() returns the boolean result of the
> comparison as an int. It's better to treat it like a boolean, though.
> 
> > 
> > Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> 
> Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>

Thank you for your review.

I sent a patch [1] to change i2c_check_functionality() to bool, but
Wolfram asked to change the int call sites first.

[1] https://lore.kernel.org/lkml/20260421161607.61314-3-thorsten.blum@linux.dev/

