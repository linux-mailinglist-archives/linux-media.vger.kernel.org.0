Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97EF442A424
	for <lists+linux-media@lfdr.de>; Tue, 12 Oct 2021 14:15:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236336AbhJLMRO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Oct 2021 08:17:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236196AbhJLMRN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Oct 2021 08:17:13 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AF24C061570;
        Tue, 12 Oct 2021 05:15:12 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5C099E7;
        Tue, 12 Oct 2021 14:15:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1634040909;
        bh=CCt/RZJZYJQHKeq2CmDncjLPs5cyvDBLmABtgkNI134=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=TnPXteAtjSIshmqQL0gGqQvIq9jbrizAyqrG/h7iQTdB2Xo+Dqe1y2RgLuc5AN+5u
         VBozScnDuTRBTPpIXSrZvD9SJHrBS1ezVZV5ygP5ovTqC6c8jBXt1AUnRXq6VXzYW3
         7cerD3d37zIl7PxNhdgmOy89jSfurCabN0mskxq8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211012082150.GA31086@kili>
References: <20211012082150.GA31086@kili>
Subject: Re: [PATCH] media: atomisp: fix uninitialized bug in gmin_get_pmic_id_and_addr()
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Aniket Bhattacharyea <aniketmail669@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        kernel-janitors@vger.kernel.org
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Date:   Tue, 12 Oct 2021 13:15:07 +0100
Message-ID: <163404090731.2943484.13435330592523167555@Monstersaurus>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Dan Carpenter (2021-10-12 09:21:50)
> The "power" pointer is not initialized on the else path and that would
> lead to an Oops.
>=20

Yes, that looks like a good catch.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> Fixes: c30f4cb2d4c7 ("media: atomisp: Refactor PMIC detection to a separa=
te function")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/=
drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> index d8c9e31314b2..62dc06e22476 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> @@ -481,7 +481,7 @@ static int atomisp_get_acpi_power(struct device *dev)
> =20
>  static u8 gmin_get_pmic_id_and_addr(struct device *dev)
>  {
> -       struct i2c_client *power;
> +       struct i2c_client *power =3D NULL;
>         static u8 pmic_i2c_addr;
> =20
>         if (pmic_id)
> --=20
> 2.20.1
>
