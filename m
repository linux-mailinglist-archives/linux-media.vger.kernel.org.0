Return-Path: <linux-media+bounces-21019-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 586989BF231
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 16:50:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E648F285BF1
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 15:50:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B752C1E04BF;
	Wed,  6 Nov 2024 15:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ifpKDqTB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6790F2022F9
	for <linux-media@vger.kernel.org>; Wed,  6 Nov 2024 15:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730908153; cv=none; b=TwJFbXfew1MchhFhkipO4Iwtn/ebnmIRzJL4uXC7xawTZLV16TYCArafRlutsHHz+HA0gDQd2xvXz/rmB1jD4wZHJSiyEv+6nwBlQtHlcyG7iOdbdmYMu1kZVOA49KSdsVqZWs355t2ZmYg9ndK0bLCxRiVWsOHuXeETIKsje1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730908153; c=relaxed/simple;
	bh=hVFUihgc6QnT1Xq1fEruAaXhETYPBpDfWfSixYIRYIg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lyqkvD5PQxTzzqJBQVZvFblIY5cQLfsVW/pJP+vJqxfgmesqeT2iuApjiriQAcwArem70wujAD89IdQvJ8hPOhMQW1Jb2KACY1VoW8WUTJ3SE6YwcPV+8axyjiK1VaLJepVIZGej7ruCbmyHHGxP48udMIvF115ooMeu4D/N9+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ifpKDqTB; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a9e44654ae3so908909766b.1
        for <linux-media@vger.kernel.org>; Wed, 06 Nov 2024 07:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730908149; x=1731512949; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qPH4C+vsdNY0v9MzcBPeqyGD66BVdCTndzKOwNg3m20=;
        b=ifpKDqTBv18cn2nXsbM/siAChx4Zj95etoqs8AaaIJpwPzKesVtnyEIfLZR4GUlpbo
         Jg2nMLDMJ1JF7XD4Em1LIhbghG/V+tWqm0KjzUftEMuDvfpLoZzD79jGRy6TgyXJfJ1A
         2NUr5rRaWpck6l1PiLYAfliR+3m1X5U/AM8fg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730908149; x=1731512949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qPH4C+vsdNY0v9MzcBPeqyGD66BVdCTndzKOwNg3m20=;
        b=sFqZHb/SXc8hEnLC9MwaY1Zh9C7xHfK7Zqfr7e0RVzVcR0FwNJS4n5dpjC5Y6hHjvX
         C12j4Byv/XkPCUuVZX3Gu3lO6Hf9VhVrMOM/leaYxehbSTgcLUX6qPvIqBtfLW488E5T
         NJZw+F172fdNF3NTtb71TcYfvTrdnb47WB3sCZ99h1TS5Ho0e8gZobF45J8vDudJAcl6
         VmIwL4OzOiVD0cJjQhy79fMBI/xCx7M1wt+k5vYtX49+tM2qznK6AOWJ9ouln06LTnTb
         cdd924PnGiGV8Ux/PTxag7KoSH0rMh9SB/VuMo8X8hg0DF29YRkh7ynjm9XFOMzO/cL+
         A5xg==
X-Forwarded-Encrypted: i=1; AJvYcCUgPNAigQuQsTNixCFe2nzBXKmTgG1hHBkUva0+mNLLwYX05YbP2vA1jX9cntviid3HbANX0HJamjD37Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmK7Pk5R5pDLJ7RFiyWc3FiFytAqDlRnChZ1g84vg/YyzdISoE
	e6AYBFATOjR+nKyhCgRl4UJL+B81mzmSP8bpDmKbNWAWTsyDPB5/ib/kAVsNodgczmYxhZHnob4
	=
X-Google-Smtp-Source: AGHT+IH3zDvgN+/Hkg8Fq84yth9y+7jizzM2UY/9iKlaszLC7EmLrUj3YqsqHvoFpNnmonQCvsny7g==
X-Received: by 2002:a17:907:94c3:b0:a9a:3dbf:e655 with SMTP id a640c23a62f3a-a9e508e3f86mr2560906966b.19.1730908149618;
        Wed, 06 Nov 2024 07:49:09 -0800 (PST)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb18148edsm294611566b.198.2024.11.06.07.49.07
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2024 07:49:07 -0800 (PST)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5c934b2c991so13784a12.0
        for <linux-media@vger.kernel.org>; Wed, 06 Nov 2024 07:49:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUzLJA4wPJ8d1j8cqeaH9XQiVgvRbeAE7F3Jshwu27HwX7tOzm0KZZBqHyu8oXyd3H8hh7ZQ9sF3ooCSQ==@vger.kernel.org
X-Received: by 2002:a05:6402:206c:b0:5c8:a0b1:9c4 with SMTP id
 4fb4d7f45d1cf-5cefbcb8e25mr22907a12.6.1730908147253; Wed, 06 Nov 2024
 07:49:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241022-submit-v5-0-552f0fec8cba@chromium.org>
In-Reply-To: <20241022-submit-v5-0-552f0fec8cba@chromium.org>
From: Fritz Koenig <frkoenig@chromium.org>
Date: Wed, 6 Nov 2024 07:48:54 -0800
X-Gmail-Original-Message-ID: <CAMfZQbx6-11k1eN1FC=_kRSgsh7FbTp2uvk3ufh+gOyhvxgEGw@mail.gmail.com>
Message-ID: <CAMfZQbx6-11k1eN1FC=_kRSgsh7FbTp2uvk3ufh+gOyhvxgEGw@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] media: venus: Add hierarchical h.264 controls
To: Fritz Koenig <frkoenig@chromium.org>
Cc: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
	Vikash Garodia <quic_vgarodia@quicinc.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Dikshita Agarwal <quic_dikshita@quicinc.com>, 
	Nathan Hebert <nhebert@chromium.org>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Stanimir,

Would it be possible to get this in the 6.13 pull request?

Thanks.

On Tue, Oct 22, 2024 at 10:40=E2=80=AFAM Fritz Koenig <frkoenig@chromium.or=
g> wrote:
>
> v5:
> - fixed formatting
> - included reviwed by for patch 2
> - Link to v4: https://lore.kernel.org/r/20241017-submit-v4-0-d852bc7f7fdc=
@chromium.org
>
> v4:
> - addressed feedback from Dikshita
> - included reviewed by for patch 1
> - Link to v3: https://lore.kernel.org/r/20240814-submit-v3-0-f7d05e3e8560=
@chromium.org
>
> v3:
> - dropped reordering patch
> - updated cover letter
>
> v2:
> - cover letter
> - testing methodology
> - Signed-off-by
>
> V4L2 has support for encoding with hierarchical frames using the
> V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING* controls. This allows for
> specifing frame references needed for temporal scalability. Encoding a
> single stream with a single layer allows for the layer to be dropped and
> the stream to be decoded without artifacts.
>
> ChromeOS is planning to use this feature for the L1T2 web standard[1].
> This allows video conferencing apps to encode once for a clients with
> different performance/bandwidth capabilities. As the application is a
> real time encoder only P frame support is added.
>
> The ChromeOS test framework ("tast") was used to verify that no
> regressions are present. This was done on SC7180 ("trogdor"). These
> patches were also run on SC7280, but not with as an extensive test set.
>
> Verification of the added controls was done with a bitstream analyser to
> make sure that reference frame management is correct.
>
> [1]: https://www.w3.org/TR/webrtc-svc/#L1T2*
>
> Signed-off-by: Fritz Koenig <frkoenig@chromium.org>
> ---
> Fritz Koenig (2):
>       media: venus: Helper function for dynamically updating bitrate
>       media: venus: Enable h.264 hierarchical coding
>
>  drivers/media/platform/qcom/venus/core.h       |   4 +
>  drivers/media/platform/qcom/venus/venc.c       |  71 +++++++++-----
>  drivers/media/platform/qcom/venus/venc_ctrls.c | 126 +++++++++++++++++++=
+++---
>  3 files changed, 164 insertions(+), 37 deletions(-)
> ---
> base-commit: d07b43284ab356daf7ec5ae1858a16c1c7b6adab
> change-id: 20240814-submit-05880a074377
>
> Best regards,
> --
> Fritz Koenig <frkoenig@chromium.org>
>

