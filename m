Return-Path: <linux-media+bounces-15921-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 589D094A794
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 14:17:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8CDFAB2369F
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 12:17:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C8C01E4F0D;
	Wed,  7 Aug 2024 12:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nNPraoPk"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92101C6880;
	Wed,  7 Aug 2024 12:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723033035; cv=none; b=IfCnGvfJtcZ7NMGm20f5UqzHwtNeS/XxskskbZt3DKpVdcUeYYRk15CCT10L9SS41aIH93JGm00mLa+XS6M/JX8UpFuSI/8LuEovGj7o+nH1ymKCgSHbMdGrQ8qdL9Mma2xFdzjCwqUJc2Be05pJTTxf/okhxNWoOM/lHXB0U1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723033035; c=relaxed/simple;
	bh=MzODBw2PgYUBhVUcY5tDy21uTFkxN/Orhgmd/TWEfdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qL3n/EVfJML5N10NTOsQYub2bB5wJWNgOf7n//puNxucSHvUBrlRmsTNHiFmMmvX8+DdworKlpSW8ZAcAnp40AcZfdm356API0wd3aklQLrD2i2GT4IUtZe5BXiZclySnpMxjsM/YJq7422Z3jjfvBJU4kd/wJA+fVplxdNE/3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nNPraoPk; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EDABD2EC;
	Wed,  7 Aug 2024 14:16:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1723032979;
	bh=MzODBw2PgYUBhVUcY5tDy21uTFkxN/Orhgmd/TWEfdQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nNPraoPk+YVR7pK4cj2FSsaASQgde8o3f4FkbwK96Ioy1v338SNfz0sWN4TD2zsnA
	 7wSBa3WwiXlWT6U/gwUJhBw0kO9dGJn32nTQeUzJuHo/brYvBmuZ55rU5gRObI4Pcs
	 IKOaSuXZpYAKmKIROoPQGbZC2U1aEdiMSJFCZOa8=
Date: Wed, 7 Aug 2024 15:16:48 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Benjamin Bara <bbara93@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Benjamin Bara <benjamin.bara@skidata.com>,
	arne.caspari@theimagingsource.com
Subject: Re: [PATCH 2/2] media: i2c: imx290: Check for availability in probe()
Message-ID: <20240807121648.GC8166@pendragon.ideasonboard.com>
References: <20240807-imx290-avail-v1-0-666c130c7601@skidata.com>
 <20240807094957.GE21319@pendragon.ideasonboard.com>
 <CAJpcXm6Ey9xMX2btO+xH3MF3z39hqP5ZjkOgEUcaNY822urJ5w@mail.gmail.com>
 <4588174.LvFx2qVVIh@steina-w>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4588174.LvFx2qVVIh@steina-w>

On Wed, Aug 07, 2024 at 02:12:04PM +0200, Alexander Stein wrote:
> Am Mittwoch, 7. August 2024, 13:07:24 CEST schrieb Benjamin Bara:
> > On Wed, 7 Aug 2024 at 11:50, Laurent Pinchart wrote:
> > > On Wed, Aug 07, 2024 at 10:47:39AM +0200, Benjamin Bara wrote:
> > > > On Wed, 7 Aug 2024 at 10:33, Alexander Stein wrote:
> > > > > Am Mittwoch, 7. August 2024, 10:10:28 CEST schrieb Benjamin Bara:
> > > > > > Currently, the V4L2 subdevice is also created when the device is not
> > > > > > available/connected. In this case, dmesg shows the following:
> > > > > >
> > > > > > [   10.419510] imx290 7-001a: Error writing reg 0x301c: -6
> > > > > > [   10.428981] imx290 7-001a: Error writing reg 0x3020: -6
> > > > > > [   10.442712] imx290 7-001a: Error writing reg 0x3018: -6
> > > > > > [   10.454018] imx290 7-001a: Error writing reg 0x3020: -6
> > > > > >
> > > > > > which seems to come from imx290_ctrl_update() after the subdev init is
> > > > > > finished. However, as the errors are ignored, the subdev is initialized
> > > > > > but simply does not work. From userspace perspective, there is no
> > > > > > visible difference between a working and not-working subdevice (except
> > > > > > when trying it out or watching for the error message).
> > > > > >
> > > > > > This commit adds a simple availability check before starting with the
> > > > > > subdev initialization to error out instead.
> > > > >
> > > > > There is already a patch reading the ID register at [1]. This also reads the
> > > > > ID register. But I don't have any documentation regarding that register,
> > > > > neither address nor values definitions. If there is known information about
> > > > > that I would prefer reading the ID and compare it to expected values.
> > > >
> > > > Thanks for the link - it seems like Laurent has dropped the patch for
> > > > the more recent kernel versions on their GitLab.
> > >
> > > It was a patch that I wrote as a test, and I decided not to upstream it
> > > as it had limited value to me. The downside with reading registers at
> > > probe time is that you have to power up the sensor. This can have
> > > undesired side effects, such as flashing a privacy LED on at boot time
> > > in devices that have one. There's also the increase in boot time due to
> > > the power up sequence, which one may want to avoid.
> > >
> > > The imx290 driver already powers up the device unconditionally at probe
> > > time, so reading the version register wouldn't be much of an issue I
> > > suppose. I would be fine merging that patch.
> > >
> > > > This was also my initial intention, but similar to you, I don't have a
> > > > docu describing this register, so I am not sure where the info is coming
> > > > from and if it really contains the identification/type info. Probably
> > > > Laurent has more infos on that.
> > >
> > > That's a good question. I don't see a mention of that register in the
> > > IMX290 datasheet I've found online
> > > (https://static6.arrow.com/aropdfconversion/c0c7efde6571c768020a72f59b226308b9669e45/sony_imx290lqr-c_datasheet.pdf).
> > > Looking at the git history, the IMX290_CHIP_ID register macro was
> > > introduced in an unrelated commit, without an explanation. I don't
> > > recall where it comes from, but I don't think I've added it randomly. It
> > > may have come from an out-of-tree driver.
> > 
> > Thanks for the info!
> > 
> > > I don't have an IMX290 plugged in at the moment, what's the value of the
> > > register ?
> > 
> > I currently have an imx462 available, which is not "officially supported" yet,
> > but basically an imx290 derivative. With your patch applied:
> > 
> > [   10.424187] imx290 7-001a: chip ID 0x07d0
> 
> Okay, this is from a imx327lqr:
> 
> [   15.265086] imx290 3-001a: chip ID 0x07d0
> 
> Doesn't look like an ID register to me.

Indeed, it's quite suspicious.

I wonder if we could find a more applicable register. Chip ID registers
are usually located at the beginning or end of the register space, we
could have a look there.

> > > > > [1] https://gitlab.com/ideasonboard/nxp/linux/-/commit/85ce725f1de7c16133bfb92b2ab0d3d84efcdb47
> > > > >
> > > > > > Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
> > > > > > ---
> > > > > >  drivers/media/i2c/imx290.c | 5 +++++
> > > > > >  1 file changed, 5 insertions(+)
> > > > > >
> > > > > > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > > > > > index 4150e6e4b9a6..a86076e42a36 100644
> > > > > > --- a/drivers/media/i2c/imx290.c
> > > > > > +++ b/drivers/media/i2c/imx290.c
> > > > > > @@ -1580,6 +1580,11 @@ static int imx290_probe(struct i2c_client *client)
> > > > > >       pm_runtime_set_autosuspend_delay(dev, 1000);
> > > > > >       pm_runtime_use_autosuspend(dev);
> > > > > >
> > > > > > +     /* Make sure the sensor is available before V4L2 subdev init. */
> > > > > > +     ret = cci_read(imx290->regmap, IMX290_STANDBY, NULL, NULL);
> > > > > > +     if (ret)
> > > > > > +             goto err_pm;
> > > > > > +
> > > > > >       /* Initialize the V4L2 subdev. */
> > > > > >       ret = imx290_subdev_init(imx290);
> > > > > >       if (ret)

-- 
Regards,

Laurent Pinchart

