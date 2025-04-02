Return-Path: <linux-media+bounces-29245-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E608EA79155
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 16:37:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A52E316ED7E
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 14:37:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 061D823BF80;
	Wed,  2 Apr 2025 14:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DMeR2ELv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D401923A99C;
	Wed,  2 Apr 2025 14:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743604631; cv=none; b=sIzF96oeuynT9m4A9e9ZbGLic952CX8uEnL9pXUqaqov4FIeRjvrK8msEh4wl/8aidxq0pYjGtaSaLMc3sHk1oqzAsB53SMwDJItfHNv0FjGjg8aUlDKGFdMkXuHom9n6JI8F73gdm+urrDjLSz6W4ME8hjT14bgNH3+cqhAxts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743604631; c=relaxed/simple;
	bh=fujc+sesAjr5IIZE1HuxIUhTSSC46ThSreyEPcnf8NE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=apXDaKb5BebyrYOkbncKZomLRYaF6GfpcIDcdKvVKK1auGieZhHPyo5B8Xoq21zsBySTXq6qTOhtO10gCoEpOqUhNT0e2pKbmyB3nNnpQqQ/QqCgcTtnHjCMftWsFvTgSVAmSHqwGIMCnuoTuR+7r9eOdI8LsiJV3jUOPQSRnL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DMeR2ELv; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac2af2f15d1so894212666b.1;
        Wed, 02 Apr 2025 07:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743604628; x=1744209428; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fujc+sesAjr5IIZE1HuxIUhTSSC46ThSreyEPcnf8NE=;
        b=DMeR2ELvnfrlbIL3dNDFF67CTof2DbfA7Kk7Vjq/9JnYs4ysGvhUC9iQGHus0pjccG
         Euz+B4uNWwDsZC6FF2/N3Ch7eLr/LPnenUlJt1cdEUbTtKoAKBOtJT5W9CU2Q9Wj0XTg
         toSl71Fy4W8yBa6PJeaTKxKZoActIOGfTOjyVfzZ7peHetbFM4371XtTcgZjP5MdPhAO
         W3UmpHPB+fVuarXOP2bKYgkmTAc38SB3CvN8UdPgKtwkCVow39v9hpH8vrT3II4glhOH
         qPYfrPMvwsXoANV/fWsuA+C1swyNSDE1EbCihiuAZJMyKiGVMaJ77v80cu9UTRvqIhQY
         evdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743604628; x=1744209428;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fujc+sesAjr5IIZE1HuxIUhTSSC46ThSreyEPcnf8NE=;
        b=SZsN6GK9YcrEep9O2L2h0zo+hUCYCILlerFo+pCtibvWhGB+6BlFvavJtrHxCWnA3O
         m88s0TraNMLYTnJwKBhtWBLqQLlJ3giSlJ9IJCwvg9JuszwUc2GCX0acRJX471CavdUq
         fO+qdsUw81Nk80SK9rBDfsP8qHQ7NQc4LmEdWTxaJPOLijKF1P1R/+vIL2z2SN5LE4n2
         eo0eWFbloXOawOKb7FyMwpkU9YcQQZCxnZwQcOUDMlUWJcn0VXpxA5n+KmYSahk5NP5s
         Q15/+8H+bfDfmmjTIJE7I2uT1fg0ltFhqnhOVhIWkan4xuNeg+UHjbBow3b2TX0sJ5/A
         wKXA==
X-Forwarded-Encrypted: i=1; AJvYcCU/TwBI6FZ9mgvUC0LCMIXhPhITQ19Tl0KOar4lHphJcNTCi4QrB66ZlcNbsv2Qxk7mpaWgEggpA/W1FnY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhN0rutSyGCz1rAuQiAnuW33Pa9XdXYUb/ydKKlpUrjqYNyAFx
	2NleRUYaL4YWNEMZdXSAXejpIsINbLLwxbL8OGSpN6QPh62+u7Qn7oUKU2kYXL5fPFADFkF1yPc
	R2sjnuFiMgarmvqK52PtRJ1l0ewPuLYmviWc=
X-Gm-Gg: ASbGnct41JfqjbFcYXyw/lmFfulXPIFtewYnSzFZQbxpcC5rh7KR74in/Z3wEn9GgcS
	3XGuo2njoc5aAiHClr79iR7tlPwMxHC/amYJ6gfQMoj39QYfcj2nY2Qw8RIrT9K8tGV6ZFtmrK9
	zwA3IEYZfQ9pYwtHxgcdzIMTzi+ffZ
X-Google-Smtp-Source: AGHT+IFocfbGvbzRK8aJWLdh4mDxaWThCgh1O/7EJbYZA2Z5T7PzMh3BE0hV1pYCJ5WPoTTREpFt+GzoE5do8798C38=
X-Received: by 2002:a17:907:2d8a:b0:abf:6b14:6cfb with SMTP id
 a640c23a62f3a-ac7a166da7fmr220944966b.5.1743604627939; Wed, 02 Apr 2025
 07:37:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402135001.12475-1-gshahrouzi@gmail.com>
In-Reply-To: <20250402135001.12475-1-gshahrouzi@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 2 Apr 2025 17:36:31 +0300
X-Gm-Features: AQ5f1Jo4kfDBVwVLmOzNt69eaOoDoSqPas9WlpNS1Q_ZWTK_Vs669mQNNkUol0A
Message-ID: <CAHp75Vc1nB8cDN=OcCJgeti3YNr0Dd4yeKgeSBvR95piLao1rg@mail.gmail.com>
Subject: Re: [PATCH v2] staging: media: Fix indentation to use tabs instead of spaces
To: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Cc: linux-media@vger.kernel.org, andy@kernel.org, hdegoede@redhat.com, 
	mchehab@kernel.org, sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 4:50=E2=80=AFPM Gabriel Shahrouzi <gshahrouzi@gmail.=
com> wrote:
>
> Replace spaces with tab to comply with kernel coding style.

Still 'tab'. please, capitalize it to be 'TAB'.

But wait a bit, the driver maintainer might do that for you whilst applying=
.

--=20
With Best Regards,
Andy Shevchenko

