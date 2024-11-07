Return-Path: <linux-media+bounces-21061-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE8B9C082E
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 14:54:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F1F61F235BB
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 13:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78B7721263C;
	Thu,  7 Nov 2024 13:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X8sXirSQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9F82076A5
	for <linux-media@vger.kernel.org>; Thu,  7 Nov 2024 13:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730987665; cv=none; b=T09B0REecm0Hi7kjCa2LIn89QS7rfJ7LXMKqzFwOYKpyUlXDuq4CVYtWb5agiDamK0muMwK4J2uQ0HJh8yNwbXlT8TKbEo8cAHX2Rvb1TNnv4JvPaUqoVSTN/a7an9TBZMHxc5081yPNdKMANozzP6E6yeKxs6joEswL6BXq/E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730987665; c=relaxed/simple;
	bh=WDtG+Uw/Tg4d2g2YL62aFl4cx3NGv/7L5FNFJllSVOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=suk39g9bETAFXyVwQCsJKosxHntmNHKJHRhhwEWjBZuo2S51u3QxkMCqF0R5sfmtDQgjyuEqyiPhhBKUbxT8Wr7OM3vSvImbnAC2P4Yb9n4QSRj1K7dVwGESdsopSiNeLpvGUBa/ADjxNG9E3n7XZjuSMqw0sKw40E0g9PUePjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X8sXirSQ; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fb49510250so9461281fa.0
        for <linux-media@vger.kernel.org>; Thu, 07 Nov 2024 05:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730987662; x=1731592462; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dqkLHRwMfOuIIkMo8bsDyfGocgP/YAuYLDUWFqFkeAw=;
        b=X8sXirSQo2oTuAsGtR5rX61px1ff3/lTnMGMSQzY5ISopfjjUjKDY3bl4v+gp4m2yc
         450sBY4QMnjYw1xI67LxGpxzTUwYVwG0Lro4ouqUiPIBjoqPbs3/RD7jkbtYFklRzzgU
         pNyKw7XKI3FFTQ6yKvKFtAPypmCeqUC6BVBlJ5YFFesF4XMsmVAHuS7FNptaCPQE/Q3A
         xtSQ1CoLEcsQI12sxBzSMCInnFHsVZmRePkafvvEhtYUZEh8aYasEklkASEsjCfpdijj
         Jc6V/9HRJGNgrmD8ymhNi6a35XuZebwwvRalBbibvaa5W1zPvqrifmiKvm9KyyR53X4B
         MVlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730987662; x=1731592462;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dqkLHRwMfOuIIkMo8bsDyfGocgP/YAuYLDUWFqFkeAw=;
        b=fsScxRwwpFRIv0J1MWdnoDkD8QAFwh3er1a2a5rFkXNdsMT44XQ6QRkbnDEYYYaS/6
         THtdS5079y5/PODp3tKgAvjtdgwZ6gICSwwEqbrEOBIYc8dqDxLapG+k5ubIFpObuCU2
         1g0KN+b3moUcuWkDvjlSrgdcJuW81qfsKD3b+Lz+in54z9pB7ymaswYb1c4LPdzTFYQ1
         qNgTubrgrCja4OeHX6iFZH24sqfVOMLEdSL842+uo3zShq2KxQFilfUWe/TlULCs+4BV
         Ti0I5LfNlR5Eov0r7vokMEZZtbdcvyxS5hGbVLRnh+KyOYeYgBiOi2EPyDhT9y8jQA7z
         /vZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUArTfMoEPSSLrMQVdcUkthflJaom3HUBHtzpLNw1+Jbu1Fb1MxTma9KoX5rG7mvAO4a+QT+8RtLZn9rQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2dJjCt6OOtYIgNL4e+q0N744bd+VygTtLGslb6ifnCW8CVGwm
	n92d3dLmnODSEuPL22VQUbHKtuUX9RZEN5Kwpu22HcZtKkydulJuBn8pBIIjEy0=
X-Google-Smtp-Source: AGHT+IGwbjFXniYs7nPBr8auQ3EmU4tHkPv1GfD8lppp7jc/jPpCTXpLOWeSs8Y7Krc+M9SzIGJVuQ==
X-Received: by 2002:a2e:b887:0:b0:2fb:6277:71d0 with SMTP id 38308e7fff4ca-2ff1e8d9203mr306091fa.22.1730987662216;
        Thu, 07 Nov 2024 05:54:22 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff178df94bsm2256731fa.8.2024.11.07.05.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 05:54:20 -0800 (PST)
Date: Thu, 7 Nov 2024 15:54:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH 1/4] media: venus: hfi_parser: add check to avoid out of
 bound access
Message-ID: <oxbpd3tfemwci6aiv5gs6rleg6lmsuabvvccqibbqddczjklpi@aln6hfloqizo>
References: <20241105-venus_oob-v1-0-8d4feedfe2bb@quicinc.com>
 <20241105-venus_oob-v1-1-8d4feedfe2bb@quicinc.com>
 <b2yvyaycylsxo2bmynlrqp3pzhge2tjvtvzhmpvon2lzyx3bb4@747g3erapcro>
 <81d6a054-e02a-7c98-0479-0e17076fabd7@quicinc.com>
 <ndlf4bsijb723cctkvd7hkwmo7plbzr3q2dhqc3tpyujbfcr3z@g4rvg5p7vhfs>
 <975f4ecd-2029-469a-8ecf-fbd6397547d4@linaro.org>
 <57544d01-a7c6-1ea6-d408-ffe1678e0b5e@quicinc.com>
 <ql6hftuo7udkqachofws6lcpwx7sbjakonoehm7zsh43kqndsf@rwmiwqngldn2>
 <781ea2fd-637f-b896-aad4-d70f43ad245c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <781ea2fd-637f-b896-aad4-d70f43ad245c@quicinc.com>

On Thu, Nov 07, 2024 at 07:05:15PM +0530, Vikash Garodia wrote:
> 
> On 11/7/2024 6:52 PM, Dmitry Baryshkov wrote:
> > On Thu, Nov 07, 2024 at 06:32:33PM +0530, Vikash Garodia wrote:
> >>
> >> On 11/7/2024 5:37 PM, Bryan O'Donoghue wrote:
> >>> On 07/11/2024 10:41, Dmitry Baryshkov wrote:
> >>>>> init_codecs() parses the payload received from firmware and . I don't think we
> >>>>> can control this part when we have something like this from a malicious firmware
> >>>>> payload
> >>>>> HFI_PROPERTY_PARAM_CODEC_SUPPORTED
> >>>>> HFI_PROPERTY_PARAM_CODEC_SUPPORTED
> >>>>> HFI_PROPERTY_PARAM_CODEC_SUPPORTED
> >>>>> ...
> >>>>> Limiting it to second iteration would restrict the functionality when property
> >>>>> HFI_PROPERTY_PARAM_CODEC_SUPPORTED is sent for supported number of codecs.
> >>>> If you can have a malicious firmware (which is owned and signed by
> >>>> Qualcomm / OEM), then you have to be careful and skip duplicates. So
> >>>> instead of just adding new cap to core->caps, you have to go through
> >>>> that array, check that you are not adding a duplicate (and report a
> >>>> [Firmware Bug] for duplicates), check that there is an empty slot, etc.
> >>>>
> >>>> Just ignoring the "extra" entries is not enough.
> >> Thinking of something like this
> >>
> >> for_each_set_bit(bit, &core->dec_codecs, MAX_CODEC_NUM) {
> >>     if (core->codecs_count >= MAX_CODEC_NUM)
> >>         return;
> >>     cap = &caps[core->codecs_count++];
> >>     if (cap->codec == BIT(bit)) --> each code would have unique bitfield
> >>         return;
> > 
> > This won't work and it's pretty obvious why.
> Could you please elaborate what would break in above logic ?

After the "cap=&caps[core->codecs_count++]" line 'cap' will point to the
new entry, which should not contain valid data.

Instead, when processing new 'bit' you should loop over the existing
caps and check that there is no match. And only if there is no match
the code should be allocating new entry, checking that codecs_count
doesn't overflow, etc.

> 
> > 
> >>> +1
> >>>
> >>> This is a more rational argument. If you get a second message, you should surely
> >>> reinit the whole array i.e. update the array with the new list, as opposed to
> >>> throwing away the second message because it over-indexes your local storage..
> >> That would be incorrect to overwrite the array with new list, whenever new
> >> payload is received.
> > 
> > I'd say, don't overwrite the array. Instead the driver should extend it
> > with the new information.
> That is exactly the existing patch is currently doing.

_new_ information, not a copy of the existing information.

> 
> Regards,
> Vikash
> > 
> >>
> >> Regards,
> >> Vikash
> > 

-- 
With best wishes
Dmitry

