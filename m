Return-Path: <linux-media+bounces-55760-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CMWzGkpOtGk4kAAAu9opvQ
	(envelope-from <linux-media+bounces-55760-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 18:50:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CDD288513
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 18:50:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 28E2630CF3EC
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 17:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15EAA3CF687;
	Fri, 13 Mar 2026 17:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e5G9vN65"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571B63CF033
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 17:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773423998; cv=pass; b=B2jRS1r1bQ2d8Etu0npKdB9xUbxTPYq+xz2PuSYG92erBJh55osngaquwcON9GVMiBjTXEKuboc1yVyxHSIKZht2J5EizIq8FrWf9OJ9Lf2dMhThrwxNLWqzsx1XKwlcHOmCif6VACb5U6jWWOs2sa5vLZSXMLPoP0JKoiAOswo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773423998; c=relaxed/simple;
	bh=V3p18Tbg+iWV4KCl9QD+1XD6qLYbhT426dxDQt2dDsk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=atjKEuATZmFPvC3f+oAyg3cizqdSKSyvcZOtX6k9NVd4BvOh6BronxI/QZirjGho563tRKI9lt/SSsTktuf6g5DNofGFJIgPRx1EsyqHhe36uXoF7BLbUm6o+SbayVExHQE8NK/ktnxmXyIiawoBwwuFe1NFK0Pt9dUB1gJWdYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e5G9vN65; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a0faa0d15cso2436680e87.0
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 10:46:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773423995; cv=none;
        d=google.com; s=arc-20240605;
        b=em74TGunwjrCkGq5nw6mwqPdOXpwliSDUNPFq7GEXUfyXNaEOH/8xTfCnUU7STOsoR
         PwpH9E1XBHlkgM1loXxeGmdZPurZmIY7w4rjZMy2bhkG/R5lLwP+Jx3GYV9RpPuOGJSE
         MWJ506L++w1q4LnJlC8KyrzhzpFJvz0wizFUs0NoljjoeT3z39w+YpFsvt/voPfBBD55
         5ZI0U504Ty18NoTEtxJbMzMvuZ4X9Hvcf4gDwudPBs33Ut0+tmMHRVqZHrA+QgUn2jup
         uzdDiTZ9jLe73EuMWq5nW8r0D9WYk+h8QXJU6s1bVBjZp5TajlGOAelvNuzkxRzzf+wg
         KScQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qk3y98nzuZxVVLpPMUesaWb4Xy2Sx+NDxYlh0C/O0iM=;
        fh=+3cT7tOUCGadjfNmx63VoBAVIVEYp3FbFURm8TerDe0=;
        b=c68Plu7hBMGG3eO0anoHlbxCJ9mm75fUa9PZw/XXtVWxxt3BQoqQ2TapFIM/7xasAl
         fbGHbwjNi1J3WW2aFbsYfiAzvod5adXWymKpaM4jVTJxT+LYcbHP6eP5AQrOTN7ZRH3g
         6GHTLmiFuZ67s7xIR+r5r82xIVUhIt2oMknBgC4VMJv9GrfQhBJfVNuLYqwyACbad6Dz
         Lg6c2Kp/iWcZLfrd8pyQObJqXWB48omwUNK7feiGgytkGO219/AiTgg0oYTC44CdjnD5
         y30v7aMvm+jVgOnLle0ZZvlU4wx9XIO/NrLmwCTIQApVPr9aSVAx+YrkE4RFAiTLF+7o
         reTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773423995; x=1774028795; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qk3y98nzuZxVVLpPMUesaWb4Xy2Sx+NDxYlh0C/O0iM=;
        b=e5G9vN65WYVk1ZxFa2EJXTPvGKzYRo2kdd1AveBvgEO+Siyb+avqLGqLs/Sb61GoC6
         4MCi+Tbdpsr8OIayEEAorwGSPgi4Al8VJ3PkD9Hq/KlIJqb1EvKXkvZWqrLPbUrRIQOu
         6dPraoI2X9Z1sG2/RBP3TtW8vdSMkCK+f0IYidf6Frw6vtRYPmV6Fx3rqQwdhPyZjh+Y
         NarRNAbdx4jjk0XUoOqxoS7QrdMxNwvsIxBscWJXM8rcdaR3xks7nWrDv2kHbumZ8VVB
         c0i1AuGoPnCoDKNAaFDM1VIxkvsAQcU1IzzSOcrn24kq5LzfMLJnGHBZELgY01TX4/qv
         /9ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773423995; x=1774028795;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qk3y98nzuZxVVLpPMUesaWb4Xy2Sx+NDxYlh0C/O0iM=;
        b=Z0tnyaU2SNRrr8G3ALailNwVOUS8Jn7BgmplagbHgbPlQ1RwsKN0U0VsjxV+kmAzDk
         3mArvTp3w80kavWEDv6wPiCRuf0CJCw0/dB+2eTXTvQhaeKJi2GCwWF/1iDCUMzcx75x
         nf73EMgxw8PU+FvSF6bo4MaC3BwsTAuST91sEdeRDm0DV3E1u648FdjxUtjGTFjb54+d
         2xewLHwFzxnTxyqr5mBkRcrhUczsDc8aZXpbuCp1pug9ZydxBCWYAqS7AXKCmV4f7syL
         AYS2tdFaqWHyfB7YFihiL54SbmMhJlZCqgX8FE6vnPggjH46JYoQSHXFfbw9zPDwiu/Q
         5Yig==
X-Forwarded-Encrypted: i=1; AJvYcCW/mUgoSKOLEyHXN+LIH3/T4h22pw4gBNZ3zfxgXSoSuI9dHv0ZldeypqiugbNj2nv+UeymrNFULv1vjg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTtShR07d8qFk+kIoDjjOl9f7k21yZkfbLZOCrqNICqYn1z6Ag
	tFftfMO+vXTEtzfGvzJOGUY+NjF3zptUnzB4lSIrMMjCj7HCM+WFeXQbdVW48mu1IY19CeCgevH
	BYgUn4YvLINYk3GKaL5070jtGY5ggEvw=
X-Gm-Gg: ATEYQzwVcCaPKuW6bZIMV7ZKFLT5O3rVd3oxb1y8oInUfUWupqSucBvXrWaWl9QK5Ji
	gKrRYQrROmp8++qpgB0dLR7pkaJrf0SMdFyuds+GGE3kSFqdG/cWIdKajLkcCLHn7oxSB7E3nNX
	4KqFbVcPeYYzRMIuca7yo8AK0Lx3qNToe5t6+/XlrC+bALNdlsY9EWBNPARux8EH49bYfVkkGYv
	G94P5gnjP2qHmJBtlPXA2mOWhYr8ySnjgmOn9acaiHBaFx2fz/CJLB3SisAMY1lgqih8pohgkXc
	wE/4kp3xd2dKAQqLDIxP/aYChHWkT++x6oXPrjJpj2Pwalm98mtm
X-Received: by 2002:a05:6512:606:10b0:5a1:378c:11ea with SMTP id
 2adb3069b0e04-5a162702d43mr1159519e87.13.1773423995156; Fri, 13 Mar 2026
 10:46:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313152936.14560-1-starpt.official@gmail.com> <abQ1nYvEpKV-rkL8@ashevche-desk.local>
In-Reply-To: <abQ1nYvEpKV-rkL8@ashevche-desk.local>
From: YuChen Lin <starpt.official@gmail.com>
Date: Sat, 14 Mar 2026 01:46:23 +0800
X-Gm-Features: AaiRm52QUDZVJS0RZgP81bsHau695M_UyBk6fNvQaetPANGLTSp4cIKIGMDbR68
Message-ID: <CAEzaNUQN_KB3n1MsZiU4qdse20VKY84ELWH0e0ZwsxZE_D7=oA@mail.gmail.com>
Subject: Re: [PATCH 2/2] staging: media: atomisp: use kmalloc_array() for sh_css_blob_info
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org, 
	gregkh@linuxfoundation.org, sakari.ailus@linux.intel.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-55760-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[starptofficial@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D7CDD288513
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 14, 2026 at 12:04=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Fri, Mar 13, 2026 at 11:29:36PM +0800, Lin YuChen wrote:
> > Replace the open-coded multiplication in kmalloc() with kmalloc_array()
> > to provide overflow protection and improve code readability.
>
> > ---
> > v2:
> >  - Remove unnecessary parentheses in kmalloc_array() call as suggested
> >    by Andy Shevchenko.
>
> This marked as v1 and 2/2, where is the patch 1, and what is v2 here?
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Hi Andy,

Sorry for the confusion. I made a mistake in the versioning and numbering
while using git format-patch. This was intended to be v2 of the single patc=
h,
but I incorrectly sent it as v1 2/2.

I will send a clean v3 shortly with the correct headers and changelog
to clear this up.

Thanks, Lin YuChen

