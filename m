Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F88445E977
	for <lists+linux-media@lfdr.de>; Fri, 26 Nov 2021 09:36:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346895AbhKZIjq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Nov 2021 03:39:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346223AbhKZIhq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Nov 2021 03:37:46 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F928C0613A1
        for <linux-media@vger.kernel.org>; Fri, 26 Nov 2021 00:26:03 -0800 (PST)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E4FBD340;
        Fri, 26 Nov 2021 09:26:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1637915161;
        bh=spjUIHPt/pK4KOhb2xmZaUA2H5tPunHi+d5pFLqaVzc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=v6Y+wNALxKdTUVOxgAXoUo/xxd0Kf7K92ttVojte5YJT7eMm6EkFALr3G3yL1tZlL
         KulSCCfqcJsCexET6wDNN0lmtkvGVEM7+VRLXaPzeBWK2VB7QMF0nJAB009AI6wUS9
         +VDju0m8K29QHK189wxBd1vhJC5RepdypEJ07E5I=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211126080623.1587610-1-sakari.ailus@linux.intel.com>
References: <20211126080623.1587610-1-sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 1/1] max96712: Depend on VIDEO_V4L2
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     niklas.soderlund@ragnatech.se
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Date:   Fri, 26 Nov 2021 08:25:58 +0000
Message-ID: <163791515852.3059017.1415957545181411427@Monstersaurus>
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Quoting Sakari Ailus (2021-11-26 08:06:23)
> Depend on VIDEO_V4L2 for the driver actually depends on it, failing to
> compile otherwise.

Given that this matches how I added the same for max9286, I think this
way is better than select.

Thanks,

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/staging/media/max96712/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/staging/media/max96712/Kconfig b/drivers/staging/med=
ia/max96712/Kconfig
> index 258d47644cbd..acde14fd5c4d 100644
> --- a/drivers/staging/media/max96712/Kconfig
> +++ b/drivers/staging/media/max96712/Kconfig
> @@ -3,6 +3,7 @@ config VIDEO_MAX96712
>         tristate "Maxim MAX96712 Quad GMSL2 Deserializer support"
>         depends on I2C
>         depends on OF_GPIO
> +       depends on VIDEO_V4L2
>         select V4L2_FWNODE
>         select VIDEO_V4L2_SUBDEV_API
>         select MEDIA_CONTROLLER
> --=20
> 2.30.2
>
