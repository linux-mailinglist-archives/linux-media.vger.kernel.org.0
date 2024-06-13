Return-Path: <linux-media+bounces-13147-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B338D9061CA
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 04:28:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3291DB21636
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 02:28:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CBA012BF1B;
	Thu, 13 Jun 2024 02:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lXHSbe7L"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81352839FF
	for <linux-media@vger.kernel.org>; Thu, 13 Jun 2024 02:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718245689; cv=none; b=nWEN5lZ1QzXiZJDwqlabWZIs+/OHTN5N2r9Ent6hLJyBi8M7QLT9EAOYt7N2pdA4RzqDckTVsQ5hM3JzXS4YU9KK1CwYulgba5eMKZN/0dAB7b8lcVNXVS2Iwlq7wnxRNNJigbFVGvZTuqeTcWZb2I+3ctxG4fVWAgP2Qdd0yPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718245689; c=relaxed/simple;
	bh=wQjkzUNkQvO1QQTmzJdFmOhe3eLsPajk6NuewFDYhho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ak33U6YDgv5akFTDshIH5RHMbKgmhGSgf3qQD0iMyhb6vhK+mePT3aPYHCfn6aPhLFwKtvi0L7t5OgZ042e6YoFly/qeTGWYSz9bTjkgHT6nPaZjh+kN/pXIN5GrSIBCoTCnWkyZplnekw1aSZfQEYABAXqZ5RUgtU5sy6+1vjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lXHSbe7L; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-62a2424ec39so5984677b3.1
        for <linux-media@vger.kernel.org>; Wed, 12 Jun 2024 19:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718245686; x=1718850486; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NqJHo/nm4dwxUT1vSJWjZGt/TMqLX57toHgV/NshWrQ=;
        b=lXHSbe7LNXHBacSXwHO3BVwXmEhvaDObH/A650gblHD4dlFqbw1LLGtQxWBNoTlZkq
         Px/3HazDGJvD7z44wNSzLtF+ngF89zyxk8F3UEFT0rujB6nqWI9l4Fzt5WeSnW+IUP74
         r1a4rq72vPKGQv1CPmp9lon25H1x7dIut8ZcY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718245686; x=1718850486;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NqJHo/nm4dwxUT1vSJWjZGt/TMqLX57toHgV/NshWrQ=;
        b=jPAFkbScaav2/bxTdmnchvju3tGb6OQNx9xfcvgePcAjc1OYF+J/N/ZAFkQwrTpjKn
         YBb89l3ff15T7BrvuitPznrz7B9xdfimObH8ukhed+MTZy6l1HHpvTzecen281MPeRf1
         NWC42AWwEkxjaqSRlJiNjUx4qSpalFFV4D5fTgVM2gXAR9JQgrJ4jghOXAxNCEDxanEE
         YsQLfMzRDjBXcjreh6DJkS3qkRKQtdt6wGYvPUb+oxKggxrjDv+mPMzveRJkYelymFd5
         HD22vWoMaT8poOeO8Agub/yHYDSBmBflr+UmYi2fQ+6UX2ZPfhaKVM0/q9/Hdjq4VVbX
         hR4A==
X-Forwarded-Encrypted: i=1; AJvYcCXfBGiGae90QVOW/PSFOtTNDdr1zykbYfKUlbEUr/nf+X4vjZEcRzby8VsEAIp95jPhxTfOZIEdAVd++qbSAaWckRUqoz7RVZeQCjY=
X-Gm-Message-State: AOJu0YwYbmjBtfB+/C+INnail23STm622rvt9GoNI3bTXOhO1SjjYllE
	HvT/07Keyt//9b+iUNV86Rj96nmtpdH144tNUZ3Sv16WI87YtyKG/TyqYS3yaJGBy5JA6EIc/n3
	kmHfw
X-Google-Smtp-Source: AGHT+IFEYAEgZAqT0JGYVK6Htm8SoHOgCbM9c8oq7d13NiHSDBWQ2NV0xljkv0s8mSZyZMgnHsJNhw==
X-Received: by 2002:a25:9344:0:b0:dfd:f95b:1df9 with SMTP id 3f1490d57ef6-dfe68d071d2mr3194154276.45.1718245686052;
        Wed, 12 Jun 2024 19:28:06 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-dff048bd22csm62950276.34.2024.06.12.19.28.05
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jun 2024 19:28:05 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dfe43dca3bfso645365276.0
        for <linux-media@vger.kernel.org>; Wed, 12 Jun 2024 19:28:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXiPXVM9q4u66BsbRL1RQDPgY51XMMSr0wiQGxThodweN84LDyTwGVVxW8/TPKk6FXOzWeX8hcmusqj0c/Ui44ctKRtPRrxF5p1mUo=
X-Received: by 2002:a5b:605:0:b0:dfb:157:e69b with SMTP id 3f1490d57ef6-dfe6606f3cdmr3375488276.12.1718245685102;
 Wed, 12 Jun 2024 19:28:05 -0700 (PDT)
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

