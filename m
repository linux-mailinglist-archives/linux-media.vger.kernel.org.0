Return-Path: <linux-media+bounces-36891-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A712AFA122
	for <lists+linux-media@lfdr.de>; Sat,  5 Jul 2025 20:10:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 877337AB5C1
	for <lists+linux-media@lfdr.de>; Sat,  5 Jul 2025 18:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E0C6215F6B;
	Sat,  5 Jul 2025 18:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A4U5QV2C"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB5818DF62;
	Sat,  5 Jul 2025 18:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751739043; cv=none; b=cIbADu3OPKmFLoxx6Tj+oTsByBjgyFzsjUCgnR8cq/xw36axko0pczuVyc4sv7rfxztkUMnYXLexKe/NJ7XHTTbf8/Pedrcdca0jtocERbVCRLaZX58ZZ0VEkIUDxiIQtOpd/OIvMrPnWUWx6OKLDSxed8UfOBsM0b1sBI/jTP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751739043; c=relaxed/simple;
	bh=ePrYXgOzX785VPMnMe2O691qcwwLURufjdOTHMlasXs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=biKq5mUqMvuClqWgLaPn8oPKxEbcuFeUvRfxLjCRkkLc4dL6gCr1Tv/o0UiO2k087droWMwg7ExCqvIEItNfpaQIHGsH58wbQpxA9bvjWzBPrgzbZg/mPkmXdioSLWcNfDII86WaCoj6VhGEaHA5vmDC9upbTqfPZMYnPg+lefg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A4U5QV2C; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ae35f36da9dso350760566b.0;
        Sat, 05 Jul 2025 11:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751739040; x=1752343840; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YNILwY6JtxDju730mgZnPVFOLO4HNV+nHw1JvlLMVAA=;
        b=A4U5QV2Cg9DRuvLzao06p49DFaNNxIQ4qcxxzD6T7uHgkIj3yjD4odPQchTSIORJTI
         I39YVcm7bpUVtlFIe7Sop6N4cru/WeAnI/WGrVu+D+eviKRGvM3GKIvfj8ey7Ct/g7IB
         eDPGZCYr3VCf+jiQO9DI7Eq3DQWTShWhHWsOYmUHkLekmG0QLPHZjNHikxP67V85+IG3
         LnX43z505dv6F3h7J2Tma3YQOTUMUcw+qXZWf2BZZ1th9fMXNahPEnM87IsAAlsW4njo
         wqPU0vztxeNFTksVa32TIKiZ50/s/sUFBWwOQGiF2vQklGdzSimcMW+hsm1DWRDojQWn
         pYBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751739040; x=1752343840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YNILwY6JtxDju730mgZnPVFOLO4HNV+nHw1JvlLMVAA=;
        b=PTUje7IRoZ0PAQ1suzpW9faFq2uvUp7+q2HRnmINBvdwkIvCMy3K5UTAiCL6uHx+7N
         eWTvqdcDDLYGXK6r4WIcYRQoEHx6IYyv8eVnRIWufghx6z/wdJsIKUYKVmzHWOsJ6QU3
         bbJ4h8Jr2pgpbimIG8KdW342KSl7tABHiAAnbL0byZ6K39LApm+ZUY8HdJZ+gF9jhtVy
         wIvzx4+rW4o6dPsfojcVZavCv06WC7gaEaMGSkfm6GF9T9eOsqkkFwZvLqAJFDhVRyX0
         fKLsh4KgSFWjOmGVSEpHPo6qfgozesDjOfR5HkxvLl7GxgAlcnr4ApkPpBpe8/iP3eTP
         mn0A==
X-Forwarded-Encrypted: i=1; AJvYcCU7BjR5thSydka5G/H9Qz29rvArtwFInzPypiiSpX6oExuKOGzIYOa0XC9sS7NgtAM4Wb1ALtKtRVn8WME=@vger.kernel.org, AJvYcCVvAogKGB/xj8FXEHG04oZwcVJ2kVWkwLpQ3y3mfhQKJ3LTWxXs//hfdpy7wzh/TJlg5NKnVDM0hYNuI/0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmGpmlvEXkKOUWuzW4FuAp+gj91psA61DG09Q0yaP6xOFhrRq+
	ICvpEbOaOwhN45zNZlvSHDT3TXmMEWDym3lmA3oGOMrtTwIaNn1kR9LYEeVfHQPRc9Ccqgh/kMD
	+5WFZyv/6GhU/QhAZLFKuYwlNfN0dGyQ=
X-Gm-Gg: ASbGncvSL3znmHBEtw2Ou1D49sDb5bAHmeHFqGsy89I5c4J0EmdE79ic3TGDE6WO7P1
	aLh822kegvl/ITNkeN+VkcbRGSEYD6Ta1kCz78tRXv1wtWXS+haQcw+bagOG7ZXmfF92sDT45Sk
	8rg2/UGtnw7ltmjGtgplEccSgOFwOeYM0nehQbMJ0MxpI=
X-Google-Smtp-Source: AGHT+IFeU1lMqRJti7UDXI9CMm8KR3it2mi8/2mz6fFw3tT4TDTp0OI5K7lZjffRjb77cUhX2MCcMe0QXmqS8UQtBBc=
X-Received: by 2002:a17:907:d93:b0:ae3:61e8:c6a8 with SMTP id
 a640c23a62f3a-ae3fba363a1mr671064566b.0.1751739040048; Sat, 05 Jul 2025
 11:10:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250704-new_atomisp-v8-0-2a8560cbd9be@gmail.com> <20250704-new_atomisp-v8-3-2a8560cbd9be@gmail.com>
In-Reply-To: <20250704-new_atomisp-v8-3-2a8560cbd9be@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 5 Jul 2025 21:10:03 +0300
X-Gm-Features: Ac12FXyxsUmqOwiU8nL9e8ipr59xYfjyV_c2ZD-BbyFglJsuEQ2Ta4EOOMuy2-M
Message-ID: <CAHp75Ve7y3pmZ5g8YXLNHyZgmZpiZNAuDdNfmhxYTOATrDBz5Q@mail.gmail.com>
Subject: Re: [PATCH v8 3/3] staging: media: atomisp: fix indentation in bh
To: LiangCheng Wang <zaq14760@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 4, 2025 at 6:41=E2=80=AFPM LiangCheng Wang <zaq14760@gmail.com>=
 wrote:
>
> This patch fixes tab/space indentation issues in bh
> following kernel coding style guidelines.
>
> No functional logic changes were made.

...

>  void
> -ia_css_bh_hmem_decode(
> -    struct ia_css_3a_rgby_output *out_ptr,
> -    const struct ia_css_bh_table *hmem_buf)
> +ia_css_bh_hmem_decode(struct ia_css_3a_rgby_output *out_ptr,
> +                     const struct ia_css_bh_table *hmem_buf)

Same comment as per previous patch.

...

>         to->y_coef_r =3D
> -           uDIGIT_FITTING(from->ae_y_coef_r, 16, SH_CSS_AE_YCOEF_SHIFT);
> +               uDIGIT_FITTING(from->ae_y_coef_r, 16, SH_CSS_AE_YCOEF_SHI=
FT);
>         to->y_coef_g =3D
> -           uDIGIT_FITTING(from->ae_y_coef_g, 16, SH_CSS_AE_YCOEF_SHIFT);
> +               uDIGIT_FITTING(from->ae_y_coef_g, 16, SH_CSS_AE_YCOEF_SHI=
FT);
>         to->y_coef_b =3D
> -           uDIGIT_FITTING(from->ae_y_coef_b, 16, SH_CSS_AE_YCOEF_SHIFT);
> +               uDIGIT_FITTING(from->ae_y_coef_b, 16, SH_CSS_AE_YCOEF_SHI=
FT);

Not sure what's going on here. But I think this is just a churn.

...

> -#define IA_CSS_HMEM_BH_TABLE_SIZE      ISP_HIST_DEPTH
> -#define IA_CSS_HMEM_BH_UNIT_SIZE       (ISP_HIST_DEPTH / ISP_HIST_COMPON=
ENTS)
> +#define IA_CSS_HMEM_BH_TABLE_SIZE ISP_HIST_DEPTH
> +#define IA_CSS_HMEM_BH_UNIT_SIZE (ISP_HIST_DEPTH / ISP_HIST_COMPONENTS)
>
> -#define BH_COLOR_R     (0)
> -#define BH_COLOR_G     (1)
> -#define BH_COLOR_B     (2)
> -#define BH_COLOR_Y     (3)
> -#define BH_COLOR_NUM   (4)
> +#define BH_COLOR_R (0)
> +#define BH_COLOR_G (1)
> +#define BH_COLOR_B (2)
> +#define BH_COLOR_Y (3)
> +#define BH_COLOR_NUM (4)

Doesn't look like a good change.

--=20
With Best Regards,
Andy Shevchenko

