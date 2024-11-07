Return-Path: <linux-media+bounces-21044-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6602B9C02A0
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 11:41:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1AD681F22052
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 10:41:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 534781F12F9;
	Thu,  7 Nov 2024 10:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IlvFFYB4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E506E1EE026
	for <linux-media@vger.kernel.org>; Thu,  7 Nov 2024 10:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730976098; cv=none; b=bl3H/JwCiYznteGKNeOzQQL83UgU/QTLo+YUj88owNJvbifRMSYLFouV/j6aN88WZP/44yqXdScpbgMbHHnA/5uTBBUTcsvmYXobZWn7ufMf2eLYCJKM9CzYoy/PvUWzFN/XL2ToxzuXb9Qg5IGpry7pHoxmWGPvWCzmnZCQq1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730976098; c=relaxed/simple;
	bh=QECnrlhEo0g/m1ZDdYxK8RSdXfVd21AqjJ11RgZfD6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZtW6VHkpcMdjjy6ZMInlbOGReGnFH7vpT5SNNs6gk2KZfwRyzzjLtJxlHKWDCCVtNlsp31JOZ7hpM2a0VhvuBw6m9Ex66l8EYFvRnXBwP9GU1w1tEpt4kQqBR0dvqIsC0mhyLBOEZR+kjL32XxUBNpY9/B1FFa9q+53m14xlK/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IlvFFYB4; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539e59dadebso772590e87.0
        for <linux-media@vger.kernel.org>; Thu, 07 Nov 2024 02:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730976095; x=1731580895; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c7KReAliAf79+AjubgGO0WiomDZK/ncBq6RlPdn2qVc=;
        b=IlvFFYB49y6VNInybnGaOPx84uOlTk3+Xg1bYTCYfKLpalWs0UwBUPhY1rc3pd1sme
         KwXK5u6m8BED+hK+96WpA/qVIroNtTdnNsxW/UTaH57J5kesQNA5iHaWtbanRzhf+j6F
         y2gsC9j5cHkvF4dsOsfZ2iBgokvXs0huRCSQY7DaLglyHAOrmD07QOGqXWbDXdvH3Hke
         XtfdWnkNxHFwYHdIll+Fu5SfM+3t8UCgvxUBUyTc6h1PXGmF0OYr8OZASDgADuupkqcV
         iLSm2j37zx5baE4i8YVQsEO4dzAYvZ8GeIso18O82FhjZGCr1lqJR4b3q415eITIpmH2
         H2Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730976095; x=1731580895;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c7KReAliAf79+AjubgGO0WiomDZK/ncBq6RlPdn2qVc=;
        b=bggYrU+Io/5ZoWhYRtUFl64zzZngLEDt4slGwugapAGcZhwKl7er5Qw3MFCG6Gps3m
         Nr7vq7eJwXj+e4Mfe76gSK5iJuiq2UUrmhHQyazHW2AizkeVf6BqBh3dZY9t1AC5xPM/
         CdU+Szh+mqGdcNvrcs8WdzM4Di8zL7x1a+9hIqyzmoM7kWN69eiihEOq489hZfE34OQu
         Pdh85LJJknOWx76bxT6CRCW/FnTjpHP5pvDK7YJSfn5lleJUbP1W+O1JVPBKBowsJiQt
         1cNqbe+ikgWRSrgDT7g7fVQ4JzXq2G9mwvmO73BKm8A+QbA+XIItGUYbtKURkVHk53t/
         i54w==
X-Forwarded-Encrypted: i=1; AJvYcCU4sdPp2DIrp8lko0L2ps6paDuFVr78XrvmhI4ZCqVbv1SQ+I14k5RNLlnPges7QWZWkwVedzE91KgsQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSvpeOJNOFrbJPUKxXM996hM+w5BkFulE4bTkKlcnI5I/6lJgo
	0jE0SD6scmpsSGli5ngOGVdNz1PpN0DaiNM/6kzCfPCSrFZqe2lITSbRoIh+6Xo=
X-Google-Smtp-Source: AGHT+IF1JKbTSQOAWtXN3cGHaoKEwR23LSRff0Im78vByO1IMeLg4BpL/UDHVls5wpBlL0/+UBeZRw==
X-Received: by 2002:a05:6512:660f:b0:53c:74de:3cd2 with SMTP id 2adb3069b0e04-53c74de3e61mr10768915e87.18.1730976095149;
        Thu, 07 Nov 2024 02:41:35 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826a72f2sm161858e87.145.2024.11.07.02.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 02:41:33 -0800 (PST)
Date: Thu, 7 Nov 2024 12:41:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH 1/4] media: venus: hfi_parser: add check to avoid out of
 bound access
Message-ID: <ndlf4bsijb723cctkvd7hkwmo7plbzr3q2dhqc3tpyujbfcr3z@g4rvg5p7vhfs>
References: <20241105-venus_oob-v1-0-8d4feedfe2bb@quicinc.com>
 <20241105-venus_oob-v1-1-8d4feedfe2bb@quicinc.com>
 <b2yvyaycylsxo2bmynlrqp3pzhge2tjvtvzhmpvon2lzyx3bb4@747g3erapcro>
 <81d6a054-e02a-7c98-0479-0e17076fabd7@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81d6a054-e02a-7c98-0479-0e17076fabd7@quicinc.com>

On Thu, Nov 07, 2024 at 01:47:20PM +0530, Vikash Garodia wrote:
> 
> On 11/5/2024 7:25 PM, Dmitry Baryshkov wrote:
> > On Tue, Nov 05, 2024 at 02:24:54PM +0530, Vikash Garodia wrote:
> >> There is a possibility that init_codecs is invoked multiple times during
> >> manipulated payload from video firmware. In such case, if codecs_count
> >> can get incremented to value more than MAX_CODEC_NUM, there can be OOB
> >> access. Keep a check for max accessible memory before accessing it.
> > 
> > No. Please make sure that init_codecs() does a correct thing, so that
> > core->codecs_count isn't incremented that much (or even better that
> > init_codecs() doesn't do anything if it is executed second time).
> init_codecs() parses the payload received from firmware and . I don't think we
> can control this part when we have something like this from a malicious firmware
> payload
> HFI_PROPERTY_PARAM_CODEC_SUPPORTED
> HFI_PROPERTY_PARAM_CODEC_SUPPORTED
> HFI_PROPERTY_PARAM_CODEC_SUPPORTED
> ...
> Limiting it to second iteration would restrict the functionality when property
> HFI_PROPERTY_PARAM_CODEC_SUPPORTED is sent for supported number of codecs.

If you can have a malicious firmware (which is owned and signed by
Qualcomm / OEM), then you have to be careful and skip duplicates. So
instead of just adding new cap to core->caps, you have to go through
that array, check that you are not adding a duplicate (and report a
[Firmware Bug] for duplicates), check that there is an empty slot, etc.

Just ignoring the "extra" entries is not enough.

> 
> Regards,
> Vikash
> >>
> >> Cc: stable@vger.kernel.org
> >> Fixes: 1a73374a04e5 ("media: venus: hfi_parser: add common capability parser")
> >> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> >> ---
> >>  drivers/media/platform/qcom/venus/hfi_parser.c | 4 ++++
> >>  1 file changed, 4 insertions(+)
> >>
> >> diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
> >> index 3df241dc3a118bcdeb2c28a6ffdb907b644d5653..27d0172294d5154f4839e8cef172f9a619dfa305 100644
> >> --- a/drivers/media/platform/qcom/venus/hfi_parser.c
> >> +++ b/drivers/media/platform/qcom/venus/hfi_parser.c
> >> @@ -23,6 +23,8 @@ static void init_codecs(struct venus_core *core)
> >>  		return;
> >>  
> >>  	for_each_set_bit(bit, &core->dec_codecs, MAX_CODEC_NUM) {
> >> +		if (core->codecs_count >= MAX_CODEC_NUM)
> >> +			return;
> >>  		cap = &caps[core->codecs_count++];
> >>  		cap->codec = BIT(bit);
> >>  		cap->domain = VIDC_SESSION_TYPE_DEC;
> >> @@ -30,6 +32,8 @@ static void init_codecs(struct venus_core *core)
> >>  	}
> >>  
> >>  	for_each_set_bit(bit, &core->enc_codecs, MAX_CODEC_NUM) {
> >> +		if (core->codecs_count >= MAX_CODEC_NUM)
> >> +			return;
> >>  		cap = &caps[core->codecs_count++];
> >>  		cap->codec = BIT(bit);
> >>  		cap->domain = VIDC_SESSION_TYPE_ENC;
> >>
> >> -- 
> >> 2.34.1
> >>
> > 

-- 
With best wishes
Dmitry

