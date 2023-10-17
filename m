Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CEE67CC1E7
	for <lists+linux-media@lfdr.de>; Tue, 17 Oct 2023 13:38:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343611AbjJQLit (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Oct 2023 07:38:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234147AbjJQLit (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Oct 2023 07:38:49 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C61DF9F
        for <linux-media@vger.kernel.org>; Tue, 17 Oct 2023 04:38:47 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E4D87E4;
        Tue, 17 Oct 2023 13:38:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1697542720;
        bh=pZrBX4NP7FM0o6v85FmepitZUi1+gWLWgJSzVvNlOQo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HoAnpr6tuRaHU2mOlf7YEJ2HvuoVa4xG0c6FFMaL1kkE2swdLRtSEPn1tQrZufspJ
         kvysc9WOrPnJxlv5zJYJvUG4ifFaTwmWF1CmKT6dJtUPVlaroHY1fn4vYbhvWFi0cD
         xtqE2SrZe+MVYijaQOrZ9ExVGu6nSlmZ5vanfRSc=
Date:   Tue, 17 Oct 2023 14:38:53 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, jacopo.mondi@ideasonboard.com,
        dave.stevenson@raspberrypi.com, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 2/3] media: Documentation: BT.601 is not a bus
Message-ID: <20231017113853.GB14832@pendragon.ideasonboard.com>
References: <20231017105630.558089-1-sakari.ailus@linux.intel.com>
 <20231017105630.558089-3-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231017105630.558089-3-sakari.ailus@linux.intel.com>
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

On Tue, Oct 17, 2023 at 01:56:29PM +0300, Sakari Ailus wrote:
> BT.601 is not actually a bus specification, leaving parallel bus without a
> specification to refer to. Fix this.

I'm really annoyed there's no standard name for parallel buses :-(

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  Documentation/driver-api/media/camera-sensor.rst | 4 ++--
>  Documentation/driver-api/media/tx-rx.rst         | 3 +--
>  2 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
> index 0de5c86cbd1f..19f2feeecc91 100644
> --- a/Documentation/driver-api/media/camera-sensor.rst
> +++ b/Documentation/driver-api/media/camera-sensor.rst
> @@ -9,8 +9,8 @@ This document covers the in-kernel APIs only. For the best practices on
>  userspace API implementation in camera sensor drivers, please see
>  :ref:`media_using_camera_sensor_drivers`.
>  
> -CSI-2 and parallel (BT.601 and BT.656) busses
> ----------------------------------------------
> +CSI-2 and parallel and BT.656 buses

CSI-2, parallel and BT.656 buses

> +-----------------------------------
>  
>  Please see :ref:`transmitter-receiver`.
>  
> diff --git a/Documentation/driver-api/media/tx-rx.rst b/Documentation/driver-api/media/tx-rx.rst
> index e1e9258dd862..7e115e3c4735 100644
> --- a/Documentation/driver-api/media/tx-rx.rst
> +++ b/Documentation/driver-api/media/tx-rx.rst
> @@ -25,9 +25,8 @@ the host SoC. It is defined by the `MIPI alliance`_.
>  Parallel
>  ^^^^^^^^
>  
> -`BT.601`_ and `BT.656`_ are the most common parallel busses.
> +The parallel bus and its `BT.656`_ variant are the most common parallel busses.

We use "parallel" to mean explicit sync signals in many places
(including APIs), and here it covers BT.656 too :-( This sentence is
fairly bad.

>  
> -.. _`BT.601`: https://en.wikipedia.org/wiki/Rec._601
>  .. _`BT.656`: https://en.wikipedia.org/wiki/ITU-R_BT.656
>  
>  Transmitter drivers

-- 
Regards,

Laurent Pinchart
