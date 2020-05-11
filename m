Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C2481CE111
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 19:02:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730779AbgEKRCB convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 11 May 2020 13:02:01 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:33853 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730624AbgEKRCA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 13:02:00 -0400
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 6C91EC0008;
        Mon, 11 May 2020 17:01:57 +0000 (UTC)
Date:   Mon, 11 May 2020 19:01:56 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6?= Rojas <noltari@gmail.com>
Cc:     computersforpeace@gmail.com, kdasu.kdev@gmail.com, richard@nod.at,
        vigneshr@ti.com, sumit.semwal@linaro.org,
        linux-mtd@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 2/3] nand: brcmnand: fix CS0 layout
Message-ID: <20200511190156.51dcc316@xps13>
In-Reply-To: <20200510151406.2527856-2-noltari@gmail.com>
References: <20200510151406.2527856-1-noltari@gmail.com>
        <20200510151406.2527856-2-noltari@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Álvaro,

Álvaro Fernández Rojas <noltari@gmail.com> wrote on Sun, 10 May 2020
17:14:05 +0200:

> Only v3.3-v5.0 have a different CS0 layout.
> v3.3- controllers use the same layout for every CS.

I had a hard time what you meant here, just because of the trailing
dash. 

    "Controllers before v3.3..."

would be more understandable.

Also please add a Fixes/Cc: stable tag here.

> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> ---
>  drivers/mtd/nand/raw/brcmnand/brcmnand.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> index 6a08dd07b058..72b268d8e3a4 100644
> --- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> +++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> @@ -606,8 +606,9 @@ static int brcmnand_revision_init(struct brcmnand_controller *ctrl)
>  	} else {
>  		ctrl->cs_offsets = brcmnand_cs_offsets;
>  
> -		/* v5.0 and earlier has a different CS0 offset layout */
> -		if (ctrl->nand_version <= 0x0500)
> +		/* v3.3-5.0 have a different CS0 offset layout */
> +		if (ctrl->nand_version >= 0x0303 &&
> +		    ctrl->nand_version <= 0x0500)
>  			ctrl->cs0_offsets = brcmnand_cs_offsets_cs0;
>  	}
>  


Thanks,
Miquèl
