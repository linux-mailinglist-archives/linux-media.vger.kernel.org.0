Return-Path: <linux-media+bounces-11776-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CDD8CCEC8
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 11:10:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2F33DB20E03
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 09:10:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E21013D260;
	Thu, 23 May 2024 09:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V2jm2ZeS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3149E13CF93
	for <linux-media@vger.kernel.org>; Thu, 23 May 2024 09:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716455415; cv=none; b=cTBKLJ8iVKOf7FWFikaBSz7BpjzNYEy76PQPgTv/2zh1YgCyrH4GBsRA8kTB6dgfkMpDgRIdE1B5N91p3giIhQYCvCYmMHmPWLhdCb6iZpdSEzXBQwe2+gYLTnCK4NiisrI4FgPviHQYYhsl7ZyA4pkhxSDJ//CmT8kEsJ/PeEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716455415; c=relaxed/simple;
	bh=2LLQXSCtOxv6wPX6ulrJ4oQTIol5AljMIJ9YZtpb3U0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=spb7ax//uqzvU+aEbZyMh9Fp2olv+W/k5KjestwA3oW/xXOmMtSKdT207Q2aT8jghYRxzl/VgbDKK2JHHxsaJODDIAR0ZizbOVm+UsTzNnKzbFl510KZyjAv5dvgWBRuTvsQ90Vwszu1k08QOvVUqGGebjHOnXa+jyb7BllNveg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V2jm2ZeS; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2e1fa1f1d9bso102810471fa.0
        for <linux-media@vger.kernel.org>; Thu, 23 May 2024 02:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716455412; x=1717060212; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yLbNbEeZZx+Y9UagHOzdXnc5AHkeTqV4LNqc32hMk7o=;
        b=V2jm2ZeSP5Ndp8ezR6Wgx9a3wCMGt6X5v53RhR6FSO3l3dTcYaRDerC1nL4c6LHiyl
         XWGZ4tskCaG/BYn27veSA+1xKcR8ZDbXTjrJEkfzwGdVusg3qaGB+klaqJQbjBN6welQ
         Dwi25bicIPhR99Hf1y1FR5v1gqj3EDbAXQW+QeJpbsqpWGWj7opRfqUKcnzPRB8yf9hM
         qLt0MOghdpWOJLDa8gIud6T/PQ/IbJ7ME4kIBe5LZU/u4/MkVHQ+ZSb9J4m0SapqPDI/
         i9axg6eCNaFTEV0xCi/9u/S/HrwEfiWigdYqFeC+mL4faFyZE4vSjdAiFKaiAHAlUGj9
         F7kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716455412; x=1717060212;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yLbNbEeZZx+Y9UagHOzdXnc5AHkeTqV4LNqc32hMk7o=;
        b=fJEkvKe9Q5kRDPeKnx5Sy0ACKkwSq//sYrIgs7DUpGPbg2EormqM25HnBGwtVKQ0Oh
         Ty9nPWjuQ0XWxfRUjzDymV4bigM0hGWxbZ3KFjzp71f+nuOO+S5v6YxWiBAbQR2QdtXb
         yUpsxXm10Lxo6BUtHtLETd4N0NRAZ3lX3mGGZiCjG15Q4F3AFe6FYW121hi08z3UPArr
         zP4BugBQYZBePizazBSVO8yov1e49CMcK6cfi+9w0LItMo5UW+6Gp+lqKEDfr6tqZGBC
         PWCtuN8EmH38NfS9YWEqSqHmuvw+sVBHD6KieSbY3OfsAf2OOfEGsqM/+yHWQT82eFRJ
         8YPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPp8/UdrmPhSy3IzDvd9ZZHI0NAqlJC2HW6XTZWfuOJvb/ioPl5xoEpuMFmoGL9vr/P52IlwhyoawfcnDkovXTZ3OkBphI2iNfWz8=
X-Gm-Message-State: AOJu0YysaZG7m+9O3gJjHzuPdrp+Wu49T6ntAD+NCNC2W31RskzmK/YK
	4AAxYMEvhqk2wIluLQFnW54shWAIWShMaXbKX4gl+OkfEwXlvuiunBkzj14ulbw=
X-Google-Smtp-Source: AGHT+IGdSgWnLFMgir035AHyOCVqS5scq5u8M8DlUryO/CIUdmVczkNrL4TJ+hWCvcPS/dK0wrOj/Q==
X-Received: by 2002:a05:6512:44b:b0:51e:646d:fe3b with SMTP id 2adb3069b0e04-526c1213db4mr3455906e87.60.1716455412389;
        Thu, 23 May 2024 02:10:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f35ad640sm5253516e87.61.2024.05.23.02.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 02:10:11 -0700 (PDT)
Date: Thu, 23 May 2024 12:10:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
	Sandy Huang <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andy Yan <andy.yan@rock-chips.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Sebastian Wick <sebastian.wick@redhat.com>, 
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v14 06/28] drm/tests: Add output bpc tests
Message-ID: <p6mpuna2ubfpqyfogblvknxadga2uqnm3lsocwol4npwmgw66h@42yt4b5zhk5y>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-6-51950db4fedb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-6-51950db4fedb@kernel.org>

On Tue, May 21, 2024 at 12:13:39PM +0200, Maxime Ripard wrote:
> Now that we're tracking the output bpc count in the connector state,
> let's add a few tests to make sure it works as expected.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/Kconfig                            |   1 +
>  drivers/gpu/drm/tests/Makefile                     |   1 +
>  drivers/gpu/drm/tests/drm_connector_test.c         | 140 +++++++
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 438 +++++++++++++++++++++
>  drivers/gpu/drm/tests/drm_kunit_edid.h             | 106 +++++
>  5 files changed, 686 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

