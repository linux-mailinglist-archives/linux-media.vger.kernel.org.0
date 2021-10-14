Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24A4C42D874
	for <lists+linux-media@lfdr.de>; Thu, 14 Oct 2021 13:45:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231249AbhJNLra (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Oct 2021 07:47:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231177AbhJNLra (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Oct 2021 07:47:30 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7093FC061570;
        Thu, 14 Oct 2021 04:45:25 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 04671268;
        Thu, 14 Oct 2021 13:45:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1634211922;
        bh=NI2yghy2CK+mNIPPcMsps/HtBL1jPLdPKXJdpTj0gME=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=d+hTpRv1NhXOK10IXrYWY2aw9P63m3nLAw/U/BVs9oFvQ7tSUrZUAwTdpToEppoJn
         vIN/MdWC1nNIfEfiMWV+ujb3n6pqRT62lZTtT9qmuDehabZXUSLSaME134JfHqUE6p
         C9kjiWOUdFkXDqqMtx4wwDyfYENSTxdRWU7s8cNs=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211013075319.GA6010@kili>
References: <20211013075319.GA6010@kili>
Subject: Re: [PATCH] media: ipu3-cio2: fix error code in cio2_bridge_connect_sensor()
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Dan Scally <djrscally@gmail.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Fabian =?utf-8?q?W=C3=BCthrich?= <me@fabwu.ch>,
        Yong Zhi <yong.zhi@intel.com>
Date:   Thu, 14 Oct 2021 12:45:19 +0100
Message-ID: <163421191963.3878617.4945041938867839263@Monstersaurus>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Dan Carpenter (2021-10-13 08:53:19)
> Return -ENODEV if acpi_get_physical_device_location() fails.  Don't
> return success.
>=20
> Fixes: 485aa3df0dff ("media: ipu3-cio2: Parse sensor orientation and rota=
tion")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/media/pci/intel/ipu3/cio2-bridge.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.c b/drivers/media/p=
ci/intel/ipu3/cio2-bridge.c
> index 67c467d3c81f..0b586b4e537e 100644
> --- a/drivers/media/pci/intel/ipu3/cio2-bridge.c
> +++ b/drivers/media/pci/intel/ipu3/cio2-bridge.c
> @@ -238,8 +238,10 @@ static int cio2_bridge_connect_sensor(const struct c=
io2_sensor_config *cfg,
>                         goto err_put_adev;
> =20
>                 status =3D acpi_get_physical_device_location(adev->handle=
, &sensor->pld);
> -               if (ACPI_FAILURE(status))
> +               if (ACPI_FAILURE(status)) {
> +                       ret =3D -ENODEV;
>                         goto err_put_adev;
> +               }
> =20
>                 if (sensor->ssdb.lanes > CIO2_MAX_LANES) {
>                         dev_err(&adev->dev,
> --=20
> 2.20.1
>
