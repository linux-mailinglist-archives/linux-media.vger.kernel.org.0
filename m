Return-Path: <linux-media+bounces-64138-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jyZYLatrJmr1WAIAu9opvQ
	(envelope-from <linux-media+bounces-64138-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 09:13:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1304F6536CE
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 09:13:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=gu+n+BFd;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64138-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64138-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 853D7301C3F8
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 07:12:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 352E938AC88;
	Mon,  8 Jun 2026 07:12:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C7934D93C
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 07:12:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780902734; cv=none; b=cyEFbdXeRmUtvwtFp/J+crEovHXIyajvvVS0T5Zb8QeylQif3lkfn4iyxzIi+/x04eiobx9yKdtyh+NbWoSbZn0Vha3Km9zV9MrlpxYMzbPsKVqhGCwG0xNSogHxCar0oPpm5Dfv75KtQo4yR6ElvfP3Qviy1OIfWarSQIVfxNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780902734; c=relaxed/simple;
	bh=iQaxjTszkEjiEZiSiUlMn1vD781sN7kupsAHg0qLIh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z++AS1HmqFZCfF2fhyMVFq57UQqNKSmpcYHiz+pkiA8N1L41nhF36SulvnTP2sUv+PK0LGhtALXceZh+Nj5KvUGcpEx4bVF+5nwyI1PMMocmHRwvW2y6bzFzSrVtS64IBNx4iCfY1r4vv3y/bt6KhK9sZ163Jl7UTEPw8h82wgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gu+n+BFd; arc=none smtp.client-ip=209.85.128.47
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490bc6a7958so34482885e9.1
        for <linux-media@vger.kernel.org>; Mon, 08 Jun 2026 00:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780902732; x=1781507532; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F5DCeU5OediV57bcWcfJYqqGuezNisQJlQN4Qb2qUp8=;
        b=gu+n+BFdNsolDvg3e4G6uQhqCnqf0eMxjQNs7ZSapI92KdUKfrL5p0dVbi1L8NI2eq
         9OKtZmvxz8LlbH5lm6qTNEZV45O+9cDNGQm2WsAojeezz5HZGjoKDE9SpM2pMT4H+NyI
         7vYaNYchZfHi98RHuKzxDCfC66bLvoq7NDk1y0YE9oolLceG5hwhzo1/ZFLBV410egTB
         15ILfKY9taMvCq/gS536bf6S5pOAu4ETS9SnAcZk3khLAP4/8zoSRdH2haNgiUdx38pb
         x3r5n1zV30G6z0+jutItHx9r6YlqJ9sQoaDK4q52WM+n4zIw/7fSz8ZEMpDG4lt4vI8t
         YIxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780902732; x=1781507532;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F5DCeU5OediV57bcWcfJYqqGuezNisQJlQN4Qb2qUp8=;
        b=adFJhkV8eHGiZzS51oVsH6Rf3kuzAG+fnzyPTLy8w0zneBUmpNyOJEtzlDn5nF5X/9
         GvA+VPIAxFZYZVk0CWnybwwKffVB6RmP/QdQ4eFBse95QZeTq/VPGqu7xT+3hMSb0uhF
         Wt7UjIpsrnMKF1Lr24JJQqDeMrFc9qGaHSw2Nofjwwm0ok9y9owgkP7E+7WJf3duZn6v
         hdEz2ZK8HxqaHFRxC0as4Fp3uWrCTnSkPJGWxnMhxo3ku81hEA0cEbTjQhISAPTfW2C8
         ovRlznnxms7ZsGy4BN9hQHxQsm1+hucEfjuSI63KSgDOm576NY0bk6D3/9mtgMrQZdUj
         wCuw==
X-Forwarded-Encrypted: i=1; AFNElJ+nQCOu7yJW3fYDsAgz9p00bMFeHdFWQ7jrgq9LlfnNyeVTVtIZKBPgfkgqLnq04LYoltKhYlfbTvB/1A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1NMbcuD0E5WET1XGJm4R7vhLP7zKMp6/74YzMLltF6jvtRVqR
	rEdKamZGvpiqGw2W6eKGOAmajEIniNznL/yasF/egeODPDBtf6QxOh0z
X-Gm-Gg: Acq92OH7Xyt10zepDhfzRSDQ01nXfqOSObEAN3DGh9xxn9+RQzYAFHhAqPIbT0YODs8
	dzCnr9EmnD3EzwoUW0cQuBBqnFZIQZEY/4NP7saOoSCNdVmRZcRuoQjaFULSd30xd1akwVPJoz9
	3g7WUmpr/T7vdSdVV+iwD6T6BSwWND8tN3CYD8wLf3OWVY0pr9eS3IkR+uHSrfXTVu0o8tYf1fL
	zdoW2dOMqj7oQwrhEEqLfC+HHMwoI6ZjC7i+wlsWBM3ghYQ/RbE04a7nKEmCFEpdcMMVBVhEwn8
	S4NBnmvi8fUaVlzOWNPJvCILovG6U+vkC54qDPQEL99oe3GfHJRmz6W/OPEW81BwnHY/xy7E1zb
	+NuGvidw5fkBX9Kk6vhRY2EIWEOlU/x0rQE1Wc1GlWBr34et5xUNYBD57BU5SgvAVfOzwgdMlDs
	SLs7Wa8Kq2Mn25aLHNCOUtqYMSGUTO7CLPAdCJyCOO
X-Received: by 2002:a05:600c:6096:b0:490:c1cb:48f4 with SMTP id 5b1f17b1804b1-490c2d038e8mr179174005e9.12.1780902731900;
        Mon, 08 Jun 2026 00:12:11 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bda4fd52sm353491175e9.0.2026.06.08.00.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 00:12:11 -0700 (PDT)
Date: Mon, 8 Jun 2026 10:12:08 +0300
From: Dan Carpenter <error27@gmail.com>
To: Rhys Tumelty <rhys@tumelty.co.uk>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: media: atomisp: remove unused macros
Message-ID: <aiZrSA_R2NxIN2Y9@stanley.mountain>
References: <20260607094130.3208513-1-rhys@tumelty.co.uk>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260607094130.3208513-1-rhys@tumelty.co.uk>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64138-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rhys@tumelty.co.uk,m:andy@kernel.org,m:hansg@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,stanley.mountain:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1304F6536CE

On Sun, Jun 07, 2026 at 10:41:30AM +0100, Rhys Tumelty wrote:
> Remove unused macros across the atomisp driver that are defined
> in .c files but never used. This was flagged as an error in a
> W=2 build due to -Werror=unused-macros.
> 
> Signed-off-by: Rhys Tumelty <rhys@tumelty.co.uk>
> ---
> v2: Removed some macros that are used, or should be kept for documentation, with feedback from Dan Carpenter

Thanks.  Looks okay to me now.

regards,
dan carpenter


