Return-Path: <linux-media+bounces-36984-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCE1AFB1DC
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 12:59:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C555422178
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 10:58:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BE8629AAEA;
	Mon,  7 Jul 2025 10:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RsinOqdg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E141C1F2F;
	Mon,  7 Jul 2025 10:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751885878; cv=none; b=BFr6WzpbID2E+Pww6eQkFFdel8KMn9zN79ev6XvKUfCOguLVJI5AZeCuy78V7L0W+j20AdOuwVTcasb2MMtZEn06hAs1ybzhhIbOLQ4W59p8twZtl6ePWY7cjcB3VEba9pl/SA5MsDkMjuOUNQPLzhG+T+FVKTf8sgQpUj2kt0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751885878; c=relaxed/simple;
	bh=CjdYiBoeMS7qseIEcuh47YFTpqlehtkQQLEcP/t1k+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z3c+8y4rS50cI2tRT42UpBhkJvUAk52O15UHY0q32e+4Doz4+B2tj0zLNNUaWS3jmw3XrrspCr33UP3Tkw4gopGR6win/Gv4XBFFf1lrhjQk0juuV9Pn0WU1Pwc0R1sAlD7Vxl/inUciKithf3s0tiI0J4P27+9sAxd7a/MM+Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RsinOqdg; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e81881bdd55so334977276.0;
        Mon, 07 Jul 2025 03:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751885874; x=1752490674; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7ioNsEHWfe5qdqz4ks5nH1iCIyBMczU2uy4kn1CK7dc=;
        b=RsinOqdgYUsRil4WkuVN4QJDyDoVn6PeypxSbsSkssBxpB4f/Vx1BNeKBqpC9J1ny+
         GF3p43/x0BzQD7+KH3gsoTVgegLDLGUlJXzMeFW/QlB3JJs5H33dH5fMKhDhbUdUw30W
         eibbKjZNypDjRWSzrIjMHUrC3+9brnWZCrIcO+salJ8WNt5sCOc7+YEFmfHHcN6L+i7A
         VSelkzL7oBYlqr5MoYc/vM4JSTwQsxh2ofh4fH/eR+J+xmcDx9APjy9vHVSKXoI9VWSm
         6JJHLe0sBPiDIbdT38jXtPCI7cftNR6f4Qm/ywAkZlH8+aNLqynlc7TEHN/qpb2pBgbY
         wPOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751885874; x=1752490674;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ioNsEHWfe5qdqz4ks5nH1iCIyBMczU2uy4kn1CK7dc=;
        b=AjScReMPSSDAtTgDHQwQ/UQidNkGb4B2SaEtDsJUCB5hZ1doTVT5Uz7iywvCvFRqK5
         SeNvpP5zu341UU0/JphSwlEE5jRXsaiIHnSzVrrm5LXOgza4fWoNHpdzPMx/HyTVC3pH
         VZv1EvTWgvJoZaY0WadWjR2MwE4oKqGwIKWCq9jyq3yeVw9DG4UpwEVRgXt77YYabDIo
         Wn0oBPocdvpESJ8VUAFtdTvra9aBja/Uh41XWZjvDh8izU1g3iAZfwfJk1yn52R8gVHG
         VTw7A+cWCEcA7gCdYrT8h0qOZwJsS3nwqzLgvZvpymwoVzEmQYXTUyhUbyy1wHorTc7d
         OMmA==
X-Forwarded-Encrypted: i=1; AJvYcCV3GhM0M/5FAi3Mb81huYA4hW5MXm2OoW0zgSR2FueO5qgEDnoklrlvRQvlHAWNkYmrsWaRXLtjJOzha/Q=@vger.kernel.org, AJvYcCVPBDC/C1TjGjEpDo0wJ73leqngaYgO3yb8Rqrdc4l+mMXVCsGug+ZABR9dgxxhgQT1d0Llrk7EVp2UrkM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3ysWxCPcLp6pOuCISU3i3XWUG/4Io4JKgqzj93zeyylAuF4oG
	GEezK1j6XG7bbp3wxvgKqNONcw3LhMvylCf0MVvyJX/Hjr6AOkhEz+/ZVspKZgDOrfvptKEyBQA
	GLKPrSN0wnWnuNGyYTKrzo8Xe41hhUfn3s+u5
X-Gm-Gg: ASbGncvg53RuPbuo9YSWbfopC/Q47jyukW+HWnOYXj3gISQdgRMgf2J9oQEeXJAiDJp
	8eUiusalnxav5u1Co4iqbI58idbpAlHb3zSh86aH3nHN1i39ueLUPUDEuAuXnPib7BRIRIk1G4R
	C4voiRSAl5dbvvWNfVWJSXywVE7L7V9qkbjIzI9cKrdZ0=
X-Google-Smtp-Source: AGHT+IGC8/osnImIufkkdDbo94SnWRe56rECvcr4sumXfQ1CXHwC0L1J81sjFCmHQGPgO6vDkShX/OtMSww4Y9CubhI=
X-Received: by 2002:a05:690c:1a:b0:712:b566:bf7c with SMTP id
 00721157ae682-71669eb7e1bmr71790577b3.1.1751885873842; Mon, 07 Jul 2025
 03:57:53 -0700 (PDT)
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
 <CAGn2d8NBEwWm0mQ0YQ3KZ+V1Zon84zusfsQQV2foVmUTBAzEAQ@mail.gmail.com> <fbfbd0e5-2c27-4f32-a3d7-9cf57fde5098@kernel.org>
In-Reply-To: <fbfbd0e5-2c27-4f32-a3d7-9cf57fde5098@kernel.org>
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Date: Mon, 7 Jul 2025 13:57:41 +0300
X-Gm-Features: Ac12FXw7W1irHG_Shk7SGyIt6mDyRdJM1OxzhEC8PPcEWPID0WwjfabTg3nNrbQ
Message-ID: <CAGn2d8OrhbJ_MqZEwfCrXy27+-a_6JVDQW_TVmVHM=mWbcEe2w@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: Fix premature setting of
 HMM_BO_DEVICE_INITED flag
To: Hans de Goede <hansg@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, andy@kernel.org, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	skhan@linuxfoundation.com, dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"

Hi Hans,
Thank you so much for your support and guidance. It really helps a lot.

> The hmm_alloc code can use some more cleanups:
>
> * hmm_get_mmu_base_addr() should be moved to drivers/staging/media/atomisp/pci/hmm/hmm.c
>   and then the "struct hmm_bo_device bo_device;" in hmm.c can be made static
>
On it .

> * hmm_init() sets hmm_initialized = true even on errors. It should
>   immediately exit (return ret) on errors instead of continue-ing
>   with calling hmm_alloc() even though hmm_bo_device_init() failed.

I have created a patch for this but i was waiting for the other patch on
hmm_init() to be applied because it builds on it.

> * I've checked the code and hmm_init() is called before any hmm_alloc()
>   calls are made so the extra hmm_init() call in __hmm_alloc() can be
>   dropped.

Same for this too , i was just waiting for the prev patch to get
applied to avoid conflicts.

> * After dropping the extra hmm_init() call in __hmm_alloc() the
>   hmm_initialized flag can be removed since it is now no longer read
>   anywhere.
>
I agree with this too , will do it

> Regards,
>
> Hans
Thank you
Abdelrahman Fekry

