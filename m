Return-Path: <linux-media+bounces-38903-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB0CB1B092
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 11:00:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79EBD176D65
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 09:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E1EF23AB9D;
	Tue,  5 Aug 2025 09:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="otP6Yr4J"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BF7218AA3;
	Tue,  5 Aug 2025 09:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754384413; cv=none; b=MqfveCCpxkIneyo8q6XGAcqG8Sj/858ToNFa0ycem4XRnU6N9jyV86iFENx2hxax06ONRJdpqQh5ctqnVfpSFJ/uaoWnDkneoU70hxgOIst2Gjc5gKA1H9K6PUQuA2USz7sVxY0uqqfRf/Ff5g38rIwrQ5fhz+lwSGpdVUInZxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754384413; c=relaxed/simple;
	bh=Ss5+o9mGlFGpOFYaX0Rvuk2dt041GM5MzYR0NO61GJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ClTt/NQpllCffYX9RhBE5tJeKsXjRgOFCHjiJ3qQ48x/9s6/wA++7ZsRdDYGLlzPyBXYjaIjfz7hUSh7EBaWJEVOuqzanOWmxCGnvGt75Fg0gI/72Xc5O7Sluo4N7BVmOIBIV4AuJHaCwI9p+3uUyvfh/o7fhvu35vx9b8TDrFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=otP6Yr4J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 365ACC4CEF0;
	Tue,  5 Aug 2025 09:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754384412;
	bh=Ss5+o9mGlFGpOFYaX0Rvuk2dt041GM5MzYR0NO61GJk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=otP6Yr4J1pqfmmft5pQ/QcsnPJiwpUDtnQ/ghyYRPB2uJ5wtuJE2o7WKqZs0LECzB
	 Z4fnkF+Bk1rEgSXGEFKTCbB8mN9mZ6yRXwE6HGNZ2ejTTEctVYfuFd5FRDDFplrqku
	 yVlIOTR8wPkb4W1hhQNJAcugKH3dwbeYTOi0sxU8kYQv1tEmI4l2kxuA7M47p4NI6h
	 d4QA4H3c+Zrzlg+z/m6yhTuPreyCzwzuBqbhTlYsDh6gd0KumsOb6JHhAU6X5bOlqV
	 PNtnGP4URMJOFC+PIRzStMUUPyUYoB0QsdNZ9SAvRjg8Y2pI/8I86q1Le8lDsIo2cM
	 zJPXcIhHA3XgA==
Message-ID: <5c9bf027-f362-4176-b4af-bcba9aa96e0c@kernel.org>
Date: Tue, 5 Aug 2025 11:00:08 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] staging: media: atomisp: add missing mutex lock in
 atomisp_s_fmt_cap
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, andy@kernel.org, gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel-mentees@lists.linux.dev,
 skhan@linuxfoundation.org, dan.carpenter@linaro.org
References: <20250717124234.24572-1-abdelrahmanfekry375@gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20250717124234.24572-1-abdelrahmanfekry375@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 17-Jul-25 2:42 PM, Abdelrahman Fekry wrote:
> The function atomisp_set_fmt() modifies shared device state and expects
> callers to hold the isp->mutex for synchronization. While most internal
> callers correctly lock the mutex before invoking atomisp_set_fmt(), the
> V4L2 ioctl handler atomisp_s_fmt_cap() does not.
> 
> This results in an unsafe execution path for VIDIOC_S_FMT ioctls
> (e.g. via v4l2-ctl), where shared structures such as pipe->pix and
> pipe->frame_info may be modified concurrently without proper protection.
> 
> - Fix this by explicitly locking isp->mutex in atomisp_s_fmt_cap().

Thank you for your patch, but I'm afraid that this stems from
not understanding how v4l2 drivers work.

isp->mutex is set as the mutex for the /dev/video# node in:
drivers/staging/media/atomisp/pci/atomisp_v4l2.c:

int atomisp_video_init(struct atomisp_video_pipe *video)
{
	...
	video->vdev.lock = &video->isp->mutex;

This guarantees that any ioctl handlers will be called with
isp->mutex already held.

The suggested change here will result in trying to lock
the mutex a second time leading to a deadlock.

So NACK for this patch.

What would be useful is adding:

	lockdep_assert_held(&isp->mutex);

to functions which expect the mutex to be held. I regularly
test the atomisp code with lockdep enabled kernels so this
will help catch any paths where we indeed are not locking
the mutex while we should lock it.

Regards.

Hans






> 
> Fixes: 4bdab80981ca ("media: atomisp: Make it possible to call atomisp_set_fmt() without a file handle")
> Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
> ---
> v3:
> - Use guard(mutex) as suggested by Dan Carpenter and Andy Shevchenko
> - Remove extra blank line after variable declaration
> - Fix include order as requested by Andy Shevchenko
> 
> v2: https://lore.kernel.org/all/20250717013003.20936-1-abdelrahmanfekry375@gmail.com/
> - Add Fixes tag
> - use cleanup.h micros instead of explicitly calling mutex_lock/unlock
> 
> v1: https://lore.kernel.org/all/20250716014225.15279-1-abdelrahmanfekry375@gmail.com/
> ---
>  drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> index bb8b2f2213b0..2690c05afff3 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> @@ -7,6 +7,7 @@
>   * Copyright (c) 2010 Silicon Hive www.siliconhive.com.
>   */
>  
> +#include <linux/cleanup.h>
>  #include <linux/delay.h>
>  #include <linux/pci.h>
>  
> @@ -416,7 +417,9 @@ static int atomisp_s_fmt_cap(struct file *file, void *fh,
>  			     struct v4l2_format *f)
>  {
>  	struct video_device *vdev = video_devdata(file);
> +	struct atomisp_device *isp = video_get_drvdata(vdev);
>  
> +	guard(mutex)(&isp->mutex);
>  	return atomisp_set_fmt(vdev, f);
>  }
>  


