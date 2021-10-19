Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9B384333A0
	for <lists+linux-media@lfdr.de>; Tue, 19 Oct 2021 12:35:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235245AbhJSKiB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Oct 2021 06:38:01 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54436 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230123AbhJSKiA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Oct 2021 06:38:00 -0400
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C798C12A;
        Tue, 19 Oct 2021 12:35:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1634639746;
        bh=9Tpvia3RfoFBFpRqSo0nFREy92K3E5F/poZy+MArklQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=kkDDZQWQBuoZoCm+6wvTOeDny9XhpfW/sTBsfWpNx7tXKPi2Lc4DhRiY0HLOcRZdn
         VyxThaY17hkz/+ZwyQ85+qgNBrO/0TJkqiq5mEaxqBhRU6sfPkhtGGcoT9aE7o+vmb
         Z/ZIx2gQnb1gbtcZJPvHA+8inuEMDjBP4pbTUevY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <189d4fd72db8707cb495e3a29ab7a276e07f62a0.1634373552.git.christophe.jaillet@wanadoo.fr>
References: <189d4fd72db8707cb495e3a29ab7a276e07f62a0.1634373552.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] media: tw5864: Simplify 'tw5864_finidev()'
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        andrey.utkin@corp.bluecherry.net, anton@corp.bluecherry.net,
        maintainers@bluecherrydvr.com, mchehab@kernel.org
Date:   Tue, 19 Oct 2021 11:35:44 +0100
Message-ID: <163463974453.1853916.7698473612617245785@Monstersaurus>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Christophe JAILLET (2021-10-16 09:40:29)
> Some resources are allocated with 'pci_request_regions()', so use
> 'pci_release_regions()' to free them, instead of a verbose
> 'release_mem_region()'.

And the driver was even already using pci_release_regions() in
tw5864_initdev(), so indeed this makes it more consistent too.

I'm curious that tw5864_initdev() calls pci_enable_device() (and
pci_disable_device in it's error path), while tw5864_finidev() doesn't.

Would you like to submit a patch to fix that on top of this one? or should =
I?

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> There is no point in calling 'devm_kfree()'. The corresponding resource is
> managed, so it will be fried automatically.

Indeed.

> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/media/pci/tw5864/tw5864-core.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/pci/tw5864/tw5864-core.c b/drivers/media/pci/t=
w5864/tw5864-core.c
> index 23d3cae54a5d..fee3b7711901 100644
> --- a/drivers/media/pci/tw5864/tw5864-core.c
> +++ b/drivers/media/pci/tw5864/tw5864-core.c
> @@ -333,11 +333,9 @@ static void tw5864_finidev(struct pci_dev *pci_dev)
> =20
>         /* release resources */
>         iounmap(dev->mmio);
> -       release_mem_region(pci_resource_start(pci_dev, 0),
> -                          pci_resource_len(pci_dev, 0));
> +       pci_release_regions(pci_dev);
> =20
>         v4l2_device_unregister(&dev->v4l2_dev);
> -       devm_kfree(&pci_dev->dev, dev);
>  }
> =20
>  static struct pci_driver tw5864_pci_driver =3D {
> --=20
> 2.30.2
>
