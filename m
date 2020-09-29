Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 236EC27D337
	for <lists+linux-media@lfdr.de>; Tue, 29 Sep 2020 17:57:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729012AbgI2P5L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Sep 2020 11:57:11 -0400
Received: from smtp08.smtpout.orange.fr ([80.12.242.130]:39576 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725497AbgI2P5K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Sep 2020 11:57:10 -0400
Received: from [192.168.42.210] ([93.22.37.244])
        by mwinf5d16 with ME
        id Zrx32300w5G3HaM03rx48Y; Tue, 29 Sep 2020 17:57:08 +0200
X-ME-Helo: [192.168.42.210]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 29 Sep 2020 17:57:08 +0200
X-ME-IP: 93.22.37.244
Subject: Re: [PATCH 04/20] media: saa7134: use semicolons rather than commas
 to separate statements
To:     Julia Lawall <Julia.Lawall@inria.fr>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     =?UTF-8?Q?Valdis_Kl=c4=93tnieks?= <valdis.kletnieks@vt.edu>,
        Joe Perches <joe@perches.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        kernel-janitors@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1601385283-26144-1-git-send-email-Julia.Lawall@inria.fr>
 <1601385283-26144-5-git-send-email-Julia.Lawall@inria.fr>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <8a2e3c47-76d1-f959-fb7c-3a02641a57e2@wanadoo.fr>
Date:   Tue, 29 Sep 2020 17:57:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1601385283-26144-5-git-send-email-Julia.Lawall@inria.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le 29/09/2020 à 15:14, Julia Lawall a écrit :
> Replace commas with semicolons.  Commas introduce unnecessary
> variability in the code structure and are hard to see.  What is done
> is essentially described by the following Coccinelle semantic patch
> (http://coccinelle.lip6.fr/):
> 
> // <smpl>
> @@ expression e1,e2; @@
> e1
> -,
> +;
> e2
> ... when any
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> 
> ---
>   drivers/media/pci/saa7134/saa7134-video.c |    7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/pci/saa7134/saa7134-video.c b/drivers/media/pci/saa7134/saa7134-video.c
> index 9a6a6b68f8e3..2ca963b04b3f 100644
> --- a/drivers/media/pci/saa7134/saa7134-video.c
> +++ b/drivers/media/pci/saa7134/saa7134-video.c
> @@ -868,8 +868,11 @@ static int buffer_activate(struct saa7134_dev *dev,
>   		lines_uv = dev->height >> dev->fmt->vshift;
>   		base2    = base + bpl * dev->height;
>   		base3    = base2 + bpl_uv * lines_uv;
> -		if (dev->fmt->uvswap)
> -			tmp = base2, base2 = base3, base3 = tmp;
> +		if (dev->fmt->uvswap) {
> +			tmp = base2;
> +			base2 = base3;
> +			base3 = tmp;
> +		}
>   		video_dbg("uv: bpl=%ld lines=%ld base2/3=%ld/%ld\n",
>   			bpl_uv,lines_uv,base2,base3);
>   		if (V4L2_FIELD_HAS_BOTH(dev->field)) {
> 
> 
Hi,
this could be turned into a simpler:
    swap(base2, base3);

CJ
