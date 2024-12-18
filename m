Return-Path: <linux-media+bounces-23701-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F379F6503
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 12:37:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 44DE518918A8
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 11:37:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7C1B1A23A0;
	Wed, 18 Dec 2024 11:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KNOn79vb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E564319F419
	for <linux-media@vger.kernel.org>; Wed, 18 Dec 2024 11:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734521823; cv=none; b=FSZT3OGFOwsMs8YPQClGjagMVAW6iCEWJYamTVbYhsQrobDQba3pzaS4vxWIgy4OC4pFrFKiQEPXgjSKB58zhqK3AVG2knwdS92PhQ+4cO0Lk4dWQTe4wltq8OPlGDgHAeI7hkcxsAihM39iBz06qCwQ/K1mvd9ZgJgOzZU3HSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734521823; c=relaxed/simple;
	bh=nV+pqhfWyXgRa9pON0VAn9kRTq5cl6suRFxwKoI9NjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CXtTe2qorI92yoHB5nuXh0L2/ijX1PR4WPvwZ5/kCubwlet+RwN89nI5oxtKuyE9bhmBmleUMpXbkEwSkeaoFf+ZF+KpQIRscOoE3efVTgKMrVlHxpCtcoS8PF8y8MDyUlVU9Lw17oQTSxe39caxNx9mMS4l4PwoEabVxwHsVXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KNOn79vb; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53e3a5fa6aaso699628e87.0
        for <linux-media@vger.kernel.org>; Wed, 18 Dec 2024 03:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734521818; x=1735126618; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mgC6FT2aLsRk0iznKN/lYkL6v9+y1HJaw8g4ZlWCUFU=;
        b=KNOn79vbnRwxqhA20G/SChtyN3khs+XTu+rE6XSF/opDlBGRHHyw1+V3a/q3SEtdvf
         tf6cfPxSqTKAwl5dm6su/YndKL9mz7uEmwpNP80azKvqrHbboSagDxurbBw69IzTHLfX
         LU93Z+kSDsgskWJ2rriNRFFqIQm3iu05edxDJo2ccnlnVuagcoUN5TeRYZqeO7kEwloA
         oSusUbxhUUwtu8DxS/nNLCygh8k5/6ZKInA32bbEbInE6ksJmQ3slc+KfpmO/gGRqc/h
         cBA3zAaD4F3X5qUizW+OhWZp1H49OjK+PYOtiRi8rGECzehh50VP4aLamFuIuBB6oxI3
         R6kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734521818; x=1735126618;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mgC6FT2aLsRk0iznKN/lYkL6v9+y1HJaw8g4ZlWCUFU=;
        b=VUC0g0rcuCEcY2rfIftC11SWrB3Z0qjiwUaZOk05t6tZpQL7VmeRxVDedgwsPce/SY
         gdRous7U/vIire2y+rSaIE3aLmtwWeEgpepdBVsk429mWbFvYfZVyrMEfc+n80uY12h3
         R+03W9n/kxx6kOSYJdZs/unKYCNKZ8XxM7X+jNlXnUc1N1Svkto+YS1xnisrP/th0rfu
         Ea4sB78KpUNn/Gr2VzsRpD4BKg2q9kjfmKn5tRKl2QhbWjGIyDIi9q6OokMtU98dsaDz
         U9kl67lI2Q4PuDONuCgwpUQR3u7EHBjP0aOjMorC7xgqZtj/DiT6wo7JY4FlJHGW5ofr
         RUJQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+7T3JjN3kY1dyV6rlfD67OQYPHx00jz4ljfmbcKfhwfPoQ+3oYiWxITkslr1pvygRoeLXQa0qLS7pQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXvemSpWwJgY968iSovN12NnGWZxsihuaF8xSrE92LhUWjWjg6
	XxUM2JJ9JwJPwQY95y2iUvmhQqwPmxC5FV8w1rbCU/O3RKNLxqiNRUAimKifwIg=
X-Gm-Gg: ASbGncu8hQWdvI4g7/rEdnUz3aLuSoOCpfiHx3w29yApuWptclHQgMLbdHCbZ7C0LsH
	76/b5zgeXOXa3hIaNxbuws5z5/N/WsQlo7lU8IKvvcjUKCKHO/mQjVUWcBIMIENct47t6Dif0vr
	zKj+VcAcb+Ur+THQrJVgYFJ1165RCs/UvvyfL+CSFCD/N514R7opnSV7D8Z1GjuKcdfEM4iO5dB
	L5Pf0/aAFcjxs5tUs5dX8jGBSVkiFNh7CU6vsmssY1M2g2BX++fXTSkRhKAeIIi6uM2PkKccRau
	NkU/OUOLQC6Pk78EH/Ra11PCqd6oAMdHehgt
X-Google-Smtp-Source: AGHT+IEZ+sSU1SDLXJ8oJNi+0fhecW4BHBNr3eJX66/i9r+4ejfv6uryNvgWsgMb3aNXDMPAIOxqLg==
X-Received: by 2002:a05:6512:ad5:b0:540:1fb3:e061 with SMTP id 2adb3069b0e04-541315b4f48mr2268645e87.28.1734521817999;
        Wed, 18 Dec 2024 03:36:57 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120ba9db5sm1426597e87.88.2024.12.18.03.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 03:36:57 -0800 (PST)
Date: Wed, 18 Dec 2024 13:36:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org, todor.too@gmail.com, mchehab@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, akapatra@quicinc.com, 
	hariramp@quicinc.com, andersson@kernel.org, konradybcio@kernel.org, 
	hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, 
	will@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@quicinc.com
Subject: Re: [PATCH v10 1/4] media: dt-bindings: update clocks for
 sc7280-camss
Message-ID: <hevfx4sgsatohz4ndgrlidj5kqxaiizmakjqjghlkbmguluzi5@ezxa36uasb32>
References: <20241217140656.965235-1-quic_vikramsa@quicinc.com>
 <20241217140656.965235-2-quic_vikramsa@quicinc.com>
 <02da691b-1f5d-41a6-847c-c7e9b8239919@kernel.org>
 <c14493b0-c9d3-4e1c-9f86-991b4cb25c98@linaro.org>
 <fe28a9bc-82ef-4fef-af50-9d9261ed9b39@kernel.org>
 <a1032d53-6f3e-48f6-a2e9-1315bb1a3232@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1032d53-6f3e-48f6-a2e9-1315bb1a3232@linaro.org>

On Tue, Dec 17, 2024 at 04:30:37PM +0000, Bryan O'Donoghue wrote:
> On 17/12/2024 16:23, Krzysztof Kozlowski wrote:
> > On 17/12/2024 17:12, Bryan O'Donoghue wrote:
> > > On 17/12/2024 14:10, Krzysztof Kozlowski wrote:
> > > > On 17/12/2024 15:06, Vikram Sharma wrote:
> > > > > This patch change clock names to make it consistent with
> > > > > existing platforms as gcc_cam_hf_axi -> gcc_axi_hf.
> > > > > This also adds gcc_axi_sf and remove gcc_camera_ahb.
> > > > 
> > > > Don't combine ABI changes with some less important things.
> > > > 
> > > > You miss here explanation why doing the ABI change in the first place.
> > > > Without that explanation I find it rather churn. But anyway, reason for
> > > > ABI break and impact should be documented in commit msg.
> > > > 
> > > > > 
> > > > > Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> > > > > ---
> > > > 
> > > > Best regards,
> > > > Krzysztof
> > > 
> > > This change should be fine since we haven't committed and upstream dtsi,
> > > so there's no ABI to break yet.
> > > 
> > > Agree the cover letter should have been explicit in explaining.
> > 
> > So these are recently added bindings (sc7280 is not particularly new)?
> > If so mention in the commit msg that no users are affected because of this.
> > 
> > Best regards,
> > Krzysztof
> 
> Agreed.
> 
> The commit log should make clear that the ABI hasn't been cemented yet.
> 
> 20241217140656.965235-4-quic_vikramsa@quicinc.com <- is still pending

If it hasn't been comitted yet, isn't it better to post a fixed version
rather than committing a version which has known issues?

> 
> ---
> bod

-- 
With best wishes
Dmitry

