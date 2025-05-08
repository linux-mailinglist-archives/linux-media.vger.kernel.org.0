Return-Path: <linux-media+bounces-32041-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3129BAAFDCF
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 16:52:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9AD8F9E1AA3
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 14:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B469E278E5A;
	Thu,  8 May 2025 14:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dupXP0zB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7385126F478;
	Thu,  8 May 2025 14:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746715940; cv=none; b=uWtegXSuwMDurlgfxquocPpL6YoRPyWJqxAFcUwgPA1MGI3+UpssniXYdO+Gv3LxDu91upThjS8vGzIpYXkzBPcRLuZXJbB9bP7SaZRLSN97916mi9xz4JAdFtMh4EesdAycGkiYjL6AvfWBG4yUbdEqmGpyJKS3pVNcuUvG6jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746715940; c=relaxed/simple;
	bh=zEFQKGgwI3EuuNl71JKybObkFkPSlGU5AwxHNXv2Yqo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G3jfDb+QwoRV1U21TuQ0Cd8D7u9qCaQZoic0rnvP4+1m+fnMJl42egGTkD4r3oZUROGMhtVvSOmvqr+cEOWmL8kmZVX32HbohrBY/TIqZNy+EdAOwxfcHH+AVYAES4RiLSgImKXw0WS+nlvHQlo33xcs/iNWQj3oOk0kB9I3Uao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dupXP0zB; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5fbfa0a7d2cso1766660a12.1;
        Thu, 08 May 2025 07:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746715936; x=1747320736; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zEFQKGgwI3EuuNl71JKybObkFkPSlGU5AwxHNXv2Yqo=;
        b=dupXP0zBPRIwf7mUJoDxNvliB+r8+X9Tl7EyBi3q+KlF2sq4HmyQKOoZCI4RUfLHrE
         vk7lcuzHbZ9U02ClL/mhCZjLwh8lLHbMR1sM9rgEgZl79XEDbTqdzVn2bN6SQ49y5j8A
         af8gQIWUjOX+5L0ex2PROBqpycolrg33OkxPwO18WKE4StUbjbBn4qK3EkUMuVhlGErU
         dbCxScqqkdJbJyasdSqKUUaEbSi0v7pVt/RQ/1EZKORmYlh8cXXzWVQujXCmQThYU/2C
         8q6sqk/j/qEC9wjKv43azNkF1d9x6ZtHpJZJgot12nMVYDyCzvzOD3Dw7L61o58iNGbh
         qjOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746715936; x=1747320736;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zEFQKGgwI3EuuNl71JKybObkFkPSlGU5AwxHNXv2Yqo=;
        b=tkvCrvy2oEymtZuok9lwUkI0nKKc1TsEMQWJ4YtIGAXkXkgFvkaTWK2rWhBodWiMyA
         T8BXzHd1D7f/hWRh7L2UEYT9OstLAD1P3m0oyOvJmRH5wLSxLXIfntJsVKixEoVatFTH
         8Qi5Jxh34HqNqcad7ORY3n5rZHDhhN4bNRQUJjXcE1y56Cfhu2PVD5VAYr/lRYcDfWGJ
         Km4H0PgbQ4hOpVpDITHoUoCM7MH/VDMgT91gkiCpJQu1GYHhjFW3GivKLGE8gv1HgDAg
         n8Cr1IacmIlEqJcptKFNl3wqF/yxSbHJh6puNxDQ1RSr0m9ZBE0x1GT/l+wcK4+Slgw7
         1gNg==
X-Forwarded-Encrypted: i=1; AJvYcCU9qpDsEYfPRMxkdcHApVI4sVnEUco4xfo5BJSjh0zxntWTWSP1m2fqt/Q5rZFJBfe2D7SvILARp0zK0g==@vger.kernel.org, AJvYcCVrQPLVpomtS8mQxxNjCe3efZmC7tADdi1ps+jtinf/ZHW0Ewyr+YU04MlqhYb8Mr4Szvn5M+I6vj0WPNqlySKCc5c1ug==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzbaGen1sTJq0K2uT3z9DB0N/bolyQfh94Gt9BaIsnSye43XGu
	U3otvAcSbDziEeC8xKjHHhWVFDDYx0lH1kVKIjtvqzBWQ7UBVh2OtTNsjE+2unGOcDLBBqTfBfW
	zUx36k83WlICnb4XnQibQTGkVCr7Rcsgk
X-Gm-Gg: ASbGncurPTH0iuckDCGtYv98wxKxanprubrnaMvVkXawJXZSfDz4y61cvNPaPiuWAED
	dxg/BNoZLbsYEJiSJuTyEWwwUCQEq2Jr8VCX1eKGqQo4xKbrX6D/0xj98AAzSFmb+XBMvV4P/iH
	wbXyIFZai4m24qMSQHzVJ8/XwY+3QzkqO7eZk=
X-Google-Smtp-Source: AGHT+IEsBSgz01pN0cO0LMyNdDhLRDOkfYDqhopudgY64WYs/wE/MG9dZJytCNFvXTnZfnCJSptlrpMURSb7NIV+ZPA=
X-Received: by 2002:a17:907:7ea3:b0:aca:cb18:9ad0 with SMTP id
 a640c23a62f3a-ad1fe9a0a38mr368434666b.45.1746715935518; Thu, 08 May 2025
 07:52:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507184737.154747-1-hdegoede@redhat.com> <CAHp75Vcb-fcQHWqVDh=KUwhwvSP6KqUN8FsAMvDuwF2iD7=J1A@mail.gmail.com>
 <dc3b07a9-cb0f-4f84-9e4b-c6e62ffc73df@redhat.com>
In-Reply-To: <dc3b07a9-cb0f-4f84-9e4b-c6e62ffc73df@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 8 May 2025 17:51:38 +0300
X-Gm-Features: ATxdqUFyJujkSMlNxfUR3sdhq60BrkQnbnimnNRw0lOBs81u2F_A0KBZ58L_uxM
Message-ID: <CAHp75VfDoR6wP00e=3YiYSLwXV0f6jygJaxQY2gyUE2aPKNxvg@mail.gmail.com>
Subject: Re: [PATCH 0/6] platform/x86: int3472: Allow re-using sensor GPIO
 mapping in atomisp
To: Hans de Goede <hdegoede@redhat.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 8, 2025 at 5:00=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
> On 8-May-25 10:36 AM, Andy Shevchenko wrote:
> > On Wed, May 7, 2025 at 9:52=E2=80=AFPM Hans de Goede <hdegoede@redhat.c=
om> wrote:

...

> > Can you isolate GPIO
> > mapping code in a separate file, please? This will help to generalise
> > this code outside of two mentioned drivers (I might need it in the
> > future for something else, not related to cameras at all).
>
> If you want to re-use this elsewhere then splitting it out
> further sounds like a good plan.
>
> But which bits do you need? Do you actually need the full code calling
> the special DSM and then adding either GPIO-lookups, or gpio controlled
> regulators / clks / LEDs ?
>
> Because atm the int3472/discrete.c + other c files linked into the .ko
> does all of that and for the atomisp2 case we actually want all of
> that (although for now GPIO -> clk and LED is unused there).

I basically want to have remap\ing quirk part to be isolated.

> Anyway I think it would be best for you (Andy) to come up with
> a proposal / RFC patch series to split out what you need. I'm certainly
> open to that and happy to review such a series.

Fine, but can you do this in the discrete.c internally, like an
embedded C file so it doesn't require headers to be used, but being an
interface-ready solution?

--=20
With Best Regards,
Andy Shevchenko

