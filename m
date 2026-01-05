Return-Path: <linux-media+bounces-49931-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A4273CF47BE
	for <lists+linux-media@lfdr.de>; Mon, 05 Jan 2026 16:46:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 98E7430223E4
	for <lists+linux-media@lfdr.de>; Mon,  5 Jan 2026 15:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 413A932E72A;
	Mon,  5 Jan 2026 15:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K+oVeAmy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D6C231C9F
	for <linux-media@vger.kernel.org>; Mon,  5 Jan 2026 15:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767627850; cv=none; b=ttUXmjI/K0au2tB0KglQE8jVKqmPYiifz9czXe201XpJ4mpI3wgsgaa9P4gA3dc+Va3AmGU4qFyyhufiamIR8dK45D8pAWt98FVXE5cUMTyBIxzIY9pqO2vYabibEmWZV5AJKRJFhZQB43xXzI3zpZR5fnN8PnFhMK9jK+onmBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767627850; c=relaxed/simple;
	bh=KiNxep5hkYX8mBtTbqMNksK7S57ebqc/+kkLTcHNE4k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tyLcRSb0q5kleDSwDj5LfFZID1cSNLjvEBq6ewzwRergrdgxJ8TeBjSc4c26lm9jXVUOxtMWyYoByPLBo/e9aKlPmFDhgLDU/j94JpRjf5JD9wPgPrco5tYDFXBnbADBujVJ4Orw07WiketHYWLSEcXPMm5QM4CchFS6CnDRUYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K+oVeAmy; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-790948758c1so1048397b3.1
        for <linux-media@vger.kernel.org>; Mon, 05 Jan 2026 07:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767627848; x=1768232648; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wYkOfrIXwEeEFPSymxR3igzs8AcT4FFM6Z9IKdtfy90=;
        b=K+oVeAmyEIii94itEfFsZ/vynH7usZ5Xqi9M9EjHJvCCTHQbDjN6C3zziwWrJD8NH1
         JxYUz9uuHNi0S9le0OSWfOCMLX9ySLpaay0oQK1elBPH3rWXt0Q+9Ldzq/9P3XK3G8Qo
         Ng6dbg41sxvYGLR+dgFhrQkHXbrxREAjLywobWuOSXIRfWACD7wod0NKUYOpO2GuT68+
         7BgtRugchK1vwNYagSakPWiTqn4vjfkVfohLFp4ZwClWp6QiQDa/liBKKGpPoF0wdVyt
         PUDOTHLHqD6wV3PDfRh1shkRXbdU1ad/4X9BaFrO7CNx7NWksTtSQeyimkgwFHQCLxuE
         vj0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767627848; x=1768232648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wYkOfrIXwEeEFPSymxR3igzs8AcT4FFM6Z9IKdtfy90=;
        b=Ebt3STLfuAp42Q6JC3wqQoS0V9y7z3U7FCxe4+TG6QwNoyatgBfAXk+axwkY1JAPBQ
         0wDTAi/1BbYCXL+83pmd7FSl2VfcmPwVD7MMGzGTbPyFE5XkBoeveqZqwx8+e2QByNI5
         3bBSN85mFPvtU8+MaH4K8ieKZg15tAYzIVLGUbK7uNqSrz22SjlQCvkLhkVeXEy6go4D
         DVFMYauxBNxh4YFUOUu3YDl7L9Pnj6lB/3fgkMitGom+6mWlMkywndGsPxaorR4JpRU/
         LUr0NfcOfFzwyDaJtOYEh5Se104CGdQwEebaacWVLf4fjtxKylmT0ixz69oMLCMz83CV
         W/5w==
X-Forwarded-Encrypted: i=1; AJvYcCU7nqgIKWjso/Xg9vN4nMu64hzFcde677hJyHzjtIPTFbN/lBVmgTRd+uh9ydwDiTGaV96dUG8INZIUFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YydAOz/W4l43ZDPKm3pNuOfJsEswL5kS7iSPW+zViHT9YaFlB/j
	sqA7fCYQrtwQ4DhbtAggQdTM1sfis/ZVWzz6SmRnJOKsfnFJEXqHB7jHx9cDnzDQTZdlTgp+vYf
	wM95mRZRw0f9MpYfexDEypUvQEIQIQt0=
X-Gm-Gg: AY/fxX6zcOoQYNMRV+QzsqOJegZ2BVpdxiMcCCeNGWWq6IhXCR6lY5rU7d9MylhLihK
	K0ZqzN6Du3IRuf06sEBtPK9egvzxUS/9BhLfGkvTLHJDdpGlXQlyb9U9Y6/eS26YF37OYfdMIB+
	hhPb2V+gds/AbS7GnuAqjXmxAUI+Gwo97dFd9/0IYeQaXjwQnYOlbL5EpavfiXvzzL/8iaV98Jp
	tKk5sW36dguYe5m6cfMkDWwoZP/F0pgGvNvSkMztuaAa1aIbFOyUOLRGpA5XwDJy5K0BNFaFoeR
X-Google-Smtp-Source: AGHT+IENHVUmB19L8XKrR9F3h/bUcv670rXLNPc8TlmGC/MryKRU0KhX2UylF41J4XgVldLhv8H5dvEksf5MSA62IC0=
X-Received: by 2002:a05:690e:1901:b0:644:79fb:7dbb with SMTP id
 956f58d0204a3-6466a87edffmr38658466d50.6.1767627847953; Mon, 05 Jan 2026
 07:44:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251229070125.98741-1-sun.jian.kdev@gmail.com>
 <20260102114501.42312-1-sun.jian.kdev@gmail.com> <DFE83EE9TFJ8.FZBQIKRUYFS5@bootlin.com>
In-Reply-To: <DFE83EE9TFJ8.FZBQIKRUYFS5@bootlin.com>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Mon, 5 Jan 2026 23:43:56 +0800
X-Gm-Features: AQt7F2oqegGb5yKIGMER6lWYmnSkEDaT2O4LmiDNPF01eLd1hF7mOVwPxQMX72g
Message-ID: <CABFUUZGXjQttwmVfXSYiiswju4TomsDLS2S5_xv_ukMMJxh69Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] staging: media: tegra-video: move shared SoC
 declarations to headers
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

Sorry =E2=80=94 I mistakenly replied only to Luca off-thread earlier.
Re-sending the same note here via reply-to-all so everyone in the
thread has the context.

v3 was sent only to silence the Media CI checkpatch warning about >75
columns in the commit message. I agree that for an exact sparse
error/warning line, keeping it unwrapped makes more sense.

So: v2 keeps the original single-line SPARSE message, while v3 only
wraps that line. There are no code changes between v2 and v3.

I=E2=80=99ll defer to the maintainer who picks up the series =E2=80=94 if y=
ou prefer
one over the other (v2 vs v3) I can follow that convention for the
next revision.

Luca, sorry for the extra mail =E2=80=94 posting this publicly to keep the
discussion in one place.

Thanks,
Sun Jian

On Fri, Jan 2, 2026 at 11:53=E2=80=AFPM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
>
> On Fri Jan 2, 2026 at 12:44 PM CET, Sun Jian wrote:
> > This series cleans up tegra-video SoC data declarations shared across
> > translation units by moving them to the corresponding headers, avoiding
> > local extern declarations in .c files.
> >
> > No functional change intended.
> >
> > ---
> > Changes in v3:
> >   - Wrap the SPARSE warning in patch 1 commit message to <=3D 75 column=
s.
>
> My understanding and my knowledge of the common practice is that you
> shouldn't wrap lines if they are quoting a single path, log message, erro=
r
> message and the like.
>
> So I think v2 should be applied, not v3. But I'll leave the decision to
> maintainers applying the patches.
>
> Luca
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

