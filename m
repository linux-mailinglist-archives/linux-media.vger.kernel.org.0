Return-Path: <linux-media+bounces-26983-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D53FEA44E51
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 22:05:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 533493A0379
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 21:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E09B374F1;
	Tue, 25 Feb 2025 21:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zIih33a1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54961A2567
	for <linux-media@vger.kernel.org>; Tue, 25 Feb 2025 21:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740517472; cv=none; b=gJemJcy2PmKQ9EyTULGZPW2dgIaRVwVr+HCqtOVINcemSbqLe3uS6191wTFraAhGgoTz48dk6vF82FZZxbZZpBdIlIy99Vuuyb+FQWS5bkid9saozPK7VQgragH6MVnpcclFtSx/e/Ht5CaMBFEDDGVtvpN8Xs3oRqXySdeuGwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740517472; c=relaxed/simple;
	bh=I/25Jmw+t2sT/DkbYYBMcE1q//mARf+z6HmziZh3y7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cI/efi2DGYNIWxNm28Dl8S2MU/Cbieka5+G56I+ne5X1MlhzKHLOH7LN6TGGdcOrq06Jd7Iqs19YA4zUulwClrEtTSYTpGRHEj7WPaCjYewqrvAixwyuIBJ1iJxv3QLgsQ0RQRMxVK+G+5H+BoV5RmRwJcO5JwMRXslNRyAeTpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zIih33a1; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-545fed4642aso5788716e87.0
        for <linux-media@vger.kernel.org>; Tue, 25 Feb 2025 13:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740517468; x=1741122268; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oh2LCZ6Xmd+yld9uURbYtvmO+VoZxN+EACrQ3dvsQsM=;
        b=zIih33a1bYGrOxn/D5vUsNhR/G6S9N7X2VxI2ACC7TS2UxS2zGFhqltbquuhJ7DvMF
         fyYoa9gPN5vxSYNeg8WhAMpk1KBfcy+WS76koXEBfywRrLtugwpc0+SN8XfuYX8QMS6Q
         TqJ+wfKp2p7JuZTuYWtxwAHXw6NT37ombwC9HQsViEjWnIlrodsk7piH3F30veEQiWBG
         1am6w9HHy4BVJCEDU3gOETSFgh++CKv5vSsDLxd1bV12X6rpUHUx1xBcG7rJsGJ4WSqg
         lMhCEVLoX4gwbwfqsC4KhBuJS8TSM/rXS3MXxfp/gQm6kTXA46NklFLcteoh/lqMpYdf
         BYmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740517468; x=1741122268;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oh2LCZ6Xmd+yld9uURbYtvmO+VoZxN+EACrQ3dvsQsM=;
        b=TYtK90xUNBcxozR9jYi4MhIE27WWp5mrmYzzmFVtrdgtrMLcU5ubhcB4agfZXMPOG/
         0EavZV4T2Vs9rekrqedyvwO/2x6afkkgmdXpkaw/DvwD9/uoB3FSueDCAvsemgsdWQ0j
         N93m6OnkdpG+9Cl5gdc1an8UY4NDFhW09aalpIoUkXOBgyAIJEpPYeng3pWzLXW2Id88
         yZTidHaE4AVmum+bc0WbfCU5ssfYxyh5Vr+2aYxunGcB1eWpwGkCwAaX0xTPhQWSMQVU
         lj1vGULGqmaJTxUHwdNvXfvvqcXi4e0PpFm80rYo5adeOetLTB6kiVdAD3buWuFbWikK
         Xw7Q==
X-Forwarded-Encrypted: i=1; AJvYcCURL1QV6fCui7uCcVnB7hgK6tuKLGH3C5mHxWFGfXanH+NjyrETEKfOf5Z5uglvXjxiHAeWpODTPnGtlw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyebaea9RJ4puA0xwzdSHVu//x5po8FnPtWuP3V3Wfd9PNkn4wh
	wBQbcPK4uKS5untRZb+EslJ48yEMMEcDL4K3LNZzg9tW4+5/EaBp2tmm+RtjFhQ=
X-Gm-Gg: ASbGnct6QAZkG0boE6wCnXa6ugaWvqvMJ2lPhU2XAdPuNfPYDhVYRKPbWVZ/2CftB3X
	4UgGqbjpEi+6EfDig2tJUCq5J7tHlFM7OiqlcqPjNrYZjv7nIhlSYSYThzVbFmXaQjkDWWDwioT
	7QZmmt37ygv0gvErdx5W6jkb+ffnLDjuXplQMBuHqrKu6MfpDy24TkzvYfqNHKmAC/T9glrGQMq
	cUwq3VewnnbAkJ7PyaEGuFQqOODQhUXgvHCTZLm2uYP8MVMeEllSjv6Wg4f7EGDuN/GT/22qha5
	7Hsp8HxEe4HXv+U1cqVIVIOGmbTUYmIwOCWnmN7HUxFepRPktOM1vi7f5yvm3VZudJHDsXqeUFf
	Cs3RSBg==
X-Google-Smtp-Source: AGHT+IGSJ3/FeytcIIUDNdCsiZI6f44MRBOH0T0mkyaZomGE6ppjpd0SXRC+iiHEGT7aRL6UWqluGg==
X-Received: by 2002:a05:6512:6ce:b0:545:441:52d2 with SMTP id 2adb3069b0e04-54838ef4c73mr9588305e87.23.1740517467870;
        Tue, 25 Feb 2025 13:04:27 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514fa276sm265613e87.245.2025.02.25.13.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 13:04:26 -0800 (PST)
Date: Tue, 25 Feb 2025 23:04:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: neil.armstrong@linaro.org
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>, 
	Dikshita Agarwal <quic_dikshita@quicinc.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] media: platform: qcom/iris: add reset_controller &
 power_off_controller to vpu_ops
Message-ID: <cgvgobjn2mm5ekugu33hnw6ennduzuazdpee757n4c4zfrjgdv@cnsbsbxpt3m7>
References: <20250225-topic-sm8x50-iris-v10-v1-0-128ef05d9665@linaro.org>
 <20250225-topic-sm8x50-iris-v10-v1-2-128ef05d9665@linaro.org>
 <ityd34gfiyt6fvyuopnh3bi3edc5t2ubop4i72d54xyhhz3ixf@n6rnt5mwgw4b>
 <48f339f5-09f8-4498-83f2-4e2d773c3e23@linaro.org>
 <CAA8EJppFCF9Mf_LXr4EMV94rVw9qHJQFKtfXwuqTmtHQA=2gnA@mail.gmail.com>
 <fe25be80-9b5a-436f-9f50-7adf059d8726@linaro.org>
 <5mnho424mrrj2fwrtbdzjtkgvhlmoxcy5ba2rjjn4hvrgbmco7@7q6ezfbgi6m4>
 <9cf6e092-db2d-4d49-90c3-d8a62658b2f8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9cf6e092-db2d-4d49-90c3-d8a62658b2f8@linaro.org>

On Tue, Feb 25, 2025 at 07:10:00PM +0100, neil.armstrong@linaro.org wrote:
> On 25/02/2025 19:06, Dmitry Baryshkov wrote:
> > On Tue, Feb 25, 2025 at 06:55:58PM +0100, neil.armstrong@linaro.org wrote:
> > > On 25/02/2025 11:41, Dmitry Baryshkov wrote:
> > > > On Tue, 25 Feb 2025 at 12:04, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> > > > > 
> > > > > On 25/02/2025 11:02, Dmitry Baryshkov wrote:
> > > > > > On Tue, Feb 25, 2025 at 10:05:10AM +0100, Neil Armstrong wrote:
> > > > > > > In order to support the SM8650 iris33 hardware, we need to provide specific
> > > > > > > reset and constoller power off sequences via the vpu_ops callbacks.
> > > > > > > 
> > > > > > > Add those callbacks, and use the current helpers for currently supported
> > > > > > > platforms.
> > > > > > > 
> > > > > > > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > > > > > > ---
> > > > > > >     drivers/media/platform/qcom/iris/iris_vpu2.c       |  2 ++
> > > > > > >     drivers/media/platform/qcom/iris/iris_vpu3.c       |  2 ++
> > > > > > >     drivers/media/platform/qcom/iris/iris_vpu_common.c | 14 ++++++++++----
> > > > > > >     drivers/media/platform/qcom/iris/iris_vpu_common.h |  4 ++++
> > > > > > >     4 files changed, 18 insertions(+), 4 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/media/platform/qcom/iris/iris_vpu2.c
> > > > > > > index 8f502aed43ce2fa6a272a2ce14ff1ca54d3e63a2..093e2068ec35e902f6c7bb3a487a679f9eada39a 100644
> > > > > > > --- a/drivers/media/platform/qcom/iris/iris_vpu2.c
> > > > > > > +++ b/drivers/media/platform/qcom/iris/iris_vpu2.c
> > > > > > > @@ -33,6 +33,8 @@ static u64 iris_vpu2_calc_freq(struct iris_inst *inst, size_t data_size)
> > > > > > >     }
> > > > > > > 
> > > > > > >     const struct vpu_ops iris_vpu2_ops = {
> > > > > > > +    .reset_controller = iris_vpu_reset_controller,
> > > > > > >        .power_off_hw = iris_vpu_power_off_hw,
> > > > > > > +    .power_off_controller = iris_vpu_power_off_controller,
> > > > > > >        .calc_freq = iris_vpu2_calc_freq,
> > > > > > >     };
> > > > > > > diff --git a/drivers/media/platform/qcom/iris/iris_vpu3.c b/drivers/media/platform/qcom/iris/iris_vpu3.c
> > > > > > > index b484638e6105a69319232f667ee7ae95e3853698..95f362633c95b101ecfda6480c4c0b73416bd00c 100644
> > > > > > > --- a/drivers/media/platform/qcom/iris/iris_vpu3.c
> > > > > > > +++ b/drivers/media/platform/qcom/iris/iris_vpu3.c
> > > > > > > @@ -117,6 +117,8 @@ static u64 iris_vpu3_calculate_frequency(struct iris_inst *inst, size_t data_siz
> > > > > > >     }
> > > > > > > 
> > > > > > >     const struct vpu_ops iris_vpu3_ops = {
> > > > > > > +    .reset_controller = iris_vpu_reset_controller,
> > > > > > >        .power_off_hw = iris_vpu3_power_off_hardware,
> > > > > > > +    .power_off_controller = iris_vpu_power_off_controller,
> > > > > > >        .calc_freq = iris_vpu3_calculate_frequency,
> > > > > > >     };
> > > > > > > diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> > > > > > > index fe9896d66848cdcd8c67bd45bbf3b6ce4a01ab10..ec8b10d836d0993bcd722a2bafbb577b85f41fc9 100644
> > > > > > > --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> > > > > > > +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> > > > > > > @@ -211,7 +211,7 @@ int iris_vpu_prepare_pc(struct iris_core *core)
> > > > > > >        return -EAGAIN;
> > > > > > >     }
> > > > > > > 
> > > > > > > -static int iris_vpu_power_off_controller(struct iris_core *core)
> > > > > > > +int iris_vpu_power_off_controller(struct iris_core *core)
> > > > > > >     {
> > > > > > >        u32 val = 0;
> > > > > > >        int ret;
> > > > > > > @@ -264,23 +264,29 @@ void iris_vpu_power_off(struct iris_core *core)
> > > > > > >     {
> > > > > > >        dev_pm_opp_set_rate(core->dev, 0);
> > > > > > >        core->iris_platform_data->vpu_ops->power_off_hw(core);
> > > > > > > -    iris_vpu_power_off_controller(core);
> > > > > > > +    core->iris_platform_data->vpu_ops->power_off_controller(core);
> > > > > > >        iris_unset_icc_bw(core);
> > > > > > > 
> > > > > > >        if (!iris_vpu_watchdog(core, core->intr_status))
> > > > > > >                disable_irq_nosync(core->irq);
> > > > > > >     }
> > > > > > > 
> > > > > > > -static int iris_vpu_power_on_controller(struct iris_core *core)
> > > > > > > +int iris_vpu_reset_controller(struct iris_core *core)
> > > > > > 
> > > > > > If these functions are platform-specific, please rename them
> > > > > > accordingly, like iris_vpu2_3_foo() or just iris_vpu2_foo().
> > > > > 
> > > > > They are not, this is the whole point.
> > > > 
> > > > I think they are, you are adding them to the platform-specific ops. In
> > > > the end, they are not applicable to 3.3.
> > > 
> > > Vpu 3.3 is added on the next patch, with specific callbacks
> > > for 3.3, this very patch has no functional change, it still uses
> > > the same "common" reset and controller power off for vpu2 and vpu3.
> > > 
> > > This very patch is a preparation for vpu33, using common helpers
> > > in vpu_ops is already done in the vpu2 support, I simply extend
> > > the same logic here.
> > 
> > I'd really expect that iris_vpu_foo() functions apply to every platform.
> > These functions are now being used for VPU2 and VPU3 only. Thus I assume
> > that they are platform specific and should have platform-specific
> > prefix.
> 
> Thanks for your advice, but I followed the code and naming style of
> the current merged driver, perhaps Dikshita will give some suggestions
> on how the naming should be done in this case.

Agreed.


-- 
With best wishes
Dmitry

