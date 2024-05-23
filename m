Return-Path: <linux-media+bounces-11797-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A8C8CD055
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 12:25:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E6F7284E96
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 10:25:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76ACC13F011;
	Thu, 23 May 2024 10:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wAbDqDQ5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDE613D618
	for <linux-media@vger.kernel.org>; Thu, 23 May 2024 10:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716459936; cv=none; b=e9ICyJp4OOijt6NutDiTIiZlkfpRva3dgKGPiQrPnYuGTl+SyrS4N5ZXg3xi75nOg4EzzzCritYLN/gfoz+/k9k2vVm+lzM8mEHFfUGNuREwd5m5kAQmZSf8aBHa1vf7Xcq9v6fHaHs2taMRUzPDGaZAlQch3S+VhccTKy5RZQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716459936; c=relaxed/simple;
	bh=7qYk3nhcej1wrZJb9D0jf9PZ7Z4vN9EkOqPyNt6ofBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G5F+ajUOxKbGolI9yL/OvoJ71/xzmyNutCzBQaT56P2n7ELCOXsZSGSu6huSUG8DFxZkuF8YrB88CP8GvhNHYtHE87JIhlZKCi/SwE9R35/o7UIXTRRi0P/iUNuC3KuvaVEDHOP7P2WD13cyfbRF1RUUZb67HxbbZt8d9ey6HdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wAbDqDQ5; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52192578b95so8721307e87.2
        for <linux-media@vger.kernel.org>; Thu, 23 May 2024 03:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716459934; x=1717064734; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h0Y/Ql63/IxwaJL+O/h+E6/ion+Rk9v6vnf8eimobm8=;
        b=wAbDqDQ5plrdgEgnRvwbWiOGE42EGXPV/bMvDMI5DSR3xTKEllKa0SqYnVwQ9xUwx3
         +W5tHNyEt4ceN5+JBV1F+pNqvtvAvQBvWWp00G4xupivZ7XPVpKiRh2DSToahFdtEMlO
         IRbSarKYsKf4mVMG90VLw4+ZRcBY0ctbxUDuri6BikW6s2cQlqykZCCym2GTCVG7wOq2
         TxLgYTqGXW3Uk0J7RK6SguvwDUiosucz9UXRt33uvZw63BaZxm0amdIWgRsr3hhD2ccd
         VwCvQQDUMFUIbVmHKGGYUs7n+n+MMHBUBztmfSMxb/yIoKv5ZZCjLU0jJ6ge/6wm02Lf
         IGhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716459934; x=1717064734;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h0Y/Ql63/IxwaJL+O/h+E6/ion+Rk9v6vnf8eimobm8=;
        b=SWzRDyBatG7QhaRo8Xnq5YPUmbjFVvHpZD5cblylIbzUXxtGczzzMMYAXorqBlsduN
         ULPhWc/n1QbWgkBHL4CerMkgmdZgiFsrFwrS7eH0+/4DC6G8cqfqci1C1T4Cia5Keir0
         u54jlCfuTILOjqbk6JrWadTGHPQKDc/YbhqACsS5m/RGbjj42y4yO2nIK7jtpHj4nge7
         y7HwOsHt9KDBOEBOeTk+8FDZfmpkDKd5l89amn4E6NUY7nuY05Fc40NJfkLevbAPEEaF
         BEv3bulkjDgabzcQ72syNhtXonzISLOgxOXG3UB/bHTYWSJ2NZjY6Z4mQwZfAb/frejQ
         X4fA==
X-Forwarded-Encrypted: i=1; AJvYcCWfI4D5mNXwWUXyqXgj0CyVG/mNjYfNJkbMBYp9/wap2wtl5VysV0objgrQ+IBm5gbOjtb4zB/y8c+HvawOCRUtIV7hWNS60iCaz2k=
X-Gm-Message-State: AOJu0YzzdEwh3kjjD08YYg9mBt4VXbU0gJWtJn6jC7jZeiNFSlyHPcYk
	h8LyqblT3TcRG9aurHrqT/3y62Cy7wFRcYG44P7Apbr27IWESTgiwetYvkKJ2Gc=
X-Google-Smtp-Source: AGHT+IG3S9HxgA+BRyKc+tEiIJocVHkYeAAUZVOvMSsA2E8b2S+QZ7Z9TP78uV3Je9C7031yrjAtlg==
X-Received: by 2002:a19:5208:0:b0:519:2a88:add6 with SMTP id 2adb3069b0e04-526c0782f50mr2886400e87.55.1716459933553;
        Thu, 23 May 2024 03:25:33 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f35ba739sm5323969e87.101.2024.05.23.03.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 03:25:32 -0700 (PDT)
Date: Thu, 23 May 2024 13:25:31 +0300
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
Subject: Re: [PATCH v14 20/28] drm/tests: Add RGB Quantization tests
Message-ID: <pruqf2ou26m7i7ez2p6rgjdfbzkngqyuwfv3bnx5d3jzxce3af@sa3d467uka3d>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-20-51950db4fedb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-20-51950db4fedb@kernel.org>

On Tue, May 21, 2024 at 12:13:53PM +0200, Maxime Ripard wrote:
> The previous commit added the infrastructure to the connector state to
> track what RGB Quantization should be used in a given state for an HDMI
> connector.
> 
> Let's add some kunit tests to make sure it works as expected.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 355 +++++++++++++++++++++
>  1 file changed, 355 insertions(+)
> 


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

