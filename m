Return-Path: <linux-media+bounces-27820-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A77D8A5642F
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 10:45:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4AEC37A7251
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 09:44:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02D6420C479;
	Fri,  7 Mar 2025 09:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VM/8RCV+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8B41FFC47
	for <linux-media@vger.kernel.org>; Fri,  7 Mar 2025 09:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741340719; cv=none; b=ZYAyI5ASQxRfVy4qw6lcz3hQqpDiXfd5vrmppm+p8Xyyp+5CxsouB3r9h8hp4ool/OW7JlPMnyGo2G1rHn1valeBCMVDztJ8zblPTil6PdncRw7PklA3OExvlbVauufBt9hYBrPqbL63Cp2VKC4hnk5o1Labsw/k0AmnpjhsHKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741340719; c=relaxed/simple;
	bh=LgETdORplFuf5k5ZwoeGPwHsLIExzbInj1MLRN3nQ3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EYEWanUidGAf9GVq18pSOJmEwDlNNPGElLM1rBkBrnK12NBwm+F/TDYKY7gwyzTMqGsYOkixbHLGAuctoYh4mry0hmb7FRl6M3t2FT9/0P4mcOYtNeuQPJonDgzxm+repe1THcCRYAsSoMG378r0AnWZethL92Foz4eOVo5TR6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VM/8RCV+; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-438a39e659cso9163345e9.2
        for <linux-media@vger.kernel.org>; Fri, 07 Mar 2025 01:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741340715; x=1741945515; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HRkqGPwhP//aPW7BEk/ysV2uJJntAYyCBQb2J1lFSM0=;
        b=VM/8RCV+Zw3rtZq0fxE1EJ/m14wLlwh1mC+phWW/UBVCBBU2FPm8xHHEqvJoQdwmV7
         HDpzxg1ljuKSRXTDU3S6KI8knJBk0Op1kggdCXX6FRS4UcOnSbFuXeooULbTp2Ny2fnk
         VbxEm+8ULBUxAwMLyqRlSUxfeUPBjglKp0DRdPN1+Aot6WgJF2P7mi90Wg3D0Pr3rhXt
         zK0h3lwLvY8Dc3McETNHIXD/zBFD9VZb09CBrU3nbLNfc9uPya7ZgBfr5GykX3PKzaAG
         ZLEKJPf37GxFB4nkV3520dwpjCMSB7iuHKsgnZrOaP7aoWRV9NgrzyYOK/zPrNBF/AKr
         atuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741340715; x=1741945515;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HRkqGPwhP//aPW7BEk/ysV2uJJntAYyCBQb2J1lFSM0=;
        b=GdnXfwhuw1HNY+I0zsFY5m+AlvLGkpwu2JQzNQPIP/Fm3SzugkNE/HWadtzBYPFnk5
         QXmfj2DL+nidMyKioqwH0xe7lc76GHI5SxhwfzdtyGV8ZPmgJSdQph3FppFyZAQTdeym
         jKCWmlI5x1970TIKp4TY0vfUCTUgRLxYC4PG6itXG3M2PQ3hXY/lyRzkiTlGCy+bknd2
         eiyK5XNXKduEM7TfgMadNMCqNOIqCg5L4UW2+3ia1ox1+Wh3Pwa7MLXaqO4PffNw639z
         ozEzZABiLXmWylvWsWEugOpwfCFX7cMTbWVfd91yQ96KafK7vf6xpoYFraEPwqDswPnr
         XFUg==
X-Forwarded-Encrypted: i=1; AJvYcCW7WaDp1dYKlG1T5Po4jbxuqQZ+KX+qtv9wM2A6JV6GtBNkxsFD1PngeBkw3MEVHckYvWEOn/0T9nHh+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlZpo1qbyL+9BjbH5RgY0qruqxDp8107nlUxfe0+wb4Tu3nEPe
	vx03vqnTzQotxRol0V1mLPg99D77gsi0fWn+AlgdFyC4i7Qd4ABAm2ZTA6dpp2PVFQ4GMJez2FM
	H
X-Gm-Gg: ASbGnctxGG4UmIXgVVoZjDC62l6/MFA3BnNBrp1OVaWHmcvxxJhLzP7ljPSIkSI3Y60
	ZiQX3C7G0x/zkuxtbY2GBAYLroRAFKYaev0M4u2C2ej7YMM8FMt1cf0PdkLG2cRb5VRVXMGjCmt
	ojzGATXIRe0nBASVg90tNF8By/I/lvzmIALRs5OKtVh01hmURStVVzjQhSDsK4cZ0i4rEalcrS4
	/tYcgDum8bFLpW1IkYcSHVOtwpYVRWxR6r4ss1ttywYvm/Gv+P1NS5ZDVKrjNvWQoHdfwx/v3vU
	fuLaKKinQovNLQBQDzswX6jBM6m3Pk2c+MjisrNiZ9OZH5kWpA==
X-Google-Smtp-Source: AGHT+IGg8GvzE5Z/w3SPJ6HUWguNYWIga1jjbNiYACDEbFNuFPDlZsOtxem0jVkPwhDdthxVtoTDMw==
X-Received: by 2002:a05:600c:1d01:b0:439:a138:1d with SMTP id 5b1f17b1804b1-43c635d4fdamr16521205e9.22.1741340715159;
        Fri, 07 Mar 2025 01:45:15 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43bdd9470e2sm45894145e9.33.2025.03.07.01.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 01:45:14 -0800 (PST)
Date: Fri, 7 Mar 2025 12:45:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Shreeya Patel <shreeya.patel@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Dingxian Wen <shawn.wen@rock-chips.com>,
	linux-media@vger.kernel.org, kernel@collabora.com,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] media: synopsys: hdmirx: Fix signedness bug in
 hdmirx_parse_dt()
Message-ID: <4a50949d-e472-4942-9152-3e5a54c6b076@stanley.mountain>
References: <7ec94789-305c-4de4-b477-c0eb839170e5@stanley.mountain>
 <54d5eef8-66a9-44aa-9e9b-0324d6fee46d@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54d5eef8-66a9-44aa-9e9b-0324d6fee46d@collabora.com>

On Fri, Mar 07, 2025 at 12:36:47PM +0300, Dmitry Osipenko wrote:
> On 3/7/25 12:30, Dan Carpenter wrote:
> > diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> > index 4ffc86ad6c35..e0d3fed87a92 100644
> > --- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> > +++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> > @@ -154,7 +154,7 @@ struct snps_hdmirx_dev {
> >  	bool hpd_trigger_level_high;
> >  	bool tmds_clk_ratio;
> >  	bool plugged;
> > -	u32 num_clks;
> > +	int num_clks;
> >  	u32 edid_blocks_written;
> >  	u32 cur_fmt_fourcc;
> >  	u32 color_depth;
> 
> Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> 
> Would be also good to return the original error code. There is no need
> to check for the < 1 clock, it should be the < 0 check. Can be done in a
> separate patch later. Thanks for the fix!

I'm not very familiar with th edevm_clk_bulk_get_all() function and it's
not documented.  But clk_bulk_get_all() does return zero, so I can see why
people would be confused.

regards,
dan carpenter


