Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B669C11AB70
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2019 14:00:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729281AbfLKNAC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Dec 2019 08:00:02 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:46824 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727402AbfLKNAC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Dec 2019 08:00:02 -0500
Received: from [192.168.0.239] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A78889D0;
        Wed, 11 Dec 2019 13:59:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1576069200;
        bh=lKEz6Z8NRASclAzwJR4kRXkYGtMfsuGfi7KEZ6mogfw=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=sMtZvl98Y3m0cmwA4LJP7WTI66ESHgC5vEWUOY2v3NptpftyBymBaFVI6x3vQ2TXk
         wVP6EiVGsUceygub7sOSojgm5+5bWVECh3oW2HWcfK8SDKuWGB5UotONMNZtg3++ya
         LDe8iVSJMM5lpKxaQDjQpjq+HBU+JXKmDOlF9d9g=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH] media: vsp1: tidyup VI6_HGT_LBn_H() macro
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        koji.matsuoka.xm@renesas.com, takeshi.kihara.df@renesas.com,
        harunobu.kurokawa.dn@renesas.com, khiem.nguyen.xt@renesas.com,
        hien.dang.eb@renesas.com
References: <redmine.issue-245033.20191211005426@dm.renesas.com>
 <redmine.issue-245033.20191211005426.161918957b73008d@dm.renesas.com>
 <87k173bp76.wl-kuninori.morimoto.gx@renesas.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <fb1648d4-3949-01c1-7d13-679b9b8540dd@ideasonboard.com>
Date:   Wed, 11 Dec 2019 12:59:57 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <87k173bp76.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Morimoto-san,

Thank you for the patch,

On 11/12/2019 01:55, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> The address of VSP2_VI6_HGT_LBx_H are
> 	VSP2_VI6_HGT_LB0_H : 0x3428
> 	VSP2_VI6_HGT_LB1_H : 0x3430
> 	VSP2_VI6_HGT_LB2_H : 0x3438
> 	VSP2_VI6_HGT_LB3_H : 0x3440
> 
> Thus, VI6_HGT_LBn_H() macro should start from 0x3420 instead of 0x3430.
> This patch fixup it.

I think this deserves a fixes tag:

Fixes: 26e0ca22c3b8 ("[media] v4l: Renesas R-Car VSP1 driver")

> Reported-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Otherwise,

Yes I can clearly see that this offset is marked as H'3428 at page 32-39
within the Gen3 datasheet.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/media/platform/vsp1/vsp1_regs.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/vsp1/vsp1_regs.h b/drivers/media/platform/vsp1/vsp1_regs.h
> index 5c67ff9..fe3130d 100644
> --- a/drivers/media/platform/vsp1/vsp1_regs.h
> +++ b/drivers/media/platform/vsp1/vsp1_regs.h
> @@ -706,7 +706,7 @@
>  #define VI6_HGT_HUE_AREA_LOWER_SHIFT	16
>  #define VI6_HGT_HUE_AREA_UPPER_SHIFT	0
>  #define VI6_HGT_LB_TH			0x3424
> -#define VI6_HGT_LBn_H(n)		(0x3438 + (n) * 8)
> +#define VI6_HGT_LBn_H(n)		(0x3428 + (n) * 8)
>  #define VI6_HGT_LBn_V(n)		(0x342c + (n) * 8)
>  #define VI6_HGT_HISTO(m, n)		(0x3450 + (m) * 128 + (n) * 4)
>  #define VI6_HGT_MAXMIN			0x3750
> 

