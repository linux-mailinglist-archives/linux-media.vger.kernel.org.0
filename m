Return-Path: <linux-media+bounces-45295-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F980BFD4EB
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 18:43:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 06329344872
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 16:43:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FE3135A159;
	Wed, 22 Oct 2025 16:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="rG+s/i7v"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB6D2D640A;
	Wed, 22 Oct 2025 16:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761150663; cv=none; b=WOnbo9BelUtX+OyDsMaHFRu9aIqCs6lWa7QdBqqPOC5ZlPQFDTpMBzbF2QszpJJvsTzuj0Kl8v0ijl0xotz05sEOPxAXxIz8BhjJockaPbj4D7nzTABQBS0JbnNpn0Lgz7geOSB8HsUAS+8Fzr/FkOMan7/y/iSRb9bz8TswyfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761150663; c=relaxed/simple;
	bh=qyC+nr0YxD1eBhg9PnBG7hmMGklpTf0wwfq7Fk2/gdk=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=ZbodelB1BOn2pZLNNllmunjY8CqqalUVW8fQWYU/C73lwfmOy7/HMRMnH9NgLtV2mq8r7W07D1kK7ux5D2wI6RUIjPuhRZOK2UEIkUmzfybvYLaUguJ3GgNUvMSmFuqCBsJmsnHlnPTLhKSQMHozZazERJ6dT+LQqLWCbN+xRJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=rG+s/i7v; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1761150644; x=1761755444; i=markus.elfring@web.de;
	bh=qyC+nr0YxD1eBhg9PnBG7hmMGklpTf0wwfq7Fk2/gdk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=rG+s/i7vbPnZjzkz+YrrFN84kNMeo0T8slxYP40FkaEYXw47chKnu4qEtAOR+I6B
	 KPxOZ9NW3C2e0sZZuTH/95givS9HiVOQXL6uWkI/G97lY2kR8mVs1sNvZQkEKkau/
	 XDtZDb8YTBBpEvP1BIkYxLM3FR3/CEkhOHyybNoyCpl436Wwu/rojKpbU9suBVniO
	 B6KuY4smwD51xqNRZfX+1Hhh5eyiTdHbfKpAZzZoXYjvmu1xvzczwNywZ3LdiWTbZ
	 O8Au+KQE4QE6WNEMxQHY7KUtKj6hmm7x54lK2yXH0G5WyJAZR02AYdXq7Z1LYviSC
	 /GUqxBZ0U3M2M+f2RA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.250]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MT7aV-1ukUUm3NXj-00UJY0; Wed, 22
 Oct 2025 18:30:43 +0200
Message-ID: <a2bbe001-80dc-43ab-9cc9-3bf497731183@web.de>
Date: Wed, 22 Oct 2025 18:30:40 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Biancaa Ramesh <biancaa2210329@ssn.edu.in>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 Andy Walls <awalls@md.metrocast.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20251021190021.173748-1-biancaa2210329@ssn.edu.in>
Subject: Re: [PATCH] parport_cs: Refactor probe function and improve error
 logging
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20251021190021.173748-1-biancaa2210329@ssn.edu.in>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:LSLeNu/JO9cg6SALriLkBokC/AFblBHCdUPZCGQ/dvEm/cGFBOF
 t/QeFFYV6Rw5fySNSkfnLEC9/QOKTzjt0wYmVvi1qHG9dylCxKGtvE+kgsOOq1e5Kekv2j5
 sjhSpoUHXzlsft4gzCH0+H3xwL3pI7hUzWF8ruDZlK4r2vYUnyAL99hNl/Ej58rtD8F1901
 hymjWE3zM4PyJHXgaK/dw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:DxCk1oZioww=;yE+RFswyaDb/Ag64wrzi3Nyd1bH
 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
 cDgXbuX2PiVzhGP1Y38w8XHi7c=

> - Replaced pr_notice with dev_err for proper kernel error logging.
> - Added explicit cleanup of link->priv on failure in probe and config.
> - Improved comments and readability in parport_probe() and parport_confi=
g().
> - Ensured allocation checks are consistent (kzalloc returns checked).
> - Minor refactoring for clarity and maintainability.

Thanks for your try to adjust two function implementations.
https://elixir.bootlin.com/linux/v6.18-rc2/source/drivers/parport/parport_=
cs.c#L83-L162

I see possibilities to improve such a change description another bit.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.18-rc2#n81

Please recheck the indentation approach accordingly.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/coding-style.rst?h=3Dv6.18-rc2#n18


=E2=80=A6
> --=20
> ::DISCLAIMER::
=E2=80=A6
> The=20
> contents of this e-mail and any attachment(s) are confidential and
=E2=80=A6

Please avoid such unwanted information for communication by the means of p=
ublic mailing lists.
https://subspace.kernel.org/etiquette.html#do-not-include-confidentiality-=
disclaimers

Regards,
Markus

