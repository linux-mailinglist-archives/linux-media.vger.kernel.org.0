Return-Path: <linux-media+bounces-66614-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id E8g6LlzPSWqC7QAAu9opvQ
	(envelope-from <linux-media+bounces-66614-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 05 Jul 2026 05:28:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE9A708DF3
	for <lists+linux-media@lfdr.de>; Sun, 05 Jul 2026 05:28:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=d+NRleE6;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66614-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66614-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E0C31301CCC8
	for <lists+linux-media@lfdr.de>; Sun,  5 Jul 2026 03:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00DB2283C82;
	Sun,  5 Jul 2026 03:28:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3016026D4DD
	for <linux-media@vger.kernel.org>; Sun,  5 Jul 2026 03:28:15 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783222097; cv=pass; b=pWgrvKt0htDfDsvYiM/H8QsMFzWzgVJbdpZBqtUiLdWO7VsdxVD+kyUlhK/Ai0qmNrLqogfZO76mdqxYrRBkqjrMy3IDH986ICiVvY850RubDSqmaKKUPFBM2sdjjz7zVPRZpwBa7OxtoD6fjA0jeyMKkKPftM02A3XsNFz3QXc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783222097; c=relaxed/simple;
	bh=FGR/BzjhZJ05hunNoEYZDaafqJ3pIUvyyuRcNCtA2HM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LDv4qVYT3RdhrUfhSZGYW6BZvvpLfX4grG1ZL83+vKaPYo6Dj7Uw44kFhzd0kTJFpVkvjiNZTkOn/m+wDdl4nSFcy0HRsq7z++ibNCv6cfug1Et6lJvNOjH3kjxcLsKxaW+oLfmc10RurO3voD/V/i0uN8jO7xjhhg/tVTyKkdw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d+NRleE6; arc=pass smtp.client-ip=209.85.167.169
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-49612ef3209so49849b6e.3
        for <linux-media@vger.kernel.org>; Sat, 04 Jul 2026 20:28:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783222095; cv=none;
        d=google.com; s=arc-20260327;
        b=YXuG9xRD+vZUb2rDpXPGaQwpShEWuNSy4vFQuMcqYzhv3laTOecapbwV5xC6C67vzI
         mvp6FDeyohSut2L4JGIo91sUmJlBQFiEtp57kYbJo/P7+KKQ9ztXBpFCfp6FoNMlxNxy
         dlIVLv6vR9EEO+xJWCIr6/FFe0sgcONoZ/JztbwSRnzcoW7e55/+mnmARPmVJMcOW65x
         4PbYPxol8Dnk6TC3ld9q836srIiRtwbrZvLw8gj8QhZstKjJ+vA4rDNscovwARdodkcL
         J7iy/gsKYjpfE5ESVoAfeWgoOZ6K7y9BeAd3Nnpl5bBaRtA3vAAQBVJkd0o/9JasNgyK
         H0kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ieXxQCfc9jK50MrQp+fvJnmXcIOmw3L8HnaFw9KiD2A=;
        fh=QHa8qNzUc+hYUjkDAp8KAzl6vsNPIJpBA2FBhdD3iTg=;
        b=VH9wt4HDH97eaDa3TX3yuWkRnq/sOL7/Geg3HN5u1rMYpOLq748kjhPNH55bwON8T6
         I7X0uj+HVa7F7l+9WUnvzdWboaLHVPIRXnLJtdBZd4g2RPaf/9ULm4CQgTozcp6kFnMd
         9tewYN1zbwnS5jqBQAt5RfBI1n1IIQoijFURfRsPe7y+Zpwux61nM5eGnLHrf55zeEon
         I2SztIh2Ac2SzuQQ+8mOCSjiKH5MXLMf/S7uGNTOouJOIXLqZiCDCsNUWLKDtRdBrS9E
         LDxfMLOSlVR++EwZFRADf/LUw3wkpmLEpPk5HyCEEVrfFrvUiHhT8dpREsF+AQgyAEUu
         WH4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783222095; x=1783826895; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ieXxQCfc9jK50MrQp+fvJnmXcIOmw3L8HnaFw9KiD2A=;
        b=d+NRleE6jdJpJ0xV5/WuvsZ05UDIt94ZVk8jhE884YDmchfLX7uu+cyj5gYWZkD+3J
         LACegKXxSAi2Yf1M4n2cRZmFDstF00O+N+XO8BATuwae/2+z0JCbrSI7mUIYHXW1untX
         EHe4P1BbfKSOaq69UNCuAVyuYfkTjdB8nMr7LUCKoNzLOSrrmfm5FJwuwLf3h8Ynf0C+
         UI/KLpKzc0zQJbQ5u+jADmkwWDEnJh9tac98mDy48hkGWRrJT9VhWyVBwg6KPEkEXQLM
         AruCSoRKdZ22A6aq7J+ER/TqvK+GR8s2X0Re+EitgQ6638VDZl24XQme0rp58tTjrcVD
         7gpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783222095; x=1783826895;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ieXxQCfc9jK50MrQp+fvJnmXcIOmw3L8HnaFw9KiD2A=;
        b=S37/4oG7kuIAzcTaW5f0Yf8aGpkI7N2kNM1f6yLxfTP8NrT/YfuF8SbW2tDakhXZ7w
         tjCmsuM7YXQ5uuCr0J+wUs/dOhbC938cCRCz7nA8R0dyCBXdIUG0bxmmlvSQpn+4O4h9
         vkmuynIVQakG35d1Vd7HbRU9cRcaO6Fs1mNy2SwqfZKAUblU8yzsSMCttC0tJannE/ZE
         5yNqctaW+heToU4QnK8im34UZJyR2Wry7suTrnwM+ow/59nRlfOAwcc7QcYPM1aKLViz
         6lesqI4E5D2ER23uVJ8mTlxHyG96yJgiHqKRpULhV/TW34pSVYtFnbxw81jRU5NvT1/Q
         uotA==
X-Forwarded-Encrypted: i=1; AFNElJ960Cm6q3XNj9Zxoh5+4pYn9tqKlRVn6CAXCHuToEjwfELDtmdoxHFbPZrPJDBTLEz/NXWwpcEcEZx8rA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNpPccVbdoOdBP2MbGsOmmlgs5QXI1cWTCzHEV8TMY7923Khdk
	uekPPytUpesGSu/PA/eF+d6xfpRzMQtdQafIi72+rGl37Kvueir1yjSzojPhsNxBaS6+8XJvSJg
	xqmO3NpwV8B13SZQn55MVoBG6kfn9PNk=
X-Gm-Gg: AfdE7cmmwPQjwY4NInZua0YfA4hZaxIIFEKWSr81ouTPdpYVonnc0t6RXiDI6KNGHoX
	qLuS+5dW9dQ2dtZC37cbH59WEFeXTHLm3v7OnMHZX074m7yrKaWJ5RbbNe69oLNYMKjxbU3yehZ
	zuCB5Kkyap6iuBnS5Vk/KI/Zygr4mHZ/y7lKg6gZT31njqoYwmxfGJHDF9lVF2qonYh0sptSI+W
	ycAZvI53f89idi4sJf5tiJKxWs5qhaVOkT7uTntIE8gPitp5+5u69S+5VVhnc3T8uEXW6DWwRoJ
	YMGpMwfE+thpIA89MNs=
X-Received: by 2002:a05:6808:1241:b0:496:7ba:89b2 with SMTP id
 5614622812f47-499b666d50amr1870672b6e.1.1783222094991; Sat, 04 Jul 2026
 20:28:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701161534.31152-1-nealpatalay0@gmail.com> <akYrPsbQnjPfAPkq@ashevche-desk.local>
In-Reply-To: <akYrPsbQnjPfAPkq@ashevche-desk.local>
From: Neal Patalay <nealpatalay0@gmail.com>
Date: Sat, 4 Jul 2026 20:28:04 -0700
X-Gm-Features: AVVi8CdKS8A_0PEDq-0xGErFWP6IwOg0JBlkLmDX9uGpXBqsTqxxNlc9zRMK8uw
Message-ID: <CAGjuiT_FOaVrcH=2Y6x8bfcjk5bTkUCntU5_F5giaLsdjdj+Tg@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: refactor pipe graph dump stage formatting
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org, 
	gregkh@linuxfoundation.org, sakari.ailus@linux.intel.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, matt@mattwardle.net, error27@gmail.com, 
	mugrinphoto@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66614-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:andy@kernel.org,m:hansg@kernel.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:sakari.ailus@linux.intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:matt@mattwardle.net,m:error27@gmail.com,m:mugrinphoto@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[nealpatalay0@gmail.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,linux.intel.com,vger.kernel.org,lists.linux.dev,mattwardle.net,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nealpatalay0@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CCE9A708DF3

On Thu, Jul 2, 2026 at 2:11=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
> strscpy()

Thanks, I'll fix this.

> Nope. Find the actual commit in the history.

I'll fix this too.

> So, this makes code much better if
>
>         if (!flag)
>                 return;
>
> BUT, the usual way of such functions is to make check in the caller(s) an=
d drop
> this "flag" completely.

I'll drop the flag entirely and do the check directly in the macro.

> Use logical split and make this all to be shorter.

I'll shorten all of the long lines.

> Instead of doing this way, consider making an string literal array and ju=
st
> loop over it. This might need to reconsider representation of those flags
> as well. Yet, don't come to the conclusion, you need to try and see which
> one is better. The current approach is okay if my suggestion will look le=
ss
> readable.

I considered this, but I found that the string literal array based approach=
 is
less readable in this case as the flags are less obviously mapped to the fl=
ag
names compared to the macro approach. However, I can implement this using
that approach at your request.

--=20
Thank you,
Neal Patalay

