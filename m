Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A0686892AA
	for <lists+linux-media@lfdr.de>; Fri,  3 Feb 2023 09:50:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231827AbjBCIu0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Feb 2023 03:50:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231233AbjBCIuZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Feb 2023 03:50:25 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8845522DD9
        for <linux-media@vger.kernel.org>; Fri,  3 Feb 2023 00:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1675414223; x=1706950223;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yAfwucLQPvpz2qEtvVQZOLc6Bfqp+VffOrmhkxD/xeY=;
  b=nnR5X7vOrx/3p5Cqvz6l22hNMXPPoJNvHbtEI1D7mn9ZukI5R0/BVFnz
   7MefoOAQj70r/zpSzm0O2bg9cwURTTXUWZ61sebo1BmEE2YHUB18KAyRm
   Ehp4gY7tNO5lkVeSscIUoE2P7P6/SUQL+iMbGjq+ny5sj3KCd713qwlHk
   sd02GS7vVzXuAfIMOQ890vV0egCQ0OZNucn4UzPeUkFuFJ/rNoDzt57uL
   akAs6zAjjMISfOJycY4XGxtYvk8qOWLq2oFjdCHGrpj8oZ2RYE6+ewyCF
   qZURinIUwr4T4bHGnGhwt6QXu3MK7Y1tNrnONLH0yBDHT3yB66Q2ujYXi
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,269,1669071600"; 
   d="scan'208";a="28848131"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 03 Feb 2023 09:50:21 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 03 Feb 2023 09:50:21 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 03 Feb 2023 09:50:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1675414221; x=1706950221;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yAfwucLQPvpz2qEtvVQZOLc6Bfqp+VffOrmhkxD/xeY=;
  b=SkTmIkte1LwPBcONyLIhftkEFMfJLEv92oY1vS/RBXWfdv+JrK5XQdR2
   73ScsPGmlI7JWisZvhhUAXieoerG4r+Tl4LxPNiTwyE3FNFesdcij5Jcc
   qH7GL7oN4SXzhp+T6ISxI791rLubiauBCs6hGR5bTvCVXh3ZgsXluIBx9
   n8IoQkdojqgii401pRUcTjXpR0IydGiMnljDSaz8RuRMeN2/1a4V7k/S0
   Hpt9hTELf4vhne+urqFgylfX6avtl4R6Y8KUHOcuhALkYoVjblaD3/tub
   BfZB0HwF2y0S/wiiI7/KYaFWNQ15QBSz1sKRNWmxdGLtt4pG+IBO5uW/K
   A==;
X-IronPort-AV: E=Sophos;i="5.97,269,1669071600"; 
   d="scan'208";a="28848130"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 03 Feb 2023 09:50:21 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 6E6DD280056;
        Fri,  3 Feb 2023 09:50:21 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 05/11] media: i2c: imx290: Support 60fps in 2 lane operation
Date:   Fri, 03 Feb 2023 09:50:21 +0100
Message-ID: <6474652.G0QQBjFxQf@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230131192016.3476937-6-dave.stevenson@raspberrypi.com>
References: <20230131192016.3476937-1-dave.stevenson@raspberrypi.com> <20230131192016.3476937-6-dave.stevenson@raspberrypi.com>
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

Hi Dave,

thanks for the patch.

Am Dienstag, 31. Januar 2023, 20:20:10 CET schrieb Dave Stevenson:
> Commit "97589ad61c73 media: i2c: imx290: Add support for 2 data lanes"
> added support for running in two lane mode (instead of 4), but
> without changing the link frequency that resulted in a max of 30fps.
> 
> Commit "98e0500eadb7 media: i2c: imx290: Add configurable link frequency
> and pixel rate" then doubled the link frequency when in 2 lane mode,
> but didn't undo the correction for running at only 30fps, just extending
> horizontal blanking instead.
> 
> Remove the 30fps limit on 2 lane by correcting the register config
> in accordance with the datasheet for 60fps operation over 2 lanes.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/i2c/imx290.c | 17 +++--------------
>  1 file changed, 3 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index bd8729aed43c..6bcfa535872f 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -366,7 +366,7 @@ static const struct imx290_mode imx290_modes_2lanes[] =
> { {
>  		.width = 1920,
>  		.height = 1080,
> -		.hmax = 4400,
> +		.hmax = 2200,
>  		.link_freq_index = FREQ_INDEX_1080P,
>  		.data = imx290_1080p_settings,
>  		.data_size = ARRAY_SIZE(imx290_1080p_settings),
> @@ -374,7 +374,7 @@ static const struct imx290_mode imx290_modes_2lanes[] =
> { {
>  		.width = 1280,
>  		.height = 720,
> -		.hmax = 6600,
> +		.hmax = 3300,
>  		.link_freq_index = FREQ_INDEX_720P,
>  		.data = imx290_720p_settings,
>  		.data_size = ARRAY_SIZE(imx290_720p_settings),
> @@ -518,21 +518,10 @@ static int imx290_set_register_array(struct imx290
> *imx290, static int imx290_set_data_lanes(struct imx290 *imx290)
>  {
>  	int ret = 0;
> -	u32 frsel;
> -
> -	switch (imx290->nlanes) {
> -	case 2:
> -	default:
> -		frsel = 0x02;
> -		break;
> -	case 4:
> -		frsel = 0x01;
> -		break;
> -	}
> 
>  	imx290_write(imx290, IMX290_PHY_LANE_NUM, imx290->nlanes - 1, &ret);
>  	imx290_write(imx290, IMX290_CSI_LANE_MODE, imx290->nlanes - 1, 
&ret);
> -	imx290_write(imx290, IMX290_FR_FDG_SEL, frsel, &ret);
> +	imx290_write(imx290, IMX290_FR_FDG_SEL, 0x01, &ret);
> 
>  	return ret;
>  }

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>



