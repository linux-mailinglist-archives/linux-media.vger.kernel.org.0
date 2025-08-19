Return-Path: <linux-media+bounces-40223-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D427B2BA14
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 09:03:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CCE31BA0F0D
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 07:02:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8AE326E14D;
	Tue, 19 Aug 2025 07:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JI+vYmjZ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B23A23D298;
	Tue, 19 Aug 2025 07:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755586939; cv=none; b=FRS0TyGpEgisJzoNa6cx4+qssdsANJ1sYIQHiu2btxdNzsMRre5+8700RfbAMbSoAsPv6u3TDfVB3iwz2JrjJJPfCcYIAlPSzgwHoZ0fJPETGg8N75sDdaJRDzRfMAliRYoyS/33e0lIfVXDp6lSUs7ZP393/8WCvR7InyNkWDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755586939; c=relaxed/simple;
	bh=L3/Jsto8SKgbARYjbaV5YJtQ3TvA6hXl2fH2c004Bac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qz8dF2/4tHDo6Dw7JYIiOlv7C5msTypfwI4A+Xv7D1J0TK5xxibk52t/vk+a8gmt22m4cysweman28fXDS+u0+yw/ytQDNbWJNqiA/vhJIzzvrUN81m/Gt7SMQjJoJFNC9JvdCEMZqCgSRwN1LborjHjkpYmy05FD9dbTHfxod4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JI+vYmjZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-52-92.net.vodafone.it [5.90.52.92])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A57A82A6E;
	Tue, 19 Aug 2025 09:01:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755586876;
	bh=L3/Jsto8SKgbARYjbaV5YJtQ3TvA6hXl2fH2c004Bac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JI+vYmjZb4lbwLchQgXdhzf/IMELxZ4JWE/pVjEmndhC+AcWa2KZJ6ei3GruZDrGZ
	 orxryxkYAHWRzVtPzPew4ZPiibE+XQriXHtpAhW13iKFbHGKKT11HXhlgPQzJQlyDZ
	 4s7rPakildkXuLeiYjY1lilvJJ4c9SYGXBq+FSuI=
Date: Tue, 19 Aug 2025 09:02:10 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Andy Walls <awalls@md.metrocast.net>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>, stable@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] media: ivtv: Fix invalid access to file *
Message-ID: <db7ynwwwwi6lja7l4itpdkbnbzyg7sqa32mhm3xfcjrhb67hij@dcfs3m6w73il>
References: <20250818-cx18-v4l2-fh-v3-0-5e2f08f3cadc@ideasonboard.com>
 <20250818-cx18-v4l2-fh-v3-2-5e2f08f3cadc@ideasonboard.com>
 <20250818235906.GC10308@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250818235906.GC10308@pendragon.ideasonboard.com>

On Tue, Aug 19, 2025 at 02:59:06AM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Mon, Aug 18, 2025 at 10:39:37PM +0200, Jacopo Mondi wrote:
> > Since commit 9ba9d11544f9 ("media: ivtv: Access v4l2_fh from file")
> > all ioctl handlers have been ported to operate on the file * first
> > function argument.
> >
> > The ivtv DVB layer calls ivtv_init_on_first_open() when the driver
> > needs to start streaming. This function calls the s_input() and
> > s_frequency() ioctl handlers directly, but being called from the driver
> > context, it doesn't have a valid file * to pass them. This causes the
> > ioctl handlers to deference an invalid pointer.
> >
> > Fix this by wrapping the ioctl handlers implementation in helper
> > functions.
>
> You may want to reword this in a similar way as proposed in 1/2.
>
> >
> > The ivtv_do_s_input() helper accepts a struct ivtv * as first argument,
> > which is easily accessible from the DVB layer as well as from the file *
> > argument of the ioctl handler.
> >
> > The ivtv_s_frequency() takes an ivtv_stream * instead. The stream * can
> > safely be accessed from the DVB layer which hard-codes it to the
> > IVTV_ENC_STREAM_TYPE_MPG stream type, as well as from the ioctl handler
> > a valid stream type is associated to each open file handle depending on
> > which video device node has been opened in the ivtv_open() file
> > operation.
> >
> > The bug has been reported by Smatch.
> >
> > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Closes: https://lore.kernel.org/all/aKL4OMWsESUdX8KQ@stanley.mountain/
> > Fixes: 9ba9d11544f9 ("media: ivtv: Access v4l2_fh from file")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> >  drivers/media/pci/ivtv/ivtv-driver.c | 11 ++++-------
> >  drivers/media/pci/ivtv/ivtv-ioctl.c  | 22 +++++++++++++++++-----
> >  drivers/media/pci/ivtv/ivtv-ioctl.h  |  6 ++++--
> >  3 files changed, 25 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/media/pci/ivtv/ivtv-driver.c b/drivers/media/pci/ivtv/ivtv-driver.c
> > index ecc20cd89926fe2ce4e472526a6b5fc0857615dd..7e2fb98cfccf02f701ceb4484dd1d330dd1dc867 100644
> > --- a/drivers/media/pci/ivtv/ivtv-driver.c
> > +++ b/drivers/media/pci/ivtv/ivtv-driver.c
> > @@ -1260,15 +1260,12 @@ static int ivtv_probe(struct pci_dev *pdev, const struct pci_device_id *pci_id)
> >
> >  int ivtv_init_on_first_open(struct ivtv *itv)
> >  {
> > -	struct v4l2_frequency vf;
> >  	/* Needed to call ioctls later */
>
> I'd drop the comment.

it was there already and it's not misleading

>
> > -	struct ivtv_open_id fh;
> > +	struct ivtv_stream *s = &itv->streams[IVTV_ENC_STREAM_TYPE_MPG];
> > +	struct v4l2_frequency vf;
> >  	int fw_retry_count = 3;
> >  	int video_input;
> >
> > -	fh.itv = itv;
> > -	fh.type = IVTV_ENC_STREAM_TYPE_MPG;
> > -
> >  	if (test_bit(IVTV_F_I_FAILED, &itv->i_flags))
> >  		return -ENXIO;
> >
> > @@ -1310,13 +1307,13 @@ int ivtv_init_on_first_open(struct ivtv *itv)
> >
> >  	video_input = itv->active_input;
> >  	itv->active_input++;	/* Force update of input */
> > -	ivtv_s_input(NULL, &fh, video_input);
> > +	ivtv_do_s_input(itv, video_input);
> >
> >  	/* Let the VIDIOC_S_STD ioctl do all the work, keeps the code
> >  	   in one place. */
> >  	itv->std++;		/* Force full standard initialization */
> >  	itv->std_out = itv->std;
> > -	ivtv_s_frequency(NULL, &fh, &vf);
> > +	ivtv_do_s_frequency(s, &vf);
>
> 	ivtv_do_s_frequency(&itv->streams[IVTV_ENC_STREAM_TYPE_MPG], &vf);
>
> would work too. Up to you.
>

I know, but I prefer the way I have here

> >
> >  	if (itv->card->v4l2_capabilities & V4L2_CAP_VIDEO_OUTPUT) {
> >  		/* Turn on the TV-out: ivtv_init_mpeg_decoder() initializes
> > diff --git a/drivers/media/pci/ivtv/ivtv-ioctl.c b/drivers/media/pci/ivtv/ivtv-ioctl.c
> > index 8077a71d4850ec773caa20c3fca08f92f3117d69..dfbc842b22453868a2075935a81db7ae313ee46c 100644
> > --- a/drivers/media/pci/ivtv/ivtv-ioctl.c
> > +++ b/drivers/media/pci/ivtv/ivtv-ioctl.c
> > @@ -974,9 +974,8 @@ static int ivtv_g_input(struct file *file, void *fh, unsigned int *i)
> >  	return 0;
> >  }
> >
> > -int ivtv_s_input(struct file *file, void *fh, unsigned int inp)
> > +int ivtv_do_s_input(struct ivtv *itv, unsigned int inp)
> >  {
> > -	struct ivtv *itv = file2id(file)->itv;
> >  	v4l2_std_id std;
> >  	int i;
> >
> > @@ -1017,6 +1016,11 @@ int ivtv_s_input(struct file *file, void *fh, unsigned int inp)
> >  	return 0;
> >  }
> >
> > +static int ivtv_s_input(struct file *file, void *fh, unsigned int inp)
> > +{
> > +	return ivtv_do_s_input(file2id(file)->itv, inp);
> > +}
> > +
> >  static int ivtv_g_output(struct file *file, void *fh, unsigned int *i)
> >  {
> >  	struct ivtv *itv = file2id(file)->itv;
> > @@ -1065,10 +1069,9 @@ static int ivtv_g_frequency(struct file *file, void *fh, struct v4l2_frequency *
> >  	return 0;
> >  }
> >
> > -int ivtv_s_frequency(struct file *file, void *fh, const struct v4l2_frequency *vf)
> > +int ivtv_do_s_frequency(struct ivtv_stream *s, const struct v4l2_frequency *vf)
> >  {
> > -	struct ivtv *itv = file2id(file)->itv;
> > -	struct ivtv_stream *s = &itv->streams[file2id(file)->type];
> > +	struct ivtv *itv = s->itv;
> >
> >  	if (s->vdev.vfl_dir)
> >  		return -ENOTTY;
> > @@ -1082,6 +1085,15 @@ int ivtv_s_frequency(struct file *file, void *fh, const struct v4l2_frequency *v
> >  	return 0;
> >  }
> >
> > +static int ivtv_s_frequency(struct file *file, void *fh,
> > +			    const struct v4l2_frequency *vf)
> > +{
> > +	struct ivtv_open_id *id = file2id(file);
> > +	struct ivtv *itv = id->itv;
> > +
> > +	return ivtv_do_s_frequency(&itv->streams[id->type], vf);
> > +}
> > +
> >  static int ivtv_g_std(struct file *file, void *fh, v4l2_std_id *std)
> >  {
> >  	struct ivtv *itv = file2id(file)->itv;
> > diff --git a/drivers/media/pci/ivtv/ivtv-ioctl.h b/drivers/media/pci/ivtv/ivtv-ioctl.h
> > index 42c2516379fcbbd0640820ab0e3abe9bf00b57ea..dd713a6b095e5ebca45a234dd6c9a90df0928596 100644
> > --- a/drivers/media/pci/ivtv/ivtv-ioctl.h
> > +++ b/drivers/media/pci/ivtv/ivtv-ioctl.h
> > @@ -17,7 +17,9 @@ int ivtv_set_speed(struct ivtv *itv, int speed);
> >  void ivtv_set_funcs(struct video_device *vdev);
> >  void ivtv_s_std_enc(struct ivtv *itv, v4l2_std_id std);
> >  void ivtv_s_std_dec(struct ivtv *itv, v4l2_std_id std);
> > -int ivtv_s_frequency(struct file *file, void *fh, const struct v4l2_frequency *vf);
> > -int ivtv_s_input(struct file *file, void *fh, unsigned int inp);
> > +
> > +struct ivtv;
>
> I'd drop this, as the structure is already used above.

So it works by chance. I'll move the forward declaration up.

>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> > +int ivtv_do_s_frequency(struct ivtv_stream *s, const struct v4l2_frequency *vf);
> > +int ivtv_do_s_input(struct ivtv *itv, unsigned int inp);
> >
> >  #endif
> >
>
> --
> Regards,
>
> Laurent Pinchart

