Return-Path: <linux-media+bounces-64044-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ncx/JBkhJWoRDwIAu9opvQ
	(envelope-from <linux-media+bounces-64044-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 09:43:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E0264F07D
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 09:43:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=pMFvFW2N;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64044-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64044-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 397F0301751E
	for <lists+linux-media@lfdr.de>; Sun,  7 Jun 2026 07:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DA6C36BCE8;
	Sun,  7 Jun 2026 07:43:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDAAA35DA40
	for <linux-media@vger.kernel.org>; Sun,  7 Jun 2026 07:43:08 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780818190; cv=pass; b=bRC40DD4tCSok0pwzQ64CeXQfYehPZBh7bffK8Rdq2FCbGdlNstz6ZIchwE81WVB022HEgPMo4m2Boot43+/BNei0IYd3DqG45xWa+X7IROlNuBOv4SaSiNNfE2nm4ipn2dPTJegfANCpEsgylYVlw2zu1fdt6ALlzH9R+CPbOs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780818190; c=relaxed/simple;
	bh=TgNqtslVOWQaI7JpBjzhjj0WSlRFelSr9zDeeTbQVbM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i5YP6McwxkK0h3I8XIXjh0JXmSXTWktyGaFLvWfdDKAJvCafUjGcWaGi88sOYFkz3RQket0IlC3Wo6PT4N/v4GmcwKIZTILL/2uLfO0dknDIehvXEyoxONQTyU0OH/nLkpCBIs+Qp+8AbMsKcfpv6airDvt6+mUZk0u+VaCt2oI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pMFvFW2N; arc=pass smtp.client-ip=209.85.218.44
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-bed2195323cso469135466b.1
        for <linux-media@vger.kernel.org>; Sun, 07 Jun 2026 00:43:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780818187; cv=none;
        d=google.com; s=arc-20240605;
        b=c3MkOIjyOZpj+S7EvTu6h8CNHxHzXi/wFO/IFVbljoO73vB/Tr5ttwZRZUydqIiHNV
         Iv3KU7rXaOu5I2T4n8doABN9glYNz0rRAWer8r0xNnTaSWIXQ7wyxE7MNg6L9ekbjaGY
         1LdL9fzCMpx7n7XUhuP6SW7AcZs0Coj631KRmKdYiXBV7LJLzghfSMvwoR3AimvGSxi3
         B07oQTMQXMCmfBO9RakT3zd+xGmBtNiRHeyY617KzPvmzZlmI8aMd27u8orCviqHfe3+
         +QkqEG9qcZSekwo3tsPe3QiFZb4hevyOmu8fLTsgO93AUTk0ZTpJtEoQJwZLbxClhdNE
         SYQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TgNqtslVOWQaI7JpBjzhjj0WSlRFelSr9zDeeTbQVbM=;
        fh=lN23FDkd5FilARFweZrDi0TQl0K7IgXkoZcEmiv/Ohw=;
        b=XQy2pTUPJ1OboUpQjcBK0JxdRJ56jR6XkIrmjMbVHl2xPA20CEeV7fFLtoIPfUtU8i
         My9Nri2mZbMthh12d4POqAHjraVmPesWr2RNJADhYZ5SHRQZgIirquxXD7Hj9Mvo4o86
         /dMPMIExyqatai08Me9lkxByi+KPwJ0BNSx4Fk7iSPj8D+3aH2yy0WKTamw3SWuqBb4b
         G0QHxmtFHFxEvf3CgI0Cxq9W843pre2EKRZLXV7LWR0CM9d7TkMpyPy88SXcquPsfrls
         0h9nFteZoM5yCRsAkgHXDWpnJANNeVFtOp/RbtvP2VUY/gHjxpkvpxxdTjiD9qD09Xf+
         rrww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780818187; x=1781422987; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TgNqtslVOWQaI7JpBjzhjj0WSlRFelSr9zDeeTbQVbM=;
        b=pMFvFW2N9iae2PEcCbCtdDXbbTeiSDd1tiAd7t70ex2AIxhp3JIrYmbQ0LF2ZTBoUY
         7bfbMdIeaJAMky/Oxg26nQbOFjdFydPZuuEhRrgqr+cjDlychewY2tjbZ3Dc3khtREwR
         2EBQdnCddIh85qe/QcG7iicazt47U+Pr2oLO1ub/rvRBXVW7e6mOxyiikFwqjDx5nC2z
         2nAOS3gmfkQskOvvKA+JX6oHiqraRPGVyAdalz3oTJ3I0BKBEFw+IKsSydqmAzZGOnlk
         D2iNZCqHsCeI+SZybDzNzQsg2DFU0nhNyFMDAQTUwWKFWAyAlE+CI2bYbaHFEuun13WF
         vnqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780818187; x=1781422987;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TgNqtslVOWQaI7JpBjzhjj0WSlRFelSr9zDeeTbQVbM=;
        b=oDj6keGY8m+OqSln8nVKxQO9K7ofUqMWk3Tn4mbgrExEJdXR6GhIyEQ2ufUNe4hgkl
         8gAo9mxUzfUucRxbs+kS3bWk0LqBBTyYxEz/zAAqkgmmg49xf+DUaT9tqM/noJPwozYR
         r55MxmjpIIAcv10lkc3NBtHpz+dRVUL484h+iRGczGzy92HM2BxFScUvMv9XJ43tr7Bm
         G/YO2pe+lVeTxlzp5TUYc8oEE5P7eTkKusyPTK3Kpiu35ilNcTw/gYDMj8fhMpmFJ/7T
         oUyRomz5veFlbdGkkNPWUE6L6PZ2Kl0nJDOr6CUWJiY11CAE53KJdhjV+S7RM39aiDII
         xsFA==
X-Forwarded-Encrypted: i=1; AFNElJ9Mo5ZP0q6G/MBUpnT1FwCdA/5XJXdXV3CoWOuxZwTJ8I7rnEAiE4eqhkyANXgR3dINqnaOzfrrIBQeww==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy20ypKFhB1x5GWwzRfhrSmqnXPB36cqthFPA7paBRYHhvD7X1Z
	3nhURto4paIlL7SrutNU9AHZlNvmd1paoP7RNfoklGg1jjSpovbULH+Gy7cokIq1W1TzLNv/gP/
	eYBZHZDMEhrrIaxEQEyI4D1CH8W9gOUc=
X-Gm-Gg: Acq92OFXpbXYsqtMpn9/3NUG5cyqS3/MwCW1HEzpOtyO9KEUK8WhQTKEpHmpB8MJC4X
	ZimWAGWsgM9a+y4nk51HJ6v1BkDDrjQQsSu1oao1r5G00FmByICraqwa9jI+O+aHcunGKK3/kDA
	0n8uSXcQDyoH3GbMogA2lswKcDwdDNrE9MihLfyDF9NkBAIAnV7qHwxyiQgNgHvJcFnVQFA7bVl
	IqTCbc+xd5MEEsRpbv/hcSjRZPx+Zz5t7us8lz5uJ+MOUc0oBnTxAU+U2FOaY0D4x5+O8U9OIle
	PwPnWurASyYarvJilM3pjAEVUKQt0mLZcl7j7ZcCtevN4e8Mfi5WvxlzKigKgcAv0DuB/XMmS+e
	FJZmD1bOqTaS5TOU9vwxMe8c8xlgrLebdu0586lg2Q/lXGGGv4SYiJqQ7uFMDCGPlCp7Eet62v4
	SafV0=
X-Received: by 2002:a17:907:96a7:b0:bef:87ca:aec5 with SMTP id
 a640c23a62f3a-bf3739fa0e0mr567495066b.47.1780818186761; Sun, 07 Jun 2026
 00:43:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260606234427.9902-1-linux@notrealandy.dev>
In-Reply-To: <20260606234427.9902-1-linux@notrealandy.dev>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 7 Jun 2026 10:42:29 +0300
X-Gm-Features: AVVi8CdUXMbcmABhYEwV86mzX6FLo8NwWkKEvQxLcoB_FgApNOTYsjY_xA7HtlQ
Message-ID: <CAHp75Ve_U0RmodQ8FzOXuSs95FwzN0fvBAQ5OX8ZTMp_U1PQsQ@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: prefer kcalloc over kzalloc with multiply
To: Andrew Soto <linux@notrealandy.dev>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	andy@kernel.org, sakari.ailus@linux.intel.com, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-64044-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@notrealandy.dev,m:hansg@kernel.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:andy@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[andyshevchenko@gmail.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 05E0264F07D

On Sun, Jun 7, 2026 at 2:45=E2=80=AFAM Andrew Soto <linux@notrealandy.dev> =
wrote:
>
> Optimize memory allocation layout in sh_css_params.c by replacing the raw=
 multiplication inside kzalloc() with a type-safe kcalloc() array allocatio=
n wrapper.
>
> This prevents potential integer overflow vulnerabilities by validating th=
e array size calculations before interacting with the kernel heap allocator=
, aligning the driver with modern kernel memory allocation standards.

Wrap the commit message around 72 characters per line.

...

Is this the only case like this in the entire driver?

--=20
With Best Regards,
Andy Shevchenko

