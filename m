Return-Path: <linux-media+bounces-23116-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4B69EBE08
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 23:47:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06870167D78
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 22:47:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB1851F1911;
	Tue, 10 Dec 2024 22:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="jNh7joti"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C53F2451E1
	for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 22:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733870857; cv=none; b=qt8gS+44h5nTfkb4zHphxpqsgrzRsPRlY9nIPgjcwR8i+CQ6G3grPhnHKqIRAHeMxGz6yswfGHiY/ONsb6eqLIazHrkwe2rMQEnGQDx7qJl8wuKB7ScI6JpRIavmbQuy2D2Z0NrMUtB1VlogpgAxidaczbmoFeoEC+3x86egtyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733870857; c=relaxed/simple;
	bh=4J09Nw/NprO0mzMLrBQrv1UzfclOZD/Gt04pVU1Y7CI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XLLUAwAf+S2OJLCGCmhj/2mdWq/t0vbmCEX4F+GhsixTFWdKJORErC2/eEc99vqKoGDspljb0B+Sg+d2UuqJSsH+DxgQiFGvImPmwAbqfCq9Quny7Hk9jfXUWUfjuHUQpNL8yS/lf4NlsBHZWxgsApHP6Yy2+KCUKkn9RE4NqE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org; spf=pass smtp.mailfrom=joelfernandes.org; dkim=pass (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b=jNh7joti; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=joelfernandes.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e3990bbe22cso5048113276.1
        for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 14:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google; t=1733870854; x=1734475654; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TWBkyRYQGMDGc5eLQDuZCpsdffQM6naQ0vYyr7n61vs=;
        b=jNh7joti2mNXbonLdEDqzPGMd7U6/LzNQTPj90bamPyKjfB16hnNax1kMLGyuvmkjy
         /g8PwnTGt1V3g1vCwSsAfqJJIRGseiE7upazEHZUphde6jBRYJ3wGfEZuYSQNmUQqrUB
         clsr9xXmy7PVE8mkpRlu3IY8znxDmJNwVSdOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733870854; x=1734475654;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TWBkyRYQGMDGc5eLQDuZCpsdffQM6naQ0vYyr7n61vs=;
        b=Wh1GGJX3lyuxxdpRiI3+JS38WbJ99PTKmqGYw9uXCgopkzwbZunsY05W7ItBmDWJ3m
         jGPzS4fHTF3UBeVHRdXxidOisJr2UgQGlnWCe6rysA/gDO+UzN1C2IGInZ2R70diHzIl
         e/PDAndOFfs219XRCYonqoTcS9dbBahgjRRdVYiDa8LWex3uHYxw5WPkdTnZBH3Swj1M
         ZuYm2As6FXUr4IA1kIrMAj4JXR5fE9fYXh+5R7s/0n0swhUeoIl4SA60ZhZIZ+fn2BkZ
         iPNu1ceKC2/cKs0RvGLnyiGJfMVT6IPAVYB3rcVSEwKEYN6txyEYk8gJlhN3ZoYvjzcs
         0Pqg==
X-Forwarded-Encrypted: i=1; AJvYcCXUL32dASLFjQar333jTIJ0GoQ2EcIA/K3PQpGoD2OL/Xp4M2y9ipcMrmGsswhlT+HQP2H+nBvuoFLzig==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQsTrGbJG8ye4pRw8j1j+cwK85yMKTijUZTQ/hunMdQY0hvafi
	yn79js//qS16uLKqtkQkaGRjPLWw7Lp947KyCEvM2IO5GBZyNSCRhrT2MxsK1qbMQxmR6NYqp4H
	g9285da1iBNK8fQ1PZh+ezRNKo+Ui39/kC6yDNA==
X-Gm-Gg: ASbGncvdgD2+ieyYIojsLY2Lb8f8SlMH9/OhMCECidGhHF2LO+5eHRoSiyhEbAn8g1P
	zmP4fC+3GtMeH460yS1vgR1Sf6yK98w2sLJsU
X-Google-Smtp-Source: AGHT+IELsZuOhax2WDfAjwRl4rtBxQdB85wP9bCDDJ4eUK3hc/wYzDqJhKW371nUrhtu9bZHAkwmulfL19gZbIScI2s=
X-Received: by 2002:a05:6902:2b85:b0:e39:83ce:6fb3 with SMTP id
 3f1490d57ef6-e3c8e4252ffmr1233132276.9.1733870854603; Tue, 10 Dec 2024
 14:47:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241204-udmabuf-fixes-v2-0-23887289de1c@google.com> <20241204-udmabuf-fixes-v2-2-23887289de1c@google.com>
In-Reply-To: <20241204-udmabuf-fixes-v2-2-23887289de1c@google.com>
From: Joel Fernandes <joel@joelfernandes.org>
Date: Tue, 10 Dec 2024 17:47:23 -0500
Message-ID: <CAEXW_YSd5yv4n4UMDfzKNgVZ_TWikuS_6HHOs0suYwUiVqNnJQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] udmabuf: also check for F_SEAL_FUTURE_WRITE
To: Jann Horn <jannh@google.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Simona Vetter <simona.vetter@ffwll.ch>, John Stultz <jstultz@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 4, 2024 at 11:27=E2=80=AFAM Jann Horn <jannh@google.com> wrote:
>
> When F_SEAL_FUTURE_WRITE was introduced, it was overlooked that udmabuf
> must reject memfds with this flag, just like ones with F_SEAL_WRITE.
> Fix it by adding F_SEAL_FUTURE_WRITE to SEALS_DENIED.
>
> Fixes: ab3948f58ff8 ("mm/memfd: add an F_SEAL_FUTURE_WRITE seal to memfd"=
)
> Cc: stable@vger.kernel.org
> Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>

Thanks!

Reviewed-by: Joel Fernandes (Google) <joel@joelfernandes.org>

 - Joel



> Signed-off-by: Jann Horn <jannh@google.com>
> ---
>  drivers/dma-buf/udmabuf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index c1d8c2766d6d36fc5fe1b3d73057f6e01ec6678f..b330b99fcc7619a05bb7dc2ae=
eb9c82faf9a387b 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -297,7 +297,7 @@ static const struct dma_buf_ops udmabuf_ops =3D {
>  };
>
>  #define SEALS_WANTED (F_SEAL_SHRINK)
> -#define SEALS_DENIED (F_SEAL_WRITE)
> +#define SEALS_DENIED (F_SEAL_WRITE|F_SEAL_FUTURE_WRITE)
>
>  static int check_memfd_seals(struct file *memfd)
>  {
>
> --
> 2.47.0.338.g60cca15819-goog
>

