Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13B5E6C90AB
	for <lists+linux-media@lfdr.de>; Sat, 25 Mar 2023 21:19:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230317AbjCYUTw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Mar 2023 16:19:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229805AbjCYUTv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Mar 2023 16:19:51 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0772DD31D
        for <linux-media@vger.kernel.org>; Sat, 25 Mar 2023 13:19:50 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1DBDA89F;
        Sat, 25 Mar 2023 21:19:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1679775588;
        bh=t9Gm2qg6/V2UGvpZMwAY3Fw5/d2Aa94eWo39errrAao=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IItCIk+5v2CF1NaP0YvkhWL4UibVN39HI9AyBpMExOjdnDVJKSuVOBMl7ZjKCCxQo
         DN7IRwUrBJveGSG9OOMiz5BSr+Evmx5Rl3Bx0QQYeEK06dUtoC+6BbbkD6TsyhQ8mk
         ShzSvsQ2vFgBYrxwNK7uKNH69NOsWT2AqqfrVdJ4=
Date:   Sat, 25 Mar 2023 22:19:54 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-sunxi@lists.linux.dev, Yong Deng <yong.deng@magewell.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Adam Pigg <adam@piggz.co.uk>
Subject: Re: [PATCH v1 0/2] media: sun6i-csi: Fix format propagation in bridge
Message-ID: <20230325201954.GA17021@pendragon.ideasonboard.com>
References: <20230104162215.31194-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230104162215.31194-1-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul,

Ping for a review. I'd like to get this in v6.4.

On Wed, Jan 04, 2023 at 06:22:13PM +0200, Laurent Pinchart wrote:
> Hello,
> 
> This small patch series fixes format propagation in the sun6i-csi-bridge
> subdev from sink pad to source pad. In order to do so, it uses the V4L2
> subdev active state provided by the V4L2 subdev core (patch 2/2), with a
> preparatory patch (1/2) that drops direct access to the bridge fields
> from the capture side.
> 
> I haven't tested the patches myself as I lack a hardware platform for
> this, but Adam (on CC) has successfully tested them. Adam, if you want
> to reply with a Tested-by tag, that would be appreciated.
> 
> Laurent Pinchart (2):
>   media: sun6i-csi: capture: Use subdev operation to access bridge
>     format
>   media: sun6i-csi: subdev: Use subdev active state to store active
>     format
> 
>  .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 211 ++++++++----------
>  .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |   9 -
>  .../sunxi/sun6i-csi/sun6i_csi_capture.c       |  23 +-
>  3 files changed, 110 insertions(+), 133 deletions(-)
> 
> 
> base-commit: 6599e683db1bf22fee74302c47e31b9a42a1c3d2

-- 
Regards,

Laurent Pinchart
