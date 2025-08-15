Return-Path: <linux-media+bounces-39997-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6A7B286D7
	for <lists+linux-media@lfdr.de>; Fri, 15 Aug 2025 22:03:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95E181CC4C54
	for <lists+linux-media@lfdr.de>; Fri, 15 Aug 2025 20:03:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 336042BD5B6;
	Fri, 15 Aug 2025 20:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B6fgctbJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D1526F44D
	for <linux-media@vger.kernel.org>; Fri, 15 Aug 2025 20:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755288194; cv=none; b=mUNpPyFeSzPxPm+7yPuwTfnYW5bniWqbDtxt+TRjLCk/ramJFO+9ud/WXDEt6GFljtLwzXMqym7wB/q8ooZfJ4hIXP0asr+zEA2cT1Z8TqvKTz/WupU0DloYglnGCYwNDLxT24hg0R6Zle0QaWRj7RXCuLFcHU5faRsWMpoF1Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755288194; c=relaxed/simple;
	bh=4STIYGI/Iyf15/bs41CGx8JzbIlb5YFgaQssWbnWL0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pcfxx0I/jlAnlYeHVf/aOs5BaNzGgmCYul6vmdtz7LmXr6v5BtcP43AfjMlq10Pkvv2XuTTmG8/8z66PhSyjQHcjOvBBXkBJ8BwM494pSmgcfKT7zO/3lvwSRrHFzQsIZ72QS5YAJblLaVR+fRQGlmY0m6ZMXGFr6vk30NavUTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B6fgctbJ; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3bb2fb3a436so729706f8f.1
        for <linux-media@vger.kernel.org>; Fri, 15 Aug 2025 13:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755288190; x=1755892990; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l2kePfzDvFml6EXYBDwWfTvZ++1LxjVURGwo9pFDf5U=;
        b=B6fgctbJFJ1lVivEsP8Ula+orcSNHuUNSyjrx32PeHIZT+wCXp5IQlFG21LfbE28+K
         xN3XowFM2EsdlGIuXDbLlbEQCguLZ24X+Zwl3b0oDM31SNBlnrH5OabPWXB+yoF9eASd
         YGxKdpTIlSFam1xZ+PjW1JSs2y1i3nuurwfDSLjawkTRXODFZPm/gqbsqw1AHHbYy7HA
         4T6rk2NuNM7NUmrhpLE3RHzvplfD9VmZu76yiyGSFWKliJfeoU92cZpZRcTfyRVBxDPC
         OtVNDvPIIaMxCkzJTWSvx2f9aiieogexAL2cBnnJjmW1uKPxxxbpbodeVV2tl1HahmSQ
         KO3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755288190; x=1755892990;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l2kePfzDvFml6EXYBDwWfTvZ++1LxjVURGwo9pFDf5U=;
        b=Lo+5KcrUlsj+AAT5+ZGvD9KSmb+5KZkU2h6HA4QfiobGTni4I1oaEa+R/FZh+iWEMV
         OS+G95y2eikJbqQ+SGvK2edbpTy1Ezu8L9CtJUU//mvSs9gBbZvMQ9bozkt+fKUkLzFL
         2E+dj8E85fZbxc4GeR+rZXLGzx48utOOB5GeXoL52oUBzcy6U1+YTnNGwL5t5RmRYFz7
         FS4xJaAon/KEty2fSNTvgi7gDX+uWkuO9+OIPXEDrNhU5r9FV+oa3KxiRbjLU/CRTDHQ
         cPr9lIqIcUvnQeTq6NOyKUc6AQ7J4jPbXL00I5J+HfB0brf55wr9rif1jjwOPDWKNhmu
         o/Ow==
X-Forwarded-Encrypted: i=1; AJvYcCVbVX6MmYp8IezBCI5hZX0oaFdXOg7VQcWpUzTzl7ugy2op/MddiETzywa99T32iVw0/2DdFuEYcnAKmA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGfJxoUVHzYO8ROyvTwycJJtoG1m/mVjGuqTcK5/vjrYjc/uQI
	xiYkCXX4pdQKZTkZgNZHQUqib4m1UuhxgXluYMcypuO4IzdBFf774ZB3pclXq9fBVwY=
X-Gm-Gg: ASbGnctZdy8iuxVkbhnPCAKP1UwVI5axeC/8tkV6LasyBQ2k9LessmZ+8rKPZs6fqFR
	uTYo//AeIN5C7+RQTI6lTZ3OfrYtVLuwoBMyaQ12hgZYWmmIHKz3gkjDM4drCfRdVJoMEPV4zfs
	lxUyJGmoJKIZUOFcHSa0RTPKl0c1Mv/7v2O8UJvJv6Lg1Fo0QSZgmF7ArMOmTYL4GLPNqYb+vng
	bGx8DCujeHN2Mz4FjzgCjLVusvYyJt+gF90FGN+n/C8zTNTpmfscanqnQ6cRWeR3CBv8G3LSQdJ
	OekU/cZqtqYL/x0beLUhCycCzT1MbrSUKdpyDwgTEuFOR0sW9PM/YaTUGL5hnLtwShq4egtDpju
	CEjXdPBdeXo3JzhrvyOJGF3O5jTM=
X-Google-Smtp-Source: AGHT+IHT14axeSHSDRiAFlW7o6Ist04KA+jLa97KTahHyBEMOM06qghEr+qt8YTS6r4n7TbhWi5LXg==
X-Received: by 2002:a5d:5d09:0:b0:3b7:899c:e867 with SMTP id ffacd0b85a97d-3bc6a83c6a5mr227506f8f.59.1755288190201;
        Fri, 15 Aug 2025 13:03:10 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3bb652f9debsm3174669f8f.28.2025.08.15.13.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 13:03:09 -0700 (PDT)
Date: Fri, 15 Aug 2025 23:03:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] staging: media: atomisp: Add lock asserts for mutex
 protection
Message-ID: <aJ-Sept8uMm2Opeq@stanley.mountain>
References: <20250815170901.32105-1-abdelrahmanfekry375@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250815170901.32105-1-abdelrahmanfekry375@gmail.com>

On Fri, Aug 15, 2025 at 08:09:01PM +0300, Abdelrahman Fekry wrote:
> Add lockdep_assert_held(&isp->mutex) to critical functions accessing
> shared device state. This enforces proper locking and detects violations.
> 
> Suggested-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
> ---
>  .../staging/media/atomisp/pci/atomisp_cmd.c   |  3 ++
>  .../media/atomisp/pci/atomisp_compat_css20.c  | 31 +++++++++++++++++++
>  2 files changed, 34 insertions(+)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> index 3a4eb4f6d3be..48ca33e1c92d 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> @@ -3794,6 +3794,7 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
>  		    const struct atomisp_format_bridge **fmt_ret,
>  		    const struct atomisp_format_bridge **snr_fmt_ret)
>  {
> +	lockdep_assert_held(&isp->mutex);

This should go after the declarations.

>  	const struct atomisp_format_bridge *fmt, *snr_fmt;
>  	struct atomisp_sub_device *asd = &isp->asd;
>  	struct v4l2_mbus_framefmt ffmt = { };
> @@ -4324,6 +4325,8 @@ static int atomisp_set_fmt_to_snr(struct video_device *vdev, const struct v4l2_p
>  int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
>  {
>  	struct atomisp_device *isp = video_get_drvdata(vdev);
> +	lockdep_assert_held(&isp->mutex);

Same.  Etc...

> +
>  	struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
>  	struct atomisp_sub_device *asd = pipe->asd;
>  	const struct atomisp_format_bridge *format_bridge;

[ snip ]

> @@ -1726,6 +1746,10 @@ int atomisp_css_input_configure_port(
>  {
>  	int i;
>  	struct atomisp_stream_env *stream_env;
> +

No blank line here.

> +	struct atomisp_device *isp = asd->isp;
> +
> +	lockdep_assert_held(&isp->mutex);
>  	/*
>  	 * Calculate rx_count as follows:
>  	 * Input: mipi_freq                 : CSI-2 bus frequency in Hz

regards,
dan carpenter

