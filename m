Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E67BD57C776
	for <lists+linux-media@lfdr.de>; Thu, 21 Jul 2022 11:22:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229723AbiGUJWf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jul 2022 05:22:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232883AbiGUJWe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jul 2022 05:22:34 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02EDD7F51C
        for <linux-media@vger.kernel.org>; Thu, 21 Jul 2022 02:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658395353; x=1689931353;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IY8jr052f7IyQuy1AlMD6TjFTO98Hm5qRyW9Ebnr77s=;
  b=IAntzlb//6R/FsBPykMaxyD47zA15sR6mj0YiAvvi5+i/F/W16e6WiNT
   iZB0qOaA5v2XbTLIRzGNRe5xVTFQpo7a4gi1Pa3Dr1IcgG7j6CMH+DwxW
   Uv/SZTJ5ZNN/JM4Zesr7n4U0hUCb3c2M9L0rMh+4Q8poBNXaziitMizkk
   5Hg8t3k9zC+h2zvG3miNh4yBo+YlOuSBKPiCeNL9yY60YuFzS57Did8Sz
   G8bofvVzxbOP3XF15WnmnMOiYP5QBCwLjhOxG8uv0rqj46iBe/lTJX3eY
   CuA+pKa/swrYIpkzaMexHaaK2GGPCfTJ2to+Q5sOAL+oOCiwAu7tH68jY
   w==;
X-IronPort-AV: E=Sophos;i="5.92,289,1650924000"; 
   d="scan'208";a="25179702"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 21 Jul 2022 11:22:31 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 21 Jul 2022 11:22:31 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 21 Jul 2022 11:22:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658395351; x=1689931351;
  h=from:to:cc:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding:subject;
  bh=IY8jr052f7IyQuy1AlMD6TjFTO98Hm5qRyW9Ebnr77s=;
  b=fOllndYpwVVM0Ph9f3NANZThy1T7VDWTyFhbAVFDX1FZvE9vifIRDY4u
   JdIN+B09Ch7f/1uKX0cNO0Toz+a6qPzCkLY1g7Rn0DVcNkqcTvphvGYn2
   Idul9lV5XaizNoP6Pw90mTgN1nBuOJiVTC06+gZszFgL71nuVhTtt7FI2
   g3je2dm+/YxSb7yAbZXjc+8fUjkLEZNHCmDGYREiOkAm2ehL99WprBgSa
   vMgkOdpEPMeRMu5J4H1OMt02MTWJs4JjOZ0oI05nZ5HYWSVcROZt8wuFC
   LutMDW2tqj2uxh4aW6p3D1n1Vs002ztjXyTogWD/93oiv438ODBsOuROd
   w==;
X-IronPort-AV: E=Sophos;i="5.92,289,1650924000"; 
   d="scan'208";a="25179701"
Subject: Re: [PATCH 01/19] media: i2c: imx290: Use device lock for the control handler
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 21 Jul 2022 11:22:31 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 53247280056;
        Thu, 21 Jul 2022 11:22:31 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
Date:   Thu, 21 Jul 2022 11:22:28 +0200
Message-ID: <3425062.tdWV9SEqCh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20220721083540.1525-2-laurent.pinchart@ideasonboard.com>
References: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com> <20220721083540.1525-2-laurent.pinchart@ideasonboard.com>
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

Am Donnerstag, 21. Juli 2022, 10:35:22 CEST schrieb Laurent Pinchart:
> The link frequency and pixel rate controls are set without holding the
> control handler lock, resulting in kernel warnings. As the value of
> those controls depend on the format, the simplest fix is to use the
> device lock for the control handler.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/imx290.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 99f2a50d39a4..d97a5fb1d501 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -1043,6 +1043,7 @@ static int imx290_probe(struct i2c_client *client)
>  	imx290_entity_init_cfg(&imx290->sd, NULL);
> 
>  	v4l2_ctrl_handler_init(&imx290->ctrls, 4);
> +	imx290->ctrls.lock = &imx290->lock;
> 
>  	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
>  			  V4L2_CID_GAIN, 0, 72, 1, 0);

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>



