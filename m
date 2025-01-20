Return-Path: <linux-media+bounces-24939-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6115BA16AB3
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 11:28:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1806918876D6
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 10:28:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B97A41B4232;
	Mon, 20 Jan 2025 10:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="AP4csjCN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E011189B9C
	for <linux-media@vger.kernel.org>; Mon, 20 Jan 2025 10:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737368886; cv=none; b=Zk7b+awbOzym5NRRXwUqPZNxwXY3vU8JXgvyw8xm8EZLVI9c9A67zUNZiRx0lwN74ONcI+ip+Pedll5+1qD2gbsPgQ0d9EHt5rhWJd6Y1vNSsNR7GswFArtLGfs5gvUetzfyqRW1shRDIF9AlZO/KqTUeTac2AlbYj8zHQ48mFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737368886; c=relaxed/simple;
	bh=+AwKlC9bbGjJjxYIHX8T2G8huCpTOyuzw0+voJbl1SI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DUDr+7zwtOm62ydAQGsMmm2wVQDIi21cvEByNrxL8LV10Bqjb9EdbC/W0jPWcT6pxExV7z+i35ghHX8RO01FMrlBVFTJgf8zrKkKfvByNNdLO66TAlNTxGX22+/uM4VdqTOIS7UpQtICDxfadheKGs+mPa+XRTaLWVFuHwrFPz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=AP4csjCN; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e54bd61e793so7641947276.2
        for <linux-media@vger.kernel.org>; Mon, 20 Jan 2025 02:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1737368883; x=1737973683; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P8B34zlXidfpPZnhz7yMPPbNHDr9o8BD9+jKePXCoUU=;
        b=AP4csjCNkkq164fVToe3Gfebm740tSkxKd43Jzh7iLoyCK1t1UacOMKLCWQy8RinI9
         JZBsOrqJqiaKdWM/vdbjXifvb7oOfvMkKZlBjPshMJuvIPoyGwD+X2uNr8a79V8JHiEk
         9bkEwLDkzh/Sn7M7KNfCabmgWES+ukJxTwauc6jwyNHZGBN0z6Muwl3K1riEVYyzacE/
         f67Lbgm0QRFywVQUzAxlNrsCh9jHtORJPqnudMIY6UCOSq7YJi8PsSsLgsaNBLoNt3Dq
         EtZjk1cQ42vWCkPaLZGvudRkQSzZTxDddMdy4HZoaOo9PFBWvsfjOK1mxdq9afBEk1io
         t1LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737368883; x=1737973683;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P8B34zlXidfpPZnhz7yMPPbNHDr9o8BD9+jKePXCoUU=;
        b=GKm3TKeJK+kLepEZmvc5t3/JtSLkos3SRPpuy9GVO6yupYKOidNd+csxfY44yQ/5Zf
         XQSC7LrcuOzjluU4V4xk51DAMPg62z2XgFLgazRoOJj02CWtePJSfXns2HrBO01HYqJ1
         mZlFCVuZ9dgrkgIJK5ZclQO936v7neTnUaKEFQ8P9AQEJA/vqeCBrkTCl8nbL5QFVnDd
         54uM1ryOeWCHue/B/hs1UTOseKOBM5ulqoKVytvHPEe+IY8mngZ6vzeSIbQWuVFWT0oH
         RhXu61W7MNd2rdXxxGfH6PCN9ulFNsJyVNvRD8I+V+YK279cvgu890Ao7HmIv/WPqNgZ
         O1+g==
X-Gm-Message-State: AOJu0YynC2k6Z5F9hOYsEMcdGkcdZhiwLAyo5Ijuv3q2de1dEGDPNjqV
	dYF9zpRnByKNZsg9bto5ja6Had3LVSj7A6GbYOxpvkthetVF8SOhWsfue6E4SrwguASI4KE56Zk
	P9XsEKK8xapCCHK7MzWLwNvWK5pyhoX/qYW2tLw==
X-Gm-Gg: ASbGncsIaTqOK5APov1VMgNzUKoRrLtOEQEj5OwZh8ZTLKr85RhffI9K1mmjtviZDoR
	vE1G+muHQoKVikS4LWT++xve5JfTJ/Zas8V9T1IhzDlXOJ0DlNys=
X-Google-Smtp-Source: AGHT+IEvzXS4nWuNbbtvgkp174P+KPpMvx9D3NL9zti7xDJSJew8cPPDOJpHIDsD9B1t4QpVe9tmq4mmiu8p0cwXB7M=
X-Received: by 2002:a05:6902:1b81:b0:e57:414b:577e with SMTP id
 3f1490d57ef6-e57b1051956mr9123320276.12.1737368882763; Mon, 20 Jan 2025
 02:28:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250116124118.42130-1-sakari.ailus@linux.intel.com> <20250116124118.42130-4-sakari.ailus@linux.intel.com>
In-Reply-To: <20250116124118.42130-4-sakari.ailus@linux.intel.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 20 Jan 2025 10:27:45 +0000
X-Gm-Features: AbW1kvZyI_Q11F01rHREAARRDpP-BB7rG7oa0laWhJJadhirA0tMKLv6mO2pngg
Message-ID: <CAPY8ntC2MFOmh9Pm-CG1Y37_eAw+4ns0LcWV402RL3FXMeQBJw@mail.gmail.com>
Subject: Re: [PATCH 3/4] media: i2c: imx219: Rectify runtime PM handling in
 probe and remove
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>, 
	Andrey Konovalov <andrey.konovalov@linaro.org>, Tianshu Qiu <tian.shu.qiu@intel.com>
Content-Type: text/plain; charset="UTF-8"

Thanks Sakari

On Thu, 16 Jan 2025 at 12:41, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> Set the device's runtime PM status and enable runtime PM before
> registering the async sub-device. This is needed to avoid the case where
> the device is runtime PM resumed while runtime PM has not been enabled
> yet.
>
> Also set the device's runtime PM status to suspended in remove only if it
> wasn't so already.
>
> Fixes: 1283b3b8f82b ("media: i2c: Add driver for Sony IMX219 sensor")
> Cc: stable@vger.kernel.org # for >= v6.6
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/i2c/imx219.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 2d54cea113e1..c6c30109225c 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -1178,6 +1178,9 @@ static int imx219_probe(struct i2c_client *client)
>                 goto error_media_entity;
>         }
>
> +       pm_runtime_set_active(dev);
> +       pm_runtime_enable(dev);
> +
>         ret = v4l2_async_register_subdev_sensor(&imx219->sd);
>         if (ret < 0) {
>                 dev_err_probe(dev, ret,
> @@ -1185,15 +1188,14 @@ static int imx219_probe(struct i2c_client *client)
>                 goto error_subdev_cleanup;
>         }
>
> -       /* Enable runtime PM and turn off the device */
> -       pm_runtime_set_active(dev);
> -       pm_runtime_enable(dev);
>         pm_runtime_idle(dev);
>
>         return 0;
>
>  error_subdev_cleanup:
>         v4l2_subdev_cleanup(&imx219->sd);
> +       pm_runtime_disable(dev);
> +       pm_runtime_set_suspended(dev);
>
>  error_media_entity:
>         media_entity_cleanup(&imx219->sd.entity);
> @@ -1218,9 +1220,10 @@ static void imx219_remove(struct i2c_client *client)
>         imx219_free_controls(imx219);
>
>         pm_runtime_disable(&client->dev);
> -       if (!pm_runtime_status_suspended(&client->dev))
> +       if (!pm_runtime_status_suspended(&client->dev)) {
>                 imx219_power_off(&client->dev);
> -       pm_runtime_set_suspended(&client->dev);
> +               pm_runtime_set_suspended(&client->dev);
> +       }
>  }
>
>  static const struct of_device_id imx219_dt_ids[] = {
> --
> 2.39.5
>

