Return-Path: <linux-media+bounces-45082-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 05862BF351C
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 22:05:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8086A350C75
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 20:05:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EEE52D979F;
	Mon, 20 Oct 2025 20:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="HjA0zd/B"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D073FBA7;
	Mon, 20 Oct 2025 20:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760990700; cv=pass; b=MZqVbRaOJ0D/GoRMPhCJSmeJ5JiSxXatsd0O3AsdAkJsHP4pv4+Aqoi+RgBFBha0A9jkW+T5CXspFToVjMkC9DuF//NhKjKLjBd0SeLf71oAKeeVnWQzzvOUgKIO2eNpJanHdNJtjsTp6Cyye+x+nPyqYMvGJ5eSUE9t21c/hH0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760990700; c=relaxed/simple;
	bh=VYzNr5rEz4tPzBtcMf4/Zb+FVLKe21z1Zjt6/iovnTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hoeiAH1byYPoIUbCXSxOXxfUHFaJkeFJfpLdhw825ERK/07b9Okc6IpA+0ukqTrXp7pgrw6/TpLj3LtbVJn5JP68Afo8lZQrTFqgfMmj4SbqkKsB3nY1MJtXBe/kRXbWYVErVyzolR7YHcs4b1HgFFLrv6wsHgLxrR4afS7NcmE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=HjA0zd/B; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4cr5xh0XDPzyNC;
	Mon, 20 Oct 2025 23:04:56 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1760990696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6RjQVb5H+msS5TZEkqAuNT1Z3nBCudhYqn6e89HVHVM=;
	b=HjA0zd/BSxuildZX1nBzRH5v+r4JtStv3F9vjGFr8o9M/Ucv+Amnk34kmEEMFGh3ZRs9mi
	m+u8d5sfpgbbM1FtJ71K8Uk/R1zAShO+WaIZlBjkozAhbuqEKSpnYRUOigswkao9EvAt7P
	60kZy6/zh9bzsbNXO7QUSdDjnrC74Hg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1760990696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6RjQVb5H+msS5TZEkqAuNT1Z3nBCudhYqn6e89HVHVM=;
	b=al6TpQv36DYmJ9PTBvH6DH7dNxl2UpRF9Mk34ITmvQX++R6TxOujWgnJ1z9/h9jz1U8XDA
	y913dtpU9tpbEU1QnOuzZhm4vL5a4xgpZXtuzQ4j/G+KaCSkBpH/LiontGNd97kMYjd8BM
	bJIgDEh32b9VqENwKv0ZcBuC2KX5jKw=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1760990696; a=rsa-sha256; cv=none;
	b=zLwv/dQ0SXVUTaL0grcOKSCUFCRAkchiVBWSjlh9g3NhmiasEQwsOh9OFBy+G+cDZupWgn
	P5rChwdHfZ5RF2/VvrK0Gvej+EQ5SGRGmF13nOOrfIVM36xXxH6MQfvQZhU/9q5SF6+33m
	PGCPm6CfIYENPePdpRacSIVXCQY0Dlc=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id B5CAA634C50;
	Mon, 20 Oct 2025 23:04:55 +0300 (EEST)
Date: Mon, 20 Oct 2025 23:04:55 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Ricardo Ribalda <ribalda@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: i2c: imx214: Exit early on control init errors
Message-ID: <aPaV56-NxiFFx1XU@valkosipuli.retiisi.eu>
References: <20251014-imx214-smatch-v2-1-04218043086d@chromium.org>
 <aPZ_YRwpDNPFjePX@valkosipuli.retiisi.eu>
 <CANiDSCt+E+Ogr9+Y4_4KA_vBOYyTNZgwZVBD2wLMJirQE+PS3Q@mail.gmail.com>
 <aPaOxb9DyQfnU7_Q@valkosipuli.retiisi.eu>
 <CANiDSCvS3gnrQ0sPrdhiQxY47rHHrvVMq_wDDBYa_L=Y-VZwAg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiDSCvS3gnrQ0sPrdhiQxY47rHHrvVMq_wDDBYa_L=Y-VZwAg@mail.gmail.com>

Hi Ricardo,

On Mon, Oct 20, 2025 at 09:58:47PM +0200, Ricardo Ribalda wrote:
> Hi Sakai
> 
> On Mon, 20 Oct 2025 at 21:34, Sakari Ailus <sakari.ailus@iki.fi> wrote:
> >
> > Hi Ricardo,
> >
> > On Mon, Oct 20, 2025 at 08:51:44PM +0200, Ricardo Ribalda wrote:
> > > Hi Sakari
> > >
> > > On Mon, 20 Oct 2025 at 20:28, Sakari Ailus <sakari.ailus@iki.fi> wrote:
> > > >
> > > > Hi Ricardo,
> > > >
> > > > On Tue, Oct 14, 2025 at 11:00:17AM +0000, Ricardo Ribalda wrote:
> > > > > Now we try to initialize all the controls and at the very end check
> > > > > ctrl_hdlr->error to check if one of them has failed.
> > > > >
> > > > > This confuses smatch, who do not know how to track the state of
> > > > > imx214->link_freq.
> > > > >
> > > > > drivers/media/i2c/imx214.c:1109 imx214_ctrls_init() error: we previously assumed 'imx214->link_freq' could be null (see line 1017)
> > > > >
> > > > > Fix this by exiting early on control initialization errors.
> > > > >
> > > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > > ---
> > > > > Right now we are handling this with a quirk in media-ci, if Dan cannot
> > > > > fix smatch in a kernel cycle we should merge this patch.
> > > > > ---
> > > > > Changes in v2:
> > > > > - Fix typo in commit message commit
> > > > > - Move error tag where it belongs (Thanks Hans!)
> > > > > - Link to v1: https://lore.kernel.org/r/20250829-imx214-smatch-v1-1-f3d1653b48e4@chromium.org
> > > > > ---
> > > > >  drivers/media/i2c/imx214.c | 7 +++++--
> > > > >  1 file changed, 5 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> > > > > index 94ebe625c9e6ee0fb67fe1d89b48b2f1bf58ffc6..c66f0e18726c3fc15df91c37888a797bcea82134 100644
> > > > > --- a/drivers/media/i2c/imx214.c
> > > > > +++ b/drivers/media/i2c/imx214.c
> > > > > @@ -1014,8 +1014,10 @@ static int imx214_ctrls_init(struct imx214 *imx214)
> > > > >                                                  V4L2_CID_LINK_FREQ,
> > > > >                                                  imx214->bus_cfg.nr_of_link_frequencies - 1,
> > > > >                                                  0, imx214->bus_cfg.link_frequencies);
> > > > > -     if (imx214->link_freq)
> > > > > -             imx214->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > > > > +     if (!imx214->link_freq)
> > > > > +             goto err_init_ctrl;
> > > > > +
> > > > > +     imx214->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > > >
> > > > You could do this cleaner by simply moving the assignment after the handler
> > > > error check. Some drivers do that already.
> > > >
> > > > I wonder why this seems to be a problem for smatch in the imx214 driver as
> > > > the pattern is widely used across the sensor drivers.
> > >
> > > Smatch thinks that there could be case where
> > >
> > > imx->link_freq = NULL, and imx214_pll_update returns 0.
> > >
> > > That is not solved by moving the assignment `imx214->link_freq->flags
> > > |=` after if (ret)
> >
> > Did you test this? The smatch message suggests otherwise (but of course
> > this could just turn into a different smatch error).
> 
> Actually smatch do not hate it :)
> 
> ribalda@ribalda:~/work/linux$ make -i W=1 C=1
> CHECK="../media-ci/third_party/smatch/smatch -p=kernel"
> KCFLAGS="-Wmaybe-uninitialized" drivers/media/i2c/imx214.o
>   CC      kernel/sched/rq-offsets.s
> In file included from kernel/sched/rq-offsets.c:5:
> kernel/sched/sched.h: In function ‘mm_cid_get’:
> kernel/sched/sched.h:3743:25: error: variable ‘cpumask’ set but not
> used [-Werror=unused-but-set-variable]
>  3743 |         struct cpumask *cpumask;
>       |                         ^~~~~~~
> cc1: all warnings being treated as errors
> make[2]: [scripts/Makefile.build:182: kernel/sched/rq-offsets.s] Error
> 1 (ignored)
> /bin/sh: line 1: kernel/sched/rq-offsets.s: No such file or directory
> make[2]: [Kbuild:46: include/generated/rq-offsets.h] Error 1 (ignored)
>   CALL    scripts/checksyscalls.sh
>   DESCEND objtool
>   INSTALL libsubcmd_headers
>   CC      drivers/media/i2c/imx214.o
>   CHECK   drivers/media/i2c/imx214.c
> 
> 
> ribalda@ribalda:~/work/linux$ git diff
> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> index 94ebe625c9e6..a21461b55923 100644
> --- a/drivers/media/i2c/imx214.c
> +++ b/drivers/media/i2c/imx214.c
> @@ -1014,8 +1014,6 @@ static int imx214_ctrls_init(struct imx214 *imx214)
>                                                    V4L2_CID_LINK_FREQ,
> 
> imx214->bus_cfg.nr_of_link_frequencies - 1,
>                                                    0,
> imx214->bus_cfg.link_frequencies);
> -       if (imx214->link_freq)
> -               imx214->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> 
>         /*
>          * WARNING!
> @@ -1038,9 +1036,6 @@ static int imx214_ctrls_init(struct imx214 *imx214)
>         imx214->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx214_ctrl_ops,
>                                            V4L2_CID_HBLANK, hblank, hblank,
>                                            1, hblank);
> -       if (imx214->hblank)
> -               imx214->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> -
>         exposure_max = mode->vts_def - IMX214_EXPOSURE_OFFSET;
>         exposure_def = min(exposure_max, IMX214_EXPOSURE_DEFAULT);
>         imx214->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &imx214_ctrl_ops,
> @@ -1060,13 +1055,9 @@ static int imx214_ctrls_init(struct imx214 *imx214)
> 
>         imx214->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &imx214_ctrl_ops,
>                                           V4L2_CID_HFLIP, 0, 1, 1, 0);
> -       if (imx214->hflip)
> -               imx214->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> 
>         imx214->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &imx214_ctrl_ops,
>                                           V4L2_CID_VFLIP, 0, 1, 1, 0);
> -       if (imx214->vflip)
> -               imx214->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> 
>         v4l2_ctrl_cluster(2, &imx214->hflip);
> 
> @@ -1106,6 +1097,11 @@ static int imx214_ctrls_init(struct imx214 *imx214)
>                 return ret;
>         }
> 
> +       imx214->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +       imx214->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +       imx214->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> +       imx214->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> +
>         ret = imx214_pll_update(imx214);
>         if (ret < 0) {
>                 v4l2_ctrl_handler_free(ctrl_hdlr);
> 
> 
> >
> > >
> > > I believe Dan is already flagged about this, but I do not think that
> > > it will be super simple to fix in his code.
> > >
> > > If smatch can handle this case before rc5 I will delete this patch.
> >
> > There are other options, too, such as storing the link frequency index (the
> > driver won't even support setting it) or the frequency itself.
> 
> There are plenty of options :) But I am still failing to see what is
> wrong with this patch.

Error handling is often complicated and poorly tested. If you don't need to
introduce new labels to do it, just don't. The control framework does it
nicely to simplify drivers so let's rely on it.

> 
> We exit early when there is an error instead of continuing doing work
> that will be useless.
> 
> If you really prefer your way I can send a v3... but we have probably
> more fun work to do :P

Yes, but I don't want this pattern to spread. That tends to happen if you
introduce it in one driver.

-- 
Regards,

Sakari Ailus

