Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DC8757C88E
	for <lists+linux-media@lfdr.de>; Thu, 21 Jul 2022 12:06:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233067AbiGUKGf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jul 2022 06:06:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232992AbiGUKGd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jul 2022 06:06:33 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82E716A9C6
        for <linux-media@vger.kernel.org>; Thu, 21 Jul 2022 03:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658397992; x=1689933992;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SFTORVkUVd8kfUN5vgRa5VdKElEjWipreE4G2Dm7mwA=;
  b=BI4qX/8ZYN4VlyjdG5sHhjqlf8/n+b27M8ZCZpLEAsVtKKmye363GtPD
   OHpi4GKQP/NFk81eXvl5HoPNkaqa/WR8DCfY2Do80wq043Mq+FASFBRKA
   wfirLafiJWLB1Tr1ra7e0JDJ+o86qOFtbdNK3Z9koXP9AmYTJ3a/IYINr
   I9yp11ZWZM8hbuFuoQHuFW56XUwywnGG063bm+xeDNuilzV04lMxedh0K
   Ktm6ed619KyAhPaGO4JXyfgZaiK2fmOhW0/9XPdsyPyRx0xnmAgnD6PMU
   6gp1harBME9ABqLmFGe2H8Uh0ped7nhws82AKFFR8kW3aNk0Vveza1ab8
   g==;
X-IronPort-AV: E=Sophos;i="5.92,289,1650924000"; 
   d="scan'208";a="25181377"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 21 Jul 2022 12:06:31 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 21 Jul 2022 12:06:31 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 21 Jul 2022 12:06:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658397991; x=1689933991;
  h=from:to:cc:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding:subject;
  bh=SFTORVkUVd8kfUN5vgRa5VdKElEjWipreE4G2Dm7mwA=;
  b=jqFWwd0vd7Rf20w9R307nFG1K42rlOJ7acHHQ6GI7WtTbEIL9UVG8pkF
   Tv3UkZpSMI94JfwbGU3t+fWiANw/oIP8cYaAUH+jMBRsNqDJN/ZohSFHd
   Gx5B4e9d9T0kJcf93rqMM72mDJw7ccAm/47qTOFnjBE7QGOVtL84b4So7
   h0w0X2GiGy6iBOkiU+kOipW+RgWKpPZTPiBMXdvbQ0EUOgxu5+iL/BfRH
   BxEsLkUEk5RstywIn4Dmroripo/GeDYn5L8878aObTTrtT3HoBTRFLoER
   CZ7DRlPpvoOnRe3zHZuLulZEUFhTS5bqaH7nWbbVsHXrVNKuoJtM1O3YA
   A==;
X-IronPort-AV: E=Sophos;i="5.92,289,1650924000"; 
   d="scan'208";a="25181376"
Subject: Re: [PATCH 15/19] media: i2c: imx290: Create controls for fwnode properties
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 21 Jul 2022 12:06:30 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id DD2CD280056;
        Thu, 21 Jul 2022 12:06:30 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
Date:   Thu, 21 Jul 2022 12:06:30 +0200
Message-ID: <3722655.Icojqenx9y@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20220721083540.1525-16-laurent.pinchart@ideasonboard.com>
References: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com> <20220721083540.1525-16-laurent.pinchart@ideasonboard.com>
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

Am Donnerstag, 21. Juli 2022, 10:35:36 CEST schrieb Laurent Pinchart:
> Create the V4L2_CID_ORIENTATION and V4L2_CID_ROTATION controls to
> expose the corresponding fwnode properties.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/imx290.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 7190399f4111..78772c6327a2 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -896,10 +896,15 @@ static const struct media_entity_operations
> imx290_subdev_entity_ops = {
> 
>  static int imx290_ctrl_init(struct imx290 *imx290)
>  {
> +	struct v4l2_fwnode_device_properties props;
>  	unsigned int blank;
>  	int ret;
> 
> -	v4l2_ctrl_handler_init(&imx290->ctrls, 7);
> +	ret = v4l2_fwnode_device_parse(imx290->dev, &props);
> +	if (ret < 0)
> +		return ret;
> +
> +	v4l2_ctrl_handler_init(&imx290->ctrls, 9);
>  	imx290->ctrls.lock = &imx290->lock;
> 
>  	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> @@ -947,6 +952,9 @@ static int imx290_ctrl_init(struct imx290 *imx290)
>  	if (imx290->vblank)
>  		imx290->vblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> 
> +	v4l2_ctrl_new_fwnode_properties(&imx290->ctrls, &imx290_ctrl_ops,
> +					&props);
> +
>  	imx290->sd.ctrl_handler = &imx290->ctrls;
> 
>  	if (imx290->ctrls.error) {

Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>



