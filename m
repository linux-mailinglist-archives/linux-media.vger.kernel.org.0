Return-Path: <linux-media+bounces-19907-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D46049A448D
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 19:26:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F68CB2124B
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 17:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2AA4204013;
	Fri, 18 Oct 2024 17:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZukBy4pW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E60514F136
	for <linux-media@vger.kernel.org>; Fri, 18 Oct 2024 17:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729272383; cv=none; b=Q34QqJs1SnhU8sbayN1N7QzFEL9/Qu5hR41ksXAzpN3DbS1dFcB4x17RmQrSpOpRLIStXen/6tGzpQUrxgzA9LHThxwy3DvbL4geWZPLHXM2Qd7FbKY8kwUVWkVR8oreOLxcoHxy3g0FTlyrx7LofLh0AThgi5E57tEbsraeK2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729272383; c=relaxed/simple;
	bh=cQHBFhpIbIHsu74kXSzRly9tLkFo6jTJ5u80QTpYyxw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jh0KVEh9nBjZSR8LEssYV8yh+piKnplfciqXHCHL/7yFIKqPmadTgbtxWzrFibkk3oVtybUs80R6RnyK07yyiALQoBcJ+oB6Hz+SETAx+4tnvkB5nraruWMLPwsfrVYVS31NuUwLvTLCv8iY8Bp9Sy/QToiN3FL0u4Ch2h6ozHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZukBy4pW; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7c3e1081804so1585049a12.3
        for <linux-media@vger.kernel.org>; Fri, 18 Oct 2024 10:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729272380; x=1729877180; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sms3pQbAP79KrW3EYpH8AI5dG+5nAReBWEFKMzdgzHU=;
        b=ZukBy4pWFnVJwbT/BudzgvYOjHdqROgnb1NtQcKmD/lqPM2NnLk7sG+cIFGvL/CG9p
         fubolmSDHskAQz6iw0o55IQyMjnUcFhpI4mduRXXwsmtlZaVzDRPI7eyNO1Dey6ASQoZ
         BUWYgwkPUQdipxTbPQYLZ6lN2JrZnUGuLLPCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729272380; x=1729877180;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sms3pQbAP79KrW3EYpH8AI5dG+5nAReBWEFKMzdgzHU=;
        b=Yx3NJorG7Geh5vrYSFLvlMDcumA/BXqefp66pinGz1d3rykebCwOIBV6ynPuSpETEm
         pOVFjIEXEXyqjKTNn5dy4uZuuw6RUQiezh0kw/tpwE/X5ld/kTr0VC//PBI1dpjjIYfA
         DkPQSjZm+ign37ujrKGwPo5OwkOdVcFR71cv2GeQI+HY8hcFvAKiljxYxIR0wap2+P7W
         LlFlAzNNRNpqAQMnME4FaE2IuefcETgPOg0BHQ9bJibVL0N7ur2Hjz6eoCiWVPUDkSt5
         YAIABv2qWw9mJ794Kr3dzHo6N0NdwHz4W1sUfdlGd9PFoPmUh4Oc7A9/O2xsXlpgTdx2
         T8Tw==
X-Gm-Message-State: AOJu0YyIj8B1ePkisGo5upJN50bbBYncz2QrEBvK4LygibOeSK/ROJ1m
	xRFM8ZWw1xFNiTu94S+SztjjX/oObZhCmt+cjn1dhyy3p4AWX64speiIMpf9JQoOJs6u6JLrBZo
	=
X-Google-Smtp-Source: AGHT+IFpx3dSfX2AMm1lGYeYNE06AxL5HLg+18gBRE1Gh6aVCFDP3cGWAL77syRK7//K7Gh6TTaVbQ==
X-Received: by 2002:a05:6a21:114f:b0:1c6:fb66:cfe with SMTP id adf61e73a8af0-1d92c503d9bmr4237454637.21.1729272380411;
        Fri, 18 Oct 2024 10:26:20 -0700 (PDT)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com. [209.85.216.47])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ea33ffc4bsm1707532b3a.127.2024.10.18.10.26.18
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Oct 2024 10:26:19 -0700 (PDT)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2e3fca72a41so1337536a91.1
        for <linux-media@vger.kernel.org>; Fri, 18 Oct 2024 10:26:18 -0700 (PDT)
X-Received: by 2002:a17:90a:e395:b0:2e2:d879:7cfc with SMTP id
 98e67ed59e1d1-2e56166e12amr3418067a91.21.1729272378140; Fri, 18 Oct 2024
 10:26:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241018131351.70563-1-brgl@bgdev.pl> <671279a4.020a0220.206dc9.0907@mx.google.com>
 <CAMRc=McnFLVeBOV8rcfL+A2PsF_dY0C7OP8DOhqwwgU9OpoZBg@mail.gmail.com>
In-Reply-To: <CAMRc=McnFLVeBOV8rcfL+A2PsF_dY0C7OP8DOhqwwgU9OpoZBg@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sat, 19 Oct 2024 02:26:02 +0900
X-Gmail-Original-Message-ID: <CANiDSCs4tzZywh9je5DfN4x4p4V5HAFkJ6zP62oOOpno-keVWg@mail.gmail.com>
Message-ID: <CANiDSCs4tzZywh9je5DfN4x4p4V5HAFkJ6zP62oOOpno-keVWg@mail.gmail.com>
Subject: Re: media: v4l2-core: constify the class struct
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-media@vger.kernel.org, patchwork@media-ci.org, patchwork@linuxtv.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bartosz

It is indeed. Sorry about that. We have already landed the fix.

Sorry for the noise

On Sat, 19 Oct 2024 at 02:25, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Fri, Oct 18, 2024 at 5:07=E2=80=AFPM Patchwork Integration
> <patchwork@media-ci.org> wrote:
> >
> > Dear Bartosz Golaszewski:
> >
> > The unreliable Media-CI system has found some issues with your series.
> > Check the report at: https://linux-media.pages.freedesktop.org/-/users/=
patchwork/-/jobs/65292429/artifacts/report.htm
> >
> > Please fix your series, and upload a new version. If you have a patchwo=
rk
> > account, do not forget to mark the current series as Superseded.
> >
> > If you believe that the CI is wrong, kindly reply-all to this email.
> >
> > Check the latest rules for contributing your patches at Documentation/p=
rocess.
> >
> > Best regards, and Happy Hacking!
> >
> > # Broken Tests
> > ## Test [static-upstream:test-coccinelle](https://gitlab.freedesktop.or=
g/linux-media/users/patchwork/-/jobs/65292423)
> >  - **[stderr](https://linux-media.pages.freedesktop.org/-/users/patchwo=
rk/-/jobs/65292423/artifacts/junit/test-coccinelle.err.txt):**
> > ```
> > drivers/media/platform/raspberrypi/rp1-cfe/cfe.c:2326:2-9: line 2326 is=
 redundant because platform_get_irq() already prints an error
> > ```
> >
>
> I think this is a false positive.
>
> Bart



--=20
Ricardo Ribalda

