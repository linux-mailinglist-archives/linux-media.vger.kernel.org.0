Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE1B557C78F
	for <lists+linux-media@lfdr.de>; Thu, 21 Jul 2022 11:27:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231128AbiGUJ1F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jul 2022 05:27:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230170AbiGUJ1E (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jul 2022 05:27:04 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A56FA77574
        for <linux-media@vger.kernel.org>; Thu, 21 Jul 2022 02:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658395623; x=1689931623;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FmwWr877Jl7UJuhtO0/LXSQBwEzOtGw6iNoxhZ3+7xs=;
  b=NLejD2AkMx5pZZNVcHAWJQjlgkhFE3jCT9IsK+juEO8R8nNEPG+urtVh
   qaV6T92jil7f/QPG/sd4XdnGl0mNxRD0bBw1zz4zdMuMH/+5vrGHlW/uD
   nlitseuLjty37Aq/3cs32n0UfFxxaDKqCTPp0kDoRPuf5L2SojKKuZ/sZ
   Pcd9gdX6PLW3NL3cgU69tTFc+m2a/UWzdRkHHgGpzPpmZhqYWHdq6nNDF
   HJKjLJn2ic+bqo7Ud5NxEdQsh6t8DKrC47ZhdPwSWtb2WnyDv7Wo38c6N
   WTjc5FzO8YfQcfoT+5BCnpV/asEu5ksDU982byeCqRDRh5aeAXELs1FWm
   w==;
X-IronPort-AV: E=Sophos;i="5.92,289,1650924000"; 
   d="scan'208";a="25179856"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 21 Jul 2022 11:27:02 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 21 Jul 2022 11:27:02 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 21 Jul 2022 11:27:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658395622; x=1689931622;
  h=from:to:cc:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding:subject;
  bh=FmwWr877Jl7UJuhtO0/LXSQBwEzOtGw6iNoxhZ3+7xs=;
  b=hD+pZA2ZosoLpBw7OQg9e3QJS4GQVwu39cHh02+1yE5O1CYA6MhykpY5
   d2UqCHq9+CehxH4kOhod3fMk2qHaIP3bmRJyivzyySUs9cnXvXjXC5EW4
   bREzvtTttSWhkkfs7oEebHJQS5nmxJ2QGFx7zkpAp7W5JFIMDytF3CSzF
   KyXtGfxYddDpMW8C+J6GxfxP8bAdg+B9nOM7A/oiMtmXpUklCbRwh75Zm
   SBUoB4flDFCaIc/RmhcRt9ksZ5oQAdpNE8rySXCY95mYnA1TNx52SK0CP
   GMgfl3KmJxT5EYveuug+w/fZK+D2Z2RgqQhRJCKilNP6m0nNHHe5jlMBX
   w==;
X-IronPort-AV: E=Sophos;i="5.92,289,1650924000"; 
   d="scan'208";a="25179855"
Subject: Re: [PATCH 06/19] media: i2c: imx290: Drop regmap cache
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 21 Jul 2022 11:27:02 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 10B33280056;
        Thu, 21 Jul 2022 11:27:02 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
Date:   Thu, 21 Jul 2022 11:27:01 +0200
Message-ID: <3792507.iZASKD2KPV@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20220721083540.1525-7-laurent.pinchart@ideasonboard.com>
References: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com> <20220721083540.1525-7-laurent.pinchart@ideasonboard.com>
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

Am Donnerstag, 21. Juli 2022, 10:35:27 CEST schrieb Laurent Pinchart:
> Only two registers are ever read, and once only. There's no need to
> cache values.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/imx290.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index f280ded2dac3..711282126c34 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -97,7 +97,6 @@ static const struct imx290_pixfmt imx290_formats[] = {
>  static const struct regmap_config imx290_regmap_config = {
>  	.reg_bits = 16,
>  	.val_bits = 8,
> -	.cache_type = REGCACHE_RBTREE,
>  };
> 
>  static const char * const imx290_test_pattern_menu[] = {

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>



