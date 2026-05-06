Return-Path: <linux-media+bounces-60620-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJy1F9NK+2mYYwMAu9opvQ
	(envelope-from <linux-media+bounces-60620-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 16:06:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C71AD4DBABC
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 16:06:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3898E308C99F
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 14:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A2F447ECF9;
	Wed,  6 May 2026 14:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YMnrQrOn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3294657CE
	for <linux-media@vger.kernel.org>; Wed,  6 May 2026 14:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778076188; cv=pass; b=DJGwlSdM90oCh08h0HS2EeeOGE30qwvjXqYa25kstUhpBgpE2jDcrPtBYCWHA62kzJ2rfOa0bQL1GGV5oFAIPx+eNZTxt05PqAoHByO3skrm/fe4DP0jcNNC9qIBMuvJ6puVPRXgST4Wysu9Al20NDP1OtiPn5LYygNL42J9PG4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778076188; c=relaxed/simple;
	bh=+RS49Kd2DbvtubK5kt5W1aYVEDo05KG7Xep0OnmpGgg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dBJK7MIg+FRuO4Ng2EBFkbLAjjYcv5YYEjWJ5H1cxjr1HvZwEEh1jrXnkZGs0efEAjTk7HpvZKWaUBlSDT8zysGlvwMANcz5e0OLJ41FpHQpSmotudte9OgYxGxZryZePiCEnE/kDt+nor+GHjOdNvvdXCfFsZoxGHTBbQdmrJw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YMnrQrOn; arc=pass smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-62f418d01d2so1163013137.0
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 07:03:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778076186; cv=none;
        d=google.com; s=arc-20240605;
        b=fShN+aRsLDbgl8APnQqY70/+C0PLCR7l5x05gkYjyn4RggnyhG9XloiOQPsACKAh/E
         tAjP6CmvIK/jUkCW6NRGAwBErbDRjcseeBQHTHbwheKpNEwlTJYiY5ReL2Sex0shHRQN
         rtEYSapLWBhXsnxIDdEb3AveMFwjhhT8jRO+ng1Ec6lsA4d8ujHoRR17vbGRaGBSe0bu
         3QD8OW1+eopyqd1h2Er6wgxhMrqVtvkF1YNJ1SFINopjYZSR1jjy9HMOPGrjmnl6jPpI
         jXrayWgHtdliuZZ/iiRSJLB00/b/iwGMtlLQk8VNbfha76KrhjTtIG8ucsrFb05TA84y
         avwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jsD9mMCCpukEdwiIZPox/sOpEjhE31kEGDjuvOB20/g=;
        fh=g9fyXEVNfKv6+oe9XYTGlQwYWCjO1I6CLP2c6WEXDWA=;
        b=CxrfeWn1HlSBl6B3LGahECxYc7fCweN40uCy0ikbq7Po7zqqptul28x8+vDY08p5K/
         wLKnpe0pgGUI3hioRGL9uTSznJWCEDWraBQFGphDI0lBEi67WopOVwx3Gi2C88exjao1
         f/mjbb2tHHoAB6q8hqFDAXpOk6JJvvD/zbhZtLEjX+ZxZ+WPxi90Z23FtBS6cv9TuGYT
         C/pRj3WqdrXC6oljgAByWa9bQdrylPO7GsQ0gnnKkqP/Cilut2oqHU78yRVPxnWj6o6/
         kmV+oXdDlkcO4Gsw8aDARyexIxlOmXxtlwPXK7+DKryjRMAAPcQT/I6HyzEFvUjEPbOs
         EcKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778076185; x=1778680985; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jsD9mMCCpukEdwiIZPox/sOpEjhE31kEGDjuvOB20/g=;
        b=YMnrQrOnWp6cwCrdi06KkF227P9uX/0LTDEysOUQRfWgVKJajhzSgMYc9825AyKASo
         Dhd05plfS3wLoQiDw0F+TJAT83iEB8iQ3MFGquKr43iZvYb+UZoKHai1KsKLrKYgtVgH
         4bKjUFV8HqRCc5HW2POT3zzOUm8o4UHlomvlMxrSTCBFKzsAqfkaaD4e5HigJBJ23FDX
         2BoI857qcQVnoI0HeAhEFVPtYdD8E04f9aoGCVnncAEqQLh/DREs+q0z8uYI8yHALG5Y
         qoJGdf5quEzmZR9flQFOBbUKM4z8re5cs2cVkgRlf2/24shaHlnIfXyir/QvkPu+XH9p
         3CmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778076186; x=1778680986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jsD9mMCCpukEdwiIZPox/sOpEjhE31kEGDjuvOB20/g=;
        b=rBCJ1VKo0kQjzUC53yKfg4lrZ+NwsyFb8y9GH/Eo6T55gqC27ypLdLMvwBDlOWJsLW
         B+wdJgQmg/sLyFexAY58tjRN+Pfv9J775Ct6Sq5mMD7u+1afK0nF/twTAtKDbPM39Hmq
         iuiQ0O5H+OV9pWKpwObY9U4AB3Kwuz8BQDZ45XhjNhs9zcnWgQh5+3cN1L3I9LanUcxw
         6EBwW6kuhptihsiKFTLJMoEBcQ/1GW8KH5V6Txss8+7tLGSymDxULIV306O4wV/nJqj2
         XgmWeO3lLq5tuIYPRM29iQATOpQLXPQTgkzf8QsVb4vZwuq3dBxtPlzFZYnXSjRjdvhX
         Tv3A==
X-Forwarded-Encrypted: i=1; AFNElJ/CXh709yEhJaUH0hQMvkA1gfujLJu54i47IRTXpriKb0oBz0PS9xmOm5/CMUcqKhtVyTL7ujS/eTSC2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOFghNHSWstN3sDQobYTv69OxmB9te/ISZQd5Jhr+iI1GEaA/9
	mkqGMv9UKKfgAzdzAtMb36J4GfMRUFLb26mf0oIwwRtvyvsttlLWb1talSttwJn4CTekk2csgMN
	HGOVkcaBITRSHlxmS93xmO/bJ1no0lAySHfhYfDI=
X-Gm-Gg: AeBDiev1bZxhSJKInvJg9aQ+pihFaAM8KtPhfQE5dE3HKUQRUzyxJZmgKKw88x20GAv
	bc53bhln8Za5hLNeOMeZoBGslyA0WpIFdWLHkS4hMha0Wa4rIseRukBY3BtncSgO2C0j6OFT57R
	2gKvpQA7unK1fUOfwrFNczI8LvnLjkSx6iGSQMcmvrRdNGSMFXCmYS/Xg7OzWUUSzrERerLzdom
	fupBmKdkP2jVZQZkBq55iOtDd1O/eJfAObPnxqndMaXOz8XSn4oBZgJzoo1NX9dKCaTggmHrHy9
	4g2gGYuu1sI7an6Cnh09J+aSk9a5a/VFkNLlhu4Zf+oRcTMByQ==
X-Received: by 2002:a05:6102:4a8c:b0:605:889a:89a1 with SMTP id
 ada2fe7eead31-630f9041b24mr1272953137.23.1778076137325; Wed, 06 May 2026
 07:02:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260501095433.1609309-1-mitltlatltl@gmail.com>
 <20260501095433.1609309-4-mitltlatltl@gmail.com> <OmTXoHZJTSGePymL9I-1Cw@puri.sm>
In-Reply-To: <OmTXoHZJTSGePymL9I-1Cw@puri.sm>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Wed, 6 May 2026 22:01:22 +0800
X-Gm-Features: AVHnY4Jp93agdi_Y8mXGWuXYD7rYu7UJTV_Ohq4VXA590K98lCrI7__F8JibURM
Message-ID: <CAH2e8h6YM1D6K-SKg8UUL_-jJ0uuEvU1iK-xZtguNTurfO-U4Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] media: hi846: Add 6MP and 8MP modes support
To: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Martin Kepplinger-Novakovic <martink@posteo.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@kernel.org>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: C71AD4DBABC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60620-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,nxp.com,pengutronix.de,gmail.com,linux.intel.com,posteo.de,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]

On Wed, May 6, 2026 at 8:51=E2=80=AFPM Sebastian Krzyszkowiak
<sebastian.krzyszkowiak@puri.sm> wrote:
>
> On pi=C4=85tek, 1 maja 2026 11:54:32 czas =C5=9Brodkowoeuropejski letni P=
engyu Luo
> wrote:
> > Hi846 is an 8MP sensor, but the upstream driver has only supported 2MP
> > mode for years. This patch adds 6MP and 8MP modes to maximize sensor
> > utilization.
> >
> > Note that these modes require 4-lane MIPI CSI-2, as the downstream
> > driver only exposes 2MP, 6MP, and 8MP configurations in 4-lane
> > operation on the target device. The register sequences are extracted
> > from the downstream Windows driver.
>
> Has this been tested in this form at all? I tried, failed and looking at =
the
> driver I don't see how could it ever end up using these modes in its curr=
ent
> state. It can only cause troubles when used with 2 lanes, while 4 lanes a=
re
> completely broken.
>

I may have messed up. I tested it with two more patches. The first
patch removes 480P and 720P, the second uses a new 4-lane init list.(I
just sincerely followed the downstream) Since I didn't think much, I
thought removing modes would not break things, I just tested without
the second patch, so it works for me.

> The driver defaults to its first supported mode, which happens to be a 64=
0x480
> mode that only defines its register list for 2 lanes. hi846_set_format wa=
s
> supposedly meant to check whether the mode returned by v4l2_find_nearest_=
size
> is compatible with the used lane count, but it does so too early - it act=
ually
> checks it against the already set mode rather than the one it's about to =
set.
> This means that you're never going to be able to set any valid mode when =
using
> 4 lanes without fixing this first.
>
> And even if this was fixed, with 2 lanes this makes some calls from users=
pace
> that previously succeeded now fail when v4l2_find_nearest_size happens to=
 match
> a mode that's only supported with 4 lanes. v4l2_find_nearest_size would h=
ave to
> be fed with already filtered list of modes to fix that (which would actua=
lly
> make the check mentioned above unnecessary).
>
> Of course these are preexisting issues in the driver, but they make it
> impossible to actually use what's being added in this patch and to add th=
ese
> modes without causing regressions. So far these didn't matter as this dri=
ver
> was only ever used with 2 lanes, but they have to be fixed first before a=
dding
> any actual 4 lane usage or modes that require 4 lanes.
>

Thanks for your feedback. I think we can use specific modes for
different lane modes. The snippet like

    hi846->supported_modes =3D supported_modes;
    hi846->num_modes =3D ARRAY_SIZE(supported_modes) - 2;
    if (hi846->nr_lanes =3D=3D 4) {
        hi846->supported_modes =3D supported_modes + 1;
        hi846->num_modes =3D ARRAY_SIZE(supported_modes) - 1;
    }

Best wishes,
Pengyu

> S.
>
>

