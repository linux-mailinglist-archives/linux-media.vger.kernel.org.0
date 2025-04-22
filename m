Return-Path: <linux-media+bounces-30761-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3459A97A8F
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 00:37:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B80E1189DA0D
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 22:37:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 297612BE0E5;
	Tue, 22 Apr 2025 22:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tmjlLrnI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0F726D4E3
	for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 22:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745361422; cv=none; b=bHc12YwDo5VIK9y70DsRWVqMBEvq0NKuqvDesPNR5bUvdPCMQViYBXYGRGYXpAq6oSQ5OtHuwS2PqwEDwGf7oEjR3cPT954oEjIkV9F9dwWrZlrvgcurVqQvXVqbC838mTPlZpn2EDM0xNsNmhiNAL5V/yKoati5PZ51zCX3V+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745361422; c=relaxed/simple;
	bh=CYnsLlC0NFMYuF8GmCOmo6AutxjaiqbjJEuB9kEX76M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HvZPdMmNZ1KxL92RuNmHYb1Yy1b3D1iRU9LmDV1SVsjvObuOqVRUz10S21GQ7O6HrpHmr9QRriZPfWZoaxLSj6XMy/TPV8cGXyYGw9MBcJC8aLrduXuWDMtFMXnSdKWUszvgdMYRhJQMt2/RS605IffhH5/07SE1x2fcLKejCmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tmjlLrnI; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30bfd4d4c63so50343791fa.2
        for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 15:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745361419; x=1745966219; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CYnsLlC0NFMYuF8GmCOmo6AutxjaiqbjJEuB9kEX76M=;
        b=tmjlLrnIq4uoKAkzniiAutP3VY7kSpH6FYvuLQdz7LKnqNjDk6Seva+JawvD/Jh63t
         Pf09R8uaiZsFR/tcF9DnVOehag+2l28WTwZb13kIWz6Je0/BabTqE+wH7kHP0ZpQrGuM
         88GqGw3tA5DwOeERO9+e5K4sSVbjxSPYVJAXnV4ZGo1xk+uw0tWebCEfXZ7mpS2LWYz+
         0tMwU3t9h1GHg4QhIV+t3XOjFWn7QH31TrNIpbgVyOkVdo2SoeYdED1hEv8TcTYsEUAV
         fvw3YaYRG9K7YjNUOw6on2gclmo9Z1F71osZ6LnAbfXbXRLNhYhvk0zwdDrqCAjUnf83
         j7HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745361419; x=1745966219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CYnsLlC0NFMYuF8GmCOmo6AutxjaiqbjJEuB9kEX76M=;
        b=X7nnY9LZ/BXGqmhEnAgf+Jw2hftOzdtfcThQTiuOa5dABlO9/957Ue2bTQWZ3oNE47
         vtXcEcLAkCY+nX/2WDYYstymzwK0odDIteF7827uJuhlYSGndggXeT+h1vm7yQClQucy
         AXs0ekdeGOasYxzzo8QcaZXIQaK8UGAXPQzNMs/2Mvqn0y6kSDjOcLtbGftGxZS6xlWi
         pXDwl0zaTregleUmrO+WgzFFTgGSTuoPLvvs7GrRy8cL1jCGBBESU6Iygd0VUWm9zwbe
         pwcbW/fF7/Snlfd7fs3jJSxf/47dQ+WcSKKNm29C1cEJc1WKX7/UuL+1KllW83MIW2i8
         y6zA==
X-Forwarded-Encrypted: i=1; AJvYcCVh1TPosC4ROtSArClpWhkqa7hN8LrUoc7seNUMoc9W4vbedcuLh7WAqbdCAVDp1btBXeqgjV6oe9DGmA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRd8Z9+9+KVmP7WKcoEibcmbFYDOmlUnZYkdk20gTWvj4Qkjvp
	1REHO6UneCXm0auXTEQhXXr9bvq5R6CMZaHs/PzlKd+QkkPsHe2AYdUMNmPxxwbXJ0kWtPXoh+0
	tcRE0UP3qfdLqfy5+hg3V3XpiNgJBSAUIONI=
X-Gm-Gg: ASbGncuY1Q4Rnzdo0bgmrqBuyy8J07ewjK44kqkpeEd0Fw0LjtFXRUGdDYpP/nOus9j
	RXr7SsGP7YViSFcUZzYWlnvsL858mWD1ziS7z2+UHHM0n79pTdxX1hDOCQVaj2QjHRkHOeXIQ4I
	tPwX1NeAykibDlnmo4ruGiH1Fbwh0+DTNuZATyz+dkCBu0Uw6F9Q==
X-Google-Smtp-Source: AGHT+IE3IEPCCgB0bt/uCVYonB/YsmX9MsBR2/QB63vrorCHbNSrdpM99e+NYH8FchPivlBNMzAKqKtWDNa/LnKLgF4=
X-Received: by 2002:a05:651c:2226:b0:30d:c534:692 with SMTP id
 38308e7fff4ca-31090554d22mr52580801fa.29.1745361418655; Tue, 22 Apr 2025
 15:36:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250422191939.555963-1-jkangas@redhat.com> <20250422191939.555963-3-jkangas@redhat.com>
In-Reply-To: <20250422191939.555963-3-jkangas@redhat.com>
From: John Stultz <jstultz@google.com>
Date: Tue, 22 Apr 2025 15:36:45 -0700
X-Gm-Features: ATxdqUHUf8NvYK-aLnI2B4TJfd1jaEQSDfLR3dMFnq6KQaAqiJ29RDdXxafUgSE
Message-ID: <CANDhNCpbX1718t2gH3LULL=RDxfxh+uCJNF4jJH0sbpLMK=oWA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dma-buf: heaps: Give default CMA heap a fixed name
To: Jared Kangas <jkangas@redhat.com>
Cc: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com, 
	Brian.Starkey@arm.com, tjmercier@google.com, christian.koenig@amd.com, 
	mripard@kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 12:19=E2=80=AFPM Jared Kangas <jkangas@redhat.com> =
wrote:
>
> The CMA heap's name in devtmpfs can vary depending on how the heap is
> defined. Its name defaults to "reserved", but if a CMA area is defined
> in the devicetree, the heap takes on the devicetree node's name, such as
> "default-pool" or "linux,cma". To simplify naming, just name it
> "default_cma", and keep a legacy node in place backed by the same
> underlying structure for backwards compatibility.
>
> Signed-off-by: Jared Kangas <jkangas@redhat.com>

Once again, thanks for working out how to improve the standard naming
while keeping compatibility.

I do still hope we can get to the point where other cma regions can be
registered as heaps with unique/purpose-specific names, but I can see
having a standard name for the default region is a nice improvement.

Acked-by: John Stultz <jstultz@google.com>

thanks
-john

