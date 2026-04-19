Return-Path: <linux-media+bounces-59099-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLsCALmu5GnLYAEAu9opvQ
	(envelope-from <linux-media+bounces-59099-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 19 Apr 2026 12:30:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AD2423AD7
	for <lists+linux-media@lfdr.de>; Sun, 19 Apr 2026 12:30:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6657E3013B7E
	for <lists+linux-media@lfdr.de>; Sun, 19 Apr 2026 10:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F0B533EAED;
	Sun, 19 Apr 2026 10:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="hTrw97Wz"
X-Original-To: linux-media@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EB826B742;
	Sun, 19 Apr 2026 10:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776594600; cv=none; b=EPS/Kztk0ylJCDgE8atryhINrtcy2LtVx31gMgfGtJ+gXpnAzWryA/IbNdkFGdihiIPZhAB771ZpCrMo+y6VoD3WGWIwv0bQwUfunLf96k9UE7puBE2siOy3ubbzBIL/MRJWp/dlz9EqHDuser6cU6QBVXGG+FJWGqh7DBDUHII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776594600; c=relaxed/simple;
	bh=ynCcTcsQdJqF6wlgVDgpLfEGUucvug+BMjCTaKv2IvU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=A1a+iUnBqFobg7NJi+Ljiqj9awTBzWST2H4vxAw+p6DcM9BdanWYUwiEg42y6RdeILmo7Zybqt+qX6dD6jls3h8jKsmW3oGNpUDOdSMF6gQ4YaFHpLBD68/qyvUIepL0ab8PaR3FBe04uqTM6oaROww0ODqreQzRXhfaMMlXWXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=hTrw97Wz; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net BEC8F40B0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1776594592; bh=fhNcw2QeO9M5Ml70o9qwoRLrj4UyJGDC6GLDk5k7/eg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hTrw97WzLheOWIxsZCEFc9gLbynzXveYEt9iZ8Qj/FIWCeTO1BAHVEXYYb+N9cIp4
	 RIrhfcneAEcVM+dexKdgJkIfFLhKvSjU6PiF/h2IJg36ftGEhq1Li6SLyIWhZE75l7
	 DkTFTFNjHzeSyMM/HEHthPkqMUbZogFTddlc7GKp145CjNFL2W1AIw6sfVXin3SCzF
	 ufGdd4PxOGmjfNdJTvg43AIwZhtxqoMB9NMOlWGElSwJWlk69RJLUa+6+c37uLrAlN
	 L9NOxomqhJJY5xY4ItrLSbNqfW9nZrNQmRF3chILPT2BBaIiEWEzTzH5ooskRQE4Qs
	 q755pjaPBvg3A==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id BEC8F40B0C;
	Sun, 19 Apr 2026 10:29:51 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebner@mailbox.org>, Shuah Khan
 <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Cc: lrcu@vger.kernel.org, linux-kernel@vger.kernel.org,
 workflows@vger.kernel.org, linux-sound@vger.kernel.org,
 rcu@vger.kernel.org, linux-media@vger.kernel.org, Manuel Ebner
 <manuelebner@mailbox.org>, Kees Cook <kees@kernel.org>
Subject: Re: [PATCH] Documentation: adopt new coding style of type-aware
 kmalloc-family
In-Reply-To: <20260419065824.165921-4-manuelebner@mailbox.org>
References: <20260419065824.165921-4-manuelebner@mailbox.org>
Date: Sun, 19 Apr 2026 04:29:48 -0600
Message-ID: <87se8rw8df.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59099-lists,linux-media=lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MISSING_XM_UA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-media@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lwn.net:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,trenco.lwn.net:mid]
X-Rspamd-Queue-Id: 67AD2423AD7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Manuel Ebner <manuelebner@mailbox.org> writes:

> Update the documentation to reflect new type-aware kmalloc-family as
> suggested in commit 2932ba8d9c99 ("slab: Introduce kmalloc_obj() and family")
>
> ptr = kmalloc(sizeof(*ptr), gfp);
>  -> ptr = kmalloc_obj(*ptr, gfp);
> ptr = kmalloc(sizeof(struct some_obj_name), gfp);
>  -> ptr = kmalloc_obj(*ptr, gfp);
> ptr = kzalloc(sizeof(*ptr), gfp);
>  -> ptr = kzalloc_obj(*ptr, gfp);
> ptr = kmalloc_array(count, sizeof(*ptr), gfp);
>  -> ptr = kmalloc_objs(*ptr, count, gfp);
> ptr = kcalloc(count, sizeof(*ptr), gfp);
>  -> ptr = kzalloc_objs(*ptr, count, gfp);
>
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>

Just to be sure, did you write this patch yourself, or did you use some
sort of coding assistant?

Adding Kees, who did this work and might have something to add here.

> ---
>  .../RCU/Design/Requirements/Requirements.rst         |  6 +++---
>  Documentation/RCU/listRCU.rst                        |  2 +-
>  Documentation/RCU/whatisRCU.rst                      |  4 ++--

This patch will surely need to be split up; the RCU folks, for example,
will want to evaluate the change separately.

>  Documentation/core-api/kref.rst                      |  4 ++--
>  Documentation/core-api/list.rst                      |  4 ++--
>  Documentation/core-api/memory-allocation.rst         |  4 ++--
>  Documentation/driver-api/mailbox.rst                 |  4 ++--
>  Documentation/driver-api/media/v4l2-fh.rst           |  2 +-
>  Documentation/kernel-hacking/locking.rst             |  4 ++--
>  Documentation/locking/locktypes.rst                  |  4 ++--
>  Documentation/process/coding-style.rst               |  8 ++++----
>  .../sound/kernel-api/writing-an-alsa-driver.rst      | 12 ++++++------
>  Documentation/spi/spi-summary.rst                    |  4 ++--
>  .../translations/it_IT/kernel-hacking/locking.rst    |  4 ++--
>  .../translations/it_IT/locking/locktypes.rst         |  4 ++--
>  .../translations/it_IT/process/coding-style.rst      |  2 +-
>  .../translations/sp_SP/process/coding-style.rst      |  2 +-
>  Documentation/translations/zh_CN/core-api/kref.rst   |  4 ++--
>  .../translations/zh_CN/process/coding-style.rst      |  2 +-
>  .../zh_CN/video4linux/v4l2-framework.txt             |  2 +-
>  .../translations/zh_TW/process/coding-style.rst      |  2 +-
>  21 files changed, 42 insertions(+), 42 deletions(-)
>
> diff --git a/Documentation/RCU/Design/Requirements/Requirements.rst b/Documentation/RCU/Design/Requirements/Requirements.rst
> index b5cdbba3ec2e..faca5a9c8c12 100644
> --- a/Documentation/RCU/Design/Requirements/Requirements.rst
> +++ b/Documentation/RCU/Design/Requirements/Requirements.rst
> @@ -206,7 +206,7 @@ non-\ ``NULL``, locklessly accessing the ``->a`` and ``->b`` fields.
>  
>         1 bool add_gp_buggy(int a, int b)
>         2 {
> -       3   p = kmalloc(sizeof(*p), GFP_KERNEL);
> +       3   p = kmalloc_obj(*p, GFP_KERNEL);

So you have not gone with the "implicit GFP_KERNEL" approach that Linus
added.  Given that, I assume, he wanted that to be the normal style, we
should probably go with it.

Thanks,

jon

