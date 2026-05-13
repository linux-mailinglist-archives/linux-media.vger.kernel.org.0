Return-Path: <linux-media+bounces-61526-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBQ7BUjXBGovPwIAu9opvQ
	(envelope-from <linux-media+bounces-61526-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 21:55:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E4453A3DB
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 21:55:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8F37530391E3
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 19:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 644663B95F2;
	Wed, 13 May 2026 19:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FsptozIr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334523A4F4F
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 19:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778702141; cv=pass; b=GnllCMvCOY9hLWLs4sWkEut/MRaT4DlGxbhHGDlCv9yp22BKa0h6hIFSB68TChoLQ1ddUY49DHQ6oTOBgm7Gs+TSw2qtI8/dsl/TwRO211YEQiBGsF7UJRVQzmlvck0YmGM/CeeooTNBspuGUvmEf6UlE9B8d7p66agoaAY0h6s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778702141; c=relaxed/simple;
	bh=WcWio7mgXRUVAYpzCib9WcVF//wmjkBti/gng1GlHL4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qkso3qYoKaVR4x8M3cLJXncnFUcUs43Uwoiv+cfJZxlzWPTOm0OZ4FWBG/A6fRwmD7t3tx3cw3AbJ+5rOoZUJDcR49sr0teGvRy+mfHh7Qj0OiUBEK2IWc22f6DtZu8Hh83uzJGAgunbsk04PUJhluiPASIxsnjGCjMf3PWCGlo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FsptozIr; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-67c3cb1433cso12508289a12.0
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 12:55:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778702137; cv=none;
        d=google.com; s=arc-20240605;
        b=OoYqoh2QZGuMUbrgF3vaMdCinE1mwX7KRMMZqyw+K2aQvZp1hBZY6FEBirVLITMFx4
         Kq8zV7h2JK5avrTfODCp9VU+MVvEdRk9OM5oUuihXKSdiFQnqtbRNDK5vN4VgKafpRiI
         VlJirvnSRHAoUGLE+hUww6P84IIypUcJRWJ9RRbANO841fhe9xr2/1mupmYExE3GMCgL
         5NB1i6nYKVBzLxZd7OUcANt8Jg39HMAVGWhdyCQBti6pf4lEAFYv/VFjali44bSSNXyj
         2ikwj+JAOrtLCpq3rkvv6iNsiqe4RebRGuUnpOnznKklC++NP8cVGbZ4j69uR6/XJisl
         p9kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=822c3uVxAqn4jqapQ1Rlah50pmYeZWCyU1NZmpi0pUY=;
        fh=oSFDgiMYZhsuumhS9N4xdmeFLornunCQspKWhsAYOLI=;
        b=Phw6GrHo+MAkJ+yExw8FO53QjhKSh1QPQRSPm9G4pHgqJaOj+HhKtuZREai9l1oWxE
         cxWIFcvifvuELgIzoMYxi95Z6ZKXKfGLOmulLdVT761vWMSoPFULTK0yRaZ6TCwE5Gg8
         ilbtjq4sXDvrh83nMXyRN/ISEZQEuxmaT1ICwFrf5Y/ze1Gf9/mkWv2MVtkxltA6yFsi
         lh6k0AcrMow/e4XDvL0ZPKKGaLUXER1hm/0xV6CQlTG5vQt8V8rERnnO0PZ98rMfpPfE
         SU9d6Q2oU9LmgOIBckuhbo8jz4m5/xKPqbTLJZeZpkwyYz/1XFFWNXB8d0jHT2QfC+8B
         WQvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778702137; x=1779306937; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=822c3uVxAqn4jqapQ1Rlah50pmYeZWCyU1NZmpi0pUY=;
        b=FsptozIr7LhNTp3cQNK+Y+OxxkIW5I1g5wpDoBMCEfDDG2JAcprcPwlJ4sP3niYB3F
         4zW1u6al0HFEwEtvVJbSd1Kx4jTcc/mzHuSrGV0LBcqnJIok5Eb0TM7UmCnvnFE66P12
         Yxw0i8M4pnOOyW7hspJDDPXkTCDgRAqFSpwtapvC3sW8uzqhK6R8S2FQSLx3r2M/rhhy
         J4jQMl6u49ulD10NG3SGfRJ9RFpOWyqBAvvXKen+SfJCv3gGTK6CQGSnKCcN/hbrKf/g
         RGIt0jeown6TS/Spj1PNEu9LNttJ3oNG8faTak8KWmNQ9xGDbMZzgGMmetBdoPR2xlC+
         p0vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778702137; x=1779306937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=822c3uVxAqn4jqapQ1Rlah50pmYeZWCyU1NZmpi0pUY=;
        b=R+k7raZlQXBw/Pwwf2WRqouw+JrXun9Y1n9nsdWOEPdZAqxBy6D+OH7Gip0632K2xB
         2xM/WT25y3u31+dM7KxoITdoQjZQojr3Zs4Av0i/SAX85ckZE+qlTH8flYlYLNAaUNTr
         pNK1VD/OmPj/MsJaeNHTRteeSNX6t3tUq2P88Bi9WXTZ/4JbBf7xXKfKVfvh4+HP7TMN
         iO7eNAYc9hsp0FpZL9K80ACR07YPScg1IzZ8jVgzocqtXVrK3QGODvq9/90mJrZ5ez1s
         9i3D3Sg2m8vJDhsbvDQDsyM/zz/6l1v9KE6VWETl80IsMM2htwlMASZV4YWc47Lag7rF
         fC/w==
X-Forwarded-Encrypted: i=1; AFNElJ+RDu7C9GoRzgOj4qcw8S5nhCrsjjA/VKDsGlA7SmD3AN0mtQ3O6r1M2tr7mggts42CD4HJAgGQK65nbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9I4Ar4PWgZcalfvdQNFqLo6d08BFzuq6AUw+KIYg5UVw3AQGp
	zh+7ShcIxDmoB3BNvcUyI51blBP3gj5Gl1EVIxfnMogllFq+ljXHGEa0FJUdErn1LUmLucQl0nE
	D0MM8rhXN0LtGzW2sxKhEmsR5zC2jzVQ=
X-Gm-Gg: Acq92OG0UWpoRfmxqboeBbrvczeKsGv9QPf2brMpp2R8/gmrD5l+KDVcTV27mxkXoSm
	BnZGupzwGLzCuhFWqXf6KcXZvnyhDovwtmcCKvtA8fmFsYmPlLFL/Mu/SesrtRNgG7/m4YmMWYo
	VwV4LmPTGUCGFT1XdNFafTv1jcOKhp633cP78Rz5sLyvcRA3T273S+lS0n+8MBfdVrRoAwS81vm
	lvIEiFJA+9By/nWsCksYWz31GxtPQTHxCuGdR7e07OTmV+r6bQjyZhG7r6wJLxNLRjR33Xl1roC
	gVvJIGWqzGR164f0f/X19DMsp7gDc47m3drLp6xpvbct77P25KOEFXJgdUeGBV/c6GkuXsIW1WR
	/xGibG80S2INd1TXpXw==
X-Received: by 2002:a17:906:7945:b0:ba6:8f34:b419 with SMTP id
 a640c23a62f3a-bd3dfc6cea8mr288622466b.13.1778702137270; Wed, 13 May 2026
 12:55:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513170413.58469-1-igorpetindev@gmail.com>
In-Reply-To: <20260513170413.58469-1-igorpetindev@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 13 May 2026 22:55:01 +0300
X-Gm-Features: AVHnY4KTHQag2G4g38UzEExnxRw-lvkXriTG6I3lrf3pzMt1lNqsyn2RTcgnr2Y
Message-ID: <CAHp75VfDXdRTk41tgdEjmaPYUGCKh8L5CtWo=KKUKQhcg3pAVg@mail.gmail.com>
Subject: Re: [PATCH v2] staging: media: atomisp: fix trailing statements in input_system.c
To: IgorpetinDev <igorpetindev@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	sakari.ailus@linux.intel.com, andy@kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: C8E4453A3DB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61526-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 8:04=E2=80=AFPM IgorpetinDev <igorpetindev@gmail.co=
m> wrote:

Missed commit message is a big red flag.
So, no, thanks. We may not accept this.

> Signed-off-by: IgorpetinDev <igorpetindev@gmail.com>

Also you need to use a real name and not an alias.

>  .../hive_isp_css_common/host/input_system.c    | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)

In the entire almost 100kLoC driver this is the only file with such a probl=
em?

--=20
With Best Regards,
Andy Shevchenko

