Return-Path: <linux-media+bounces-25261-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 585F6A1B5C2
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 13:25:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5FB16188CF2C
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 12:25:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4AEA21ADD3;
	Fri, 24 Jan 2025 12:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BJgxsdUv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2072B9BC;
	Fri, 24 Jan 2025 12:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737721498; cv=none; b=e4Lm3PPMHz0Lo0CJqN8/ApZgeVEnS/NuAbBGfCQI9BRWnKaSAyit/QJArH9iZlD55gSvyTrU1w/vSaO1LeFDCxTpfUEUCKH/Mse37X2eyOMQsIESre6lvrwXk9Dm3M0WsYvTUyolAKEIe0Zf6ApppNYe1WVs2QT49qxz7YbzZcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737721498; c=relaxed/simple;
	bh=Ez2SUlRyvGQWFaRonAO1AfYboy0jbqyl3K6PdJMFs6o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fdQllXZeqXGSKCEm0QRPrdoEPvGG3f+jVbXhlhFigojI5p6wMxH63ggPzoJWC9bPlqPL7KdR05kl4yCZ0NFhdR2T93kySN27UOquUqMtpPi9ujgBRSddUKGnO07bv0HfFx6cblvJhTcndSHELNSqs1bUL6ad4z78vp8g6zkTAkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BJgxsdUv; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5d3bdccba49so3768696a12.1;
        Fri, 24 Jan 2025 04:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737721495; x=1738326295; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ez2SUlRyvGQWFaRonAO1AfYboy0jbqyl3K6PdJMFs6o=;
        b=BJgxsdUvLZL0idI5DyXBWKM6PEnYQkjdpNkAibgt/qXB1/HLo1y7el9VlCjhahu07J
         hbk4juC33kxS/P+c8aTFXV/AUK8F5a18PvpF0hGywbsx2A4kYczJqm5cbBiV3K2+/0UC
         YqDWvghqwkJVatfQw8MYpHmxYs8H7aoyfbwNX5Fq9IKI1lTOAo5TWg9fWTqlTcQAQ3Gb
         cyZVB27XEPdqRAq7Y0DvQkieTOK9qwJT0pcG8vtsXPmURq7SKrUgtb8nVzEzBLUXpnN6
         AB0/FpMTyi48L2UDpmhUCSpXDf4ZLW43gTCIwYmlkapFXvCcE3ZtdstYRWIjN691f5lN
         smOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737721495; x=1738326295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ez2SUlRyvGQWFaRonAO1AfYboy0jbqyl3K6PdJMFs6o=;
        b=XZPK1D4TUOyPU72zzBbjygYc0Nx3Zrggn9SxAkBxbzrAoaXnCDls2iwU5IBuPrDW20
         5ThAi4On9bTiVnZ3eVl8CQ4TwLKjnraeddVlRm3Cvhk4axdNDjAr9HzFgPRyfrby1sgE
         dKIp5ZQIB5K3GMiAK0OpDhv9LNBFDTEy4krdyUSQDqBXyXL6IOYgIDfpPieW3wt2k4he
         Z0tVfXv2iVCrP5xDSEU8b8i80Fl/ivFVL1DG03KfbOkYqlIALVtSpYG/F97DwChpCAIg
         NbBjszSIF/5/KfjcoH98rDME9xUPL6Clfr68PhBVqPSYcy59TymZQKacsabEuzo6qeh4
         AP9g==
X-Forwarded-Encrypted: i=1; AJvYcCU9cCTsjmzr4EZpIaa/dx1ia3FBtvXVHrgi+XgdVfwfUkcSAz896a8HgvXW/u/p1+IqMCsYGnjel+DeEyA=@vger.kernel.org, AJvYcCVk8xFDmEOTnewLMDQxhaaj1fIGSc0n+tuBwftGdwiqMFnR5+bFeAHceYGzQz+b2c4pmyd/guUAKLCVlWU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7UppCDj4WVYleZeXwb9TLp7/5E/Lof75v63ZLLLaGI9P8qESB
	EULokeTPCneVSnUeZrazevsrtjBAgolazk4yNquaDb9G1bhzTMvhFlUF5GZGoJu8ywHfB+vS7mR
	ydDxLCyRGRd5mFO/t5cLuJpfY3pXvWrIz
X-Gm-Gg: ASbGncv4vwZrJv9oTgtX9kNj8uI1Cbo/CmuJEzyv8xM8vlfLY6D8qyNIoq8tGco0IqO
	SAu6AbVFsbNUuvi+iRSE/Uw3MB0+zcdu6mAzVtVgEtq8/EF6tc13jWI8+NTWF7A==
X-Google-Smtp-Source: AGHT+IH7FFyODV+v1X7zscNsvWrVSCtN2/X2KIAW2/2W40Xjumsu+sIF0BJPdjbE/jACAI/w07aysYDlAo3xtMe9ywY=
X-Received: by 2002:a17:907:7f17:b0:ab2:b5f1:5698 with SMTP id
 a640c23a62f3a-ab38b44e10emr3083236166b.38.1737721494768; Fri, 24 Jan 2025
 04:24:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <78C4C3F9E650FD04+20250124034402.540943-1-wangyuli@uniontech.com>
In-Reply-To: <78C4C3F9E650FD04+20250124034402.540943-1-wangyuli@uniontech.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 24 Jan 2025 14:24:18 +0200
X-Gm-Features: AWEUYZksS6rM_MVX07XY5v4VK89J11NA6n6GtHKDlIW8nNRKM6w2dUUbBkcDiqo
Message-ID: <CAHp75VcQupMnxkaObctgBAqZsbyJbDjYueE3rsSOLUM256vomQ@mail.gmail.com>
Subject: Re: [PATCH] media: atomisp: i2c: Remove unused macro definitions
To: WangYuli <wangyuli@uniontech.com>
Cc: hdegoede@redhat.com, mchehab@kernel.org, sakari.ailus@linux.intel.com, 
	andy@kernel.org, gregkh@linuxfoundation.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	zhanjun@uniontech.com, guanwentao@uniontech.com, chenlinxuan@uniontech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 24, 2025 at 5:45=E2=80=AFAM WangYuli <wangyuli@uniontech.com> w=
rote:
>
> Delete obsolete macro definitions that are no longer in use in
> mt9m114.h to improve code readability and maintainability.

It looks okay, but as far as I know this driver needs a lot of work
and some of those macros actually may be needed. Do you have a full
roadmap of making this driver to be in shape?

--=20
With Best Regards,
Andy Shevchenko

