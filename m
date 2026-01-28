Return-Path: <linux-media+bounces-51727-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Le2MN/teWkF1AEAu9opvQ
	(envelope-from <linux-media+bounces-51727-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 12:07:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A47D9FF11
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 12:07:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B5E3D300E5D1
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 11:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7CFD33DEF0;
	Wed, 28 Jan 2026 11:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tn9UA/5Y"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB9F3346AF
	for <linux-media@vger.kernel.org>; Wed, 28 Jan 2026 11:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769598404; cv=pass; b=Ws62bnV0Z7VjmFphK62kwBmYpmDaWHC6NrYa+TykO34RpDiZ2PwpXHONgHZbSU4esjmOqODGuY9wpdvxGwFW7bX+0tNpfhtSB9wN0qw68DEmwn+bjsQhJOdYwRV6MNO/1X39albeAfvvLkvS+YacgAgtCUO8d/3TxL27yJAVs+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769598404; c=relaxed/simple;
	bh=tlZJZJQSKkXNiO3oRmcJll4fZrpIYlUyn8nDv7x6yCc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ENepwK6j6ocL9Xz+maS3cVzlpHMzbFLd6U+gvgIb/LLDdtCcmpmg5aOU9B1Jbkc9aAKWff9BGcb1u0FDheksKHP5aZeEUJxsmCYsuYqm/5Cv0reznD22elOWx8YeVDrYdp/vTG6kW2AlfORP/uaVMv1/kusBOSNoUItAFLnCWgE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tn9UA/5Y; arc=pass smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c626bd75628so2362962a12.3
        for <linux-media@vger.kernel.org>; Wed, 28 Jan 2026 03:06:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769598402; cv=none;
        d=google.com; s=arc-20240605;
        b=EWAmNZvmF0pzAxtcVw/4ImIU9+78huVVsq6RH83FVNj2XQjVFMquS+vwrY/elM3g3S
         WbmFiowv8YcnJjiFrU92mQAyE3dIhHm4PPSGd9U0M26Hav+sXJeRZ8APiJhDxFaW4ISO
         02ex6ewm5aOOmqukSN4sY0M7C/RXwqjnmb84tsiqjGAda5NPfbIEfVXV9hj/ZF51TrVR
         rZTOnwSKlD1SU7W2r6BU5xs94bk3urx/pS4vAUMPmmYheRZDx/0kGWYv7neHOLo7EHuC
         DB4F0o4Tx39FoUQiAuyJUIx/kRndaS+I7Z7+CkX5MUIEd9P3iFqbYk//vXEUW5vJGF3N
         mouQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6iehbJd+UIDp8Q1SlQdBUTNiTOO6DfX7pubCoSt3jyY=;
        fh=brycjQZuzqmm5ESHtO+wLdxhVEzTk9rZKRfr6Elq3cA=;
        b=jckJ8skj4GPXu/BSZuJmHYK6VfKonp1ZUiDvRfiqcfE90rR0qfIOmFLg1EUP4E4Th0
         KYP4cY2LcHvnMg3R0Ni4G5a+3+nXNOZlNG/mNpbOkvDcyocqLwSO0JiEwCRP4Fi9uFdK
         5M9/LZ1fpRfbXhMsUXlQM4eX5uUWiC05gSU6rcMA5iedFm6oZpcjT4GXCbfwUkQY4P/A
         nJxgz4319EqstfO8a7U2dCpiJHkEt7GhOA/Mge7+7qUy5e6y84CrRD8e1rVH+ra38nOe
         UhooBxSRmAAOOErgSn8RXPA5QZ716Z+H/xzSMxP+VYpKyQer9lKzi0T1+EvWklGFlSWP
         Thug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769598402; x=1770203202; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6iehbJd+UIDp8Q1SlQdBUTNiTOO6DfX7pubCoSt3jyY=;
        b=Tn9UA/5YPyCSpQ0OSVlsaaUimKJ2DToGxNz7wmSnIIV3mXFT/6BZVyMQE41RnuHIqC
         GXjX8I2NqeTuS3tLoITl3PGbGdplNSGoPNMc70UeAH6zHyeoINh9cf4q5oXJzv1NRjLC
         wS6oIIJJKkTIcOasn0C7L37MOYTkCCb4NBhiEg46RYAMtONocQ3DU11Pagx7ocLnKyP5
         +X3G5zcvcabGtAQl1bhk0MCQYfQYsO1AI53kVf3L/7LrfaZ7ciodKxvb7gkRXcniKcBY
         Gd3P92C4NNPdkGWGYzrrLJ/fN/Ev46nQ2GDa3688xGKaPtjIZHGAvmQOLJqirjZOMaPK
         1Jtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769598402; x=1770203202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6iehbJd+UIDp8Q1SlQdBUTNiTOO6DfX7pubCoSt3jyY=;
        b=gEDKD2RUq0xJ65JQ52L+nKceCq2oEft7zZoHEdYoW4lVD2FyPKteyfaeaooyOBAMyk
         pOyRu/GypWY3kMLU4zVR1kBYpbeG/KFwiau3TTS6GwsGGuhNMPIt1J2dsILOBhwU7fai
         XnsFLKLtGcGZTTyhxd0Ow1+v/6QEIHkT79oodqIWUp3Gzi1uxhfW4j7HKvP/1PtDAP7l
         dI5O5oszil5x/I6DscadRfHAstw+LXof5/JkC5tCW7KuDySj3wAk/kUeRYkpT1vy4Heg
         sjAY6imLzpABUmnoc+zAFfoavysOy862sxS27rk6cqeSyOdY9/dy9Vu4mnBcYeRrHGQD
         DkqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHqZZs56+T4K9/MRDsc62u2YSrouiAVzH5gsVuU66KT3/c+KEIEjEq8VyfjOxh2TrEta9h4e50EFB1jg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyiZdr+9FkAtl4MaTLUjdgw5d9HbMEvcYBhXGBSr+cI04a24T/b
	UVICBaX7MponInmxT8QYA7T8LzLsW4keCD7pEfXRv1gHUNAhhWeKPcHqicHr78037WAT6Yuevw5
	HyIKcLF8ZRdLWW4slbdn8tXiUtiQTdjs=
X-Gm-Gg: AZuq6aJfeA5Y40cykvwwF3fVlnD0QaHTVXCuW9XETjzGGAUqhxWESzzTsbUB5msoehd
	A7U+cUiEmbGcOWlCiwFlyx+je2h2yv6zLwEatOjoF1HN9L/hG6ntPgDH1HzhcnzNl9on8hh8nTn
	Y4VSeLrysATD1GvQbMNXLR9dZswG7Xh+BxAemqMow8e1p+WrUwjv+8LATlcZsfZmX18oE4BvY4c
	sRy7cfcABFbmwn054YY7BPcormlzacS/4iNT2dBX5nj+7jzVNruavCq1m+LXP20GEz0hdVcGhIx
	mpBFQ4oi3E5TB5eqzOMGlROUiSnCYg==
X-Received: by 2002:a17:90b:1fce:b0:33b:bed8:891c with SMTP id
 98e67ed59e1d1-353fed7583dmr4882896a91.23.1769598402141; Wed, 28 Jan 2026
 03:06:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260127165024.46156-1-bjsaikiran@gmail.com> <20260127165024.46156-3-bjsaikiran@gmail.com>
 <aXjwtBey0MRP0c7f@kekkonen.localdomain> <hAXW76sxpszN3JpApVO_ntI28dSyCTiDXIE-S1AJDCa7Mbp8-pHbGqhFhTh2FGPdj3TxO9AowyRRan2u8TTO6Q==@protonmail.internalid>
 <CAAFDt1vJtJc+C_J9Gv3SYjs_2zWFXsWqwq29=ig1o2_kSkjwLg@mail.gmail.com>
 <dbf73780-a33a-4fbf-8569-321b4f4e0a88@kernel.org> <MZajBkG4hU2kIZFDZbpq0WZOF_tJmASpmGr-7IH_qheO0We0Z45KNZPrQY4UmoqsWKOX3lSx1W_hnLtfKocXPw==@protonmail.internalid>
 <CAAFDt1vmXg9L6axsDN6kpCQKZifOCRxtQeDpmRpHyejS1ORR+Q@mail.gmail.com>
 <92131a67-471e-41e8-83d6-4f802103db7b@kernel.org> <CAAFDt1sqh=O-CpxbdcWueyqbiq4qyCrJHVH-_SS+KjEC9CyRhg@mail.gmail.com>
 <6692ca5f-216f-428c-96b2-511fdd769f04@linaro.org>
In-Reply-To: <6692ca5f-216f-428c-96b2-511fdd769f04@linaro.org>
From: Saikiran B <bjsaikiran@gmail.com>
Date: Wed, 28 Jan 2026 16:36:32 +0530
X-Gm-Features: AZwV_QjGj33Oe0Ps4oMG4QaXGMTLWPDmeXkw3rvX735y6bmXITlBkYGCSsX6YCw
Message-ID: <CAAFDt1u0uV+KpPxrhtwbvWgAYQET3HLg1nu4u7JgaNPFAKNLWg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] media: i2c: ov02c10: Correct power-on sequence and timing
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: "Bryan O'Donoghue" <bod@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, rfoss@kernel.org, 
	todor.too@gmail.com, vladimir.zapolskiy@linaro.org, 
	Hans de Goede <hansg@kernel.org>, mchehab@kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51727-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,vger.kernel.org,gmail.com,linaro.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bjsaikiran@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 7A47D9FF11
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 4:11=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 28/01/2026 10:19, Saikiran B wrote:
> >  > Just to be difficult - I'm specifically asking to test never switchi=
ng
> >  > the regulator off - not having a long delay.
> >
> > To be absolutely clear:
> >
> > ***I have tested exactly this.***
> >
> > In my local v2 testing, I modified the driver to keep the regulators
> > permanently ENABLED and only toggled the software standby/reset lines.
> >
> > Result: The camera was 100% stable over hundreds of cycles.
> >
> > This isolates the issue:
> > 1. CCI Leaking? No. If CCI were leaking, the "Always On" test would
> > eventually
> >     fail or show instability. It did not.
>
> I have to say, I'm not an electrical engineer by profession but, I don't
> believe you can make this blanket statement.
>
> What is the problem with testing the hypothesis ?
>
> > 2. XSHUTDOWN Floating? No. The "Always On" test relies on XSHUTDOWN wor=
king
> >     correctly to wake the sensor. It worked perfectly.
>
> Yes I agree there, if always-on shows no failure then XSHUTDOWN isnt'
> floating.
>
> In which case this patch can be dropped, its not helping.
>
> > The instability ***only*** appears when we physically toggle the PMIC r=
ail.
> >
> >  > Do not believe we have root caused a regulator brown out
> >  > Believe we should interrogate the LDO settings
> >
> > I cannot easily dump raw SPMI registers on my personal machine, but
> > we can derive the LDO state physically from the discharge curve (RC Tim=
e
> > Constant).
>
> ?
>
> I gave you code to do just that. If you can iterate sensor and DTS
> changes - you can use that code to dump out the requested LDO states.
>
> > We know the physics of the PM8550 PMIC:
> > - Active Discharge Resistor (R_active): ~1 k=CE=A9 (Typical)
> > - Bulk Capacitance (C_bulk): ~10 =C2=B5F (Estimated for this rail)
> >
> > Scenario A: If Active Discharge IS set:
> >     Time Constant (T) =3D R * C =3D 1000 * 10e-6 =3D 0.01s (10ms)
> >     Complete discharge (5T) would happen in ~50ms.
> >
> > Scenario B: If Active Discharge is NOT set (Passive Leakage):
> >     The rail discharges through the high-impedance sensor (~200k=CE=A9+=
).
> >     Time Constant (T) =3D 200,000 * 10e-6 =3D 2.0s.
> >
> > My measurements show the rail takes ~2.0s to reach the Brownout Thresho=
ld
> > (failure point) and ~2.3s to reach a clean 0V (success point).
> >
> > This 2.3s duration is physically impossible if the Active Discharge bit
> > was set.
> > It mathematically proves the LDO is in High-Z mode (Passive Discharge).
> >
> > Here are the specific logs capturing the failure at exactly the 2.0s ma=
rk.
> That's great. We should be able to interrogate the PMIC regs and see the
> state of the LDO configuration - code I've shared with you.
>
> If they show active-state isn't set on one or more of our LDOs then we
> can write some platform quirk code to set them.
>
> A 2.3 second delay on every start/stop stream is not an acceptable
> upstream fix.
>
> And please stop top posting !
>
> ---
> bod

Regarding the register dump code you shared:

I have already attempted to use it. It fails to read the registers on this
device. This is a consumer laptop secured by the Gunyah hypervisor
and TrustZone, not an open development board. The SPMI transactions to raw
PMIC addresses are firewalled by the firmware; the Linux HLOS is physically
blocked from reading them.

You mentioned in your previous reply that you are not an electrical enginee=
r.

I am an Electronics Engineer.

The assertion that a 2.3s discharge time proves the absence of Active
Discharge is not a "blanket statement" - it is a fundamental calculation ba=
sed
on the RC time constant. A 1k=CE=A9 active discharge path cannot physically=
 sustain
voltage for 2.3 seconds against a 10=C2=B5F load; it would drain in millise=
conds.
Rejecting this derived data because it relies on physics rather than a
register bit (which the hardware prevents us from reading) is scientificall=
y
unsound.

I have a full-time job and have spent significant personal time debugging t=
his
to the millisecond.

Since we have reached an impasse where the physical
evidence is rejected in favor of impossible diagnostics, I am stopping here=
.

I will keep my patches in my local tree as now my laptop is usable to me.

I am withdrawing this patchset from upstream consideration.

Thank you.

Regards,
Saikiran

