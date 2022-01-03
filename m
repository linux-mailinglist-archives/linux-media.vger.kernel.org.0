Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 365C5483157
	for <lists+linux-media@lfdr.de>; Mon,  3 Jan 2022 14:19:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232041AbiACNT0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jan 2022 08:19:26 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:54832 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229793AbiACNT0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jan 2022 08:19:26 -0500
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3DC1ACC;
        Mon,  3 Jan 2022 14:19:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1641215965;
        bh=kTaRcPMm3N395s867HkAzbQgnt4Vy2IYqZPfdoqmHkQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=qC0LdkI4JotvbVW4+ee3V5iRLz49qGLYomhCuVNIStj74IpA/cEf2hXUKMzeFbbN0
         J66qbeBW3ai1JriJnMqOgErx6+J8q4nKqhCQSgqcAfdxlOwTVVwxaQIC/GqRhBwAzi
         MiWVH2Kulkwbee4kqdH0v9ViGtoOVd9HimTUw9w8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220103110922.715065-1-petko.manolov@konsulko.com>
References: <20220103110922.715065-1-petko.manolov@konsulko.com>
Subject: Re: [PATCH v2 0/5] adds ovm6211 driver to staging
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Petko Manolov <petko.manolov@konsulko.com>
To:     Petko Manolov <petko.manolov@konsulko.com>,
        linux-media@vger.kernel.org
Date:   Mon, 03 Jan 2022 13:19:22 +0000
Message-ID: <164121596292.3986460.16005535544209529901@Monstersaurus>
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Petko,

Quoting Petko Manolov (2022-01-03 11:09:17)
> v2: Removes an unused function (ovm6211_set_pix_clk) and this patch serie=
s is
> now based on media/master; Didn't receive any comments about the RFC vers=
ion,
> thus i assume everything is perfect... :P

Did you see
https://lore.kernel.org/linux-media/Ya9XHiz%2FPm4CjQ13@valkosipuli.retiisi.=
eu/?

Sakari provided quite a few review comments to consider.

I don't think we need to add new sensor drivers to the staging directory
which would simplify your series quite a bit, and Sakari also stated the
ovm6211 KConfig and Makefile entry should be in the patch along with the
new driver code (not in staging).

So you would need to refactor this series to a single patch adding the
driver do drivers/media/i2c/, and a second patch which adds the
DT-bindings accordingly.

--
Kieran


>                                                                          =
                                                                           =
                                 =20
> This patch adds ovm6211 driver into the staging directory.  It also creat=
es
> media/i2c entry, where ovm6211.c lives for now, to mimic the generic media
> source tree.
>                                                                          =
                                                                           =
                                 =20
> Petko Manolov (5):
>   adds ovm6211 driver to staging
>   adds ovm6211 entry to Kconfig
>   adds ovm6211 entry to Makefile
>   adds drivers/staging/media/i2c/Kconfig entry
>   adds i2c/ explicitly to Makefile
>=20
>  drivers/staging/media/Kconfig       |    2 +
>  drivers/staging/media/Makefile      |    1 +
>  drivers/staging/media/i2c/Kconfig   |    9 +
>  drivers/staging/media/i2c/Makefile  |    1 +
>  drivers/staging/media/i2c/ovm6211.c | 1143 +++++++++++++++++++++++++++
>  5 files changed, 1156 insertions(+)
>  create mode 100644 drivers/staging/media/i2c/Kconfig
>  create mode 100644 drivers/staging/media/i2c/Makefile
>  create mode 100644 drivers/staging/media/i2c/ovm6211.c
>=20
>=20
> base-commit: 68b9bcc8a534cd11fe55f8bc82f948aae7d81b3c
> --=20
> 2.30.2
>
