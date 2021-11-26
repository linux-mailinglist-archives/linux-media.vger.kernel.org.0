Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D84C945F503
	for <lists+linux-media@lfdr.de>; Fri, 26 Nov 2021 20:08:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232538AbhKZTLv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Nov 2021 14:11:51 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:60008 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230034AbhKZTJu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Nov 2021 14:09:50 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 896C5B8278E;
        Fri, 26 Nov 2021 18:56:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B13AC93056;
        Fri, 26 Nov 2021 18:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637953002;
        bh=V2JcKIxuRlvmAMcJhpoaCcV9ghdjY9fkMC7wykrIAGA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ekgVvayee0/3LZpDmcb2FkL/kqkQUCMpYoe5KUsB5VVZ0x8lZrp6p1nbTyuWhm6iu
         tPhTRTnJJxlHKmZsL5pT78EHuKFW2GYMCIRX8YjaUb0sqsU14yLaNDWsSAV0bimKa4
         E/47NmhIyGCaBZo/gow6H/xNvygfk0ale+umFwJy8m+7okLwnHSxxC6p0oq8HG9Y7k
         eiruBgUWUhUoqcGMJ6+8Vb9PYd5CJjEYtRsUSAyg7FkSZq9r2RLiVNTtAQhoqIdvP5
         ayJD9Mig8xdx+LrJENOK4s51SoD2NtBJzxFh2EJ5YBeiLGYZ2InTKUlUFmPUUcdqJA
         BlKajDTfLYSlQ==
Date:   Fri, 26 Nov 2021 11:56:36 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 03/20] media: davinci: get rid of an unused function
Message-ID: <YaEt5MDw7J57SkpF@archlinux-ax161>
References: <cover.1637781097.git.mchehab+huawei@kernel.org>
 <4e64efe47ed540f3ec60b86c4b1e0ad29a2ddc65.1637781097.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e64efe47ed540f3ec60b86c4b1e0ad29a2ddc65.1637781097.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 24, 2021 at 08:13:06PM +0100, Mauro Carvalho Chehab wrote:
> vpif_get_default_field() seems to be some left-over from a
> past code that sets the field order.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH 00/20] at: https://lore.kernel.org/all/cover.1637781097.git.mchehab+huawei@kernel.org/
> 
>  drivers/media/platform/davinci/vpif_capture.c | 11 -----------
>  1 file changed, 11 deletions(-)
> 
> diff --git a/drivers/media/platform/davinci/vpif_capture.c b/drivers/media/platform/davinci/vpif_capture.c
> index ae92e2c206d0..aba105fa7ef9 100644
> --- a/drivers/media/platform/davinci/vpif_capture.c
> +++ b/drivers/media/platform/davinci/vpif_capture.c
> @@ -618,17 +618,6 @@ static void vpif_calculate_offsets(struct channel_obj *ch)
>  	ch->vpifparams.video_params.stdid = vpifparams->std_info.stdid;
>  }
>  
> -/**
> - * vpif_get_default_field() - Get default field type based on interface
> - * @iface: ptr to vpif interface
> - */
> -static inline enum v4l2_field vpif_get_default_field(
> -				struct vpif_interface *iface)
> -{
> -	return (iface->if_type == VPIF_IF_RAW_BAYER) ? V4L2_FIELD_NONE :
> -						V4L2_FIELD_INTERLACED;
> -}
> -
>  /**
>   * vpif_config_addr() - function to configure buffer address in vpif
>   * @ch: channel ptr
> -- 
> 2.33.1
> 
> 
