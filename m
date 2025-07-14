Return-Path: <linux-media+bounces-37702-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A96B046DD
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 19:48:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2BADD189FE49
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 17:48:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42046265CB0;
	Mon, 14 Jul 2025 17:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VCbjfDhj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CDF79FE;
	Mon, 14 Jul 2025 17:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752515301; cv=none; b=aqk8RXyJyk41CwEtgWiv/P4vWGGPMyxaLvZfpKazgvLIE3In8sHdkyDAyk1FteY7bCmHN6z0O5Hlsbl49vniLJ25JHaGFlQ/pYv0HmPLNtL1Tyqrz75yyqEm5/SblE+eTrObaNDTlylQIxazFl+aRJuvdn/UFWjceGCZ3zDMewY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752515301; c=relaxed/simple;
	bh=cVMR5EXV8k6eD6rR6o3olHZAHPNYMmm96AvBBNldjgg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ptDzfcw8m5D+ZHKZfyUKyAnaCEU4PNtBrsASgZkfqIUcpiZ6OX6NycYBiUuboQ7yJfYwKeAdcRV8j8+yHzuVnVnVoc1+jbXQF7YXlo6//AMh8t0tVpIDSpJGg94IWGzfn5nrT5YqRJbJSEh5cufsHpPy2s5bla7bbwO8GUXf3Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VCbjfDhj; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-611f74c1837so5784973a12.3;
        Mon, 14 Jul 2025 10:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752515298; x=1753120098; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cVMR5EXV8k6eD6rR6o3olHZAHPNYMmm96AvBBNldjgg=;
        b=VCbjfDhjwgV2sR4F3Mtc1q9tj5GGFBTmD7Roy1l9cJC+CRXq7UVJJWlxNfP4LEgqHG
         qeeTG5sZS3tU0zoeIP6Yzbwe6Ic/uPPaqQ7Skz6hqntpUs6931E7/KwkolLhnyCqktnf
         pxTmDqruAKUk/VbGRMxf0NanTNM9y3e7OF5pwDD6tgE6BOTxBJ/YF3zXuMMM8q4i6vNz
         jjoUo6LpdjpDMaWSMpQdDurKzj9Do4/5srgA4UKTOQfOB+vmqPq9TUqJD94Pr4jvU4Xt
         9PQBlfPl85ttcDAqopXylM6c8EmBmBkjme1d/Fy1y1lrdqm0nX/A1FUsbPokGz0o/pXx
         Vu/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752515298; x=1753120098;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cVMR5EXV8k6eD6rR6o3olHZAHPNYMmm96AvBBNldjgg=;
        b=ovfyxgKF3duzcJpR9OBC/AQOEpbQWFgNcmT4i8YQ55A4zPAP883546j66r5H+wB+BC
         9wvnJVAs0LZ0ZIEywMO8/2lsHk51SgfYwON6LbQkmwugOcjYxs1yhyYzxSBpaEUTch+C
         P26+LZTWr2UuDXC+UphelsY6+PYITloxhhQ8EYyom7hjB5IsjXq8TjkEiCQNOiwiS1ir
         Qv+yu3cDxBwNhSOSEE/dXsf3671DzTCXgqDVweHZkFrtii7ZGYKVFrPvmG1+uuK8qkGC
         MJuHEbzwvozvlFwolyeDOL3Ii/FdZyagwJAYRznQh0dLJg/L/E0PvW3dYfDXPfb8tHkz
         qyrw==
X-Forwarded-Encrypted: i=1; AJvYcCV/9bfEQT14RfjvGD6JtItoviqAjctdUvZNjT/gu5h3WtLCNHVf2Y1E2MSotZqGgkKZW7Jc8O5d+MjQFCY=@vger.kernel.org, AJvYcCXP2/52oIvjZ+lbu14E17QVQG3tceLYiJQ8YsdyVfD2N9Lmq652aECRFIRYyBk01cEC1XYKB0PG0lEJf3U=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg0qpC/fq+SB56tcpdjnZGkutMCGtp8hhduYGIrSIzAAAeFrg4
	k7MrVYRMLbHjMAvepez5qYV9HxVfhL3mep1zUbKgQeoD0se7QoZ23z5yx6vX9fScT0EXs64XKnC
	dpdq6PRMsvljxXwzycp8R9FkLcl5g/oM6VSASAYw=
X-Gm-Gg: ASbGnct5kgTmsVRGUfOLSP5DK4IA55tGkDMpoleM1+0zKEeTygzQMgfoPJNF3gI1sbw
	OLw/AxDrKNocsw4wLJPnjmUzh49HMbkkNbrJ/Esft7n+CaPNMAwjK12RfLrYRoYgkQuBcjOB+Rx
	i4rsN/rkcia2tOf9Y6jyl/E5W1EjGD33uNsxVScTGhtB65Dp4XKiwJeS47O+kbQt6xXbCO0k1ue
	mvQdpljuq/hHy0YgA==
X-Google-Smtp-Source: AGHT+IGcjzBmfTiWeE+N2mLwhGEP5BvYK9+VML9tJbJRcZap8A8xcLJsoCcrWNT9arZ4kLyLBKLax9ZxO+eLpNK7ji4=
X-Received: by 2002:a17:906:f596:b0:ae0:66e8:9ddb with SMTP id
 a640c23a62f3a-ae6fbdc7e12mr1528201466b.19.1752515298262; Mon, 14 Jul 2025
 10:48:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250714153409.46085-1-martin@weidenauer.cc>
In-Reply-To: <20250714153409.46085-1-martin@weidenauer.cc>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 14 Jul 2025 20:47:41 +0300
X-Gm-Features: Ac12FXy6-0zrWuqaeotADyZJbAA0J8fwpyqF8G2dlE1cswL8QBsJQQz4h1A3eGc
Message-ID: <CAHp75VdUNe=bn-Emv6oyHtejTMyhKaiqQfGic0Ha94Z_FAPs2A@mail.gmail.com>
Subject: Re: [PATCH] staging: atomisp: isp: fix open brace on new line
To: Martin Weidenauer <martin@weidenauer.cc>, Woohee Yang <woohee9527@gmail.com>, 
	Jongmin Kim <jmkim@debian.org>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com, 
	andy@kernel.org, gregkh@linuxfoundation.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	~lkcamp/patches@lists.sr.ht, koike@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Guys, please, coordinate and issue only one (or a few) patch(es) per
an issue. No need to send zillions patches for the same problem
file-by-file.

On Mon, Jul 14, 2025 at 6:34=E2=80=AFPM Martin Weidenauer <martin@weidenaue=
r.cc> wrote:
>
> Fix checkpatch error "ERROR: that open brace { should be on the previous =
line"
> in ia_css_dvs.host.c:277.


--
With Best Regards,
Andy Shevchenko

