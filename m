Return-Path: <linux-media+bounces-35552-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DF3AE3209
	for <lists+linux-media@lfdr.de>; Sun, 22 Jun 2025 22:42:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 23270188CDEE
	for <lists+linux-media@lfdr.de>; Sun, 22 Jun 2025 20:43:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 237C31F5424;
	Sun, 22 Jun 2025 20:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RqM8mPKz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B982EAE5;
	Sun, 22 Jun 2025 20:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750624963; cv=none; b=ZNvOuxaNycG2sMDY3H1Awz+9SvF8i5PW9oC43ULJZlmIp6GIejSGBdMkegNbg5EilHzopKwAjQXHmoCuMT+X7BQnDN6zERYsAtRd6iei42OwwuEdwkcPsPBbPzGImThymQcxiGx+u2D2bOnkcFStI1979mzaSzXq95an644SHZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750624963; c=relaxed/simple;
	bh=aBH5ync0KSrwnI3FXleDVUQ8cMpif4dJqFHJOP7BLpw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LGeLOwMqFYgQ9t41onW4S8oWTZxjn17gj6fWxska2lPvN3Pwap7QdgWkXEx6+eSdwbHiQtqbTfkBsbojan3pfKTqBIjQuSn/sk3t6M8vArDjvM2HbklNh136TbA8mYlgZzZZCE1BXNhdeqMwsHKzsp/v6znW65hKme6KUKVLIIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RqM8mPKz; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-605b9488c28so6028560a12.2;
        Sun, 22 Jun 2025 13:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750624960; x=1751229760; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VEaaZjTLxR/wmDq/Wpxqo+FbQo3s+O631q6fY/ypEKA=;
        b=RqM8mPKzGh/SnRN2hRcjKSiGGH5ndFPrb0dH5YB0DWrRLnyLZyxi8HHbKLuZgacKe3
         JQT5zSZhqUaAsDXaM7K6OJXCuyaZbZRo33q78c/cai8fBBlUpSlYNgyGScvwJKUp72Vb
         5BtBRSOeTSeF9KYh2yqqInMGaRRoLsCsjPiuc3E93vncdUenRCXRlm5wBQgNrwwaagz0
         I5KF2Ayr+mFW/KHYW0Tl3zqFOPP1tUn6bOl2oKjdhFSc+r5dz+7o+bbHv7+4o0/0MEZZ
         KxKKR5D9ZSkxL+65Qksg6MbyGoTkXILeHuHCyzv17m+6sT4+uk03/Jp470UKwhU5itUp
         Fy6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750624960; x=1751229760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VEaaZjTLxR/wmDq/Wpxqo+FbQo3s+O631q6fY/ypEKA=;
        b=QKSwhnSUdKE2F3ZMNBW0d61y5oXh0aDGqDmNoAOhM5e3NIixpf3Eg/TqucIZDxsIx5
         DRqrxaUS+RzPjvsyUGJRAZvuEkIhFERYjy8acHvjKSS3QuGdEG2uUDDF/JRuViKihS5l
         DYDdtypDVeZw5Un82yIJeLGtNW/QwryLaQgr4GCAGieATESK85YJercDjfB+XTR9EJ4+
         uZDkIUApO8DCQTLcTxMMGsaZMpfBYSviOqvoJW6gEjR49fZmqRgZKIy5cBEk1xFf3Fnn
         ysmCtHj40+C2EO2fU4o1VdkrcfB7FZZitzuFBf8UygAH/4WZpxLTLKRgb+D9fcRyo3bK
         /Xvg==
X-Forwarded-Encrypted: i=1; AJvYcCW1m7T8rSFEx7xUhdHnbSm4KaOjeFXXz2QXE1KZzR/QpY761Pa7UYorNvM4hycyX3exS/w0ho+4rMQaY4Y=@vger.kernel.org, AJvYcCXV22Z1d9oILZzRBuDOzeKDy62wKDE8GNZmA5SYUzINq7ZmtNNgTt9i22GXhQ3dpjUXmzoydKqok/1OZik=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRNQKNzPRb8R0YpUXQ+1PDQRFvqf0cnmZj7gL07wbnmrqVfDDz
	EkQM2LKGjSuH0wPVX2y7BCx12AwcWuGDUYpxlLi6+3IGkqN/NW44NrJIdtzbvSA0Qbz0UwZYenO
	UbZXVvGVEapSRo8kvPRfYbwZRBB8atAQ=
X-Gm-Gg: ASbGncvHy+Xh2YqB4gzY7HpUQdEBtg56rE6FGrDPalOZxK0F6vpyQOSBxZS2+wYXoS9
	JF66EekXxMu/6jP64fr2V9qK6SBdMpDhbWBlFH/r6gpjB28P6Ok7hHqLah46m/YJtI/jotDuXtv
	QOmGZMXsFUjUDegOX1yNuMa2qTLCUJV1Fhcwv/eep5EiTrumIbsiJN6Q==
X-Google-Smtp-Source: AGHT+IEuCW/KdysCM3ldMjDLa6Hfj5krLcXWfqFZ/oZd25TNQe5yelt2PpsMVNswV4DMKz9ZLEhFH+kmoAcg7ncOtno=
X-Received: by 2002:a17:907:178d:b0:ae0:635c:a402 with SMTP id
 a640c23a62f3a-ae0635cad93mr668278066b.50.1750624959931; Sun, 22 Jun 2025
 13:42:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250622-bar-v3-1-4cc91ef01c3a@gmail.com>
In-Reply-To: <20250622-bar-v3-1-4cc91ef01c3a@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 22 Jun 2025 23:42:03 +0300
X-Gm-Features: AX0GCFt-u0KDswVjW_bfV4Y3-CzEDf1LLgcF6bQ7Jm2retz0Z--D-RGtvpCiwyo
Message-ID: <CAHp75VcFSbLwqot0Rrm=141Y-mCQUuFqNGn=DnfKSSYp-31vcg@mail.gmail.com>
Subject: Re: [PATCH v3] staging: media: atomisp: fix coding style in ia_css_output.host.c
To: LiangCheng Wang <zaq14760@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 22, 2025 at 6:42=E2=80=AFAM LiangCheng Wang <zaq14760@gmail.com=
> wrote:
>
> Fix multiple checkpatch.pl ERRORs and coding style issues:
>
> - Use tabs instead of spaces for indentation
> - Move trailing `if` statements to multiline format
> - Remove excessive space between type and asterisk in function
>   arguments
>
> This cleanup improves code readability and follows Linux kernel
> coding standards.

Change looks okay now. The question is are there only these
problematic places or more? Can you double check the entire driver for
these?

--=20
With Best Regards,
Andy Shevchenko

