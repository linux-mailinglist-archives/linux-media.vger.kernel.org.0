Return-Path: <linux-media+bounces-40222-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FBFB2BA0A
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 09:00:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F25E33B8FF5
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 07:00:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0AA726560A;
	Tue, 19 Aug 2025 07:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lpX8t8gy"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80DD25BEFE;
	Tue, 19 Aug 2025 07:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755586820; cv=none; b=Ogqi7XITP1UC53pgUkxjjIaKZF+rrvZhmvZkHuF35j5he519N5YM8ytfeuLyQOjNQ0fpmXijn/lKhzHWOAMLi87usCLdm05ETb/Tc5YLKbd42PF6A5v1QTD2qUyaDpg57hMxODhyHWyp0ExweW5TMe4OObnk864maRcwh4ocRwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755586820; c=relaxed/simple;
	bh=E4+6SQn+0H0871MDRGuNeoo2nkDKzjeLbYdG/k+vKZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aojlnaJ+jxNSDHo2tFjBZ1+WiDT85TRWD9YzkcQlEVhjUxeIKMLr/1thz2bvel8O+uF0g8Tey6y3/u596rzD3jJJo2gpR8N8lMZ6UUHW1ysK2pKU/Wduz2dQRiyYFCdGYi7WxDlAfoXv22U63ZZ+o7jSrq8TCZzgRCBWQ6MNDG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lpX8t8gy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-52-92.net.vodafone.it [5.90.52.92])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5E2F0596;
	Tue, 19 Aug 2025 08:59:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755586758;
	bh=E4+6SQn+0H0871MDRGuNeoo2nkDKzjeLbYdG/k+vKZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lpX8t8gyaI0KZ6MwBblwSiECgnXoEY0HTkt4EUFWvNwgnz3GBb1KO0u2esLlcIDrF
	 hhiNk5KP4lNa5KO8xj2m06ByaanV1VP13cgEopf7inmLYKty7L2XqNYlF51SyEzEzn
	 GVh9sfN8YmoQsHhkxgQcDZcjldLsQkuHd0OJg/nY=
Date: Tue, 19 Aug 2025 09:00:11 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Andy Walls <awalls@md.metrocast.net>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>, stable@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] media: cx18: Fix invalid access to file *
Message-ID: <3h5oa7ziojahyq4uxlpfdkqqqz2h2fakahjmtyv5un5yhxhat4@gborrcjbwme5>
References: <20250818-cx18-v4l2-fh-v3-0-5e2f08f3cadc@ideasonboard.com>
 <20250818-cx18-v4l2-fh-v3-1-5e2f08f3cadc@ideasonboard.com>
 <20250818235632.GB10308@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250818235632.GB10308@pendragon.ideasonboard.com>

Hi Laurent

On Tue, Aug 19, 2025 at 02:56:32AM +0300, Laurent Pinchart wrote:
> On Mon, Aug 18, 2025 at 10:39:36PM +0200, Jacopo Mondi wrote:
> > Sice commit 7b9eb53e8591 ("media: cx18: Access v4l2_fh from file")
>
> s/Sice/Since/
>
> > all ioctl handlers have been ported to operate on the file * first
> > function argument.
> >
> > The cx18 DVB layer calls cx18_init_on_first_open() when the driver needs
> > to start streaming. This function calls the s_input(), s_std() and
> > s_frequency() ioctl handlers directly, but being called from the driver
> > context, it doesn't have a valid file * to pass them. This causes
> > the ioctl handlers to deference an invalid pointer.
> >
> > Fix this by wrapping the ioctl handlers implementation in helper
> > functions which accepts a cx18 pointer as first argument
> > and make the cx18_init_on_first_open() function call the helpers
> > without going through the ioctl handlers.
>
> It's the other way around, the ioctl handlers are not wrapper. I'd write

in facts

"wrapping the ioctl handlers implementation in helpers functions"

to me means wrapping the actual implementation in helpers

>
> Fix this by moving the implementation of those ioctls to functions that

ah I should have used "moving" instead of "wrapping"

> take a cx18 pointer instead of a file pointer, and turn the V4L2 ioctl
> handlers into wrappers that get the cx18 from the file. When calling
> from cx18_init_on_first_open(), pass the cx18 pointer directly. This
> allows removing the fake fh in cx18_init_on_first_open().
>

ok, if it's -that- different... thankfully we nowadays have b4 that
makes sending new version easier

> >
> > The bug has been reported by Smatch:
> >
> > --> 1223         cx18_s_input(NULL, &fh, video_input);
> > The patch adds a new dereference of "file" but some of the callers pass a
> > NULL pointer.
> >
> > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Closes: https://lore.kernel.org/all/aKL4OMWsESUdX8KQ@stanley.mountain/
> > Fixes: 7b9eb53e8591 ("media: cx18: Access v4l2_fh from file")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> > ---
> >  drivers/media/pci/cx18/cx18-driver.c |  9 +++------
> >  drivers/media/pci/cx18/cx18-ioctl.c  | 30 +++++++++++++++++++-----------
> >  drivers/media/pci/cx18/cx18-ioctl.h  |  8 +++++---
> >  3 files changed, 27 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/media/pci/cx18/cx18-driver.c b/drivers/media/pci/cx18/cx18-driver.c
> > index 743fcc9613744bfc1edeffc51e908fe88520405a..cd84dfcefcf971a7adb9aac2bafb9089dbe0f33f 100644
> > --- a/drivers/media/pci/cx18/cx18-driver.c
> > +++ b/drivers/media/pci/cx18/cx18-driver.c
> > @@ -1136,11 +1136,8 @@ int cx18_init_on_first_open(struct cx18 *cx)
> >  	int video_input;
> >  	int fw_retry_count = 3;
> >  	struct v4l2_frequency vf;
> > -	struct cx18_open_id fh;
> >  	v4l2_std_id std;
> >
> > -	fh.cx = cx;
> > -
> >  	if (test_bit(CX18_F_I_FAILED, &cx->i_flags))
> >  		return -ENXIO;
> >
> > @@ -1220,14 +1217,14 @@ int cx18_init_on_first_open(struct cx18 *cx)
> >
> >  	video_input = cx->active_input;
> >  	cx->active_input++;	/* Force update of input */
> > -	cx18_s_input(NULL, &fh, video_input);
> > +	cx18_do_s_input(cx, video_input);
> >
> >  	/* Let the VIDIOC_S_STD ioctl do all the work, keeps the code
> >  	   in one place. */
> >  	cx->std++;		/* Force full standard initialization */
> >  	std = (cx->tuner_std == V4L2_STD_ALL) ? V4L2_STD_NTSC_M : cx->tuner_std;
> > -	cx18_s_std(NULL, &fh, std);
> > -	cx18_s_frequency(NULL, &fh, &vf);
> > +	cx18_do_s_std(cx, std);
> > +	cx18_do_s_frequency(cx, &vf);
> >  	return 0;
> >  }
> >
> > diff --git a/drivers/media/pci/cx18/cx18-ioctl.c b/drivers/media/pci/cx18/cx18-ioctl.c
> > index bf16d36448f888d9326b5f4a8f9c8f0e13d0c3a1..6e869c43cbd520feb720a71d8eb2dd60c05b0ae9 100644
> > --- a/drivers/media/pci/cx18/cx18-ioctl.c
> > +++ b/drivers/media/pci/cx18/cx18-ioctl.c
> > @@ -521,10 +521,8 @@ static int cx18_g_input(struct file *file, void *fh, unsigned int *i)
> >  	return 0;
> >  }
> >
> > -int cx18_s_input(struct file *file, void *fh, unsigned int inp)
> > +int cx18_do_s_input(struct cx18 *cx, unsigned int inp)
> >  {
> > -	struct cx18_open_id *id = file2id(file);
> > -	struct cx18 *cx = id->cx;
> >  	v4l2_std_id std = V4L2_STD_ALL;
> >  	const struct cx18_card_video_input *card_input =
> >  				cx->card->video_inputs + inp;
> > @@ -558,6 +556,11 @@ int cx18_s_input(struct file *file, void *fh, unsigned int inp)
> >  	return 0;
> >  }
> >
> > +static int cx18_s_input(struct file *file, void *fh, unsigned int inp)
> > +{
> > +	return cx18_do_s_input(file2id(file)->cx, inp);
> > +}
> > +
> >  static int cx18_g_frequency(struct file *file, void *fh,
> >  				struct v4l2_frequency *vf)
> >  {
> > @@ -570,11 +573,8 @@ static int cx18_g_frequency(struct file *file, void *fh,
> >  	return 0;
> >  }
> >
> > -int cx18_s_frequency(struct file *file, void *fh, const struct v4l2_frequency *vf)
> > +int cx18_do_s_frequency(struct cx18 *cx, const struct v4l2_frequency *vf)
> >  {
> > -	struct cx18_open_id *id = file2id(file);
> > -	struct cx18 *cx = id->cx;
> > -
> >  	if (vf->tuner != 0)
> >  		return -EINVAL;
> >
> > @@ -585,6 +585,12 @@ int cx18_s_frequency(struct file *file, void *fh, const struct v4l2_frequency *v
> >  	return 0;
> >  }
> >
> > +static int cx18_s_frequency(struct file *file, void *fh,
> > +			    const struct v4l2_frequency *vf)
> > +{
> > +	return cx18_do_s_frequency(file2id(file)->cx, vf);
> > +}
> > +
> >  static int cx18_g_std(struct file *file, void *fh, v4l2_std_id *std)
> >  {
> >  	struct cx18 *cx = file2id(file)->cx;
> > @@ -593,11 +599,8 @@ static int cx18_g_std(struct file *file, void *fh, v4l2_std_id *std)
> >  	return 0;
> >  }
> >
> > -int cx18_s_std(struct file *file, void *fh, v4l2_std_id std)
> > +int cx18_do_s_std(struct cx18 *cx, v4l2_std_id std)
> >  {
> > -	struct cx18_open_id *id = file2id(file);
> > -	struct cx18 *cx = id->cx;
> > -
> >  	if ((std & V4L2_STD_ALL) == 0)
> >  		return -EINVAL;
> >
> > @@ -642,6 +645,11 @@ int cx18_s_std(struct file *file, void *fh, v4l2_std_id std)
> >  	return 0;
> >  }
> >
> > +static int cx18_s_std(struct file *file, void *fh, v4l2_std_id std)
> > +{
> > +	return cx18_do_s_std(file2id(file)->cx, std);
> > +}
> > +
> >  static int cx18_s_tuner(struct file *file, void *fh, const struct v4l2_tuner *vt)
> >  {
> >  	struct cx18_open_id *id = file2id(file);
> > diff --git a/drivers/media/pci/cx18/cx18-ioctl.h b/drivers/media/pci/cx18/cx18-ioctl.h
> > index 221e2400fb3e2d817eaff7515fa89eb94f2d7f8a..7a42ac99312ab6502e1abe4f3d5c88c9c7f144f3 100644
> > --- a/drivers/media/pci/cx18/cx18-ioctl.h
> > +++ b/drivers/media/pci/cx18/cx18-ioctl.h
> > @@ -12,6 +12,8 @@ u16 cx18_service2vbi(int type);
> >  void cx18_expand_service_set(struct v4l2_sliced_vbi_format *fmt, int is_pal);
> >  u16 cx18_get_service_set(struct v4l2_sliced_vbi_format *fmt);
> >  void cx18_set_funcs(struct video_device *vdev);
> > -int cx18_s_std(struct file *file, void *fh, v4l2_std_id std);
> > -int cx18_s_frequency(struct file *file, void *fh, const struct v4l2_frequency *vf);
> > -int cx18_s_input(struct file *file, void *fh, unsigned int inp);
> > +
> > +struct cx18;
> > +int cx18_do_s_std(struct cx18 *cx, v4l2_std_id std);
> > +int cx18_do_s_frequency(struct cx18 *cx, const struct v4l2_frequency *vf);
> > +int cx18_do_s_input(struct cx18 *cx, unsigned int inp);
> >
>
> --
> Regards,
>
> Laurent Pinchart

