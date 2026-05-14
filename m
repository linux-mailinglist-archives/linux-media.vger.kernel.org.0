Return-Path: <linux-media+bounces-61587-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNXPGeqYBWqJYwIAu9opvQ
	(envelope-from <linux-media+bounces-61587-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 11:42:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C05B953FEE4
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 11:42:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 74147306BFF3
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 09:37:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3C1B3A7836;
	Thu, 14 May 2026 09:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NtaQ14M2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FE93976A7
	for <linux-media@vger.kernel.org>; Thu, 14 May 2026 09:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778751470; cv=pass; b=mxySO9NcAcamtAbEktvh0rTjGIJQv2SFEcBXP64C3J7oruIFGjBrZYAucBGEU+SJnlO3bCTFyXgK+quopr4zWhucH4SMxiHTdKHbM4X+c949P8pwNjxHhho67qwE+dk1Gr0GiSJnIpNoqk7crI+lwpaZp1at1ZIJYeNuH4NY4Ag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778751470; c=relaxed/simple;
	bh=2QUZ32A/Pu8WH3IEIeZ85oa+mEU0JR4PlJYXqqx6I1A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ggcTKJM4KmIu5e/K8s+9fIjnejHuX4jMNZvnqTumEbgWkCiBsffWPnt38pqZk8oLQZ7XeXRuUjKvaObtM87QPEt/GGwc9fkbq80c1aibx07J4f6weFruMOPl6I9kquR+Bhk2HPXFB1uhWNhfAx4JFLCSYo7IF75StWxJ4NoyAf8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NtaQ14M2; arc=pass smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-393925cb1baso79928701fa.0
        for <linux-media@vger.kernel.org>; Thu, 14 May 2026 02:37:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778751467; cv=none;
        d=google.com; s=arc-20240605;
        b=bljUGSp2JKhl1Sp8RizCYjbPod3tmsp9ezl3yNvwvtLIrVs1vwFVfmIP8e8wq8LNWp
         30hXdpF/x8dkfOP6veC1surep5WOC9bpEbD0gChn1Rjji2CUcSc975Dvi+bPe1ctzK61
         C56N7xzB5Jkiq6dtSGjOJSUgjU++HwbwzFOC9//KBewqTjt7daWHVTFdftXlfS5Gdz7D
         H8NbPcTS5aElkBLzHNUDKAagyLT96ok4IS6ZbgSFKrrWk1h3mjLPY0Y0aWVubxa6MvmK
         Kx3oHrTtppzyLUUkYyuPka3q9FqAtP/oCdDmQjOI5kxhNRgmH6qTNvha4Pnne4uQncy7
         Cnng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tUTQbk5k2QYyFCZ0CcE0IKmDTT7irxBkDTXoywueIcI=;
        fh=6UxlhFTNnGzkL6HQZQ++6L02/l9H07Wmyx0Uytgjizk=;
        b=g9ZS4Irs7C5Hvh7aEf6pHT3B0WHQkYfscMAItKpWZ6NXx1U0nLk9fzroCcFh+p0UgS
         a+SBPCzZ9HE2nxMI9c0DpxdACYYEwQQUHd/0YrWU/8a1Zh/kkuhcDmJ6/Dmz9HUodg9h
         XXyV9DKsiMT5woEbv+DN2jocaq/JJo7cXuWaG+NeshWJlLbVqz5/v/TsPtY9TwlwmM/u
         RC7Cv+5QBP9LBhE2JwnNzIelEGKNi8pYP7g+oqsIg1icXmbiwk3ZjVk+i9DhFXURKbT3
         KZI03HvvAxQGEAUcsQ7ct8hMwkJVzJgYRM7iLfrwOA1cHcpIk/IKqW5GlMCminCLN8q5
         mmcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778751467; x=1779356267; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tUTQbk5k2QYyFCZ0CcE0IKmDTT7irxBkDTXoywueIcI=;
        b=NtaQ14M2w9tkHbO5W6GeC88vGxoH4He2nidCCg3FedPRmW1bowxeFpQmt1Z3Zx7GjU
         04OjpnVrALBHiuQDq2INYnBbPc6Glyn8MCXYrWd/aoPuh00zzdcynrN6/FqvrZouaPbA
         IPC2VGFOgKnbGgvayAhQqrPCyeOpa4KFDZYPbk2npjlw4nGZ8pn+znMjmuiHwNRpmE0R
         6QCZhQrWsLg0E2UUlbvWu40psIMLt4AOdxay3uBh0/l2uZmzcCVc2vQDKknLCHjppnE2
         PtcgKtpd1GY5t2HRd2xYyjFTgx1JuEKRGoqm32vc0fT/1QUqlRNkVmRsywrJ32TBqwgr
         0ieA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778751467; x=1779356267;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tUTQbk5k2QYyFCZ0CcE0IKmDTT7irxBkDTXoywueIcI=;
        b=Y7DD5TWrj38rllo0Gal37Lg57W9R0w+HSz6kz99VRwRCXsfJgQ7d3FuWaYSJnuheCY
         ozkLYCYbPGvYKmCzXmkytVVMZ+0tKqCSQt0jKXXJTmF0hUJUW7RrY5mWmPRWzzGEWJmG
         ZxAmSLJKVIUVycMNrZvxbE5wTrh4FRqW/dPDadAs5dBn43xbFVEH8FPsl9hjywrI+Hc1
         Sf3FA7oJMl1bXXxxZVWdjpqLhVPuK8zSYMynjFP0uudGDRtb75QXm86PizuIVhaixiQZ
         Q1qC2xjp+G0LO9FtDgJH0Fnl+F7SKwvnl1PF7ylWlqZIZ44jDr9AmzcuQN7Umhr7CjXL
         bPig==
X-Forwarded-Encrypted: i=1; AFNElJ/OvDnzXeB2HPRhHZ1meJ0BOw9GT+8E1eE28IIUlwmwblU44khng86ltl4c+FmBv5/3uJYh6ykj1YOSuw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMLmGi02dVzICY9HwHytxyB+OQQqhDdCyIpj6a1YGacZJCPBUD
	X73IAzfiK6hYTYB22Nyu2ul7Ku7U/5PiTJ9suKyeytiDLSSDJickeHZIjyypjnHneyneS4SdLZQ
	yZzoBQtCbE+2lDS8jrpRC+TJxxOm0vBYZUFZAt+J9
X-Gm-Gg: Acq92OEiyUCsVO9Y1a7B+6L21Vazz66OMe7nV+nk09+acwDv9alLjg/jT9WL6DYTb3E
	oXJ5GYWM51Ln3sCIt1ArSjTSsDsgcLfWa8Dy2bo0WdGQZOAjXyGa7b7rnQaWQb2BORxgPnT/+f8
	vBVpphGX1fm3+ErxPqnJ+vp1fstQSWuA6LBV/rCjledXWif9pVX85vDr3wMHhvjHZNDIG8aFN1D
	KymW30yPJtfI5SGSnHn1JFyLEv70JRjwG1rp1mfXjxsZ7qBq3Zbw0FG+3LIWIdq9BQkKkRYfcNo
	Dnw8z5AWhXyTTokApg==
X-Received: by 2002:a05:6512:3c91:b0:5a2:b43d:ac47 with SMTP id
 2adb3069b0e04-5a8f37bb344mr2035749e87.5.1778751466412; Thu, 14 May 2026
 02:37:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513-uvc-hwtimestamp-v3-0-7a64838b0b02@chromium.org> <20260513-uvc-hwtimestamp-v3-6-7a64838b0b02@chromium.org>
In-Reply-To: <20260513-uvc-hwtimestamp-v3-6-7a64838b0b02@chromium.org>
From: Yunke Cao <yunkec@google.com>
Date: Thu, 14 May 2026 18:37:35 +0900
X-Gm-Features: AVHnY4LJejp20CDAMdH2ULqxLiaqtav1hNUpTtK6jUyHyI0HedhGH0XuzMNtdTs
Message-ID: <CANqU6Fe6tmW2ivqEekP63pgTpZA9XMtZ433QzU=H1ENQmU3prQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] media: uvcvideo: Only do uvc_video_get_time() if needed
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Tomasz Figa <tfiga@chromium.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: C05B953FEE4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61587-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[google.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yunkec@google.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chromium.org:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

Hi Ricardo,

I tested v3 and verified that it fixes the hw timestamp for the
SunplusIT Inc 1080p FHD Camera (2b7e:c877).

Tested-by: Yunke Cao <yunkec@google.com>

Best,
Yunke

On Wed, May 13, 2026 at 8:49=E2=80=AFPM Ricardo Ribalda <ribalda@chromium.o=
rg> wrote:
>
> There is no need to calculate the current time if the sample is going to
> be filtered.
>
> Move the assignment close to uvc_video_clock_add_sample().
>
> Suggested-by: Hans de Goede <hansg@kernel.org>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_video.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uv=
c_video.c
> index 6794031cd0fb..1cc86a18b2bb 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -645,8 +645,6 @@ uvc_video_clock_decode(struct uvc_streaming *stream, =
struct uvc_buffer *buf,
>         if (stream->dev->quirks & UVC_QUIRK_INVALID_DEVICE_SOF)
>                 sample.dev_sof =3D sample.host_sof;
>
> -       sample.host_time =3D uvc_video_get_time();
> -
>         /*
>          * The UVC specification allows device implementations that can't=
 obtain
>          * the USB frame number to keep their own frame counters as long =
as they
> @@ -687,6 +685,9 @@ uvc_video_clock_decode(struct uvc_streaming *stream, =
struct uvc_buffer *buf,
>             (UVC_MIN_HW_TIMESTAMP_DIFF / stream->clock.size))
>                 return;
>
> +       /* This is expensive, only do it if the sample will be added. */
> +       sample.host_time =3D uvc_video_get_time();
> +
>         uvc_video_clock_add_sample(&stream->clock, &sample);
>         stream->clock.last_sof_processed =3D sample.dev_sof;
>  }
>
> --
> 2.54.0.563.g4f69b47b94-goog
>

