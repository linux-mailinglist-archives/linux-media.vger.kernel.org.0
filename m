Return-Path: <linux-media+bounces-36726-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E3159AF82CA
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 23:44:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFA4D18976C3
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 21:45:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25A882BF3C5;
	Thu,  3 Jul 2025 21:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UWmpe8ad"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A24528A1F8;
	Thu,  3 Jul 2025 21:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751579079; cv=none; b=NuMaUvGTNMukoaTlxrNt1CFKEDf5sjzVDgsdndaQkgJWdFW8dXW99qc5CwDxP2RDQlMSGaOYonDENgtt7a7GFN12M4+EXqOuwe1R0zTD16kvkUflFNJtLfnk/hlu+X1kyV/dn4gfRVeyfZnIZNojYoyiVB2bvSjZpTW2i/QeyGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751579079; c=relaxed/simple;
	bh=IIoeyyq1GZIa2BjYk3OpqgiSGOD9oO9LywnSHtt7jvU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fvShPOok6PRQSUQagdiPrrFc8v11gOXtGBuxnWLfPPTV+terG15YwOrzMRcOSAaRiUgJEEcisNQ7ppCxEozRreaPJmvAR43cWNMWvD68Dy+9kgOB7+agH0eB193BENm+X9BJO04TwZKeq8Og2w78ax2dRCi4cxuJysdt3sstFfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UWmpe8ad; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-60c79bedc19so490096a12.3;
        Thu, 03 Jul 2025 14:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751579075; x=1752183875; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IIoeyyq1GZIa2BjYk3OpqgiSGOD9oO9LywnSHtt7jvU=;
        b=UWmpe8adDfGOpGY0/t/bS9mEvmIzgwuwtWV2nJiPaLbgbUH8l5fxy+Iy5vDTjvcwIN
         oRhCC3aiTtyZuaRUlQJX4owMEVmRhfxbpn3QGK9pkmkQFWNxHDEWwjNV8cRw2uiyM8kq
         yQYlQ9OHQE3HKwArB6fMEuH1s96bo+m+JPQGURcW9xPG07GWoJEke9R2uKQgMQIxdvfc
         /wViav3rpl+V3lQy7jhShrLdMqIsiLS5adLTMhPmQvDAmaE+HcCF0mqxV9lpl79EvkK7
         rt4suVb64yvgOnaGiT2Kbg5nca9+wjDBwYdshH40a/0TICTYK1qlTjwRr4OFeUvMXRlP
         1z9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751579075; x=1752183875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IIoeyyq1GZIa2BjYk3OpqgiSGOD9oO9LywnSHtt7jvU=;
        b=kr/GcY6/U0Oz0+fC0zU+PxD6iwOrMbPyg5T4f1QNZQFJNP6490WjROuTHpcS+qDuzv
         vRIOK0HY5EiXP5uUaAjdxtetXzOO604ys7xnxcpRHPxByyApL2LwPR+lAY11RS2czUGE
         kNBeypaqLQ23XLpfOrMGQntS1GI3wtDtQ5ABIXPWuODBcxZWQ/dkxhHVY8mZH3lwhEgC
         He0Za9ZnKnuA0GNx6vnsPAlWmRtU2ZfAek3CmiemlGlq4mAxyBZv8rJyA33N7XodyDK/
         ST56elmW0LxZ4ggo0X8TwnNOlQ1rA9dGzm11M6qQt8+igFafRbZls9R84t4y3zS/faqD
         +h8Q==
X-Forwarded-Encrypted: i=1; AJvYcCX9V5H67XXVuY8UZLr5Yy0iPgx3s9pisAtdrht1vt4s8jdfXiMGkBPIN9Ze77iEGqUL5JC4izDibhhfVAQ=@vger.kernel.org, AJvYcCXnQ/VrGlqr9S/8wzXp558bBxTq+EFN3TSEFBB6VQtuOCyuIbAyOAj1VK0JZy2wshTTnjyd/I2KCzuB8VM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjKK9JTAVZrZcaYJNvOg9XLlPWz3TY1NtrIx9+AYNu8c63jrrO
	5jIKz+AUxYRcggdTt1ufEi0iW6prXAfo5IPlNckC8QE8rlm/axtYHgrGbhdTKRnx7YP7N9H7QsC
	ztsi8uBwHJ6LRCqV7xlJ9OELrhNaIXYyfcCHGDJZ8+A==
X-Gm-Gg: ASbGncsLkxBNqVzPjnCqnw5Tr6wBJWMSb92ClQ7UGoBokt1vwltVLRvDYyjPWgw93a+
	xepdLJ84G6PfsV5qNOfDRhqv+F109KPiYZbTfzjmu+QFGHeGOLMx2lEXsT0eI+XC1HdRkDwinBp
	uhWcvRdYtRiWbYZFYO05zPjQcges+K6h/uwA/IbwAMTHk=
X-Google-Smtp-Source: AGHT+IHp4LtpoHgPrz8vKo5NxF0850fg3ZRp89l0VEVuQnqdnTSUiMkcg6zqLhd4WpnMFCUIhnuEr8ripxN8lv9rITI=
X-Received: by 2002:a17:907:3e9f:b0:ade:4339:9358 with SMTP id
 a640c23a62f3a-ae3fbc5bcc1mr11741166b.22.1751579075044; Thu, 03 Jul 2025
 14:44:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250703163350.5163-1-abdelrahmanfekry375@gmail.com>
In-Reply-To: <20250703163350.5163-1-abdelrahmanfekry375@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 4 Jul 2025 00:43:58 +0300
X-Gm-Features: Ac12FXyhrh_8lMHSEmUBcj2pEZdCZKx9DoJsYb6ibx03ED0ZVcENiX9lPD_jlAo
Message-ID: <CAHp75VfOVksdSwLjWPZqSeRS9_zxSKp=DD2xL06TPnjy5N2jzg@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: Remove custom sysfs attributes
 from atomisp_drvfs.c
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.org, 
	andy@kernel.org, gregkh@linuxfoundation.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, 
	dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 3, 2025 at 7:34=E2=80=AFPM Abdelrahman Fekry
<abdelrahmanfekry375@gmail.com> wrote:
>
> Continue the process of atomisp driver cleanup as dicussed with hans
> and andy in [1].
>
> Tackle TODO item "Remove custom sysfs files created by atomisp_drvfs.c":
> - Removing dbglvl, dbgfun, and dbgopt sysfs attributes
> - Eliminating their show/store handler functions
> - Deleting the attribute group definitions
> - Preserving dbg_attr_groups[] as an empty array for compatibility

> [1]: https://lore.kernel.org/all/836dc6b6-2821-47fc-8f24-0838f979af76@ker=
nel.org/
>

Make this Link tag:

Link: https://lore.kernel.org/all/836dc6b6-2821-47fc-8f24-0838f979af76@kern=
el.org/
[1]

> Suggested-by: Hans de Goede <hansg@kernel.org>
> Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>

Change LGTM,
Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko

