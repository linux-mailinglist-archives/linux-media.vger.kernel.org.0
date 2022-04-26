Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B8A2510AFE
	for <lists+linux-media@lfdr.de>; Tue, 26 Apr 2022 23:10:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355241AbiDZVNR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Apr 2022 17:13:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355212AbiDZVNQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Apr 2022 17:13:16 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6520CE06;
        Tue, 26 Apr 2022 14:10:06 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CBC6EE5;
        Tue, 26 Apr 2022 23:10:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1651007404;
        bh=OnV1/MVp7vVSwRXEyi1/PqFfVJwaVG1u70n6HBxtwpw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bTalhson4ZDmuV6GBJSIY0KrJ84VtBYxVus+1g9DPZtrXp1uUhOMFSSlcQLe6W4nH
         U4VNRqtnn6AsSX0fgChXiUNRjo2PMx5/LjrOi20TvI52aYo/afu5+VKfRKyCTG7n/V
         saIAtzxXqv3MzzF4tJk6Q1OUWmmrUTOEs2Q/bU7s=
Date:   Wed, 27 Apr 2022 00:10:03 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, tomi.valkeinen@ideasonboard.com,
        robh+dt@kernel.org, nicolas@ndufresne.ca,
        alexander.stein@ew.tq-group.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4 5/9] media: v4l: uapi: Add user control base for DW100
 controls
Message-ID: <Ymhfqwj4VxD4Rf+E@pendragon.ideasonboard.com>
References: <20220328141309.177611-1-xavier.roumegue@oss.nxp.com>
 <20220328141309.177611-6-xavier.roumegue@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220328141309.177611-6-xavier.roumegue@oss.nxp.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Xavier,

Thank you for the patch.

On Mon, Mar 28, 2022 at 04:13:05PM +0200, Xavier Roumegue wrote:
> Add a control base for DW100 driver controls, and reserve 16 controls.
> 
> Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
> ---
>  include/uapi/linux/v4l2-controls.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index bb40129446d4..9ef608a1f9ce 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -218,12 +218,16 @@ enum v4l2_colorfx {
>   * We reserve 16 controls for this driver.
>   */
>  #define V4L2_CID_USER_ALLEGRO_BASE		(V4L2_CID_USER_BASE + 0x1170)
> -

That seems unrelated.

>  /*
>   * The base for the isl7998x driver controls.
>   * We reserve 16 controls for this driver.
>   */
>  #define V4L2_CID_USER_ISL7998X_BASE		(V4L2_CID_USER_BASE + 0x1180)

And a blank line is needed here. With this fixed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +/*
> + * The base for DW100 driver controls.
> + * We reserve 16 controls for this driver.
> + */
> +#define V4L2_CID_USER_DW100_BASE		(V4L2_CID_USER_BASE + 0x1190)
>  
>  /* MPEG-class control IDs */
>  /* The MPEG controls are applicable to all codec controls

-- 
Regards,

Laurent Pinchart
