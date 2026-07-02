Return-Path: <linux-media+bounces-66335-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IMIrFqRGRmpqNgsAu9opvQ
	(envelope-from <linux-media+bounces-66335-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 13:08:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB296F6718
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 13:08:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ntzRv9tn;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66335-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66335-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 75E9D3123D42
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 10:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB16D394492;
	Thu,  2 Jul 2026 10:35:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D4F3769E2
	for <linux-media@vger.kernel.org>; Thu,  2 Jul 2026 10:35:52 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782988554; cv=pass; b=r74NjVp07bTRgUViFQAaZSAXxuxbi+3N0aa4FTMWNK/hol/lWl1IHeNuBllT0CmanziHRVqDt7H58F2PiBeGRpa3FDVo85PiD3S0RNKQtPdUt8u99zJXWb5WZkiwIWiHaVl8InPfwqvebICLgk0tsPsYqZsP30vhsJl4Un87oEA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782988554; c=relaxed/simple;
	bh=h9OaHUTdD9koqxIvwma5pxTK4b6XSkZ5ywBxDgrsw74=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rvciw6krxgve/vbeCahKuh5JUy7vJfm01NRCX0492WytGRfpuG7fp3hjmqd7bT8GTRJH5/sSXmjikTnNHHEzGFyBDfoSt7SoiEp16Af98DcqDPUrbkhoweqCBt4tIypq5QbunDvdvay11Jn1zCRGmbGY7VRWrac4jDe2O0rSPUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ntzRv9tn; arc=pass smtp.client-ip=209.85.160.42
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-44aeefa1c00so291986fac.0
        for <linux-media@vger.kernel.org>; Thu, 02 Jul 2026 03:35:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782988551; cv=none;
        d=google.com; s=arc-20260327;
        b=HbQqRWx53D4T0TjMlR+NmF+w0UnlhKui7kJnHUuGpf22dJjiwON+fGa7BGuKIwXalP
         LfWuVTaJgdTkmfjeXYfpYxJca5p++0yqHqzp2byJ7Y2JXXny0k8ie3bz0F3xZc8DsLVg
         NfHsbu+ohNsvLEln6CrQsaA56+fl3xXyaWQ5xF3CuYjhSc8dPo2QQDUOhLlwTlFnko9D
         og2ne6tbnFVryL3D+maSfB40E794pUtlwIkj98QPGpNOfQUjhF9CTypj8ts+PRXjq3SK
         0RQjNTi+flK9/kfc/ZXyg1JjbJf3eaF6WRkoGIEgQ9mdGZIyj2Wa//fdjjNkOK3VzX7P
         5RgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iJ4O/KAujGUbE3VM1VwkcXyqzZUAlDqHOGBSsCLrn70=;
        fh=N14gniKF2cUZeKveQPxkUsp8EwqG1SVE1NTCr7QOpyQ=;
        b=eWbNJ+WxXs6ZFhDobMrhYNoLmXaGEc5C6zvnTj1BHji2U8F+VoXtSzeQ2oPmK2tCyC
         OmkqboyBneDBFOMNaQ0RWxWYdLKq48jv5N/qXQBXaYQ0NUDl9A2oCgB+xYWrAM9kz6i0
         cNKUnOF5smgMPDn/HAa3aJwmCs6HNZ/VPylZ7dQ3ls+1oudETx1ItQADSJlEoPZi0GmK
         eM0C0RlTdwoDqp83reb3rL+mXUBtX/NpwmEZ2/Jzfh9mpVo7T9Zfhsec+6MZgXMgU42Q
         9E3CLY5ZqzO9cZeXyMxn1D9BQvdxzahKcaZUyPP9X25ZpCBpZ2nD9NowBF2hiPy+MVnJ
         Mp9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782988551; x=1783593351; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iJ4O/KAujGUbE3VM1VwkcXyqzZUAlDqHOGBSsCLrn70=;
        b=ntzRv9tnllba/u9Qllv8lg6GwMROd8Y+hvSeaJqv2gjtFC11Fek+xMqcyxA49f/LPn
         /E1o6PmDljTaWxKBGkUjTsy1R/HBr9N4MWNao1UcBkON9HX96UkI09Geiz6wpzrCnJOl
         Ru28DwsqMvEOhnRkYFFEbFvK80VCwPgsyXUJ4ADWITB5QghqnKpQ6um96ksqwXj88TJg
         9PL5EPWtw4Kx/DD1SdRdBmDjgrJj5zal73dVjr8H/iwpSXd6jsLi0YpDbFoHw7vYbQ9l
         1PR/07QkwyxlTAHA1vxtsaj2fG3woS807vZZNGkYRlmgupa5kYGyyQZueejz79WkOm9g
         k+KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782988551; x=1783593351;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iJ4O/KAujGUbE3VM1VwkcXyqzZUAlDqHOGBSsCLrn70=;
        b=YKUsOEEe77yFjvJOvZ0RwH4QCfnwguC4KL7WPcTADCVNoTdBP2eMXBBh0169n2nfuy
         zNkNgUeIHSldTC9XC9NIqdYVVVn340V6az/67KLX7Ddfg+KtyAfWyrL2d6Ebp/lZ//7e
         28WbzLBS3M2GnM1Xfr+eN4LvWy7FhirQCiEqDJtBS8dh8r8rYoEFvYemj5i3JC+SAFO+
         T1ZL/BxFMx22c1W69LE3nwD7mGbyJlvny8bg8gTzXE2oQLBJgW1XtuvXi6S+sMovXZkk
         5WxLnM/xEcBfbNAqZw0lvb5hZJ/3Pln64MG8fYE9lme3OTYy83QOyzjbx0oO1UqMCRWT
         Gw6g==
X-Forwarded-Encrypted: i=1; AHgh+Rrnw1axkLNU5CCI9WgNnVFTcT654tfWn4M5rq+ogxB+XIFkdvgJjCeeDEFvDn3ON/bLYNKFTUxcPIQvSw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgD3yagF3fhwpbJgAWSDnpsDG7QQNQySQc/UYfFhMU2z709pT9
	xEOXoAH64XzszxhZ6c2ZHa97DQbwA9mrCPGIXlA1hEYBcoFs3gQGmqHdWJIl44WLaToPSlomgIA
	fCDq4Vr15bWyhfw/5jDgkgUyB8KiHS6fbtQ==
X-Gm-Gg: AfdE7clqgntraX8gX51c9VdC0Fpqj1KnOqD0A5TQPwiyVNAoXI4LzpiChbNf7DL6Xvt
	+uGGC2VTE2LwGuvFYd2QnTO1VUHzDBUtwDOw9SmumEklySO3GMklg4n4R5c3v9OAvMAEyONoU+Q
	GLYARu3NKKaP6roMmZkXt50RSx07TNBM1kkPAt6Sq+LasYNs47wuFTAGUn8o0Jvs20ZHm4knMuf
	VIuCULzThHGQKSa/8YW8ujzsIEKF/gY1fbiofPJwe1FSPN2cVWZpQgAHogbBM1HrXROMdXgcSZj
	+zuGbi3KQ1kv2yXlrA82GhYFLdQ=
X-Received: by 2002:a05:6870:788a:b0:448:558c:d8c1 with SMTP id
 586e51a60fabf-44ca825d1e0mr3184173fac.19.1782988551093; Thu, 02 Jul 2026
 03:35:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602185305.30759-1-devnexen@gmail.com> <20260602190943.1B01E1F00893@smtp.kernel.org>
 <akTwVMepaJ8HgEgj@zed>
In-Reply-To: <akTwVMepaJ8HgEgj@zed>
From: David CARLIER <devnexen@gmail.com>
Date: Thu, 2 Jul 2026 11:35:40 +0100
X-Gm-Features: AVVi8CezoyQZIEN5ywk3MUSSe68tny2S0Q0MLfX8BMBD2LoZDYro7_iPYhGzAQE
Message-ID: <CA+XhMqzQ_z8HnA-5Dqd36Q7snJZnnHU3h78jS6Hqom1h56Wkpw@mail.gmail.com>
Subject: Re: [PATCH] media: mali-c55: fix dropped last AEC histogram zone weight
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: sashiko-reviews@lists.linux.dev, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66335-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[devnexen@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jacopo.mondi@ideasonboard.com,m:sashiko-reviews@lists.linux.dev,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnexen@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,ideasonboard.com:email,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BBB296F6718

Hi this is a valid point, sent a patch. Cheers !

On Wed, 1 Jul 2026 at 12:03, Jacopo Mondi <jacopo.mondi@ideasonboard.com> wrote:
>
> Hi David
>
> On Tue, Jun 02, 2026 at 07:09:42PM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> >
> > New issues:
> > - [Medium] Endianness bug places the last AEC histogram zone weight in the wrong hardware register byte on big-endian architectures.
> >
> > Pre-existing issues:
> > - [High] Casting the unaligned `zone_weights` byte array to `u32 *` causes undefined behavior and alignment faults.
> > --
> >
> > commit 731a31e43f59014f133f6c66b9d8861ce15cfc76
> > Author: David Carlier <devnexen@gmail.com>
> >
> > media: mali-c55: fix dropped last AEC histogram zone weight
> >
> > The 15x15 AEC histogram metering grid has 225 per-zone weights, packed
> > by userspace as a u8 array. The driver writes the first 56 registers
> > (zones 0 through 223) in a loop, then handles the final register on its
> > own to keep static analysers from flagging the array access.
> >
> > > diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> > > index de0e9d898db7b..33e2232ec8f5b 100644
> > > --- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> > > +++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> > > @@ -212,6 +212,7 @@ mali_c55_params_aexp_hist_weights(struct mali_c55 *mali_c55,
> >
> > [ ... ]
> >
> > >     for (unsigned int i = 0; i < 56; i++) {
> > >             val = ((u32 *)params->zone_weights)[i]
> > >                         & MALI_C55_AEXP_HIST_ZONE_WEIGHT_MASK;
> >
> > [Severity: High]
> > This isn't a bug introduced by this patch, but could this cast in
> > mali_c55_params_aexp_hist_weights() in
> > drivers/media/platform/arm/mali-c55/mali-c55-params.c trigger an alignment
> > fault on strict architectures?
> >
> > The zone_weights array is located at offset 10 within struct
> > mali_c55_params_aexp_weights. Because the configuration block resides at a
> > 4-byte aligned offset within the V4L2 buffer, the zone_weights array starts
> > at an address that is only 2-byte aligned.
> >
> > Casting this unaligned pointer to a 32-bit pointer and dereferencing it
> > inside the loop triggers undefined behavior in C. On strict architectures
> > like ARM with SCTLR.A enabled, or when auto-vectorized by the compiler,
> > this can trigger kernel alignment faults.
>
> This comment from the bot, even if not severe as it think it is,
> actually identifies a possible issue.
>
> As far as I can read unaligned access to device memory doesn't cause a
> fault on ARMv8 but it is not guaranteed to be atomic and will be
> realized by multiple loads (I'm sure it's more complicated than this ...)
>
> Would you be interested in addressing the above comment and send a
> patch to access params->zone_weights as a u8 * ?

