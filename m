Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2831689320
	for <lists+linux-media@lfdr.de>; Fri,  3 Feb 2023 10:10:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232234AbjBCJIv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Feb 2023 04:08:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231726AbjBCJIu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Feb 2023 04:08:50 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D8201F5C7
        for <linux-media@vger.kernel.org>; Fri,  3 Feb 2023 01:08:49 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 89787890
        for <linux-media@vger.kernel.org>; Fri,  3 Feb 2023 10:08:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675415327;
        bh=WMOUGcO3zobm1GTzkRXrYsZJIf9jraxPwMjdY8Zh48U=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=g0O7qNx/Su1uuHLuOcyMpdauulGzxsrtwbtvfGaINBwiex2gvvXmE9tdZo/VZcOfu
         7j3KBNRFN71e6+DF0xI1lhC0pCMGo5IV8kw6UnB6/L2FUTpVbq6ABMjExGwy7aYFKX
         y1k21VLVat+aWIw/GVVElg34Y2qvYU+4NpIaQ3Vg=
Date:   Fri, 3 Feb 2023 11:08:45 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Subject: Re: [GIT PULL FOR v6.2] imx7-media-csi changes
Message-ID: <Y9zPHYMvc9/jLR8c@pendragon.ideasonboard.com>
References: <Y9zOhQfN09AGh8GT@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y9zOhQfN09AGh8GT@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The subject line should have read v6.3, not v6.2. Sorry for the typo.

On Fri, Feb 03, 2023 at 11:06:15AM +0200, Laurent Pinchart wrote:
> Hi Mauro,
> 
> The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:
> 
>   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/media-imx-csi-next-20230203
> 
> for you to fetch changes up to d27d7dbc84be0679816b66f49dac00542c3a80a3:
> 
>   media: imx: imx7-media-csi: Use V4L2 subdev active state (2023-02-03 11:03:19 +0200)
> 
> ----------------------------------------------------------------
> imx7-media-csi driver cleanups
> 
> ----------------------------------------------------------------
> Laurent Pinchart (8):
>       media: imx: imx7-media-csi: Drop imx7_csi.cc field
>       media: imx: imx7-media-csi: Simplify imx7_csi_video_init_format()
>       media: imx: imx7-media-csi: Drop unneeded check when starting streaming
>       media: imx: imx7-media-csi: Drop unneeded src_sd check
>       media: imx: imx7-media-csi: Drop unneeded pad checks
>       media: imx: imx7-media-csi: Cleanup errors in imx7_csi_async_register()
>       media: imx: imx7-media-csi: Zero format struct before calling .get_fmt()
>       media: imx: imx7-media-csi: Use V4L2 subdev active state
> 
>  drivers/media/platform/nxp/imx7-media-csi.c | 235 +++++++++-------------------
>  1 file changed, 70 insertions(+), 165 deletions(-)

-- 
Regards,

Laurent Pinchart
