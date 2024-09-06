Return-Path: <linux-media+bounces-17722-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E7296E6B5
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 02:17:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 28AB3B20BCE
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 00:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61E63C8CE;
	Fri,  6 Sep 2024 00:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IutMm6zO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCB7442C
	for <linux-media@vger.kernel.org>; Fri,  6 Sep 2024 00:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725581842; cv=none; b=YUBlKWunG4Y4reBVXjtMRWmvl/5HbJmeR1E4edfoHZ5tacpm4QZP+pX7hldXPj6lBwLYPJFVaWPYvmMuzSlxRxxdGmNs+seSD8shJQGVQCo6hF3dcpdhJYMPncw64T2tP5lq8WrQgBUZVebMJZ80uzU3WIMiXkF1BCi5ScC9kGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725581842; c=relaxed/simple;
	bh=NG9BmRA6hMBliXpavQRbROysFPGHOwtBx2R9wnjVQuw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UDNwDWq1PR6D8FQizAUjPA4READRy3Lo4QpTYw37dL/9+KlJJ5yaNHjoN4NnKXfIPCY4CkIFR5D2N3zlLYACN4fZEUZ57NVtCbKLNsOa88ybtQYGMIxcGmad9MasMFCKA43t87AE61HkIy/9zC2k4kB+0tlWXTc6xOvF4zuEO+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IutMm6zO; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a868b739cd9so195195466b.2
        for <linux-media@vger.kernel.org>; Thu, 05 Sep 2024 17:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725581839; x=1726186639; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NG9BmRA6hMBliXpavQRbROysFPGHOwtBx2R9wnjVQuw=;
        b=IutMm6zOuBiI0ZrpeSDQ4HTfpzL9L5E419NGZaIKxEpTTl9bOff1IA6T6zx0BseCbT
         ufumbeeYii90dBYE2OpmHg08Dsl+P59yfeP55OyB4h41c1JOtk8cYcCutlCm5ABDX3Yq
         /IQ9uSlu9k11/4xaUA2cri8iwuMG8+9dzl0wN1UhnaIRu1viXnK/b/MCMprj84FqTHEF
         Hy7DEBZgMmpfPATsK0W4OYotNzO5swdF/2Hhy3JzlbxRYz3KaDppW1/yPh+dRJh46eDp
         13c4qAOH2zNPj+c1wlnsYnAha+uMrtDfLMkH0k1Vr9mP/gtotjn1BG1DWmdSPsYTyvqJ
         jeJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725581839; x=1726186639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NG9BmRA6hMBliXpavQRbROysFPGHOwtBx2R9wnjVQuw=;
        b=q7uKTIxmfJXSDpXYFuveZLh7aKxu2X0mYThrOUHCuBUt75bomskAslpq3hzj8zDMAz
         8TMH7rldCn5M8PmOpIDGExLy0dK5kIodwPjazIU+zRL8U/68g++9Tcor6KDL74ncpHe4
         sDr4n+c74AdlifkIZmH1nUs+23Nzjcccluhm4zZVMQ2DkQwzJbQw3b/jDJVJ6NVTDKoi
         5X6OJqMZMMVubPwmKtgBxdoY91BxrAcmbIfLf1TlaNS4kGP2K6xdSLfb4hnC4onAHXkl
         T886BcrYrJCmFqxBmXKMGRUHHi4qzW+/fmfovdO9F885GoC90lm45mcZ6Mm5MDoUildV
         hLtw==
X-Forwarded-Encrypted: i=1; AJvYcCUrHrkaQlHnRrkofbRybV4w+2W8dUlAX7qaK4nxQgNiX3RaUCtK6b4N0Ln41XHQ1FkQJopEB9ha7EJHow==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBqXx0IwgRmhMiA1y9U95Jh+JRvaeCkwqHdlMvNxVo2nyVZvHh
	a1BIElwKiLMzrCEeZceyl7ZJs1xI1Xkefjr+2KGFdypihDBeoVyWh5r9fcIWC4SjoCjWwSNG6UU
	BnsEwR5+bTLD+6/km3mJZy6ddYW/xjx1Ew0Y=
X-Google-Smtp-Source: AGHT+IH6iGOhY96esUOgnqkha3Im5NDBFCI3MQ/51ohxLt/quz+M5fUyeZSZEDsXTKSS5BJ+8U+V3xQiVG0pxHwj5yY=
X-Received: by 2002:a17:907:1c1b:b0:a8a:78bb:1e2 with SMTP id
 a640c23a62f3a-a8a78bb0272mr274642366b.6.1725581838319; Thu, 05 Sep 2024
 17:17:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240906000314.2368749-1-tjmercier@google.com>
In-Reply-To: <20240906000314.2368749-1-tjmercier@google.com>
From: John Stultz <jstultz@google.com>
Date: Thu, 5 Sep 2024 17:17:06 -0700
Message-ID: <CANDhNCqudbuWM-WG7jiY_KQfgOZ84nAwWUfUHNzgniBiSZzeyA@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: heaps: Add __init to CMA and system heap
 module_init functions
To: "T.J. Mercier" <tjmercier@google.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 5, 2024 at 5:03=E2=80=AFPM T.J. Mercier <tjmercier@google.com> =
wrote:
>
> Shrink the kernel .text a bit after successful initialization of the
> heaps.
>
> Signed-off-by: T.J. Mercier <tjmercier@google.com>

Acked-by: John Stultz <jstultz@google.com>

