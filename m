Return-Path: <linux-media+bounces-40211-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FE6B2B529
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 01:59:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1088526CB9
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 23:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B753B27CCF0;
	Mon, 18 Aug 2025 23:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gFnuselq"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402C81EB5B;
	Mon, 18 Aug 2025 23:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755561573; cv=none; b=k8g0qMR1AwA2NAz811Es+1QnVlovYJw+sVijgqJ8T/pn8DXLZaiBoYO+ZKji4Qy/l/Zpp8rqw+IibBoPEcG1c/Gkm6eLkUuRIyjls9I4m9KvrLE0cSwmcgHohukFxYaoQfwLMk8Xs3MkPR7l8ih8luAZ8EvaAfG8V0bx7uveooc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755561573; c=relaxed/simple;
	bh=kLg7XbYIsk9Q7gmAQl8rX7a/NLVyPEC6NZAox6CGTm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z1ctfnQFIJay2rb9B/q4/XJY2Q5evndqFui4nhaAI8p9m5hnCGCl4M230Dc1gfWQ/gD9tpSTolDwy9lgj9NcGSW/MGPZ9VXElZaMZ0u5qU6VcF9u6AE9DQJkY17vhoRfFXrTOKgYOJrUw5ljQcP60G7+Ebb188gtdVDbIPJC2ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gFnuselq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 8E8DDC6D;
	Tue, 19 Aug 2025 01:58:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755561511;
	bh=kLg7XbYIsk9Q7gmAQl8rX7a/NLVyPEC6NZAox6CGTm4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gFnuselqMyrKeAnAzHveK3dtBfn8bkgX6bdU7LhEzHw4W/qyM/hdFy4IwOfRM0O9A
	 1ICJ4BzrI34GewR8tXvT/492PBFaly+cUDtihJWjq0Rv3WFUEg6ePrvBh2xI89xna+
	 h0b43taL5ZgECPA9Ya3tlE3OwkidnLoZRfgjjxEI=
Date: Tue, 19 Aug 2025 02:59:06 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Andy Walls <awalls@md.metrocast.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>, stable@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] media: ivtv: Fix invalid access to file *
Message-ID: <20250818235906.GC10308@pendragon.ideasonboard.com>
References: <20250818-cx18-v4l2-fh-v3-0-5e2f08f3cadc@ideasonboard.com>
 <20250818-cx18-v4l2-fh-v3-2-5e2f08f3cadc@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250818-cx18-v4l2-fh-v3-2-5e2f08f3cadc@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Mon, Aug 18, 2025 at 10:39:37PM +0200, Jacopo Mondi wrote:
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
> functions.

You may want to reword this in a similar way as proposed in 1/2.

> 
> The ivtv_do_s_input() helper accepts a struct ivtv * as first argument,
> which is easily accessible from the DVB layer as well as from the file *
> argument of the ioctl handler.
> 
> The ivtv_s_frequency() takes an ivtv_stream * instead. The stream * can
> safely be accessed from the DVB layer which hard-codes it to the
> IVTV_ENC_STREAM_TYPE_MPG stream type, as well as from the ioctl handler
> a valid stream type is associated to each open file handle depending on
> which video device node has been opened in the ivtv_open() file
> operation.
> 
> The bug has been reported by Smatch.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/aKL4OMWsESUdX8KQ@stanley.mountain/
> Fixes: 9ba9d11544f9 ("media: ivtv: Access v4l2_fh from file")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/pci/ivtv/ivtv-driver.c | 11 ++++-------
>  drivers/media/pci/ivtv/ivtv-ioctl.c  | 22 +++++++++++++++++-----
>  drivers/media/pci/ivtv/ivtv-ioctl.h  |  6 ++++--
>  3 files changed, 25 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/pci/ivtv/ivtv-driver.c b/drivers/media/pci/ivtv/ivtv-driver.c
> index ecc20cd89926fe2ce4e472526a6b5fc0857615dd..7e2fb98cfccf02f701ceb4484dd1d330dd1dc867 100644
> --- a/drivers/media/pci/ivtv/ivtv-driver.c
> +++ b/drivers/media/pci/ivtv/ivtv-driver.c
> @@ -1260,15 +1260,12 @@ static int ivtv_probe(struct pci_dev *pdev, const struct pci_device_id *pci_id)
>  
>  int ivtv_init_on_first_open(struct ivtv *itv)
>  {
> -	struct v4l2_frequency vf;
>  	/* Needed to call ioctls later */

I'd drop the comment.

> -	struct ivtv_open_id fh;
> +	struct ivtv_stream *s = &itv->streams[IVTV_ENC_STREAM_TYPE_MPG];
> +	struct v4l2_frequency vf;
>  	int fw_retry_count = 3;
>  	int video_input;
>  
> -	fh.itv = itv;
> -	fh.type = IVTV_ENC_STREAM_TYPE_MPG;
> -
>  	if (test_bit(IVTV_F_I_FAILED, &itv->i_flags))
>  		return -ENXIO;
>  
> @@ -1310,13 +1307,13 @@ int ivtv_init_on_first_open(struct ivtv *itv)
>  
>  	video_input = itv->active_input;
>  	itv->active_input++;	/* Force update of input */
> -	ivtv_s_input(NULL, &fh, video_input);
> +	ivtv_do_s_input(itv, video_input);
>  
>  	/* Let the VIDIOC_S_STD ioctl do all the work, keeps the code
>  	   in one place. */
>  	itv->std++;		/* Force full standard initialization */
>  	itv->std_out = itv->std;
> -	ivtv_s_frequency(NULL, &fh, &vf);
> +	ivtv_do_s_frequency(s, &vf);

	ivtv_do_s_frequency(&itv->streams[IVTV_ENC_STREAM_TYPE_MPG], &vf);

would work too. Up to you.

>  
>  	if (itv->card->v4l2_capabilities & V4L2_CAP_VIDEO_OUTPUT) {
>  		/* Turn on the TV-out: ivtv_init_mpeg_decoder() initializes
> diff --git a/drivers/media/pci/ivtv/ivtv-ioctl.c b/drivers/media/pci/ivtv/ivtv-ioctl.c
> index 8077a71d4850ec773caa20c3fca08f92f3117d69..dfbc842b22453868a2075935a81db7ae313ee46c 100644
> --- a/drivers/media/pci/ivtv/ivtv-ioctl.c
> +++ b/drivers/media/pci/ivtv/ivtv-ioctl.c
> @@ -974,9 +974,8 @@ static int ivtv_g_input(struct file *file, void *fh, unsigned int *i)
>  	return 0;
>  }
>  
> -int ivtv_s_input(struct file *file, void *fh, unsigned int inp)
> +int ivtv_do_s_input(struct ivtv *itv, unsigned int inp)
>  {
> -	struct ivtv *itv = file2id(file)->itv;
>  	v4l2_std_id std;
>  	int i;
>  
> @@ -1017,6 +1016,11 @@ int ivtv_s_input(struct file *file, void *fh, unsigned int inp)
>  	return 0;
>  }
>  
> +static int ivtv_s_input(struct file *file, void *fh, unsigned int inp)
> +{
> +	return ivtv_do_s_input(file2id(file)->itv, inp);
> +}
> +
>  static int ivtv_g_output(struct file *file, void *fh, unsigned int *i)
>  {
>  	struct ivtv *itv = file2id(file)->itv;
> @@ -1065,10 +1069,9 @@ static int ivtv_g_frequency(struct file *file, void *fh, struct v4l2_frequency *
>  	return 0;
>  }
>  
> -int ivtv_s_frequency(struct file *file, void *fh, const struct v4l2_frequency *vf)
> +int ivtv_do_s_frequency(struct ivtv_stream *s, const struct v4l2_frequency *vf)
>  {
> -	struct ivtv *itv = file2id(file)->itv;
> -	struct ivtv_stream *s = &itv->streams[file2id(file)->type];
> +	struct ivtv *itv = s->itv;
>  
>  	if (s->vdev.vfl_dir)
>  		return -ENOTTY;
> @@ -1082,6 +1085,15 @@ int ivtv_s_frequency(struct file *file, void *fh, const struct v4l2_frequency *v
>  	return 0;
>  }
>  
> +static int ivtv_s_frequency(struct file *file, void *fh,
> +			    const struct v4l2_frequency *vf)
> +{
> +	struct ivtv_open_id *id = file2id(file);
> +	struct ivtv *itv = id->itv;
> +
> +	return ivtv_do_s_frequency(&itv->streams[id->type], vf);
> +}
> +
>  static int ivtv_g_std(struct file *file, void *fh, v4l2_std_id *std)
>  {
>  	struct ivtv *itv = file2id(file)->itv;
> diff --git a/drivers/media/pci/ivtv/ivtv-ioctl.h b/drivers/media/pci/ivtv/ivtv-ioctl.h
> index 42c2516379fcbbd0640820ab0e3abe9bf00b57ea..dd713a6b095e5ebca45a234dd6c9a90df0928596 100644
> --- a/drivers/media/pci/ivtv/ivtv-ioctl.h
> +++ b/drivers/media/pci/ivtv/ivtv-ioctl.h
> @@ -17,7 +17,9 @@ int ivtv_set_speed(struct ivtv *itv, int speed);
>  void ivtv_set_funcs(struct video_device *vdev);
>  void ivtv_s_std_enc(struct ivtv *itv, v4l2_std_id std);
>  void ivtv_s_std_dec(struct ivtv *itv, v4l2_std_id std);
> -int ivtv_s_frequency(struct file *file, void *fh, const struct v4l2_frequency *vf);
> -int ivtv_s_input(struct file *file, void *fh, unsigned int inp);
> +
> +struct ivtv;

I'd drop this, as the structure is already used above.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> +int ivtv_do_s_frequency(struct ivtv_stream *s, const struct v4l2_frequency *vf);
> +int ivtv_do_s_input(struct ivtv *itv, unsigned int inp);
>  
>  #endif
> 

-- 
Regards,

Laurent Pinchart

