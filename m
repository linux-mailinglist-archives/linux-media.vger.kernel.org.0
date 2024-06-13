Return-Path: <linux-media+bounces-13146-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9B09061C6
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 04:28:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CEA51C2139A
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 02:28:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38ABB7E788;
	Thu, 13 Jun 2024 02:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="f37yKs3d"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2E358AC4
	for <linux-media@vger.kernel.org>; Thu, 13 Jun 2024 02:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718245686; cv=none; b=s2ENNHcqhrTJ+qMI4vZrTrmFG7FvTmK1MjGdFae3OPCC0yASyz13MssvTZb4Xz8PhRH3dwTO4+DYOx+BNonWbAuOXRVU3qrDqfVZgDmw11bJecvMJbecX81RPQdiAHRv/xx3dLmbpfCAruGxii/ve6o1gYlowNKW39p9RoWIVig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718245686; c=relaxed/simple;
	bh=wQjkzUNkQvO1QQTmzJdFmOhe3eLsPajk6NuewFDYhho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hfqBcN6j6A8YHkot2XfoM/1zbIhHQtBRR+kerUesoKZhwZF5IrPxqiNyVTxX2/OZeWLW0nrN2zzLYU7RjmB+MdviilCT6PGY3d+3KrM7cW9rkBbYy9RkRTjVE7GWhm0n+Cpzpa3GEgVMbypmj/w15lR9vU0HdzweurbfH0lUSWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=f37yKs3d; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52bd48cf36bso720719e87.3
        for <linux-media@vger.kernel.org>; Wed, 12 Jun 2024 19:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718245682; x=1718850482; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NqJHo/nm4dwxUT1vSJWjZGt/TMqLX57toHgV/NshWrQ=;
        b=f37yKs3dt4fnBxljKLCDr4a0BTa5Ia63EuIZlmUwoxsvUYhjYICzT11NIXBEBigtJY
         8h5m5vcYBnpIq4pk9rSB296kWwOpcjwLhIPViqZV+o1oy39dJKeDF48vH9Hwnm41yXZj
         xlhoNxqMToaQHYi9Tf8vvRby/xhWKbGQ6L6BQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718245682; x=1718850482;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NqJHo/nm4dwxUT1vSJWjZGt/TMqLX57toHgV/NshWrQ=;
        b=HuVh9TLLgD1T9jB2VBmYFaaolxxz8RnGAXpPRP2E7prAAufONNVjjQil2QKQOHeAVh
         AQgvStfsNLxEU/jPv/lsFtnBb/QBLKcHinf/2QXCTdhjHAuvxZpaUVR+u4ISSkSC6KW5
         NoPX1FIapVYIy5uSwSMATNNKQZPWo8xSw9aat2V+JDkk1m+T70navib+EyEnV94RA8vw
         DH/lWhVVKAw98I7V5y0DF1zF5aO9mb2jYKSHSDvqwQ2VizN03EewCb9gB9S6JnqYon6B
         71wWMjL/fY4cO7PCiX2yXBLQ2GHOHtk0UGUkG3aBJoRhqyFnGy/DPcXMvABiTaufBRsC
         gCpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqL9E9QXBOqA0LlHFUCK942F5Dzh61/YyDGs7iMEJM0zUAW+yfWMQvo87iPZvLf8QezVWSZTfqK7KtXUWH997eD6HfAfayB3zr/4M=
X-Gm-Message-State: AOJu0YzedazDI0QdkDijTKYlHST+acvp5JJstMTA73CY8QaHB6pb8UPN
	njWh4SwjmjseEJzVu9LggN9CCJfdUESrgVvNu3yE1ttAmyvIvCv+TSCmn2PxPjaLScpQCfLwGv8
	zzA==
X-Google-Smtp-Source: AGHT+IHq+KGV3YGUdsiMjlzX9IEVKx2vN9Ys4853TFX3LID6ApYC11GrtwrEr9WJc9B/Nh2oLFgF/Q==
X-Received: by 2002:a2e:a98b:0:b0:2eb:fe64:47de with SMTP id 38308e7fff4ca-2ebfe644865mr22678411fa.9.1718245682444;
        Wed, 12 Jun 2024 19:28:02 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec05bf43b0sm593091fa.3.2024.06.12.19.28.01
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jun 2024 19:28:01 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52bc1261e8fso644396e87.0
        for <linux-media@vger.kernel.org>; Wed, 12 Jun 2024 19:28:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVeJ32I+7x7gQu4/UB9b8GPUPxQpZWFGVq4cqL+mWQva6aDkhCa9TcILBjpt6daaPRId8b4nSBwdsYUKBuacwjHVLrk/ZM10eZ17IU=
X-Received: by 2002:ac2:418a:0:b0:52b:c147:ea38 with SMTP id
 2adb3069b0e04-52c9a405960mr1780155e87.68.1718245681292; Wed, 12 Jun 2024
 19:28:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240612-md-drivers-media-common-videobuf2-v1-1-4625ab172fd9@quicinc.com>
In-Reply-To: <20240612-md-drivers-media-common-videobuf2-v1-1-4625ab172fd9@quicinc.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Thu, 13 Jun 2024 11:27:22 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Bdh6Lsje-71_HDK9T141jMNeNh1v400ukUVn1L5WO-kA@mail.gmail.com>
Message-ID: <CAAFQd5Bdh6Lsje-71_HDK9T141jMNeNh1v400ukUVn1L5WO-kA@mail.gmail.com>
Subject: Re: [PATCH] media: videobuf2: add missing MODULE_DESCRIPTION() macro
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jeff,

On Wed, Jun 12, 2024 at 11:46=E2=80=AFPM Jeff Johnson <quic_jjohnson@quicin=
c.com> wrote:
>
> With ARCH=3Dx86, make allmodconfig && make W=3D1 C=3D1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/common/vi=
deobuf2/videobuf2-dvb.o
>
> Add the missing invocation of the MODULE_DESCRIPTION() macro.
>
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
> While doing these cleanups, in most cases I've taken the descriptions
> directly from code comments, Kconfig descriptions, or git logs, but in
> this case I didn't see a nice concise description so I invented this
> one. Please suggest a replacement if this isn't an appropriate
> description.
> ---
>  drivers/media/common/videobuf2/videobuf2-dvb.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/media/common/videobuf2/videobuf2-dvb.c b/drivers/med=
ia/common/videobuf2/videobuf2-dvb.c
> index 8c15bcd07eef..6f6650183184 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dvb.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dvb.c
> @@ -19,6 +19,7 @@
>  /* ------------------------------------------------------------------ */
>
>  MODULE_AUTHOR("Gerd Knorr <kraxel@bytesex.org> [SuSE Labs]");
> +MODULE_DESCRIPTION("Simple DVB helper framework for videobuf2");

Thanks for the patch!

Looking at the header at the top of the file:

 * some helper function for simple DVB cards which simply DMA the
 * complete transport stream and let the computer sort everything else
 * (i.e. we are using the software demux, ...).  Also uses vb2
 * to manage DMA buffers.

I think I'd call it "Videobuf2 helpers library for simple DVB cards".
But maybe we could have some DVB expert comment on this. :)

Regardless of whether the description stays or changes, feel free to add

Acked-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz

