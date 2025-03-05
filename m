Return-Path: <linux-media+bounces-27662-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E77C4A50CB6
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 21:45:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30FFB3AC96B
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 20:45:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C087B2571B1;
	Wed,  5 Mar 2025 20:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V7pEL6Wg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F690199920
	for <linux-media@vger.kernel.org>; Wed,  5 Mar 2025 20:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741207519; cv=none; b=gwmsgSKCykWSa95n8v84Oi2kt8pNT5Ftp8EW3ngQKjadGoHRBe1HWtQO4W91i28CPGmWZ/dHSHVCDgLqFDEa8wonnMNRAzTJuP3vMCC2khgIRcGkFr1B8Mh8qfI1Gjmn2s4LVCkeB8tFbKPFD+f4Y/AISPLFDNqC7oLvhWQq2bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741207519; c=relaxed/simple;
	bh=nWSgmYzbJW9vIQuFfEEpG7niuQ/1DEtdvz2zxSKIHLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mp4/WLriQae254T3zcws3IVShLHsVC6cGH1jcyYgcdzUDjs/M9UXpGpXUqDtk6Vf2D2A1KAfG8EWm5kFnU1kA5/VOuIInOLEq0vWAgS5mp9xNyy08sTlo93AI3pBYdIfffNghrITvbkcopEBypkWscxXubNA4QdcuF1NqljmGPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V7pEL6Wg; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5495888f12eso5437613e87.0
        for <linux-media@vger.kernel.org>; Wed, 05 Mar 2025 12:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741207514; x=1741812314; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Cs41APiWQyzW6ccELRrCzvUoQL91nTx9GiNFwDYjQSc=;
        b=V7pEL6WgMTYHnuAR0h+sh3qUDgxvggKq00UEaldaTBLB8C7SHGkarLa1do/H0R1jC1
         A21XH23DG/uhCoGhF3cwJsAcvjTMXLKUWzPgDjgeJpF0y8c5oJJrDXrva4Oad/s2qc8F
         qzMBZ6eMDBQQgnhGo4IcQ4VXda5G9XWq0m7AlMDh5fpT1ILcY8wzPSP3NJpkXKgJCAMJ
         C8LJfEQS5YB3n7aLDtpJAMrKd7zSczdvmDMC10kyCrYTuTh5dmcQdOZpKd/urE7dV8Az
         clOPKKzct/DbNpnHtKwQVDPmDqeK7S+jpcZh7l3BvFXW6kYEjwCOz1x1w6Nt2quPTlwu
         1aiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741207514; x=1741812314;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cs41APiWQyzW6ccELRrCzvUoQL91nTx9GiNFwDYjQSc=;
        b=MwI7ftblShd4S1zvH+/wZsN/Y31o2tOiZ67ga0TI9vkbuIB9kntHtV7qe6DS+0Ytlb
         /12rtbV4F2Jy0EPcsmyYYP7VaSMVqF7217jO9/v65x/OyAB8BXRiLjNERobuT1+SYXHe
         SDSmv9uFC86FM7n/oxqREhXxq4M52tI6Xz+ayTAoMkxEcwBFH+izyZSYNaczDeRVBNbX
         Y8Dya85g0VY7UFtzBH2gUejJop4oIUIyb0YGNw8o8s1tM5FYi7du2z4RHSPZOnQI4ZPG
         t+K1hzp9oq3UsnmMyglpankbuwwhBeO9BfjpgeIcv5O+fBwZToJM5YklINaDEQUpqLtA
         Mgmg==
X-Forwarded-Encrypted: i=1; AJvYcCWpu0X5yNbEd8/zRPVIHieaJhhKkS00Nw8NgydTOaO16dkzfODMAjgQSlAe8xu4WoyY/yGGsj8+VZXmGg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1AiKyfmmag95eLjikjoK2+AVRaA1c5YMZ2V/3WZvBh1AkoiRf
	ykvWKu6FXhcmm1ygstrnEQrDXuZ4kD+S0SB3Ws/v0jB7ldLt6XJuUihCtAam+aNvPVVLBHU9z/D
	8spE=
X-Gm-Gg: ASbGncvew+kO/LpTI8Oqnrh/i2Af8QijohXg/FjXdwGSvgV0nmZ8s24zRJ5YHqGVRqu
	TpiQdUcH32XJnL3qxlcwg/47taKxrBGtQSvn9nPN2fHdqRBpC5c1kp6H+YsCIjySpsR7qxC4liW
	h++DCGwRoTYEjJdjFqISdWhAmhTi56TEYhuYbRjJXl6od9GRNigmKQULRysDXNEcp1ihyMypSui
	NcI2odMWg6uG9vKsLsxhszaValytWH/OXX7rT/lIgEZVCPbKRygQC4H9gRssfv8QXxpZ7+Ma4UD
	yxwj7QYzrTjQdTX/0aSOp9wGcFX28dWboY3Bjf83ozhsdZFiH+ldsVBWVVwmCclxrVgj3CGB9XW
	5bLv9NEb09XrE5GH9TlnjigHS
X-Google-Smtp-Source: AGHT+IGEJt60WIoLMZBtifEB5R8NijD0rs7fn4MENGnhwex5vMpmDDUEO73YQjGoPnubG3s5tux5jg==
X-Received: by 2002:a05:6512:158a:b0:545:17d:f96b with SMTP id 2adb3069b0e04-5497d336139mr1696933e87.14.1741207513742;
        Wed, 05 Mar 2025 12:45:13 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5495e1a7304sm1199597e87.216.2025.03.05.12.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 12:45:12 -0800 (PST)
Date: Wed, 5 Mar 2025 22:45:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: quic_vgarodia@quicinc.com, quic_abhinavk@quicinc.com, 
	mchehab@kernel.org, hverkuil@xs4all.nl, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 06/12] media: iris: Update CAPTURE format info based
 on OUTPUT format
Message-ID: <zw42tgyhxedcifrad5i2gam5sbjjczcaopv4iy2fy5hckkjdsj@crawjvp7bdox>
References: <20250305104335.3629945-1-quic_dikshita@quicinc.com>
 <20250305104335.3629945-7-quic_dikshita@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305104335.3629945-7-quic_dikshita@quicinc.com>

On Wed, Mar 05, 2025 at 04:13:29PM +0530, Dikshita Agarwal wrote:
> Update the width, height and buffer size of CAPTURE based on the
> resolution set to OUTPUT via VIDIOC_S_FMT. This is required to set the
> updated capture resolution to firmware when S_FMT is called only for
> OUTPUT.
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vdec.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 

This also looks like a fix, so Fixes, cc:stable, move to the top.

-- 
With best wishes
Dmitry

