Return-Path: <linux-media+bounces-17387-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F14968D4D
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 20:23:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B99451C21886
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 18:23:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5EB219CC1C;
	Mon,  2 Sep 2024 18:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="m6f7viYR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E237A3D7A
	for <linux-media@vger.kernel.org>; Mon,  2 Sep 2024 18:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725301382; cv=none; b=mVHT0aYb5l9ye4i++RtcnEjKRPFX8Mx2Y5hW5nGog/8vtBayiIGQ/Ut6VfQrTFqEVKC4c6HqOMNJdSCdXCdQuHVWAV/SQsj2pdT3G9VYjDgoxW8cx6edDbxGM+7p4iemYYzB+rt1n5FklelxDDOOXlD7SA9+HbYdMRCARW42aQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725301382; c=relaxed/simple;
	bh=04wvQ4AZYQ7zy0JjEYXU06FGmNxfOwFZ8NnHJdRFIQo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hgACBmL2qkaHNokSWGDJGG1Z4N2ZZh+nQZ5bCpClIemfJgYNRPyE0JzkxCOzaAxiulD/CY2hx0Oiddo0EkDhd5+yPRJWiAA9hg7fLB9i/mEg+BKxLpkAK+tCP8plMkhtaX0sjJ8uw/1YrxW72UnCn3x7e2zohaFW/12sDNY5wrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=m6f7viYR; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e03caab48a2so3487782276.1
        for <linux-media@vger.kernel.org>; Mon, 02 Sep 2024 11:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1725301379; x=1725906179; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9mM7EuXxTiEjeCHAHh7jAITe46X027w52xJShQf4f90=;
        b=m6f7viYR8ZmBhNTmnttzmL+zWWq3OYvphNwzMW2mKMShlBtgqo6HXckWUvyBXI8Y6H
         6iEVjp57uq10i9GYThzOoVGBe1VpwkdOMZBZ3EmIBrEm1aGw0FJ/RR3uGDH3becU+Sd/
         +2dqT771nFOdYm9h5LNMvY0EpxrX7MIRBVJ1/Ylxh6cLJoL4fbXtiTPeqbgpHogiO1B7
         /sHe5yI4pcVDcGdyKvB8igprvNdamhvCepOxDvkGLwi5TOYM8CHdFE3egBWRNolj0Oq4
         L2AFLBG5r20ZBWxF16lo5MfMZ/jEpQ7+yR06CEGmEFl5gXnKxHROVcGXgJs1SlFjgKS9
         x9zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725301379; x=1725906179;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9mM7EuXxTiEjeCHAHh7jAITe46X027w52xJShQf4f90=;
        b=UlentdPunR2m9aJXhDI24FtRm3UmJzA4d2vmMRwBmKmwRd4Wr9Dsjn8d4NrsAVFHvp
         auZpRs2YIRvkgcouU2oP6TCerUE2CXeVtk/o2nFN7SOwz8U2+U2HNyyL5gDywn9ltqkN
         /KdXfzf6CDJBhp97Sigtpck/D2Vht5pJx48vu5HMljnHOsoM/l1BUWx2CHOMZILWwcuv
         ExzLpM/fWaTNe4aLZTWVffVewSfprjAAgnce44yHGawARjcjM8yL21Y7A8h4SMIbnub4
         HRUJWslWt5xxt8eZf+WJre7icMmtC+ySnuplWEB3ATXhWDh4R1RrOrTgo7LSjIe6cGoo
         Lt2w==
X-Forwarded-Encrypted: i=1; AJvYcCXwM0riX/4Z6/wyjGt8uFswdtC1Tr/B5hXEDenfOtwA/ofRBBMtNH9rU0Mflot5i2a8hvocEjX2vMOjbg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+7+1TqMPVsSiQUdoevca5YOLg2QMEg4Eiih/eWblA1Obx3gZ2
	Ngcuw1ivVaZ2LEusMauGcNfdrp21LwINfWXBH52tyb3+/Vx3fdVLj8+TbY/5W5UXpsbznIH7rc2
	0wmP8qgLh2OH5db5Il+b31cgD0dYmt7uHMSGhng==
X-Google-Smtp-Source: AGHT+IGEFVjdUttjCxtgN/4YwFVYH8BLBCCzpnDhN+TVamcHVBhGYiwDrWnziqXXLjiYQiuUzQW6YbkCzOAG0AQ5dqg=
X-Received: by 2002:a05:6902:1b89:b0:e0b:ecb9:2094 with SMTP id
 3f1490d57ef6-e1a7a055915mr9923848276.12.1725301378889; Mon, 02 Sep 2024
 11:22:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240902-imx290-avail-v3-0-b32a12799fed@skidata.com> <20240902-imx290-avail-v3-6-b32a12799fed@skidata.com>
In-Reply-To: <20240902-imx290-avail-v3-6-b32a12799fed@skidata.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 2 Sep 2024 19:22:43 +0100
Message-ID: <CAPY8ntCCCpjohup5Aqrrt6mRXpBukKUFnQWkuwKJ=xJCW=PDog@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] media: i2c: imx290: Check for availability in probe()
To: bbara93@gmail.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Benjamin Bara <benjamin.bara@skidata.com>
Content-Type: text/plain; charset="UTF-8"

Hi Benjamin

On Mon, 2 Sept 2024 at 16:58, <bbara93@gmail.com> wrote:
>
> From: Benjamin Bara <benjamin.bara@skidata.com>
>
> Currently, the V4L2 subdevice is also created when the device is not
> available/connected. From userspace perspective, there is no visible
> difference between a working and not-working subdevice (except when
> trying it out).
>
> This commit adds a simple availability check before starting with the
> subdev initialization to error out instead.
>
> Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
> ---
> Changes since v2:
> - the new 1/8 is split out
> - use dev_err_probe() (thx Laurent)
> ---
>  drivers/media/i2c/imx290.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 9610e9fd2059..6b292bbb0856 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -1571,6 +1571,7 @@ static int imx290_probe(struct i2c_client *client)
>  {
>         struct device *dev = &client->dev;
>         struct imx290 *imx290;
> +       u64 val;
>         int ret;
>
>         imx290 = devm_kzalloc(dev, sizeof(*imx290), GFP_KERNEL);
> @@ -1631,6 +1632,17 @@ static int imx290_probe(struct i2c_client *client)
>         pm_runtime_set_autosuspend_delay(dev, 1000);
>         pm_runtime_use_autosuspend(dev);
>
> +       /* Make sure the sensor is available before V4L2 subdev init. */
> +       ret = cci_read(imx290->regmap, IMX290_STANDBY, &val, NULL);
> +       if (ret) {
> +               ret = dev_err_probe(dev, -ENODEV, "Failed to detect sensor\n");
> +               goto err_pm;
> +       }
> +       if (val != IMX290_STANDBY_STANDBY) {

As Laurent commented on v2, this is a slightly unsafe check. If the
device isn't controlled via a regulator then there's no guarantee that
the sensor will be in standby.
The cci_read call will already have returned an error if the sensor
isn't present which will be 99.999% of the error cases.

If you want to catch the case where it's not in standby, why not put
it into standby as a recovery mechanism. It'd be a better user
experience than just bombing out of the probe.

  Dave

> +               ret = dev_err_probe(dev, -ENODEV, "Sensor is not in standby\n");
> +               goto err_pm;
> +       }
> +
>         /* Initialize the V4L2 subdev. */
>         ret = imx290_subdev_init(imx290);
>         if (ret)
>
> --
> 2.46.0
>
>

