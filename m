Return-Path: <linux-media+bounces-8155-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33570890ECA
	for <lists+linux-media@lfdr.de>; Fri, 29 Mar 2024 01:00:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB3561F23032
	for <lists+linux-media@lfdr.de>; Fri, 29 Mar 2024 00:00:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0906D846D;
	Fri, 29 Mar 2024 00:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pBr2MLfh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0DEEC5
	for <linux-media@vger.kernel.org>; Fri, 29 Mar 2024 00:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711670422; cv=none; b=XJo/W6wfuGB6xm9HXusbuhDg+lNqocvivIzxdGeiHJ+XojTTrVxbo5Yvo+2vrevhZS2hixAmPA11tLTqNWWEt2KZnw6pVU64SSi9E+LQUqdzKK6jnu+YdchU3VBVAuYS3bz0Vd1Evnrr35bay8C3gQv1bSy05fNNWHLbbwyFIMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711670422; c=relaxed/simple;
	bh=T11tKOiumhan7/aJq4T1XnpxT0P/7w0lhoUT1uDz5xc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g5z5BIa7vfTWcOg9OAEjGDa9+WT698GVLjRVwF2GnvZ30H5418C7pUYEDAHGM/uOu8XiuAlK+CDZEAMnwdHPrKVH2XXk3JPlNFs/tpdA37Oih+7RdVtD6UNfyKha8kaeOFFK2oxev9IjgeM861nYEnVxbD7/Bo9XFfCZrnrWAUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pBr2MLfh; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dd045349d42so1485214276.2
        for <linux-media@vger.kernel.org>; Thu, 28 Mar 2024 17:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711670419; x=1712275219; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T11tKOiumhan7/aJq4T1XnpxT0P/7w0lhoUT1uDz5xc=;
        b=pBr2MLfhvMUStzof151jmDBPoDuxmWoDcbB+JOWt1oxnRuZSBFjbVdLXYRnqzYw3nd
         P6OmUZnsiU+wtDW2xQ2LP8oHzEXw+7Y1jryQ40pT+ItZjCrWCNunIoVgN0MZ8qXMuSKd
         G3Gs/AHyZ37OuPIaxFdtFbFPY4MqRClMGvCEZCXctSfRKgHDRBJ3a9kc3DTGKwsoS3SC
         NycENPBJ2BpjVIlPs1yFECw+Wwk45l3G6kueZq72FiBG5A+qbNue05aQF4cckMsNjlxO
         mLj+l1TKP324ka/M6DOCfg/5Hh9qJpn79Dbf0s9cSz8Z5i5gugRGosrPrliq4pype/iB
         2GQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711670419; x=1712275219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T11tKOiumhan7/aJq4T1XnpxT0P/7w0lhoUT1uDz5xc=;
        b=xR5H9b1+hWPeVBZUAw4eg623jbls2skmva9n6ijwS4BV4ewpFV5a9iSx2Y0em0Mn1b
         KGnUdurLmDjGMIKNFQIdqjrMCUJFZbxMseEcfjaNGCLeU8cxMwRbYYT1nF3jbPngGaBz
         L+cqSbhkyn4CiHOlXO9OWAOsJ0Upu+zZ1txAdgJ7d9D57c88sXe6hUGnrqdA/IqvU0kj
         qjVgam+Wyn6bsMitkoUHo14poF4fKNpkV/EMRRJv6l6zUm471EovAJMWmN1gFROvv9yj
         Cy6OUDb8VaLqAfT4nVwYShFy1n5aNoow3PnOP+fSZR6OzER+JwG1XK9mrHe5h4GkGvU1
         EzTg==
X-Forwarded-Encrypted: i=1; AJvYcCXI8fB7NYqFpQ4RKOrbojx30AogsvBjTUzC41oRF/JS71RaxAF0R9+PssVu/kVztRixKFZJ4/5aFcYWsWeD9Abhe+Io6rIeQ7st1mE=
X-Gm-Message-State: AOJu0Yxg0BcdR87DuUMJ+dkQTY8qYe25/aqI0mZQpvVCYx3i0cy1mH+z
	7LM4gwT8HxyaVV0n4a9MHEF82ol+bFAUOqp5sOe+TtXqG5O9RYAFc/Aq7PBe8PKfBiLn2wYeXgh
	66oO8lQNSH62EeUdhIuWiQSJXKPePDgFJZsRO
X-Google-Smtp-Source: AGHT+IGF3VENnshqQcApg+O/wjOuPYywblLF9c/PO9GX1CsUXA48nDaHFlPvXqTRUPIpQ75kg493PggsfmaoNGiJqu4=
X-Received: by 2002:a25:9b05:0:b0:dcd:2f89:6aac with SMTP id
 y5-20020a259b05000000b00dcd2f896aacmr820996ybn.10.1711670419054; Thu, 28 Mar
 2024 17:00:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240328145323.68872-1-tursulin@igalia.com>
In-Reply-To: <20240328145323.68872-1-tursulin@igalia.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Thu, 28 Mar 2024 17:00:06 -0700
Message-ID: <CABdmKX3V3HGA4mNQvqHqhcLqyr-A5kJK8v9vmuDybRvV-KsiOg@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: Do not build debugfs related code when !CONFIG_DEBUG_FS
To: Tvrtko Ursulin <tursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tursulin@ursulin.net>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, kernel-dev@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 28, 2024 at 7:53=E2=80=AFAM Tvrtko Ursulin <tursulin@igalia.com=
> wrote:
>
> From: Tvrtko Ursulin <tursulin@ursulin.net>
>
> There is no point in compiling in the list and mutex operations which are
> only used from the dma-buf debugfs code, if debugfs is not compiled in.
>
> Put the code in questions behind some kconfig guards and so save some tex=
t
> and maybe even a pointer per object at runtime when not enabled.
>
> Signed-off-by: Tvrtko Ursulin <tursulin@ursulin.net>

Reviewed-by: T.J. Mercier <tjmercier@google.com>

