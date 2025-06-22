Return-Path: <linux-media+bounces-35551-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8C1AE3201
	for <lists+linux-media@lfdr.de>; Sun, 22 Jun 2025 22:39:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E72603B0BE4
	for <lists+linux-media@lfdr.de>; Sun, 22 Jun 2025 20:39:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F3011F4E39;
	Sun, 22 Jun 2025 20:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ihf5DAYh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCA42F2E;
	Sun, 22 Jun 2025 20:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750624772; cv=none; b=U9zqbfebl6HqYen6EiA9ulv6wxAzmsHnQRovWMgWfdGLvDNnUA4RGhM3rPZwR3oalo/pgmU9JF0FYAnO3f1/9m4rNZVadiOLG/Hs6Tmi/+qBTUlRY+0FYabkP6BA12qjDQ5w6ugSo3OoUxehBGB30j2GQ+euqrgk9JBqydzIumM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750624772; c=relaxed/simple;
	bh=N6guHtyGMULMEJD0DmeqXfTFFtMsmAZzCxdt3JROOYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qbn9fkxfqUxc1Tv9ig69Ser+Ph4+ZdSFviRwaFJR3lME7iV3yZDfOf2QFd1/ILO9ufN/XA9FV0bQIagmpD9FBdwwL6CQvW+NEnejSCkNaYnpyv7nmGmTM6sWMWFgS/u7k0Scf4ZJGJtcmngecaguFMcss22KNpOqDSlDKlaXzNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ihf5DAYh; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-adeaa4f3d07so719746466b.0;
        Sun, 22 Jun 2025 13:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750624770; x=1751229570; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sSQmRB6rd2h8MVTx7uEJn3zEtDJCTLtNHMbRBxoBn+U=;
        b=ihf5DAYh+1WKvSsH8urT/PRRPMLwp2B+uz297krVYmzkRWfe+WztSpOWKKB1iV90yW
         TenMtfLHLeeutcyYFUA+VNB9LtM+lCuiBA9O8umyIGQ+fwh6bzVFjUypzHN5WEJRbhcv
         6dZmf6R++fA+8QKTTZYhgSpBhEtDprQrb4gN7vjBZbZllehZnRi0WLoUAo1GicjycJwL
         Yq3w3pOVPc4nbVbHjHMW52QWlselqy8fTMWYK138vtVBMTsq0qAtzvZATR/uojFzaRei
         C1rynKNBMf/MYxu7YPAFoKbRI+S64pdvN6yHE9VYoCH2nWQSVV03+ZnfPCEzWQtKImrx
         FQ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750624770; x=1751229570;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sSQmRB6rd2h8MVTx7uEJn3zEtDJCTLtNHMbRBxoBn+U=;
        b=vV6+n4//3YsbgmTcau8Rm3jqeEDHgbNAwDyt0tgKKbtp6xjtwythB7mlEGN76xN3f0
         n7KAS6BiYIKY5RRqEZ9O2shonqpRLmHdRV/1tJdeNjbg7pbUzf9Izaz0dy++cem2fzHD
         CndNXU6ETpUugk7h/BrrG6gYClE4vk4vwiSd757S6mPuHEZn4VMXAMwE/xBw4x5qbODX
         kqs+DfqCyEvdPYXXwkLVUuvFpmQsqLFgceYAPVWKHeqlXXI4zL6fij0OYTnbH7t4ZedY
         ro7bmuAynFlBT+tRBMGMP8wuUIhcMkp6NZat0uDmTlqXwvhrTqOjWrNpL3jdBc/ywD9e
         vR6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUbr9CFurqz6cucfi0XBHFU7Svkl0hw6ZsCYq9RfdMsRly5uG0434v0QWKm999F94T5LzUehidvVopD8xg=@vger.kernel.org, AJvYcCXVa1QZfL1gQA3HzZUXns6Ahv1pBml+N2KynZiZ3lF+BKilIv4W7guqd+y+85Uq3SmBsW1+9J9rC9eWRpk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2JKj8xuVDL5KHPYR4lR6nDj203mhU2EV7igLjLTeFDRPzS3Bs
	Wt3mtQp0WPeg7IGb+eaYmwJbg8PN4yxzlOK4HGAAisUXm27rYRzV4ykWPjNwbeef0p+XlBQRAzj
	AmASLPQzLgvSs6QbfSrgsZsb3jiVBgtA=
X-Gm-Gg: ASbGncsOU97bX42lAgKRsnTNfvKe2HnBFyOG90bzurISjtbqZbGNvH9LeOE3MXqvMMM
	ilO2+7lCOAzZpJMkUVEIXkWU5VlNMNwFmPt9yLViNda55Kt0jE8tP51TeW6Jpu+GmlGLhYVNxUt
	KzCOLsrwBk6aQq94d8JhA92xOSvOQDKoAQZSWMTD3fTkhG6B/7oPIzpw==
X-Google-Smtp-Source: AGHT+IE5Og/WZWlEkV1UzETWK6WHUVp7h5VoEVNPzXLtExpnzD5jPbsGBhn4lHPKUW0pDk/8U4CEsAuh7LKSEOmRoz8=
X-Received: by 2002:a17:906:f5a9:b0:ad8:a935:b905 with SMTP id
 a640c23a62f3a-ae057d7a6b1mr795786866b.22.1750624769749; Sun, 22 Jun 2025
 13:39:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250622065340.184048-1-abdelrahmanfekry375@gmail.com> <CAHp75VcKQGvcgv+72=9CY9yvvmzTDUaiP8xZZzQCyd553_tqYw@mail.gmail.com>
In-Reply-To: <CAHp75VcKQGvcgv+72=9CY9yvvmzTDUaiP8xZZzQCyd553_tqYw@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 22 Jun 2025 23:38:53 +0300
X-Gm-Features: AX0GCFvAarN_hJUIGnkkqkGeTc0xTTJwApkpFWobyp93oaVzvKfSCAh2aYpZQSE
Message-ID: <CAHp75Vc7=WYeay0xsvVd5NZ-mm+WdU1LrzzFAE1GrdpzH2JjEQ@mail.gmail.com>
Subject: Re: [PATCH v2] staging: media: atomisp: Replace scnprintf with
 sysfs_emit in bo_show
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 22, 2025 at 11:37=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Sun, Jun 22, 2025 at 9:54=E2=80=AFAM Abdelrahman Fekry
> <abdelrahmanfekry375@gmail.com> wrote:

...

> > +       /* Changing to sysfs_emit changes the behaviour if failed*/
>
> This comment, besides missing the space, is useless here. You need to
> use the comment block for the proposed change.

Also the text of the comment is a noise. You need to explain better
what's going on here.

--=20
With Best Regards,
Andy Shevchenko

