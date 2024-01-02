Return-Path: <linux-media+bounces-3144-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FCA821604
	for <lists+linux-media@lfdr.de>; Tue,  2 Jan 2024 01:26:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4F30DB21187
	for <lists+linux-media@lfdr.de>; Tue,  2 Jan 2024 00:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ACC7377;
	Tue,  2 Jan 2024 00:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d2REO+HV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D8B36F
	for <linux-media@vger.kernel.org>; Tue,  2 Jan 2024 00:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-78154f49182so346867285a.2
        for <linux-media@vger.kernel.org>; Mon, 01 Jan 2024 16:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704155198; x=1704759998; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BHK+weecdtd0rznwJpxGMuBeQUXVbXrx5Dnm7/ILwvY=;
        b=d2REO+HVCxubuK+C2zqA+Ne7+Ljo8B5dG2Gru8LNq2MBya6E7b/68oI/o8C7d8xuy+
         x3LW+/H9ojcKF7qro3Pwezmt2mRWd+bEv2qsz29FN39ViCpetbiAEI5sz85G2yIWrkF0
         YtffHvdTdz9NJ1UwaNsBQQEdQciHSnHqBo2eEdAkBVQ/mRooUeem2b/cQbjshZxbnfUs
         ci7qSdkb6TcAckuNJd+GPtHm5A0TBn/G/jVrv/dLmNrKvQw9f0iRroOCPe/3/pcMu3wR
         ZcQQ4R5cQNoAsfkJOdtQMgrmYXtYPOczlq7Jgz44tJpYjMHmdxvVqpAeRuiM2n1iDBUe
         3GCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704155198; x=1704759998;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BHK+weecdtd0rznwJpxGMuBeQUXVbXrx5Dnm7/ILwvY=;
        b=KKb9w0WrVIknfolLFyGbioJwxnBZFLdgNI3EXEeFirdHL9elYAVxaP2XwljWpo1hQF
         RZxFMkjwoRWrqco7SxeszQGFGomeTsjT5FpFTMUS0a7x3Jy8nDtyPprASLacflHDRTkI
         Lm7elySFGrUGfGL2kcdo2hL54WMeszos/uvpaHcKjuWeqc91OZFssv/Prn9d3a4WRuR8
         +EEVgVbSr+PvefaxtNtolBvhzDjSL6pFBoIvBf1yt7DmIgFWRaQJ1eB0uCVyO9FB2v7A
         rS8yqkm9tKS9kRaUrissuRvpn0MVwmS0h7IXOnfV1F1b6SB4DlSVtJs4acB49gA90Z0y
         vlmQ==
X-Gm-Message-State: AOJu0Yxrq2W8TAUtx3d+rHofVxd/hq2uvy2qmh/jrnVOUb/JPBliuH+z
	6OCasy0rBoijA3Cl7R5TuB0Je4Wni52U9xMXmw/q4HsmSgI=
X-Google-Smtp-Source: AGHT+IHtxOC21wcsahP167SQoL/Xm4w3nq8uc6lhMBVOPkLn2Sfv3ar5XOLbBJ2wBG8A2Rz2gG7tS26IGjZ6t3SRpuk=
X-Received: by 2002:a05:6214:1bc8:b0:67f:33dd:633 with SMTP id
 m8-20020a0562141bc800b0067f33dd0633mr20524292qvc.9.1704155198698; Mon, 01 Jan
 2024 16:26:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231231103057.35837-1-hdegoede@redhat.com> <20231231103057.35837-9-hdegoede@redhat.com>
In-Reply-To: <20231231103057.35837-9-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 2 Jan 2024 02:26:02 +0200
Message-ID: <CAHp75VebvROx+oQJ+R+OZvcwVk2UzcNdo2Tf1-N8uxNjT_WgYQ@mail.gmail.com>
Subject: Re: [PATCH 08/15] media: atomisp: Fix atomisp_pci_remove()
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>, 
	Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>, 
	andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 31, 2023 at 12:31=E2=80=AFPM Hans de Goede <hdegoede@redhat.com=
> wrote:

...

> -Add missing devm_free_irq(), atomisp_uninitialize_modules() and
>  pci_free_irq_vectors() calls

The devm_*_free() is usually a signal about something either tricky or wron=
g.
Please, split this part and/or explain better why devm_free_irq() has
to be called explicitly.

--=20
With Best Regards,
Andy Shevchenko

