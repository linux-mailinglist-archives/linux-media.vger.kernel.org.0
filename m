Return-Path: <linux-media+bounces-35817-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 534A8AE6E62
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 20:15:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01A9D4A0D67
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 18:15:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C08C32EBDE6;
	Tue, 24 Jun 2025 18:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FXkNA7da"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F852E6D1B;
	Tue, 24 Jun 2025 18:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750788791; cv=none; b=h0Md7EwNDyhNkcl3vN5m+m7+Zff7HtdZTDz5pJsD36X/pzbVvAclMEtD6l7ezpjtZLr3IcwUzicKcz0tq3/NxN2wUviWyCHMT0MBCmZsD5/EKVINg9Lyh3y8VvbosZSFSSlxqs9JthZ0V3mB9apyTIe4vQveggdHA/V4M12AD9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750788791; c=relaxed/simple;
	bh=ZXA8DRWVPPHnm2xugJwcLuE0I9ArDZyOMS9O8RmbD0c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RMcyW4ButrfrUUHY2si4m5BGiSwIx1nZX8UleAgtlhr/GIrynuJ97zYaT/egfctf0pKOPfqVWVSqEjPIeJtwlb9iJx4zxuAynasfvw+OhMnCuhWaZtDOuQTaSNx8hPqQRG9URnjjBQmYMCC9oQgNfQWIlTpLUzIR1wyYoNSYcOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FXkNA7da; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-60707b740a6so8635087a12.0;
        Tue, 24 Jun 2025 11:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750788788; x=1751393588; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZXA8DRWVPPHnm2xugJwcLuE0I9ArDZyOMS9O8RmbD0c=;
        b=FXkNA7dayH1skwBaTCxED7hjl5dOrINT1VaUWcWjPOGGVtqssxZrkNoHmgnOHRrUe6
         BBGFR+oQyK+i6xUG08Dz2jgNjK9F7n/JSQlEynKf6fNxWPGYA15Hq/c+EjwJ3mNZa9Gl
         S6Fgo+xsAQ5lQmW5n2Ocrus4ddQLtkRkahMsiLpkvHT2uVyBSRO6x+rDK8zxvmLfQC0C
         KSnE1NkAMdbD16VCoCHgwecmI7puZC6cO5cuvkQo2IJ5b7qjn8XGLhKmjlNXQ1cbjfJv
         kqMRCBjkc8o1hmCxxJv6MHP7tnD4Sh5ke5IQu7Rwc7bFSU0NXzlW7oIEUqWynQ/iI0SO
         G8RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750788788; x=1751393588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZXA8DRWVPPHnm2xugJwcLuE0I9ArDZyOMS9O8RmbD0c=;
        b=j8vuFh7yS347jn6wZhZYAqTMieiIRMW7Gakih6IdItAJfiLQkZ6dTk4mR1TsMyOFyo
         8ngUB0Bi6Ic+GfLL5KSfg4WhHmBXvFalLzsGfz2kYu4mJCq2ntBZt1RtHcekOI8ufhoF
         ztEe98lViQvS+3NcmVvQBHGaHZfJaGdO1XinZXEptNGZTHqXS+xEUNyR46RtKJ9OgxF3
         /0I4EOw6Ozrh6eL15iqfVyBeZhR9KUApcSyNCwiAHWygOSj3vcKgDpWq7jEYK2jlLaA9
         dOpOy2oaEHsvD6P0hy+olWCfFllLLPNHt6i4E5VxvRZbp2GKaKgQDlCwkKmaY16WXTtf
         Yc4w==
X-Forwarded-Encrypted: i=1; AJvYcCVvWSG1BLtoK/4sYC7tOoINGKB8jwEPU+w6QhZevGGJ0tnZQtE6fBfUO/PvxJ7iqVRB8Xc43RcI0Rh69qE=@vger.kernel.org, AJvYcCW8V5U9vmF2R+OKgLexj4O5rHZBglPScfCfUqlypCON+piHmd9U4ha+sAMGraumiXt8tfBoT6Wa9P3f1O8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5APRnbOEFNAZ8a/HM+ja3k5PdRibMjEUlBonW/T/AzBpmk7zX
	oVXUc64KrIbs5t0yt7wNgm5NnS88kRoazojEjIKPlo9XG8QL2+0qXsdGIELWNekphO0ikmnXkVB
	FoedjMZVQnmlu9fIf51GuXJd8oA3MSGo=
X-Gm-Gg: ASbGnctk1eYLr8hJvzdt6WEXwXxurt8RqzdtW6ZRP6NYRaDbeTkSyU2mWcf3klCjXUi
	gqifMimeYPS2f8jDCM9L/wtK8xu+caAiNK2Vwn0T1WDHsLk5GycayzeeZBOhRv5r/IjM02dWcmn
	IytHkQTBp4hUKY6v5ZuQsfFj0/+WdLtjFrSm6JWgRb2xk=
X-Google-Smtp-Source: AGHT+IHAPhrE2siqZLDcYTmASprwv0ffOHbs35Be8BcBAzfVlcI6RKVtZ5YdVQMZrIAQEx/vZPcLhhOsSIhbiavvE0I=
X-Received: by 2002:a17:907:c810:b0:ad8:ae51:d16 with SMTP id
 a640c23a62f3a-ae0befc0232mr22330766b.55.1750788787409; Tue, 24 Jun 2025
 11:13:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHp75Ve_G=ziR7sJmKw4t3BRASogGQ1kWUsNNNWESFmmS4rVhw@mail.gmail.com>
 <20250624152000.489-1-zaq14760@gmail.com>
In-Reply-To: <20250624152000.489-1-zaq14760@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 24 Jun 2025 21:12:31 +0300
X-Gm-Features: Ac12FXxT6Ms8-cnSXjz5XCPtCtveFRdKHi5l-CJC9dofBzFjUDvnc4Qezvh7NrQ
Message-ID: <CAHp75VeijMvnbrCmRuqTeo_maxevCA9rB-r5URHaX+TrDNvyGA@mail.gmail.com>
Subject: Re: [PATCH v4] staging: media: atomisp: fix coding style in ia_css_output.host.c
To: LiangCheng Wang <zaq14760@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 6:20=E2=80=AFPM LiangCheng Wang <zaq14760@gmail.com=
> wrote:

> You're right =E2=80=94 the driver is quite large and contains many simila=
r issues.
> To keep the patches manageable and easier to review, I plan to split the =
cleanup into multiple smaller patches.
> I'll start by submitting a series of patches, each focusing on a specific=
 file or type of issue.

Please don't base on file, base only on type of issue. But cover
entire driver. And if you do some work with a script (shell,
coccinelle or similar), include the text in the comment or cover
letter so the maintainer may do the similar steps on their side and
check if the result is the same or so.

> Since I=E2=80=99m contributing in my free time outside of work, I may nee=
d to spread the cleanup over several days.
> I=E2=80=99ll do my best to keep the patches consistent and focused.

No problem, take your time and thanks for your help!

--=20
With Best Regards,
Andy Shevchenko

