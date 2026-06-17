Return-Path: <linux-media+bounces-65126-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hXllAqu6Mmqe4gUAu9opvQ
	(envelope-from <linux-media+bounces-65126-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 17:18:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7929C69AE32
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 17:18:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=tRnDaWbY;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65126-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65126-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 41D9A319F54A
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 15:12:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD040401A13;
	Wed, 17 Jun 2026 15:11:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B57E3C0626
	for <linux-media@vger.kernel.org>; Wed, 17 Jun 2026 15:10:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781709060; cv=none; b=iogHp6+VHRdFDz+bIK9L/OTnJhkfs+qDfzV/8liSZ85CkTj+Yg4xpHV/GyPLB9H90/r7rx9kE/So9ss3yKY7nb0fCiO5hUNC42rtYBMvhMaWvYIf9FVdnphWWN8u2RGag7QYPESP71qnSzUNDw8a3gpcAup1qgz2WIsgJu5L6Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781709060; c=relaxed/simple;
	bh=0ym5WVu2Iqlxu3QdP4M4bQKr7KkoEQAubAI5Fiai8jY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nkzj3pUP1+0u2PQGK+5q/pwe3YgC/z8HJCrqy8KIr9MMChuyRomS/OerYTQSg9U3uuEGa0tDMbkzfJjka+a3/CTsdLNdzaf6UBbghe3QX25cvjdL7rqC0hskAMbcMcvQf4jWiTjr9AChA35TF/mnlaedAJeLjNMj7fnOLifw2v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=tRnDaWbY; arc=none smtp.client-ip=80.241.56.151
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4ggS3Z2BXpz9tQr;
	Wed, 17 Jun 2026 17:10:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781709050;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5aw/KJI91ochDL09H/pBtNaModorFbBeZwQKbbRSfc0=;
	b=tRnDaWbYvDBA2wyeoBhfqIV7ke7NyWqO0qWO8HZspagkBUc8JHzglq+htVEBSK3mvfUzru
	WouA3rUPVR6X9owx3VfVDT88GlLLcu5frSlIX6GpdTDNUnlr3a5bb8j1thyVaGPIgFQXgo
	0wu3g99s7trsxzzrGZyeeW3x2LoS8RHNIH+CV/uelhYUC1hw1I/59d6Zw89gAF6CSyTJyy
	sVLD2211w4/V0/+iVkA3S8+61S8aZxSCBYX5gA2wmCjJTcOA34CoDH8S/IMIlFkM7iRt4o
	alquZiLai2dLLAjTtOuzNiWj7lJfX7Qm3sTt/D9JKinSkr/PfnZu1kxd/g1urw==
From: Andrei Khomenkov <khomenkov@mailbox.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Dan Carpenter <error27@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v3] media: atomisp: replace kmalloc() with kmalloc_objs() in sh_css.c
Date: Wed, 17 Jun 2026 18:10:39 +0300
Message-ID: <20260617151039.12533-1-khomenkov@mailbox.org>
In-Reply-To: <ajEtHT5PXYZYXUX8@ashevche-desk.local>
References: <ajEtHT5PXYZYXUX8@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: dqdzce6wbwzs3jpgsyy41zwe1yqft47o
X-MBO-RS-ID: 8de91b8a17b57fe6fb9
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,linuxfoundation.org,vger.kernel.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65126-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:error27@gmail.com,m:gregkh@linuxfoundation.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[khomenkov@mailbox.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khomenkov@mailbox.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mailbox.org:dkim,mailbox.org:mid,mailbox.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7929C69AE32

Thanks Andy, thanks Dan

I saw that a similar patch (commit 11f94f5b1d30) was already submitted by
Pedro Pontes, so my patch is no longer relevant.

I ran the command

   scripts/get_maintainer.pl --scm -f drivers/staging/media/atomisp/pci/sh_css.c

and saw that when working with this driver, patches should be submitted
to the git.linuxtv.org/media.git repository, not to Greg's staging tree.
It's also clear now that working against the linux-next tree is a better
option.

Andrei

