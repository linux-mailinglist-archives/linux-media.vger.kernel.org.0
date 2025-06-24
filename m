Return-Path: <linux-media+bounces-35813-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 16429AE6DA0
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 19:33:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70F461BC6932
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 17:33:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 496912E174A;
	Tue, 24 Jun 2025 17:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fc/+yBf0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF1A2E6D00
	for <linux-media@vger.kernel.org>; Tue, 24 Jun 2025 17:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750786351; cv=none; b=m4WYaJ0ocNjVFT2iGyemxQ++8ieTf7x4M3mvX6DdYLfPxGWHQaWNjS8VAg3upKrbWiS9mEBFYuR/ohp6Mi7jh7MB++A2Gbns16/mlJqbx2higSJmalTG+O8GlnQ31yIV7PIzkDb0rISGRpXoSrkc4hgSHIi29GC8kadRww7X5eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750786351; c=relaxed/simple;
	bh=5zXOGQHtuzqMdDTdTVm99Sp0hUHS0qO9OFTXoiOPRec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kGz/84jLuIapcpYeNMHhMDWzVYSpQIHN6G2/INQnrS5MNb4rCq7kGjHwtO/gYRe/zVoPA79T//L86JviomJEj18/fog2SltktB/ipyKo0eys/AwDVnm6auc8NFOU4yEVlKQba+kAx2ZgwPHoYSpgQ1Ccsm2S6ioHxcUmoztjcBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fc/+yBf0; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-60634f82d1aso218340eaf.3
        for <linux-media@vger.kernel.org>; Tue, 24 Jun 2025 10:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750786349; x=1751391149; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dSGDqT2il9ocDCmHC7EaO2CWRkrvX38ACbyIKYy82e8=;
        b=Fc/+yBf0pZDPwPb3AsSwFvTvoaL+xqbQA1ZWO1vc3/zveT5gCXivoVLV0r368wNULp
         Q/7E2yKz9z/c4OmA0Qv5sROfBjz8MfaiIjYOpDqpjFfzRCOkkOzXlwA7PKJ8zndxSYWi
         lubQ6IC6fcWPuFz/pyrIsVFSvKMvdAjYTbTjd353yE3o6Uid4vEDzfg+tSb6Hl50p5Hp
         GRhjCZuuHpOt2aziOLU7YfS8nY/KElvo9JzYKaWtTTXo3G+1IrDrSUnZelQ62v4kN0vE
         pBiCUvJwTG7K/ySVv7+9kfsg1NiOqNt3v/VjqG4Hw7QRDS1gAEnNJxnSc/ZRn20t00nq
         z39Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750786349; x=1751391149;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dSGDqT2il9ocDCmHC7EaO2CWRkrvX38ACbyIKYy82e8=;
        b=CZwiyAiRMSbyaaQ5hL+RMuAsCmoDpaz8AVRQQxLd6TcetjHAgvk3emu+9dAXi7vIsK
         hO2tzyzPHCOqDJIata5qobwBjm36fO+tbTBDhgeroGmnjY6eBYuOTGE/Z+fsy32pncn0
         Yv81+Y91xzFon1m2nTEIybInuLTcV3dTKxtZ4pa5Zk03bXmWlxn058RarSJHmsGIkUfr
         T8LnhCKo0RLqi9A2VZYB7MlR85hUIeFDs9LaRsWVAIUE2F76OLtP3dJqWFISIcLJkDxS
         qekIBy3Oeb7ixHEu4FU5gv63qeVMwg3IPHAAY/rjdsb9t6FPF56psj/GWD0Tedkpz6Sd
         Lw2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUPLOdkY9d4+Xr0oZDAYiPm10FFzWuYgb7VtQ06n+TuNprnqtlhSWAtgW1tobn4UCyUDBYPc1sGzeKSlw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcIE4NjSG00mP70eVasBFpcGtf9VtRZxIEJWSM6D44gYtvf46I
	R1qQMJRX1ZQiYT5kdr5inaHrsQZTkowvhsBgni92Juj7ocb2LwRG2ow16ntKlwdK6J0=
X-Gm-Gg: ASbGnctD8i3f/QiLFx0A7CUdmemUgvAhjLboYV/i280DnIKhTiS0rnbq+BiEhvFMdiE
	jNQg9znRd+VLPfWDw49MelayHyUaH8ei8IxfalRDtu7QoIfjUicLNBUog4Z6IiHA/2e54Q51bAJ
	wMBxZ+mgfCvFTHiVbJ697OZIKy6EY0ivsvtAe5wjN96Nv3aNAy2PlDE62uETkWIFlNErTqtwKBh
	/tbLPpANEWqEL3qmWAT+C+ewZ4Lhj29f/lCYf7FJLFbVafM8/PFilrLI0FYf15Q8C/OhXKSMPb0
	aQfdGUTDFXtuVoWm/LYtg/W6YLX9CTKDGpotmGpfO0qfaMjwgrBgt+pL5hrblBYm2SruXOS1qQA
	lC8ar
X-Google-Smtp-Source: AGHT+IHP57I2IEpZSZTYdkWPLpjlVv9dwCTYMhHj4ANtmM8o/tFTjl/Qtb1NAxmUKgDIueYRW8AITA==
X-Received: by 2002:a05:6820:1b05:b0:611:5853:3ecb with SMTP id 006d021491bc7-6115b734ecfmr11470941eaf.0.1750786348746;
        Tue, 24 Jun 2025 10:32:28 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:22c9:dcd3:f442:dd1d])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6115b7f76e9sm1317795eaf.39.2025.06.24.10.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 10:32:28 -0700 (PDT)
Date: Tue, 24 Jun 2025 20:32:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: andy@kernel.org, hdegoede@redhat.com, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v2] staging: media: atomisp: remove debug sysfs
 attributes active_bo and free_bo
Message-ID: <5ce9dac3-0b7a-45d1-8313-2f65165b50e7@suswa.mountain>
References: <20250624144943.39297-1-abdelrahmanfekry375@gmail.com>
 <cef03d37-715c-47a8-81d4-0872d505c39b@suswa.mountain>
 <CAGn2d8ML8eTcN2G18B7FYkapROnOeAKJir5fJvOXDdXTLY43aQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGn2d8ML8eTcN2G18B7FYkapROnOeAKJir5fJvOXDdXTLY43aQ@mail.gmail.com>

On Tue, Jun 24, 2025 at 07:51:10PM +0300, Abdelrahman Fekry wrote:
> On Tue, Jun 24, 2025 at 7:31 PM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > On Tue, Jun 24, 2025 at 05:49:43PM +0300, Abdelrahman Fekry wrote:
> > >  int hmm_init(void)
> > >  {
> > >       int ret;
> > > @@ -130,14 +48,6 @@ int hmm_init(void)
> > >        */
> > >       dummy_ptr = hmm_alloc(1);
> > >
> > > -     if (!ret) {
> > > -             ret = sysfs_create_group(&atomisp_dev->kobj,
> > > -                                      atomisp_attribute_group);
> > > -             if (ret)
> > > -                     dev_err(atomisp_dev,
> > > -                             "%s Failed to create sysfs\n", __func__);
> > > -     }
> > > -
> > >       return ret;
> >
> >
> > It's really unclear how this "return ret;" is supposed to work.  Was
> > that part of the sysfs_create_group()?
> >
> yes , but still it can be set by hmm_bo_device_init so even after removing
> sysfs_create_group , ret value depends on another function.
> 

You're in too big of a hurry.  Wait for a day between resending patches.
I have looked at this some more and it turns out that nothing checks the
error code so the "return ret;" doesn't work.  What do you think we
should do?

regards,
dan carpenter


