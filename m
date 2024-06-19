Return-Path: <linux-media+bounces-13657-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B35C290E3A2
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 08:41:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E7BD1F24E75
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 06:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E35326F2FA;
	Wed, 19 Jun 2024 06:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HkQIOB33"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912F26F2E9
	for <linux-media@vger.kernel.org>; Wed, 19 Jun 2024 06:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718779258; cv=none; b=ZNoWNwrUMHrv+Y8aNmREQcQuDa9nbLy1Q6Deehm8Ws5pHfuZ2TzUbpScgcc0y2ZaYZh29s+LmRuZh7Yhao5IRYM7eIyqkELmJ32CfpG/dfU0XsKnqosk6C4zGHIIQLgUaGsAd6sZYDVAdzU4qkmZ5loiGe6uVhybPoGD2TMNTkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718779258; c=relaxed/simple;
	bh=Amm5o9HpN/p9e2dXb3SmI0c+zPL4yvUSzbUR12Jkknw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pd+p1qYxapQLgAqhtmycFo81gAlHz+YH6BEYO6A2I/9cTuFIApNIaONc8WjnVNwnnDLEESzavhr0StKM8R2LrxTTNRaWmhaKDylrBivEh208wfNOmfczon/QNS63jRrvVSJPgaLfqbWQk06CKz89yuDbQyAZjXHflkCSieBqsvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HkQIOB33; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52c819f6146so8194672e87.1
        for <linux-media@vger.kernel.org>; Tue, 18 Jun 2024 23:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718779255; x=1719384055; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xWG25TSy/I1an8iywuQb5G515alr24rVW8FaitaN0eE=;
        b=HkQIOB33cdCGu/K9qfu6OK/B55xzQhzAzj10NG6Z2Jof5H1DTZ5hwXzEwdZUXgAgi7
         /KNVYKvpP5RJTGZVkj0fSNIzF3kYRdtpIwa87Zr2SEgTIDP2JKGmZqrKMNTCgGr+tpeO
         7/y2VHitLADDcOk8quzzt+yuuvgMBndV1aBfFHJzNpnpvfCbzsEMQ08NlDYi4BREcAAz
         b3Xra271LiJcFcEV/Q1xl2qkR4sGfZonEo+LT0xn6JuwAW79xwZ9UqbkJiWWyGV/Waay
         aVk3QgFrdn4aAbHT+nBoJqIalFMkmD03jYlVY2aVbJ20Jw2UiODlnJ+yglKQIO6mVlKN
         O5Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718779255; x=1719384055;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xWG25TSy/I1an8iywuQb5G515alr24rVW8FaitaN0eE=;
        b=p+j/M8sH87ckPdoEWtap5KC+vmDFugypvo7oEkOGRiB4S9IM56ggKkuRYkhzNITtEW
         Xg8nWv6reSf6SoTMkUZ1v0fFTVZZ++o0HQlTXEncWN5MWKPvMTX0oYMnutvh3ZXYqso9
         2+BAuRl5W98tm38PVxt+/fLfEdLbyZEM6k1uMKw1gwdM7iJwnGDR/YHl8x2m1tuXKm//
         Yg97ldUocJF54gpgxWgnGAjwvsi4XaOUv8NKyKpwFr+NYyUF1oY4rxMd9ILA1XmNDJeD
         9O7GIhpm5k9gve3DmtKk4pC+LcaeyE572w2FTX5JnOIRu54lWZ0ylzi9j76LCLEsfvoR
         N72g==
X-Forwarded-Encrypted: i=1; AJvYcCVIHyY/9YJpr8KF5Lprjnd64+9syjXSnrEtLYRR0P4DHqJHYYsUOraj3CEiwuPclm0D0rqRFCHQrIb5uaJaDL11Hn+zIXEN0HxkiAY=
X-Gm-Message-State: AOJu0Yyt/QKASgjRc6k1mZcaUEa4PCK2isVg5+Yi/M2v9TDebVettIj7
	Jc5WzDsWvmDsJYdj3xZd9eA6VHQKEiE2cmAykkIUezCViqGLLf2Mr7nLtOAHsNk=
X-Google-Smtp-Source: AGHT+IGk6IXrWafiMpJhwJp502XVXsfcrZRSyivv/fv5wSqT4lGqJPeuk+T7bbUxsXGwqLVteywdtQ==
X-Received: by 2002:a19:ca55:0:b0:52c:b239:5719 with SMTP id 2adb3069b0e04-52ccaa6284cmr1005490e87.33.1718779254701;
        Tue, 18 Jun 2024 23:40:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca282dd55sm1730660e87.65.2024.06.18.23.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 23:40:54 -0700 (PDT)
Date: Wed, 19 Jun 2024 09:40:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v5 00/10] media: Fix the last set of coccinelle warnings
Message-ID: <4fsxowdpaeaxcnu7aewif6yqqk3jdgsjtksbznv2arnmmtiaq6@ibzf2qcel5lc>
References: <20240618-cocci-flexarray-v5-0-6a8294942f48@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240618-cocci-flexarray-v5-0-6a8294942f48@chromium.org>

On Tue, Jun 18, 2024 at 01:37:43PM GMT, Ricardo Ribalda wrote:
> With this set we are done with all the cocci warning/errors.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> Changes in v5: Thanks Vikash
> - Remove patches already merged
> - Fix typos and remove hfi_resource_ocmem_requirement
> - Link to v4: https://lore.kernel.org/r/20240606-cocci-flexarray-v4-0-3379ee5eed28@chromium.org
> 

Just for the clarfification: does the driver build without errors
if only a part of the patchset is applied? I have the feeling that first
patches introduce a build error which is fixed in a later patch. If
that's the case, it's a no-go.

-- 
With best wishes
Dmitry

