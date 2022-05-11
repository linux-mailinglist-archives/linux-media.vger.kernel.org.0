Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CB2052343B
	for <lists+linux-media@lfdr.de>; Wed, 11 May 2022 15:28:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243733AbiEKN2Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 May 2022 09:28:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243990AbiEKN1o (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 May 2022 09:27:44 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58FBA45AF2
        for <linux-media@vger.kernel.org>; Wed, 11 May 2022 06:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1652275662; x=1683811662;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JoYaZjmI0xUvpEGC3aHC0sjmMFPLADyXjpQB7mtAzKE=;
  b=YYGwDLBpm79xm+GOxa7rJ2moEfWssQGqkd0/jLLHnXMHtK9bXNQy9UKW
   KA0lYqNDWFUZub16lfhfIkm02Y9LKcCXyOud//0CLhgnNdwDpwgVaIsHJ
   7TEeCUJU2XNu34tm3XUpJZP+Rw4Oe1fkC7ZeKyVxSdXOstlwq00kzL/Qu
   SvXpJDg5ihzkQTJDeYC+a2YjrM7yrsqahOKmxYHReIE49iGbJhq/Vl6De
   gD+vHtAnM5/kLieSF4tRDAw/xuayJ02//lnigGivX6xP0f9gJ+675sF12
   CP4ZDCpMXS/iCM/pi88O1zPlDnvMsMXHYaZr78B0UNxJEP5pH5ZTLSTV8
   w==;
X-IronPort-AV: E=Sophos;i="5.91,217,1647298800"; 
   d="scan'208";a="23811463"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 11 May 2022 15:27:40 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 11 May 2022 15:27:40 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 11 May 2022 15:27:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1652275660; x=1683811660;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JoYaZjmI0xUvpEGC3aHC0sjmMFPLADyXjpQB7mtAzKE=;
  b=TENIS5jfmii+FTSf5wGL4IPOUjXOwtfEDq8ZatPqHb0EYaJm/htTSPCW
   BZcySdCvc7hiMOduBuNpatiMVYccajn2REGDtxVe/IkEARIqhwkVzIwC5
   3pMPW9E2W1xjFwnXdfwDJdf+VnIE70ehGXTS/0/d+t4XP8ejY+RrQUzVl
   fOKgj8iuMzUuONoecN1rhWpd1iCSNXtrs9Mm3ZoHB77BPu4kxXSfXnEGD
   EMQeOYdl6qCXWv9JmjZUBO4nO8BPZni1fMDQd7+eSswc+tVrxlII/rV3G
   GwVjitVoglVpBQK4Z0U/Fbz95rl+Pb7XeTLLxGb3fTjKdn3qKEL3yPJo3
   A==;
X-IronPort-AV: E=Sophos;i="5.91,217,1647298800"; 
   d="scan'208";a="23811462"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 11 May 2022 15:27:40 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 7DDD9280070;
        Wed, 11 May 2022 15:27:40 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>,
        kernel@pengutronix.de
Subject: Re: [PATCH 44/50] staging: media: imx: imx7-media-csi: Simplify default format in try_fmt
Date:   Wed, 11 May 2022 15:27:40 +0200
Message-ID: <3169848.aeNJFYEL58@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20220510115859.19777-45-laurent.pinchart@ideasonboard.com>
References: <20220510115859.19777-1-laurent.pinchart@ideasonboard.com> <20220510115859.19777-45-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Laurent,

Am Dienstag, 10. Mai 2022, 13:58:53 CEST schrieb Laurent Pinchart:
> When trying a format on the video node, if the requested pixel format
> isn't supported, fallback to the default with a simpler logic.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/staging/media/imx/imx7-media-csi.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/imx/imx7-media-csi.c
> b/drivers/staging/media/imx/imx7-media-csi.c index
> bc3a87656117..0fb5e0c03396 100644
> --- a/drivers/staging/media/imx/imx7-media-csi.c
> +++ b/drivers/staging/media/imx/imx7-media-csi.c
> @@ -168,6 +168,7 @@
>  #define IMX7_CSI_VIDEO_EOF_TIMEOUT	2000
> 
>  #define IMX7_CSI_DEF_MBUS_CODE		MEDIA_BUS_FMT_UYVY8_2X8
> +#define IMX7_CSI_DEF_PIX_FORMAT		V4L2_PIX_FMT_UYVY
>  #define IMX7_CSI_DEF_PIX_WIDTH		640
>  #define IMX7_CSI_DEF_PIX_HEIGHT		480
> 
> @@ -1130,7 +1131,7 @@ __imx7_csi_video_try_fmt(struct v4l2_pix_format
> *pixfmt, */
>  	cc = imx7_csi_find_pixel_format(pixfmt->pixelformat);
>  	if (!cc) {
> -		imx7_csi_enum_pixel_formats(&pixfmt->pixelformat, 0, 0);
> +		pixfmt->pixelformat = IMX7_CSI_DEF_PIX_FORMAT;
>  		cc = imx7_csi_find_pixel_format(pixfmt->pixelformat);
>  	}

This change now expects that V4L2_PIX_FMT_UYVY is the 1st entry in 
pixel_formats. Maybe a comment is helpful to indicate 
that.

Regards,
Alexander



