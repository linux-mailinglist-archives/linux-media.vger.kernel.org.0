Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2315C57C77B
	for <lists+linux-media@lfdr.de>; Thu, 21 Jul 2022 11:23:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232884AbiGUJXG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jul 2022 05:23:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232883AbiGUJXF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jul 2022 05:23:05 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 635838048D
        for <linux-media@vger.kernel.org>; Thu, 21 Jul 2022 02:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658395384; x=1689931384;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p/wfk4BOD+jpKvUpLG6EtjSuuwSmDFbUNQkN6z/AWY4=;
  b=DAddXP8MfVNGNNjUhumupbxjetK20vEAdYi1xVYyoEYGIGQHu90sqVh4
   VM0VB5CmznZW7qBpQuKhNhebPLrFdjvIhaQCxblwrfkx6KrSVuBxVUPSQ
   Naj7cHk2mgZrAoo07Eq45XOsnhDomA+WU15j3vlMGlQinIp6cfaV0zKdZ
   E9ioYp0er+nEL6gd37KC1+m+a6mdrpagMiTbMlNESg3qmByEL9K/OmaWB
   esM9Hq5KMK2+/GfG9A+wQEZtgXm4WZKItPbDz2QY7UTicv+su4QiAj36i
   Fwrz6egnb9PDzItOKdP72EOjVxtgZYBNMGftpX/5WepdD/lhYqbMLV+bj
   g==;
X-IronPort-AV: E=Sophos;i="5.92,289,1650924000"; 
   d="scan'208";a="25179721"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 21 Jul 2022 11:23:02 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 21 Jul 2022 11:23:02 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 21 Jul 2022 11:23:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658395382; x=1689931382;
  h=from:to:cc:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding:subject;
  bh=p/wfk4BOD+jpKvUpLG6EtjSuuwSmDFbUNQkN6z/AWY4=;
  b=nd7UoDtkciNgv0uTFzVB+6S2AOeTS51jVsOOMgfNcDpBqypDdySTns12
   2gfnHeA5jGs7jaqC6/F8Is9waACDQ6Qzpr6UUIeJDa9E3EZaeqNdaVoEP
   19dHuar/+C+Y4uwt2h2O54DVbMt99d2pjn27FLBWtejYyh/dwsh0Rhv5t
   35UpOyDJu6WXuGpRJJOTE97B87rZCom1QI53bcdU39WWvsMLtkMimdAOF
   rdwdtKuJra3V9NCBYjJaoG6VHMzLX++Uh7a2qVY2XMN+w0gMvdvnv1eZt
   l+uSDAduXId80h1dggHPuYPyB5H2mpMAEfVNCLhB2BOMyYrchEwoNbzc6
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,289,1650924000"; 
   d="scan'208";a="25179720"
Subject: Re: [PATCH 02/19] media: i2c: imx290: Print error code when I2C transfer
 fails
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 21 Jul 2022 11:23:02 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id AFB7C280056;
        Thu, 21 Jul 2022 11:23:02 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
Date:   Thu, 21 Jul 2022 11:23:00 +0200
Message-ID: <14662881.uLZWGnKmhe@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20220721083540.1525-3-laurent.pinchart@ideasonboard.com>
References: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com> <20220721083540.1525-3-laurent.pinchart@ideasonboard.com>
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

Am Donnerstag, 21. Juli 2022, 10:35:23 CEST schrieb Laurent Pinchart:
> Knowing why I2C transfers fail is useful for debugging. Extend the error
> message to print the error code.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/imx290.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index d97a5fb1d501..64bd43813dbf 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -370,7 +370,8 @@ static inline int __always_unused imx290_read_reg(struct
> imx290 *imx290, u16 add
> 
>  	ret = regmap_read(imx290->regmap, addr, &regval);
>  	if (ret) {
> -		dev_err(imx290->dev, "I2C read failed for addr: %x\n", 
addr);
> +		dev_err(imx290->dev, "Failed to read register 0x%04x: 
%d\n",
> +			addr, ret);
>  		return ret;
>  	}
> 
> @@ -385,7 +386,8 @@ static int imx290_write_reg(struct imx290 *imx290, u16
> addr, u8 value)
> 
>  	ret = regmap_write(imx290->regmap, addr, value);
>  	if (ret) {
> -		dev_err(imx290->dev, "I2C write failed for addr: %x\n", 
addr);
> +		dev_err(imx290->dev, "Failed to write register 0x%04x: 
%d\n",
> +			addr, ret);
>  		return ret;
>  	}

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>



