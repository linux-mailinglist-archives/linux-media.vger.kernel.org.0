Return-Path: <linux-media+bounces-43201-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC6ABA0640
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 17:39:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0BC0188559A
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 15:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F320D2EC568;
	Thu, 25 Sep 2025 15:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HpNhwtDj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f68.google.com (mail-oo1-f68.google.com [209.85.161.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0614F2EBDD7
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 15:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758814539; cv=none; b=UVz8wuj7uB7qokQpioxwKhfwxH0HeUhw+s+YuG/JQQd6zSe0r7+9R9RlKQCHmWmL5pTQwePkmJHPWVTJk8j+7dX1cPirDU0UvPGgtaCZ8uckJrj7jHNAb/bSLM2kqhQMAj/KzbJ4JTV7QypItcG2aF3Q9rscMvT2H0OQlmEyqJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758814539; c=relaxed/simple;
	bh=geANojt9QrhX3OgfvUjgSVqZNJzcJH4TRkaFu+F2DcM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=Xrh74bW4A9C10exIgEiy+l+WDXtjurdVOeut2Do3RaZvjKfDOfDygfNcZ8Nik87M2KV7ESWNxBj3PAoCezrsmTV2X7QbuLr0dwF+M2MnsGUPN4DRyE3AZpGQMT7C5d4BLqfi7qgESWhgAYhfLtsPYfNLS01YYNwO/KIgYOjMTtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HpNhwtDj; arc=none smtp.client-ip=209.85.161.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f68.google.com with SMTP id 006d021491bc7-63b7f426926so483136eaf.3
        for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 08:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758814536; x=1759419336; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vmSFfEjpJ8uyKsXuvdTKitCSHgwZHqiqHSzN7e5Vj3w=;
        b=HpNhwtDjYsAIBzjdHJoSermvOuCuxTVhPTxHEUaRwjjNFpLpw3QCj/6gzBvI2HFlh0
         Lds0yaZMhOPT4QkEfey6LiXuvHBgxu2V/R8qQfB015l0/3+QTDCvml4ijC6DcxvTQ3ON
         PmB4UM6m2LI8eKN79+aTNr+T3AekkJelt+gVMXSD+bUqiZQHdvQaFzYvlFcMMVl2BShL
         MJa56z4T+azLl5aStRre3Pf8wGz6hogDT4BdLz1w0NuT6M9mWHKxfVgt3Guyd0omGrQx
         lF1xVufRyezRhQNMiu4jdiUQsgf7Wn86/bIy9uWeC+jNuB5jyOFAZafkZsnx7JhjEWc9
         vviw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758814536; x=1759419336;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vmSFfEjpJ8uyKsXuvdTKitCSHgwZHqiqHSzN7e5Vj3w=;
        b=K+d6VdUrF3gmifqulVybhmTB7ZdcFtCnK90f7bDaKkC5BFKy09yxNp80PBIVz6jtCs
         PJqHVHaoB4bSF0YpNQnlKeGwBfarWWUWLCMRAJBag60+jRurLZljXAORxmoF/0sDSuJz
         FsPowmjgjI3Eid3HZiLtjzjErOpbKZO3kZHphewm0G4YMQX/WXsbNpjwsmYqxLBYGy7y
         Fd99pyJjituNA/vuVOQDrUJC1KveNOsDu0aNkWhlkd8ed1eLt5T4jmtT3sEClqYKkr2K
         Ii1gAwaFdBtT7Lr7/NqFqD5dkqljflfMQBOkv1QlwKdyJvinCiwUXjWziK0c7NHIZJeC
         5IuA==
X-Gm-Message-State: AOJu0YzxaCATOdZVx2/YtnCwf1AgAH6fjfAJLgjg6hinOtU3POojWy1A
	a0IvV+Nao++MeWnI81ANX+BA6VGVoMFPyLE1Sy8hGCX1tl10C2HKXNCKLdS3fIYIejyCVLWEy0m
	cVdhjTGIRGnfcngi3HABWm4uyo30c4rTVdbqimno=
X-Gm-Gg: ASbGnctKizwEzT5XinsHYFnV2N6szu2WYRtq9Jl5ytmiRu8t4RPv38kVEbH4wfu3nVH
	P6wwZc2YDj2QtflbZIVEzpr0jRC+r3EtKNGn8qzahZk0QgwQeP5Qf8c44MAjAjrK4SU2vK/1RdD
	qvz9zc95f7Q5aIBcWPx6GaSI6MMT2QOiAbD6QzKHqm2d4O7wTBeqem4dFJJJ9RiHm6Ygs9Nyf7Y
	Ns9VQo=
X-Google-Smtp-Source: AGHT+IHH9ZFmEh29dI0YLbqMwllsKUZBvPaQ/IcjC4isWORi+vwe8rcnCafa6nTYZXRw9Lsz5X9lIAKj8yh96m8dTkM=
X-Received: by 2002:a05:6870:6111:b0:321:8f88:a39c with SMTP id
 586e51a60fabf-35eeb3f0975mr2119493fac.47.1758814535885; Thu, 25 Sep 2025
 08:35:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250923175927.4380-1-raskar.shree97@gmail.com> <68d2f26b.050a0220.2855af.3298@mx.google.com>
In-Reply-To: <68d2f26b.050a0220.2855af.3298@mx.google.com>
From: Shrikant <raskar.shree97@gmail.com>
Date: Thu, 25 Sep 2025 21:05:23 +0530
X-Gm-Features: AS18NWChg2Zt8FiDnBp_hLuK6Lpe42DZ4AYv1HTtF9w_PmqcUeNGnLM0E9DyUUs
Message-ID: <CAHc1_P6J4kOeRiz=0HphC1SJX8MbZDdPasATsHpJz-F2DSughA@mail.gmail.com>
Subject: Re: media: saa6588: Fix unsafe debug printk macro
To: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello CI team,
In the shared patch, printk gets KERN_<LEVEL> as an argument to macro.

On Wed, Sep 24, 2025 at 12:48=E2=80=AFAM Patchwork Integration
<patchwork@media-ci.org> wrote:
>
> Dear Shrikant Raskar:
>
> Thanks for your patches! Unfortunately the Media CI robot detected some
> issues:
>
> # Test checkpatch:./0001-media-saa6588-Fix-unsafe-debug-printk-macro.patc=
h checkpatch
> WARNING: printk() should include KERN_<LEVEL> facility level
> #29: FILE: drivers/media/i2c/saa6588.c:53:
> +#define dprintk(fmt, args...)  do { if (debug) printk(fmt, ##args); } wh=
ile (0)
>
> total: 0 errors, 1 warnings, 0 checks, 8 lines checked
>
>
>
> Please fix your series, and upload a new version. If you have a patchwork
> account, do not forget to mark the current series as Superseded.
>
> For more details, check the full report at:
> https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/849516=
60/artifacts/report.htm .
>
>
>
> Best regards, and Happy Hacking!
> Media CI robot on behalf of the linux-media community.
>
> ---
> Check the latest rules for contributing your patches at:
> https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
>
> If you believe that the CI is wrong, kindly open an issue at
> https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
> to this message.
>

