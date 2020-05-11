Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C560B1CE12A
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 19:03:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730878AbgEKRD1 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 11 May 2020 13:03:27 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:61445 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730743AbgEKRD0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 13:03:26 -0400
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 55DAB240005;
        Mon, 11 May 2020 17:03:22 +0000 (UTC)
Date:   Mon, 11 May 2020 19:03:21 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6?= Rojas <noltari@gmail.com>
Cc:     computersforpeace@gmail.com, kdasu.kdev@gmail.com, richard@nod.at,
        vigneshr@ti.com, sumit.semwal@linaro.org,
        linux-mtd@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 1/3] nand: brcmnand: rename v4 registers
Message-ID: <20200511190321.1091bbf2@xps13>
In-Reply-To: <20200510151406.2527856-1-noltari@gmail.com>
References: <20200510151406.2527856-1-noltari@gmail.com>
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
17:14:04 +0200:

> These registers are also used on v3.3.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> ---
>  drivers/mtd/nand/raw/brcmnand/brcmnand.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> index e4e3ceeac38f..6a08dd07b058 100644
> --- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> +++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> @@ -338,8 +338,8 @@ enum brcmnand_reg {
>  	BRCMNAND_FC_BASE,
>  };
>  
> -/* BRCMNAND v4.0 */
> -static const u16 brcmnand_regs_v40[] = {
> +/* BRCMNAND v3.3-v4.0 */
> +static const u16 brcmnand_regs_v33[] = {
>  	[BRCMNAND_CMD_START]		=  0x04,
>  	[BRCMNAND_CMD_EXT_ADDRESS]	=  0x08,
>  	[BRCMNAND_CMD_ADDRESS]		=  0x0c,
> @@ -591,8 +591,8 @@ static int brcmnand_revision_init(struct brcmnand_controller *ctrl)
>  		ctrl->reg_offsets = brcmnand_regs_v60;
>  	else if (ctrl->nand_version >= 0x0500)
>  		ctrl->reg_offsets = brcmnand_regs_v50;
> -	else if (ctrl->nand_version >= 0x0400)
> -		ctrl->reg_offsets = brcmnand_regs_v40;
> +	else if (ctrl->nand_version >= 0x0303)
> +		ctrl->reg_offsets = brcmnand_regs_v33;
>  
>  	/* Chip-select stride */
>  	if (ctrl->nand_version >= 0x0701)

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
