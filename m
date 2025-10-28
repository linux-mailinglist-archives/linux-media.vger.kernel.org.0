Return-Path: <linux-media+bounces-45734-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2A1C132E5
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 07:35:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2B48C35118E
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 06:35:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55F882BDC35;
	Tue, 28 Oct 2025 06:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eacmh3Oj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA4878F29
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 06:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761633328; cv=none; b=ONxT9rjhMySGndDyU1801YmJiRQqU4df8SEHJ2QB5qUC0S0e57NztwA63v0Hooupjj4Hq+9ZEWC0B2fI4WL33ZpQ/2GgkpHqmahMLNASZbA1f+3Ca7B1kmUZXqrMu0zi8+d91ZU7PZUAgzHX1dkPf+lVQyFaShXzeL7h6ZAUsNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761633328; c=relaxed/simple;
	bh=UTtdgGaS6zmAmqdFeDwWjiD0eGpcwLvqLgmPQgS9tSY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sjIfL8lsccih+rhNmpmU5ltT4WzkUqhFzicMU8P/U/uzLH1dRKr/uerOStP2AlfNzq3c3hByQR3p4XHCOETSme2UrPsC2a4brdhkEkZx0oAPKjiAi42OKt4wDs8R0ILpMQ70+gm6BWiwSR9zQyfP3UUQRn8Cp/QHalsg4+bA4EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eacmh3Oj; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b6cf30e5bbcso3185058a12.0
        for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 23:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761633327; x=1762238127; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MYFfpLSRIIr+tKoWH91vBQZpy9R88bvJI5kLZcZ+Wa4=;
        b=eacmh3OjeZj3dyR6fhv2CKsNUx0U997/bw+Q/Wyk53O4jlFA12vNzTR9KNsqNCLjCg
         mYJSoqFjfMSchq6SWbeUBfs0QPE9w5SaT2Iywgzdzg9IJe4Ud/tGeITcumz2GsNg0lqW
         WFV4Sy7y91MUwKDwBKvr7I5Z1P0Ub3GZqF4iQpD9Y6PFOrAOksDrVEuswQT2wCWolJr4
         lnotYUm8768AsM7nRFhgrH4xslkfK6zFbTReIxFzGxUQxnFWkHfqZvzKwJe4Y3T2D4S1
         Zeg/NFFHtLMpSvkmY1Viry0qTivh16ZTjovSbmm4um1SDv8OkK0xHt5uj7NmjNQ74PW0
         efAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761633327; x=1762238127;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MYFfpLSRIIr+tKoWH91vBQZpy9R88bvJI5kLZcZ+Wa4=;
        b=r+iTgtSMKAbqOgVoNp6jHZXnvYJAEWH176p7V1xpIy3X8IOzeQUXGDR7MZ+wxuDY11
         t7tA5AyOXVnxTYZlXkskTJLCbuKPq+WYpyVeNRWA0z6f6/w28numpfuNbmzHPq944qoR
         JFrJzceI+dDn42dMEQG7rRF0s74WbMe3XnxeNmHI7T0QLz+cMMiYSXeBgs8SAdj1soTi
         eAbaevXg2Ezg+LZYrFwAj516UANNFUCe1Dl3vgeRT19hL1R9pKfBj0/E/BhEmwMBl0P8
         ockjt25s8EJVzu8mYtbQDy0mf/VWdvdpGyN1RXIaCMM7zyw0RsTA6jzm1VU7jFqTbA7R
         qfZw==
X-Forwarded-Encrypted: i=1; AJvYcCWhU3uG9V2CjTryeIOWLnC2KMcyN9T40ApEPfPCQUdzBTYz2On8VV56k0uSCsdowRUw+tujA29UYrmTQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqJNeJ+SvcObpVGvFCbnDBAs7RNvEckYELxcHf/zPQfnL3OifH
	w+qTiKgQmDkcvvIsCbA9fjLMwpw9YjI38ZPbudj767HTr8OettFf/fX5cniPLi8APXPkHJf5ovg
	JWPTe+FM8QMyVKbgt4nH44LGEoO5eJncTbuYn
X-Gm-Gg: ASbGncsNlnFLJ+ZkRnflIYz8MbgrG6HzYZidnxQ9xoWePkpkhVc5FdNT8a2ZVb+NUIO
	ofvuWLwJnFCIEKdSRIiEkQP59S13tTNVglxLMrJlTLqIwPyCOaXu+9jFV8yF8hzuZhDi4ADcRlu
	IOZJeMLtq/9x57nT24Xn7bQ/xEoiOjoOrAELh1Z0mWxFIi6DJryYO1JuV5EBxCYsBfw3aOgQwrO
	CWLHvbyCxW0x90xOJhJKenVM976GW2paNJZR2TS+guL8I1D6D95N4aKKyeSsjZ/JJJFsWskLuCF
	QpcrwYjbSn+WHe9drcplvHCz7keierE+cDqZePguboBGf3AqS7RpSkaz/aUIPHOl96JFvNlFySp
	myww=
X-Google-Smtp-Source: AGHT+IGI5kWyxWqZEosgvMYNCYQq9uVxqCQFsRJHyrDpDx9u3AcWbzeIC0CrQYCcyWwnQ9nB/xbi19OYITvuWVK5Paw=
X-Received: by 2002:a17:902:c403:b0:24b:1585:6350 with SMTP id
 d9443c01a7336-294cc6ecfe4mr26856735ad.11.1761633326663; Mon, 27 Oct 2025
 23:35:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250913105252.26886-1-opensource206@gmail.com>
 <8199bec4-b9e1-4d6e-98da-a4d7eb667437@kernel.org> <CAKPKb8-s96v+Nh29Z5E0wgyXYgoFHJT2SHA_WpZshXspo0WY0w@mail.gmail.com>
 <f9001f98-80d6-49d5-8665-d42fcef7b07d@kernel.org> <CAFyCYyOFFMrDetScx_8_VgRpCVyTq_O0PGn1hDt7+UwMygqeXw@mail.gmail.com>
 <7fc65c85-f75e-419c-aa1b-0c85376373d4@kernel.org> <CAKPKb88Tov27+c227p8k0KAuZtm_LNNxDkf=5YBfDYw94afFPw@mail.gmail.com>
 <3a565e1b-4d73-4d7d-a6bd-1dd8b7b973b3@kernel.org>
In-Reply-To: <3a565e1b-4d73-4d7d-a6bd-1dd8b7b973b3@kernel.org>
From: opensource india <opensource206@gmail.com>
Date: Tue, 28 Oct 2025 12:05:13 +0530
X-Gm-Features: AWmQ_bmvBR5Njruk9k5xijyYtYuIZPX8ibh8q0rNURIyqiBvdZwS-7zDkue7sJI
Message-ID: <CAKPKb89WkMmTt2atSg-J0HhY08dapHGLmuOJDYQRWWz5hAyhdA@mail.gmail.com>
Subject: Re: [PATCH v3] media: v4l2-ctrls: add full AV1 profile validation in validate_av1_sequence()
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: jc@kynesim.co.uk, mchehab@kernel.org, hverkuil@kernel.org, 
	ribalda@chromium.org, laurent.pinchart@ideasonboard.com, yunkec@google.com, 
	sakari.ailus@linux.intel.com, james.cowgill@blaize.com, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans,
On Mon, Oct 27, 2025 at 9:24=E2=80=AFPM Hans Verkuil <hverkuil+cisco@kernel=
.org> wrote:
>
> Always compile v4l2-compliance from the git repo https://git.linuxtv.org/=
v4l-utils.git/
> 1.31 is old, and it is important to test with the latest version since it=
 will be kept
> in sync with the head of the media-committers git repo.

Apologies. i upgraded my v4l-utils repo to recent(version 1.33) and i
can see the error now

>
> Debugging a bit in validate_av1_sequence() shows it fails here:
>
>         /* 4. Profile-specific rules */
>         switch (s->seq_profile) {
>         case 0:
>                 /* Profile 0: only 8/10-bit, subsampling=3D4:2:0 (sx=3D1,=
 sy=3D1) */
>                 if (s->bit_depth !=3D 8 && s->bit_depth !=3D 10)
>                         return -EINVAL;
>                 if (!(sx && sy))
>                         return -EINVAL;
>                 ^^^^^^^^^^^^^^^^ This is the test that fails the validati=
on
>                 break;
>
> Regards,
>
>         Hans

yes. subsampling flags are set to 0 , which are not allowed as per our code=
.
tested v4l2-compliance successfully with below fix. please review

https://lore.kernel.org/linux-media/20251028062623.12700-1-opensource206@gm=
ail.com/T/#u

Regards,
Pavan

