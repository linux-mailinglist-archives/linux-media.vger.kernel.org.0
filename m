Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B94B857C77E
	for <lists+linux-media@lfdr.de>; Thu, 21 Jul 2022 11:23:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232828AbiGUJXw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jul 2022 05:23:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232073AbiGUJXv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jul 2022 05:23:51 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5DC88048D
        for <linux-media@vger.kernel.org>; Thu, 21 Jul 2022 02:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658395430; x=1689931430;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WOu/7gpIK9/NOXBOfaXVOw9dbpuHTpOpOl016435AfU=;
  b=ORbX5CoEAxocDkuQLY7uRjI/3cYRse9lveQoqXFzmzXriykEUDwrMGzI
   jCjsAmUOatx7rBl0Q4qUYYo0oVqOyEIg54GHlsFMrimqiUSqIs7mnB9ri
   d9TfX0HIWPsLxlORHQC0l9PI29ym9wbFFHaPnGWeN/73SFj6+A3Gy98xC
   Dhknw5Bg1/njj50Ul20IK+ioqdXkfXijcQPAULcsw1ZG1jmP1OVlCCCC8
   vA6ogqYtaaCu712vpyS9c7uvn95W7rx+9cbAkL4FGgBQVZ54vwcVzrnnt
   vjwOW7SJDSqk13UYe7juWXCF26Ic5lIMi7R1SoQtgb8WaMdmAm+W6YMeF
   A==;
X-IronPort-AV: E=Sophos;i="5.92,289,1650924000"; 
   d="scan'208";a="25179763"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 21 Jul 2022 11:23:48 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 21 Jul 2022 11:23:48 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 21 Jul 2022 11:23:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658395428; x=1689931428;
  h=from:to:cc:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding:subject;
  bh=WOu/7gpIK9/NOXBOfaXVOw9dbpuHTpOpOl016435AfU=;
  b=klT4x8+CsSzSxFM9O3rRnJ3rmjNBfkYxE8G/jPl01+8VZ7NdojIj7IlY
   yuOQXabgw2GIS1j54nrES/TFZeiUDuC5ttVpyZYxrlm08bl5L/xuvUBn2
   7IzivOH4iNzVyt6lHfQ1pbmNAiUJewwuntIROh7g+fMNuvc+XcagKpfXu
   weeoucLkDwRSkTHWZtsxmEoslErziEQcaoVokTei/v6ZZPRmfcIN3a60d
   OP08lAY+JpNwn05guvx5JY2F0bP8XkDMZZbNRRd4SaL77BWHqyjN1NEQG
   mhHOkZP0ywOMDHzEaBy8FE2qTEN2q7/G+I50QnIrarwtwpHn9ntcYIw/d
   g==;
X-IronPort-AV: E=Sophos;i="5.92,289,1650924000"; 
   d="scan'208";a="25179762"
Subject: Re: [PATCH 04/19] media: i2c: imx290: Replace macro with explicit
 ARRAY_SIZE()
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 21 Jul 2022 11:23:48 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 2F7DC280056;
        Thu, 21 Jul 2022 11:23:48 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
Date:   Thu, 21 Jul 2022 11:23:45 +0200
Message-ID: <4781652.aeNJFYEL58@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20220721083540.1525-5-laurent.pinchart@ideasonboard.com>
References: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com> <20220721083540.1525-5-laurent.pinchart@ideasonboard.com>
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

Am Donnerstag, 21. Juli 2022, 10:35:25 CEST schrieb Laurent Pinchart:
> Use ARRAY_SIZE(imx290->supplies) for code that needs the size of the
> array, instead of relying on the IMX290_NUM_SUPPLIES. The result is less
> error-prone as it ties the size to the array.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/imx290.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index f60a4135dc9c..9a0c458a3af0 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -790,10 +790,10 @@ static int imx290_get_regulators(struct device *dev,
> struct imx290 *imx290) {
>  	unsigned int i;
> 
> -	for (i = 0; i < IMX290_NUM_SUPPLIES; i++)
> +	for (i = 0; i < ARRAY_SIZE(imx290->supplies); i++)
>  		imx290->supplies[i].supply = imx290_supply_name[i];
> 
> -	return devm_regulator_bulk_get(dev, IMX290_NUM_SUPPLIES,
> +	return devm_regulator_bulk_get(dev, ARRAY_SIZE(imx290->supplies),
>  				       imx290->supplies);
>  }
> 
> @@ -852,7 +852,8 @@ static int imx290_power_on(struct device *dev)
>  		return ret;
>  	}
> 
> -	ret = regulator_bulk_enable(IMX290_NUM_SUPPLIES, imx290->supplies);
> +	ret = regulator_bulk_enable(ARRAY_SIZE(imx290->supplies),
> +				    imx290->supplies);
>  	if (ret) {
>  		dev_err(dev, "Failed to enable regulators\n");
>  		clk_disable_unprepare(imx290->xclk);
> @@ -876,7 +877,7 @@ static int imx290_power_off(struct device *dev)
> 
>  	clk_disable_unprepare(imx290->xclk);
>  	gpiod_set_value_cansleep(imx290->rst_gpio, 1);
> -	regulator_bulk_disable(IMX290_NUM_SUPPLIES, imx290->supplies);
> +	regulator_bulk_disable(ARRAY_SIZE(imx290->supplies), imx290-
>supplies);
> 
>  	return 0;
>  }

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>



