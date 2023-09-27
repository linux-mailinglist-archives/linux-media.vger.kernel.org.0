Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A90A7AFD9B
	for <lists+linux-media@lfdr.de>; Wed, 27 Sep 2023 10:06:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230126AbjI0IGq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Sep 2023 04:06:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230117AbjI0IGm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Sep 2023 04:06:42 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDC7B11D
        for <linux-media@vger.kernel.org>; Wed, 27 Sep 2023 01:06:40 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F2EF8D20;
        Wed, 27 Sep 2023 10:04:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1695801897;
        bh=glJHFlSeTzk2RZMDpluhUQHf1WRgiOanb673Q7paJi8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SJHcfHzh8gl8m0YGO/EmVxYKq4gMNeYD3BLUUUj7dj/frnO0hmQXc/SxBOcirS6dB
         IaxfGco18xuyAeke52S9jfk7//aZFpHkvNfLoYuOvzpew9xbPmwx33I/tTFrvwOpkO
         NxBwh+3nwzElJWBrIHzkbU9SZze90A51nxMs9+qc=
Date:   Wed, 27 Sep 2023 11:06:47 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Martin Kepplinger <martink@posteo.de>
Subject: Re: [PATCH v6 13/13] media: Add MIPI CSI-2 generic long packet type
 definition
Message-ID: <20230927080647.GP5854@pendragon.ideasonboard.com>
References: <20230927064120.367561-1-sakari.ailus@linux.intel.com>
 <20230927064120.367561-14-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230927064120.367561-14-sakari.ailus@linux.intel.com>
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

On Wed, Sep 27, 2023 at 09:41:20AM +0300, Sakari Ailus wrote:
> Add a definition for MIPI CSI-2 generic long packet types. The generic
> long packet types are numbered from 1 to 4.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  include/media/mipi-csi2.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/media/mipi-csi2.h b/include/media/mipi-csi2.h
> index c3d8f12234b1..1503c3fab1fe 100644
> --- a/include/media/mipi-csi2.h
> +++ b/include/media/mipi-csi2.h
> @@ -19,6 +19,7 @@
>  #define MIPI_CSI2_DT_NULL		0x10
>  #define MIPI_CSI2_DT_BLANKING		0x11
>  #define MIPI_CSI2_DT_EMBEDDED_8B	0x12
> +#define MIPI_CSI2_DT_GENERIC_LONG(n)	(0x12 + (n))	/* 1..4 */

I would write

#define MIPI_CSI2_DT_GENERIC_LONG(n)	(0x13 + (n) - 1)	/* 1..4 */

to make it clear there's no overlap with MIPI_CSI2_DT_EMBEDDED_8B. Up to
you.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  #define MIPI_CSI2_DT_YUV420_8B		0x18
>  #define MIPI_CSI2_DT_YUV420_10B		0x19
>  #define MIPI_CSI2_DT_YUV420_8B_LEGACY	0x1a

-- 
Regards,

Laurent Pinchart
