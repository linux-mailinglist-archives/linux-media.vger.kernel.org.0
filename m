Return-Path: <linux-media+bounces-20455-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 400A79B3A1B
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 20:09:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AD746B21D5A
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 19:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 004491F4296;
	Mon, 28 Oct 2024 19:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ozx9gN64"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C651F12F1
	for <linux-media@vger.kernel.org>; Mon, 28 Oct 2024 19:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730142427; cv=none; b=oAtPwPhy3bQ/D2h9+Da8B/0Mvb0B1tHlTERh9+EwNhxrkzCDNdCTlyHqjZmTXZlzGVL87lNlr1Sl3iGycgHsj19YPXntMnK6+qf4FbTJnabyHSG+hdetc/puJ9xPnPn0U4CQxa2NdmlpTj7/hVFeb1jLYb64oCX39O7nIDjLWJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730142427; c=relaxed/simple;
	bh=CYf5dukjn7rDDYhHwSQdHTT50BMvVU0WfA2tdldI+h4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NRapB+etRlFrLRTMKs0zWpOceCOJttsobRjztL2oz18cyibQXthZFdWI3CGUb1NLblaVmA8icvJgoY8bO6LumurWmNK7DVLU0d9Gf+AMB1xvzCDoOLGZhyolFNjC56k0EQpmpxnUpkyRdd2Giu3cFYsirb4eXtAXwF08EAu686Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ozx9gN64; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6e3a97a6010so51958757b3.1
        for <linux-media@vger.kernel.org>; Mon, 28 Oct 2024 12:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730142423; x=1730747223; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CYf5dukjn7rDDYhHwSQdHTT50BMvVU0WfA2tdldI+h4=;
        b=ozx9gN640695WWtDYCSZjqgLXgKNbNCkz6q+zCS1mms1zN5fkBCEbUnWxh8rENts0k
         Rz2pQRjy5b6u+vnWClovv6Ax/DnTEde3zw72CL+Fn7LtOcRJo1P4Xe0041ap3K1kK5xp
         SVdk5LWM6nXVxbTQtM/srbpsT7YeyhIkupUtyv/we7s3CepFQlTbS1Adb6T9oiurXRXh
         GEZBkzm3O9IuIqYwrDVb6iEW53L9uzrg99vFcJVRPISCVTKfghA7RS41vyuEwG6gF5yO
         t/NjXqeK3Jqdjs9UOOkceDAcGP/w41oLFtx+QxT1Vhg7lazGtzM61rkwMLzOcKuzu3K2
         49yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730142423; x=1730747223;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CYf5dukjn7rDDYhHwSQdHTT50BMvVU0WfA2tdldI+h4=;
        b=d4u5NcE7d1+LulFEcQklzoGc56sY5v7bWn0IGiTcfM0wQRRIPr9oNAOHsdNp5fSGv4
         QMAdf8dyTIHgxuvK6WhPxj140XUZzkS/hmL3mbJavRV8Hb7GvqLJ/eskHt837pQ7jc+R
         4LgeAlZLkBWB9Q1y+Yjd3+xcuAhW60BMJOfahJ+fCm1FWRUv4AJh2e/c6ElLBcSLM6Wy
         a5Jo/rmwBrnE3ijtgJTf5eRAfj0QdFDkfBwBs+3ZDGvJvQbNxCL9nrrwLZ1rKDyJR4WO
         FKSWAKqIiOmuNIW0fEnHirG1ztEs9+C2PxDemLNauLKB0emZAXoOujgnXQEaTJtPCJT8
         OY+g==
X-Forwarded-Encrypted: i=1; AJvYcCU3ibmIzor2Zv6zlxOSr68trUizAyDgL34xaOEmeVCNxPDMFGGXUUYZqSjyM8ZBDiWLLW6gm0bWWMq8bg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl4qa+FwRtgO8EGX/8hrjYMjN3Tczjl0FAN+9WTWN/GEENEX3C
	nIr3qwAZ1WgUy/2R5cckRpLLarkRrm25AGZx4l01n+1F8aSDa9pgb9206F/qcIOkWTQWihPGKK5
	tPaWTv4KTXlVaqHeK960h42MlGw4uBwDqON9S2g==
X-Google-Smtp-Source: AGHT+IHyHPH/y2spfAtTOPC7T4/oktX0c7cDb2FO73u0b8ET9iUIHaq8J4lMT8osQnwjZSJWs+VfpVu7MgFNNvKiMpE=
X-Received: by 2002:a05:690c:d81:b0:6e2:636:d9ba with SMTP id
 00721157ae682-6e9d88e827fmr76513207b3.3.1730142423400; Mon, 28 Oct 2024
 12:07:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241028083030.26351-1-lukas.bulwahn@redhat.com>
In-Reply-To: <20241028083030.26351-1-lukas.bulwahn@redhat.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Mon, 28 Oct 2024 20:06:52 +0100
Message-ID: <CACMJSeu32-cnn01WoLbv4ffbMt3CfF0MTqbkxZHvu+4HQio=Mw@mail.gmail.com>
Subject: Re: [PATCH] media: remove dead TI wl128x FM radio driver
To: Lukas Bulwahn <lbulwahn@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Oct 2024 at 09:30, Lukas Bulwahn <lbulwahn@redhat.com> wrote:
>
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
>
> Commit 78fe66360ed6 ("misc: ti-st: st_kim: remove the driver") deletes the
> ti-st driver and its corresponding config option TI_ST.
>
> With that deletion, the Texas Instruments WL128x FM Radio driver is now
> dead as well. Delete this obsolete driver.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Amen!

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

