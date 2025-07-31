Return-Path: <linux-media+bounces-38680-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC55B16BCC
	for <lists+linux-media@lfdr.de>; Thu, 31 Jul 2025 07:59:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B335582B09
	for <lists+linux-media@lfdr.de>; Thu, 31 Jul 2025 05:59:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18C4724336B;
	Thu, 31 Jul 2025 05:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G7zb/vq7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258F7323D;
	Thu, 31 Jul 2025 05:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753941589; cv=none; b=KBrw8HkwWTJbuop5Z4zQQdNgXlDjJZ2Z/1DDWnbxuk2FGGkBBvLDvqzVzvjnZ4ZleyqgStGeLvrX5+tGFY85wCxWo70n0xdNpX1C8gw1iiDpv1Jj5T23Fo2kKZth6rVmBmTR0etcBYD7Nsiv3WaudgCiW3pREJ5+iIBWp21gZ5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753941589; c=relaxed/simple;
	bh=J8rLlA5rFoSxe/LBQNtFHx8yM/xQnHQuZGw9cloIMwg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HJaLiuD+KW8JOH9KMyK95KzaXyIoFi2nNhl5QEIerf0WSbScmrQoIP7H4A5JKlQ6VU1R6C5zTztUGCLdbboyAc2ZIa6EPIPdfPkOnDPUceQUa7j0B/diK/NOu47U3S6KK/+uTSYqOtVUHiEnoDJx2FVz67gZdW6LzZrsd3+Q1j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G7zb/vq7; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e8fd5f99bc5so12115276.3;
        Wed, 30 Jul 2025 22:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753941587; x=1754546387; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9dQ53H+TOKm58J6xbivZa5XJg+//Guq+YDIyJd62miY=;
        b=G7zb/vq76kAJRZegvzL1loptz6RGJx8SIKVt90OAJdL7pw2s8ffqipgX1/OJGGnVwx
         WiFcZa7Iej75ibnVPnUaxjELx3wJQvf3auXe0zPYzM03UMG5Quw7t9Iws0bi9o6vKsR+
         ttiFB32fYoeEFivSeHuBx+pg2JX+mo0nnCUG1YUOx4woG9PHyY+AY5nJUBc0NScQZA53
         Uklp5Cm3FnsnaQksxlOJ6prsEtcMRC8+w8l/MveL/IgQzKX8cTTqQcPeWuJY5eHzs6VF
         ZxOWtnM0m1/Kjycov3daelxYpui8GxjSbuCv6YsWx4rrpHlv7KI1Y+szjt2fm0wJcDP4
         W+lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753941587; x=1754546387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9dQ53H+TOKm58J6xbivZa5XJg+//Guq+YDIyJd62miY=;
        b=JKgySIe6Sz4qSmdlCkq7Qvw+IIuNkuz04kgAjm6p3pCenoxvSpHJDCF3AF9z+9cpWR
         SwJqQQQIHn3x1ne6+0sfYgIFlF6bWS5GYQMOQ/CByEMgpe880hLzYYEzWeA5aKzRQYi0
         qhiWQjGb1TLqBdRvSfA7220U0PLaTtnqnFS34CEfHd1OImOC8j392JS77jvSrIMEeufX
         fkrpoWLdkObfCKqEubkp9dijjqhIUJ8DWhLS74j7B42CtWfDV4cTYToqyTEwPqSdqdo+
         SE2MYn9GDNfp5BSixf/N/NjbDuN0DytUpjWnw47C9GEPnwAV99BxJkzO8CgR0YE65/wY
         s01w==
X-Forwarded-Encrypted: i=1; AJvYcCVr2gioEe+aS2183Q7ulI7kDwYar4DXeoEy4xPweRp7ytpsWorz78IbsT9nd6/yvrA8R0DF2+FyZFAQhQ0=@vger.kernel.org, AJvYcCWpZLuDIXMlxkDQXSn3xx+D2WWmfw5NvnRn06Tmqp7a3mR0fY7FSxwfrqBD4ljXJ1IGEiiA1+YUis+7xm4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBWVGARYSVT4q+Twm8iKljR3GOuonPIzcIRBk6AyoqqId/O62U
	raMsqPam8q0EuFgdeYS6Dkpis1N9D3wxrs8EPhR/3nCySXGA5OFEYHylh0j/29aMeY6t2XI5htI
	UCqs0UPSh48XwMtnRyHiLbR7zbeP7QeA=
X-Gm-Gg: ASbGncvdSF/I7/EIoeDYM5FI/xCc9U3OF+T23U27/I63s3MHtwkkulUZYwmSF7mJLkr
	7qdDKIXrUaZbWAKgXYn36BNR9L9k4c2LZVKQA7gFzPCK3W5XWeJtiDBXSJP5Z5rhtjU1CURRyYB
	KSRcgO5ETRqASarBK7X96jgKHW7UJ81wmP/LUazhDMccGla2+jL0JyoKRsTvwFhKKUrz9ECLthX
	gpBU2Yu3Q==
X-Google-Smtp-Source: AGHT+IHV1FOZO6uXbkwgGN6sg7ti/JeFYC05gD1OlE+HgiaqFCp2b8NgXZyaJzEa/fHMB5YZYgcVeHujYfx9w6/LZRM=
X-Received: by 2002:a05:6902:128b:b0:e8e:e44:36f0 with SMTP id
 3f1490d57ef6-e8e3147a230mr4186168276.2.1753941586965; Wed, 30 Jul 2025
 22:59:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250712191325.132666-1-abdelrahmanfekry375@gmail.com>
 <eb7fd8f3-1d6e-421f-b5d9-f9e2d2992da5@suswa.mountain> <CAGn2d8Mkfdmd3Td3aKQwaa539nMfL0rmJ5d6tLr9A12HSkCUzg@mail.gmail.com>
 <CAGn2d8O0TMqBR0wvBVbWzKKKqQyLWzn9Rn-8bhYTC6wR7-HwcA@mail.gmail.com> <2025073142-unwarlike-shining-c534@gregkh>
In-Reply-To: <2025073142-unwarlike-shining-c534@gregkh>
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Date: Thu, 31 Jul 2025 08:59:35 +0300
X-Gm-Features: Ac12FXyj7e58j5vXnodDMSrmXuhb3ICXzfvYlPPqgKf27RAemXdLC8KbtxQ5lnA
Message-ID: <CAGn2d8O_OpgKP1_JO4Ha1jFx8_Yx_w1P-5_dyWwLYHD9mVD5dw@mail.gmail.com>
Subject: Re: [PATCH 0/3] staging: media: atomisp: More Cleanup on driver AtomIsp
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, hansg@kernel.org, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, andy@kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 31, 2025 at 7:35=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Thu, Jul 31, 2025 at 06:24:09AM +0300, Abdelrahman Fekry wrote:
> > Hi Maintainers,
> > I'm just bringing attention to this patch series as I have a lot of
> > other patches that build on it .
>
> It is the middle of the merge window.  Please wait for -rc1 to be
> released, there is no rush.
noted, thank you!
>
> thanks,
>
> greg k-h

