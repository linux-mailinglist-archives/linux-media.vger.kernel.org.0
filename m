Return-Path: <linux-media+bounces-29195-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD2CA788B4
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 09:12:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDBD116F865
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 07:12:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 241FE233133;
	Wed,  2 Apr 2025 07:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GqjfrDma"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD94230BD8;
	Wed,  2 Apr 2025 07:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743577930; cv=none; b=tQLNtxXpJVVs1/Dm2fHsQrWr1p8h7uZVNaDRj6vzCSCKy8YxW0xgXqByPgDn3Vhusi+fGTeCT19aiUvRHCTRYP+Za5eB1/TDRZuRaf5vM5wOXiDRa55iBjd+8s43tlI6PjoE4lLa8/m8JPk8rrvXz17J/Erc306ZcQncY3p2+dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743577930; c=relaxed/simple;
	bh=6iFnZi1P6witgBKpE/o6BqeB6+V8t3TakEte9t4WYx0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tevm3I2MxsKAjHSyXcNiYbyVuTqDGMpCPsNs+zpgtl76JEINSgYKZiYLNOvAzAC3IlIojH141MpA4/tZi10BsWbQ76TT1+BOvGUMPPUaWfxc5wcZt0NjrT9//YapJJ28Ca3JmhRdR+JyJA1csFzkI991Eq0Dgc5PS+ZsN1ZZ25I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GqjfrDma; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-abec8b750ebso983975266b.0;
        Wed, 02 Apr 2025 00:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743577927; x=1744182727; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6iFnZi1P6witgBKpE/o6BqeB6+V8t3TakEte9t4WYx0=;
        b=GqjfrDmaaqPh0I4btJyuoQLIZYk1iIRQAefLFcaLh77sL2QICTv0Af2U2v3ZxUmXOe
         ol/fPisFo7eDuoggoM8YA2X7gsKeLC1Da5tfNC6mDsHUSB1ZXxByFsQbljsBi2/g9W5Q
         vwP78wV8Y/AxD7kEfHkHvmiE9yGx+p+rUQceE4Op3cDNhLocill7NXP+ecMG5B3smaek
         hopZrnAHMjLfTwZSoJGgMst9dnrtVJPtmQir8AhmWzSu0Q0zyqvdMHVs++QdVFYpImWi
         TgqAi32EYvd6pOYeVBqqLaD/GHS9qYMdloQ5hFIhd6a3JYlIoLeu6NsSTOLZY6RSz3K6
         oyjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743577927; x=1744182727;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6iFnZi1P6witgBKpE/o6BqeB6+V8t3TakEte9t4WYx0=;
        b=uGqMOmSWhycuDL1tByRAqCBFC1zNXM0VBKWsAumgWokUWR3WEI8guzM7KoFo7Nrin3
         vEekptAZPiU0sXVNQMZgCNI3OJw+5Nhfod9ygnEr39Sp+rQZtsN1uVcMhKwr+rfMu0/H
         JswaSrpU9DZwyTSfDrP1XAgd/6pY/BkOBdg3YOcT0fNbFlx1+WljXoBKwktJ21HSqNl5
         20ShnSwRANw6hGzNeACe5e5LqUqWMorc9wXZmga95Wa39Lb4vLEbjmQV/uIXFYyStOEz
         sTrPXxeVWa2eimv1vxkP1Md+zhc79KB/m0W8oY5f/qoFAFi93gTUMq0fC+U4xRBKKhHY
         o9Fw==
X-Forwarded-Encrypted: i=1; AJvYcCWm6Gw67efvePR3Z0oXjkl7hIz0XIQw6AT+b6nq8euWAG1N/HkkUL5f4qmv9TPHeGQgm0yvTHvKl93FhE4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGWz6blF1KNZWfg0v+1FO6687vIP8aDOV9Gwf6h8R9a0LTDokm
	MAFYVzZOL4q+GfaHToz/acAY7TrSncBwMMkESR8RvJ37RtdgyK06e0sxmXV2xeavQeirZujEx3J
	53y8rqc/QtBM0LOm/24q+agt0bW8=
X-Gm-Gg: ASbGncuHlAOuBw7O0gF1jv78yDin3RqWtATEC+qymIjFXa7i5X/q1h5RH9bv8DLaerl
	/yTJXAqnMa/tgu3QxeclE7l5rLd7+BeHCBWsWP3MC0SXIjVzMkY7y288OrHfCjm+7XlmwzaRROT
	OZ2cFx1YcQ467zAGuBD3BUvHfbLA==
X-Google-Smtp-Source: AGHT+IH3BWLD3tLCVWSUmZRZKrED9lsK1vHEHE8xL52TPa7BRnKW6uUV4Ea/o9T4grQl94+wGXUom+Ok0bulUsWSu9o=
X-Received: by 2002:a17:907:d91:b0:ac3:c05d:3083 with SMTP id
 a640c23a62f3a-ac7a1799930mr91105166b.35.1743577926958; Wed, 02 Apr 2025
 00:12:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <67eca38a.d40a0220.22c3d5.88f3@mx.google.com>
In-Reply-To: <67eca38a.d40a0220.22c3d5.88f3@mx.google.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 2 Apr 2025 10:11:30 +0300
X-Gm-Features: AQ5f1Jr8U5LUwv4hCvfjsR9vrE7hdyKZzBftIfbzMD_OqPBdJ50H1aovTJj51OA
Message-ID: <CAHp75Vf4abzcNFwo2W-=-fOr1_j51RAUPxDbGNVX9F-Soxbs3A@mail.gmail.com>
Subject: Re: [PATCH] staging: media: Fix indentation to use tabs instead of spaces
To: gshahrouzi@gmail.com
Cc: linux-media@vger.kernel.org, andy@kernel.org, hdegoede@redhat.com, 
	mchehab@kernel.org, sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 5:40=E2=80=AFAM <gshahrouzi@gmail.com> wrote:

Is it your first patch to the Linux kernel? See my comments below.

> >From d6a08153171ac52b438b6ddc1da50ebdd3550951 Mon Sep 17 00:00:00 2001
> From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> Date: Tue, 1 Apr 2025 22:04:25 -0400
> Subject: [PATCH] staging: media: Fix indentation to use tabs instead of s=
paces

First of all, your patch is mangled. You want to use proper tools,
perhaps. One of which is `git format-patch ...` and another one is
`git send-email ...`

> Replace spaces with tab to comply with kernel coding style.

Change 'tab' to 'TAB'.

...

Change itself is okay, but is this the only one case in the entire
driver (which is something like 100k LoCs long)? Even though, and
while for the training purposes this is fine, you can also think about
checking the common style of other functions, which may be shifted
with TABs, but still having not enough spaces or so.


--=20
With Best Regards,
Andy Shevchenko

