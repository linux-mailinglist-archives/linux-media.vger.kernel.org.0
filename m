Return-Path: <linux-media+bounces-18687-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E75988242
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 12:10:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B84AE1F22B1B
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 10:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46ED41BC079;
	Fri, 27 Sep 2024 10:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hfpUPOUh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19764185B7C;
	Fri, 27 Sep 2024 10:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727431845; cv=none; b=psdR+mfiBTvNPccgW7EDmQFG1J9XHxU0VC3ukmJNDhFyyl6z24/FwL3V5iNf3P96Pgf+87K/kCLECBFfalnYebJd6WAzlsAXz6vC2t53P3eSZAcKUN5yUGJ36fW7+aU1I1A/bsDyM/WmjMv5UeHc6h7F7GSmaacVNNV3UZ49KTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727431845; c=relaxed/simple;
	bh=OKkJMWMqOPetP2NlKREt/esvyeJgwlCMto1d4Bpxu5M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g5+5QsXxEV7X09V0nncCBk/8L+ACeKh7wBNhiqyQz/Z+qx1tTa8i2uUhjc7/Phu09eqcZyXd4lZfKzlMbI+di88wCtTpZ5pWNylDzzCPPFns5cifUkumVKLiGATUoyDBR4OtMy2srcrRMUFP0LGwZ9NtNwGURlsnL+7Pb51UmfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hfpUPOUh; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2fabd2c4ac0so2207161fa.1;
        Fri, 27 Sep 2024 03:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727431842; x=1728036642; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fygk+mM7NoEIV6VRwm4uS46K3a/TjaOoGKzCjo0g7vk=;
        b=hfpUPOUhOzWn5I+S+MKXJraZAOIZwlHSlJ6OlWcX88W/MDRs/u/gmmYaxmjP2phrXL
         Wkhzo4C2vEB3iXz/mzQ2VeCpOe/Wr814ZZtjsxu+pxntqYLvmUySsdG9jRQAYBktbKRa
         6REe96nw0sktWISaGMXezY2nNCqwLtcXUROBquIb/NMEE6Ruk3Ua7FTQb0I32nqXb9Bw
         eHj2n2ZxpQVKDRft2Dms/auHvUCrTgjT5L0ZL/2cY6d5M04LfkATNFPK3qoTGrNFTwZL
         ew1f5AyyYW4u33et25WXJ+UXf5xSSxhY9x1RUsogY2A7WG0j7b7GlTGWDu6bB4uOKpoE
         XBVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727431842; x=1728036642;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fygk+mM7NoEIV6VRwm4uS46K3a/TjaOoGKzCjo0g7vk=;
        b=BEdzmdeZzZDB+lR2nQNgCUWCD/MjiDdpHXjfRcJE4+uZIjXRtrRehbYprwtxWwP9Ex
         UkNKLjrh5UI4RSBMpz8A4qr6HQACfBLv13xCI05+v0SULNPaKcdWkipnMPX9F8k4L+01
         nmEy/BbovKYb9YhP2iOWzv8uff1QYg0u/zmvNBhXdfJwRjlmnj66h3/CYTNBBe2ufPM7
         6Sz1TI+RXveMhF7KoGUq0RYZq1gwERwO581aVNZpfQhnrPUgMfWndiEMEeK73wk7+KE/
         chaYQrzYM9g6k+jB8vhQrpKy4/q/LMH0SZ//SxSckS2JmtiZmfu/lrIEwRTSkQz2a+zi
         7Yng==
X-Forwarded-Encrypted: i=1; AJvYcCUq9NLob1wM+NH7pkA67TnL3OE8dLffl/o4bz5pHPfRCvWJ00SIDOWCp7c8RfSRQCnd5MAVHJG5eJqH2L0=@vger.kernel.org, AJvYcCV8dJ3xGpbJsZA1e5v0bAc+zU2UveURDIwM01GOCPN9TRy19Wm+47BFnWi7mspKYFb5nWHK1yB9Pmhofgs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTq4GgpdhUyFkvVp+ImUSFwvaiI7bm+ybn0/OjzXNSscOKHlg0
	lhFBj0oVO/alpsmj9Oqanfql7VUHttyqFwWy6xrKCHdTYyWse0fVzSPoS+D9E2YyRFegdbljclR
	opR0FigzUOM7CvT66s47COBGQ9b8=
X-Google-Smtp-Source: AGHT+IGlE3RHUGfXy3qQvFc/07Sqw3cISbgvO+cgEBs4c6MnmnOz4mTcHXqIkra0nfdRwLvtsOkLS4uec4KjbUm3fr8=
X-Received: by 2002:a2e:be27:0:b0:2f6:5df8:bfcb with SMTP id
 38308e7fff4ca-2f9d4199141mr15883531fa.38.1727431841875; Fri, 27 Sep 2024
 03:10:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240927-cocci-6-12-v2-0-1c6ad931959b@chromium.org> <20240927-cocci-6-12-v2-1-1c6ad931959b@chromium.org>
In-Reply-To: <20240927-cocci-6-12-v2-1-1c6ad931959b@chromium.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 27 Sep 2024 13:10:03 +0300
Message-ID: <CAHp75VeGAzU1BT5bE0BrVj4MR=TR2KEzjwhoFUnN5Q=fUanJZg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] media: ti: cal: Use str_up_down()
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Benoit Parrot <bparrot@ti.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@intel.com>, 
	Tianshu Qiu <tian.shu.qiu@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 1:02=E2=80=AFPM Ricardo Ribalda <ribalda@chromium.o=
rg> wrote:
>
> The str_up_down() helper simplifies the code and fixes the following cocc=
i
> warning:
>
> drivers/media/platform/ti/cal/cal-camerarx.c:194:3-9: opportunity for str=
_up_down(enable)

...

>         if (i =3D=3D 10)
>                 phy_err(phy, "Failed to power %s complexio\n",
> -                       enable ? "up" : "down");
> +                       str_up_down(enable);

You never tested this, do not bother to send untested material, please!

--=20
With Best Regards,
Andy Shevchenko

