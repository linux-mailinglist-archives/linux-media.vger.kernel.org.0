Return-Path: <linux-media+bounces-45078-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id A65ADBF33A3
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 21:34:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2B6D734F384
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 19:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 606D02D238D;
	Mon, 20 Oct 2025 19:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="EedBnRWn"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D3D2C029D;
	Mon, 20 Oct 2025 19:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760988882; cv=pass; b=XOQ/Qp6FAsOGs7pPWDot5SG33zLCKAmn3jvp3xYPptWjYAV2omDXpvVq66CKkqFNy71kQML9+c5iunv8NdF8JUHPP/96vBjNx6NHehBNt2oY25K169Zac5GPHZ6G96HioyxC51ARQh9d+Lrd7t1iUe8ouVi6+P2+z4pVBk+aDCM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760988882; c=relaxed/simple;
	bh=Uw10jC0g2pSpAFcj5W+xKV8/iHvJ/5K1/K3VwH7N4tg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d2VKaSuCixJHNfcTqBf2K2yFDDwniplHDodyAu/xsQHylSa6D6uAf0A8RwyRPao/dichnS9G86ccYZJKMK1b9ImIiQrOL6oSJfiFn7rwnuXHPNiFIeE7tZz5KDYTij+7kakMc85HEbnJYVRh5xNdjTN5YUMJYTa7ZLc8DCGUdkM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=EedBnRWn; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4cr5GZ0RmHzyYq;
	Mon, 20 Oct 2025 22:34:29 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1760988870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Qm1A/SY4GA+rMSJLcvk9BGzNhePNLM9VWyUaf0UvA2Y=;
	b=EedBnRWnzEQOUD8VqmPKZ4S3ksaYZ/Kn3x3LOdH76LQNSOeZ2KzNAtR8fq+bVfnPQPq+0S
	oZhn8bLFixP4VUgcnbkXYgvbItKSCBgDGEhvMHwmSqZ6a9E/Oaq+kXhQD/M2D+0/O4Zo9Q
	mYXnx/XjbaM8txaEExQ/Apx/hhOa48w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1760988870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Qm1A/SY4GA+rMSJLcvk9BGzNhePNLM9VWyUaf0UvA2Y=;
	b=cZfPCOKsf3/QS6vm8E6/IRyD2BSWZrqxPgvJmtn26s3YK2Ioq/AJhV4PGnzDbdFElkBidF
	n+I9wHhFe7MBlJ77vyrA7BBHyUoiO3o5QHzBSDJw/LxxrvlbeUKbI3HUtlgipweQVcsf9P
	GKAswBgdOY9/qsCAI8uzvmvt6x3xIXM=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1760988870; a=rsa-sha256; cv=none;
	b=p6AssB4cOn4hRkQmNAGnm0ICbpfiDEjBMKmnrdG8oGUTi9ddO1YjLL5frb9uYOnDZ40n2x
	2lUr55UiPwLv89gPlVLHI6VWrGdD4wiwG1tUIRZSu1vAi+zrmoURPkzQVALsgKd/eViv1u
	ku58Vp8w+xlprtZ3h2KVcmWwb/Deqpg=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id AB505634C50;
	Mon, 20 Oct 2025 22:34:29 +0300 (EEST)
Date: Mon, 20 Oct 2025 22:34:29 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Ricardo Ribalda <ribalda@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: i2c: imx214: Exit early on control init errors
Message-ID: <aPaOxb9DyQfnU7_Q@valkosipuli.retiisi.eu>
References: <20251014-imx214-smatch-v2-1-04218043086d@chromium.org>
 <aPZ_YRwpDNPFjePX@valkosipuli.retiisi.eu>
 <CANiDSCt+E+Ogr9+Y4_4KA_vBOYyTNZgwZVBD2wLMJirQE+PS3Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCt+E+Ogr9+Y4_4KA_vBOYyTNZgwZVBD2wLMJirQE+PS3Q@mail.gmail.com>

Hi Ricardo,

On Mon, Oct 20, 2025 at 08:51:44PM +0200, Ricardo Ribalda wrote:
> Hi Sakari
> 
> On Mon, 20 Oct 2025 at 20:28, Sakari Ailus <sakari.ailus@iki.fi> wrote:
> >
> > Hi Ricardo,
> >
> > On Tue, Oct 14, 2025 at 11:00:17AM +0000, Ricardo Ribalda wrote:
> > > Now we try to initialize all the controls and at the very end check
> > > ctrl_hdlr->error to check if one of them has failed.
> > >
> > > This confuses smatch, who do not know how to track the state of
> > > imx214->link_freq.
> > >
> > > drivers/media/i2c/imx214.c:1109 imx214_ctrls_init() error: we previously assumed 'imx214->link_freq' could be null (see line 1017)
> > >
> > > Fix this by exiting early on control initialization errors.
> > >
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > > Right now we are handling this with a quirk in media-ci, if Dan cannot
> > > fix smatch in a kernel cycle we should merge this patch.
> > > ---
> > > Changes in v2:
> > > - Fix typo in commit message commit
> > > - Move error tag where it belongs (Thanks Hans!)
> > > - Link to v1: https://lore.kernel.org/r/20250829-imx214-smatch-v1-1-f3d1653b48e4@chromium.org
> > > ---
> > >  drivers/media/i2c/imx214.c | 7 +++++--
> > >  1 file changed, 5 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> > > index 94ebe625c9e6ee0fb67fe1d89b48b2f1bf58ffc6..c66f0e18726c3fc15df91c37888a797bcea82134 100644
> > > --- a/drivers/media/i2c/imx214.c
> > > +++ b/drivers/media/i2c/imx214.c
> > > @@ -1014,8 +1014,10 @@ static int imx214_ctrls_init(struct imx214 *imx214)
> > >                                                  V4L2_CID_LINK_FREQ,
> > >                                                  imx214->bus_cfg.nr_of_link_frequencies - 1,
> > >                                                  0, imx214->bus_cfg.link_frequencies);
> > > -     if (imx214->link_freq)
> > > -             imx214->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > > +     if (!imx214->link_freq)
> > > +             goto err_init_ctrl;
> > > +
> > > +     imx214->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> >
> > You could do this cleaner by simply moving the assignment after the handler
> > error check. Some drivers do that already.
> >
> > I wonder why this seems to be a problem for smatch in the imx214 driver as
> > the pattern is widely used across the sensor drivers.
> 
> Smatch thinks that there could be case where
> 
> imx->link_freq = NULL, and imx214_pll_update returns 0.
> 
> That is not solved by moving the assignment `imx214->link_freq->flags
> |=` after if (ret)

Did you test this? The smatch message suggests otherwise (but of course
this could just turn into a different smatch error).

> 
> I believe Dan is already flagged about this, but I do not think that
> it will be super simple to fix in his code.
> 
> If smatch can handle this case before rc5 I will delete this patch.

There are other options, too, such as storing the link frequency index (the
driver won't even support setting it) or the frequency itself.

-- 
Regards,

Sakari Ailus

