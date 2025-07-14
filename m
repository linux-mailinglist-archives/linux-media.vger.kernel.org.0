Return-Path: <linux-media+bounces-37700-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E6532B046BE
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 19:39:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F6F316C661
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 17:39:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A64FE26657D;
	Mon, 14 Jul 2025 17:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N/iPMF1r"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCF3259CAE;
	Mon, 14 Jul 2025 17:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752514782; cv=none; b=j7RY5/vXyYuYkuREP6bfD1gLJXID+Nx1mIOhS38W9ZCMAjCjXdjiJqZ/WfvF0BuNWLFyBrvNlGoCgCc4p3plfcd6N1SQxgStDCL0B+44VbllD0+4BqM02oJdD/LtUWQ6+1bK0wRzjGAUASOOSzrtlcq4ohADO92o2UbaIuMrfYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752514782; c=relaxed/simple;
	bh=cU17IXtRjE/g5FNdfOe3IwcxfEOOWsaNIheB49OcDCI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Za4lCOVGFjWUh/h4TkysWh6G/mJMMEcpFxYckGw4fFwTDxEdYzq2F5jzsaMq8GVWR8yeCTpUatLXZ9X87gbj1YzeYbLwU/QdHWy0Fs0rqdFuTIUrrY0+KVBTMX+7rIY/bzDx/LN/uSNQuvxtQ1lmhK/5oB5BVpZSHqdaz805zGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N/iPMF1r; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ae3b336e936so910826666b.3;
        Mon, 14 Jul 2025 10:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752514779; x=1753119579; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cU17IXtRjE/g5FNdfOe3IwcxfEOOWsaNIheB49OcDCI=;
        b=N/iPMF1r5IrJcxcxTfuJK9Jj/z/ycmSi7dzdRyimCsR20FffFpXfk86Jg/r8T91ACs
         096HG1dD58QFCjMYY7zhWhZuHfJQ8R7V2Jr5KoSoMs3pu+efnWlpxar8eAglS9KwQBGW
         CpMqEyATE1R44omNJ41StXnhmptALJtdA8tyOxdeQJHSMp+1pnMfBjO9HZHEOmVcLWLZ
         IVUoOJykpSFURPCBtGQSB8s+ijscG3e+AkGigLSeB7wy9vsH4OpyDuMB9e/Im8QBispB
         oPtnuTDkYnU+iJMV3M+9FBu/Yl0BRMtB/PLiUdESu9XrV+OYc7jOup96t64aE0O//2de
         pDnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752514779; x=1753119579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cU17IXtRjE/g5FNdfOe3IwcxfEOOWsaNIheB49OcDCI=;
        b=DBhxlj13NuCg5he3ygVebCQw0QUWAcOKSuCnWv2MhHhU3jimvay7W+tW7NlSkNg46E
         5RB/uPhV/+02OWyiBfZhBEM4NMrslPRWdKZ5Ep7lFv/u4gHAZoxBFW5YOqXKGGQ9mZV3
         StAkNXNHtSj5TCziTKLZe++tHIhtL6saDPDKheP+zwSG3tzb/zsRvW2/rRRnvIKQrjJe
         BfHpeB943IkxlTSMM9XhVX9KQw2kzcK+D3PdeQCi4nrJ6oKkMdmsYd3QFyjnBwmMl691
         EZjT9bdi/s3XRV1lN4HM1NDLdMwhgMaWjgMAovqs14Cd2hQTDlFc0uJzfIl8BedzznkY
         nS0w==
X-Forwarded-Encrypted: i=1; AJvYcCUjlu82ofs++lchUBjSRiT+BjbZegwCAnIhOyWAo8B0OHyZJjoycG3Txetp1BNTfjQATgwOhnyqfQ2jE4k=@vger.kernel.org, AJvYcCXU51cI97leVKa19+OJBDP7YrpnQC4v2ehwZ4EJRPHFWkye7WuyDo6AFimt5e42SwQje7tvcVnAHscDLcg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRuvtWd7Ozq3vWsuu+tCb1hbvoDYPrc5FArDovOQR+n6i9+rNY
	lQ0nvpIk/oxHLEw4NYcPCmQXsoBbyE7Yv16eAMzrXQVNe+/K5gHJUZnBt35VcXJmifHH90MOsXz
	3EQLBdaIgGdi6uaVxfDlxnn0K/gXdy/GfTc7GSec=
X-Gm-Gg: ASbGnctiLLzUlWqTxiH7hUTM2Hw115APVRbnlbizwDCIz57whtk8drhBma+RKqj0RiO
	/8E54Og2z4Fnf+TLha7L4sFAVh9nx1L/6p8jRln3F3hkEU/D7AjHD5TWfXNZqCMsYDIng+ZxFi3
	2hjBHD/FpETYwF26X2EJQXLEnjFqLBhlsw/Hn/70XeZEzhfn+g/G+LN3CbmGm9ASWII4FFxySYm
	g8HGkI=
X-Google-Smtp-Source: AGHT+IG1Ctij+EGX1otG75IANmHO180ycHXry+QJ4rItTcvUJH+rr2yhxqL5Gdu5+vo7pxYQKfgQS+aq2ffNK4FPzVc=
X-Received: by 2002:a17:906:c154:b0:ae0:dfa5:3520 with SMTP id
 a640c23a62f3a-ae6fcbc353fmr1520058466b.31.1752514778719; Mon, 14 Jul 2025
 10:39:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250714140651.213850-1-woohee9527@gmail.com>
In-Reply-To: <20250714140651.213850-1-woohee9527@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 14 Jul 2025 20:39:02 +0300
X-Gm-Features: Ac12FXyQ-jBnxVCHt_y6qgKcfWbp8xcmJc9sGe-gi8aexP5HNnbICg2NaDShIts
Message-ID: <CAHp75Vd1uaCCJptDz_Co52T50dtXcUSzOoz4JjUOz3PAX3N5+A@mail.gmail.com>
Subject: Re: [PATCH v2] stating: media: atomisp: fix open brace placement
To: Woohee Yang <woohee9527@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	~lkcamp/patches@lists.sr.ht, koike@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 14, 2025 at 5:07=E2=80=AFPM Woohee Yang <woohee9527@gmail.com> =
wrote:
>
> Fix checkpatch error "ERROR: that open brace { should be on the previous
> line" in isp_param.c

In case Hans wants to apply this,
Reviewed-by: Andy Shevchenko <andy@kernel.org>
with the added period in the commit message.

--=20
With Best Regards,
Andy Shevchenko

