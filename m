Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4E9F331ABB
	for <lists+linux-media@lfdr.de>; Tue,  9 Mar 2021 00:07:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230411AbhCHXHU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Mar 2021 18:07:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbhCHXHC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Mar 2021 18:07:02 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02E42C06174A;
        Mon,  8 Mar 2021 15:07:01 -0800 (PST)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 29A0A99;
        Tue,  9 Mar 2021 00:06:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615244819;
        bh=L12VtFxosOVUr4p7cm0dCJof6IAODdgRAFzewNuXUvA=;
        h=Subject:To:Cc:References:From:Reply-To:Date:In-Reply-To:From;
        b=QAudPgJsNbuKRh2t4KZchHZYNEL9eO6tl7TADqCeikRcpLqfzw1+tYLBPl3zQfyTn
         mBmqXdGo4toheaKYweRH8qrY7rAOc3JJMi+UsOrMSXZiXcjg60GIPdwQVbJEbtj+0I
         VFSJHMIKP2uMnTiUF6BgDlbPtJq/2B3d6Qvt4eTs=
Subject: Re: [PATCH 1/2] media: v4l: vsp1: Fix bru null pointer access
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20210301120828.6945-1-biju.das.jz@bp.renesas.com>
 <20210301120828.6945-2-biju.das.jz@bp.renesas.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reply-To: kieran.bingham+renesas@ideasonboard.com
Organization: Ideas on Board
Message-ID: <67dbb76a-db02-7a49-9b1d-0218d01c3173@ideasonboard.com>
Date:   Mon, 8 Mar 2021 23:06:56 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210301120828.6945-2-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Biju,

On 01/03/2021 12:08, Biju Das wrote:
> RZ/G2L SoC has only BRS. This patch fixes null pointer access,when only
> BRS is enabled.
> 
> Fixes: cbb7fa49c7466("media: v4l: vsp1: Rename BRU to BRx")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/media/platform/vsp1/vsp1_drm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/vsp1/vsp1_drm.c b/drivers/media/platform/vsp1/vsp1_drm.c
> index 86d5e3f4b1ff..f6d2f47a4058 100644
> --- a/drivers/media/platform/vsp1/vsp1_drm.c
> +++ b/drivers/media/platform/vsp1/vsp1_drm.c
> @@ -245,7 +245,7 @@ static int vsp1_du_pipeline_setup_brx(struct vsp1_device *vsp1,
>  		brx = &vsp1->bru->entity;
>  	else if (pipe->brx && !drm_pipe->force_brx_release)
>  		brx = pipe->brx;
> -	else if (!vsp1->bru->entity.pipe)
> +	else if (vsp1_feature(vsp1, VSP1_HAS_BRU) && !vsp1->bru->entity.pipe)
>  		brx = &vsp1->bru->entity;
>  	else
>  		brx = &vsp1->brs->entity;


The comments here describe that the choice to start at the BRU is
arbitrary, so if we could confirm that there will always be a BRS
otherwise, we could swap those to save an extra feature check.

But as we have both vsp1_feature(vsp1, VSP1_HAS_BRU) and
vsp1_feature(vsp1, VSP1_HAS_BRS), I don't think that's the case.

I'd almost want to check for vsp1_feature(vsp1, VSP1_HAS_BRS) on the
brs->entity line to keep the symmetry ... but it wouldn't be needed, as
it should fall through. If there isn't a BRS there must be a BRU or we
wouldn't be setting up a brx in the first place ;-)

So I think what you have is good.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
