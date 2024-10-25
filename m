Return-Path: <linux-media+bounces-20282-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D97219AF8DF
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 06:18:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1E411C22238
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 04:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C67A18C02E;
	Fri, 25 Oct 2024 04:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="G0QpYAJC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CCA18A95F
	for <linux-media@vger.kernel.org>; Fri, 25 Oct 2024 04:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729829907; cv=none; b=XyOpuwNqkK7F156HYy477ye8mv+6HlgPeP1MifPO+T92zRcA8oXjMCUjfl7qq4YL3OyTlBOlKdevv94dKVysjqQQVijMqxwp1Rl9Xh5jRNnct8t2vlkYzDnq3fHkkxricyBkUVmNUAEpOldbL7YqP/pOPzHaE0KpLfXF8Mfig2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729829907; c=relaxed/simple;
	bh=xLStGP6P+l4C1pjJlP+qdE8pO+4C33dfWY0iB7dywKE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NHpXumRTEqRSYzmdyd9duPRdi08ItMGogCwEMuGgbmw3PCz4NeOqDlZeXu6haYOlDw36Jm4SVGwjNkq1rH9HOTclyEYM55Sf2CI/0DtRQvbiwTFw83iMsKMBT3IVG1k977x6CeRzsU+siVk+nYpfYCoNaxxp+wmYa/NgoMzpIeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=G0QpYAJC; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-20cf6eea3c0so12946715ad.0
        for <linux-media@vger.kernel.org>; Thu, 24 Oct 2024 21:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729829904; x=1730434704; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/uZlNEnkTHOQ+PNtUz8vKS5fOPu86vMgVA3QrlLpq80=;
        b=G0QpYAJCevfAYZceX/kocKWn+hxDRtGrt5PDGxJZdlvWZ7u/eNotF8/tRitufoFkat
         rVM646Fj+Z4TkfjVn9/Jjo8DOd8SSmBfcSeL0lbQ46Nc2PlYBvP764h1y5cNyYg3IaGx
         DYCWdeZYKmJCrLwIEvqpTZbtK35TdQkGrRNiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729829904; x=1730434704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/uZlNEnkTHOQ+PNtUz8vKS5fOPu86vMgVA3QrlLpq80=;
        b=lOsosoQQvVpP5YdOXbY0sd/vVPC7Fw9iI+UCq8i9f8jCeaydZgJ95QJSZRd94dJyEV
         WoFTOWbLuudy1nfhiHjc0S2Y8PAg81/TkpKAxjucUjE540TvVTMs/ykYai561ea1j+zI
         ARFNshKyJna/w9ff4vdB4JhyxYZONam3Gf29/OpzkHNIa2KZXG9gDtXfNJJjSNNWSA9F
         elFVIxbsZN+RmgTITYsqJbGafqXpwrahlsESZpBDnEcgtHFfDO17B4ru+KyNmuMSSJD6
         i8oL3mvvg8+aMWIe19v0JIetL6jkkWzyuqkER5lSisc9fAiNf9qt6Cg/Sr6F+8jFB8xX
         LDeA==
X-Gm-Message-State: AOJu0YyBdXtYszfycZQh1w1PVPfNuUX8T9j8F6thU7Tj7BY1KRKrYfDb
	nHjpSwcdZCg0rYcvecWMYy2/6zKMbL+eaOIInb+vs00guVO0bkUlMlUvSNvIqwelKpIScFhqNeE
	zDg==
X-Google-Smtp-Source: AGHT+IEYY0bW1Jy/iYFbWeSzjidVyHurv+1ugL8TBIPtSJiX0vbL3ylvq/K8csHdHGQKAUWqhxC29A==
X-Received: by 2002:a17:902:e5d2:b0:20c:e1f5:48c7 with SMTP id d9443c01a7336-20fb9b1c3eemr47478755ad.55.1729829903694;
        Thu, 24 Oct 2024 21:18:23 -0700 (PDT)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com. [209.85.214.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bbf6dc66sm2017785ad.101.2024.10.24.21.18.23
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2024 21:18:23 -0700 (PDT)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-20c87b0332cso66115ad.1
        for <linux-media@vger.kernel.org>; Thu, 24 Oct 2024 21:18:23 -0700 (PDT)
X-Received: by 2002:a17:903:22cc:b0:201:fba5:3ed with SMTP id
 d9443c01a7336-2106fe61c0bmr912915ad.27.1729829902320; Thu, 24 Oct 2024
 21:18:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <5103405d-c560-425d-b307-835896943b94@xs4all.nl>
In-Reply-To: <5103405d-c560-425d-b307-835896943b94@xs4all.nl>
From: Tomasz Figa <tfiga@chromium.org>
Date: Fri, 25 Oct 2024 13:18:02 +0900
X-Gmail-Original-Message-ID: <CAAFQd5D5qi28H7DUhOEbi45eXCAV-5eU5vdHpOXtpuZqZ-YhAw@mail.gmail.com>
Message-ID: <CAAFQd5D5qi28H7DUhOEbi45eXCAV-5eU5vdHpOXtpuZqZ-YhAw@mail.gmail.com>
Subject: Re: [PATCH] media: vb2: fix confusing log message
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2024 at 8:24=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.nl> w=
rote:
>
> If the number of allocated buffers is less than q->min_queued_buffers,
> then a debug message was logged saying that it needs at least that
> many queued buffers. But the test is about allocated buffers.
>
> Update the message to say "allocated buffers".
>
> Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
> ---
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/me=
dia/common/videobuf2/videobuf2-core.c
> index d064e0664851..26228614ddcc 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -2329,7 +2329,7 @@ int vb2_core_streamon(struct vb2_queue *q, unsigned=
 int type)
>         }
>
>         if (q_num_bufs < q->min_queued_buffers) {
> -               dprintk(q, 1, "need at least %u queued buffers\n",
> +               dprintk(q, 1, "need at least %u allocated buffers\n",
>                         q->min_queued_buffers);
>                 return -EINVAL;
>         }

Acked-by: Tomasz Figa <tfiga@chromium.org>

Best,
Tomasz

