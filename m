Return-Path: <linux-media+bounces-59101-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCZxLDXA5GkoZAEAu9opvQ
	(envelope-from <linux-media+bounces-59101-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 19 Apr 2026 13:44:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC4B423D83
	for <lists+linux-media@lfdr.de>; Sun, 19 Apr 2026 13:44:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C6FFB302334A
	for <lists+linux-media@lfdr.de>; Sun, 19 Apr 2026 11:43:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2E84326D51;
	Sun, 19 Apr 2026 11:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="QVa3xvBZ"
X-Original-To: linux-media@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9F430F533;
	Sun, 19 Apr 2026 11:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776599014; cv=none; b=owDEyd9y/F0SocoZm4sZsaEyeuLSSCtfP6R3OwK5FiHj6k3ZHUu3CG1auKyNIIDraNccOb2dpDq8ZtdbDxZ1gJflq8lGNsC9O99IlCKoFZMXsrCBix1Rg2Lw8EDbfps5bqbWXEKj1XsCaIF8HSd5Ixdb+q6Jyx/DiINe3r8RmmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776599014; c=relaxed/simple;
	bh=IMDxIvzyumDawQtoXNv/Xd38pSmE6XvbynP3ndCwjJQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FzRFqETW9OPHKwKTX+GKH0vKK0mKa5y+lLloPsg2pTJo0RHeLHTCEaYrD+4zSkcwYo2OaQKr0dxYwTbM4AiysIKulq7aPjid2qaboYF2nFlHF9h+qxn0GdPu1RR78VBDxZMzvvrrPse67G7qpXYz1sIeRDkhKkuFrJ58V2Fc4+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=QVa3xvBZ; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A7D4B40B0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1776599012; bh=IMDxIvzyumDawQtoXNv/Xd38pSmE6XvbynP3ndCwjJQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QVa3xvBZScmeUvqxIn2pX6iESz0anZ5QgZnlLPQurU7HQciufu+fjinOgMLN4rxp9
	 3JGLM3RK1zlnvJejJZ1zlNRn8AlcUleDOifNwK6nN8jQORT8e/jghXZTuB6GjKqlv4
	 5CUbA5V3SYW1bKY9ArozMT8fAb+mTh0vhQnZZFe7iV+46d2uJE9W9d+l057jiXhSvx
	 7U8F6fqu0WQFzCJ3//E5Q8RIbt4Crg70sX2jpjVu5xthB+XavZ/5+1lK9XNZd1hi2t
	 pAbLYPoj4E1k6DpE0YrOgOsRteLR5KhwR4UleZ+t2SYqdI+hICdJyUMe98KZiHYZ4A
	 xX21nGWLWd89w==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id A7D4B40B0C;
	Sun, 19 Apr 2026 11:43:31 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebner@mailbox.org>, Shuah Khan
 <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Cc: lrcu@vger.kernel.org, linux-kernel@vger.kernel.org,
 workflows@vger.kernel.org, linux-sound@vger.kernel.org,
 rcu@vger.kernel.org, linux-media@vger.kernel.org, Kees Cook
 <kees@kernel.org>
Subject: Re: [PATCH] Documentation: adopt new coding style of type-aware
 kmalloc-family
In-Reply-To: <295490d9bd8b9d519dda5c4551e7dbaf36492a8a.camel@mailbox.org>
References: <20260419065824.165921-4-manuelebner@mailbox.org>
 <87se8rw8df.fsf@trenco.lwn.net>
 <295490d9bd8b9d519dda5c4551e7dbaf36492a8a.camel@mailbox.org>
Date: Sun, 19 Apr 2026 05:43:27 -0600
Message-ID: <87o6jfw4yo.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-59101-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,trenco.lwn.net:mid,mailbox.org:email,lwn.net:dkim,lwn.net:url]
X-Rspamd-Queue-Id: 4CC4B423D83
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Manuel Ebner <manuelebner@mailbox.org> writes:

>> So you have not gone with the "implicit GFP_KERNEL" approach that Linus
>> added.=C2=A0 Given that, I assume, he wanted that to be the normal style=
, we
>> should probably go with it.
>
> I scanned those 8 replies by Linus, but i can't figure out what you mean =
with
> implicit GFP_Kernel approach, can you give me a hint?
>
> https://lore.kernel.org/all/?q=3Dslab%3A+Introduce+kmalloc_obj%28%29+and+=
family+f%3Atorvalds

See https://lwn.net/Articles/1062856/

jon

