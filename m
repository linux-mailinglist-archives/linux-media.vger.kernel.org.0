Return-Path: <linux-media+bounces-60183-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEruIogH9mkbRwIAu9opvQ
	(envelope-from <linux-media+bounces-60183-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 02 May 2026 16:17:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3486A4B2476
	for <lists+linux-media@lfdr.de>; Sat, 02 May 2026 16:17:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB9D3301D044
	for <lists+linux-media@lfdr.de>; Sat,  2 May 2026 14:16:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 569AD33B6D0;
	Sat,  2 May 2026 14:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="AedyKaSR"
X-Original-To: linux-media@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBBE273D8D;
	Sat,  2 May 2026 14:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777731384; cv=none; b=Fk+XZ00hKgqm0vjWwmz7FtSLWiKzYf+jSsGnPrRVy9WaiPWA1kKiVtILWAalWjRY3ItHBcE+1EdnJCyuEHa74oq/ZBfHRXkAQGEljGYLNAjQK4wmL1DIjiWtRTkieLBV5EXkdD/+xKsIoiCAnGIC0ImjoqgZCFjb2ow9x2beXik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777731384; c=relaxed/simple;
	bh=TwR1HvQDRtMP4izVvC6fWbPtDEp9YlwBpZW1/Ldrki0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eSElYncSuaiKfe6clelS89NTnmioE4i04PS5zdxCKgskCjTuNcwbft9YaBqt8nJyJyw5xTCnBGzTlfUAV7DfdKEqTy9iOag06dfvwh0Nnxg1WC7CFG1J8A3JvyF+v3nZLd+3hhyDs3SnWmRdL3Lemitg2DYHwFQMopxHFg9iITQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=AedyKaSR; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=vkdJUl9byqmgdH4ISrrSUbw86t4D/yEgNaaTqWmyKRE=; b=Ae
	dyKaSRwo8iamjOkvzOLPx0wAtoj63h4rJf+NDQ+B4HrTfC1iaJUoZelsMWgFb216+JISuUJ1Sy2f5
	0hwh7a0gDKqfiRJSg5x+Exg/Ps76LJ0e1KrwEAdaN4yWGrnuxD/NWJsjtb0S1vIV0yO3ERDdUJGaX
	7cE11VZbDlHywBY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wJB8T-0011Vh-Ph; Sat, 02 May 2026 16:16:01 +0200
Date: Sat, 2 May 2026 16:16:01 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Wang Zihan <3772548978@qq.com>
Cc: netdev@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-media@vger.kernel.org, linux-um@lists.infradead.org,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, horms@kernel.org, corbet@lwn.net,
	skhan@linuxfoundation.org, mchehab@kernel.org, richard@nod.at,
	anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: Fix duplicated words
Message-ID: <918f7cdc-c0bc-4cbb-8385-ca0ddb2180c1@lunn.ch>
References: <tencent_B1D6CBBF95486E31D04C2E1B92F5E605A307@qq.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <tencent_B1D6CBBF95486E31D04C2E1B92F5E605A307@qq.com>
X-Rspamd-Queue-Id: 3486A4B2476
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lunn.ch,none];
	R_DKIM_ALLOW(-0.20)[lunn.ch:s=20171124];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[qq.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60183-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[lunn.ch:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lunn.ch:dkim,lunn.ch:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Sat, May 02, 2026 at 07:19:16PM +0800, Wang Zihan wrote:
> Remove duplicated words in three documentation files:
> - "in in" -> "in" (switchdev.rst)
> - "The the" -> "The" (dmx-reqbufs.rst)
> - "on on" -> "on" (user_mode_linux_howto_v2.rst)

https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html

* don’t repost your patches within one 24h period

We have already told you one of the fixes is wrong, but you did not
wait 24 hours, so have not see our feedback.

Also, in general when using a tool, assume it is wrong, and convince
yourself it is correct, before making a change. "The the in this
sentence is the subject." What does the bot make of that? Can you
convince yourself the bot is correct?

    Andrew

---
pw-bot: cr

