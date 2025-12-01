Return-Path: <linux-media+bounces-47967-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D2CC97EE0
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 15:57:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB0833A3779
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 14:57:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA3BC31B837;
	Mon,  1 Dec 2025 14:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JNmLfsW3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E25530E0C6
	for <linux-media@vger.kernel.org>; Mon,  1 Dec 2025 14:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764601060; cv=none; b=kL2/PyvmhQMW/cZsLJkfjyo25RAz2gvt8QswDzMeHc6zp+2CogQwAHyq7eBHM9Hjayevh0kqrhkV4FFsjkjRpk5Y0iJSI7AjqybjGmrOVuna+5i0ltffBs2TUnFUbkzVgEOXLVaxs5fmDZ6Y+kwUrtdM9vnxY0xNYC+7kOjHFdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764601060; c=relaxed/simple;
	bh=mXWUe9v020rFkSRnUQkrpBp9dRi6I/fFA7MzhJ8NCj0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t5bCk+p0IiwBrszWCSWh5Rp3nNrHyISjphF07Psgr/M7LSaNPGYg0C3QUrNU4rmxUf/eOLNpNxIUTuD+d8LfZyghPJtgaTp1F6PiHyE0uv9ICkC/1Ovsg849quTz5w1bdl2M6auWX8TKJuqh6qaTmUnwPcmAjz+1P4siVuZy2MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JNmLfsW3; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5957d7e0bf3so5302021e87.0
        for <linux-media@vger.kernel.org>; Mon, 01 Dec 2025 06:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764601056; x=1765205856; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=otF6MgDEWk7sLizw6crVCb2V2L8hcGR+1TJBD00POMw=;
        b=JNmLfsW3f0Hn1OdwBuY3JnpWWqVOfpSjN+wV52q1TxwoBBdZn4568wGCfVjKzNYG/G
         LBePQzepv93aB7/whKHl8ozRA8G4RkhE8FB1NJEX3ed/JX1GHcUJx6mYCx1E+TBzUp7p
         6IGe3ZyDaT8rCtojYGSUZbmYfcZfYB0nOv0Ys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764601056; x=1765205856;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=otF6MgDEWk7sLizw6crVCb2V2L8hcGR+1TJBD00POMw=;
        b=I+ibTnlA2523BhLjp4f4XOo99IkuzNdaVmlvLUTBABTpdnury1iiZWomlLmBfodazq
         oPAyB/Z6jDMZUU4F/wILtDuc0kbNLOPCbbC2SWY9wsu0JBMeIrXVw/w1BtIo7onIs+xf
         vSTU/stukrnz7NHLaXWVPne/0q8FjwMWM35AhC05g163kOY9Hf7sDlUus1dl1exL/MqQ
         6n3Ebz9EibU1UirI2R1wliR8LCFNmlvmcH/sQTGiLgI7dAyq4kz8gU/uDmq/MeSOA/H6
         3mrMj4oPAzkVvR+EduxU8Axcl85XPKky2/3gBoHvCbP6dyr0Brm6zYZAendx4v1KVkv3
         NlSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxaJx/PX+DFo5TSX7h2mWaTX/FHOcLSQ568Tp+ZWVY6Wid65OPb8DxJZWRy//824+9YHpYNE0RywGXYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxikKQRqgsPUFUh4/j1BF2vFaLSMu4qUauiKNhXWI0l2UafhHOA
	5q7jxQZ3dAgzoV2tUgZ5INvrFb5uur1lM9SEiktGDKpBB6Gh+MBsvxZRcohzURiETnAJSKlr/bp
	0bfFS2g==
X-Gm-Gg: ASbGnctCdfhgsgB0kZjAkJJZoVgY++6wzJ4B/0K+GUhwvONoyVzMia2LcknhzqlEH6M
	Hl66rfTonCw7i5xAyrVlr5kvbS9Yh0PFUfZMllIjbB25do5nVT5q/MNbXa+fH64rN3HUx7mo6cX
	ngUUd2H+udMltsQgOmh71eNG/O2CEpzIzaZrLTIperbU0SodoJoj9mr09Onb/OL0CNCiNjcwW45
	ekQFrcDZZsXW4DGh2kAEpEkV+QBzp588dNwd/4CKgrpEeIGjFFqHoTRCtKrYeTdFuirwQTJ7Lxy
	TC8lAdq+PRKvGpyasb7F/VqNZcHKNge/7zz9tRV6m4SOSwiYV2NOZvPY/bWyU6EkZnK8Gtq1/j8
	grHqg7Qkd0n/AoWM4gR1411/VH+DKzKoA69q6aOhQa3nSq4kLv1ZH9xVxqs/em3y2TsQjVB1VQG
	vA8ITuQv206clv0cV8W5k7w5619wdl95gyAIfYGm8xpg5lvU9u
X-Google-Smtp-Source: AGHT+IHbokxqE/HoZI9gnwdNYfsCHNK6d1/DT9j141CX3S/eRUSiTahN0eou6ZXJiajbgPkWQ/KFgw==
X-Received: by 2002:a05:6512:39cd:b0:594:2f72:2f89 with SMTP id 2adb3069b0e04-596a374980bmr10515915e87.9.1764601055965;
        Mon, 01 Dec 2025 06:57:35 -0800 (PST)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bfa4f69asm3743901e87.90.2025.12.01.06.57.34
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 06:57:34 -0800 (PST)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-59583505988so5423435e87.1
        for <linux-media@vger.kernel.org>; Mon, 01 Dec 2025 06:57:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVRnETL/f2GEEVfC9TL/2nEcjIj8+y9pfb07PBSjZHFPRPpyP1CXbNUfvy3gxfTuV8O7N0+B3YMIKBGew==@vger.kernel.org
X-Received: by 2002:a05:6512:61d7:10b0:597:ce3d:8360 with SMTP id
 2adb3069b0e04-597ce3d838fmr38402e87.1.1764601053823; Mon, 01 Dec 2025
 06:57:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiDSCuizbMt77XfrzGPMa3Biai5TF1vcs+C5qdhYoLrP=9b3g@mail.gmail.com>
 <aS1RhxHtknHzZE3Z@stanley.mountain>
In-Reply-To: <aS1RhxHtknHzZE3Z@stanley.mountain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 1 Dec 2025 15:57:20 +0100
X-Gmail-Original-Message-ID: <CANiDSCtTowLNXcau15s7Ao9nHaavNf7VsKwTRPHNJnqnbCV7vg@mail.gmail.com>
X-Gm-Features: AWmQ_bnewX5ZJVKY2Lvedokp2X8JrMPb4k6p7EZrjAhU4fIHQvAzLbzowGA7P_g
Message-ID: <CANiDSCtTowLNXcau15s7Ao9nHaavNf7VsKwTRPHNJnqnbCV7vg@mail.gmail.com>
Subject: Re: sparse: Lots of (erroneous?) "different address space" errrors in
 new version
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Uros Bizjak <ubizjak@gmail.com>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Dan

Thanks for the response.

On Mon, 1 Dec 2025 at 09:28, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> On Mon, Nov 24, 2025 at 09:55:18AM +0100, Ricardo Ribalda wrote:
> > Hi Dan
> >
> > Every week we bump the smatch/sparse version used by Linux-media's CI.
> >
> > We were almost error free, but the last version has introduced a huge
> > amount of errors:
> > https://linux-media.pages.freedesktop.org/-/users/ci/-/jobs/88441453/artifacts/junit/test-sparse.log.txt
> >
> > (It is also reproducible with linus/master)
> >
> >
> > I have bisected your tool and it seems like they were introduced by:
> > commit e53027a4e816a772403baafa83c09e4a94c1cb8f (HEAD)
> > Author: Dan Carpenter <dan.carpenter@linaro.org>
> > Date:   Sat Oct 18 12:31:01 2025 +0300
> >
> >     symbol: preserver address space qualifiers with typeof()
> >
> >     When we're parsing typeof(var) we should preserve the address space
> >     qualifiers as well.
> >
> >     Reported-by: Uros Bizjak <ubizjak@gmail.com>
> >     Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> >
> >
> > One example of the new error found is:
> >
> > make -i W=1 C=1 CHECK="sparse" CF="-D__CHECK_ENDIAN__
> > -fmemcpy-max-count=11000000" KCFLAGS="-Wmaybe-uninitialized"
> > drivers/media/v4l2-core/v4l2-compat-ioctl32.o
> > drivers/media/v4l2-core/v4l2-compat-ioctl32.c:763:13: warning:
> > incorrect type in argument 2 (different address spaces)
> > 09:08 drivers/media/v4l2-core/v4l2-compat-ioctl32.c:763:13: expected
> > void const *from
> > 09:08 drivers/media/v4l2-core/v4l2-compat-ioctl32.c:763:13: got
> > unsigned int __user *
> >
> >
> > static int put_v4l2_event32_time32(struct v4l2_event *p64,
> >                                    struct v4l2_event32_time32 __user *p32)
> > {
> >         if (put_user(p64->type, &p32->type)
> >
> >
> > Seems like if we would like to fix the error, put_user should be modified....
> >
> > Maybe it would be better to revert `symbol: preserver address space
> > qualifiers with typeof()` until the codebase is ready for it?
>
> Huh.  Sorry, I don't know how I missed your email last week.
>
> The do_put_user_call() is doing this:
>
>         __typeof__(*(ptr)) __x = (x); /* eval x once */
>
> And ptr is the __user pointer so Sparse is doing the correct thing.
> We could change the __typeof__ to __typeof_unqual__.  It silences the
> warning.  I'll rebuild the entire kernel to see if it causes any other
> issues...

Just FYI, after patching do_put_user_call.

We still have issues with lockdep_assert_irqs_enabled(),
lockdep_assert_in_irq() and TRACE_EVENT()


Regards!


>
> regards,
> dan carpenter



-- 
Ricardo Ribalda

