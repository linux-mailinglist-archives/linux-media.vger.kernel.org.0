Return-Path: <linux-media+bounces-42483-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B549AB560A4
	for <lists+linux-media@lfdr.de>; Sat, 13 Sep 2025 14:22:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D348565502
	for <lists+linux-media@lfdr.de>; Sat, 13 Sep 2025 12:22:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8814E2EC572;
	Sat, 13 Sep 2025 12:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iOfN1J2J"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923292E8DE6
	for <linux-media@vger.kernel.org>; Sat, 13 Sep 2025 12:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757766151; cv=none; b=gF3aEHn+jN4LO7tg6RQpGdK0cTN3W+stZIAr6dhCDVbmuGTnoSNUjhN+ap1xt8jq3gqF4OsXps4mWWvWHHbtSLNPYsEkUYbrg/196t1ZPdoXbhGqK86J7sdEioWND3r2ceZfou6j1FBMaSacqKSeeV4Eqhz00bbU8GuDHglxJzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757766151; c=relaxed/simple;
	bh=171/ewW80b21xzRc5ZzHiwlW5EO38WnFcO9L9j2rMB0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JT9gC4azTtlacnDpQ3MC7yi2VpEvAJKKytYEFC6VJeWJncl38kvq3yFH4NJQkBG1msOOSL9akdZfUgctsvzUB+ezQnM9OuXJH/udOrv3P91Xxh/4YehxSAoIXgsYVTZMBPfuTXZiB9vvo6LV+0iAvSmRD/SP9fVxfTjFNcBASFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iOfN1J2J; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-32e1c8223d3so108640a91.0
        for <linux-media@vger.kernel.org>; Sat, 13 Sep 2025 05:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757766149; x=1758370949; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=60AwFUTClZtbec6HlNW9ztZwz66oBtfZkSSuuGwT+0c=;
        b=iOfN1J2JtmlKbqh4m+P4P9n1R5eKIrvfvdW/p88SyfaC+ian2eBbKAMNSv7MbR5n/O
         G/2eci67YeUYGlYIM+oWC+Xsblvmz1NVxigHrd9LM7Fdn5LarWw5l+bFWHt3mS5kgM7R
         80gYdlzXkJ2DW21mD27aAgt7EGU7k1FzeSPfOEoJjqZZCYY4T4DaFMZ26hHuZlENYJz8
         78xjtBcmySWXVllZG0wBwElrhXDqb4PJnGLOkQgWP9WK3dwRXEt5B0AIX4LUrxX+ifkC
         PgJ1dq5Xnu4LwyLJ1K/4+W06smcomyrYaqGvrzkyCjVBYNdZdzIO+l6taVjP+huCqVaj
         MTFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757766149; x=1758370949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=60AwFUTClZtbec6HlNW9ztZwz66oBtfZkSSuuGwT+0c=;
        b=RNAXwXMYTtaQxhdGQO4x3Lf8xvE7dWi5OTApRn8bPLwY/Git90KMAg/GL+23CdYsAl
         gxjGqrZMjplktQE12B9NFXsyyMEEm4oslOLaH7QkPJjvJp5EOOPrkgDWGRp1oMqiZlYZ
         oqn3gBoa9faaJKMO6ORiSYv3RJm7zWxBRxaddZtG9UrkqsqT5x/v7JfI9ibfFTKrwjdh
         d9Fdw9LWqDwZtKkjobkMLPQRqBxl5gp6zyYEMs3oZ8vwLnnxlflXjsKiyo0RJUIgjUXx
         IXaaKSg7MIJx36Xp8pzuZ3THrg9qWsW8Qh9A0qfsDxZAyXSxNna7W0X1WwvQML6Qh113
         vKKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSd+l7a1ImkxleCpXIFbYLIld7kAHgnicx8echTSyRL4bJ4HrksqCdo658mVquGGaB61jlmgk//59yDw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd8dfQsrGnfUboL1ojnfL9IhVlJSDhv7Kz3maMG2K+XcJWTfNm
	JQ+ghjJKaNg+31lBXuxdKR2oQBg4w6xl6kI1nPLDAE1EynremGhAUyXEqfLbpCbvkXTpdOt/b0H
	whH89LvAAcBNyVB8NJ+ESxt+HRSELPTM=
X-Gm-Gg: ASbGncs5eEA+GAuglq0vDnNLkrQINN4z13KzJm33loHVrTVSkHkGqRahsANFA5HZv6h
	Wt6k+7cKJ1bgcK5CT3wlnqo3H91Is/gWRI2MGz3zr2lUR1gsfBM9ticy1k0HjTa9yS5IZ9u5K56
	O01KRTLlhrPaTE4dAAIE8ruXh+5D2pbR1gl+XouUbhQuABJEjz23XSSdyo1x3NsMXpLgcuv6zND
	pDuka4DrGDpxmMhgrRUlgl7dXTH3zUPdVppBdh36GWXx8OW/JaM21/mcuvWdY5/QtrTx3vkRxVp
	SesYUD1EDB1yCpLiL638cL+HQaI=
X-Google-Smtp-Source: AGHT+IGV9NMTo+uQTqcQx5A7bzhqPHnVVPJBG6TLtLVtjnmYb/wzqX3fQzybGaOnqUlWtZnFVMNGDxqHijiu7bIPNCk=
X-Received: by 2002:a17:90b:3d8c:b0:32e:ef4:bc7c with SMTP id
 98e67ed59e1d1-32e0ef4bf3cmr2708537a91.24.1757766148752; Sat, 13 Sep 2025
 05:22:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250912131459.6833-1-opensource206@gmail.com> <cbab615b1b17ce869cf2359c6a16f54afb17802e.camel@collabora.com>
In-Reply-To: <cbab615b1b17ce869cf2359c6a16f54afb17802e.camel@collabora.com>
From: opensource india <opensource206@gmail.com>
Date: Sat, 13 Sep 2025 17:52:16 +0530
X-Gm-Features: Ac12FXxbYuBZHrqqYSRjrQYBopLcayEcZ2HOucrJxzaE2cRRSmyIg1_AfqwW60E
Message-ID: <CAKPKb89KkEz6nitJk6sX59J=AX1FaG4jA2EBXfRLdGHms8ER4w@mail.gmail.com>
Subject: Re: [PATCH] media: v4l2-ctrls: add full AV1 profile validation in validate_av1_sequence()
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: mchehab@kernel.org, hverkuil@kernel.org, ribalda@chromium.org, 
	laurent.pinchart@ideasonboard.com, yunkec@google.com, 
	sakari.ailus@linux.intel.com, james.cowgill@blaize.com, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 12, 2025 at 9:07=E2=80=AFPM Nicolas Dufresne
<nicolas.dufresne@collabora.com> wrote:

> The changes looks good and seems safer. I will have to run some tests to =
make
> sure we don't regress anything. About your commit message, there is a pus=
h to
> make things more imperative, so that would mean reformatting to the follo=
wing
> and dropping the first paragraph:
>
>    Complete the "TODO: PROFILES" by enforcing all profile-specific constr=
aints
>    as defined by the AV1 specification (Section 5.5.2, "Color config synt=
ax"):
>
>    - Profile 0: 8/10-bit only, 4:2:0 subsampling, no monochrome
>    - Profile 1: 8/10-bit only, 4:4:4 only, no monochrome
>    - Profile 2: 8/10/12-bit, 4:2:0 / 4:2:2 / 4:4:4 allowed, monochrome al=
lowed
>
>    Additionally, when the MONO_CHROME flag is set:
>    - subsampling_x and subsampling_y must both be 1
>    - separate_uv_delta_q must be 0
>
>    These checks prevent userspace from providing invalid AV1 sequence
>    headers that would otherwise be accepted, leading to undefined
>    driver or hardware behavior.
>
> If you are fine with this change I can apply. Otherwise please include my=
 Rb in
> your v2.
>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Thank you for your feedback. I=E2=80=99ve added some more changes and sent
patch v3 in this series.
Could you please review it?

Regards,
Pavan Bobba

