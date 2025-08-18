Return-Path: <linux-media+bounces-40155-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A33B2A4C1
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 15:25:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C114628087
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 13:18:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0889B32275A;
	Mon, 18 Aug 2025 13:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tu+7gXqE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739E633472D;
	Mon, 18 Aug 2025 13:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755522939; cv=none; b=YFAB5SiS59+7a8PLS048J1VnkeyKknGSSViYBtRb9nnZ4FQtEQnj6qJMLkJD7hVzvtyXrK4rYSsL1XaRKHhM6xMOIVdrW+oFd1MfrFcFsAfo8TH9NUZpLVP0epjmE7FGsl6tW4PnFifuUtRNIxTAQndVrA+hhmA3zO3/+zNrqHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755522939; c=relaxed/simple;
	bh=mLd7BZogqKcenILnPCzuRX50DR7oIy0Az02q9N/0AGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AHzf+m1OssPYN77+ILGIpyYEAqES5VXHsAkxYwfIby89iAStPWNTwLLokKrAehFOjb+MoVpDyxnwP8NtauKw4DdWA5kninLFCMA2Qm75vfbgGgX3DcK7vb0u8wBdfiZMi9QLU1zU9VN7om3aFcUT4vdELQt92gyyViNZ+gmNn/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tu+7gXqE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id E2C671249;
	Mon, 18 Aug 2025 15:14:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755522879;
	bh=mLd7BZogqKcenILnPCzuRX50DR7oIy0Az02q9N/0AGE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tu+7gXqEIdN9xZeZ/GM9Ce2Sf2/dCS6rSTP9l4dP+zgHdqkeEazgH6Uaxk7wXhb6Q
	 bWg8e87DRKgFwAVU60wbf0ocILyCxvld9ABPUQHCSVlnrTDtG8MmVXGpN/96HXOgvt
	 2X/hpIWd1tqPNeFLdnOPEfZWirn4WQpH0Uwys2d4=
Date: Mon, 18 Aug 2025 16:15:14 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Andy Walls <awalls@md.metrocast.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>, stable@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: ivtv: Fix invalid access to file *
Message-ID: <20250818131514.GE5862@pendragon.ideasonboard.com>
References: <20250818-cx18-v4l2-fh-v2-0-3f53ce423663@ideasonboard.com>
 <20250818-cx18-v4l2-fh-v2-2-3f53ce423663@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250818-cx18-v4l2-fh-v2-2-3f53ce423663@ideasonboard.com>

On Mon, Aug 18, 2025 at 03:06:36PM +0200, Jacopo Mondi wrote:
> Since commit 9ba9d11544f9 ("media: ivtv: Access v4l2_fh from file")
> all ioctl handlers have been ported to operate on the file * first
> function argument.
> 
> The ivtv DVB layer calls ivtv_init_on_first_open() when the driver
> needs to start streaming. This function calls the s_input() and
> s_frequency() ioctl handlers directly, but being called from the driver
> context, it doesn't have a valid file * to pass them. This causes the
> ioctl handlers to deference an invalid pointer.
> 
> Fix this by wrapping the ioctl handlers implementation in helper
> functions which accepts a ivtv_open_id pointer as first argument
> and make the ivtv_init_on_first_open() function call the helpers
> without going through the ioctl handlers.
> 
> The bug has been reported by Smatch.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/aKL4OMWsESUdX8KQ@stanley.mountain/
> Fixes: 9ba9d11544f9 ("media: ivtv: Access v4l2_fh from file")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/pci/ivtv/ivtv-driver.c |  4 ++--
>  drivers/media/pci/ivtv/ivtv-ioctl.c  | 22 +++++++++++++++++-----
>  drivers/media/pci/ivtv/ivtv-ioctl.h  |  6 ++++--
>  3 files changed, 23 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/pci/ivtv/ivtv-driver.c b/drivers/media/pci/ivtv/ivtv-driver.c
> index ecc20cd89926fe2ce4e472526a6b5fc0857615dd..bcbb03271047df9b127039759dbfefbaae67f9c3 100644
> --- a/drivers/media/pci/ivtv/ivtv-driver.c
> +++ b/drivers/media/pci/ivtv/ivtv-driver.c
> @@ -1310,13 +1310,13 @@ int ivtv_init_on_first_open(struct ivtv *itv)
>  
>  	video_input = itv->active_input;
>  	itv->active_input++;	/* Force update of input */
> -	ivtv_s_input(NULL, &fh, video_input);
> +	ivtv_do_s_input(&fh, video_input);
>  
>  	/* Let the VIDIOC_S_STD ioctl do all the work, keeps the code
>  	   in one place. */
>  	itv->std++;		/* Force full standard initialization */
>  	itv->std_out = itv->std;
> -	ivtv_s_frequency(NULL, &fh, &vf);
> +	ivtv_do_s_frequency(&fh, &vf);
>  
>  	if (itv->card->v4l2_capabilities & V4L2_CAP_VIDEO_OUTPUT) {
>  		/* Turn on the TV-out: ivtv_init_mpeg_decoder() initializes
> diff --git a/drivers/media/pci/ivtv/ivtv-ioctl.c b/drivers/media/pci/ivtv/ivtv-ioctl.c
> index 8077a71d4850ec773caa20c3fca08f92f3117d69..ba1fce42a8d6d7d9a3779bfc9dfd310060e61103 100644
> --- a/drivers/media/pci/ivtv/ivtv-ioctl.c
> +++ b/drivers/media/pci/ivtv/ivtv-ioctl.c
> @@ -974,9 +974,9 @@ static int ivtv_g_input(struct file *file, void *fh, unsigned int *i)
>  	return 0;
>  }
>  
> -int ivtv_s_input(struct file *file, void *fh, unsigned int inp)
> +int ivtv_do_s_input(struct ivtv_open_id *id, unsigned int inp)
>  {
> -	struct ivtv *itv = file2id(file)->itv;
> +	struct ivtv *itv = id->itv;
>  	v4l2_std_id std;
>  	int i;
>  
> @@ -1017,6 +1017,11 @@ int ivtv_s_input(struct file *file, void *fh, unsigned int inp)
>  	return 0;
>  }
>  
> +static int ivtv_s_input(struct file *file, void *fh, unsigned int inp)
> +{
> +	return ivtv_do_s_input(file2id(file), inp);
> +}
> +
>  static int ivtv_g_output(struct file *file, void *fh, unsigned int *i)
>  {
>  	struct ivtv *itv = file2id(file)->itv;
> @@ -1065,10 +1070,11 @@ static int ivtv_g_frequency(struct file *file, void *fh, struct v4l2_frequency *
>  	return 0;
>  }
>  
> -int ivtv_s_frequency(struct file *file, void *fh, const struct v4l2_frequency *vf)
> +int ivtv_do_s_frequency(struct ivtv_open_id *id,
> +			const struct v4l2_frequency *vf)
>  {
> -	struct ivtv *itv = file2id(file)->itv;
> -	struct ivtv_stream *s = &itv->streams[file2id(file)->type];
> +	struct ivtv *itv = id->itv;
> +	struct ivtv_stream *s = &itv->streams[id->type];

Same comments as for 1/2. Additionally, you can pass the ivtv_stream
pointer to this function, either along with the ivtv pointer, or alone
as you can access ivtv through s->itv.

>  
>  	if (s->vdev.vfl_dir)
>  		return -ENOTTY;
> @@ -1082,6 +1088,12 @@ int ivtv_s_frequency(struct file *file, void *fh, const struct v4l2_frequency *v
>  	return 0;
>  }
>  
> +static int ivtv_s_frequency(struct file *file, void *fh,
> +			    const struct v4l2_frequency *vf)
> +{
> +	return ivtv_do_s_frequency(file2id(file), vf);
> +}
> +
>  static int ivtv_g_std(struct file *file, void *fh, v4l2_std_id *std)
>  {
>  	struct ivtv *itv = file2id(file)->itv;
> diff --git a/drivers/media/pci/ivtv/ivtv-ioctl.h b/drivers/media/pci/ivtv/ivtv-ioctl.h
> index 42c2516379fcbbd0640820ab0e3abe9bf00b57ea..7c91b8963b420761c2afcab1dece4d19a4ec0322 100644
> --- a/drivers/media/pci/ivtv/ivtv-ioctl.h
> +++ b/drivers/media/pci/ivtv/ivtv-ioctl.h
> @@ -17,7 +17,9 @@ int ivtv_set_speed(struct ivtv *itv, int speed);
>  void ivtv_set_funcs(struct video_device *vdev);
>  void ivtv_s_std_enc(struct ivtv *itv, v4l2_std_id std);
>  void ivtv_s_std_dec(struct ivtv *itv, v4l2_std_id std);
> -int ivtv_s_frequency(struct file *file, void *fh, const struct v4l2_frequency *vf);
> -int ivtv_s_input(struct file *file, void *fh, unsigned int inp);
> +
> +struct ivtv_open_id;
> +int ivtv_do_s_frequency(struct ivtv_open_id *id, const struct v4l2_frequency *vf);
> +int ivtv_do_s_input(struct ivtv_open_id *id, unsigned int inp);
>  
>  #endif
> 

-- 
Regards,

Laurent Pinchart

