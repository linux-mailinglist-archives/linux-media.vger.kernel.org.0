Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 584CF57C8AC
	for <lists+linux-media@lfdr.de>; Thu, 21 Jul 2022 12:12:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233131AbiGUKL7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jul 2022 06:11:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233125AbiGUKL4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jul 2022 06:11:56 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32BAC550D7
        for <linux-media@vger.kernel.org>; Thu, 21 Jul 2022 03:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658398315; x=1689934315;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cL6UW6SFvhQVbrMcLyrdZimTziDJ6PqK7/hWVDNRJxQ=;
  b=oNDRemTvbNEzMp2UbF4hkA5JNY6wIQnwiESVLAMKgO6yI06noBbHZauK
   zVENQotxwvYXOcOV8QJfINNU/94WTZhZP8rJ9Ij/wjq4LzNaIXuh6RNyY
   CZ9plUVv5IN38m/9thAgVJLBOoWZEmu+Em3Gb4afMflB5TOmvdc2A0SrS
   v0d3IDEkDqHeJHjHnLTksn1eFPxxVMl3MpBpgypb8tZD8GdEvE0tiagiZ
   j2a1Z8lyD93IOi3joyAcgDF3tiyC84rfyPUvawpJh0RQksDI+KngUJbwb
   fZa3XpuyBp3BTRIUCoKqH8zE4cVa8kf+6Pb991NKcZi0bY4cEbYG7CTxy
   A==;
X-IronPort-AV: E=Sophos;i="5.92,289,1650924000"; 
   d="scan'208";a="25181532"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 21 Jul 2022 12:11:53 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 21 Jul 2022 12:11:53 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 21 Jul 2022 12:11:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658398313; x=1689934313;
  h=from:to:cc:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding:subject;
  bh=cL6UW6SFvhQVbrMcLyrdZimTziDJ6PqK7/hWVDNRJxQ=;
  b=K+wUJMINf+dRcVOc7cRikHKzh1Nl04xlKP01meYIr3lcog8+HNu5+sZn
   1IvBH2tDak4R6Wt/0n8Ut8ZfprgZogIIROv4Ei7qdsQ9TXlYG6cIdnLfd
   +sbjKEu5RQt3sO3XWbYI9gBlz1yrgEqN9VdcqBg9cSY+/NbxBU0uGKaS+
   V7gC9cGCLvZ4ALkUJ3IJpIdh4y86kEOUudANRaDbMynv2xsdezroU9XpE
   GAn40csNgxESuO9SAxoklklluNHJ5mFQRSwN0Gp2V2GDjCmd9duHpuTw2
   RSISkaigfbEJMk62lajC1OWfKf+6ZyXiZqcaCe/HoGIfGTAypRQtlOGg7
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,289,1650924000"; 
   d="scan'208";a="25181531"
Subject: Re: [PATCH 19/19] media: i2c: imx290: Replace GAIN control with ANALOGUE_GAIN
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 21 Jul 2022 12:11:53 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 6E36B280056;
        Thu, 21 Jul 2022 12:11:53 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
Date:   Thu, 21 Jul 2022 12:11:53 +0200
Message-ID: <3513048.yKVeVyVuyW@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20220721083540.1525-20-laurent.pinchart@ideasonboard.com>
References: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com> <20220721083540.1525-20-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Donnerstag, 21. Juli 2022, 10:35:40 CEST schrieb Laurent Pinchart:
> The IMX290 gain register controls the analogue gain. Replace the
> V4L2_CID_GAIN control with V4L2_CID_ANALOGUE_GAIN.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/imx290.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 0cb11ec1cf0f..871e3e69a8a4 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -524,7 +524,7 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
>  		return 0;
> 
>  	switch (ctrl->id) {
> -	case V4L2_CID_GAIN:
> +	case V4L2_CID_ANALOGUE_GAIN:
>  		ret = imx290_write(imx290, IMX290_GAIN, ctrl->val, 
NULL);
>  		break;
> 
> @@ -1006,7 +1006,7 @@ static int imx290_ctrl_init(struct imx290 *imx290)
>  	imx290->ctrls.lock = &imx290->lock;
> 
>  	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> -			  V4L2_CID_GAIN, 0, 240, 1, 0);
> +			  V4L2_CID_ANALOGUE_GAIN, 0, 240, 1, 0);
> 
>  	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
>  			  V4L2_CID_EXPOSURE, 1, IMX290_VMAX_DEFAULT - 
2, 1,

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>




