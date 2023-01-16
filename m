Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C68666BCA2
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 12:16:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229569AbjAPLQv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 06:16:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229889AbjAPLQn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 06:16:43 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 185EB1DBBB
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 03:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1673867802; x=1705403802;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bLZaMNMhU40Ky8TkIQYeiBurazQF4SR9QC58yBydwu0=;
  b=FKUPlad9d1Jq33PI8HVV4QBqCAyKfIENtxGVzOHFPZggxHuzFJ50jLEZ
   aHDz4DaYhZlpom/dDvYyS7GLlDDFmJNTqD6vXptt8UJhfbD/BI/xh3otx
   fYZwbJj47MHvIAHoscKAmyeSTtils8sE0x+OqP10wpXmbeDrttQrsKDCU
   JaEd7mt7aa0gR9hWJ5n+54jQEMY8zOa8B2cd12blecC5kBKrf1v1kI7wi
   yqsoYkzsjNbP6ddk7h+85lxWSSxMUB4Mk3JDaup9CgQXFo9WsdI6vYzCs
   Z/ICC4Wjm0WpmEgUzVlmU9p2EHZk0EXKVugugo02vFu0PJ2R/fbpIbtl6
   w==;
X-IronPort-AV: E=Sophos;i="5.97,220,1669071600"; 
   d="scan'208";a="28447344"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 16 Jan 2023 12:16:40 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 16 Jan 2023 12:16:40 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 16 Jan 2023 12:16:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1673867800; x=1705403800;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bLZaMNMhU40Ky8TkIQYeiBurazQF4SR9QC58yBydwu0=;
  b=PdUrXvGue1Vvh/3Oce1JDjjYb6JCPpuApd7HXiTjVLhgDvjPG7cTv1lA
   hnc2rWawdRd3pk83L7328eCTTi8ynGBRo1PoGLrBQs/JF0UsWv8ID+T1r
   ADvvzPkCUI64NVnx8jhBhTD1vvKhkn1zKwNSCtwEHOxAfk50SjX/EvOq9
   YmO6KKf54O5mMigvTEEVF+7TyfhNJ8tcRgqIczj8F/mb2UrXXlkLRkgH7
   bbQMezIW+ys/pWihZwJ1ryF3tUm4dKIsehGFpFHNt9GX3I6l2hxsqiIze
   suS7mDCDFLubTUXVLmEFSGt4zVTXNOLehkAYpC/rvocSJEhLTo8onpIea
   g==;
X-IronPort-AV: E=Sophos;i="5.97,220,1669071600"; 
   d="scan'208";a="28447343"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 16 Jan 2023 12:16:40 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 515A7280056;
        Mon, 16 Jan 2023 12:16:40 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v2 16/17] media: i2c: imx290: Simplify imx290_set_data_lanes()
Date:   Mon, 16 Jan 2023 12:16:40 +0100
Message-ID: <8210938.NyiUUSuA9g@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230114171802.13878-16-laurent.pinchart@ideasonboard.com>
References: <20230114171727.13830-1-laurent.pinchart@ideasonboard.com> <20230114171802.13878-1-laurent.pinchart@ideasonboard.com> <20230114171802.13878-16-laurent.pinchart@ideasonboard.com>
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

Hi Laurent,

thanks for the update.

Am Samstag, 14. Januar 2023, 18:18:01 CET schrieb Laurent Pinchart:
> There's no need to check for an incorrect number of data lanes in
> imx290_set_data_lanes() as the value is validated at probe() time. Drop
> the check.
> 
> The PHY_LANE_NUM and CSI_LANE_MODE registers are programmed with a value
> equal to the number of lanes minus one. Compute it instead of handling
> it in the switch/case.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
>  drivers/media/i2c/imx290.c | 17 +++++------------
>  1 file changed, 5 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 67a2edd38e91..a8167119534b 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -512,28 +512,21 @@ static int imx290_set_register_array(struct imx290
> *imx290,
> 
>  static int imx290_set_data_lanes(struct imx290 *imx290)
>  {
> -	int ret = 0, laneval, frsel;
> +	int ret = 0;
> +	u32 frsel;
> 
>  	switch (imx290->nlanes) {
>  	case 2:
> -		laneval = 0x01;
> +	default:
>  		frsel = 0x02;
>  		break;
>  	case 4:
> -		laneval = 0x03;
>  		frsel = 0x01;
>  		break;
> -	default:
> -		/*
> -		 * We should never hit this since the data lane count is
> -		 * validated in probe itself
> -		 */
> -		dev_err(imx290->dev, "Lane configuration not 
supported\n");
> -		return -EINVAL;
>  	}
> 
> -	imx290_write(imx290, IMX290_PHY_LANE_NUM, laneval, &ret);
> -	imx290_write(imx290, IMX290_CSI_LANE_MODE, laneval, &ret);
> +	imx290_write(imx290, IMX290_PHY_LANE_NUM, imx290->nlanes - 1, &ret);
> +	imx290_write(imx290, IMX290_CSI_LANE_MODE, imx290->nlanes - 1, 
&ret);
>  	imx290_write(imx290, IMX290_FR_FDG_SEL, frsel, &ret);
> 
>  	return ret;




