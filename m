Return-Path: <linux-media+bounces-41187-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7611B38355
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 15:06:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5053A7C61E5
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 13:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96EB831E112;
	Wed, 27 Aug 2025 13:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pGfDw2ke"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5120A2D0C7E
	for <linux-media@vger.kernel.org>; Wed, 27 Aug 2025 13:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756299993; cv=none; b=KoHAlzuXULeiiSIRavBO6YhR1FKr9Nq3bHgO46Fr27UKfnFzbr5NreTXhtgd7UFpiR9kuo41iJZRLk0S0oQf59H/9ajF26dUhzWhfPuLOvtkuTrdusxa3Qa1CVQozpNgCMwSo7qRHVGIbG9F8r+fpD87kXib6n8np12X9Zds4Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756299993; c=relaxed/simple;
	bh=J6tlttBlgZ6DdU9dlu0VuCFWzKR1/21U0OOFFKpK/Q0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tchNndPykTdrsA/cO6DsM09lE1G4H4O84JAszaqfVywJ/S9+GVI2OXwOqb4+ZHk6so8QKBLY+6TzCpox46EJVFuY7K75oWQlNiG455WGosEy99TUMS6MWg/Jgl2GpWCXVBJ2YJl4m/whNvuJztx7Qvbi4aa+MlWVm951t5jq91Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pGfDw2ke; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45a1b0c52f3so41966455e9.3
        for <linux-media@vger.kernel.org>; Wed, 27 Aug 2025 06:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756299989; x=1756904789; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hK+6X7If3iibz8tYO8lX48Dx7ObpMSFEmkT7sgjJ+No=;
        b=pGfDw2keEEikdM+QY79qAEXqlWJSxCXBEU08QYIOb8qLW2kNaH9uzlaxVHWdZqJT7p
         metjwsQi4ojp+1YlKdhgcdBDHABvEDfi+CgwIHokUQAa7GqXq+Heiq4LycWcGhghHgZc
         RsBakm1M5uazj+gsEYtsNc3gYHXAXflythgvuLMSqZ0Ipph5ZgjMCyv65il+IA8rrPIX
         1H/sXqLHdPLCYbhEcO0BwqukiSh8KyQrV0oOyDkjSVUD+CD1dWH3WrxylfknQUhJXI8R
         pvfwmd1lVYgi46gCCzfDAkkGfF6+G9jZUrA2bgHf5KJRExgEl9fyU7R3MZcfs8oBd/pF
         zZNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756299989; x=1756904789;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hK+6X7If3iibz8tYO8lX48Dx7ObpMSFEmkT7sgjJ+No=;
        b=Ct7B1n3myaW5vRM/f9snuQZf3GZWtzT/ZRDAvnBlPJn7l6agYnKrThqg5hjWUgMCKj
         1ciyw2mejiuGMbPfWbv2c2eYKwKE+o0Ql6edjKTd8MG6+3nK+MuZRI9hamXvaUrjHXlm
         bcoLttivkyFOiDowYsVNT3jXzRK7yq3RN37Qt9ONAQGN9iMDCZS8QF/y49DTR0UeWuYl
         DXogXbSeJWJrf78tsAW2uq6Ag35uEQL3yy8LECiFKG/qeH5oWYhFJcO5pDao6uBaoWxM
         UkY5hq0iHrhZiRrfH36msY5PWLti2DnIISfV/PriBN9QkDj98akow41piJjSsEHmpP/B
         UaiA==
X-Forwarded-Encrypted: i=1; AJvYcCVUMvsvxvDcDgDqxsyUSFh9Xk/9atFewPhpmpp+z/AxA8/Ezkr2CrZOJBPs6CZjggxPkWdM5dXHGn3ZYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxViQ8qvcsK9UCCKn1yZ04xAVFY7HtGxylaHt0sHBurIgXsC6q7
	25uiDga8wiP4cMETE83xuQ+Imfy96NC9JXR5bahFuC7XE1mJ6RVmjVhhVvCpFnJ404E=
X-Gm-Gg: ASbGncumK7uH/1ChE/7azWfzPbqcKO5vooCT0yPhVXbMJNocOKw9MYLvx3R+PmQatRP
	T57uZNLKAGuqx7pnO4DPmBr45PzqMfECoNkiAi0nawzZqEm8L9G+Evx5KFh+2Zd/VrmESWPaFO5
	fRm+PTP6H23GV/k1c5dfVJqCVbj4vAtRTh+4foYl82X9fmd+qzgMFQ3MlV49GbcdlTnKf/3x3kQ
	gJ63u8B+JJ2WKDdFbyCPoBxNWI2J5aJsrIAtFcMDJLwY2O7exRSBrU06kTskDilzWL3XKeVV85u
	ZcqoKBq1cxpyGnI2p51bROyhOHXcm1P8q9JIc0P3qNjLShRX41U5KvdraYITjcyO2T3G5C7r5Tb
	e2qq6a3EDb+Y44vLQEse5kg6FOL0=
X-Google-Smtp-Source: AGHT+IEXDXRBapmJnNzs3yvXudhRz+Tvr8DgSaDCekM2NjQJUOq12kV9vyfi7g4u8CZNTYZm5ZKuaA==
X-Received: by 2002:a05:600c:3b15:b0:458:c059:7db1 with SMTP id 5b1f17b1804b1-45b517d4580mr189191765e9.30.1756299988612;
        Wed, 27 Aug 2025 06:06:28 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c711212924sm20651459f8f.33.2025.08.27.06.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 06:06:28 -0700 (PDT)
Date: Wed, 27 Aug 2025 16:06:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild@lists.linux.dev,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [sailus-media-tree:cleanup 30/54]
 drivers/media/i2c/imx214.c:1109 imx214_ctrls_init() error: we previously
 assumed 'imx214->link_freq' could be null (see line 1017)
Message-ID: <aK8C0InZVhV-VnXr@stanley.mountain>
References: <202508270603.MDqIVFss-lkp@intel.com>
 <aK7MAiDuq6tqEW7X@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aK7MAiDuq6tqEW7X@kekkonen.localdomain>

On Wed, Aug 27, 2025 at 12:12:34PM +0300, Sakari Ailus wrote:
> > 4f302d004bd0fc André Apitzsch 2023-12-06  1012  
> > 4f302d004bd0fc André Apitzsch 2023-12-06  1013  	imx214->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, NULL,
> > 4f302d004bd0fc André Apitzsch 2023-12-06  1014  						   V4L2_CID_LINK_FREQ,
> > b9b359662952ff André Apitzsch 2025-05-24  1015  						   imx214->bus_cfg.nr_of_link_frequencies - 1,
> > b9b359662952ff André Apitzsch 2025-05-24  1016  						   0, imx214->bus_cfg.link_frequencies);
> > 4f302d004bd0fc André Apitzsch 2023-12-06 @1017  	if (imx214->link_freq)
> >                                                             ^^^^^^^^^^^^^^^^^
> > This assumes ->link_freq can be NULL.
> 
> This seems to be a false positive: the control handler's error is set if
> adding the LINK_FREQ control isn't successful and that is checked for later
> on, before calling imx214_pll_update(). Probably smatch can't figure that
> out?
> 

Yeah.  You're right.  Smatch knows that v4l2_ctrl_new() sets
ctrl_hdlr->error on failure but when it gets returned from
v4l2_ctrl_new_int_menu() then that information is lost.

I should investigate why that is...

Thanks for looking at this.

regards,
dan carpenter


