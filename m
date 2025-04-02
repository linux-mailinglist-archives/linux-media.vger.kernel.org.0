Return-Path: <linux-media+bounces-29270-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 615E2A79706
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 23:04:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63F543B3C28
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 21:03:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3931C1F1319;
	Wed,  2 Apr 2025 21:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W7lBAyUR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1091C19ABB6;
	Wed,  2 Apr 2025 21:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743627793; cv=none; b=Rc4vr7/ZiaCHoI/rwTpCW6FEoHRaPjpUupraBynfjAUOLmyu52qqItAc88+iMC0Zktqt+jsVAIFwzdX3CL5sIFqlzpF/TZKTbeDD3tSlhm5aKs+W83qMMiBBO0jD88H6kAsvmiLX1MPJ8QOwpjBQmjNiZSfCaELI0Ga4KyI+hik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743627793; c=relaxed/simple;
	bh=9We8w6ywXSYePPfAc2+RjgjtmxuxhQLFWen1w0qj26U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NhF1oeWEwPVx94N69ow02zNbuFg01kCFjI/p1O7lvjRykZYd8+yRLyY0AyPc1YtCisXvlgVRvjpA9Ks9ZALKtw0HyZeTZTC5A9hell8XVP+I2wosBnPjRzkKsE91QusMEbQx6Sq7GCVtl72QQdOczRV3tf7HhEAr71pZg8tme9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W7lBAyUR; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9ebdfso499128a12.3;
        Wed, 02 Apr 2025 14:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743627788; x=1744232588; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ngwLBCdZC+dzqFCE+lAwDa2iS/akfiLW6kI6Vz60EvU=;
        b=W7lBAyURLyM7mPuQFOcB9qBFGwz9CBVgjSIjoaKi2ZPjCLfxtjx2ZUyHMjf9hmbnM2
         J49PAoTN0AXG5pXfyL0wgYAteVPbPBUKqg7mXH/ARh63HxaC65B3UgVRnODqYQpdlmF0
         WjA4WmSPwit4vtwIISy881XT2SPU/9YJ7QGc62i+2EgcayPm7Qj+wDyrDRzvUxFAlqJ/
         eZY+IZmnuW/OCTEiBQPFoJI0EfQTPR7gJTIjOOP0ggIPimq0gGLWE6G3Spn4Z21rLlx7
         YpFwbNqDhO1iCd4jqp4yxl14nR5qiiOWx7bq/FhG/bGAMpACyjO9rX5qUH7iMiDp+D3l
         F2eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743627788; x=1744232588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ngwLBCdZC+dzqFCE+lAwDa2iS/akfiLW6kI6Vz60EvU=;
        b=jzkPQk1jw+yUD5bFoF1c9mAxe16E06jjXf6bzK7RQbTj1zTMwQL5KC8/P6CYMZfWG8
         DIM9u8KTpzG4SsIiOW2vgaqlIIrteqaN3tM9DpKR4tEDMo+bdPlw3mtqVNSx7yuMShZx
         ZtwQwLo95cIfQgITB3SIJszi5yCuDNTowQwIO4pfIYIQy0mSzCgxQQzG1TTJTZMdntPq
         oTBhnZTrs8yEpw1vc5dGR0pxB2htMLcw3d4xPNJ2ii2oA8fCOmbtbkNoWykPTTA3TQHi
         S76dhvdboTJJIUwbhZQ6CsvaghFtxeKwRZgeUzc5IjUvxDDOlOEX2uUuPUC8aNKS30eN
         EuEw==
X-Forwarded-Encrypted: i=1; AJvYcCVZfD3Mzjd8NT2VLCa2ch7er0zL8vwQ+MSbKuipdYJic6KMmapy6Dydd9dC3omYL92ByqvEgJDRTc1RXxYsXOVHDnz8kg==@vger.kernel.org, AJvYcCWN7theN+hPbapRRlVh8VRYfjzsf3X56vjZMWsDbRz0oo5/kv9CtbC0w8iLWEC4CvV+UvmkcSNgyhbZiw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/jN1UwC3LIKnYwDI6yiY0gWDV5uiy2lAEcalCfzF+fMcrkipF
	CSxZaiI/pa7coQXhVAs7aZ9jRG0iCGJpDJ2AI41jviUJ08y5lIIvH7CF2aTN2xseB7ZdV5viC5t
	Lz4YB43i7BgIocWOV46+O71XrKp8=
X-Gm-Gg: ASbGnctpz02S+kQPE1QBLHbkPoSQ1fl5hnYidMEUTA6PSBh0xWCsfKDqFKvx/LInFr8
	qXAEe6F5RrS4HMG4MMozOKpX8FS92xkProSjvltZXYO7kGDrePATLcR6EmgJduQhIfXsmYqs7wz
	wnWpBV2py9WRL7uY0n3j85oLU3Mw==
X-Google-Smtp-Source: AGHT+IELQEF6iOmJJe2Yq55MNJQxp7CgRB2GGnVsnCgknHapOD5lj+SMulIkxpgoLN0pc6pvSUISSQTeMvJP4DiFN7I=
X-Received: by 2002:a17:907:7fa6:b0:ac1:def4:ce20 with SMTP id
 a640c23a62f3a-ac7bc0ce431mr16677966b.18.1743627788205; Wed, 02 Apr 2025
 14:03:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402202510.432888-1-hdegoede@redhat.com>
In-Reply-To: <20250402202510.432888-1-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 3 Apr 2025 00:02:31 +0300
X-Gm-Features: AQ5f1JqHka7W91x-E4_mnMcYJp-cvJ7JEfIE0KPhokLo0KefWf3it1-YFTNOo-4
Message-ID: <CAHp75VfxjYQ=RzeYUWP7gu=xJ=f1gH=VGXz_cBRqBvkfSH02ow@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] platform/x86: int3472: Add handshake pin support
To: Hans de Goede <hdegoede@redhat.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Dan Scally <djrscally@gmail.com>, 
	Alan Stern <stern@rowland.harvard.edu>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>, Duane <duanek@chorus.net>, 
	platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 11:25=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> New Intel Meteor Lake based laptops with IPU6 cameras have a new type 0x1=
2
> pin defined in the INT3472 sensor companion device which describes
> the sensor's GPIOs.
>
> This pin is primarily used on designs with a Lattice FPGA chip which is
> capable of running the sensor independently of the main CPU for features
> like presence detection. This pin needs to be driven high to make the FPG=
A
> run the power-on sequence of the sensor. After driving the pin high
> the FPGA "firmware" needs 25ms to comlpete the power-on sequence.
>
> This series implements support for this by modelling the handshake GPIO
> as a GPIO driven 'dvdd' regulator with an enable-time of 25 ms, also see:
>
> https://lore.kernel.org/platform-driver-x86/59f672c3-6d87-4ec7-9b7f-f44fe=
2cce934@redhat.com/
>
> Patch   1   Is an unrelated cleanup which I had lying around
> Patches 2-7 Prepare + Implement the handshake GPIO
> Patch   8   Is a small patch adding some extra debugging to GPIO remappin=
g

You meant patch 9 here, right?

Offtopic: I sent you a message asking about AtomISP patch queue
status, but no answer. I understand that you are kinda very busy,
still it seems we missed one cycle for the patches you already have in
your queue. I haven't investigated where the bottle neck happened,
though. Hence just asking what's the plan with them and other patches
that are already in the mailing list (I have received at least two
that I was Cc'ed on).

--=20
With Best Regards,
Andy Shevchenko

