Return-Path: <linux-media+bounces-19676-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1D699E9D2
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 14:28:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CAD31C21569
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 12:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 184F320B204;
	Tue, 15 Oct 2024 12:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xEj+LFmd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A7720FA98
	for <linux-media@vger.kernel.org>; Tue, 15 Oct 2024 12:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728995227; cv=none; b=Cie+fcKzFz9eaGsBY6M6q1YC0KK9ftHAhO3Z/jt0HK3zIoP59GbP79NpqfYC/2L8ykpm3jO3vyKxVrkdFqY/Ozj7v+YsXw0JUmu1MnFAyf8MVqrJY4J66hMfgvOMo0+rpv/GZBGZ3enN/TJMWm7zZGxjPflBpUd3agxrHRdHqpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728995227; c=relaxed/simple;
	bh=IJlYtQFeLG0i9bPxCxcljLBDzVvz3Kvv8tvwApj9vmk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VOh36iGJFitqp1oFfWC8Hzd6eX8J1HMKKRO7L6wvNAmqLl3m36z/CxLxejMMuYxDSuoC7SpGibPTNGOyeyYWEQ9odWLFZFQkUj7RGT+9f2Jjp8hmhh6OttlH+CQe/nVzjn4OB6Nrt7Dy6jmEukGEhe8kIsK/Ptweuuw7iKsFhPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xEj+LFmd; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6e2e41bd08bso54923537b3.2
        for <linux-media@vger.kernel.org>; Tue, 15 Oct 2024 05:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728995223; x=1729600023; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ks6Ykml+AXF/SLAnbRT+RNH2STdD8HOXdreQb6f0egQ=;
        b=xEj+LFmdYVHPzl3DWJcKIhao6TMusleO/pV7XcxKxG1Dy95RWHZrrq+KWDTPQWOMNz
         1pKSwBXnuziqxns6Z18jZZ7yP3uWn8eUCg4L/2Om43l70dNbLoNZgOU7Enqh7n9NslXf
         Z45xAZsIMK+b1tbWOhN5Ks8iwUThF4Bs7VqnKYrLhYXuWsrfPAuZxnRqdU/3b/GSLZlW
         U50kZ2JkdUm0NuJUSt2X8/e2UzDWF2AV2QOHOXLKU69IZFDz0cpqZyCcd/siisdP1Rur
         VY1UsoztlP5lrrPT6pB4m1A3tXEwEylGqakexw2zg6FN2W3gbWwdKka+XIz3ZoNsniGX
         3nLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728995223; x=1729600023;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ks6Ykml+AXF/SLAnbRT+RNH2STdD8HOXdreQb6f0egQ=;
        b=wWoe67Rb/WZaGJhBAMHPAtzlso+OkTnMfYpfI9e/Y3n87MsUss4XUSAAYCfsoQRhOT
         uGNzpAMzgHoaJ9O2XxFS1DQlFFjCfQisXWubqgjD5M78g+Rast2e3UqQlRhWbOKRnGil
         NrbM66ZtrAXwQk9kQeJGtmeX/Dk00ZbHeIoPi7AsSK6z8Hflu9HnLaYVyGy17cuCqTWL
         05uB6ckbT5dN4lO3sTiNa9ngs3upWuJ7X5RdTJuZH0XhwcRxuT+/y/+NTzwotnKroGUE
         3FHd+vEFELoxomt/f7XZkRwsmRozGfh5or06tpdT0JAh7Jfw3d6EIvRBGhoa/TAz/Ccx
         8ouA==
X-Forwarded-Encrypted: i=1; AJvYcCVAQTu1qDszBrrNYLM1650UFZrryg+rKOJds4+V6qNPn38A3CTbSB9xwe8fYj690iYFewVZffY4v5DdKA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaisahXw54GW7pDBjz2jufTxMOmiACITjDcjhkTn478hjanCZB
	bE6o4dM47Xn6iPfp8i+s2WLg1tPBLyAYKZReGpZ/g1UTv1eVHpupNvimrt0UZWOiTDo4Y/m80je
	LPqIZTWCCOxNbVaRQ7o1E6KCIo6hNaXeID8uDCA==
X-Google-Smtp-Source: AGHT+IF9cEyFlB4rJ2xvEcXHUWgmUWBXAAmvE4lzHc02ikckmMbCT8jufBaw4HpfIgnp6G5dxrvwmFVSxwc5Xo0DWgQ=
X-Received: by 2002:a05:690c:d96:b0:6e2:b263:1051 with SMTP id
 00721157ae682-6e3640f5282mr82517567b3.7.1728995223277; Tue, 15 Oct 2024
 05:27:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241014-qcom-video-iris-v4-v4-0-c5eaa4e9ab9e@quicinc.com>
 <20241014-qcom-video-iris-v4-v4-27-c5eaa4e9ab9e@quicinc.com>
 <Zw0j9UeJmC1MZ3Xt@localhost.localdomain> <7vmxx5qtbvhyfcdeariqiult27j5rmykxrefl2qmkhqnrw5wi5@6ugxtx643bmq>
 <48f0e7a1-f5d4-62ec-ec4b-f5bf2ca9caa5@quicinc.com>
In-Reply-To: <48f0e7a1-f5d4-62ec-ec4b-f5bf2ca9caa5@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 15 Oct 2024 15:26:58 +0300
Message-ID: <CAA8EJpq6Q80fcUZfP-DRmo8LHLHrwnkFd5FQ4Mrs0hiwPUyuSw@mail.gmail.com>
Subject: Re: [PATCH v4 27/28] media: iris: enable video driver probe of SM8250 SoC
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Jianhua Lu <lujianhua000@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, linux-arm-msm@vger.kernel.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Oct 2024 at 12:22, Dikshita Agarwal
<quic_dikshita@quicinc.com> wrote:
>
>
>
> On 10/14/2024 7:38 PM, Dmitry Baryshkov wrote:
> > On Mon, Oct 14, 2024 at 10:00:21PM +0800, Jianhua Lu wrote:
> >> On Mon, Oct 14, 2024 at 02:37:48PM +0530, Dikshita Agarwal wrote:
> >>> Initialize the platform data and enable video driver
> >>> probe of SM8250 SoC.
> >>>
> >>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> >>> ---
> >> [..]
> >>> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> >>> index 86ef2e5c488e..a2aadd48926f 100644
> >>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> >>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> >>> @@ -325,6 +325,10 @@ static const struct of_device_id iris_dt_match[] = {
> >>>             .compatible = "qcom,sm8550-iris",
> >>>             .data = &sm8550_data,
> >>>     },
> >>> +   {
> >>> +           .compatible = "qcom,sm8250-venus",
> >>> +           .data = &sm8250_data,
> >>> +   },
> >>>     { },
> >>>  };
> >>>  MODULE_DEVICE_TABLE(of, iris_dt_match);
> >>
> >> qcom-venus driver has already supported sm8250 soc, I think you should add
> >> an extra patch to drop sm8250 releated code from qcom-venus driver if you
> >> tend to add support for sm8250 in qcom-iris driver.
> >
> > Iris driver did not feature parity with the venus driver, so it is
> > expected that two drivers will exist side by side for some time.
> > Nevertheless ideally we should have a way to specify which driver should
> > be used for sm8250 (and other platforms being migrated).
> >
> Agree, we should have a way to specify this. Any suggestions to achieve
> this are welcomed.

See how this is handled for the drm/msm/mdp5 vs dpu drivers.

-- 
With best wishes
Dmitry

