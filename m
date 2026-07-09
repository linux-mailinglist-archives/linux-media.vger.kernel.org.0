Return-Path: <linux-media+bounces-67201-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7tP2IbvzT2ojrAIAu9opvQ
	(envelope-from <linux-media+bounces-67201-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 21:17:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE5C734DA8
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 21:17:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Gcy3hG4a;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67201-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67201-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9F0F23025090
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 19:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C9F13AE1B9;
	Thu,  9 Jul 2026 19:17:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66EE37BE64
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 19:17:03 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783624625; cv=pass; b=duEnVQrIkIVjUf3Tcy8jA8xJBAEgwW89BaEpWFWnXGnbofNeKsQeKwy/eNroBLT4EGSEpyA8N2sbcPjf5GzhGU0wI3FWzf6nXR5z9p5jVhGxUtTPPiYJQ6cL4sD2q9bAoEgPShf7FodAYoW0vwQvsYJGN0XVojProhemJ5PEi8k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783624625; c=relaxed/simple;
	bh=2p7+oT4h1SRnucufUxHFnJrsgb4fPg9EoRM+HicBv5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pn7Phe12RVJT8UKHDr2dgYmMwQtNQCeR+RnGIfU2S69dQxcGaEszwwqxgSa92dYDIYXacHpnLZKy6MO0HS8xs9o06vZ4cv81etoOt2AszktVfwOGIJ3h5Aas4HUFC5Hwi7kbddmFBEjDPPfQ3DausbV7WDeFyoPnGupYry9IKBY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gcy3hG4a; arc=pass smtp.client-ip=209.85.160.52
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-44868d6a066so34957fac.3
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 12:17:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783624622; cv=none;
        d=google.com; s=arc-20260327;
        b=g4BRhbmwLp/RuWeInKjW1JAETkrUvLAsNZC6rmLFPav66hld7yXqCxcnJijLexBMVm
         X2wsA6eAysa9QK/E476an6h3/sQslRaUD5s97+zM20GLz9azfWRlDZVH/Csj8gFL6qKG
         iJsKXdEtbNYUxgYcqrXkIPF396D0iF8r5twd6bMg7s5gCPuz1a+TVuaePap0Neq6p5Kf
         7P/TRLe9oQ5VtO+nypq0IejogcnUWR+P+tRw3fNgaCG4n2Ucz0kO4eQOZiXeO3fRK6SO
         r7qrZ+aBgGLIyHlwSk3kwrUejNkTYEiHC8bB221gQehJpJF3QRSkd9Jf2+CnGTuyvAjV
         Pj7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2p7+oT4h1SRnucufUxHFnJrsgb4fPg9EoRM+HicBv5Y=;
        fh=gWqYzGm/ddVEIofrPIzrHCLwVfN2x70t+9ha/4B0Zpc=;
        b=pB+dULkm2kO/fkIAEFzavCC3AF1wUqFOJxP/xDvkh21NJCP1B6bz7UKK+hF0+Jp8oI
         TpU/hvnaZ0oeAQuS6DKgd9rLyNfsV+gX4LrivnWjEAQ3Z4y0dZlClzuoYO7SbSpFg4Dp
         yR9ygik0GIR7oOkAa8QWvVnB8MDa+dJbX8fb2j4++JXEn3PmhjmZlklGlpmVHzwUZmCs
         dYUHg5AODGMM0k1Iujnr6n8MULwmxna3D6cKQqQj1WRGUCs2+GSG29RkvA3n4yFbwl0f
         GMDEjso2s+FI62hBKp3hne6P/UYlcV45Ux849nj3bwfzx0qN3TFoh7lheoxm19lKGbMY
         y3TQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783624622; x=1784229422; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2p7+oT4h1SRnucufUxHFnJrsgb4fPg9EoRM+HicBv5Y=;
        b=Gcy3hG4aSwTY7lZf/dQVB89rrNsUCis43N6FlBmrmliZiO2PuMYOjSzwqbyY8PK9RL
         fdv/volreOaCzdXAcseDGlP4ecZYcluZaffr3IKp/LXvisbpVcCVBfdRC0RAfMq4Lwfh
         0k2KaboTMMTEkk/3/d1/NMHL4IYpSa0KImxVTTeSyAoMHyH4SZ7BuBQeY/jq14aS4qlw
         mTUv4pQ0lySUV1cJO5o5LmYuUumyWhghS8/KOFgX6RRsWu2Szsg0JVgdiMcy51aCUEiO
         KsTSdjpMO6VCdG1R5+VOCQ+E1UK4RHAl/kuFxJ3AqYFDADDra0icikRkqA+4DptvAqhO
         M1hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783624622; x=1784229422;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2p7+oT4h1SRnucufUxHFnJrsgb4fPg9EoRM+HicBv5Y=;
        b=rmN+J9sIinlJ+xWK+bI3KYGOIEJPvAkH3Tl3j2DC27fSZrp22hJ6oKlTu0HtrhYhf6
         aN4qk3dDrwhjefWqGATIuViNaYJamM9X7dWQRxKs1Wr4BL+6UCGDRaiNFBUqfHfMzh2s
         MEkupbRAFJuwQSceEjYwTCg1hA47a59E/B7ZpVwNR4kipdIY33wQkcmBDiKB2CaqXU4y
         zGvYdEpCSdrqaUs/LlhErxgNSTxG3ckzPz6PBbzrGAe9UbYzl5o3pToHWL9B+xgyit3P
         qcQIGlLaiN1BmxOM2Udj2DzqczX0Ka32z72YjdB9ZwlqYgDA8cTlvb9NnxKMILf1nZ8O
         ETbw==
X-Forwarded-Encrypted: i=1; AHgh+RomlcPMNQBEgyLfFlRTpJIjFM6QTL5Zvp2k9seL9itMTefcSEImJ+h3XMY85jVzptwpVWXaiic6HbuTZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNz+76RNYtJArirKmZZq4RnPPJzAIMhkitfpQCkW1t+rh42ygN
	ftzwwXTFAOF9FHYEK/1YcxbiV0T8eLZ/H+TjR/ULAJKAcMqUPm7zIUuKapqdeSAJYd5w+9GWxfa
	KReqkhtAylBKcUBs2uH3jXkrtlL8cVNQ=
X-Gm-Gg: AfdE7cnyK6uLvFl5iukR5wFe/uZdKMmtvN8l/ARZVB0kKVUEQjyaxg0Uf/Ob5tx3BZb
	ViIXZHpjzIz4CiV/xsWNKLnmH1PIj52UfsusQw9lOr9WJEX1nz92+F1SuHL/ZFR89b1cA8J6YXp
	kfO8I5Rm6Zs3uRHVrqHJymnd3PtBsxcaQNm+sZnXqEtWxqYlDmx2XUf2GrwybfiQYz1aGCnT94/
	MUU+ds90a/zLCak98C7mu4cgV4D3V8w9sgqdFExwpjr7u1L/oVfTJdP6bUpsRPS2rAOYoVBH/Yc
	kzFedNGVX62RS+hNkxF88vg0SPZ88NLNFsUxdg==
X-Received: by 2002:a05:6870:296:b0:430:29c3:9d15 with SMTP id
 586e51a60fabf-451637bbab8mr5476553fac.1.1783624622477; Thu, 09 Jul 2026
 12:17:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702103453.348056-1-devnexen@gmail.com> <akd8E5jr722oTm49@zed>
 <20260703221651.41669d55@pumpkin> <aks7usxfDajS-W_5@zed> <20260706104652.GB66892@killaraus.ideasonboard.com>
 <20260706133956.39a11738@pumpkin> <aku6R_EI0kLUqD8e@zed> <CA+XhMqz2oTTy2kY_4uqvJRnoXb0am5h6hXnLFM4EPQ7Yb6N-pw@mail.gmail.com>
 <ak9UGtj7-qOvjRmr@zed>
In-Reply-To: <ak9UGtj7-qOvjRmr@zed>
From: David CARLIER <devnexen@gmail.com>
Date: Thu, 9 Jul 2026 20:16:51 +0100
X-Gm-Features: AUfX_mxOCcg4xxJn6r_NIxbQSmV8bRhUvmzPJGxaLDY5AKlV6L4ZVy-ehzY6xH8
Message-ID: <CA+XhMqzXMMDmtMyev_UuGpn0sU6TKNBDBzO1H-wN96no5h-yXg@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jacopo.mondi@ideasonboard.com,m:david.laight.linux@gmail.com,m:laurent.pinchart@ideasonboard.com,m:dan.scally@ideasonboard.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:davidlaightlinux@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67201-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3CE5C734DA8

> Out of curiosity: why is (u32 *) case a UB ?

Alignment, not aliasing. zone_weights is a u8[] at offset 10, so it's
only 2-byte aligned, and casting that to a u32* (which wants 4) is
already UB - 6.3.2.3p7 - before you even load through it.

> the usage of __packed triggers the compiler to emit an 'LDUR'
> ... implications of using LDUR vs LDR on "unaligned access" ... not
> 100% clear to me.

LDUR vs LDR is only about how the offset is encoded, it's got nothing to
do with alignment safety. LDR's scaled form needs the immediate to be a
multiple of the access size, +10 isn't, so gcc can't use it and drops to
LDUR (unscaled offset). Both happily load from an unaligned address on
arm64 with SCTLR.A off - LDUR isn't "the unaligned one". The multiple-of-4
you found is about the immediate field, not the address.

So on arm64 __packed doesn't buy you a safer load, the plain cast already
worked. What it buys you is not lying to the compiler about the alignment
(so the UB is gone), plus correct codegen on the arches that do trap -
which is David's point.

> I would be a bit hesitant in changing the uAPI if there is actually
> nothing broken ... happy to defer

Fair enough, and you're right that nothing's actually broken - it's arm64
only so it never faults, this is tidy-up not a fix. I don't feel strongly
either way. Leave the uAPI as is and I'll drop it, or if you'd rather have
it cleaned up I'll send the packed union (with MALI_C55_MAX_ZONES / 4 like
David said). Whatever you prefer.

Cheers

