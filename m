Return-Path: <linux-media+bounces-36449-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C14BEAEFE9E
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 17:47:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C61EB188C3B4
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 15:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B6902797AC;
	Tue,  1 Jul 2025 15:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R3JU/Zsv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE768FC0A;
	Tue,  1 Jul 2025 15:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751384730; cv=none; b=QlEO0MMmHPe1RkUE97Bkg07IJGD4fyh7z4slTr1BFAqqfNMWbiUpocVestnQNbBo9q7eT8sc07LfPCITd1xBgUSog+IYZpqS0k37H8YZlcH2IFN2d7SskilIBsFu/17Iv6i0PzMPo2zU1eCZJfzOtJxVEIJwp7sgz57tOIomHhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751384730; c=relaxed/simple;
	bh=x9UpfN7Aq8UZdSHf7F0rSBCPNJyoVIdHkPVTWuIsxV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VQ0gpoR1oNF8Tlv4IfDl4GHtOsCvNsklb8CMSjv/9hDZ575C+PXPDLZXog1Ty7LQATLlQq9cl1DlH4tkP4J+09TUFFKtOFarvHPIUZ94HIH2vse19ZKDbhxTLOwjSJM3e93CLam8OkL8wRWpWzERpS67d+yS0M8MRY+7aGWNFEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R3JU/Zsv; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e81ed7be66bso506981276.1;
        Tue, 01 Jul 2025 08:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751384728; x=1751989528; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x9UpfN7Aq8UZdSHf7F0rSBCPNJyoVIdHkPVTWuIsxV0=;
        b=R3JU/ZsvfrpZ+kxjDJCnvRfEEK/1F1VfV/4YzXmY98EC4iSlIRAwkrMXG3K+M6JjlU
         p+LLrb62YClyLbA7vkGF3FB9zKUA5dU1YA/azqJCSSG14AWcA704UnKq4hoRjISa4nzU
         E9D5isvgVF4eHBhMz/y26zb6i4g25nQWWNKt7VhEQVlaZIe9CGN4ERS0CXumslFizNGc
         Y7MV4Rzg5uorm1tb9kjfWyBhHFqgi6DTJrsh3vMTbEhP0NJhTxj3sbc80LQyL69JcREA
         HzyM3VzxsfucqvugyVQKrZfUPhwsU7GUGpKsXwaJwI8jEwHQK8adCF3x+HL4fLR66Ma5
         ZlvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751384728; x=1751989528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x9UpfN7Aq8UZdSHf7F0rSBCPNJyoVIdHkPVTWuIsxV0=;
        b=uCfSRnyaqWqo7NAyCo/QQXk7MUojFNWCn0TraNgxEojc8aIh3QV8NpQhhNBrFpQoYe
         BtRtzcNk88ocTVH5tfDbKXQ+LRXGLm+iiVz5ZWlPyS5iSn+9s6T6iw1Pa/Db1FfE0J1Y
         sj8YnqQUxrSKhP5V9zNkJCu9TFbhB1CuBkV02hF/p47dGuO844omrOjnlwDIkfl/Ndjp
         31sJqoWBUaU5Vp30safD8p795JxtJxotPLdMWnr3gTF3Yk2yFesMlwqBegKm1T3sb+K8
         D1Q80TY2F1SdLi44UCMitDKh57RbxN2saVuaOUYmySh88xUPwqcfEGB6O+7Bg0AbHoPx
         B6PA==
X-Forwarded-Encrypted: i=1; AJvYcCU3VfpqOSDV42cW/9+bjGCxoiwDh5scip0i0zxlYm2WVUki9an+ABt0Z1QzeII27/sefgA7aY3lwJYAd14=@vger.kernel.org, AJvYcCWpUyZEUAM1Xkntw8qS5Y+ii0rc9Bir3/jtmGJTcrbb2jHhMXQqCh2FRqHTw1DXuK2VOddK9itpRdwwJtU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9Bo/EUIQjpCavEl/YNAAYL5uJQaxA5JFNOUyPD4MbSxnOkIe0
	RNxIUSeh3F/WiktgFfnNfOWjJsdtqapdYc/CbCdbJTSkZARaBZC3ccCdpl4rpZrLvmXT3pbIidV
	/tN0xyYlqUUzvQ5FN9nwCBobFYLiFPFo=
X-Gm-Gg: ASbGnctJXBov4L1Jko4ZSraG51bhCX1jVoBZlDYHYfQxX5mKgTP6mwwr0ypWeKJe/kZ
	/WLpwnvoG7E9aU+L3yQ49ga+BW2GJ9l9WoWyr7XQQQn9YWvHXvMy+IqBm12qAEBwxxzr2VV6cRJ
	RhFqU3dRNzcaodqumx7xz1zmJgVuinlhSW44iF/INcf0gp+w==
X-Google-Smtp-Source: AGHT+IEfooipUFL2hwnUaoiTlhqVT7e1uGaoiDCZiaLgdwxC88RJN/MSRFR0b9VJBIvYPuc+Lc6i8b7iBiCtDQ3VEyM=
X-Received: by 2002:a05:690c:ec5:b0:712:c5f7:1f02 with SMTP id
 00721157ae682-7163f69edf5mr25050887b3.1.1751384727157; Tue, 01 Jul 2025
 08:45:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250628052536.43737-1-abdelrahmanfekry375@gmail.com>
 <CAHp75Vcy3dHRu8Wb2KZ=xK7adz=-P-iuRTeR8vOWzHzZL9uFeg@mail.gmail.com>
 <CAGn2d8OMRaeozOMxj1Ry8i9T3sJ5J1QqA_Jpk7wYO8KiUbpKBA@mail.gmail.com>
 <aGPYZhK65LaD0wVO@smile.fi.intel.com> <836dc6b6-2821-47fc-8f24-0838f979af76@kernel.org>
In-Reply-To: <836dc6b6-2821-47fc-8f24-0838f979af76@kernel.org>
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Date: Tue, 1 Jul 2025 18:45:15 +0300
X-Gm-Features: Ac12FXz3IpBR6q2hIzNGykMqRbSsh_DeKPnVlA58PidL1Fnwp7Pc6_6q4_-K5EU
Message-ID: <CAGn2d8NBEwWm0mQ0YQ3KZ+V1Zon84zusfsQQV2foVmUTBAzEAQ@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: Fix premature setting of
 HMM_BO_DEVICE_INITED flag
To: Hans de Goede <hansg@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, andy@kernel.org, hdegoede@redhat.com, 
	mchehab@kernel.org, sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	skhan@linuxfoundation.com, dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Tue, Jul 1, 2025 at 4:54=E2=80=AFPM Hans de Goede <hansg@kernel.org> wro=
te:
>
> Hi,
>
> On 1-Jul-25 2:45 PM, Andy Shevchenko wrote:
> > On Tue, Jul 01, 2025 at 02:58:43PM +0300, Abdelrahman Fekry wrote:
> >> Hello Andy,
> >> On Sat, Jun 28, 2025 at 10:52=E2=80=AFPM Andy Shevchenko
> >> <andy.shevchenko@gmail.com> wrote:
> >>> On Sat, Jun 28, 2025 at 8:26=E2=80=AFAM Abdelrahman Fekry
> >>> <abdelrahmanfekry375@gmail.com> wrote:
> >
> >>>> The HMM_BO_DEVICE_INITED flag was being set in hmm_bo_device_init()
> >>>> before key initialization steps like kmem_cache_create(),
> >>>> kmem_cache_alloc(), and __bo_init().
> >>>>
> >>>> This means that if any of these steps fail, the flag remains set,
> >>>> misleading other parts of the driver (e.g. hmm_bo_alloc())
> >>>> into thinking the device is initialized. This could lead
> >>>> to undefined behavior or invalid memory use.
> >>>
> >>> Nice. Can you make some fault injection (temporary by modifying the
> >>> code to always fail, for example) and actually prove this in practice=
?
> >>> If so, the few (important) lines from the given Oops would be nice to
> >>> have here.
> >
> >> I have been trying to test it without having any intel atomisp
> >> hardware and failed continuously, do you have any tips or maybe some
> >> resources on how i can test this driver.
> >
> > So, the easiest way as I can see it is to ask people who possess the HW=
 to
> > test, but you need to provide a testing patch (which can be applied on =
top
> > of this one, for example).
>
> I don't think it is worth testing the error path here,
> the old code is obviously wrong.
>
> What is interesting here is to see if the extra call to hmm_init()
> in __hmm_alloc() is necessary at all.
>
i think its redundant because in all scenarios hmm_init() should
be called before hmm_alloc()

> And obviously hmm_init() needs to propagate the error return
> from hmm_bo_init() right away instead of continuing if nothing
> was wrong and then only returning the error at the end.
>
> So it seems that there plenty of cleanup to do around this
> without needing error injection to test all paths.
>
> Actually I'm pretty sure that there will be quite a few
> error-handling paths with bugs in the atomisp code given
> its overall quality. But lets clean things up first, that
> should make addressing any such cases easier.
>
I totally agree with this , i have submitted a patch that cleans the
custom sysfs atrributes
as you suggested as a beginning , the patch got reviewed by andy and dan
here is the link
https://lore.kernel.org/all/20250627100604.29061-1-abdelrahmanfekry375@gmai=
l.com/

What do you think I should work on next after these two patches, do
you have any suggestions?

> Regards,
>
> Hans
>
Best Regards,
Abdelrahman Fekry

