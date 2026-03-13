Return-Path: <linux-media+bounces-55730-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIvyBxY0tGn4igAAu9opvQ
	(envelope-from <linux-media+bounces-55730-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 16:58:14 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9490828678D
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 16:58:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F0D95300F12F
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 15:58:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51DC33644C2;
	Fri, 13 Mar 2026 15:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZLm/Vm3B"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A924935CB8F;
	Fri, 13 Mar 2026 15:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773417479; cv=none; b=MlshqtfteMrAjoYcxkkfaXqYBQyw+jEQByTgEXGcLRiLDUJrIagKGTs17YP2R9lMtAA5SZNiR5qMlRRaIAwAMtmhB11xbqIAh/EfMTb089N9HsCbxEtpPhFprECgF0Ql81TPuJMDrqmxBTulAhMaNZ1oRO0fkCiPxT8MyL1YgNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773417479; c=relaxed/simple;
	bh=SDXZR8BOMSnAuJ4PeJ2ZGeq4kIqkBywKxCVam1l99ik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b3HCe/zVr4paqYAEBmgLfHmCxCf76s5k1M+xxui3Nu754wtYPTISAQaIQ+JmryFYi52M2525DaPQRWiKDVJDB1fCWIqzpxEV04v2Dp49D6FHnyVpX7+74GH/7VORpmIAwuTMLjym4T4HzgwcSsE9lyEVwSYjN5fzUmLoQ8QixFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZLm/Vm3B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA5C9C19421;
	Fri, 13 Mar 2026 15:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773417479;
	bh=SDXZR8BOMSnAuJ4PeJ2ZGeq4kIqkBywKxCVam1l99ik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZLm/Vm3Bu4O2d5GnbpTS7J2b4AW2aI84rFErG32QkLqsAXI2uYVOvExyF1qj1a7fP
	 T9N8NEGijg5oMXlC1FOKZuked2wH+f6WJ5Sd7vIhngFUaOaQk+WdBOc3Ba8PjYJdV+
	 QeK66886e9PnzKCZMdh+uMqghTUPrwbigEwdtO48=
Date: Fri, 13 Mar 2026 16:57:54 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: av7110: replace C++ comments with C
 style comments in sp8870.c
Message-ID: <2026031344-popcorn-renewable-efdc@gregkh>
References: <20260313-sp8870-cleanup-v1-1-2d5069c4eec5.ref@yahoo.pl>
 <20260313-sp8870-cleanup-v1-1-2d5069c4eec5@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313-sp8870-cleanup-v1-1-2d5069c4eec5@yahoo.pl>
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[yahoo.pl];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55730-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,yahoo.pl:email]
X-Rspamd-Queue-Id: 9490828678D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 04:47:54PM +0100, Tomasz Unger wrote:
> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>

We can't take patches without any changelog text at all :(

