Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBCB12A7AAC
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 10:34:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730406AbgKEJew (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 04:34:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:60606 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729862AbgKEJew (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Nov 2020 04:34:52 -0500
Received: from coco.lan (unknown [95.90.213.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4294C2080D;
        Thu,  5 Nov 2020 09:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604568891;
        bh=dqyUTPHLhmN1Zu8jHgln0c6PwDsXF91EsPR1TRMZgi0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=sb8eWN8nLNA8YIQEc9uluTBpsExNB8MilUqcg3Uz/qz6xhB3wOTFBrPpBvmCIFump
         9edmZV2RCFcWklCQf/2BL9UYnhqe74YlzYL7014fhHROPTSTNQ7pDhusKx9PHtioVO
         63Sv7ENu69fEJeEi/iIitbzP5VxT3H0YkKWDmR88=
Date:   Thu, 5 Nov 2020 10:34:45 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH v2 029/106] ccs: Remove the =?UTF-8?B?ScKyQw==?= ID
 table
Message-ID: <20201105103445.36d6c5ee@coco.lan>
In-Reply-To: <20201007084557.25843-22-sakari.ailus@linux.intel.com>
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
        <20201007084557.25843-1-sakari.ailus@linux.intel.com>
        <20201007084557.25843-22-sakari.ailus@linux.intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed,  7 Oct 2020 11:44:42 +0300
Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:

> The I=C2=B2C ID table is no longer needed; remove it.

Why not? Please provide more information.

In summary, please change the description in order to answer the
following questions:

For OF-based drivers, removing I2C probing won't cause any harm,
as the patch is keeping css_of_able, but wouldn't it affect other=20
drivers that could, for example, be using ACPI, instead?

Or is this driver incompatible with other probing methods?

>=20
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/ccs/ccs-core.c | 7 -------
>  1 file changed, 7 deletions(-)
>=20
> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs=
-core.c
> index e348f55c62a6..660d5ab2c89d 100644
> --- a/drivers/media/i2c/ccs/ccs-core.c
> +++ b/drivers/media/i2c/ccs/ccs-core.c
> @@ -3244,12 +3244,6 @@ static const struct of_device_id ccs_of_table[] =
=3D {
>  };
>  MODULE_DEVICE_TABLE(of, ccs_of_table);
> =20
> -static const struct i2c_device_id ccs_id_table[] =3D {
> -	{ SMIAPP_NAME, 0 },
> -	{ },
> -};
> -MODULE_DEVICE_TABLE(i2c, ccs_id_table);
> -
>  static const struct dev_pm_ops ccs_pm_ops =3D {
>  	SET_SYSTEM_SLEEP_PM_OPS(ccs_suspend, ccs_resume)
>  	SET_RUNTIME_PM_OPS(ccs_power_off, ccs_power_on, NULL)
> @@ -3263,7 +3257,6 @@ static struct i2c_driver ccs_i2c_driver =3D {
>  	},
>  	.probe_new =3D ccs_probe,
>  	.remove	=3D ccs_remove,
> -	.id_table =3D ccs_id_table,
>  };
> =20
>  static int ccs_module_init(void)



Thanks,
Mauro
