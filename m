Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F760635435
	for <lists+linux-media@lfdr.de>; Wed, 23 Nov 2022 10:05:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236962AbiKWJFN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Nov 2022 04:05:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236956AbiKWJE7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Nov 2022 04:04:59 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7110C100B23
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 01:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1669194298; x=1700730298;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3dt1lEvoQAcIPeNs+VHClQ4BRR2wll2fbpGgQOVtKCk=;
  b=LyRu1kKQiObSJxYmX7vngDCIUigxU1CaoaCqwTkVJITQePPPQfQO5Wvf
   eT0ywAIowSBBF2RmGfmwC6OYpQsJHn8m3WQQEfMasl+iWCHVRkLzCYBfV
   vCOyJvpHHZND7VSVU1I83EiTcasSdA28ITLiULNFAPsnt/f18Aj/EGzT8
   Wo8dxgQY/CL6VYfrvs225ZY0AEGD2wFlkzTHyNzFsmx+9oCeFf8vG/M9O
   wRSjeR6O5gwfSdKyL8Zi1vrMr6m9kgxAaigIFu42WMVmNRNjpyMmsqlPp
   4J/K24ppSGzFmk5TNt31VZVsEisxmcvI2OXp20XSSLerYSdPuiKrIbkPz
   w==;
X-IronPort-AV: E=Sophos;i="5.96,186,1665439200"; 
   d="scan'208";a="27529198"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 23 Nov 2022 10:04:56 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 23 Nov 2022 10:04:56 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 23 Nov 2022 10:04:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1669194296; x=1700730296;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3dt1lEvoQAcIPeNs+VHClQ4BRR2wll2fbpGgQOVtKCk=;
  b=NmtlFZY5LgsBDQTBmYKr4Q+nMfQfWdAzh/1LaZKwRHXxSi1xtzolcpfm
   TgKJuEfAZQIRyi+g/SUpDooblrZ69tBKHEqpUj9aWolDoDwWmZR8PPEI1
   WMKAyF1OGDznXxtt5XLzW5+BkGxL8ctaK6pZ1YXwqe5dOedWwus22KXaG
   7/5QwUn0iPVrOvGBmsD8h3w2dbFPx7nw38l1zbzcRxP/IAxKhMZ4k7EHW
   GWRJrijpX5oNUdFPFRldito8lpWiIuiDOKMKR/4z2fhJbkJXkh0XrbtWB
   LyOcdr2GEOEKsMB5vrcPNSn3DWvqGE9FIZDAV1gRw7W4e+wJfPGOyGPGy
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,186,1665439200"; 
   d="scan'208";a="27529197"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 23 Nov 2022 10:04:56 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 8FAC4280056;
        Wed, 23 Nov 2022 10:04:56 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH v1 15/15] media: i2c: imx290: Simplify imx290_set_data_lanes()
Date:   Wed, 23 Nov 2022 10:04:58 +0100
Message-ID: <2139506.Icojqenx9y@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20221122223250.21233-16-laurent.pinchart@ideasonboard.com>
References: <20221122223250.21233-1-laurent.pinchart@ideasonboard.com> <20221122223250.21233-16-laurent.pinchart@ideasonboard.com>
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

Hello Laurent,

thanks for working on this.

Am Dienstag, 22. November 2022, 23:32:50 CET schrieb Laurent Pinchart:
> There's no need to check for an incorrect number of data lanes in
> imx290_set_data_lanes() as the value is validated at probe() time. Drop
> the check.
> 
> The PHY_LANE_NUM and CSI_LANE_MODE registers are programmed with a value
> equal to the number of lanes minus one. Compute it instead of handling
> it in the switch/case.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/imx290.c | 17 +++++------------
>  1 file changed, 5 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 4dfa090f918d..369db35a7afd 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -512,28 +512,21 @@ static int imx290_set_register_array(struct imx290
> *imx290,
> 
>  static int imx290_set_data_lanes(struct imx290 *imx290)
>  {
> -	int ret = 0, laneval, frsel;
> +	int ret = 0;

You can remove ret and make function returning void as well as there 
(currently) is no error handling at all. The current single caller also 
ignores the return value.

Regards,
Alexander

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




