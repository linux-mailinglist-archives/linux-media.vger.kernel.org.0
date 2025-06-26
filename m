Return-Path: <linux-media+bounces-36021-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FCEAEA25A
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 17:22:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0CAE3BC241
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 15:19:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F109A1C84A5;
	Thu, 26 Jun 2025 15:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TW4qFg3n"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73A428934F;
	Thu, 26 Jun 2025 15:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750951194; cv=none; b=a3b433ckQVchAu/L9PD7Y6pPe/pJFR2rSiAV2EaSNNjwI6OvpDMbV/GgAorE70S0pkHiBGbqDxtivsqlc/rw+xR2o4V7Wjugwc4qxvprCE9LnMTkR2fJq3FZMgwV6YZlh19Seo/3p5Pew9RXdTTQQV9VxhHrklMUSOP1qR/ZbyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750951194; c=relaxed/simple;
	bh=R+c2qSbTSKIC0tT9gkvNPds08WjRbxM6PibZWtchYDQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bTr/HIRSqtuYhk4cm9izajXqKwi2DntmLHcFBhs7SviWUp4BkcxwxotlAVKl0idsTQ7wh1D5aeqhs++xa1Ls5JIHnw77rsCTPTXpwTCIkC8D+6zOMFaGvn5EJ2RAdt7dlHh3n93DTZKxQTpxj+4/dI2TlXWmmCYzGPGR8sC6Pk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TW4qFg3n; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-70cb9ae5479so1059627b3.2;
        Thu, 26 Jun 2025 08:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750951192; x=1751555992; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1JJKqMrEaML+dwFM/EI98+cWAy1tTBYyBi2gNj/iDEY=;
        b=TW4qFg3nmfLHuwAup57tF9TA1VkJVIjV0M+jCX0dB+A+BCvrhsRDivMDoecAWL2Onb
         69UL6I6LN4c4Np4KEdcMgwBQOqil3ACAbhFFplU1TkVy1Wa7xW4jElxJpwcAassV0xet
         XVa2LnXI0U7BwI2YKmlxJD+gZohpQxdTelaIZDN8jiyqN7wGI9PwovZr9An7ZjRbQqCR
         aRXZhxibXpoTfXQFjlT1qCNBPFGoRCbY9i5Cr75tRCg2rwyp+Ke71blLGIR1hpU9Bu9q
         77JaSQzYe3EsoChbtklwRy+BCRjl5qKxX3eGaAWwIHpqk/O7izHuZRjwSDkY3dKM+6kn
         EJGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750951192; x=1751555992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1JJKqMrEaML+dwFM/EI98+cWAy1tTBYyBi2gNj/iDEY=;
        b=c9x2G30cp7AzAM9l9Thr9Xi0IWSHoxrMrdtqPui40N5LyJT0b8I6iSPAucn7oDoBV9
         XQG3j6R/r40WK+Inaqm7culul/Q5EIBxdtSRcpAJE8Joq71nmh4nlhjO9fsmNSYE4bkd
         1bU55PXQwn+0qKPIXICmT9eb6qxHRbgu6oBrBXRTGX+oh5THFhcrJo2Pjg+1ihkCbHus
         oUJLgY5NsfjVbMRSJ56GKcLFoRPjp0t2ZzwduSbL8xTQjQBjWXSdIXBOzrzRv8KvoP35
         GJuEpUFHWc6PxgxFp0a+s9ObwbPvwCyUyMIEi5g15WadtPy8RkBys5TFKk+/E5qFMEXt
         2wtw==
X-Forwarded-Encrypted: i=1; AJvYcCUfAorICBgkGlJdbisrTFqJejMZmqpEozAizupOCg8ElDMJnITRZcdMvoQsIXTp961HulGnd94iq+onqQw=@vger.kernel.org, AJvYcCXyZEwsfCRgJ1sLbvPCV2ogPUWcj46uPjKa20tDEmaWcMZLID9+l6hLw1wc6wQCGR052xrIuS3FnUJ1fY4=@vger.kernel.org
X-Gm-Message-State: AOJu0YypVUaq6IhlkQGPlInCmQKKnfc/ucdcew2Eeu2X9ed/Z2mcikyi
	//MMJQ6HJWeTW6D95gnotKa35sBztT4s9C7PDjJRIDlGNb39vdhqzzOHI0QTBCsK8ugWz1WiHxc
	dFN+NQfwPF9TDG+oLXu8ib3sRudrwfBM=
X-Gm-Gg: ASbGncu9DAN9NPQa2HzMn1R8tfi1XV21fB7jvgVn6DWsE718Neq5c5YX2mFX/DKT9Wg
	vqYBYTxv6Tss7pG+T5f73gbP/YiuXvfgz79w1OzUyjEY/TI7Fv99Y+zLtkfR0Zsst0fWb5qudhm
	GbjsWCcsdkrdgIXIOu7/CO3O9Y0KKBDONexlIAKDgYQrzw279R/vPp
X-Google-Smtp-Source: AGHT+IFOnJmKn+JJ2frYecHk4EE6Fmul0pWhubm7itDVDM5Ubw/30TpmRooTP07goDGc31er/cpoSSsTxEwrFRlC4XA=
X-Received: by 2002:a05:690c:6f84:b0:70f:7bea:5dd with SMTP id
 00721157ae682-71406e1368emr44684307b3.9.1750951191557; Thu, 26 Jun 2025
 08:19:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624144943.39297-1-abdelrahmanfekry375@gmail.com>
 <cef03d37-715c-47a8-81d4-0872d505c39b@suswa.mountain> <CAGn2d8ML8eTcN2G18B7FYkapROnOeAKJir5fJvOXDdXTLY43aQ@mail.gmail.com>
 <5ce9dac3-0b7a-45d1-8313-2f65165b50e7@suswa.mountain> <CAGn2d8N8GrRR0FnaB7S2BsPs0HXHhwHfg+q55HbfkMqy1kMGTw@mail.gmail.com>
 <5d579b8c-0676-46d8-a020-77ee91e1e7d3@suswa.mountain>
In-Reply-To: <5d579b8c-0676-46d8-a020-77ee91e1e7d3@suswa.mountain>
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Date: Thu, 26 Jun 2025 18:19:40 +0300
X-Gm-Features: Ac12FXwpty1WwCsHouZ9sWJvvTacKyf47jvNYTt5mDohhxxtLmxfkIn5JlmFx3U
Message-ID: <CAGn2d8PdiBRN09L__XEsH=cNYz4rDR2A-GnSqCM6Y5TmtT+wcw@mail.gmail.com>
Subject: Re: [PATCH v2] staging: media: atomisp: remove debug sysfs attributes
 active_bo and free_bo
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: andy@kernel.org, hdegoede@redhat.com, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Dan , Thanks for your review

On Tue, Jun 24, 2025 at 9:31=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
> Yes.  Nothing is checking for if hmm_init() fails.  Step through the
> code and verify that nothing crashes or bad happens as a result.
>
> For example, I think hmm_bo_alloc() will print "hmm_bo_device not inited
> yet." and return.  So that's kind of annoying but it's not a crash.
> Search through the rest of the driver and verify how it will behave.
>

So, I have been searching through the code as you suggested,
and found a couple of interesting things to look at.

Firstly, no function that calls hmm_init() checks its return code,
and it doesn=E2=80=99t crash anywhere because of this, so it's not a proble=
m.
But the thing is, the hmm_initialized flag inside the hmm_init() function
is set even if hmm_bo_device_init() fails, and this can be misleading for
functions like __hm_alloc() that check this flag later.

Secondly, the function hmm_bo_alloc() and others don=E2=80=99t check
the return code of hmm_init(). Instead, they check the flag
HMM_BO_DEVICE_INITED inside bdev, which is set by the function
hmm_bo_device_init(). The problem is, if we inspect hmm_bo_device_init(),
we find that the HMM_BO_DEVICE_INITED flag is set before the calls to
kmem_cache_create(), kmem_cache_alloc(), and __bo_init().
This means that if any of these functions fail, the flag will still be set,
which can lead to misbehavior in functions that rely on it, like hmm_bo_all=
oc().

Should I tackle these problems after submitting the original patch of
removing the debug sysfs attr. ?

Best Regards,
Abdelrahman Fekry

