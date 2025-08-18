Return-Path: <linux-media+bounces-40086-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D69B29984
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 08:16:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 350B01891E5E
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 06:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CD192741CB;
	Mon, 18 Aug 2025 06:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vwIdRPBI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640181A5B8B
	for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 06:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755497747; cv=none; b=W7MgSbezWk189KnUorOsGEGDzfYrU458G9EpiLonqgAJSxTQicgCPRTEcqlM9nrnBzKQDYe0T8GcEMsPCMXtiIGvlK/9wdycgL85XpURobYnijB32nkTTpYUYFFT+lG4wkReCXJUjTvm0Wte/MWMVzdRRHBTjai7Pk2FKj996lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755497747; c=relaxed/simple;
	bh=MYHptY7qVMdCeYExxbFTjOvHEMfmgG75pzPebFLBE6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qJc9ZW4gSVcam9i0nLEZYHrKSy0lXIS3U71LA67rjDpzFVb95jWtJ4BoQa5p5o/vt2/jH0JAHl9V47ZFgMg2X6ZlNh1/n081KvG++EhSEiGVonnj2THnkMcq/Mv5jBkFGEMtiol6/bSR8S+v5rVrpAgTiDazI/C8fbfBWoQEHs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vwIdRPBI; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3b9e418ba08so2123407f8f.3
        for <linux-media@vger.kernel.org>; Sun, 17 Aug 2025 23:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755497743; x=1756102543; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+PSsAQl2WRt5OEtha/zrB/DgNNONu4LNMZgefW2fQN0=;
        b=vwIdRPBIXyJyX4c8i7e5xek5IySSN81+B93ujq9hWLfGQa+1vgtekgEw+DUNC2oW0W
         yugIWwWH1VbFjnqFzywZCMTSJKzqsDIgSqIjZQvRo5Nro0X92RunUIweXEI8Y3sbNUST
         HnKF5vZTwjq35aAwa/NY5mJj4XAdCxXcNmZ/2ogB70zj9qondKjCTL1NJ7eDwuFoOdVb
         aG7MJ227e8VEuRtInXYTq702kp9X8qzpa6oDAzB1oUs8UnY1rZnlos/hZPT3cq05Bbpa
         b4VVnvVi2rvM8EnWibqBRLv0FgSHLf4QXx8SUooInwg7DuhAKOYH6bSNaPCEhOesl1L0
         /5IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755497743; x=1756102543;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+PSsAQl2WRt5OEtha/zrB/DgNNONu4LNMZgefW2fQN0=;
        b=JTzZm/8heLjt2ytHEwuCW6jZgScKfF+iW2wkhza5XpRkz9/EWsPC2USW76LFYfOTBr
         m41KkR/WPrrr5TKILyf7G2bjSGjnXyFTYNsDXoeF2mda94PK+avz4jc5CRz9abMrYRL3
         JaX4ImGpwcrjzFHtUOkTjvTPt6wn+1YsGnzOxRsV4yT8grOjUjiuukaa6HmxvPU1NDvM
         LTepSJXKhSaQjPvAIhunRx0H2lhJFXIM/RUe50mqmVehcxumyMxkG+cn8+xDZzOECEzk
         Jrlh9h8hb3jniWyrnh1klVrMZlnB/snEzL2STMlgLqGW/RbVerNOCwjO1X8WA/m7OZgo
         IGhg==
X-Forwarded-Encrypted: i=1; AJvYcCVrPL0tBadu36yF3ZBzZqjI/Pqz09CQEhcMOW0HHSkFGHqOkgqaDGYHD/cEgOotH23+LJf1tr5iZEeHcg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBc08mPK3p9/j9SHKPAp+a40Tp2WvDc+I+RQ7j299SlJUAqxY9
	iUfIc8hMDpmqlm9q6d3Sq0T0bD277UJyriNUxxtE6cGQE6S5pQHnIDVpAPBBo5CC9P4=
X-Gm-Gg: ASbGnctUA4L4AG5RGD47p6OxScXldZNqgqSxXccADBy2G0q41VNVU2pWrUUWe/M/fTB
	83zlTnNecYRHB6tEQYvXjRFzBIwyfmQSacG82BEGIkOmRmHPmCTIkLngmf5rPn3+CRAIUYddqSo
	YPK7kvhXkK6HX+9BxUIxjB2oCMbgnmRp5k5AGLsi45MInK+QyOQiK5zTcreWbCM+U4GYASgiYj9
	BEoIYidQf8HU8tNnD0qhfN9iwtDuRyixlOqdKor5YakX4pu0IxiMNDg8J50NdO0Q/ChNcy+1ec+
	WKCd8xcLePb9dUGC+pZpwLv0WIoncJYpGgdyKjDZzx8Pz27c/+gMezxUNEEtThOYW4bFukG2Xw/
	sPr9XD6jWnpxe0JTVANuB3S4d7IgFW44+Uiu94GZ/GDQ=
X-Google-Smtp-Source: AGHT+IG09uXnf83+BxfTTXuZFbE6IWpXIJALIrxVKeBEh/KVAHcmGhBFx2Xg2Z9xfz9OU41mjepSqQ==
X-Received: by 2002:a5d:5f54:0:b0:3b7:9af4:9c93 with SMTP id ffacd0b85a97d-3bc6a55e8cbmr5720130f8f.35.1755497742661;
        Sun, 17 Aug 2025 23:15:42 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45a1ce9758asm155462025e9.15.2025.08.17.23.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 23:15:42 -0700 (PDT)
Date: Mon, 18 Aug 2025 09:15:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v3] staging: media: atomisp: Add lock asserts for various
 functions
Message-ID: <aKLFCjIEEbEUqEXK@stanley.mountain>
References: <20250816170603.41051-1-abdelrahmanfekry375@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250816170603.41051-1-abdelrahmanfekry375@gmail.com>

On Sat, Aug 16, 2025 at 08:06:03PM +0300, Abdelrahman Fekry wrote:
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> index be5f37f4a6fd..03067479dd69 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> @@ -1447,9 +1447,11 @@ int atomisp_css_input_set_resolution(struct atomisp_sub_device *asd,
>  				     enum atomisp_input_stream_id stream_id,
>  				     struct v4l2_mbus_framefmt *ffmt)
>  {
> +	struct atomisp_device *isp = asd->isp;
>  	struct ia_css_stream_config *s_config =
> -		    &asd->stream_env[stream_id].stream_config;
> +	&asd->stream_env[stream_id].stream_config;

Don't delete this whitespace.

regards,
dan carpenter


