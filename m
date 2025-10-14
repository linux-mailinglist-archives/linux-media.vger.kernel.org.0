Return-Path: <linux-media+bounces-44412-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E82DBD95AB
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 14:34:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21C8B541F87
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 12:34:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA6BD313551;
	Tue, 14 Oct 2025 12:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gQF0Y6dc"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0DD2DE1E5;
	Tue, 14 Oct 2025 12:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760445253; cv=none; b=EjHtIjhaKt7aAjMEEg9H4VEPbm6SeHRRR0NyD/o5F/lewtBkeyqorm4BXeGJRv8d2K+hr7N3rmIjTZMbKyre64WFqlBNRIqVbDV0i29ur6/wmlrKcC1V+y1dmBB5pzjghRNWZK/OAfLi/4Ar0Xb73lDuGsW6Gv61KXpzFg0g9V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760445253; c=relaxed/simple;
	bh=GNg0lILA/EASTwnAkarlJXxI1zxHDTzHg9YaU1hS5Fs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=aVtbN/GcOOHIfoCvpEedzoFQVjZPVSrcG2CGszufUwQqPXKl/9sm8mj5rUVZWCrKV8VHCJpNaI/6bWZLeZBc5fD/SAYEvgS6h6u5Xp4atQZxws4G3MaQfMqDXAC36iy9YvNG29clSOEys4SWrN7Zq24L7G/aBShTKfRFD4hYRiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gQF0Y6dc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFDC7C4CEE7;
	Tue, 14 Oct 2025 12:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760445252;
	bh=GNg0lILA/EASTwnAkarlJXxI1zxHDTzHg9YaU1hS5Fs=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=gQF0Y6dcezXj0XBhp91YKYvi6f9489AxB6hJ2RzpGKbxAOs+lIXrw1+A0M52+Lio1
	 iUnRwEDWz8+uYRtl+suOLv5dVv/XZfACvXqiVkqPJGyB84RMxTS/TKczE0n+ryYhsF
	 NHoeQscfnARH1SakGvOlJ2iGlIMV+yDeSxK1SpQFojS9Qvy1/vyjJGWUlIMyEsKGES
	 IL0rVeEmfP8oCqzsP7E+iwps1RRK97eGBr6sPMS9HeK9Nvk9OIL98ON+ume1cR/fWy
	 7d3wseqIuK7FJ24j8rhUt4nH+K3Qwpgux3TOfEWmp4/qMq8ikm6AVarGOHM5CNkPdc
	 a8fu3pevkG3CA==
Message-ID: <a03637f5-a810-4620-8ba3-d502a4ce7dd3@kernel.org>
Date: Tue, 14 Oct 2025 14:34:09 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v4 2/2] media: ivtv: Fix invalid access to file *
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Andy Walls <awalls@md.metrocast.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, stable@vger.kernel.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250819-cx18-v4l2-fh-v4-0-9db1635d6787@ideasonboard.com>
 <20250819-cx18-v4l2-fh-v4-2-9db1635d6787@ideasonboard.com>
Content-Language: en-US, nl
In-Reply-To: <20250819-cx18-v4l2-fh-v4-2-9db1635d6787@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/08/2025 09:07, Jacopo Mondi wrote:
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
> Fix this by moving the implementation of those ioctls to two helper
> functions.
> 
> The ivtv_do_s_input() helper accepts a struct ivtv * as first argument,
> which is easily accessible in ivtv_init_on_first_open() as well as from
> the file * argument of the ioctl handler.
> 
> The ivtv_s_frequency() takes an ivtv_stream * instead. The stream * can
> safely be accessed in ivtv_init_on_first_open() where it is hard-coded
> to the IVTV_ENC_STREAM_TYPE_MPG stream type, as well as from the ioctl
> handler as a valid stream type is associated to each open file handle
> depending on which video device node has been opened in the ivtv_open()
> file operation.
> 
> The bug has been reported by Smatch.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/aKL4OMWsESUdX8KQ@stanley.mountain/
> Fixes: 9ba9d11544f9 ("media: ivtv: Access v4l2_fh from file")
> Cc: stable@vger.kernel.org
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Tested-by: Hans Verkuil <hverkuil+cisco@kernel.org>

I'll try the cx18 board next :-)

Regards,

	Hans

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
> index 42c2516379fcbbd0640820ab0e3abe9bf00b57ea..edc05eb8e060fd64d7ff94f8f7f5c315a2fa6298 100644
> --- a/drivers/media/pci/ivtv/ivtv-ioctl.h
> +++ b/drivers/media/pci/ivtv/ivtv-ioctl.h
> @@ -9,6 +9,8 @@
>  #ifndef IVTV_IOCTL_H
>  #define IVTV_IOCTL_H
>  
> +struct ivtv;
> +
>  u16 ivtv_service2vbi(int type);
>  void ivtv_expand_service_set(struct v4l2_sliced_vbi_format *fmt, int is_pal);
>  u16 ivtv_get_service_set(struct v4l2_sliced_vbi_format *fmt);
> @@ -17,7 +19,7 @@ int ivtv_set_speed(struct ivtv *itv, int speed);
>  void ivtv_set_funcs(struct video_device *vdev);
>  void ivtv_s_std_enc(struct ivtv *itv, v4l2_std_id std);
>  void ivtv_s_std_dec(struct ivtv *itv, v4l2_std_id std);
> -int ivtv_s_frequency(struct file *file, void *fh, const struct v4l2_frequency *vf);
> -int ivtv_s_input(struct file *file, void *fh, unsigned int inp);
> +int ivtv_do_s_frequency(struct ivtv_stream *s, const struct v4l2_frequency *vf);
> +int ivtv_do_s_input(struct ivtv *itv, unsigned int inp);
>  
>  #endif
> 


