Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F09D46988ED
	for <lists+linux-media@lfdr.de>; Thu, 16 Feb 2023 00:53:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229606AbjBOXxL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Feb 2023 18:53:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229596AbjBOXxK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Feb 2023 18:53:10 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EBEB2004E
        for <linux-media@vger.kernel.org>; Wed, 15 Feb 2023 15:53:09 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 50AE410B;
        Thu, 16 Feb 2023 00:53:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676505187;
        bh=bZKM82NTB0W1qQRclDREzcX0mQwwk4t7M3MXK1ByLoU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MaKVEQiyM41QTcFlB9xnypRpiE8jcF6h/N/N5fciwvxa+z4tSP42rBPvCNW3lWtZC
         1mvhVPtfLpTpEZF6xg73ImL6qUR3V21IsbIiGzwpz1WHhPLQUpdBJwQCiRzrtiOic8
         mIRePhSeoEZdLjD+b+DbbZOpfl1ZKfU5MllxfOis=
Date:   Thu, 16 Feb 2023 01:53:06 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dafna Hirschfeld <dafna@fastmail.com>
Cc:     linux-media@vger.kernel.org,
        Paul Elder <paul.elder@ideasonboard.com>,
        Heiko Stuebner <heiko@sntech.de>,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v1 0/3] media: rkisp1: Convert to V4L2 subdev active state
Message-ID: <Y+1wYlNTtsse2LYT@pendragon.ideasonboard.com>
References: <20230127003124.31685-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230127003124.31685-1-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

Would you have time to review this series at some point ? There's still
plenty of time before v6.4, but I'd like to make sure not to miss that
version.

On Fri, Jan 27, 2023 at 02:31:21AM +0200, Laurent Pinchart wrote:
> Hello,
> 
> This small patch series converts the three subdevs of the rkisp1 (CSI,
> ISP and resizer) to use the V4L2 subdev active state. This simplifies
> the implementation of the subdevs, as well as the locking scheme. There
> isn't much else to add here, please see individual patches for details.
> 
> I have successfully tested this series on an i.MX8MP (Debix) and an
> RK3399 (Rock Pi 4).
> 
> Laurent Pinchart (3):
>   media: rkisp1: resizer: Use V4L2 subdev active state
>   media: rkisp1: isp: Use V4L2 subdev active state
>   media: rkisp1: csi: Use V4L2 subdev active state
> 
>  .../platform/rockchip/rkisp1/rkisp1-common.h  |  18 --
>  .../platform/rockchip/rkisp1/rkisp1-csi.c     | 107 +++----
>  .../platform/rockchip/rkisp1/rkisp1-isp.c     | 261 +++++++-----------
>  .../platform/rockchip/rkisp1/rkisp1-resizer.c | 184 +++++-------
>  4 files changed, 201 insertions(+), 369 deletions(-)

-- 
Regards,

Laurent Pinchart
