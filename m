Return-Path: <linux-media+bounces-23072-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 633819EB634
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 17:24:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF8EB281754
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 16:24:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 671891C2DAE;
	Tue, 10 Dec 2024 16:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ta+vKn2r"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7C11A08C5
	for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 16:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733847851; cv=none; b=OVRAjqLqMjy0H8nNM2DwjBPbaTbdIfkFKC8INjDNj8C/pEku6ZAh0rGXZcTEPLqzQ1tLNcUMBq35PPZFIQe2IuGu7qQ5NERvlYPjE7OKnWmUvbc1dauBVtAY/jSI4EAsd0bca3kqRxFCdXZIZKN8Atlxn/+QjpjDqzml3cxowTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733847851; c=relaxed/simple;
	bh=lqZ6jfWQv518JCCW7cIDrKpuYmAnQVHmRlFDMQF5Ifg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u1r/NM9ye2JZ7jh4QSZwb+IpjzkG00dr2zG9gnwztJmR7WCVnyxat+LWdGBoP+2MySSFFo11QW/XuUaYDHpAE1V2Xl4qLPhBUYjjksuU0briF36Elwb4O8bIDtIBy1kBVlJ4hN1QSFjwkIhXBtSxSPIxjPdzBmGdFFVcyZO+y38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ta+vKn2r; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5d27243ba8bso8599844a12.2
        for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 08:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733847847; x=1734452647; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l1Zl6mnBjiQBNeF1Q3VMTAkh1KaygVJextd08NrJPLQ=;
        b=Ta+vKn2r6vus4DWqB4e7Mp2tp0yqU5NWY5BVE9UuqdXHqRjo193jP7ZZVYRL3wYqQa
         KACoAFyF6kE3oERfdu8r3Re3yb2CzH1IjWeLAuYzay7bypjBE6Ax4hV7nI5hCOkK0cn2
         TAdzpdqZtQwflhVCn4WlDPXNgzOstm8lYyEjb/S+4DHUFOQqWb0Uc9Ial65LSsUhHbfp
         +x2gkiNGziimVWfjhqnt3WVxGSwBOyyj/i0UmEGUhT0LC/a9jnD6Xr3pb3DC1DUf7xAW
         i0sy2kNugbSn7ufck5Ei4FpZjB7kgN91MN1fAtvviXVe/5pq3WWF0WbIZJSTqJ5SxDkA
         TjEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733847847; x=1734452647;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l1Zl6mnBjiQBNeF1Q3VMTAkh1KaygVJextd08NrJPLQ=;
        b=Sk9xsFoiBRqbkKIYQA/fNAPffqW2k1nCZl2Jou9gBrezjx2FAmo+YTW+Z2ArkZRtsw
         Z+nFgUUBMHUXp/ZAF3+Qlmr/YHqOhaNUgs+KllJ6Xo4ZifRD+LvGLgUlIJBcVSzQSnKw
         0OWVZ1KkmQSqemJDNrSREdXSM4yUr+TwTE3d6vl7DvNIMhaoB58jUZVDoOtEnaw5SN/a
         xC8YWPV0tsx9mz1+zM4i4ePVR9TVX8L8IEp4o4FJ5vjMWxz0aySLcJ53dEf4kEvjRvZO
         NcEkgNRbO3++e+xS7CjIK5PpuKn1UxGvSZz2rnERszG6ZYVQ6pJp26gdqoaQaCWjCVsm
         AbQg==
X-Forwarded-Encrypted: i=1; AJvYcCUcr76bUsx+iQ8rlPi4GhHKqtuNJ+6u6D3aIsntjWCP4F4sp0HfoZeDJDzy3osZLL2dJ9rwrwrduY9pQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjAl8YA8NkudF4DybpCSRABCioBJ+SSAuKpwGvMeua+56K/mGu
	Ppphx2bNLVU0nV0e5JCbEdsOdcABfq23/TojgotM57N+XidPymg3lTycpucsNxHPxVCDid0J5J9
	59w01VIM6k1tHoxtqAhXrohJO8pcPhu0IBmxdNQ==
X-Gm-Gg: ASbGnctVKe/BUJYykZ9YKrF4DhwtZSiiRxSXpjLR9/CNrS0UpHFotg09yyOGNM4Nonu
	vdkrPVww/QO/jk+gHXhp/pY/Fj8Ua4cyJA+Q=
X-Google-Smtp-Source: AGHT+IEDe+ZlasDaSk7kkMNC2p4PajKO8n+r9pHmoj0mnmgFy9RuiKu/RGzpGKCUoMbkgvfshlUA8vwl2fXnyVlspYY=
X-Received: by 2002:a17:907:6ea0:b0:aa6:7285:469b with SMTP id
 a640c23a62f3a-aa69cd5c6cdmr593652366b.18.1733847847098; Tue, 10 Dec 2024
 08:24:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241210-qcom-video-iris-v8-0-42c5403cb1a3@quicinc.com> <20241210-qcom-video-iris-v8-27-42c5403cb1a3@quicinc.com>
In-Reply-To: <20241210-qcom-video-iris-v8-27-42c5403cb1a3@quicinc.com>
From: Stefan Schmidt <stefan.schmidt@linaro.org>
Date: Tue, 10 Dec 2024 17:23:56 +0100
Message-ID: <CAEvtbuuO5Ga+wW9rstX_e_RGnm5jSNSHmyy3w3M9FTopNhKttQ@mail.gmail.com>
Subject: Re: [PATCH v8 27/28] media: iris: enable video driver probe of SM8250 SoC
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Nicolas Dufresne <nicolas@ndufresne.ca>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Jianhua Lu <lujianhua000@gmail.com>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

hello Dikshita,

On Tue, 10 Dec 2024 at 12:08, Dikshita Agarwal
<quic_dikshita@quicinc.com> wrote:
>
> Initialize the platform data and enable video driver probe of SM8250
> SoC. Add a kernel param to select between venus and iris drivers for
> platforms supported by both drivers, for ex: SM8250.
>
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>

[...]

> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -17,6 +17,8 @@ static inline bool iris_valid_cap_id(enum platform_inst_fw_cap_type cap_id)
>  static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
>  {
>         switch (id) {
> +       case V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER:
> +               return DEBLOCK;
>         case V4L2_CID_MPEG_VIDEO_H264_PROFILE:
>                 return PROFILE;
>         case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
> @@ -32,6 +34,8 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
>                 return 0;
>
>         switch (cap_id) {
> +       case DEBLOCK:
> +               return V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER;
>         case PROFILE:

The handling for DEBLOCK does not seem to be part of the SM8250
enablement. Or did I miss something?
It seems they should be part of a different patch that makes use of
the DEBLOCK cap.

regards
Stefan Schmidt

