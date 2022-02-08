Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92F5C4AD0C6
	for <lists+linux-media@lfdr.de>; Tue,  8 Feb 2022 06:32:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232198AbiBHFcd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Feb 2022 00:32:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231657AbiBHFLm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Feb 2022 00:11:42 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8436DC0401E9
        for <linux-media@vger.kernel.org>; Mon,  7 Feb 2022 21:11:40 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 032C4B817D3
        for <linux-media@vger.kernel.org>; Tue,  8 Feb 2022 05:11:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CB8EC004E1;
        Tue,  8 Feb 2022 05:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644297097;
        bh=+T1rammgHreaglsfHL7a4fPoEP7Au5A3mPc76SqwDFs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ME1jyuAxMrC4WOlhe1TLjMh79+kFFGfXuwWmEDxu5fsPolhSnnmafR8/SAVqG4nYc
         lSb+E3WREpo5Cuxd8WkqshS7B7AFv6BsZet9u4yFcZ3AJr3ddp2H9TRqGh3+TENcOy
         l4FpTHDBtjavnU/U9ob/VOPh3Ck/+kgPjvSaSnLFaXbp65ek0wZwn4le3yEQdoETsB
         r3BKl5wwOaF16QscVNM9Flesgo+BQuHpolF8bMGeI4L/XkUNxWVERIkr7VBjWrDd/m
         Ca4B8wqnW+GqpI/SMcpj1tgBaHMbjQ5NkoWULnEMltTi2Hm2kR4BS7TQP/6mOHuLZQ
         IFq5sirIxfDcA==
Date:   Tue, 8 Feb 2022 06:11:29 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: Re: [PATCH 1/1] microchip-csi2dc: Remove VC support for now
Message-ID: <20220208061129.158ba126@sal.lan>
In-Reply-To: <20220202153609.240387-1-sakari.ailus@linux.intel.com>
References: <20220202153609.240387-1-sakari.ailus@linux.intel.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed,  2 Feb 2022 17:36:09 +0200
Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:

> As part of removing mbus config flags, remove VC flag use in the
> microchip-csi2dc driver. The support can be reintroduced later on as part
> of the streams patches.
>
> Cc: Eugen Hristev <eugen.hristev@microchip.com>

Hmm... that sounds a regression to me. What effects this will cause at
the driver?

Eugen, any comments?

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../media/platform/atmel/microchip-csi2dc.c    | 18 ++----------------
>  1 file changed, 2 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/media/platform/atmel/microchip-csi2dc.c b/drivers/media/platform/atmel/microchip-csi2dc.c
> index 6bc549c28e05..6a7f5b4b0e3b 100644
> --- a/drivers/media/platform/atmel/microchip-csi2dc.c
> +++ b/drivers/media/platform/atmel/microchip-csi2dc.c
> @@ -348,24 +348,15 @@ static int csi2dc_get_mbus_config(struct csi2dc_device *csi2dc)
>  	if (ret == -ENOIOCTLCMD) {
>  		dev_dbg(csi2dc->dev,
>  			"no remote mbus configuration available\n");
> -		goto csi2dc_get_mbus_config_defaults;
> +		return 0;
>  	}
>  
>  	if (ret) {
>  		dev_err(csi2dc->dev,
>  			"failed to get remote mbus configuration\n");
> -		goto csi2dc_get_mbus_config_defaults;
> +		return 0;
>  	}
>  
> -	if (mbus_config.flags & V4L2_MBUS_CSI2_CHANNEL_0)
> -		csi2dc->vc = 0;
> -	else if (mbus_config.flags & V4L2_MBUS_CSI2_CHANNEL_1)
> -		csi2dc->vc = 1;
> -	else if (mbus_config.flags & V4L2_MBUS_CSI2_CHANNEL_2)
> -		csi2dc->vc = 2;
> -	else if (mbus_config.flags & V4L2_MBUS_CSI2_CHANNEL_3)
> -		csi2dc->vc = 3;
> -
>  	dev_dbg(csi2dc->dev, "subdev sending on channel %d\n", csi2dc->vc);
>  
>  	csi2dc->clk_gated = mbus_config.flags &
> @@ -375,11 +366,6 @@ static int csi2dc_get_mbus_config(struct csi2dc_device *csi2dc)
>  		csi2dc->clk_gated ? "gated" : "free running");
>  
>  	return 0;
> -
> -csi2dc_get_mbus_config_defaults:
> -	csi2dc->vc = 0; /* Virtual ID 0 by default */
> -
> -	return 0;
>  }
>  
>  static void csi2dc_vp_update(struct csi2dc_device *csi2dc)
