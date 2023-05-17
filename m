Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 163F5706884
	for <lists+linux-media@lfdr.de>; Wed, 17 May 2023 14:46:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231418AbjEQMqc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 May 2023 08:46:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230189AbjEQMqb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 May 2023 08:46:31 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D715B171A
        for <linux-media@vger.kernel.org>; Wed, 17 May 2023 05:46:29 -0700 (PDT)
Received: from pendragon.ideasonboard.com (p7097156-ipoefx.ipoe.ocn.ne.jp [153.231.19.155])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4CB32720;
        Wed, 17 May 2023 14:46:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1684327575;
        bh=m1SHeCZPjrbGNh8l/DDQIaIzwFMdAgrKeqCUVv/3DL8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GZ9yC8gLOdJO91iGWtK+WZsKQJHNh0xngX8NhJRiAQoEbq5dEShaUQklpbVitnsGF
         jnetW9eljhSP5SGt22CzwsJLd53c3SIjBv9ViLqLrIi460aq4bm5m6WXD1QEpnAnbO
         vcgrLvGYsDnBygEcB0RwJXyh+Qmk7UWy0FfBEL1k=
Date:   Wed, 17 May 2023 15:46:23 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     linux-media@vger.kernel.org,
        Media Submaintainers <media-submaintainers@linuxtv.org>
Subject: Re: [media-submaintainers] [GIT FIXES FOR 6.4] V4L2 fixes for 6.4
Message-ID: <20230517124623.GA12992@pendragon.ideasonboard.com>
References: <ZGTItbiccvPAbhkl@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZGTItbiccvPAbhkl@valkosipuli.retiisi.eu>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Wed, May 17, 2023 at 03:29:41PM +0300, Sakari Ailus wrote:
> Hi Mauro,
> 
> This set includes fixes for 6.4, including compile fixes.
> 
> Please pull.
> 
> 
> The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:
> 
>   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)
> 
> are available in the Git repository at:
> 
>   git://linuxtv.org/sailus/media_tree.git tags/fixes-6.4-2-signed
> 
> for you to fetch changes up to b82b6df4937ee625ba99ee231a3ab6ba98356ca6:
> 
>   staging: media: imx: initialize hs_settle to avoid warning (2023-05-16 16:41:05 +0300)
> 
> ----------------------------------------------------------------
> V4L2 fixees for 6.4
> 
> ----------------------------------------------------------------
> Hans Verkuil (1):
>       staging: media: imx: initialize hs_settle to avoid warning
> 
> Palmer Dabbelt (2):
>       media: nxp: imx8-isi: Fix unusued function warnings
>       media: nxp: imx8-isi: Fix undefined config warnings

Linus' master branch already contains (better) fixes for these two
issues, see

55e2a6e36be6 media: nxp: ignore unused suspend operations
ba0ad6ed89fd media: nxp: imx8-isi: fix buiding on 32-bit

> Tomi Valkeinen (1):
>       media: v4l2-subdev: Fix missing kerneldoc for client_caps
> 
> Vaishnav Achath (1):
>       media: v4l2-mc: Drop subdev check in v4l2_create_fwnode_links_to_pad()
> 
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 4 ++--
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c   | 6 +++---
>  drivers/media/v4l2-core/v4l2-mc.c                   | 3 +--
>  drivers/staging/media/imx/imx8mq-mipi-csi2.c        | 2 +-
>  include/media/v4l2-subdev.h                         | 1 +
>  5 files changed, 8 insertions(+), 8 deletions(-)

-- 
Regards,

Laurent Pinchart
