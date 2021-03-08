Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A30EE331A99
	for <lists+linux-media@lfdr.de>; Tue,  9 Mar 2021 00:01:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230457AbhCHXAf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Mar 2021 18:00:35 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:41024 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229797AbhCHXAV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Mar 2021 18:00:21 -0500
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 31A1799;
        Tue,  9 Mar 2021 00:00:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615244419;
        bh=ywksvDU+fmE0b00+Y3EVU/AcE4af/eyhIJZ9lanm8tw=;
        h=Subject:To:Cc:References:From:Reply-To:Date:In-Reply-To:From;
        b=wlq9uGlZyJiYBfgPXXBYzBD3YMi7NMIbI7Ue01s0cmTqwZXSXmEBOZIalm7vIhrjg
         cb8/o3Us5wovHKvCGV/9R3zZfArm6j4MJKVLb+FvUQvRPI0mb78YgVaU0XAUseMpvr
         BoTQcKL8PKC36vCXVhp7Uf3DwBtZ3cb5fOncLKKQ=
Subject: Re: [PATCH 2/2] media: v4l: vsp1: Fix uif null pointer access
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
 <20210301120828.6945-3-biju.das.jz@bp.renesas.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reply-To: kieran.bingham+renesas@ideasonboard.com
Organization: Ideas on Board
Message-ID: <133f8b63-3b84-c60a-725d-30b8d6df35dd@ideasonboard.com>
Date:   Mon, 8 Mar 2021 23:00:16 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210301120828.6945-3-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Biju,

On 01/03/2021 12:08, Biju Das wrote:
> RZ/G2L SoC has no UIF. This patch fixes null pointer access, when UIF
> module is not used.
> 
> Fixes: 5e824f989e6e8("media: v4l: vsp1: Integrate DISCOM in display pipeline")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/media/platform/vsp1/vsp1_drm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/vsp1/vsp1_drm.c b/drivers/media/platform/vsp1/vsp1_drm.c
> index f6d2f47a4058..06f74d410973 100644
> --- a/drivers/media/platform/vsp1/vsp1_drm.c
> +++ b/drivers/media/platform/vsp1/vsp1_drm.c
> @@ -462,9 +462,9 @@ static int vsp1_du_pipeline_setup_inputs(struct vsp1_device *vsp1,


This looks like it complicates these conditionals more than we perhaps
need to.

What do you think about adding something above the block comment here?:

	if (!drm_pipe->uif)
		return 0;


>  	 * make sure it is present in the pipeline's list of entities if it
>  	 * wasn't already.
>  	 */
> -	if (!use_uif) {
> +	if (drm_pipe->uif && !use_uif) {
>  		drm_pipe->uif->pipe = NULL;
> -	} else if (!drm_pipe->uif->pipe) {
> +	} else if (drm_pipe->uif && !drm_pipe->uif->pipe) {>  		drm_pipe->uif->pipe = pipe;
>  		list_add_tail(&drm_pipe->uif->list_pipe, &pipe->entities);
>  	}
> 

