Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3A5D28D57C
	for <lists+linux-media@lfdr.de>; Tue, 13 Oct 2020 22:41:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727340AbgJMUlO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Oct 2020 16:41:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727293AbgJMUlN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Oct 2020 16:41:13 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAEB2C061755
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2020 13:41:12 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2698AB87;
        Tue, 13 Oct 2020 22:41:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1602621670;
        bh=QDT/poxSXc4M2UdGddskN/fJ8slmPg1DhuZofBU+KH8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uojw272sZWD43Dq5MpRwsvAI6TTYDXb7fME/uyVLjzxPhiyFvMuPW10Xt6o0+saLZ
         E6IYt7GuKy3K+hbVM6+Ga0g/9bBIIvBvMCr7aAiiP1I6QH588tLzEML+VYIVBSFge2
         Eprhqk+5fjOG72iWJFSsTD43n6oCdPuSYjdLP/78=
Date:   Tue, 13 Oct 2020 23:40:24 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 1/2] Documentation: v4l: Fix language
Message-ID: <20201013204024.GK11939@pendragon.ideasonboard.com>
References: <20201013142751.26228-1-sakari.ailus@linux.intel.com>
 <20201013142751.26228-2-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201013142751.26228-2-sakari.ailus@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Tue, Oct 13, 2020 at 05:27:50PM +0300, Sakari Ailus wrote:
> Remove extra "is" from sentence explaining V4L2_CID_PIXEL_RATE may be used
> to tell the pixel rate used by a transmitter driver. Also call
> V4L2_CID_PIXEL_RATE a control.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  Documentation/driver-api/media/csi2.rst | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/driver-api/media/csi2.rst b/Documentation/driver-api/media/csi2.rst
> index e1b838014906..e3bbc6baf0f0 100644
> --- a/Documentation/driver-api/media/csi2.rst
> +++ b/Documentation/driver-api/media/csi2.rst
> @@ -28,10 +28,9 @@ interface elements must be present on the sub-device represents the
>  CSI-2 transmitter.
>  
>  The V4L2_CID_LINK_FREQ control is used to tell the receiver driver the
> -frequency (and not the symbol rate) of the link. The
> -V4L2_CID_PIXEL_RATE is may be used by the receiver to obtain the pixel
> -rate the transmitter uses. The
> -:c:type:`v4l2_subdev_video_ops`->s_stream() callback provides an
> +frequency (and not the symbol rate) of the link. The V4L2_CID_PIXEL_RATE
> +control may be used by the receiver to obtain the pixel rate the transmitter
> +uses. The :c:type:`v4l2_subdev_video_ops`->s_stream() callback provides an
>  ability to start and stop the stream.
>  
>  The value of the V4L2_CID_PIXEL_RATE is calculated as follows::

-- 
Regards,

Laurent Pinchart
