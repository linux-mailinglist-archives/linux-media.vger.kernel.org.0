Return-Path: <linux-media+bounces-2922-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA4881CF3D
	for <lists+linux-media@lfdr.de>; Fri, 22 Dec 2023 21:26:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6BE81C22C35
	for <lists+linux-media@lfdr.de>; Fri, 22 Dec 2023 20:26:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 536782E84C;
	Fri, 22 Dec 2023 20:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KzB10BXj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4102E83B
	for <linux-media@vger.kernel.org>; Fri, 22 Dec 2023 20:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-58962bf3f89so379652a12.0
        for <linux-media@vger.kernel.org>; Fri, 22 Dec 2023 12:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703276785; x=1703881585; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j80lvJyXA/kiYI3infzo9VUhwlud8Yj01NPyEzQk6RE=;
        b=KzB10BXjfZMySAcuFZ9QUc+y7cPB/IxXbHJNBMdAS4hMokoZC+wWriumNw/RnDZ+Oz
         GpQ7FREPS69i9yKm0Qn8sD+5LtORXyi5XkbLxLoIgJwbJRV0TOKM6T/LDsVzcRIC1YnS
         BbjRoFoMl6BCutEqn/xjebECr8zBLNMHCiLMvtAk87Q7izTjaqPAOoOoSjKK2yzJVHLi
         312ydIRTE03cyqosxAdNiP90s9IZhflWtp34GOhugCg+PyD3pwYS1RI+dPWhqix3rVpO
         Qcz1M+ph/jWgbgzvnU2zZczn0YUdx7Zs/qzzImXHIfj7wVhs/tDUhpx1B83HYjJ1KMnw
         AipA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703276785; x=1703881585;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j80lvJyXA/kiYI3infzo9VUhwlud8Yj01NPyEzQk6RE=;
        b=iWcB4I2VUCb8wb8+xZH9ax1A4DbgwXMKJpAtuLelDeWLiofuuXYqWWWa4C3rPikwih
         FpP46IS/5YJAUxq3UFQbSiYeczmYYzkXKDwgAjg4XhD4an+gEYvCjlYmNaE5Ax3aVcKX
         fsYTgYRkc6SaCn3NykZ988Y9van0HMGYNWR9m67BYAzTp7+eBg4HZyJxEXOtDvnvcAZK
         aBuqda12TBBBfjcC52BuoE7SpQA6JAvp0+o4Pny6wHmxeKhRu/scCopm8qOys0QEoc66
         zBXlwI9PyEEq9P/pJtWcC3jPdX4JquqFPv7qVpEM15zTYHJU4ElRXgUy9EPDZKtpselr
         kmTQ==
X-Gm-Message-State: AOJu0Yw7mn345MVVuqFKOjgFOrMmKyFmfGxgW07ejyW8OgnVS8tVeZYV
	ZH9ujIo4fq4hFGoFvMxq6tzYKK7YpYfbO1EOE7E=
X-Google-Smtp-Source: AGHT+IFb1FDilCfI/0VXJBLdGNW+mVc/K+tNdUJBJ+8XtYF+vCl8rVdkzwdr4ylskWrHraIiys/SJZAf/JLUud3Apb8=
X-Received: by 2002:a05:6a00:2390:b0:6d9:471d:fada with SMTP id
 f16-20020a056a00239000b006d9471dfadamr3763280pfc.2.1703276784762; Fri, 22 Dec
 2023 12:26:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJ+vNU2Kj=a-_xDBsNO5zkyP_mgLsVtA2bXqkAkpmCQmVEA_=w@mail.gmail.com>
In-Reply-To: <CAJ+vNU2Kj=a-_xDBsNO5zkyP_mgLsVtA2bXqkAkpmCQmVEA_=w@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 22 Dec 2023 17:26:11 -0300
Message-ID: <CAOMZO5CX4xuMvZDMVEND0vpMyuU7ozDm2pk+yVQZAKLenipY_g@mail.gmail.com>
Subject: Re: imx7_media_csi probe deferred
To: Tim Harvey <tharvey@gateworks.com>
Cc: linux-media <linux-media@vger.kernel.org>, 
	Schrempf Frieder <frieder.schrempf@kontron.de>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, NXP Linux Team <linux-imx@nxp.com>, 
	Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tim,

On Thu, Dec 21, 2023 at 10:12=E2=80=AFPM Tim Harvey <tharvey@gateworks.com>=
 wrote:
>
> Greetings,
>
> I'm running into an issue with Linux 6.6 (6.6.8) when compiling with
> modules where the imx7_media_csi driver probe is deferred and I'm not
> clear how to troubleshoot the cause.
>
> The board is imx8mm-venice-gw73xx-0x [1] with
> imx8mm-venice-gw73xx-0x-imx219.dtso [2] and I'm using
> arch/arm64/configs/defconfig.
>
> The kernel reports the following:
> # dmesg | egrep csi\|mipi\|imx219
> [    1.293264] i2c 2-0010: Fixed dependency cycle(s) with
> /soc@0/bus@32c00000/mipi-csi@32e30000/ports/port@0/endpoint
> [   12.001419] imx219 2-0010: supply VANA not found, using dummy regulato=
r
> [   12.044885] imx219 2-0010: supply VDDL not found, using dummy regulato=
r
> [   12.164308] imx7-csi 32e20000.csi: Registered csi capture as /dev/vide=
o0
> [   12.178460] imx7-csi 32e20000.csi: error -ENOTCONN: Failed to get
> remote endpoint
> [   12.200047] imx7-csi: probe of 32e20000.csi failed with error -107
> # cat /sys/kernel/debug/devices_deferred
> cpufreq-dt
> 32e30000.mipi-csi       platform: wait for supplier

I am not able to reproduce this problem.

I have just booted 6.6.8 on an imx8mm-evk and the camera is working well:

root@imx8mmevk:~# dmesg | egrep csi\|mipi\|ov56
[    0.042431] platform 32e30000.mipi-csi: Fixed dependency cycle(s)
with /soc@0/bus@32c00000/csi@32e20000/port/endpoint
[    1.575489] i2c 2-003c: Fixed dependency cycle(s) with
/soc@0/bus@32c00000/mipi-csi@32e30000/ports/port@0/endpoint
[    5.514082] ov5640 2-003c: supply DOVDD not found, using dummy regulator
[    5.522453] ov5640 2-003c: supply AVDD not found, using dummy regulator
[    5.538136] ov5640 2-003c: supply DVDD not found, using dummy regulator
[    5.552376] imx-mipi-csis 32e30000.mipi-csi: lanes: 2, freq: 333000000
[    5.583661] imx7-csi 32e20000.csi: Registered csi capture as /dev/video0

root@imx8mmevk:~# cat /sys/kernel/debug/devices_deferred
root@imx8mmevk:~# zcat /proc/config.gz | egrep
VIDEO_OV5640\|VIDEO_IMX_MIPI\|VIDEO_IMX7
CONFIG_VIDEO_IMX7_CSI=3Dm
CONFIG_VIDEO_IMX_MIPI_CSIS=3Dm
CONFIG_VIDEO_OV5640=3Dm

