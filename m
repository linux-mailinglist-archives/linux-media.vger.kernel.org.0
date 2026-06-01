Return-Path: <linux-media+bounces-63257-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGxjL8+GHWrAbQkAu9opvQ
	(envelope-from <linux-media+bounces-63257-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 15:19:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 223E461FE49
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 15:19:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3C5CB301015F
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 13:17:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8E7B3A5456;
	Mon,  1 Jun 2026 13:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ROGKoqDy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF99C365A0F
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 13:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780319848; cv=none; b=ns1dxujtkmaTHMrmPOj8PdoK1nQtmvjXOio2SBidD1kvIvlCNOrRHo0HILmWNlCNCxEKwCZf3X3+i7fovaWGCJmeXUoYFQF95HF6hEsXSvqc4ThCF/Kwy7BCTPx0qtgcygwUK7dB35h4NQO51Uvuu6LyJd8+pyPrPqzVYpU92Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780319848; c=relaxed/simple;
	bh=kBOEceX6nlfs6Pp3Zd3F/KbshONwt373j4oBkiLw1pI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RypABxTMDJreN16+ySj2sLeeH+U/NrvS2O4xCYq2B2a5byA5uKMAUmeiRImBkRvTQQE8L8feKL1dar0E8czmFnkPiqLb7+0frytDBeyI5vzjnT4dXHYCFcnmhG8MR+nsTzwWltC5rFe6kR1iP04YKYCYBOp4gq9n1GkLn4OqK44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ROGKoqDy; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-bed2b9bfa02so124396266b.1
        for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 06:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1780319845; x=1780924645; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uoMWqAZZBMlv9sgOU55XmFaR14es/tLA5YGeL9J/rb0=;
        b=ROGKoqDy0wvesC4e0pO5knOfaplb2nE1/nsyP0X5qdyQnsYXL+cteHdHSwbPQXk40R
         EEME8/QmVCP66+K0Uh5wKqGHipLRl3qCRAM7DEIzDqi46yIZ5LFGxheORuyqT9afJg7+
         7F7RlTwKC/zdRpFhgKj7NB3Cmh4W+hagbj1qk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780319845; x=1780924645;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uoMWqAZZBMlv9sgOU55XmFaR14es/tLA5YGeL9J/rb0=;
        b=aK2VXx9PLEeb8IUkwRFvwMSM5K+yCMVgYe/LfeMpEbp2Gp0/UQnQG/eCI961W0VU04
         bKNCsmFJMOiD8KB8GMJIkQdV1Tiw8zaixxdLlcpRM2hFgY9QzN8oKQNjKJRwGpvcbx6t
         4sYnuKQDQvXp3paQWeMKfJAf2zzIt5iMebiKB75rds96yGbTtTIbk2BVEAQcAxzBwV95
         yrOW8iyaw9b2IZQxSSOspM3QhzJMpMIIz7Qi1k/1eywwT+YkqseFwZGQj3tXIn/b24qU
         IQ2abpFGcckBN6J5kMT5AOS9MLuv7xCcjIHcenY/mNfsIZPciVZDy1B9RNiPjEx/nyek
         G7eg==
X-Forwarded-Encrypted: i=1; AFNElJ8RqdCECIDiPpsfojyILgdCMOrmmIvtjmiwTc0FlqAZxOsS4UJ4xv3VnPEtNNhWutHV69UF2xoFztggWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxyz0biuTHInrow5jVmqTg2ZLN49498WomeVOaWu1OYs43aFwkB
	NAnoKZisEBjCZLt179pO4O+0qDzVsBIOg1m4dEmRK5m44pEUf0OdeUKJFeazZl/nNFvHqxWDJ2r
	fWCBnRQ==
X-Gm-Gg: Acq92OHaM+zbAuxKjChvJLllDhUHhitN5gqSSdwsAkqvnjYdfm9cuypIfOPFkh/mKuj
	Brvih3fHbDUvuw95YNLHPUgOoNYqHUquhDXrTmgAJVv6wi/teOErY6Kr7pq4UObt6wgRRw4uakQ
	GrePxblLRg/lrvo9h1wTEq5RCwegJ9CqUEZ0JNT1/T32f7Gz4S9E6vtMCCfKcXjuqqR5Q/U1h25
	YHBY6hTDVSiTzt1R+CaqqkHZvI1Fpmt9Z0xf4gTXN75yae+ZsgQ8mf6tDCBUFHk6AJ3DKKdwQ6Y
	1XvBZoof07m3r/XjAAi41BlJ+SmGKS+N42IxDrzb+B9wgyKIUtd8Gp8Qyc4VSFRdSbzZVJWCr8x
	vHpK9lyd4P2ZMo2/60RBbHjuGVM3VlzrkCt4j+h2bOFVtHWKHrrWB0QUbn8m1SiwO7IAFs8D0ud
	SjeBBpMiyJ6/84Vle0XGWLr0SI4eJ4LeZwZTXrDvvrluCLafDHUK9GAOJ0R0OooT3v0YCRr9Q=
X-Received: by 2002:a17:906:5a59:b0:bcc:e8f:c3a8 with SMTP id a640c23a62f3a-beab4f1ebfemr445945666b.29.1780319845018;
        Mon, 01 Jun 2026 06:17:25 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bec5e5be0d4sm166367766b.52.2026.06.01.06.17.23
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 06:17:24 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-beeba001887so16992266b.3
        for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 06:17:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+Vt82/AQ5YD5t3xGdm40IzofwRX/WmHsjgziW/vPiviqzl/llRvVsbwV1pAsmFxSNPAmtshko7smbNTA==@vger.kernel.org
X-Received: by 2002:a17:906:ef02:b0:bdc:55dc:dd85 with SMTP id
 a640c23a62f3a-beab4f1fc2bmr628995566b.28.1780319841873; Mon, 01 Jun 2026
 06:17:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <18d5b476-72d0-4a1b-9004-1669866f0d28@kernel.org>
In-Reply-To: <18d5b476-72d0-4a1b-9004-1669866f0d28@kernel.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 1 Jun 2026 15:17:09 +0200
X-Gmail-Original-Message-ID: <CANiDSCutbX-xxk8wkUBzkM6-6bR9JhkXY6D30dT5witRHtWDZQ@mail.gmail.com>
X-Gm-Features: AVHnY4JRcRZ8cCQNlKpAHnc84MCTxQbtkj0t3YzmBabZ1jBmZLuG8EHK8_ypwOk
Message-ID: <CANiDSCutbX-xxk8wkUBzkM6-6bR9JhkXY6D30dT5witRHtWDZQ@mail.gmail.com>
Subject: Re: Fixes and CC to stable: proposal
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: media-committers@linuxtv.org, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63257-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[chromium.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 223E461FE49
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Hans


On Mon, 1 Jun 2026 at 15:10, Hans Verkuil <hverkuil+cisco@kernel.org> wrote:
>
> Hi all,
>
> I talked to Greg K-H about whether or not a CC to stable is needed for a patch with a Fixes:
> tag, and yes, if you want to get it into stable, then such a CC is required.
>
> Since we never did that he just went through those patches himself and picked which should
> go to stable, but obviously that's not how it should work.
>
> There is no need for a CC to stable for fixes to patches that are not yet in the stable tree.

Media-CI is already doing that. It checks if patches are o not in the
the stable tree and block CI if needed:

https://gitlab.freedesktop.org/linux-media/media-ci/-/blob/main/test-media-patchstyle.sh?ref_type=heads#L118


> There is also typically no need for a CC to stable for e.g. Documentation fixes, or other
> minor fixes.
>
> In general in all other cases you do need to add a CC to stable.
>
> So I propose that media CI just warns if there is no CC to stable for a patch with a Fixes
> tag and if that tag points to a patch in the stable tree. And that it is the responsibility
> of the media committers to check if the CC to stable is missing and add it.

By warn you mean making this check optional (like checkpatch) instead
of mandatory (media-patchstyle)?

>
> Now, one problem is that it is very easy to fail to check the Media CI output if it passes.
>
> I use a small check script (attached) that runs checkpatch and performs a bunch of sanity checks.
> I run it over the patches I am about to push to gitlab and go through the results. First are the
> checkpatch results, then at the end are the extra sanity checks. This avoids mixing the sanity
> checks with the checkpatch results, which would make it easy to miss warning like a missing CC
> to stable.
>
> It's very efficient to be able to do these checks locally before you pass it to the CI.
>
> You probably need to edit the script a bit since it checks if my Signed-off-by is present (I'm
> embarrassed to admit I've forgotten that once or twice...). Obviously, as committer that
> should change to your name.
>
> Comments/questions?
>
> Regards,
>
>         Hans



-- 
Ricardo Ribalda

