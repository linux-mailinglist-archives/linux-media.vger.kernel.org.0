Return-Path: <linux-media+bounces-21856-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF379D6695
	for <lists+linux-media@lfdr.de>; Sat, 23 Nov 2024 01:05:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D028A281DE5
	for <lists+linux-media@lfdr.de>; Sat, 23 Nov 2024 00:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E4642905;
	Sat, 23 Nov 2024 00:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sdlcZs0x"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8461F817
	for <linux-media@vger.kernel.org>; Sat, 23 Nov 2024 00:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732320331; cv=none; b=EDv0fn7Ei3NgiT0u76MRT5DskXBReK5PZN/UVUyys5A7A82SccA5J9Je8T6bjP+LvQ1TrPCn9XHkLJn/MyKSGlnnAyGB98PjRkfgGTMHrhYa9K+41OvIUWOmjuji4SwEDTZDMDMC/xpULCzRAenWydSTNyrmLad7sp00lh7EsRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732320331; c=relaxed/simple;
	bh=PNHSeXlforkDxsY2mNMKW2WVvL0U3nz3c06akHfRJr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j96EStPEaLbjjikRHLLLv81UDadgc3LjBMOMBdG2FDGhUH9oG28lHd4c7zjkFJ5Oh+UTVLWNfAqhu1xSAAjmJYt+YW0FtOF5fA/OtKFxiyXUcJHxmE7LIsp2mh1oW6pPxKZvqZtXoDvS3DkF9rFmqq/5sYAP9Rp+3iUS+6KET/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sdlcZs0x; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ffb0bbe9c8so3388841fa.0
        for <linux-media@vger.kernel.org>; Fri, 22 Nov 2024 16:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732320328; x=1732925128; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zL3UhjrThpsgNNxTDk0NoRagBCwD04e6B6PC0r7kPGQ=;
        b=sdlcZs0x+r8RaFyLG5ryXmbdChdsP/szmSqWOHQNv7JVPXGWOzXNW3kjRm0h69YV1C
         kP9ehz8NPuh5VQXa63fc8k4z/HmxCCstDuVLwtzeHatsqm8T0bV7SZz12c3IoCNwEb/X
         8tHIJeFBOXcaVgX2yC0R2yNvCzbFOLnXyOBkoPfZFd+UHjCght3shvYkCjmbKFwuKuHi
         E1q3dtozOp5chZMiIvPMueHgmr0FTUul62M0dIhWeA7kxTJBuRZABvYWF28szrWx5RcD
         ZwsPkIna4KBNaf9DEfjRoxLj9yG6aWKCNYFUX5XAxg4w9XYOSUNVxpH2CdvoxLr2BB3H
         2t5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732320328; x=1732925128;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zL3UhjrThpsgNNxTDk0NoRagBCwD04e6B6PC0r7kPGQ=;
        b=N+03Bk6tZLLfPZvieKYZLIynOZeH4za2IparPG3mFYheZuDnNstloPT5k8mNXq1b05
         6DTNbHsucjOGSFFpfa6QR5dnN4QbjV+oL+A1MhBtm0dkkXdjcRsbBaqnwyF9XYFmvqUj
         CVvbxjqfZmV0QYGT6MG4ue708TbNde6JnosUOLilRwcMkaEMBx+23TgQkOpIYx0cs0D8
         IAncnXAkCHgEyF6Wbf4aHRBEd+9rWMZ6yW9xa9s15OcPUt7YC5m4QivXThgH6kBLtqVe
         kqj5QxdDmgM6XBtWAF6z+VNsf4nrXwfXm7dQWG41RSDhk3AgDbcX340eek+z6Xc+4fiM
         15GA==
X-Forwarded-Encrypted: i=1; AJvYcCXPgBV/iPHvhyjjQWz1T0E9ezL/zAn8n3MHTy8fcPeMvrtlgK9PSy+nYW7NUGMGOFpofaTH9l5m3BY1KA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCyZc6Amo+xEM0SW7tR5qvURu+Yh7P09ke1mqJGxiahYhZgrfG
	yJJnIfKtHYXpekw9DBSLEbLXrA0fkA1OxI5vCZfRlFAF9mcifJGVZjAcsg16+WE=
X-Gm-Gg: ASbGncuP7BthpWkFVdYKI4MYorpUauVpE3AT/yW4BRr9zahhZ27HHjqUf2KNW8H0Foo
	uv2t+YBO4sFedgnS4Ic6T/uWOqYLjFLCQGbElWZvXRUCH4Mh3oPlarFRg2AapawFmipi6F8PhuJ
	KKeQW6z8rGspOSCOBVK3iF0uAGoaNvnj5mxEHyJRbYNd7NFuVABbABvCZ1Iqi+h95w9hqRxVqCK
	oNE6EVSVLPhF9M/0KiR0JVZoWxnO4FGjbijMVomu/96vMm3nUEp43NGO2rfgIU9MHZQubS3F97I
	2X6fbTtuYaaVS0VYjkw1g+68LIqSsw==
X-Google-Smtp-Source: AGHT+IFrIlWNZ12pXRHqhllPQ/j/19noAcfeFKC+8zRvZgcIAWZXtC8TQ29m5Ox+QNicJV5oRZkxoQ==
X-Received: by 2002:a05:651c:8d:b0:2ff:a7c1:8c31 with SMTP id 38308e7fff4ca-2ffa7c18cbfmr25759941fa.26.1732320327533;
        Fri, 22 Nov 2024 16:05:27 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffb0d0c4f9sm1170931fa.68.2024.11.22.16.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 16:05:27 -0800 (PST)
Date: Sat, 23 Nov 2024 02:05:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Renjiang Han <quic_renjiang@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
	Vikash Garodia <quic_vgarodia@quicinc.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: qcom: videocc: Use HW_CTRL_TRIGGER flag for
 video GDSC's
Message-ID: <23ho25gl3iwyi2jspb6a2x5bv76fco5pkg2x5ct4gu3c44dbiq@yec6evx5sihm>
References: <20241122-switch_gdsc_mode-v1-0-365f097ecbb0@quicinc.com>
 <20241122-switch_gdsc_mode-v1-1-365f097ecbb0@quicinc.com>
 <zhco37pigrp4fh5alqx4xfxx3xhjitqlgw552vwiijka22bt4u@sl4ngzypwh4x>
 <1d9aa2e7-d402-42dc-baa6-155f01b132ca@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1d9aa2e7-d402-42dc-baa6-155f01b132ca@quicinc.com>

On Fri, Nov 22, 2024 at 10:25:44PM +0530, Taniya Das wrote:
> 
> 
> On 11/22/2024 4:29 PM, Dmitry Baryshkov wrote:
> > On Fri, Nov 22, 2024 at 04:01:45PM +0530, Renjiang Han wrote:
> > > From: Taniya Das <quic_tdas@quicinc.com>
> > > 
> > > The video driver will be using the newly introduced
> > 
> > 'will be' or 'is using'? Or will be using it for these platforms? Is
> > there any kind of dependency between two patches in the series?
> > 
> The video driver will not be able to work without the clock side changes.

Will enabling this flag break the video driver until it is updated?

> 
> > > dev_pm_genpd_set_hwmode() API to switch the video GDSC to HW and SW
> > > control modes at runtime.
> > > Hence use HW_CTRL_TRIGGER flag instead of HW_CTRL for video GDSC's for
> > > Qualcomm SoC SC7180 and SDM845.
> > 
> > Is it applicable to any other platforms? Why did you select just these
> > two?
> > 
> 
> The V6 version of Video driver is already using them, now the video driver
> wants to migrate to v4 version of the HW to use the new flag.

I mean slightly different issue. We have following drivers:

videocc-sa8775p.c - already uses HW_CTRL_TRIGGER
videocc-sc7180.c - being converted now
videocc-sc7280.c - already uses HW_CTRL_TRIGGER
videocc-sdm845.c - being converted now
videocc-sm7150.c
videocc-sm8150.c
videocc-sm8250.c - already uses HW_CTRL_TRIGGER
videocc-sm8350.c - already uses HW_CTRL_TRIGGER
videocc-sm8450.c
videocc-sm8550.c - already uses HW_CTRL_TRIGGER

This leaves sm7150, sm8150 and sm8450 untouched. Don't they also need to
use HW_CTRL_TRIGGER?

> 
> > > 
> > > Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> > > Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> > > ---
> > >   drivers/clk/qcom/videocc-sc7180.c | 2 +-
> > >   drivers/clk/qcom/videocc-sdm845.c | 4 ++--
> > >   2 files changed, 3 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/clk/qcom/videocc-sc7180.c b/drivers/clk/qcom/videocc-sc7180.c
> > > index d7f84548039699ce6fdd7c0f6675c168d5eaf4c1..dd2441d6aa83bd7cff17deeb42f5d011c1e9b134 100644
> > > --- a/drivers/clk/qcom/videocc-sc7180.c
> > > +++ b/drivers/clk/qcom/videocc-sc7180.c
> > > @@ -166,7 +166,7 @@ static struct gdsc vcodec0_gdsc = {
> > >   	.pd = {
> > >   		.name = "vcodec0_gdsc",
> > >   	},
> > > -	.flags = HW_CTRL,
> > > +	.flags = HW_CTRL_TRIGGER,
> > >   	.pwrsts = PWRSTS_OFF_ON,
> > >   };
> > > diff --git a/drivers/clk/qcom/videocc-sdm845.c b/drivers/clk/qcom/videocc-sdm845.c
> > > index f77a0777947773dc8902c92098acff71b9b8f10f..6dedc80a8b3e18eca82c08a5bcd7e1fdc374d4b5 100644
> > > --- a/drivers/clk/qcom/videocc-sdm845.c
> > > +++ b/drivers/clk/qcom/videocc-sdm845.c
> > > @@ -260,7 +260,7 @@ static struct gdsc vcodec0_gdsc = {
> > >   	},
> > >   	.cxcs = (unsigned int []){ 0x890, 0x930 },
> > >   	.cxc_count = 2,
> > > -	.flags = HW_CTRL | POLL_CFG_GDSCR,
> > > +	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR,
> > >   	.pwrsts = PWRSTS_OFF_ON,
> > >   };
> > > @@ -271,7 +271,7 @@ static struct gdsc vcodec1_gdsc = {
> > >   	},
> > >   	.cxcs = (unsigned int []){ 0x8d0, 0x950 },
> > >   	.cxc_count = 2,
> > > -	.flags = HW_CTRL | POLL_CFG_GDSCR,
> > > +	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR,
> > >   	.pwrsts = PWRSTS_OFF_ON,
> > >   };
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> 
> -- 
> Thanks & Regards,
> Taniya Das.

-- 
With best wishes
Dmitry

