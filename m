Return-Path: <linux-media+bounces-67095-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CcLbG00rT2o2bgIAu9opvQ
	(envelope-from <linux-media+bounces-67095-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 07:02:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6BC72CAC3
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 07:02:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=FlnkIQXv;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67095-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67095-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13104303131F
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 05:01:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E57819AD5C;
	Thu,  9 Jul 2026 05:01:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34432149C6F
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 05:01:12 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783573273; cv=pass; b=q5iWjiTaZrzW98qBFUAq0E1L5J3OaKPInR6ncdo2xuTV9lhfGGbzE2RmnbIQMpaxYLmXo/Skt8nKl/dwYhpGmws7ruImMttNDQVn1/pCytWHyC6GXPOXGyGSEwir+4gpzfoGsG/gWFFPM7eX9/drZhKcdldRf7IQYgIivsxmkLw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783573273; c=relaxed/simple;
	bh=PE2w4MndJBd7nMcxqSOA8zuq4uvBlrhJX9KZ4PJ6jyE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YKTd8PTDYq+Pdax27WavO3vkbbrDMBavtQouwEXX2sZ4IJkBH3Fzp3lF8BrtDM2CsIyFnQFJFmnCs8cFhcJWUWWBbZaCGF5yhYNSlf/YnKYakNqHolp4ooNhpmvJ9KZDPg0FwiY89QV3DJjr+WrmMI+Ty93YAhBhmQeqBMHw8Ds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FlnkIQXv; arc=pass smtp.client-ip=209.85.160.53
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-448b89f700fso715007fac.2
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 22:01:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783573271; cv=none;
        d=google.com; s=arc-20260327;
        b=SllADXj97Bv/PPSCPunDlEB36RLh9H3IACjlG1uKR4mskzB/mIGQL/sV0NUgEX1oN3
         lsdeQojL9VCh2dvcQHkhf5gQ+UgwRFt4kHkzdM6P/E0cLkYdmG8wBtJFnR8S7QdRfPMh
         yXagm4d0mzGMx4j+glHQHxWb1emUjPBJZil0kz6JwpLkfIbRtcYuwmIobRhjQUBohDaK
         pG6iQd01fLPUjIlKQsjFKwyB+haaUfmXohFDBkL3qvpF6wNA7SdYLn3Uwyj/HHxPr/c9
         uwmpIoH24f7esHqdEQ4gQXP6NeOHoVkXVAbSkwiLO4YZi6MP+smq1B2g64l8bzEawFC0
         qzGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=I+YN7IrDVlSPz87t4MbjMgkDzmRT5Xlf/Rvnd4pOdf0=;
        fh=MjShQx8jDswtJGXASRysZwvYMM3FRCyr5wAjFuoaIYA=;
        b=DqaaBy309jG8h4DrJCuuk0f4VQeT00240yUJ3wpTPDcQqVe4xROAbF8cJ1xn7M896I
         E1eWV8jv4G+LK8uHdFxKDYDdHiKyfqzR2zo7vxJNXzD3qwQuS6vb6BKJjGtspYSga5bq
         M/muAKowayZlEQeyxA/lmlimZ6jopCcppw1j9GH5Y386jeehbBrOkgyQY/T9e2NPjxuD
         w4FeKBDDOGa/PxVtrZtOt+UbF5LNUY8fJpSuXx+SRuAlSJ4RNZ2+jLuwq4QO5heGz0+0
         N838jhTafGW8XZ6iL3txaVR/4l2RwcsRUduCWSfXckQxWY9g8o0mihlyWa7AYwXYkFTv
         +Udw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783573271; x=1784178071; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I+YN7IrDVlSPz87t4MbjMgkDzmRT5Xlf/Rvnd4pOdf0=;
        b=FlnkIQXv2zp8O9EKxby1oS64M5Caio34pn/cHYf2a40i8cVxdEjwO+Cxvpx67HrU4E
         63bAdIkGXuhE5wWSSYMMUZqGDXpFJuNXX96zm4GIReQzszzgiMT5u69KZS76ARAGye9U
         8b3PwjXzC49JyOPhUGcuOEQFaTRryof9hx2Fv1/gbyY01ykkqLGnTPCbTGXF38nQEWIq
         O+YDaZwbrBEb6X9LGAp3YVUG1d0/E7+ViDzoLaKZ4ZYkJ5npkxjhCJ5UwfQRHvOhjFZO
         V/xDXYdWRknT7vQCJsrp2EDBDKYnmmsyKFuAKnoQfJsLyBudyMq3vl/8LjpqPIsmpFlm
         ydSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783573271; x=1784178071;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=I+YN7IrDVlSPz87t4MbjMgkDzmRT5Xlf/Rvnd4pOdf0=;
        b=V/4g6UzJ4fXE1c5wEkiYqwdSjvnnOzpKUrM1A82yChH9+j/plR81kZ1TWx2fFW+f9Q
         NhL8wXaNwtStT1n1YASKNpeoercnoMZVXLHwtei8FzcyKz6SYWnsnrADL1j8fXOMhriv
         D2yHw39tteYMQl4s9SZrKF0st75EBc4WrDtZGmGEJB23sC9nDSTsmeOxo/SuyVfj0aKr
         cnbHtqmCHbUZZOOvDU/eu25RixM2Wv7nxzGrf5bUHiYWIM2hclblZRx8nwie71xrTdiK
         FdwQ6oCuVzQ0SbTOBT0o7Rjfq6Pyv3CfnEFaDuyUQ2ttG09y9JeN1a92NsU77qWJvuIy
         kfXA==
X-Forwarded-Encrypted: i=1; AFNElJ/3g6cLZeho0IiE+R5mlB/1tjAa91JSyn54ZvxjfZOKqc5A7yqxsZKp4nqhaVwuIcIJI+l4OPM7jJoRCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLN3CtSE+5uNsHUtX+BfcpPmuQJW04tIOBX/2DSmuKeJWs9dkO
	Mh4n7cRS9PGivq98KXuPbrDvKKE4ngN5hWS7qeoswVtThmZFnu0U9w0dLytI61+80RAACK170DQ
	dv8OzUAubagNkPAAj+9eVY+DS3kc6XE0=
X-Gm-Gg: AfdE7cky3w9EoPF9+ZwgQbP3qdWWu7hUq0rQIbczB36wqQIIRiIw9zxWW4TDYHUXEYR
	dmNEbx+uOQzsmH3+CjpU9xFJBmiI3fnJyvoqbQfSCWKrnem/VVMP3u866xqKCdgzLSNGe+lMhBz
	g1exHslobMBotmW7s73Vkop+DFy0Aq8qOgR/+xlgEQjGHwG4e6gRSKLoeckIJv8ltJB1jkOje0R
	uAT9z8Bo8ssgw/bGdaAZT4p++t2FeGvZTLiecSwYKWmwYA51nbuJGdu0gm0gJzUB0JyyHgVjpLy
	JXp30qzDsk+ww638+rv4ikxOmKY=
X-Received: by 2002:a05:6870:224e:b0:447:7ad3:329b with SMTP id
 586e51a60fabf-451637acc50mr3647116fac.6.1783573270844; Wed, 08 Jul 2026
 22:01:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702103453.348056-1-devnexen@gmail.com> <akd8E5jr722oTm49@zed>
 <20260703221651.41669d55@pumpkin> <aks7usxfDajS-W_5@zed> <20260706104652.GB66892@killaraus.ideasonboard.com>
 <20260706133956.39a11738@pumpkin> <aku6R_EI0kLUqD8e@zed>
In-Reply-To: <aku6R_EI0kLUqD8e@zed>
From: David CARLIER <devnexen@gmail.com>
Date: Thu, 9 Jul 2026 06:00:58 +0100
X-Gm-Features: AVVi8Ceqropzkzn8RnLbgejAAhagC1QQAIVbnG6fcB1AFDIdAI6RGSiuDbLVYQM
Message-ID: <CA+XhMqz2oTTy2kY_4uqvJRnoXb0am5h6hXnLFM4EPQ7Yb6N-pw@mail.gmail.com>
Subject: Re: [PATCH] media: mali-c55: Fix unaligned access of AEC histogram
 zone weights
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: David Laight <david.laight.linux@gmail.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, dan.scally@ideasonboard.com, 
	mchehab@kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jacopo.mondi@ideasonboard.com,m:david.laight.linux@gmail.com,m:laurent.pinchart@ideasonboard.com,m:dan.scally@ideasonboard.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:davidlaightlinux@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67095-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[devnexen@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,ideasonboard.com,kernel.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnexen@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BE6BC72CAC3

> Does it ?
[...]
> seems to clarify this is a non-issue ?

I think you're right that there's no runtime fault: arm64 has
HAVE_EFFICIENT_UNALIGNED_ACCESS and runs with SCTLR.A off, so the
unaligned load doesn't trap. It's really just a C-level thing - the
(u32 *) cast is UB and -fsanitize=alignment would moan - rather than a
real bug, which is why v2 already dropped Fixes:/stable.

> I still see zone_weights[] at offset 10 which is not 4 bytes aligned.
> What have I missed ?

I don't think you missed anything - the union isn't trying to move the
array, offset 10 has to stay. The idea is just the __packed member: it
makes zone_weights_32[i] an alignment-1 read, so the compiler does the
right thing (a plain LDR on arm64) with no cast, no get_unaligned() and
no memcpy(). Same 240-byte layout, and it also avoids David's KASAN
concern about memcpy().

So if you'd like it cleaned up, in mali-c55-config.h:

      union {
              __u32 zone_weights_32[56] __attribute__((__packed__));
              __u8  zone_weights[MALI_C55_MAX_ZONES];
      };

and index zone_weights_32[i] in the driver. And if you'd rather not
carry the uapi churn for something that isn't a fault, I'm equally happy
to just drop it - whichever you prefer.

Cheers

