Return-Path: <linux-media+bounces-50841-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E0407D2DBCE
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 09:11:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DF9E0301937E
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 08:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2ABE2F1FE7;
	Fri, 16 Jan 2026 08:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ChiTev5k"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAA42EAD09
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 08:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768551063; cv=none; b=t0UU4ySaYJnamCluCnfA6Gb7w1DoMwLy5Yholfn4CN1BwGWgm3raWE79UPhklU4F4n4DDZmLUJzoaywtaELK4TEx2rd0ihYMXPS6eIBhvFxwYphI2BGGuYFyogpKH95m43xkrvXLEGtjk2Sp5kqKC5LXrvHrjJgL8tL4n1zGjcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768551063; c=relaxed/simple;
	bh=V2tFe0XUwxqTapekW1Mzx/DadAu9gNFcir/81DpoFHQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TihDNbnJcRlJmPRfraWMWBx5dqACaVmppxDH0eprMXu0u/79Ukm+M4dgzoxyx5W4uqTkbHxIlIIIsNSFhKyZitnBJr03ctEKApPSlbpftVPsvet0ltX49YiRfZltDytixJPGbitu8pxedz0Zi9z59AfnmHn8kiuXMaOxC+IEmbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ChiTev5k; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b8710c9cddbso241945866b.2
        for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 00:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768551060; x=1769155860; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+FlQ8Fy3LtvyqW1w8wqJOR68E11Ksdj0bttuuvoGMFI=;
        b=ChiTev5knvFfjnqbmYCoRVTBcXYwumuOIj0dESG578kkIt9ZITi6Pk+ycsV4k2jEb/
         1RNddF5lsSAHmFwjnxc0JqUy/7CbnmURuevUEemM6vYlKx1a1v38BvNlGD0ArJXOkypK
         +2ScGbRF4fSHi9Im/A475DvCTmIoTc9UlgVHr6ud6Pp2x1hFSFkvIdPoYdacpbEEPbWg
         3uC1vHwiUDk7TJcT74QBg3pR3zTRiO0yxQ0KDLOwuolbG2ccdUpM9IWYlOzWJnBLTDyf
         5GSOgKGVq5Lk2XxRfrHENnfbLGafrwEwX31/QuU54tvFNr+IjIx5yQ5XosrVBp3LL+EA
         /DEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768551060; x=1769155860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+FlQ8Fy3LtvyqW1w8wqJOR68E11Ksdj0bttuuvoGMFI=;
        b=a5l75RXGxkAPH9CMmCIRn27HPtyY+iCyLql7kXaZnd+k6K1bIstTnFmRyZksNtWk8l
         TRgigC5+nifPBBkt8a4Qckf05ki11T6srERaZ+d9wUtu5HRaBZ2DhIwWSLFUnptdZrP9
         gRM0+9VVzIurdwXTWN7Px6bnV0WIKLBBW69qdpCIElGFJIz/4LsVBLwWG/eQZTB7FMkP
         8/mTfSb6YatNLSIoQtF49K8R6dJNfxJQKeFxLul74dMpHoPS50PSJLEFMwZfvK/qxjzI
         hDFdUskHb2/yqmAKQbIFuStBkJO7NicqErjsJF2//zfcZUPislW+moFMdDsShFVo/1wc
         kl5w==
X-Forwarded-Encrypted: i=1; AJvYcCWkbi+ADR7/c8h9neRaHriJoo3LxmhDVmSO654p/fnK0wbqzFzJckL5TARgryDQ3sEKXYfNZLKeG7fedw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOv1uihSGDxEi5sbf96L4/4qQR0LtjLkR8W6py7PQzeUGddiOI
	LHpzUhBb6rN3odyKx8W4Dn5Snj/By/SPkksmpu6vzyeDzBr1sZcB4rmp8f8TRdRR85qob+Bjz00
	vpbRuQwz5OZcg87zarMzM1BkMjm7oa2Ze/xEt
X-Gm-Gg: AY/fxX6AYGeXw5y55sUgPNyHZaEuNx8I7gxCN+GCBR4neFrrowThwEVUt1DCcGglh2M
	8GgJh/u6dpSwxArXoI6cjgXqZoa+e5STsMri/joidsrxWsDXfDHTEyCrArd4+sqSaUxG053Mw0W
	vlAXogzAjnGyXeNopqoUEJuh/2lzvaQMRSPKGfLFumkxXs727bIYSp9yO7FscXv2R5mx9/rUrLN
	guhn2DCAcnaaYEaJyBALQkLXk59ngpefDlyrTVTH7z8klZmhe9gEP2TeUQptiNG2/E2n6suQyhq
	+3hnVHfgXfzm/cygzvRS7Aalaou8ojVDX2y4Ihs3QxbeZzfNd4j1m9tFnYFAol0agnrA9s4=
X-Received: by 2002:a17:907:7f90:b0:b83:1376:2bb6 with SMTP id
 a640c23a62f3a-b8796afd58dmr129649966b.40.1768551060099; Fri, 16 Jan 2026
 00:11:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260116072121.7591-1-hamdankhan212@gmail.com>
In-Reply-To: <20260116072121.7591-1-hamdankhan212@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 16 Jan 2026 10:10:23 +0200
X-Gm-Features: AZwV_QiyUOIxQjOUH_5Eh5Y3o_DUAbRTOzttku8_jqkoyIAjLFnwWX66dCRK5Ow
Message-ID: <CAHp75Vefv2PCtd-xOw+7906g7MxXVzSE7cOm-xJ_fxe_arCx5w@mail.gmail.com>
Subject: Re: [PATCH v4] staging: media: atomisp: Fix typos and formatting in headers
To: Hamdan Khan <hamdankhan212@gmail.com>
Cc: gregkh@linuxfoundation.org, andy@kernel.org, hansg@kernel.org, 
	mchehab@kernel.org, sakari.ailus@linux.intel.com, dave.hansen@linux.intel.com, 
	tony.luck@intel.com, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2026 at 9:21=E2=80=AFAM Hamdan Khan <hamdankhan212@gmail.co=
m> wrote:
>
> This patch updates block and inline comments to follow kernel

s/This patch updates/Update/
The recommendation to use imperative mode is documented in the
Submitting Patches.

> commenting conventions, fixes typos and wording, and reformats
> long comments for clarity and line length consistency.
>
> Although some comments used the /** ... */ style, they are not
> kernel-doc comments and are converted to normal comment style.
>
> No functional changes are intended.

...

> struct atomisp_3a_statistics {

>         struct atomisp_3a_output __user *data;
>         struct atomisp_3a_rgby_output __user *rgby_data;
>         u32 exp_id; /* exposure ID */
> -       u32 isp_config_id; /* isp config ID */
> +       u32 isp_config_id; /* ISP config ID */

Useless comment (no added value), just drop it completely.

>  };

...

>  struct atomisp_resolution {
> -       u32 width;  /** Width */
> -       u32 height; /** Height */
> +       u32 width;  /* Width */
> +       u32 height; /* Height */
>  };

Ditto.

...

>  struct atomisp_zoom_point {
> -       s32 x; /** x coordinate */
> -       s32 y; /** y coordinate */
> +       s32 x; /* x coordinate */
> +       s32 y; /* y coordinate */
>  };

Ditto.

Also double check the rest. The rule of thumb is if the comment just
describes what's obvious from the variable name (without knowing the
driver code and design), drop the useless comment.

...

>         /* GDC shit size [BQ] */

Probably we need to fix this "shit"...

>         struct dvs2_bq_resolution gdc_shift_bq;

...

> +       /*
> +        * The overlay start x pixel position on output frame. It should =
be a

"start x"
on the output

> +        * multiple of 2 * ISP_VEC_NELEMS.
> +        */
>         unsigned int overlay_start_x;

...

> +       /*
> +        * The overlay start y pixel position on output frame. It should =
be a
> +        * multiple of 2.
> +        */
>         unsigned int overlay_start_y;

As per above.

...

> +/* MACC parameter control*/

Fix the spacing in all comments you touched.

--=20
With Best Regards,
Andy Shevchenko

