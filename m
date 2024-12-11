Return-Path: <linux-media+bounces-23161-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DB39EC6F2
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 09:19:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87760188C0B9
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 08:19:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6CCF1DB956;
	Wed, 11 Dec 2024 08:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Azb14DTO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E231D86E6
	for <linux-media@vger.kernel.org>; Wed, 11 Dec 2024 08:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733905165; cv=none; b=X3hzo6CKRdKiS589EwS3JxlDGEyKWaq3EXy6BGP5RCskU0d4ghZu102qtVXUFTnT8zSmHO0xWCF426VJntqNeHPZ9DOElUvIUAJ+tB80H93SL2aSHqVu6PYplAlicSOKFNkVgnpk/xqp02OPB2cWoAXrIDl61syY0kz+BCKgkjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733905165; c=relaxed/simple;
	bh=Lsm8C3031w9xBCb23/cgZ3DoZ2ls3z/NYBjnTBCzjJc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=izxyFXpKbUtWg5DjhUXe0aHDAqeoqiN5rJPSjIxoZa06dhXL38qedEzvU2We0XHjA4KwJRM1hodhzMXo0HQ4SWAgrOWHi6mscm0dUxA1g0TIC4KID5lERbL9QkHL2GE3AZVAzVyWpO4xWJcjS+GnZnkIGAXiPEn+xt9XbBs8jsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Azb14DTO; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2ef6af22ea8so4589706a91.0
        for <linux-media@vger.kernel.org>; Wed, 11 Dec 2024 00:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733905163; x=1734509963; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S37tUa9+4E/BElh55Abu22jNluchZXe2JCq2BZHuzPc=;
        b=Azb14DTO09RsweCQU1LRUGl39Foo3hyivMjcSvFEbcLy3WALRPDbdSvtdqtom4mHCz
         m/+1rypVrApr1bb5Sqm/fqDTI4liuIrklJod+Z3hXEpSzndxTEW8RYamPUFAAHWIc6aC
         j9BHGxv2YvPKcBDmFb9AD52gffQ5J/NefUV+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733905163; x=1734509963;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S37tUa9+4E/BElh55Abu22jNluchZXe2JCq2BZHuzPc=;
        b=l9iJESSGX4puAUIeDm3fJqZRErO7jhDO4rxxNfjNBxdDz0TgH6D19Dtentlg9C1u5v
         AL5+p3Z4JuQPYn9XWNqdesG00oA1utd0rtPtRLZoJx0jeWbK8/Vjr/0ivsvs1vGNBoi3
         fWkWOg12NulAV/AbRYUVq0qBhZGuEysg9AHqnvZ4jVglyWVvbffkam9Iln8oFwK9DrPS
         RplZtE0s5BLkIOXkyDXSys+dxi+0ViVT+G9nNe21offKpnFbkTsdYkaX7BSy7GhKFyu9
         c4RRhr9UtrcsuaOlRkyzfEmxYoqpD2wyNnHI9PsjHwoWUvq4MsKGIn//cU3JY8cmigUm
         jU+g==
X-Forwarded-Encrypted: i=1; AJvYcCWBsAa6VOkSqd/FVcpUMRdUxz9bmA5/V2DthhvJ2XSFjXOMhquo9gVUcwTuCDn5SIvRhP96zyVKuoqjTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwY+NOsH++/zJHZmR9kfnuVfb1ArlCNXxgYgENFNHp/FQG11opY
	cruR7dV/da8AFAZWTNub37fe5Fj3K/hcHcX7Pw5dlavrErahIRTbPy3zySDMR9/Lt3fEhzVla7s
	=
X-Gm-Gg: ASbGncuI8TM/tM2uEQXhQtpc23JsE07wxEZwgJMSqBSdzPapM2ScFY8KTZjU+FMbbKL
	L3bLIaZHPiYFnBFnNrsQBFozWQKIXEo8psCUw2Xts7JijW1rCK+sOhSeeWCYf9Hn8LdnTygwgoo
	6qHl33NTqRdyntSFgb/yUBUKuNSnqP89qktmzQ8KHxiDxFYG9yF9zj54gyS6Tv/85e4dmUvN5Be
	oKREAB3M4maqcNs3X9kFDwD56anou9xo7sOv/Ii9UY8uTOArkFntImBE0Qw4Tx2AE1QvSPjN254
	0jOewB7YI4nV+UOCAw8l
X-Google-Smtp-Source: AGHT+IFVNckM/10TAnOz4eqZeX1KpBOgrL9lJweaoe9XnDDm32QVGO481uv6OHkXgQflQS5dO8sftQ==
X-Received: by 2002:a17:90b:4c50:b0:2ee:535f:ac27 with SMTP id 98e67ed59e1d1-2f1280482a1mr3152832a91.33.1733905162948;
        Wed, 11 Dec 2024 00:19:22 -0800 (PST)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com. [209.85.215.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef45fa64c7sm11044112a91.29.2024.12.11.00.19.19
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 00:19:19 -0800 (PST)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7f46d5d1ad5so4829016a12.3
        for <linux-media@vger.kernel.org>; Wed, 11 Dec 2024 00:19:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUdduo/XhIhpbNg3DRKC0x8Oz+VwfORVLpLl6PSdA2JBuXI5d+EyQ4y0s3PoFeIStOknGNj4tDL1I33ZA==@vger.kernel.org
X-Received: by 2002:a17:90b:1d91:b0:2ee:f687:6acb with SMTP id
 98e67ed59e1d1-2f127fc7278mr3021275a91.13.1733905159097; Wed, 11 Dec 2024
 00:19:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241210-fix-ipu-v3-0-00e409c84a6c@chromium.org>
 <20241210-fix-ipu-v3-1-00e409c84a6c@chromium.org> <20241211091147.717e53a4@foz.lan>
In-Reply-To: <20241211091147.717e53a4@foz.lan>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 11 Dec 2024 09:19:07 +0100
X-Gmail-Original-Message-ID: <CANiDSCvkBvdstVn4GwtdNiJhs67TO6rXVBcsdfRJNgNMXkjvKA@mail.gmail.com>
X-Gm-Features: AZHOrDm09Y0n30eCWNJ7YxalIcoq21V7pnpLmE36rjaksDFouTGIwgN4Tsc_yGk
Message-ID: <CANiDSCvkBvdstVn4GwtdNiJhs67TO6rXVBcsdfRJNgNMXkjvKA@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] media: ipu-bridge: Fix warning when !ACPI
To: Mauro Carvalho Chehab <maurochehab@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Robert Moore <robert.moore@intel.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi Mauro

On Wed, 11 Dec 2024 at 09:15, Mauro Carvalho Chehab
<maurochehab@gmail.com> wrote:
>
> Em Tue, 10 Dec 2024 19:55:58 +0000
> Ricardo Ribalda <ribalda@chromium.org> escreveu:
>
> > One of the quirks that we introduced to build with !ACPI && COMPILE_TEST
> > throws the following smatch warning:
> > drivers/media/pci/intel/ipu-bridge.c:752 ipu_bridge_ivsc_is_ready() warn: iterator 'i' not incremented
> >
> > Fix it by replacing the condition.
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/r/202411221147.N6w23gDo-lkp@intel.com/
> > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Closes: https://lore.kernel.org/r/202411221147.N6w23gDo-lkp@intel.com/
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/pci/intel/ipu-bridge.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
> > index a0e9a71580b5..be82bc3e27d0 100644
> > --- a/drivers/media/pci/intel/ipu-bridge.c
> > +++ b/drivers/media/pci/intel/ipu-bridge.c
> > @@ -774,7 +774,7 @@ static int ipu_bridge_ivsc_is_ready(void)
> >
> >               for_each_acpi_dev_match(sensor_adev, cfg->hid, NULL, -1) {
> >  #else
> > -             while (true) {
> > +             while (false) {
> >                       sensor_adev = NULL;
> >  #endif
>
> The better would be to just remove all #if and handle ACPI compatibility
> with COMPILE_TEST inside acpi headers.
>
> Besides that, t sounds that patch 2 makes this hack unneeded, as you added
> a false check at the for macro:
>
>         #define for_each_acpi_dev_match(adev, hid, uid, hrv)                    \
>         for (adev = NULL; false && (hid) && (uid) && (hrv);)
>
> Please place only one set of subsystem maintainers at the To: line,
> directing to the one(s) you expect to merge this series.
>
> In this particular case, the one to be added should be the ACPI
> maintainers.

The plan was to land 1/7 via the media tree with a PR from Sakari soonish.

I believe he has already picked it on his tree. I will remove you from
Cc in the next version

thanks :)

>
> Regards,
> Mauro



-- 
Ricardo Ribalda

