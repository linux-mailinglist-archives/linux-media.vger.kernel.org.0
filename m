Return-Path: <linux-media+bounces-20297-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 063219AFC03
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 10:06:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF26F1F21929
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 08:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3264E1CB9F6;
	Fri, 25 Oct 2024 08:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="AA8lRNbm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C641B1CBA0D
	for <linux-media@vger.kernel.org>; Fri, 25 Oct 2024 08:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729843558; cv=none; b=ADNEFCKdOBKAJKtsh81aIIYfV4eAgfi4QROUlUHXE4ig+xE3NanKMerAimZ3zbf7J6jI4vWEG8KQnZgKgjNTtyEjDxa0J63ROEQ0Zaaib0KYy6oPk0Ng9XFi3EdZSryZd24YdXv3ZSgvAwB+SurqQbkC/5ZXEAjFbGYQfFLCU5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729843558; c=relaxed/simple;
	bh=B7GsNfjMH1Ck5EzL/7E+SnGmC/+M3akdjUxjvzm4U3o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c1bxVxK7ZLG7wEfkfY4ewW2r2VhxZanN4nYTeuL6RCQCJSwPPD4SHZgrKFO199P4IKwIAEPxx7Kr1Eoqdn/RwtZBhww6mTrc9fy3xRq9srWM1tuYMyhZzjPpY4MEvEtI/d+h+P8Yzumr6aLQ858JhUka3sjzIhNEJ4bUvBNYsic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=AA8lRNbm; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53a0c160b94so2109013e87.2
        for <linux-media@vger.kernel.org>; Fri, 25 Oct 2024 01:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729843555; x=1730448355; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B7GsNfjMH1Ck5EzL/7E+SnGmC/+M3akdjUxjvzm4U3o=;
        b=AA8lRNbm5aA0wHDkLczvFBvEH3XMneneSdEEXslBiC2O3XFJpFYXMzBN8a/bNc+xlw
         syt4diZY6eFQ7Te8fwAc/SX+UA7d7ZRTmMEeSWbFYynUx+qZOOfEQ/rOlDWW4JPSXfPi
         70PHIaNKmDoFqgLSoR6pPg8n/7/eMniuNAq7fpVAGE78yxr6xzfpIpYABZhXw3g7wRx+
         frxw/y0INbCelp/DGlj6l6ObTL2JszpjsrNE53SvsUbhtpJw4/sf5dl25sCCmVScNiyG
         1DCnjrdqsXg7TGduJ1nW8DjjTenWHorjWLy5/qmcC6VDUE6egOIG2/ZEff9WSfrkucF4
         kmqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729843555; x=1730448355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B7GsNfjMH1Ck5EzL/7E+SnGmC/+M3akdjUxjvzm4U3o=;
        b=AfGvS6U/7shdk5BKKLa7K5LT2fehmTpkdMQIeI0/GIDZVbMomqcL1qQfgwueUo7hnD
         +WsA3b17+bx9bnOsxPP8ix0GJiMoco8+nE4o+iQ6ub2cP0kDuZLWp/cB9HvQYKx2EROI
         U7Sxb17sOv5dosOJfx0TKVI9Y0SI4LsMauBbktgAUjZQfyBPkhlkrusMnHc8wFYrwCpY
         4DcceESq3B+klcQyTjpVw9PsthQOTPrsDrk1ofuke4B1Rf8Sbc6twJTCbczxhcGLLbsf
         +01/bMsaglA7VYNMWyIMremsh/lgH9Xrf+kc9TCIrKPhXsvA7hS5Z5wNMLiV7MZq997S
         5fVQ==
X-Gm-Message-State: AOJu0YypuCkwoMnsLCj3Ki9Rs8CxSNMOJWyFqh0QwmmCdQGFLQ2U+oxp
	PPyYsq81bXXnQQ2q54a/c6YLQ6Q+v7DD+CB/gTLnbNfLGkRHn3OOmXlPLj5xx7X+RUniV90x9pN
	xSawKDLc1vwL5XkhmOVDQ6hoJHVN2wMmDTT1F8WWvaYBDymI1
X-Google-Smtp-Source: AGHT+IHL4k1SKxrISxXj9Hy/oWPNHlyMkJpfCT5Lo4Nvt4W+0QCSqPx1/auTC9x3hsVb5V393vuQlQGWM/Hm8ze5Efw=
X-Received: by 2002:a05:6512:acc:b0:536:a583:2777 with SMTP id
 2adb3069b0e04-53b1a2f1f01mr5017883e87.9.1729843554881; Fri, 25 Oct 2024
 01:05:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241018131351.70563-1-brgl@bgdev.pl> <671279a4.020a0220.206dc9.0907@mx.google.com>
 <CAMRc=McnFLVeBOV8rcfL+A2PsF_dY0C7OP8DOhqwwgU9OpoZBg@mail.gmail.com> <CANiDSCs4tzZywh9je5DfN4x4p4V5HAFkJ6zP62oOOpno-keVWg@mail.gmail.com>
In-Reply-To: <CANiDSCs4tzZywh9je5DfN4x4p4V5HAFkJ6zP62oOOpno-keVWg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 25 Oct 2024 10:05:44 +0200
Message-ID: <CAMRc=Me5u7rc9JmWKcKUU1uYyC-Bwy99b++K3djeSnNyDmX6nw@mail.gmail.com>
Subject: Re: media: v4l2-core: constify the class struct
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: linux-media@vger.kernel.org, patchwork@media-ci.org, patchwork@linuxtv.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 18, 2024 at 7:26=E2=80=AFPM Ricardo Ribalda <ribalda@chromium.o=
rg> wrote:
>
> Hi Bartosz
>
> It is indeed. Sorry about that. We have already landed the fix.
>
> Sorry for the noise
>

Can this be picked up then?

Bart

