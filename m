Return-Path: <linux-media+bounces-47918-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D21C96036
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 08:32:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F3A4A341EFD
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 07:32:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07278280035;
	Mon,  1 Dec 2025 07:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RAJQLdlc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960821E868
	for <linux-media@vger.kernel.org>; Mon,  1 Dec 2025 07:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764574338; cv=none; b=komPn7mije0IdLRpJoEUO/axUTfsqkwxfbm1kWFsNTe7gNqEUhrkNuw9QwOQPVl/eJ2fG+QqIhE6Xauso4JMm6iiNkIG9RCcTR/7JDDlqfTPzJvb2LZ2HlzrVdX+MIVRI8k1O8fuNbx72OAUayxkK4nHRb3sA4npbbcI2udCvJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764574338; c=relaxed/simple;
	bh=I2BmkmtN6Cv89yOGWm+fK/ttavYtnWiNmu3SGXBOpRk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lWM9MWTXOgEjiw1r9ZYyhLBg1tUKnluFTisTNROyjTxwawhG5n3ordyaZxBT8O8HP2dx/Q5GolfIxnOLY13Q9m5SnG89qaC/duC47ZCSyuekzHzxB23F/Hq0zw2SO0XNisrWdQj8Z6+6pDbtsNKAndPPi0XMcrGXRNt5aspaLLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RAJQLdlc; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5957db5bdedso4348685e87.2
        for <linux-media@vger.kernel.org>; Sun, 30 Nov 2025 23:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764574334; x=1765179134; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Mz99Yrd3EMfGvnuk1l/xdPTdm/82TvPpOeUiXxcec7Y=;
        b=RAJQLdlc5BQa0Wickya3gvo3EfCDe821TFmbmH72ssOja+AWJZ1YME+zlil6MFCqyG
         w76WQlFBMFrc6TdPdvOv29wKdbKDXg39NSdqxcwb/o69UwU0QzHX1a1Zuuc4PYR/ZvbM
         YgMBlGwc2Fz0LJ4GUABspxqYQk5drGWeCXSx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764574334; x=1765179134;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mz99Yrd3EMfGvnuk1l/xdPTdm/82TvPpOeUiXxcec7Y=;
        b=NuRIBENFXHdKoc4EX+55oxkDcsPHg5ELY/NWi1uQ3QjpgDoQpV8bAa9nkVMi7P0cMW
         EoZ3jvyN0wuwbh84qb89y6YwHhTzf+0grFVooKaK7ymx0YPVgIJaQqzZAM7koU2ygtg6
         S3euvGoySB6AZkuIagBsLPratRewPTOVNi9i8YkEpwglIT2BGCFeRkzOcybnkexsRnWx
         IWX3CzmNn8mNqhMbmrM99H4uTgTE6knvresplANOuwsM40ni4W2s1tWF+UVXaixQpr3j
         jtzP6DTyslV+ZOn9ZdIOzTFADsXxrBHAQFdc6/URD8vG65quAr4O6MZ/X3sg18OCn7YB
         2upA==
X-Gm-Message-State: AOJu0YyQmji6OfmNj5/vdr2jzj2eYzAuS/NXbrT/Nk48V/ldV7ss9Dze
	BT9L7cwIoWyBHjBbRhFs9IKGYrMTnZPiTrQTIXndWMMGn+/lb1aJ+CAH5Rrt70QWE1E/+Y4jzVO
	lhiY=
X-Gm-Gg: ASbGncs/xlviTz+rA5EgaNfF6KkAi0xwVrcnWduCGjhPvAOcu/hyw/VzwMPgDUShk0U
	auQrhP601Np1rKF+4+q0u9/4YR12BKb2Z385jkWpRum4FJShVk/xK+kRvZWrFJIdttFg/qDmzV4
	ZmELWpdMA+b+pO2c3+iYlQI+ytEmdCETUmp6gk4ZcjnFKZOiYhQ4e9GYs/AGqpPXecosnxxOxYN
	Jli4pCRs71Y6rTfdzYdkHXBjX7yYbrqmRGSkDlhb8kel7RyN4dwvpabMaupQZ2YhmO8bU+rpPVo
	yXPjo84j/1dOMB5LbdTLJ8msehgZwq9o6K0dnSkedPSp3/V5RrhqO/wUM0tc9fuUVo8XVUJCUrs
	r04yBEFzSyv5CTIS1UbFaKy/k4MvyDUWW9VMcWUGsatRNwtD6iudAAyoGHStKW2EayWQeqTHs9V
	vMEMNeNEoJ+IRMmLv0gKrdcVBh/MPlDKWoIIRPFgvgECkZ+BCIszbT
X-Google-Smtp-Source: AGHT+IFgdz+cpSg6079vGZoRXT97OkIyS+ZnhhnBU4Lhb2HWeGKOmbjKG5YIodhqCupHlTXJ7rGZfA==
X-Received: by 2002:a05:6512:3a8f:b0:595:7fed:aaed with SMTP id 2adb3069b0e04-596a3ed058fmr12525824e87.26.1764574334225;
        Sun, 30 Nov 2025 23:32:14 -0800 (PST)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bf8a7cffsm3433116e87.18.2025.11.30.23.32.13
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Nov 2025 23:32:13 -0800 (PST)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-37d13ddaa6aso28979481fa.1
        for <linux-media@vger.kernel.org>; Sun, 30 Nov 2025 23:32:13 -0800 (PST)
X-Received: by 2002:a05:651c:20d3:b0:37a:30c5:af1f with SMTP id
 38308e7fff4ca-37cd929463bmr87691741fa.40.1764574332659; Sun, 30 Nov 2025
 23:32:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiDSCuizbMt77XfrzGPMa3Biai5TF1vcs+C5qdhYoLrP=9b3g@mail.gmail.com>
In-Reply-To: <CANiDSCuizbMt77XfrzGPMa3Biai5TF1vcs+C5qdhYoLrP=9b3g@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 1 Dec 2025 08:31:59 +0100
X-Gmail-Original-Message-ID: <CANiDSCuEa7k4586-xOPpKye+eyCsrmvvsHNCHZtD1voMCAOjtw@mail.gmail.com>
X-Gm-Features: AWmQ_blKolMxWGK5c88RcDJeKCeyfSOwbPNwK3kNtkGF6vRjUXKuOSlVitb6aUA
Message-ID: <CANiDSCuEa7k4586-xOPpKye+eyCsrmvvsHNCHZtD1voMCAOjtw@mail.gmail.com>
Subject: Re: sparse: Lots of (erroneous?) "different address space" errrors in
 new version
To: Dan Carpenter <dan.carpenter@linaro.org>, Uros Bizjak <ubizjak@gmail.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Dan

Friendly ping?

Thanks :)

On Mon, 24 Nov 2025 at 09:55, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Hi Dan
>
> Every week we bump the smatch/sparse version used by Linux-media's CI.
>
> We were almost error free, but the last version has introduced a huge
> amount of errors:
> https://linux-media.pages.freedesktop.org/-/users/ci/-/jobs/88441453/artifacts/junit/test-sparse.log.txt
>
> (It is also reproducible with linus/master)
>
>
> I have bisected your tool and it seems like they were introduced by:
> commit e53027a4e816a772403baafa83c09e4a94c1cb8f (HEAD)
> Author: Dan Carpenter <dan.carpenter@linaro.org>
> Date:   Sat Oct 18 12:31:01 2025 +0300
>
>     symbol: preserver address space qualifiers with typeof()
>
>     When we're parsing typeof(var) we should preserve the address space
>     qualifiers as well.
>
>     Reported-by: Uros Bizjak <ubizjak@gmail.com>
>     Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>
>
> One example of the new error found is:
>
> make -i W=1 C=1 CHECK="sparse" CF="-D__CHECK_ENDIAN__
> -fmemcpy-max-count=11000000" KCFLAGS="-Wmaybe-uninitialized"
> drivers/media/v4l2-core/v4l2-compat-ioctl32.o
> drivers/media/v4l2-core/v4l2-compat-ioctl32.c:763:13: warning:
> incorrect type in argument 2 (different address spaces)
> 09:08 drivers/media/v4l2-core/v4l2-compat-ioctl32.c:763:13: expected
> void const *from
> 09:08 drivers/media/v4l2-core/v4l2-compat-ioctl32.c:763:13: got
> unsigned int __user *
>
>
> static int put_v4l2_event32_time32(struct v4l2_event *p64,
>                                    struct v4l2_event32_time32 __user *p32)
> {
>         if (put_user(p64->type, &p32->type)
>
>
> Seems like if we would like to fix the error, put_user should be modified....
>
> Maybe it would be better to revert `symbol: preserver address space
> qualifiers with typeof()` until the codebase is ready for it?
>
> Regards
>
> --
> Ricardo Ribalda



-- 
Ricardo Ribalda

