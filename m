Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52D1C57C781
	for <lists+linux-media@lfdr.de>; Thu, 21 Jul 2022 11:24:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232607AbiGUJYb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jul 2022 05:24:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231612AbiGUJYa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jul 2022 05:24:30 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9109D7F51C
        for <linux-media@vger.kernel.org>; Thu, 21 Jul 2022 02:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658395469; x=1689931469;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x1IPamJe1EC7E5pmshMflnADo9T9xA1Ow09+EGjIn/M=;
  b=VfoEy6YpahCFQ+Qj/xdUU9EHry/Eis1L64M4/6SyzZEQPjehJLnKMEdg
   di/KMqs1MQcjFc4DeeRbcHYR+ZYD/WNfssh8/lgboroRSDvJtQPi0j0ul
   haE9JNWKMgRrQEA1ibZstKs7ceshHhfsyJofHwKLPoFqgy2fhMxJTY/tU
   Q8M+0dM4Znd9ha5+M1Qw7YCra4o4CVNmKehtA8NEirqJ2DQRWUagXiCuC
   rQsLAHFqD2sdudaVKJrr9Ff7l/N+OsobsNpY8jH8V70J0cDcIUv+5XLP+
   MfvO26JyFfkc4nP2AHSvxyNzE65yweWPucspCO0EK+TmYnQmU7evB3Dyj
   w==;
X-IronPort-AV: E=Sophos;i="5.92,289,1650924000"; 
   d="scan'208";a="25179782"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 21 Jul 2022 11:24:28 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 21 Jul 2022 11:24:28 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 21 Jul 2022 11:24:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658395468; x=1689931468;
  h=from:to:cc:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding:subject;
  bh=x1IPamJe1EC7E5pmshMflnADo9T9xA1Ow09+EGjIn/M=;
  b=WWPEomRZ8JorHP+2xR1eLsyJyE5RQh2OivkazM5XsLD0iIB2cmwz+HXn
   rGxKVjHJlN07tXXpfaCJVcLvk4OLFMpzP5SfbT9+nUjffOFUzA6L7lZw1
   VNTRFktwwN1LTinUr859e9cIt1iVNCso4bIrfJbl2ikhR3YjuCFc4lj8V
   kZCPOizEsYJhVwAMRx/QHf0QmxxSMV0dTGpx6AgI5AuZEjhryC4SwPWS8
   Ppnh3G4JK0mNulnvN7OKCVgW+xDZoifK1vB3K64bC1bDfjZon+XtbesIo
   gypyWQ4oYfb1k96YPp37x8VnaRD9wfYmUoks0vW2NSEzDvgVejVZg+pfQ
   g==;
X-IronPort-AV: E=Sophos;i="5.92,289,1650924000"; 
   d="scan'208";a="25179781"
Subject: Re: [PATCH 05/19] media: i2c: imx290: Drop imx290_write_buffered_reg()
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 21 Jul 2022 11:24:28 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 0034D280056;
        Thu, 21 Jul 2022 11:24:27 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
Date:   Thu, 21 Jul 2022 11:24:27 +0200
Message-ID: <9694383.T7Z3S40VBb@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20220721083540.1525-6-laurent.pinchart@ideasonboard.com>
References: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com> <20220721083540.1525-6-laurent.pinchart@ideasonboard.com>
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

Am Donnerstag, 21. Juli 2022, 10:35:26 CEST schrieb Laurent Pinchart:
> The imx290_write_buffered_reg() function wraps a register write with
> register hold, to enable changing multiple registers synchronously. It
> is used for the gain only, which is an 8-bit register, defeating its
> purpose.
> 
> The feature is useful, but should be implemented differently. Drop the
> function for now, to prepare for a rework of register access.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/imx290.c | 32 +-------------------------------
>  1 file changed, 1 insertion(+), 31 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 9a0c458a3af0..f280ded2dac3 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -413,41 +413,11 @@ static int imx290_set_register_array(struct imx290
> *imx290, return 0;
>  }
> 
> -static int imx290_write_buffered_reg(struct imx290 *imx290, u16
> address_low, -				     u8 nr_regs, u32 
value)
> -{
> -	unsigned int i;
> -	int ret;
> -
> -	ret = imx290_write_reg(imx290, IMX290_REGHOLD, 0x01);
> -	if (ret) {
> -		dev_err(imx290->dev, "Error setting hold register\n");
> -		return ret;
> -	}
> -
> -	for (i = 0; i < nr_regs; i++) {
> -		ret = imx290_write_reg(imx290, address_low + i,
> -				       (u8)(value >> (i * 8)));
> -		if (ret) {
> -			dev_err(imx290->dev, "Error writing buffered 
registers\n");
> -			return ret;
> -		}
> -	}
> -
> -	ret = imx290_write_reg(imx290, IMX290_REGHOLD, 0x00);
> -	if (ret) {
> -		dev_err(imx290->dev, "Error setting hold register\n");
> -		return ret;
> -	}
> -
> -	return ret;
> -}
> -
>  static int imx290_set_gain(struct imx290 *imx290, u32 value)
>  {
>  	int ret;
> 
> -	ret = imx290_write_buffered_reg(imx290, IMX290_GAIN, 1, value);
> +	ret = imx290_write_reg(imx290, IMX290_GAIN, value);
>  	if (ret)
>  		dev_err(imx290->dev, "Unable to write gain\n");

Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>



