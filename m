Return-Path: <linux-media+bounces-44650-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36747BE13A5
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 04:15:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 811AC3B2903
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 02:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0AEE1E5207;
	Thu, 16 Oct 2025 02:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fT5mbzuA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA26946C
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 02:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760580936; cv=none; b=oCqB+66R+1eSVjcS2UnuwB94v6vVzSqBzb5ncHR0QNo7BaV29QDWNpwyaCdqyUHByxTkeHIoP2PWqiWNVKWrfyEACoJA+MUMtsAgJ8amEVijR+ew3Jxt7eT5pB+E/Dgq/ErXb22dXxU/4IiYrXLw3NpHqWwgVCNrWSkS+2uBEb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760580936; c=relaxed/simple;
	bh=67S2aIF/pfkOX5K2acGDT1zOvhxTeuM1fCJ9Zi55c+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UEUy5LCdeVbvwrHvozbEMmIhMG2fnBwv1SWECmqJxGWGupAxysw+N9/pmbbl7G9jbvswJ1ukXuC6v56Y5uGnSis0VJWXu2myOTMFMmvI1X7QFzKdPyIMdE8FJ7xNITfN2rbNbCHaVuO4xBCct9X8Ju+QHOf1PcMP829QkUNgX70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fT5mbzuA; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-27eceb38eb1so2457025ad.3
        for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 19:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760580934; x=1761185734; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=67S2aIF/pfkOX5K2acGDT1zOvhxTeuM1fCJ9Zi55c+g=;
        b=fT5mbzuAmxD2eXvzc367v/kjGlWToe/KaxukN8gEX0JqPkCenaRG12L1Ias+sey/K/
         eS9p8HtqLUcA1LKQMwphFi2CQefL+pFrfYZK/cJB1IYc8GZJv1mHqqhTW1s0pV5Y7Pal
         JRbGPE0Y4GzXv+NIAB2nD0Y5tfMTbMP3QxdXpsdxtalpmtCkdb4O9EmQHvtK7vbPROBT
         Q2Zx5wPKSxaxmR9kjrXu907pN2HAo9uL0T4eHQyoaGlyQ2objTDe5uNuWXHs9oYhKHio
         fuA5PbI5KpHc2gGK6H4Jt4kWsG9I0iHnKaNft4N+9RCYtZcfX2SzVZfviVs2HDnSODg3
         Qlkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760580934; x=1761185734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=67S2aIF/pfkOX5K2acGDT1zOvhxTeuM1fCJ9Zi55c+g=;
        b=T3RJO4JKTzYeocf/u/zlEbkz1o7enhrHp+/4CGOFDSpA/NSA8ytgr1H+n4AEpCbd4z
         1PGFzHK4YqfABfMrHEIEk+3GPULEn7u8tTGy3JiIKwwjaMObTfZfliAkAZIToEcEjdwM
         6sbeGalWtDPyix+RXBoGTBCedb9ZuUnDrjzECCzb3IaSM0u29tqNISY5HwyM78CJBO8o
         5xkhWdsmlEJfBfJEMNySqMPDJ/qEmpwMFBHW/A9EjZNYGiQVrTR/pu0LqGrMylGmDEKW
         nOsm2ltWlo+o5KscsC/5Mvf1TP7ftjLwtk0FTARBIlfSJT4Z4UdGwO5VuylRTrrhMIZU
         2o0g==
X-Forwarded-Encrypted: i=1; AJvYcCWK81vD5zOyYB509NvY4o4riqKEmsd+66yQEynVEr+SXkbSOaaNmBCEcq+EadCCMl8h47ycZ/CJEsXttw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXnD6COGyzNg4RFtOH/62jIdycmwdHVrRCTqDd8SSNfVMq3gw7
	OFa83RMAajQl/MRQqFIsg3O0P4dfj9bT6f/u0C6S2Xs9Z03zteF/e2DUJLL0T+O+gPC5H0z48tX
	ZKSvAxdL/4GnBbzpYvGN4ptdlUnJy/J4=
X-Gm-Gg: ASbGncuhna3TLh1nm+BKyXmQp/M1ZjVwzqjgJpmDri4RYTwCcT0RRZ9Vm4i5RALd9RL
	vK32P0j+s5Tayj3RDvAAEO90AxAG1gNx2f/BGPn8fmQK1s/IubeVqKvMUns4J/N4z1id4WKcY0k
	4hbn3jb5OFaScQr9r+SIHe+ZQE/kjDyK79cMxX/arJY5q1p4HIShmyvY2+No+JGUduC6B17Hldn
	r+2UOKxNegBy2Jd5jOAvrXxERMahQ9gf6/VqpkNrR9LqF31qBvxG9keZqab
X-Google-Smtp-Source: AGHT+IEvRoOtfZkD7JBaJ7rZGlNV110A7XDi8jf3vUgY9Fd8pd0a5HquzKeGR4HlB+RP5ldM64qTIlUt/S7CQGX+WI8=
X-Received: by 2002:a17:903:1447:b0:248:ff5a:b768 with SMTP id
 d9443c01a7336-29027356a2cmr375723705ad.10.1760580934134; Wed, 15 Oct 2025
 19:15:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015183402.1649988-1-kriish.sharma2006@gmail.com> <aPA18fxQW398WHte@archie.me>
In-Reply-To: <aPA18fxQW398WHte@archie.me>
From: Kriish Sharma <kriish.sharma2006@gmail.com>
Date: Thu, 16 Oct 2025 07:45:22 +0530
X-Gm-Features: AS18NWD2IGlwVYDG7C9iI2e3l9CLdrdvxxJHaMKCdoRSM9GgL7yUi4oi3QL3np4
Message-ID: <CAL4kbRMQCMqnjLq6tXCuGXfGZWMAN+Jn-oQ0Ljzc_WLG3rUazw@mail.gmail.com>
Subject: Re: [PATCH] htmldocs: userspace-api/dma-buf-heaps.rst: fix block
 quote warning
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com, 
	Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com, 
	corbet@lwn.net, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review, Bagas.

I've sent a v2 with the corrected Fixes tag as you suggested:
https://lore.kernel.org/all/20251016020912.1653230-1-kriish.sharma2006@gmai=
l.com/

Thanks,
Kriish


On Thu, Oct 16, 2025 at 5:31=E2=80=AFAM Bagas Sanjaya <bagasdotme@gmail.com=
> wrote:
>
> On Wed, Oct 15, 2025 at 06:34:02PM +0000, Kriish Sharma wrote:
> > Fixes: 1fdbb3ff1233 ("Add linux-next specific files for 20251015")
>
> The correct blamed fixes should've been:
>
> Fixes: 507211e3c7a1 ("Documentation: dma-buf: heaps: Add naming guideline=
s")
>
> Thanks.
>
> --
> An old man doll... just what I always wanted! - Clara

