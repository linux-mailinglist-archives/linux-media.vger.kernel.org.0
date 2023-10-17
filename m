Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BE7D7CC1E0
	for <lists+linux-media@lfdr.de>; Tue, 17 Oct 2023 13:36:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234605AbjJQLgJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Oct 2023 07:36:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234469AbjJQLgI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Oct 2023 07:36:08 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43B76EA
        for <linux-media@vger.kernel.org>; Tue, 17 Oct 2023 04:36:04 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A43A4E4;
        Tue, 17 Oct 2023 13:35:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1697542555;
        bh=oGRrubbwn8uAnGZHvMKk6CYwKWd6loxL2RN4CGCNxW8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=F5ONDhQql9pjxKOR9Gh5oApOXkGnHL6EJ84M1xmVZksuGxLPKncJsuowd+Q/fOAsY
         01VCYkJVSa1dZMnHNaQ0DAdh1pJ4FW6vms4A5RFs/oA+oYRD2okBDg86ys3dXmmUsX
         5mIwrQErpIZo4nyxfAwAqx4w9I4Kp3SIMNHxAW84=
Date:   Tue, 17 Oct 2023 14:36:09 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, jacopo.mondi@ideasonboard.com,
        dave.stevenson@raspberrypi.com, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 3/3] media: Documentation: LP-11 and LP-111 are
 states, not modes
Message-ID: <20231017113609.GA14832@pendragon.ideasonboard.com>
References: <20231017105630.558089-1-sakari.ailus@linux.intel.com>
 <20231017105630.558089-4-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231017105630.558089-4-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Tue, Oct 17, 2023 at 01:56:30PM +0300, Sakari Ailus wrote:
> LP-11 and LP-111 are CSI-2 bus states, not modes. Fix this.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  Documentation/driver-api/media/tx-rx.rst | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/driver-api/media/tx-rx.rst b/Documentation/driver-api/media/tx-rx.rst
> index 7e115e3c4735..bc1b94cffdd9 100644
> --- a/Documentation/driver-api/media/tx-rx.rst
> +++ b/Documentation/driver-api/media/tx-rx.rst
> @@ -89,13 +89,13 @@ where
>  	pixel rate on the camera sensor's pixel array which is indicated by the
>  	:ref:`V4L2_CID_PIXEL_RATE <v4l2-cid-pixel-rate>` control.
>  
> -LP-11 and LP-111 modes
> -^^^^^^^^^^^^^^^^^^^^^^
> +LP-11 and LP-111 states
> +^^^^^^^^^^^^^^^^^^^^^^^

Indeed.

>  
> -As part of transitioning to high speed mode, a CSI-2 transmitter typically
> +As part of transitioning to high speed state, a CSI-2 transmitter typically

"high speed" is a mode according to the D-PHY specification.

>  briefly sets the bus to LP-11 or LP-111 state, depending on the PHY. This period
>  may be as short as 100 µs, during which the receiver observes this state and
> -proceeds its own part of high speed mode transition.
> +proceeds its own part of high speed state transition.

Same here.

>  
>  Most receivers are capable of autonomously handling this once the software has
>  configured them to do so, but there are receivers which require software
> @@ -104,7 +104,7 @@ in software, especially when there is no interrupt telling something is
>  happening.
>  
>  One way to address this is to configure the transmitter side explicitly to LP-11
> -or LP-111 mode, which requires support from the transmitter hardware. This is
> +or LP-111 state, which requires support from the transmitter hardware. This is

Ack.

With the two changes referring to high speed state dropped,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  not universally available. Many devices return to this state once streaming is
>  stopped while the state after power-on is LP-00 or LP-000.
>  
> @@ -115,11 +115,11 @@ transitioning to streaming state, but not yet start streaming. Similarly, the
>  to call ``.post_streamoff()`` for each successful call of ``.pre_streamon()``.
>  
>  In the context of CSI-2, the ``.pre_streamon()`` callback is used to transition
> -the transmitter to the LP-11 or LP-111 mode. This also requires powering on the
> +the transmitter to the LP-11 or LP-111 state. This also requires powering on the
>  device, so this should be only done when it is needed.
>  
> -Receiver drivers that do not need explicit LP-11 or LP-111 mode setup are waived
> -from calling the two callbacks.
> +Receiver drivers that do not need explicit LP-11 or LP-111 state setup are
> +waived from calling the two callbacks.
>  
>  Stopping the transmitter
>  ^^^^^^^^^^^^^^^^^^^^^^^^

-- 
Regards,

Laurent Pinchart
