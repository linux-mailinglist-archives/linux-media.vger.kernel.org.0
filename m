Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE1981DA656
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2020 02:19:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727941AbgETAS7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 May 2020 20:18:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726344AbgETAS7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 May 2020 20:18:59 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56290C061A0E
        for <linux-media@vger.kernel.org>; Tue, 19 May 2020 17:18:59 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7F1519CD;
        Wed, 20 May 2020 02:18:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1589933938;
        bh=6GMUldYufIIqiBWh1mnGpu92RI/wYMEJH5XMi5g7yys=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GNsxPGcDj1LywzTLYn7uHC2XpfaWGg0+HUl7cIv+vVKBHdyd4vZvZbIZng4XDD+Ep
         +zQ3xmBUvwu9GyBxKDu3vbVyqyqeyWOvLrUDtsEiNaj8+71lqzX8OBmNPgG3/AWCMa
         9JaUI9zLn1IVGL5QlBcwwCSCh92wGO0QWP0RrEEA=
Date:   Wed, 20 May 2020 03:18:30 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl
Subject: Re: [PATCH v3 1/1] Documentation: media: Refer to mbus format
 documentation from CSI-2 docs
Message-ID: <20200520001830.GO3820@pendragon.ideasonboard.com>
References: <20200519112136.6122-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200519112136.6122-1-sakari.ailus@linux.intel.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Tue, May 19, 2020 at 02:21:36PM +0300, Sakari Ailus wrote:
> The media bus formats to be used on serial busses are documented but there
> was no reference from CSI-2 documentation. Add that now.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> since v2:
> 
> - Refer to mbus formats.
> 
> - Remove other elaboration on formats.
> 
> - Fix subject (format vs. code)
> 
>  Documentation/driver-api/media/csi2.rst | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/driver-api/media/csi2.rst b/Documentation/driver-api/media/csi2.rst
> index da8b356389f0..310849d53d05 100644
> --- a/Documentation/driver-api/media/csi2.rst
> +++ b/Documentation/driver-api/media/csi2.rst
> @@ -10,6 +10,12 @@ the host SoC. It is defined by the `MIPI alliance`_.
>  
>  .. _`MIPI alliance`: http://www.mipi.org/
>  
> +Media bus formats
> +-----------------
> +
> +See :ref:`v4l2-mbus-pixelcode` for details on which media bus formats should   
> +be used for CSI-2 interfaces.
> +
>  Transmitter drivers
>  -------------------
>  

-- 
Regards,

Laurent Pinchart
