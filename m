Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74BAB441E32
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 17:30:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232672AbhKAQcv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 12:32:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232473AbhKAQcr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Nov 2021 12:32:47 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FD9AC061767
        for <linux-media@vger.kernel.org>; Mon,  1 Nov 2021 09:30:13 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A14CB2CF;
        Mon,  1 Nov 2021 17:30:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1635784211;
        bh=11xNNRJ2oUA+dlUdynTUO+k1cTY2c6h9RxFgtLmJKW4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=teySA4KmN8EJtHY/boAHsn8ffI3IozxweM+tNAKLkG4dGnj3E5JtYUF8XfAdkNmD0
         VYxDQ1z66fFT0azWKD2/dVIV85qzhfQdUcbwEbVMIwBrMYtkhJwWz3pbRgCRkEGXeE
         nwK66K1yP5zebx6pk99nRWIQhodUXVneLEE+DEco=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211101132502.700505-1-sakari.ailus@linux.intel.com>
References: <20211101132502.700505-1-sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 1/1] max96712: Select VIDEO_V4L2
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Niklas =?utf-8?q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Date:   Mon, 01 Nov 2021 16:30:09 +0000
Message-ID: <163578420928.926484.5058272719714961844@Monstersaurus>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Quoting Sakari Ailus (2021-11-01 13:25:02)
> Select VIDEO_V4L2 for the driver actually depends on it, failing to
> compile otherwise.
>=20
> Fixes: 51758f8b32134bacbf30bd217f7c2074e9b4b51e ("media: staging: max9671=
2: Add basic support for MAX96712 GMSL2 deserializer")

I guess this is a local commit in your tree so far, I can't identify it.

> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/staging/media/max96712/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/staging/media/max96712/Kconfig b/drivers/staging/med=
ia/max96712/Kconfig
> index 258d47644cbd..492a7ff70dd8 100644
> --- a/drivers/staging/media/max96712/Kconfig
> +++ b/drivers/staging/media/max96712/Kconfig
> @@ -6,6 +6,7 @@ config VIDEO_MAX96712
>         select V4L2_FWNODE
>         select VIDEO_V4L2_SUBDEV_API
>         select MEDIA_CONTROLLER
> +       select VIDEO_V4L2

I don't see any other driver 'select' VIDEO_V4L2...
Most 'depend' on VIDEO_V4L2 instead.

And curiously, I already see
 - Add 'depends on VIDEO_V4L2'

in Niklas' v4.

Is this one a special case that 'needs' to select it?
--
Kieran



>         help
>           This driver supports the Maxim MAX96712 Quad GMSL2 Deserializer.
> =20
> --=20
> 2.30.2
>
