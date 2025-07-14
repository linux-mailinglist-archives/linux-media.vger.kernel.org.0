Return-Path: <linux-media+bounces-37705-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A0ECDB046F4
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 19:54:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E531189AE8F
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 17:54:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05DF9267AEC;
	Mon, 14 Jul 2025 17:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HsiuK5+b"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF970266EFE;
	Mon, 14 Jul 2025 17:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752515643; cv=none; b=U1YppGuuFdYXwcW3YhMFuGfJanz/s1AirHBi90flLi6Kn4RV8Uja9fSPTbS4aULJhN84YHda/sJvhALeOarv/0hm6F6dXjjEkPYXwvFC6MrauL0ThO/q9f4vm0ZvTUEC7wq9L7iCujqFxvKB01uOYi06JbH61+fp3A5eXwKWf7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752515643; c=relaxed/simple;
	bh=rEJnYsO7aThmrtI4Y4NwN/xzWZ1RQqHVYInx/S7jT0Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WY0tcWUirHNKmEUp6q7u0kqGeEAKnMrB1hZEejEVZo6zan6yp3dGKUfq8MaJEu14tAYPbzTiVDn4IbBdkq2j1NWkCjS7MafjpGg182iGapqR4oIG//DjCfKBjhbm7ARfBMVgyzoZdc0HL1AsxILJQ2wWAY3Mdhiqh+l+bYaYiuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HsiuK5+b; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-60707b740a6so7093336a12.0;
        Mon, 14 Jul 2025 10:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752515640; x=1753120440; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5BAqcBqjfk8mxQc7/Q5Ppm/61XcxJGDgiWH1KQzom+8=;
        b=HsiuK5+boLcBP6Vzy5lQwQAUDUF2HIbAfnINppWRBEeDN1fmCJs90sokOVaA7gzIjd
         d/q85Gd8cQgFIzvK8VpDAA40/EtX5C1bHDCvyzCgfCbtE2dLesKg/muAY6heQLKUPCex
         f5sCt6D/YCTHvP2COKvqvPcaUITuYIsI9DJcNdsOAHWixSKerEKv/FXMLR0q1NQXqIsz
         B5iJJGlwJGZjOwJD5bWIRrEWjvUAld41OqYIoTSoJVZjArKoUM2RxP60B2n7TmitOlfV
         R1lEMOkCJ/uuoI24rPcYXYCalfrmYJD+McAG9rT8SCBSeWfLST2JfGka7gEThvDyYlfO
         PrYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752515640; x=1753120440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5BAqcBqjfk8mxQc7/Q5Ppm/61XcxJGDgiWH1KQzom+8=;
        b=nMznWpQeFulyNro0AACLkswHGmmFYxJ3zB0ulSQKoKFcOeCObmZKzUz4YpMt0VGHy3
         SdN8/scBNSkVZGfg4jU+/Z23fPGVTK1gV6jKfsPR/vFQ+/edccOda7GhRDFPzRV3HfCB
         gV7Ts2JrXLkqUJdXN2xMWAqOKI4TS967QmDg7U4uReD+2+g+wOViIRDxlYAZvxUYFsgZ
         mEJSvzrZw18WGfkHhTK8g0ZREgC8NfIWHaa19D92AmL0zA4AEZGjwAirzMMgEbWyNo9J
         V4wylNzA9bRp/bdPfow05OHTjeGg8HrnzSdGxh04g0jwiftO2jixzugVkHrlRzi3RDTw
         zTPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWw15vOLspjEIYL+GKR1hmZZwk7mvfhPlIBzlyEBjU+PVzNl6ZK+V/7z22ErNElKkT7i7C2EbXntf91mzk=@vger.kernel.org, AJvYcCX439yW8WsQpwGftDwT4xyHpVLtS1W4PpepxPNmmUEsJXyerWXAnH6qGV3p/eC2jOAFY5H7LKISjI6ZMyI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvw+RB6p/95m6i//74mVzcqt0ToqzLu1JiIq452mDA4DjARYh0
	Jyv44DQacjMmaQuu9Io/cPQptizHdTMM7OCM/aVcbVqb/d1eC5Pp9K3/O+IMw1bN71DtGCp5Pur
	PmgsqcGZ3kYmb/RdOiDvIcw5x3YYhE+8=
X-Gm-Gg: ASbGncuGHXqSa5tZPdT8w02GF/Ud7DNLD3qRB4lirujTIeQpL9lbHe8AzBSp71SufqX
	Lv8ztj73fQprXoEFqbnVutLPmFa6SKjEieb82zphKunAoWA9kYBAgPCQ6ow7JYD+++ovDenMBaH
	O6RXDCxDbzxV9LdvyzHe1+t35co/DRlfGUJLrd4M7y0kxv0ScZWZYxlkJA+j9uRNgql8t1jJUho
	okKSc4=
X-Google-Smtp-Source: AGHT+IG9FNW4SNwWqFdFje1D5etTdMT9T3XjTgRWfU3MakkjxIgXIpoE3Ty603+VSp9VAxU6+9bFAes8QkeS+IuF74k=
X-Received: by 2002:a17:906:6a1a:b0:ade:8720:70a0 with SMTP id
 a640c23a62f3a-ae6fc6fe275mr1336963266b.20.1752515639962; Mon, 14 Jul 2025
 10:53:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250714142645.88038-1-sina.hz@gmail.com>
In-Reply-To: <20250714142645.88038-1-sina.hz@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 14 Jul 2025 20:53:23 +0300
X-Gm-Features: Ac12FXxkUNXyhIJyRHnCUHrp1VxoDR6DYi17bYnDSxnyJZhwSDxKeSLeJRLeORo
Message-ID: <CAHp75VfFiO4U3ge_xGw7JSwXtK0AwHO1hWLZdCv4huX0cey_+A@mail.gmail.com>
Subject: Re: [PATCH] media: staging: atomisp: stylefix
To: sina hosseinizad <sina.hz@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com, 
	andy@kernel.org, gregkh@linuxfoundation.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 14, 2025 at 5:27=E2=80=AFPM sina hosseinizad <sina.hz@gmail.com=
> wrote:
>
> change the spaces at the beginning of the line to tabs

You have to respect English grammar and punctuation.

>  int atomisp_css_video_configure_viewfinder(
> -    struct atomisp_sub_device *asd,
> +       struct atomisp_sub_device *asd,
>      unsigned int width, unsigned int height,
>      unsigned int min_width,
>      enum ia_css_frame_format format)

As a standalone this is useless change and just a churn. Try to find
something better to fix, please.

--=20
With Best Regards,
Andy Shevchenko

