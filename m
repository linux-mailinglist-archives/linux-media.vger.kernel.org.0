Return-Path: <linux-media+bounces-35835-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2612AE7077
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 22:16:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 724191BC4191
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 20:16:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FF602E764E;
	Tue, 24 Jun 2025 20:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V1DwFaMP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730A1170826
	for <linux-media@vger.kernel.org>; Tue, 24 Jun 2025 20:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750796169; cv=none; b=PCAKxNZ8M7O1SSlInph8aedDKpN3i3Nh21T8iIKkmFIP6xcOUM+G0NjxCaLRvWqgZJA8ox05sVRNkv4fmOw3u7mV1P/4iv7CF8nh2WlfFyWejPZFOurnlK8apxypRfCD6AQv6WeRCcFFmMM42AlZjD0DLK/d/E57epyyV9LzqVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750796169; c=relaxed/simple;
	bh=LQlpLij7U2hJBfjWMpFQM1lWRRuAgW8L9rlhezeL+Ss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dYt8SHRrdoV43i1t4Ept5w/9RkdSDj0Qnj2HToSC3BY18QJ26nrTommjsDAdrQot7T/uRpd4L4rPcq1TOXxIZNLpMC/chF90ppmh5lxssm7gEpaayl1J3VFJrTsOpXRGqgp99ppj2AXjJiL1sv6yy0IJY0Twy2UfU0ok0G+21gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V1DwFaMP; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a4ef2c2ef3so4531440f8f.2
        for <linux-media@vger.kernel.org>; Tue, 24 Jun 2025 13:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750796166; x=1751400966; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ZLD2wvbyX9XpGm0akax9MtkP76pZMRxr7XcCLi+G8Q=;
        b=V1DwFaMPk5072EtaDajXM6KD+Qkc75xEyUdRHaOYJwSof1k6y6An9rSDrgZm2qeqKj
         km50GpjQmSOiZts36GHyszVG4rxjx46KTSbbz+PiHcSCs41h5sGfT0pgiDKKL65joPNj
         pXyoQHHAaF3iksdgkliN6WQOpg/cwXrDa97g4WyIM1UmhlaOCxdLv7mR9O0pCjnOTZkv
         dqgsXF9wWoUvVdCEQTyaSLEQDM2IOtGnVkT05BE8spehF187gl5Jnum4Xuw/IJYc0bQT
         fTqlfB/bYizBSo+V1HBFgfZK2EDilvY6kUN8kYq+3kvQjfAaovM4+ojFlcN2BogzTnaN
         nBBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750796166; x=1751400966;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ZLD2wvbyX9XpGm0akax9MtkP76pZMRxr7XcCLi+G8Q=;
        b=V4p+Z7fKRy+UTAEA+SmEM+FOPwl/pUr3bIyYWGSRtDBlETTgtGP7gDWa6OHPyEEEKS
         j74CPAclb9RxrBkrvE17wB7bAbFzpw1eGlzajcF2BPxjkZeghtYr68UQ5Oz9NQYpJmme
         bx11R38EfuwLYujfjZQDR09HkI1v5N1XDLGDNEb2bRmVVqWd5glcLrx3APrhkXZvpp8z
         HhQPSKNpiQ5dh7MVyKgibZju469LoJqJVzkZkceR19rAuVuRAl20ZKoPiFgMBfax4lqs
         +7c+hASVmjvekOiZSDlF/m31lcRkkBjycnf8/P/Dk5o06oJDjQJLLJoJWu5HLqYAdNnA
         MbHg==
X-Gm-Message-State: AOJu0Yz5aGCF/rujiRA9A4e5hYAmCfkRFNUvnGueRW6u8KeydMgTCIPi
	JjEdjWmEZwRfkGuwxz7wm4BG975n6YouUUHLzV/hyEEIQrKVi9oFom18ZH32OLqggBLNC35BcfY
	H7eqHjMEHVKuZqH+fT6QUFV/0Ubftjmov5N+9Cfo=
X-Gm-Gg: ASbGncs6V0s+Qrozzk9tmJn2myGCwJyVp3klJDcWD0WMDIDz8XORw6eIBPNgLF6OqLX
	/XJzwNug2yCN2N7sBOaZL8a3ZiGf77ujvF8FtDUE4ox9tzsSDParaAbA9XmPWiTtDfmqwyUVQBZ
	5k70ytsYISAzlbnQSWdKsJDRXL+2DNKRPMgd5rHhqkKX+Ujw==
X-Google-Smtp-Source: AGHT+IHjP2QJ6LK/MyKzQCyo7+Jz44YJs1LBJ+TMV/rIncbFd9SeOMeewPJGVPn7JUTC1n1J/nFV+dsclUZ/2QkR8Ls=
X-Received: by 2002:a05:6000:290c:b0:3a5:2cb5:63f8 with SMTP id
 ffacd0b85a97d-3a6ed644fdamr68154f8f.29.1750796165744; Tue, 24 Jun 2025
 13:16:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250619204712.16099-1-laurent.pinchart@ideasonboard.com> <20250619204712.16099-6-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20250619204712.16099-6-laurent.pinchart@ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 24 Jun 2025 21:15:36 +0100
X-Gm-Features: Ac12FXwfMkxT3f_xHxBE_deXmDIbAgqjlmCBNZmnQ8G4QniVUQittDexcyJk-TI
Message-ID: <CA+V-a8unvf=uYAOePAhbVS90pat28GEM63+CzmZviAKJzGQ7qA@mail.gmail.com>
Subject: Re: [PATCH 5/5] media: i2c: max96714: Drop check on number of active routes
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Julien Massot <julien.massot@collabora.com>, Sakari Ailus <sakari.ailus@iki.fi>, 
	Hans Verkuil <hans@jjverkuil.nl>, Tommaso Merciai <tomm.merciai@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 9:48=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> The subdev core now limits the number of active routes to
> V4L2_FRAME_DESC_ENTRY_MAX. Drop the duplicated check in the max96714
> driver.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/max96714.c | 7 -------
>  1 file changed, 7 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/media/i2c/max96714.c b/drivers/media/i2c/max96714.c
> index 159753b13777..5d14cefe0eae 100644
> --- a/drivers/media/i2c/max96714.c
> +++ b/drivers/media/i2c/max96714.c
> @@ -370,13 +370,6 @@ static int _max96714_set_routing(struct v4l2_subdev =
*sd,
>         };
>         int ret;
>
> -       /*
> -        * Note: we can only support up to V4L2_FRAME_DESC_ENTRY_MAX, unt=
il
> -        * frame desc is made dynamically allocated.
> -        */
> -       if (routing->num_routes > V4L2_FRAME_DESC_ENTRY_MAX)
> -               return -EINVAL;
> -
>         ret =3D v4l2_subdev_routing_validate(sd, routing,
>                                            V4L2_SUBDEV_ROUTING_ONLY_1_TO_=
1);
>         if (ret)
> --
> Regards,
>
> Laurent Pinchart
>
>

