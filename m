Return-Path: <linux-media+bounces-44416-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5203ABD9745
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 14:53:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0C6724E140F
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 12:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DDEE313530;
	Tue, 14 Oct 2025 12:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PhVslwbw"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09F719F135;
	Tue, 14 Oct 2025 12:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760446384; cv=none; b=TVnDAcXOTmhQPZqzcz9ctNsQONX5+yveTUn94w5n1pTL7xQyDOVrJfpAkC7PwpTlNQOiFr/K7AJGztBirNfdQzzFnoA8EM25QJOj11NPDiQpfyelLm/Qv6ouRL9Hc8q+lC5QR8N9hvC7fwbepIRoAJ5jYtFtUTtUOQCuTarux2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760446384; c=relaxed/simple;
	bh=3GR/5lTiZpzFVFt2Z1xJkc1y4Tls8IQavDcFRWUvTRc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=byg8ZJNcKWbthBLII1PFc/886M3lH5WbNaqhwqFMP4zDSIE2DPHcJLjJ10hOYYcSbq3iYRCWRzLWgi4jltY3MhU/TrGiWjjTjLvZ0eA9dd2mKWKpAjnYwkfjL2Tmr7xwbZ/ZG9QPmaUU/uqW1XhaRD9lFcGQV5CVuutRcC7e9ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PhVslwbw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA73DC4CEE7;
	Tue, 14 Oct 2025 12:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760446384;
	bh=3GR/5lTiZpzFVFt2Z1xJkc1y4Tls8IQavDcFRWUvTRc=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=PhVslwbwgYifj4TIVXipJqxqzCyBnRxQoMTQEtIrZNOMTYC5cYVPAp09chqJHy8Hw
	 bWPh7v/B0uN9wjnh5pbl97WEpIiuDOfEU/dZJivv6Im3lUEHYygQIdShsu1H8jQSz5
	 hxpvviXxGu2hP/YOuJwMTsaIZQimcBjeXJeu+2MepaJwWMuqi61xt8ID0eN/qrYvan
	 SPpVWHBNbITy0pwyzLHRIjhTeNvtM+TGa8bkUVd/OCVeHT5426N4DRJTITqWWvt4aX
	 vCb9GTfxcW1oDcRGI6PSeGbFF5CgrbTWGWU7iXXh/VYJjhiHvJm7mQRu3nFPepM1Lm
	 ZTLCaE97Vd1SQ==
Message-ID: <54a970ec-6c06-4544-babb-7ad30a011ad9@kernel.org>
Date: Tue, 14 Oct 2025 14:53:01 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v4 1/2] media: cx18: Fix invalid access to file *
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Andy Walls <awalls@md.metrocast.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, stable@vger.kernel.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250819-cx18-v4l2-fh-v4-0-9db1635d6787@ideasonboard.com>
 <20250819-cx18-v4l2-fh-v4-1-9db1635d6787@ideasonboard.com>
Content-Language: en-US, nl
In-Reply-To: <20250819-cx18-v4l2-fh-v4-1-9db1635d6787@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/08/2025 09:07, Jacopo Mondi wrote:
> Sice commit 7b9eb53e8591 ("media: cx18: Access v4l2_fh from file")
> all ioctl handlers have been ported to operate on the file * first
> function argument.
> 
> The cx18 DVB layer calls cx18_init_on_first_open() when the driver needs
> to start streaming. This function calls the s_input(), s_std() and
> s_frequency() ioctl handlers directly, but being called from the driver
> context, it doesn't have a valid file * to pass them. This causes
> the ioctl handlers to deference an invalid pointer.
> 
> Fix this by moving the implementation of those ioctls to functions that
> take a cx18 pointer instead of a file pointer, and turn the V4L2 ioctl
> handlers into wrappers that get the cx18 from the file. When calling
> from cx18_init_on_first_open(), pass the cx18 pointer directly. This
> allows removing the fake fh in cx18_init_on_first_open().
> 
> The bug has been reported by Smatch:
> 
> --> 1223         cx18_s_input(NULL, &fh, video_input);
> The patch adds a new dereference of "file" but some of the callers pass a
> NULL pointer.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/aKL4OMWsESUdX8KQ@stanley.mountain/
> Fixes: 7b9eb53e8591 ("media: cx18: Access v4l2_fh from file")
> Cc: stable@vger.kernel.org
> Link: https://lore.kernel.org/stable/20250818-cx18-v4l2-fh-v1-1-6fe153760bce%40ideasonboard.com
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Tested-by: Hans Verkuil <hverkuil+cisco@kernel.org>

Regards,

	Hans

> ---
>  drivers/media/pci/cx18/cx18-driver.c |  9 +++------
>  drivers/media/pci/cx18/cx18-ioctl.c  | 30 +++++++++++++++++++-----------
>  drivers/media/pci/cx18/cx18-ioctl.h  |  8 +++++---
>  3 files changed, 27 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/media/pci/cx18/cx18-driver.c b/drivers/media/pci/cx18/cx18-driver.c
> index 743fcc9613744bfc1edeffc51e908fe88520405a..cd84dfcefcf971a7adb9aac2bafb9089dbe0f33f 100644
> --- a/drivers/media/pci/cx18/cx18-driver.c
> +++ b/drivers/media/pci/cx18/cx18-driver.c
> @@ -1136,11 +1136,8 @@ int cx18_init_on_first_open(struct cx18 *cx)
>  	int video_input;
>  	int fw_retry_count = 3;
>  	struct v4l2_frequency vf;
> -	struct cx18_open_id fh;
>  	v4l2_std_id std;
>  
> -	fh.cx = cx;
> -
>  	if (test_bit(CX18_F_I_FAILED, &cx->i_flags))
>  		return -ENXIO;
>  
> @@ -1220,14 +1217,14 @@ int cx18_init_on_first_open(struct cx18 *cx)
>  
>  	video_input = cx->active_input;
>  	cx->active_input++;	/* Force update of input */
> -	cx18_s_input(NULL, &fh, video_input);
> +	cx18_do_s_input(cx, video_input);
>  
>  	/* Let the VIDIOC_S_STD ioctl do all the work, keeps the code
>  	   in one place. */
>  	cx->std++;		/* Force full standard initialization */
>  	std = (cx->tuner_std == V4L2_STD_ALL) ? V4L2_STD_NTSC_M : cx->tuner_std;
> -	cx18_s_std(NULL, &fh, std);
> -	cx18_s_frequency(NULL, &fh, &vf);
> +	cx18_do_s_std(cx, std);
> +	cx18_do_s_frequency(cx, &vf);
>  	return 0;
>  }
>  
> diff --git a/drivers/media/pci/cx18/cx18-ioctl.c b/drivers/media/pci/cx18/cx18-ioctl.c
> index bf16d36448f888d9326b5f4a8f9c8f0e13d0c3a1..6e869c43cbd520feb720a71d8eb2dd60c05b0ae9 100644
> --- a/drivers/media/pci/cx18/cx18-ioctl.c
> +++ b/drivers/media/pci/cx18/cx18-ioctl.c
> @@ -521,10 +521,8 @@ static int cx18_g_input(struct file *file, void *fh, unsigned int *i)
>  	return 0;
>  }
>  
> -int cx18_s_input(struct file *file, void *fh, unsigned int inp)
> +int cx18_do_s_input(struct cx18 *cx, unsigned int inp)
>  {
> -	struct cx18_open_id *id = file2id(file);
> -	struct cx18 *cx = id->cx;
>  	v4l2_std_id std = V4L2_STD_ALL;
>  	const struct cx18_card_video_input *card_input =
>  				cx->card->video_inputs + inp;
> @@ -558,6 +556,11 @@ int cx18_s_input(struct file *file, void *fh, unsigned int inp)
>  	return 0;
>  }
>  
> +static int cx18_s_input(struct file *file, void *fh, unsigned int inp)
> +{
> +	return cx18_do_s_input(file2id(file)->cx, inp);
> +}
> +
>  static int cx18_g_frequency(struct file *file, void *fh,
>  				struct v4l2_frequency *vf)
>  {
> @@ -570,11 +573,8 @@ static int cx18_g_frequency(struct file *file, void *fh,
>  	return 0;
>  }
>  
> -int cx18_s_frequency(struct file *file, void *fh, const struct v4l2_frequency *vf)
> +int cx18_do_s_frequency(struct cx18 *cx, const struct v4l2_frequency *vf)
>  {
> -	struct cx18_open_id *id = file2id(file);
> -	struct cx18 *cx = id->cx;
> -
>  	if (vf->tuner != 0)
>  		return -EINVAL;
>  
> @@ -585,6 +585,12 @@ int cx18_s_frequency(struct file *file, void *fh, const struct v4l2_frequency *v
>  	return 0;
>  }
>  
> +static int cx18_s_frequency(struct file *file, void *fh,
> +			    const struct v4l2_frequency *vf)
> +{
> +	return cx18_do_s_frequency(file2id(file)->cx, vf);
> +}
> +
>  static int cx18_g_std(struct file *file, void *fh, v4l2_std_id *std)
>  {
>  	struct cx18 *cx = file2id(file)->cx;
> @@ -593,11 +599,8 @@ static int cx18_g_std(struct file *file, void *fh, v4l2_std_id *std)
>  	return 0;
>  }
>  
> -int cx18_s_std(struct file *file, void *fh, v4l2_std_id std)
> +int cx18_do_s_std(struct cx18 *cx, v4l2_std_id std)
>  {
> -	struct cx18_open_id *id = file2id(file);
> -	struct cx18 *cx = id->cx;
> -
>  	if ((std & V4L2_STD_ALL) == 0)
>  		return -EINVAL;
>  
> @@ -642,6 +645,11 @@ int cx18_s_std(struct file *file, void *fh, v4l2_std_id std)
>  	return 0;
>  }
>  
> +static int cx18_s_std(struct file *file, void *fh, v4l2_std_id std)
> +{
> +	return cx18_do_s_std(file2id(file)->cx, std);
> +}
> +
>  static int cx18_s_tuner(struct file *file, void *fh, const struct v4l2_tuner *vt)
>  {
>  	struct cx18_open_id *id = file2id(file);
> diff --git a/drivers/media/pci/cx18/cx18-ioctl.h b/drivers/media/pci/cx18/cx18-ioctl.h
> index 221e2400fb3e2d817eaff7515fa89eb94f2d7f8a..7a42ac99312ab6502e1abe4f3d5c88c9c7f144f3 100644
> --- a/drivers/media/pci/cx18/cx18-ioctl.h
> +++ b/drivers/media/pci/cx18/cx18-ioctl.h
> @@ -12,6 +12,8 @@ u16 cx18_service2vbi(int type);
>  void cx18_expand_service_set(struct v4l2_sliced_vbi_format *fmt, int is_pal);
>  u16 cx18_get_service_set(struct v4l2_sliced_vbi_format *fmt);
>  void cx18_set_funcs(struct video_device *vdev);
> -int cx18_s_std(struct file *file, void *fh, v4l2_std_id std);
> -int cx18_s_frequency(struct file *file, void *fh, const struct v4l2_frequency *vf);
> -int cx18_s_input(struct file *file, void *fh, unsigned int inp);
> +
> +struct cx18;
> +int cx18_do_s_std(struct cx18 *cx, v4l2_std_id std);
> +int cx18_do_s_frequency(struct cx18 *cx, const struct v4l2_frequency *vf);
> +int cx18_do_s_input(struct cx18 *cx, unsigned int inp);
> 


