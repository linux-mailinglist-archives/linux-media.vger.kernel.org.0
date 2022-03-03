Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13D084CBB3B
	for <lists+linux-media@lfdr.de>; Thu,  3 Mar 2022 11:24:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232260AbiCCKY4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Mar 2022 05:24:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232311AbiCCKY4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Mar 2022 05:24:56 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60164F7470
        for <linux-media@vger.kernel.org>; Thu,  3 Mar 2022 02:24:10 -0800 (PST)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 89F0C885;
        Thu,  3 Mar 2022 11:24:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646303047;
        bh=wuSuWi8foc8paVkfCg9tIXqbSClukaBQzytV8afpTxY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=UwHFxuq3mCLBY1bED4Jme9g9/OG+NjyWopsUjJVO7i6v4xRDX51BxJ7XhPdLnwYWz
         TQvZMsbwEiqPk+69C2pdGkY/rCAJOpzFo8Pdc9CJQUmqK6Wt+8mj1M19Nub5V6rOjt
         9g/VAyUBI3hAAaaIfwMiB0CuNpF44GyEimBSQ0Po=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220302222448.1373765-1-djrscally@gmail.com>
References: <20220302222448.1373765-1-djrscally@gmail.com>
Subject: Re: [PATCH v2] media: i2c: Fix pixel array positions in ov8865
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     sakari.ailus@linux.intel.com, paul.kocialkowski@bootlin.com,
        jeanmichel.hautbois@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com
To:     Daniel Scally <djrscally@gmail.com>, linux-media@vger.kernel.org
Date:   Thu, 03 Mar 2022 10:24:04 +0000
Message-ID: <164630304480.3022961.16084582635189184585@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Daniel Scally (2022-03-02 22:24:48)
> The ov8865's datasheet gives the pixel array as 3296x2528, and the
> active portion as the centre 3264x2448. This makes for a top offset
> of 40 and a left offset of 16, not 32 and 80.

Figure 3.1 shows 24 black lines, and 16 dummy lines at the top and
bottom, giving 40 indeed.

And with 16 dummy pixel columns to both the left and right, this all
checks out.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> Fixes: acd25e220921 ("media: i2c: Add .get_selection() support to ov8865")
>=20
> Reported-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
> Changes in v2:
>=20
>     - Swapped the ordering of the lines so the left offset is first (Paul)
>=20
>  drivers/media/i2c/ov8865.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
> index cfc726e0ed1e..b8f4f0d3e33d 100644
> --- a/drivers/media/i2c/ov8865.c
> +++ b/drivers/media/i2c/ov8865.c
> @@ -457,8 +457,8 @@
> =20
>  #define OV8865_NATIVE_WIDTH                    3296
>  #define OV8865_NATIVE_HEIGHT                   2528
> -#define OV8865_ACTIVE_START_TOP                        32
> -#define OV8865_ACTIVE_START_LEFT               80
> +#define OV8865_ACTIVE_START_LEFT               16
> +#define OV8865_ACTIVE_START_TOP                        40
>  #define OV8865_ACTIVE_WIDTH                    3264
>  #define OV8865_ACTIVE_HEIGHT                   2448
> =20
> --=20
> 2.25.1
>
