Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BAF357C768
	for <lists+linux-media@lfdr.de>; Thu, 21 Jul 2022 11:18:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232754AbiGUJSi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jul 2022 05:18:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232878AbiGUJSd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jul 2022 05:18:33 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BCE27859F
        for <linux-media@vger.kernel.org>; Thu, 21 Jul 2022 02:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658395109; x=1689931109;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bxkqLVSLHLpu2PuIt2kxKkoOQGuNUPRv5ipCfFJu/jA=;
  b=kgZNRk11LbOcy5u4kxUSOErZ/+9IIx3CqzaUw5aJ4BiJiVjlE9J8Y9s7
   8CHYtZ69f9YPnD80A6S9aRuhpXfgldb30EQtxipMlOp+yZAmAkkX8YgbT
   rXDkUVbqHXA8L+w10z0edhQs+3YJgkkzOIsfhegUoMd73iB0/7Z2T2dYw
   KQcwTURYGaUKiNbT1hx07+/90ZJJAAKCemt73wgKphSji5hOGMRFMbvGe
   XfT7kcx0RtALnnqRjv9x0LuR2t7gGTTAOLCT3Cq9arnXfWQitYqL8ULG6
   T+/L0tHaurcB77qSdsISwRUbBMQy3F7DdcJvfQ2nnfx8jomkIH/gTa03y
   A==;
X-IronPort-AV: E=Sophos;i="5.92,289,1650924000"; 
   d="scan'208";a="25179576"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 21 Jul 2022 11:18:27 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 21 Jul 2022 11:18:27 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 21 Jul 2022 11:18:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658395107; x=1689931107;
  h=from:to:cc:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding:subject;
  bh=bxkqLVSLHLpu2PuIt2kxKkoOQGuNUPRv5ipCfFJu/jA=;
  b=oGMNssdlzxtR6RlCytayWyCVB3ChmAxulfehkk+3AU3BycmXQ6g31k/j
   phb0GwXrzmDLOmZUrzX5qZGpQlZldK6QswBn2Lfm1v3DSXkN7VChGJDqD
   8gd0zTGStIdqXNsTfe2t/FnWvwTLesea/UTWv33H+9s9yW8lizQEAOS7y
   /Ikubi9NQNWaNLaCeYIwqvldcjIG5gd6BZ0yI4Ol2Xs54waPrGghFnurQ
   bGitq+6/RihK/02POFUzQpSOKCzoZ4GQJLBgwo66oenBMPLkf1QRftdLJ
   8E1gcjDifrk3rHwJAy8EBQiKwrkophRZp9WKM/41+8SkRb0NGJfTB/kJy
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,289,1650924000"; 
   d="scan'208";a="25179575"
Subject: Re: [PATCH 03/19] media: i2c: imx290: Specify HMAX values in decimal
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 21 Jul 2022 11:18:27 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 4D127280056;
        Thu, 21 Jul 2022 11:18:27 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
Date:   Thu, 21 Jul 2022 11:18:24 +0200
Message-ID: <3848757.ElGaqSPkdT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20220721083540.1525-4-laurent.pinchart@ideasonboard.com>
References: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com> <20220721083540.1525-4-laurent.pinchart@ideasonboard.com>
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

thanks for working on this, I've also some patches on top for imx327 support.

Am Donnerstag, 21. Juli 2022, 10:35:24 CEST schrieb Laurent Pinchart:
> The HMAX value specifies the total line length in pixels. It's thus more
> readable in decimal than hexadecimal. Fix it.

I understand the motivation, pixels are more natural in decimal numbers, but 
e.g. what is 4400 pixels on this sensor? It is only mentioned sparsely and 
3300d is not mentioned at all, 0ce4h is instead.
I also like to have the hexadecimal numbers here as you can find them directly 
in the datasheet. To me this seems more sensible for cross-checking. Just my 
opinion.

Best regards,
Alexander

> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/imx290.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 64bd43813dbf..f60a4135dc9c 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -308,7 +308,7 @@ static const struct imx290_mode imx290_modes_2lanes[] =
> { {
>  		.width = 1920,
>  		.height = 1080,
> -		.hmax = 0x1130,
> +		.hmax = 4400,
>  		.link_freq_index = FREQ_INDEX_1080P,
>  		.data = imx290_1080p_settings,
>  		.data_size = ARRAY_SIZE(imx290_1080p_settings),
> @@ -316,7 +316,7 @@ static const struct imx290_mode imx290_modes_2lanes[] =
> { {
>  		.width = 1280,
>  		.height = 720,
> -		.hmax = 0x19c8,
> +		.hmax = 6600,
>  		.link_freq_index = FREQ_INDEX_720P,
>  		.data = imx290_720p_settings,
>  		.data_size = ARRAY_SIZE(imx290_720p_settings),
> @@ -327,7 +327,7 @@ static const struct imx290_mode imx290_modes_4lanes[] =
> { {
>  		.width = 1920,
>  		.height = 1080,
> -		.hmax = 0x0898,
> +		.hmax = 2200,
>  		.link_freq_index = FREQ_INDEX_1080P,
>  		.data = imx290_1080p_settings,
>  		.data_size = ARRAY_SIZE(imx290_1080p_settings),
> @@ -335,7 +335,7 @@ static const struct imx290_mode imx290_modes_4lanes[] =
> { {
>  		.width = 1280,
>  		.height = 720,
> -		.hmax = 0x0ce4,
> +		.hmax = 3300,
>  		.link_freq_index = FREQ_INDEX_720P,
>  		.data = imx290_720p_settings,
>  		.data_size = ARRAY_SIZE(imx290_720p_settings),




