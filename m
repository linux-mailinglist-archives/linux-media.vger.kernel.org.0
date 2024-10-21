Return-Path: <linux-media+bounces-19983-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2AF19A5FDE
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 11:23:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 644CF1F21930
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 09:23:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81D1C1E283D;
	Mon, 21 Oct 2024 09:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jm4KieOX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF4D946C;
	Mon, 21 Oct 2024 09:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729502596; cv=none; b=Pv7h8xwo7oNGe6P3YG0iXWsNUN2LrN90dQ0vN21EoIlXYyVlDIUpKdksoaNkywdvuA1DUVLe3RVOQPudsoTU/47n9e5ty9CMX82kaEgaFP2w/iB6S/kqeNyrZ/AuRTYNJVp5cYLP0nRADvrMDsHJA7erV8ZhP8umUmi+7EHMLBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729502596; c=relaxed/simple;
	bh=WAYYulQYX+DAUemVwit3xk3XSk1nPNeKZQVIB1B57co=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p/7naOSJe+iJcc/6dpAH+0Qj4CYNSmyXplaBc7LAhFB/5LosEacpBq6M+7KxZjCqm2n6f1BovobaeP4g4e1uMOZd2k3Bjb3crDUkCx5iBBS2lItjiyc1gOLsK38u7wOeKxlip1QSBxwpZJNhimBlZFouHOmUU36GN+PLAst86R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jm4KieOX; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-50c9f4efd09so1271885e0c.2;
        Mon, 21 Oct 2024 02:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729502594; x=1730107394; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ENbw7gWD7Jn54F2uwwYCMj4RVQBrD+2XwdYMKUKg144=;
        b=Jm4KieOXNKsoXd15BdujTUkzuM07Iht38N6hQK81fVdg9Wa0ggePBLPkvUC4HjCp3p
         SyYbfCdaB/XTkT/mkFWIh2pz7dd+jewjKk8f0oHepmD85kdySCkpr9bbowfsSgk0VxDq
         m6zCOcjwOKBc81SAEpgvQpbTGEYiJWj7CU/Is4RtIBI6xctopvPlTJvZwwSnerZ+T0IZ
         Qi4+YZUUDWOh6yYoxlzNAOB4tLWd/0Bniz5WkzXtjqM0jYRuGNNXj6Hwfk+9XJnXM3T0
         QnxdXVfLeo/mbxvO1EkvCSvagAVCe/KGsnmFR3W6zw2i3MXVDdPeZwqOdnObgGqUTcxX
         b5pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729502594; x=1730107394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ENbw7gWD7Jn54F2uwwYCMj4RVQBrD+2XwdYMKUKg144=;
        b=GKsthhLJTuPj6ySPLHEZ9DiAaoeNxstSvKNCEYfr0XtYk7PDFHyoVydZbgXruA6m9P
         NwBtNnvWw74OzTZbeu7oWCM88EJAIBi+/fF01CMKgYC0q/nraTYajtgXX2D0RFwUj7ZW
         yujkhINLFLMKzxoEPxLM3K5ChY72AEHyx0ATIcrshQSuCxyyjiggPPq82o6iA1BgvPlC
         8gmbqLwQ3bZsnXfrvjkGqnWH15Bj1/MbaQ8UCt+DLtLc0ejVwtjBGl0HoOjsOsC2/YiF
         bGLCKlj8HrnnqtW5NWiSer9ZYT0CXodOJ68Z7S56s/2sNHDncTFkwLsRqka6GG+q+s2J
         4nDA==
X-Forwarded-Encrypted: i=1; AJvYcCUcqb/SpbtCaqNNn7JFM1HsIMgQCb4n+6XyOXMZ3bF5KLrDgIuQrrMnPL45bMxQnHiZ6FM/9FCjiDhtxkA=@vger.kernel.org, AJvYcCVxxZLkJHl7mpph8rITzKIXb6mgbdsSXx/GfEeu7z9pJSGgS+jEX9xXiYONjRKHVoDdP0U8Ie1uI6u9p3dDg4k3DA4=@vger.kernel.org, AJvYcCWYE2SJqOuEYCFtpRDpjCRtYYXo11yvFQ7OncgZ0cW7PTQHgvdlbE3GJrGCjVWkZ7iCbmhsudqqHcYJnAU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAcH59PKOUK2QgzyxAQycKfzRvPJJRLB/WSBdjaDKyIhhCHdmH
	dSnaAKyhFm9pN/RHUmag0nRvfP7odhe/PeC+1YcQEB4sniVIdc6Vr2L7mklHcI467FhIMJYwzeW
	JRk4MkUbCRvRd7golqsbkcOcnTbE=
X-Google-Smtp-Source: AGHT+IE84rq5c82g8Tz5bnxAkvjCHAq8g0llMBa5uZLrF5eolLVIg282EihctrNLjQnRbMTuFp0Cp6yG1YuPoCNkcio=
X-Received: by 2002:a05:6122:d9d:b0:50d:2769:d757 with SMTP id
 71dfb90a1353d-50dda3caa3bmr7779684e0c.11.1729502593733; Mon, 21 Oct 2024
 02:23:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241018153230.235647-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <ZxYMaGhTDLWsUPOm@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
In-Reply-To: <ZxYMaGhTDLWsUPOm@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 21 Oct 2024 10:22:47 +0100
Message-ID: <CA+V-a8u3eW0WH5JAXtAkejXoJyijW-SgkHCYrzQ0HBZAUUkxpQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] media: ov5645: Add support for streams
To: Tommaso Merciai <tomm.merciai@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tommaso,

On Mon, Oct 21, 2024 at 9:10=E2=80=AFAM Tommaso Merciai <tomm.merciai@gmail=
.com> wrote:
>
> Hi Prabhakar,
> Thanks this series.
>
> On Fri, Oct 18, 2024 at 04:32:20PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Hi All,
> >
> > This patch series aims to add the below features,
> > - Support subdev active state
> > - Support for streams
> > - Support for virtual channel
> > - Code cleanup
> >
> > Note, these patches are dependent on below:
> > 1] https://patchwork.kernel.org/project/linux-media/patch/2024041619331=
9.778192-27-sakari.ailus@linux.intel.com/
> > 2] https://patchwork.kernel.org/project/linux-media/patch/2024041619331=
9.778192-26-sakari.ailus@linux.intel.com/
>
> I thinks also:
>  3] https://patchwork.kernel.org/project/linux-media/patch/20240416193319=
.778192-45-sakari.ailus@linux.intel.com/
>
Agreed.

> >
> > v2->v3
> > - Fixed review commments from Laurent
> > - Included RB tags from Laurent
> > - Dropped patch "media: i2c: ov5645: Enable runtime PM after v4l2_async=
_register_subdev()"
> > - Fixed checkpatch issues (ie used --max-line-length=3D80)
> >
<snip>
> >
>
> Same result here.
> Tested on rzg2l-smarc evk.
>
> Tested-by: Tommaso Merciai <tomm.merciai@gmail.com>
>
Thanks for the testing.

Cheers,
Prabhakar

