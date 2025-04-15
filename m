Return-Path: <linux-media+bounces-30277-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EB969A8A8FD
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 22:14:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 826B03B8D47
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 20:14:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12E16253352;
	Tue, 15 Apr 2025 20:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jNIsvbHw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA3E2522A9
	for <linux-media@vger.kernel.org>; Tue, 15 Apr 2025 20:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744748089; cv=none; b=jDEtXizOhxUDv8ne/Ey8KcjMmtVS1clls6O7mimBhGtYnZPP5JwHKaqDq9j16V0/36qUAc0DWdMQPiTvq3H/grXRx0d65k5/9Oq7+68d5NdVb9/N/txPAUYALLyThzxsf67tiBDOliZYdj59bAWEEQdjH07Nhw+NAJ0M7H4Cqxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744748089; c=relaxed/simple;
	bh=QrX5BfBQF2U/SMXR4SwmyIo877XUcxmuZpNerm61EBw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dMrV1KShqbchISSHr8Xf2On5cn5PMNDwx2j+qDbx+OonIIFBK0tnOGeRzHx8BWMIt8QGHXPjz18D/21KUzMpe+uMh5RxrxH266dPdF6vk4vLDg2k0wbDgdabyMEVE2uWZurF+RzR1ufCVALC1q78NpsXgj9puvRkTNr7QM7qhyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jNIsvbHw; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54b166fa41bso6987415e87.0
        for <linux-media@vger.kernel.org>; Tue, 15 Apr 2025 13:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744748086; x=1745352886; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QrX5BfBQF2U/SMXR4SwmyIo877XUcxmuZpNerm61EBw=;
        b=jNIsvbHwjuNecxt9sfUqWRrXZHZVY9H/TmkKKOfrPtKT/W+PrmYegcQ7QFbd2llSBq
         Di0EVYgI3dGgYP9khNeK8KA/qFyAQcb+FBfBzfU0Qqgnq/16vxmxueNFdhMJr2Jr917e
         Bn7wpcFltZaezumbPf/kkjDd0I6brq/+EVGM2/uV2LEwAuFm0cwjt0oEhXsibQeQLWez
         CiOYTi2xlJ34y33YaEHQHynSnT18/bSvYaLoNMwHPJjNR9nkjChmaUoRpe1ZHZuW2a45
         p2ONqVarokSbYodd4b2DliuwCUoZ579F0uJcT5USqlx5lX2T5kVQztD1UPzRwQi9mTS5
         d5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744748086; x=1745352886;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QrX5BfBQF2U/SMXR4SwmyIo877XUcxmuZpNerm61EBw=;
        b=rjoQvasH1/icaINoTmXHrHFjq5gdKKlGMIk/dB1jQEDwDQ2Cye4xb5QNvzFU/tTV3h
         iaqwBgtyzfIdbkgNHuki4dgjCa8S7vw4pskqrrnVZsykCI7ZZ+VJ6ydD6Ltht2eH22Ot
         9JnPIbLupDt9VBiu4IodiVqXbjFL4dTm4Yb4eumYfV34NFCc4tRG0yz84hUzvfa2HQsX
         laOKppDJfRp/abEcVo72N6pr49zcaZ5GWY0rcFPtky/hxCOoQ1qjTFNS6cc/9Jvb7KRd
         V+jHVwlqgT3AgqVQDVspDrRsU8GwD9CAdeBAQZV3WylnMr8+Fsxp6lIZmll1uzD4saKr
         3Shg==
X-Forwarded-Encrypted: i=1; AJvYcCXLkXA+Yxj3Mj8XRkdLUAKmOquUlQKxqMmhBkQ6Fz8Qu+ikcQ37UDJms1k5ZiYFrNZ72xr2IqiQhdbsXg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0+VjYVtHZ5ht///5ft/6WH02Xa2ivmXxdpjI63fjjSvkwD0xH
	gfaAH43tg353UxJol59VEaDE7h0kfFtFDQE54rRmUJlJ31lNszCZgvx6kgMLSMtZNka8sovgh2a
	CNV782hhCa4c9aTUA79akrO0oLHVm8crmPFI=
X-Gm-Gg: ASbGncstwrfGwXb5FdGesYeNj6w/83GwbMXOvZctq+ODIAr+6S1E9uae0fO/yU4w/v1
	wjBZw/bWqb7vKjLywYmltVyPMjrlj7NCYwhaDTQiNERRPjhQ1SnFNPaM39Rd+y0zJMhfSRQLx4i
	g7QYqMkurkjNdUs9oScas/zrmYg0lTDwlVP5eDib0j0s8eyAxMGrU=
X-Google-Smtp-Source: AGHT+IFmjn22DVWrD3J6egNzsPL6Ng3PyVECAR9T97KHvP2G77xLiJ5TWGIYssFAbUDv+TSvWv030sUAs71yMgQvDH8=
X-Received: by 2002:a05:6512:3e17:b0:549:733b:6afc with SMTP id
 2adb3069b0e04-54d604ccf4cmr100825e87.12.1744748085535; Tue, 15 Apr 2025
 13:14:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415171954.3970818-1-jyescas@google.com>
In-Reply-To: <20250415171954.3970818-1-jyescas@google.com>
From: John Stultz <jstultz@google.com>
Date: Tue, 15 Apr 2025 13:14:32 -0700
X-Gm-Features: ATxdqUG4dYOEgBpq3vBJFjWe22Y7nhXg-DziqAyeOFw0AhrMx6YFrW0nd6Oh9O8
Message-ID: <CANDhNCpK86yKWTUkXV5oK6n7gTmeNDn-NsDppBjObXPEMwD44g@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: heaps: Set allocation orders for larger page sizes
To: Juan Yescas <jyescas@google.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	"T.J. Mercier" <tjmercier@google.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
	baohua@kernel.org, dmitry.osipenko@collabora.com, jaewon31.kim@samsung.com, 
	Guangming.Cao@mediatek.com, surenb@google.com, kaleshsingh@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 10:20=E2=80=AFAM Juan Yescas <jyescas@google.com> w=
rote:
>
> This change sets the allocation orders for the different page sizes
> (4k, 16k, 64k) based on PAGE_SHIFT. Before this change, the orders
> for large page sizes were calculated incorrectly, this caused system
> heap to allocate from 2% to 4% more memory on 16KiB page size kernels.
>
> This change was tested on 4k/16k page size kernels.
>
> Signed-off-by: Juan Yescas <jyescas@google.com>

Seems reasonable to me.
Acked-by: John Stultz <jstultz@google.com>

thanks
-john

