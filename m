Return-Path: <linux-media+bounces-15574-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E63D941376
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 15:45:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 348F7B28957
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 13:45:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAC6A1A01DD;
	Tue, 30 Jul 2024 13:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="axWAnWgm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A09C1A00ED;
	Tue, 30 Jul 2024 13:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722347110; cv=none; b=QsppDyxXbIzp+HR+q58EO2xEb1ebN8atPmaVV6aas9BFL9sjpGwAD0JsY0qM+RxHI4xp/pv8DN0RLL7HsUYNTQTZAvT3abiQ2LSEmbi+WNh2MeYPyw9VaY3TjnuyJDV6hxh/xmoG6f3m3+HRgXE4+k2ao1lmhImD+EjJKRbXRtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722347110; c=relaxed/simple;
	bh=rGZxJV8N7UDb8uXrxEdJxFpdLfelxB7zVMBElNCu8PU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ljculc+yeVayK69VvSWA0f6fRZgYAcOA9ChKeIMpm3NCHo0M0y23c5xSfEHyJPrvwznRwUDSs147klED9REu4CCM92dE0jM8BmIkzv56xkdaAYl/EIEzIYRhhvFj2BcnWrogSuRqjP4qBSo9oMtk2CgCWzMbT2pOBSWsozqX2Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=axWAnWgm; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ef7fef3ccfso55883721fa.3;
        Tue, 30 Jul 2024 06:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722347107; x=1722951907; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rGZxJV8N7UDb8uXrxEdJxFpdLfelxB7zVMBElNCu8PU=;
        b=axWAnWgmNoQpPvpVbfsbxYe+K2T7787ktHYKpoL5BPOaR9Tvjk2WLtAkZQWjGAZzzq
         t27cW/D1oHbeMr0NSmchyM0Sn4miLrHy9eulJWBu6gHqxMPoK2cI1h7Oy12sG4Qdkhn8
         1L/OHQomR08P/O/FvuQ6IAtuu3qeLOMeqIUf5argbG4oB/P/RebX6HDkCcbSf+8VU3N8
         aoY4RF+OeEcGriIK+zj/YtZZpoH9fon6+299ur5UDupUDkC7o5vRZa3XEiYBrthrkZ4q
         Zllf2Z7VKiiC5dNrEDj6TvcQctkLnCuY5aaqBRxRUX1naDfNjfxaPF2/JCexaapnW/AQ
         a0Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722347107; x=1722951907;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rGZxJV8N7UDb8uXrxEdJxFpdLfelxB7zVMBElNCu8PU=;
        b=ZBoggLDNY8qxXz51VVsTzCshDaHJDnSRF23ZQtqdAfEJXz0E9JYD+na20YOHH7a398
         GoYrKlFSbFKJtlPWpw5b7DTXyuFvUrtgsWLNyTlf5ISiNkXAL5aoX4JS9WKburEfLFsb
         AsU3i10mQO1Sht7+vzb15pTz/tCs2snuhR+9hQixF/Swu/eWcrfb4ULcn/PXxp8YwFdB
         1Xvgylzw8ywWMe86Lv7teARpTW5S2DrmS4iWO7SGXvHU9qjzMp6mLsMrQ2bwiaH/BEAB
         y91Z2sonZmIzFuxSksJ3QdHvEb7cFFUPyt1hAr8/AqMy5viW2UpDsBEUpsKxByMj0wdk
         WlbA==
X-Forwarded-Encrypted: i=1; AJvYcCVNibyorl1+XzpQrT9XKMVHierzpbItewLYIicSr7yOQRWtUTVl8MJNRx0hvKguZXkAq3tNnADqkW74RlKPZFbhs+b0LcEbh4nekfNH9WwMi/FdXYlOpf/PbJBPr/K+ufoP4XcgtLo6mhQ=
X-Gm-Message-State: AOJu0YwNVkYPzcfUxKIpVbcyC/tjFlIvuDOXyquTlSmyGob+dULolg9T
	JD+oPct2JYFpd78wicCjsh7YNV2oh6EYkyfrLU7MviC6rkcKwZ7to4uQyhCMNF4O7aprSRu0AVW
	7cRTgjtfqRcfghWZSl2desHhjFPI=
X-Google-Smtp-Source: AGHT+IFCX/LxtMpqtReAf7UVBICDr4Q9bXNR/7TPsM9kBP3ebicgem2/Y58lXkUp8xv3nRE2E2qXuUd34eCEpLh/Kjo=
X-Received: by 2002:a05:651c:105b:b0:2ee:8453:5164 with SMTP id
 38308e7fff4ca-2f12ea9a1b1mr71573151fa.0.1722347106429; Tue, 30 Jul 2024
 06:45:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240730123427.37339-1-kartik.koolks@gmail.com> <2024073033-recede-scrubbed-2911@gregkh>
In-Reply-To: <2024073033-recede-scrubbed-2911@gregkh>
From: Kartik Kulkarni <kartik.koolks@gmail.com>
Date: Tue, 30 Jul 2024 22:44:54 +0900
Message-ID: <CAMz8oh2r0WjeQmrvZOoKXy1XkeVYrV6h1yMwuUEqBUBusZYLaw@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: remove space after pointer
To: Greg KH <gregkh@linuxfoundation.org>
Cc: hdegoede@redhat.com, mchehab@kernel.org, akari.ailus@linux.intel.com, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, ~lkcamp/patches@lists.sr.ht, 
	helen.koike@collabora.com
Content-Type: text/plain; charset="UTF-8"

> > Newbie to contributing to kernel code
>
> This line is not needed :)
>
Removed :)
> You sent 2 copies, which one is correct?
>
> Please resend a v2 version so we know which to review.
Thank you, I have just sent a v2 patch

Regards,
Kartik

