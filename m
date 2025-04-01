Return-Path: <linux-media+bounces-29146-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44518A77B9F
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 15:04:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 09ACD16B833
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 13:04:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 170A92036F0;
	Tue,  1 Apr 2025 13:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lfsp10gR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26B61F152E;
	Tue,  1 Apr 2025 13:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743512679; cv=none; b=lDozv1XnJ7jvs+B28AKW7QFoQUkKvuDSpPXkg3N4Dm03KsliMo4Qtn48SlBXlwvY4zhUMg5nsvg5rt/YRShOO8K00bTgVF91ALqA6cAoshXHpLch0b/aK2KXUm0bSoASaXMmfW6t+YpcYTnq0019/dvIf0ByVSZD2xvS+56IXoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743512679; c=relaxed/simple;
	bh=vtatpFmzhU7xgjZhwA5PCJeITl2kEtzzcHrkI3h7zeI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R1tykF/USPKU8XizjpfC/E8JtFAaf27/rLw4k1KUANprxpTJAQUszWTF4/d/mE29yq7FiVpUxz4xEffMdd5C0/32z4XSR77gIebKM+wecG4N5k7MufGj4Q6w4scaLXfyDnEM2biqzLQkrcDlvxMvK+8IhoRpAc4duA5ASgvcBI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lfsp10gR; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac289147833so931671666b.2;
        Tue, 01 Apr 2025 06:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743512676; x=1744117476; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vtatpFmzhU7xgjZhwA5PCJeITl2kEtzzcHrkI3h7zeI=;
        b=lfsp10gRm1Acu6rbC/PVMoopx6QBtX6RphRe93n/gKuGZUj/CDTtVyJPikSWCeNR+b
         kK9Yqsw+zo+sAox7PBxlYgItWRp8lVcnZOqh21PrelzWEToO3rkYdiDAad4clvtVxTwF
         53l3cUrfQIeHIoEIpozmi0hzzDtzvG5BPxrnZ87Jn6zTFKjuHYkjPY7MqDTf2Ih/4GLG
         Mn9rgtqor2aCvCkAPiJ9Mg0rP4rNRnVkdjrp69uZiEFr9Dw5z30reDYO4jjocr6hABb8
         vQCC0YnUeyrAchDH1LxdkXGzup2g3nYdvuj+7AaBuu8J8asIJ5fO8TZaSQr/0ZPnguzA
         8NvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743512676; x=1744117476;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vtatpFmzhU7xgjZhwA5PCJeITl2kEtzzcHrkI3h7zeI=;
        b=NU+SpJKLR4quz4GDnCh7ZfuGDib/OETyL03+t2TClg9ztc/dNoVTDupjZTOLig5GWZ
         6rpe3z30k3tpGUqfDhRW/Wp5pPnULzxXJ50b3CsqTIQttJnnirZHKOPt5bzWHHkmqZeg
         FH/IyuOdSk9B2boxP5CMvdEyxUY54qbGSyYB/g/RGlU0H46olCKqe6Gk6uKiQ0LcDxw9
         ntbSEsobqhyr7B6Uij9xJ7WNTwpid2NwGjSvtrTjs7RlWqBwZ5euwG6kdWIKFbUSN16Z
         g2qRsuzsS1uD9tP+YYtMZrAPMiZR21jCIH63nOo9iqh7tJ5bhRuBk+BxFr/qMChaHbwR
         3eEA==
X-Forwarded-Encrypted: i=1; AJvYcCX3s1kaap54/eXo2ClZhrvlPB+yq+z8EkYdo/K2MLz3wIIGnFDRAhWuuByfOkf2/mJrqboLCb91hCjmMYI=@vger.kernel.org, AJvYcCXURUG8IJND67K9l3EOPS6iPxkGrBBvy7yUyG870KVR6oxcgseAWO2QFKVtVJKKiI6jk9/NCzfUzgDYAPA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr0DhnpCtn7FkBIhAI0VJQV10vgVpupOmLH0BL0TzxYRVJodrl
	5t49Uuxf7uNEnNpug3zaCT+mapr77oxLkH9dErVofnGgdeOLxzhZR9H7c+3QUoWdTHdwVofmmoR
	SVkt+akFpk9RbNn9kU+pMzlBaUwA=
X-Gm-Gg: ASbGncteWjxrBG7lHR0YWvM+ugx/6hHUBI0h7hrZ7mScn+HKaeWLIR+ohfmL63Su7nr
	Tur/oxEIL2FRNoo6myvtL1fLqsHFyH1otSgEpJ337pI5nMVtTRMnOOMFHmtqeuvCUE4HbBB0tU4
	gf5bVKbsRgXQhmXWrt8xxbfbWVOw==
X-Google-Smtp-Source: AGHT+IHZsgzE/OgxX7vZ7ZnSjzcsPxeS13ob9nT5SmHeUEZ3jjaSl08nur2NnbGtlffi9m8wEAGUtFTlGED263jrJZs=
X-Received: by 2002:a17:906:c148:b0:ac3:c7bd:e436 with SMTP id
 a640c23a62f3a-ac738c6f2a9mr1016730066b.51.1743512675974; Tue, 01 Apr 2025
 06:04:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331-v614-v1-0-9bc69a873720@chromium.org> <20250331-v614-v1-2-9bc69a873720@chromium.org>
In-Reply-To: <20250331-v614-v1-2-9bc69a873720@chromium.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 1 Apr 2025 16:03:58 +0300
X-Gm-Features: AQ5f1JoQAeiz8KzO0Ix3DeA2FFUbKTV02faYpr6Tug3l0lCiOJFfHWd5fqOwTTY
Message-ID: <CAHp75VfVa5QYW9Srx1aDBFuvBp5OcWr1bnNUdhf6rJx_NemEqw@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: atomisp: Fix Wformat-truncation warning
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans de Goede <hdegoede@redhat.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2025 at 7:38=E2=80=AFPM Ricardo Ribalda <ribalda@chromium.o=
rg> wrote:
>
> Gcc8 is convinced that we do not have enough space in dot_id_input_bin.
> Extend the variable 17 bytes. It is just used for debugging.
>
> drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:1336:9=
: warning: '(pipe' directive output may be truncated writing 5 bytes into a=
 region of size between 1 and 74 [-Wformat-truncation=3D]

...

> -static char dot_id_input_bin[SH_CSS_MAX_BINARY_NAME + 10];
> +static char dot_id_input_bin[SH_CSS_MAX_BINARY_NAME + 27];

I'm okay with the approach, but can you also add a comment to explain
27, please?
(I mean something like "27 is the combined length of 'pipe' plus ...")

--=20
With Best Regards,
Andy Shevchenko

