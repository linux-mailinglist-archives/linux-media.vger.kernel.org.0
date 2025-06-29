Return-Path: <linux-media+bounces-36197-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B6DAECFE9
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 21:13:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27C89174B82
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 19:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48A722405F6;
	Sun, 29 Jun 2025 19:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D5w2yU9V"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F163123FC49;
	Sun, 29 Jun 2025 19:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751224307; cv=none; b=qYUHbk91f7wy1EFu75iGV9/Etw9cgUuRpQVCSanHsQ7n1Wt0lfHEiXGu6945WuPKGzLHmpIKx/vUXz1iA+rmVlgvGDvTUDbU1WcT1qCreHZH457AC3uZCiSAjB1bjtgYRk4FHp8DSYw7y2xCAmHto0IgyKKvGMEP85igGky6JFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751224307; c=relaxed/simple;
	bh=KIuW9sjx4dcbvHL9RVmzBjBUM3fm9MxRJEUqHt3Why8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NLN0i/OYS9ab/5K14UpiVcuhRSOtu7G1vgUf4s5ai2bYIZIv92WSahbtetyTBGe0DiJ3QJNUo3QIIpC3uCoo3p2OHp03pgtx44vt+Drc9qxjz+dbK9kYYhIl92iYGN0MaLi5O/eM9XPtazSuST8kF0Hv0NPt3wU3dzu6lZrqJ8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D5w2yU9V; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ae36dc91dc7so233998466b.2;
        Sun, 29 Jun 2025 12:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751224304; x=1751829104; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KIuW9sjx4dcbvHL9RVmzBjBUM3fm9MxRJEUqHt3Why8=;
        b=D5w2yU9VZJ1ZAooiVmtUHJ50gSCS2/wmDEVB8xkfWqPddcev9cyb/8ydYr6pz6Fl3S
         ph+CpFWsDZzNKQDPdx57QRlgMYEL3QO8d7dcp8sRoXONVzTVvI3ZHJf0pqsKRHzzxPQj
         3SLwJTJB9pI/xEKtNMp+bGCgeUMzzpp7SQV1tHK8Bm8ir+kaFr7gKeqIHy3bFeChW7GL
         /Qqt0kNE82muR14qPfB8qJymg33ik/KoVo2O7iznj/CrkpTj83vo3VL8kVQ/DczpvfGN
         U7mjMqnbScG9nZD+fgh0gNToTHAO1qeAfU5znYhqjIA0V167oD8BVUJ2vcOu94dUbpWl
         /m3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751224304; x=1751829104;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KIuW9sjx4dcbvHL9RVmzBjBUM3fm9MxRJEUqHt3Why8=;
        b=PvwUceTFc9T+t2PjOUw7X770OBrZ0JlbV7FCyZ7MqjkZCfS42UblLKKxfm1pAwLD0A
         qUmkCCRfhtySqeOqeWIMZ7MCRwthrNuyeVoRqaPjYGcxt0m9PG1EAOiv9c+QbIRCeLzC
         siUFSfuIJ/2wla7c7OdrKIo61z2bAQHO+e+7k/62fb4BflE/Z6JFDzSHTkNc7GIcxXWu
         pgYKmrQcNgFDHsrAZeExqOqcnwSdmLvwhQZvG6v3YsKOv17sMojtg59IqjhjISSAk2I3
         57xY1MhDJugNDraV26SucFsTSSVxYxaWt+QusVf5+VM17F4dUuiLiNM57KZeM753umEf
         66/Q==
X-Forwarded-Encrypted: i=1; AJvYcCV571ZgLdo0YSfEpGh5PPXmH6Ryrv9wgKDHawUKe9/JfqUS5vAVJnMfgCQoQJrUeVqwT2og/m29LOkBYg4=@vger.kernel.org, AJvYcCWwCAWkGeaUltse4dmGb6EXozQEGWtuzvSBnvTT0aCreGh/BNVnAsJvB8NP/VXCLb1HFlJqOVf83/d+HtQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQIGm8IRww/m63pSsxt1r7mf6S/ndGembkGyPqbFoCJvdm9/Sk
	EJJBGpaQdYIRe9uNFXFvILB+Tunj5D3smaEaHjV8Fzk2RQVNWnducObacAt00Je9OlTHFDhUmqL
	KcA5aPThYGxnEmVln2zuX9KTRIFLBj6c=
X-Gm-Gg: ASbGncuaiTKBBTj32MwndlGaJjK1G3BMGnRZzpxaxg44fXI3qSpqBn4wUnMPg1BWiaf
	mZeWIwlDRUdfEI2Kxx4va3igyCPe1YPHtDM/71z7v+2FcMyjVz5TFK5W9iBnWzc8cPyWeuFHO5e
	zt4kmijl90n4nB8Qu852Thvcz00cHE5EVNDfu5qc1FkI8=
X-Google-Smtp-Source: AGHT+IGe/ajxK31MAPrFTYR3q3cl77r0rWbJzrwAwVbOdmeARB/jCZaAJCpV0Yy/6WYPlbf+AudWc2QhY3x7eVnHktI=
X-Received: by 2002:a17:907:1b22:b0:ae3:6744:3661 with SMTP id
 a640c23a62f3a-ae36744387dmr617057066b.44.1751224303820; Sun, 29 Jun 2025
 12:11:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250629113050.58138-1-zaq14760@gmail.com> <092f5109-ca31-4949-bda8-7e0d946c3aa0@kernel.org>
In-Reply-To: <092f5109-ca31-4949-bda8-7e0d946c3aa0@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 29 Jun 2025 22:11:07 +0300
X-Gm-Features: Ac12FXyOA0o2IpCk1vTrAEEanA2XeDyWAwBQtiRP0ln3yoGv0i-yIsp9xk2rAb0
Message-ID: <CAHp75VfoJ17a=3P3fXHa2mN00S+hdz-vRtLfjmsT7-+i2NfWEw@mail.gmail.com>
Subject: Re: [PATCH v7] staging: media: atomisp: code style cleanup series
To: Hans de Goede <hansg@kernel.org>
Cc: LiangCheng Wang <zaq14760@gmail.com>, mchehab@kernel.org, sakari.ailus@linux.intel.com, 
	andy@kernel.org, gregkh@linuxfoundation.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 29, 2025 at 3:20=E2=80=AFPM Hans de Goede <hansg@kernel.org> wr=
ote:
> On 29-Jun-25 1:30 PM, LiangCheng Wang wrote:

...

> > Changes in v7:
> > - Split previous monolithic patch into multiple smaller patches
> > - Applied clang-format to entire driver excluding i2c directory
>
> I took a quick look at just the clang-format patch and looking
> at the bits of the diff which were not collapsed by github because
> the changes are too big, it looks like the changes which clang-format
> makes are useless and often make things worse, e.g. just looking
> at the first diff which github shows for:
>
> https://github.com/lc-wang/linux/commit/8a3bbdba275e42dfcb0af2ddcc2f27463=
bb316d2
>
> which is for drivers/staging/media/atomisp/include/hmm/hmm.h
> then all of the changes are undesirable and unneeded.
>
> so the running of clang-format just seems to make things worse.
>
> I appreciate coding-style cleanups outside of the i2c dir,
> but it looks like you need to do everything manually since
> clang-format is just making a mess of things.

Yeah, that what I was afraid of. I don't know clang-format well
enough, but it might be that tweaking existing .clang-format in the
kernel can give something better.

> Also if you do manual code-style cleanups please do one
> type of cleanup per patches, e.g. only fix indentation
> using spaces instead of tabs and do so on groups of say
> 10 files at a time to keep things reviewable.

--=20
With Best Regards,
Andy Shevchenko

