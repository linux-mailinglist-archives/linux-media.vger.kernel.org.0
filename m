Return-Path: <linux-media+bounces-49488-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B4253CDCA23
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 16:11:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 837153014A20
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 15:11:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E47A4346E63;
	Wed, 24 Dec 2025 15:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="MtsXlaMl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747A63469F4
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 15:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766589077; cv=none; b=FKyaG/+/qaBu4kHqOgPeuy/8OHNzDJp9Q4+AMdGrYxN5sx1QGgxKjnUkC0ctXKlQd/YJqZVMW7mrweWG1miMPPGfBFd2YhzThtK1USeKd+EDIpaknfAycTvnX4MdG1K6Gtj9U3MgPoKJLppdXmKeUTdE54eK+rugauto0tY1b8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766589077; c=relaxed/simple;
	bh=mME6WYngxf9u9OyBAcxjfcEYR7sfl8+zdjis7ko6iE8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RROeJsXb2u4PUfakID5+gldxKoQy9RompYvHbRf+Mpua+Jr+uUjykCWPeoPAYpBg+uG8wbev47A+BfBjzNvWP3Rdchr5TiGHGpq5Ps9uwRZskj/TZPsHn0s1853dI0PIqtBj6yIQ9e50fjBvorYT/Az1U17w33B6hJsjX1GXpzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=MtsXlaMl; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-595910c9178so4895447e87.1
        for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 07:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766589073; x=1767193873; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CIaTl5oO38vDqGOxjLCblHCqyMm72+Q1GNWTCa81nME=;
        b=MtsXlaMleuv1jiua0v6azkRlBoZxB4FitQyav0opeqrZgJFA8/0eNFqGCVq4ZQ5hTS
         kAtzvFLf/+QioBPCFXoaOJE816F/KeFH72/0wHRC/9aMbsuXsj5dHU/7PZDe39ATKPXI
         Qx1cDWUYIEgUH4hL5/wsNoNtgpnvuAqABhCJ2My6LOcjLFlpwTc5tXKlXvvMBDrYnhgz
         DCANtLtduevVwRfieZvPfMdF+rTnxgbAbmxucV74muore4FrV7VIk7XDng/0zSHIBQtH
         a/EMUAWI1RMdG1NEj4Bw/Eb8YpdMqNU05oss56zAcNVN8AbbyW70mqBo33lTl2gu/J51
         LIcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766589073; x=1767193873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CIaTl5oO38vDqGOxjLCblHCqyMm72+Q1GNWTCa81nME=;
        b=o6RAl3I9GHf6LoJBOwMQchJUAfnsif4TAjQw24yPh396ynilPaOTQX2HeEmkZXW2yN
         eUUoijJ59u0E4ZW9kcRl9lM9Cx4blyRZI3QNL6fOVZR+LRrj5/dMTBPXR0iYynulgCq1
         F+XVqvQjHO7qd/dJ3maIhrNijBS5gcbys8lOMHsxcxaofSGkOs0fOv881slNF4Bc9Ixt
         SNQUiXiy5uYEnDmlaHMXtDIEDhbcrObizq9H5SY7utcakCUFL1wnVrL8gobj/rTEPU4R
         GynZm5QeeDOWUXPyKY7eiwZmPTb774fgVewWEk3vfazx5O2jSSoDrxPXVSmhzyU8AVH1
         e/4w==
X-Forwarded-Encrypted: i=1; AJvYcCU3g9/lPwYnUJQKTPcFzOQz+Cw7AevCanJeacoUy6MwwrI/7BkvUBsGhX47CmfoQ/7RD8hunqAl9/VREw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbvov2/8G14MKpgqtl6nJF70x0SrvNdYydfg8c8TFmfIi024/U
	DvIvqbYlbuTIZrIdnXyhdB0EuVpVEyL9RUEqc2scKfjrlOIMpQC1KZR1eEx6/FAZhrxK50N5s0t
	MEe6pMb0uuPqkc8zOtlxltqL28+23BhIex/VOhgVtxr4vFLIiRxWX
X-Gm-Gg: AY/fxX4WS2YhKWVGLImxKbC4i/PDqQq015DppPM0mL6fLITz9bJbxFO2MoqThBinm7w
	RRnruEHtLVAO6OdW+SLu+9qShXkfM5xV1+3lQN9hEXuIEyoIK8VtN8q7llCJM2Gi9IcuTj/0BkC
	VxYX/H8VhhIVEiIns551BKX7m88SjpasV2Hpg/WCCOPHkFQ4RmdFaayb2K+0fdZXJIzL5qXZyaA
	dmsJTOf9rPkL81AyLZyiC+R2f4N0XK4yOoJJQFyN4YOAKylGSKsXeFkjKgpAW0cx0jEdltyNmhY
	jv/CJokCkI4lKG/sWsOtH/c0e8kN
X-Google-Smtp-Source: AGHT+IHdO+ycapfLLBNegWRhLFYZqlBHea1VY80HzXK/TMoBX4xJJRpd0EC7Wx2U5hQ6jnfhUvyssaiFrXaakkEWm6k=
X-Received: by 2002:a05:6512:2388:b0:598:e327:96b5 with SMTP id
 2adb3069b0e04-59a17d5cea6mr5991507e87.44.1766589073420; Wed, 24 Dec 2025
 07:11:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251107141052.221108-1-marco.crivellari@suse.com>
In-Reply-To: <20251107141052.221108-1-marco.crivellari@suse.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Wed, 24 Dec 2025 16:11:02 +0100
X-Gm-Features: AQt7F2rr4pKuzQsD0WP_B26_oYo2qEWk6yv-kFh7LuBV_kI-sE4PDHfVJjXzHlU
Message-ID: <CAAofZF6e_3xgG3cWobDpMN-6VdxaiaaevN6_m0RZWSFJxZH29A@mail.gmail.com>
Subject: Re: [PATCH] media: ddbridge: add WQ_PERCPU to alloc_workqueue users
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 7, 2025 at 3:11=E2=80=AFPM Marco Crivellari
<marco.crivellari@suse.com> wrote:
> [...]
> ---
>  drivers/media/pci/ddbridge/ddbridge-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/pci/ddbridge/ddbridge-core.c b/drivers/media/p=
ci/ddbridge/ddbridge-core.c
> index 40e6c873c36d..d240e291ba4f 100644
> --- a/drivers/media/pci/ddbridge/ddbridge-core.c
> +++ b/drivers/media/pci/ddbridge/ddbridge-core.c
> @@ -3430,7 +3430,7 @@ int ddb_init_ddbridge(void)
>
>         if (ddb_class_create() < 0)
>                 return -1;
> -       ddb_wq =3D alloc_workqueue("ddbridge", 0, 0);
> +       ddb_wq =3D alloc_workqueue("ddbridge", WQ_PERCPU, 0);
>         if (!ddb_wq)
>                 return ddb_exit_ddbridge(1, -1);

Gentle ping.

Thanks!


--=20

Marco Crivellari

L3 Support Engineer

