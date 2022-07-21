Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F3A457C87C
	for <lists+linux-media@lfdr.de>; Thu, 21 Jul 2022 12:02:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233014AbiGUKCa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jul 2022 06:02:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232917AbiGUKC1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jul 2022 06:02:27 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9400F95B5
        for <linux-media@vger.kernel.org>; Thu, 21 Jul 2022 03:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658397746; x=1689933746;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QdbBhomUhg91kvARkl28EwjZDmO1LWvBHr3r3KudHJk=;
  b=R+XnhMYjfZgwgOOFxgBXUMbkMnrHarZKqudW2ZEJ+XS7b5vG7oHdVZ0U
   uaBXzm4FKj9bx+Ct1rt4HjgtVJ+gp3H04zOW5TVXvmmr0hG8TTVKC7A9z
   DgW8ZBPh1qP26g+WxZAmkMLnd02JgT8j9h4pTm/jfu62SC/iLF/FrVvKt
   k0V6xNw4Dx2U3V8WrMW+nrD7ji7BY+mTi63ri0cqcyE5iKVZC+koISb3g
   Whk6pA+rLCZKIapF0hsdiiI/HCp6r4dszkHWmXT5W/T9BguyVnrWNs25h
   3JiXwPE07ENLqolTGIrlJDNCWz6ADCRkzECAep7gUdsaYS8FMlmjLMiVT
   w==;
X-IronPort-AV: E=Sophos;i="5.92,289,1650924000"; 
   d="scan'208";a="25181206"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 21 Jul 2022 12:02:25 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 21 Jul 2022 12:02:25 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 21 Jul 2022 12:02:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658397745; x=1689933745;
  h=from:to:cc:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding:subject;
  bh=QdbBhomUhg91kvARkl28EwjZDmO1LWvBHr3r3KudHJk=;
  b=U2o0fGXcmGD+46asOaasJULRZCz3GsGib7X1LI9kceQzOYrtIP1kZNjm
   O0z9IELaGPt6y3PPliFjz1/t0mmvRsXmvyFL6P3LLxLdkN3WF8xa1ccRJ
   sOptTZ6uC9F5FVyf1+mSgD9kJT8V/E6FyhaXq8Dl0H0cBjS28k/YzohLl
   UBJWseYvjasCmudqKe3G+sWirBYOi6zVzIux0Ed4PO4c/UxD/47MP8Y18
   3m5ZtUhlaD3p0Azrx3FYEweWppaZEgsGPZL2Cwkknnufoatz+b1L5onGD
   bM2cfvDEJjIvDHPUopZkVARy6r1wEZWZQNg1mzLbt1C1s449Ux3dfq1U9
   g==;
X-IronPort-AV: E=Sophos;i="5.92,289,1650924000"; 
   d="scan'208";a="25181205"
Subject: Re: [PATCH 12/19] media: i2c: imx290: Fix max gain value
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 21 Jul 2022 12:02:24 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id E9E2C280056;
        Thu, 21 Jul 2022 12:02:24 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
Date:   Thu, 21 Jul 2022 12:02:24 +0200
Message-ID: <3719953.Mh6RI2rZIc@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20220721083540.1525-13-laurent.pinchart@ideasonboard.com>
References: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com> <20220721083540.1525-13-laurent.pinchart@ideasonboard.com>
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

Am Donnerstag, 21. Juli 2022, 10:35:33 CEST schrieb Laurent Pinchart:
> The gain is expressed in multiple of 0.3dB, as a value between 0.0dB
> and 72.0dB. The maximum value is thus 240, not 72.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/imx290.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 3cb024b73ee7..1bd464932432 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -1020,7 +1020,7 @@ static int imx290_probe(struct i2c_client *client)
>  	imx290->ctrls.lock = &imx290->lock;
> 
>  	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> -			  V4L2_CID_GAIN, 0, 72, 1, 0);
> +			  V4L2_CID_GAIN, 0, 240, 1, 0);
> 
>  	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
>  			  V4L2_CID_EXPOSURE, 1, IMX290_VMAX_DEFAULT - 
2, 1,

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>



