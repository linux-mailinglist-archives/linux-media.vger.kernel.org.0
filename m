Return-Path: <linux-media+bounces-26974-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BE4A449EA
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 19:15:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D3893BFF0A
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 18:06:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E76AA19E98B;
	Tue, 25 Feb 2025 18:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WO7iCP4X"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E9919C554
	for <linux-media@vger.kernel.org>; Tue, 25 Feb 2025 18:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740506810; cv=none; b=F+OEtgZewDQyJDJ/hpWeoFdDRSK7Sgmcp5A9bDihYlDDVZdMXs5VP/UMRnTXNhMuGtyQxqjRJAvUcoPzNsLFcdK66IWQmm4gHjvkyv+8aL5YjCxk604AneTlsmurs+qTAlEGoqhXe8Ur7sDkYVNVtwJ7ai1KulL5ACILv2bQkG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740506810; c=relaxed/simple;
	bh=4v0tqcOFwjmcLPpSug39OWWVlUv5nOP55AKdOd+8Mn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N5B7I6zq168YwdXTHI1Jfq9UtakkFsNEIGiEf3oGQxKYy9Znvl9sEJt/5QpgLHonPN0XgCt321oyQv1opDt44EIdoCXcDybWGLWCkRS/lp4pe2RmR2yVS4BOqwH6OEFdF+DbxfDso1mnyqFUmdJfrAx21epK67aL9vfrS3E0dkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WO7iCP4X; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54843052bcdso3119916e87.1
        for <linux-media@vger.kernel.org>; Tue, 25 Feb 2025 10:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740506806; x=1741111606; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=liHjdtQWk9Ug7883/cTC3d+H3muBAx5KFW4f/OQ4sjw=;
        b=WO7iCP4XNQj+Ux4luyHdKNSTYhDhDb3tozg9fgcXLmW91iekLOWltCw+2S21G79TDC
         cLHnlXBq1h+g8CZlohAYqWAF4qJ/PdTOcfYwzU1JaoJr4BU33vDj/PCrnD8UHxXffA2A
         +EHd/lacDKPArno6mIsQZb4fUN9p8KZPHmJFNHoRrnizUaj0AQu02pkBNY1l/ULxfU7h
         gvuw7zSh0PVRoAtcndMn4AFg/1VZTZSaEwCrym2ogvm8WicuJm7UrUduHv62N5ivuXET
         h2yAL05xZ5fqohXH8w6EIikVRTfYjQocsFZYqCl3zSoiJe/mPOyM3z1wPTGTdj8dowYu
         zyvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740506806; x=1741111606;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=liHjdtQWk9Ug7883/cTC3d+H3muBAx5KFW4f/OQ4sjw=;
        b=ebIZmVYB6HukxxcMiFmpSHoMmQEsh7GC7Yoa+WWBqYDRCNUR2XsbMuuYwB08JlxsEB
         sMp/sNKAGHnO+bqaHkPt65UFjZU8kM0LNosVdPDkRmzjkrsW4owf5FQfvAqLAR2Pa/cT
         iEkgpkVBZymMZuv022FuzzhiVTM/Hao/0ow0V0ednqXa+5cQ/V3839stt5wgqL5/xNci
         g0CMwGdX0hyq2bRhnTWZAOYC59NVwKJ3nCO/4yHQrUxnjV8pNz92MhQ4ndewMU9vZJYv
         xL54JgF3sZfnfmMeX8QMlqfTMN2TUTHgj1MYkx8h3miPF3sdS5syARM833RdfzNhT9MG
         hbIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXD69DlwKRN/q/jYe7NK+0Fh1AOFb4SOZWgN8JPeYCEkJtv12zw+GrvyBTN0FLUljERzIVii/O4ApIXzg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7PJSALFGlWAYPHnR5KqWWtRe5R4/0c20CQYaN+7v+x2l88tAP
	bMwDTonhTpo0YSYgYGPJBWVpkgW8q5SNjVC7mibNX9xycBnttsUO5qAvpvzMNgM=
X-Gm-Gg: ASbGnctKzSYDvzNs8LSzs26UBRrGDs4oAs6ZaoITcwObG4Vc9AvyQAHXGQ/IGwSQGPq
	FPmVU3zYw+Ok5vbpXOeu8/+1EwsdCoq6qAoekx0PapSax20yJNK+SSxkPKM8L8ZBtrq7rBrbP5u
	XlDXIlHeWCmF5LVyi8SJ3Z+QcpfdbsJcAyyAC2GiHmpjmZ1RSN6OJtuQ4GUQ1A9fibKX2RQw49Z
	WRSKw2Zfw1fV53CrHsAH8453BW/jyGj7QMG1Z0XGIytGf3rsM9LWxh7x+2h5J7NAsMM543W7TJg
	DhYwVmMqWu5e6+p/8Ix0urU1Ie8vphYFc0OMm8wA0OozO3N3Bfcg1Tc9VTphZ+tbpgRQhW2OGDu
	oC+ssIA==
X-Google-Smtp-Source: AGHT+IFG9vK9LeGy0ABgeQe3Sg97nV2oZD6uSHV6RIbDsB3ZEJgPHJfYrBz7BblqAeiQNBHuC32YWA==
X-Received: by 2002:a05:6512:b1d:b0:545:1d04:5dfc with SMTP id 2adb3069b0e04-548510ed0b9mr1899807e87.38.1740506806157;
        Tue, 25 Feb 2025 10:06:46 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514efd8esm236035e87.158.2025.02.25.10.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 10:06:45 -0800 (PST)
Date: Tue, 25 Feb 2025 20:06:44 +0200
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
Message-ID: <5mnho424mrrj2fwrtbdzjtkgvhlmoxcy5ba2rjjn4hvrgbmco7@7q6ezfbgi6m4>
References: <20250225-topic-sm8x50-iris-v10-v1-0-128ef05d9665@linaro.org>
 <20250225-topic-sm8x50-iris-v10-v1-2-128ef05d9665@linaro.org>
 <ityd34gfiyt6fvyuopnh3bi3edc5t2ubop4i72d54xyhhz3ixf@n6rnt5mwgw4b>
 <48f339f5-09f8-4498-83f2-4e2d773c3e23@linaro.org>
 <CAA8EJppFCF9Mf_LXr4EMV94rVw9qHJQFKtfXwuqTmtHQA=2gnA@mail.gmail.com>
 <fe25be80-9b5a-436f-9f50-7adf059d8726@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe25be80-9b5a-436f-9f50-7adf059d8726@linaro.org>

On Tue, Feb 25, 2025 at 06:55:58PM +0100, neil.armstrong@linaro.org wrote:
> On 25/02/2025 11:41, Dmitry Baryshkov wrote:
> > On Tue, 25 Feb 2025 at 12:04, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> > > 
> > > On 25/02/2025 11:02, Dmitry Baryshkov wrote:
> > > > On Tue, Feb 25, 2025 at 10:05:10AM +0100, Neil Armstrong wrote:
> > > > > In order to support the SM8650 iris33 hardware, we need to provide specific
> > > > > reset and constoller power off sequences via the vpu_ops callbacks.
> > > > > 
> > > > > Add those callbacks, and use the current helpers for currently supported
> > > > > platforms.
> > > > > 
> > > > > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > > > > ---
> > > > >    drivers/media/platform/qcom/iris/iris_vpu2.c       |  2 ++
> > > > >    drivers/media/platform/qcom/iris/iris_vpu3.c       |  2 ++
> > > > >    drivers/media/platform/qcom/iris/iris_vpu_common.c | 14 ++++++++++----
> > > > >    drivers/media/platform/qcom/iris/iris_vpu_common.h |  4 ++++
> > > > >    4 files changed, 18 insertions(+), 4 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/media/platform/qcom/iris/iris_vpu2.c
> > > > > index 8f502aed43ce2fa6a272a2ce14ff1ca54d3e63a2..093e2068ec35e902f6c7bb3a487a679f9eada39a 100644
> > > > > --- a/drivers/media/platform/qcom/iris/iris_vpu2.c
> > > > > +++ b/drivers/media/platform/qcom/iris/iris_vpu2.c
> > > > > @@ -33,6 +33,8 @@ static u64 iris_vpu2_calc_freq(struct iris_inst *inst, size_t data_size)
> > > > >    }
> > > > > 
> > > > >    const struct vpu_ops iris_vpu2_ops = {
> > > > > +    .reset_controller = iris_vpu_reset_controller,
> > > > >       .power_off_hw = iris_vpu_power_off_hw,
> > > > > +    .power_off_controller = iris_vpu_power_off_controller,
> > > > >       .calc_freq = iris_vpu2_calc_freq,
> > > > >    };
> > > > > diff --git a/drivers/media/platform/qcom/iris/iris_vpu3.c b/drivers/media/platform/qcom/iris/iris_vpu3.c
> > > > > index b484638e6105a69319232f667ee7ae95e3853698..95f362633c95b101ecfda6480c4c0b73416bd00c 100644
> > > > > --- a/drivers/media/platform/qcom/iris/iris_vpu3.c
> > > > > +++ b/drivers/media/platform/qcom/iris/iris_vpu3.c
> > > > > @@ -117,6 +117,8 @@ static u64 iris_vpu3_calculate_frequency(struct iris_inst *inst, size_t data_siz
> > > > >    }
> > > > > 
> > > > >    const struct vpu_ops iris_vpu3_ops = {
> > > > > +    .reset_controller = iris_vpu_reset_controller,
> > > > >       .power_off_hw = iris_vpu3_power_off_hardware,
> > > > > +    .power_off_controller = iris_vpu_power_off_controller,
> > > > >       .calc_freq = iris_vpu3_calculate_frequency,
> > > > >    };
> > > > > diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> > > > > index fe9896d66848cdcd8c67bd45bbf3b6ce4a01ab10..ec8b10d836d0993bcd722a2bafbb577b85f41fc9 100644
> > > > > --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> > > > > +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> > > > > @@ -211,7 +211,7 @@ int iris_vpu_prepare_pc(struct iris_core *core)
> > > > >       return -EAGAIN;
> > > > >    }
> > > > > 
> > > > > -static int iris_vpu_power_off_controller(struct iris_core *core)
> > > > > +int iris_vpu_power_off_controller(struct iris_core *core)
> > > > >    {
> > > > >       u32 val = 0;
> > > > >       int ret;
> > > > > @@ -264,23 +264,29 @@ void iris_vpu_power_off(struct iris_core *core)
> > > > >    {
> > > > >       dev_pm_opp_set_rate(core->dev, 0);
> > > > >       core->iris_platform_data->vpu_ops->power_off_hw(core);
> > > > > -    iris_vpu_power_off_controller(core);
> > > > > +    core->iris_platform_data->vpu_ops->power_off_controller(core);
> > > > >       iris_unset_icc_bw(core);
> > > > > 
> > > > >       if (!iris_vpu_watchdog(core, core->intr_status))
> > > > >               disable_irq_nosync(core->irq);
> > > > >    }
> > > > > 
> > > > > -static int iris_vpu_power_on_controller(struct iris_core *core)
> > > > > +int iris_vpu_reset_controller(struct iris_core *core)
> > > > 
> > > > If these functions are platform-specific, please rename them
> > > > accordingly, like iris_vpu2_3_foo() or just iris_vpu2_foo().
> > > 
> > > They are not, this is the whole point.
> > 
> > I think they are, you are adding them to the platform-specific ops. In
> > the end, they are not applicable to 3.3.
> 
> Vpu 3.3 is added on the next patch, with specific callbacks
> for 3.3, this very patch has no functional change, it still uses
> the same "common" reset and controller power off for vpu2 and vpu3.
> 
> This very patch is a preparation for vpu33, using common helpers
> in vpu_ops is already done in the vpu2 support, I simply extend
> the same logic here.

I'd really expect that iris_vpu_foo() functions apply to every platform.
These functions are now being used for VPU2 and VPU3 only. Thus I assume
that they are platform specific and should have platform-specific
prefix.

> 
> Neil
> 
> > 
> > > 
> > > Neil
> > > 
> > > > 
> > > > >    {
> > > > >       u32 rst_tbl_size = core->iris_platform_data->clk_rst_tbl_size;
> > > > > +
> > > > > +    return reset_control_bulk_reset(rst_tbl_size, core->resets);
> > > > > +}
> > > > > +
> > > > > +static int iris_vpu_power_on_controller(struct iris_core *core)
> > > > > +{
> > > > >       int ret;
> > > > > 
> > > > >       ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
> > > > >       if (ret)
> > > > >               return ret;
> > > > > 
> > > > > -    ret = reset_control_bulk_reset(rst_tbl_size, core->resets);
> > > > > +    ret = core->iris_platform_data->vpu_ops->reset_controller(core);
> > > > >       if (ret)
> > > > >               goto err_disable_power;
> > > > > 
> > > > > diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
> > > > > index 63fa1fa5a4989e48aebdb6c7619c140000c0b44c..c948d8b5aee87ccf1fd53c5518a27294232d8fb8 100644
> > > > > --- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
> > > > > +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
> > > > > @@ -12,7 +12,9 @@ extern const struct vpu_ops iris_vpu2_ops;
> > > > >    extern const struct vpu_ops iris_vpu3_ops;
> > > > > 
> > > > >    struct vpu_ops {
> > > > > +    int (*reset_controller)(struct iris_core *core);
> > > > >       void (*power_off_hw)(struct iris_core *core);
> > > > > +    int (*power_off_controller)(struct iris_core *core);
> > > > >       u64 (*calc_freq)(struct iris_inst *inst, size_t data_size);
> > > > >    };
> > > > > 
> > > > > @@ -21,7 +23,9 @@ void iris_vpu_raise_interrupt(struct iris_core *core);
> > > > >    void iris_vpu_clear_interrupt(struct iris_core *core);
> > > > >    int iris_vpu_watchdog(struct iris_core *core, u32 intr_status);
> > > > >    int iris_vpu_prepare_pc(struct iris_core *core);
> > > > > +int iris_vpu_reset_controller(struct iris_core *core);
> > > > >    int iris_vpu_power_on(struct iris_core *core);
> > > > > +int iris_vpu_power_off_controller(struct iris_core *core);
> > > > >    void iris_vpu_power_off_hw(struct iris_core *core);
> > > > >    void iris_vpu_power_off(struct iris_core *core);
> > > > > 
> > > > > 
> > > > > --
> > > > > 2.34.1
> > > > > 
> > > > 
> > > 
> > 
> > 
> 

-- 
With best wishes
Dmitry

