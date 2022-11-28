Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 495E663AA56
	for <lists+linux-media@lfdr.de>; Mon, 28 Nov 2022 15:03:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230166AbiK1OD0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Nov 2022 09:03:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231614AbiK1ODW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Nov 2022 09:03:22 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7DA3B7EC
        for <linux-media@vger.kernel.org>; Mon, 28 Nov 2022 06:03:21 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1ozejA-00008p-4A; Mon, 28 Nov 2022 15:03:20 +0100
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1ozej9-0004ce-TG; Mon, 28 Nov 2022 15:03:19 +0100
Date:   Mon, 28 Nov 2022 15:03:19 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH] media: i2c: tc358746: make DEFINE_RUNTIME_DEV_PM_OPS
 static
Message-ID: <20221128140319.ovrsa4rlt5fvu4y3@pengutronix.de>
References: <a74a7352-d75e-e202-4a7e-6ffb552455a2@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a74a7352-d75e-e202-4a7e-6ffb552455a2@xs4all.nl>
User-Agent: NeoMutt/20180716
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

thanks for the patch.

On 22-11-28, Hans Verkuil wrote:
> DEFINE_RUNTIME_DEV_PM_OPS should be static.
> 
> This fixes this sparse warning:
> 
> drivers/media/i2c/tc358746.c:1671:1: warning: symbol 'tc358746_pm_ops' was not declared. Should it be static?
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>

> ---
> diff --git a/drivers/media/i2c/tc358746.c b/drivers/media/i2c/tc358746.c
> index 171309c62bb8..d1f552bd81d4 100644
> --- a/drivers/media/i2c/tc358746.c
> +++ b/drivers/media/i2c/tc358746.c
> @@ -1668,8 +1668,8 @@ static int tc358746_resume(struct device *dev)
>  	return err;
>  }
> 
> -DEFINE_RUNTIME_DEV_PM_OPS(tc358746_pm_ops, tc358746_suspend,
> -			  tc358746_resume, NULL);
> +static DEFINE_RUNTIME_DEV_PM_OPS(tc358746_pm_ops, tc358746_suspend,
> +				 tc358746_resume, NULL);
> 
>  static const struct of_device_id __maybe_unused tc358746_of_match[] = {
>  	{ .compatible = "toshiba,tc358746" },
> 
