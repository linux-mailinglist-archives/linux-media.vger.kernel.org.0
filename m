Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6308502C2A
	for <lists+linux-media@lfdr.de>; Fri, 15 Apr 2022 16:51:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354717AbiDOOyJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Apr 2022 10:54:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354704AbiDOOyI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Apr 2022 10:54:08 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7425AB2474
        for <linux-media@vger.kernel.org>; Fri, 15 Apr 2022 07:51:39 -0700 (PDT)
Received: from pendragon.ideasonboard.com (85-76-70-106-nat.elisa-mobile.fi [85.76.70.106])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 668C5276;
        Fri, 15 Apr 2022 16:51:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650034298;
        bh=ZdrmhyHPvNF2651kGhXeN6EFc8aRvjnPOoZMS4oLq7E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ez2SM9wsTTRYNLODFKsSnPOXWrfaKSK5lVV6b8JR/lStLv1GLkvdoAJ+KQVUdXU3y
         7Ls0QxjvZHlOw5mm/do+GTTrcB/k69I7B56t+qmadUN76VRH4HEHnjJqe+Ado3LWHU
         CslefrkS6ZPcDIHnj6ECqPELJLAMXS+CBaGE5FTo=
Date:   Fri, 15 Apr 2022 17:51:33 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc:     linux-media@vger.kernel.org, alain.volmat@foss.st.com,
        hugues.fruchet@foss.st.com, sylvain.petinot@foss.st.com,
        dave.stevenson@raspberrypi.com, sakari.ailus@linux.intel.com,
        kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 3/5] media: v4l: ctrls: Add user control base for
 st-vgxy61 controls
Message-ID: <YlmGdd1EWNwcKHRx@pendragon.ideasonboard.com>
References: <20220415111845.27130-1-benjamin.mugnier@foss.st.com>
 <20220415111845.27130-4-benjamin.mugnier@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220415111845.27130-4-benjamin.mugnier@foss.st.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin,

Thank you for the patch.

On Fri, Apr 15, 2022 at 01:18:43PM +0200, Benjamin Mugnier wrote:
> Add a control base for st-vgxy61 controls and reserve 16 controls.
> This is required for HDR mode user control on the st-vgxy61 camera
> sensor.
> 
> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  include/uapi/linux/v4l2-controls.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 705b4043c2de..0bdf77df26ac 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -225,6 +225,11 @@ enum v4l2_colorfx {
>   */
>  #define V4L2_CID_USER_ISL7998X_BASE		(V4L2_CID_USER_BASE + 0x1180)
>  
> +/* The base for the st-vgxy61 driver controls.
> + * We reserve 16 controls for this driver.
> + */
> +#define V4L2_CID_USER_STVGXY61_BASE		(V4L2_CID_USER_BASE + 0x1190)
> +
>  /* MPEG-class control IDs */
>  /* The MPEG controls are applicable to all codec controls
>   * and the 'MPEG' part of the define is historical */

-- 
Regards,

Laurent Pinchart
