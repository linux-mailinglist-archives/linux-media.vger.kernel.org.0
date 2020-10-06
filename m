Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A32C2284D92
	for <lists+linux-media@lfdr.de>; Tue,  6 Oct 2020 16:24:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726235AbgJFOYL convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 6 Oct 2020 10:24:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725939AbgJFOYK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Oct 2020 10:24:10 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E09AAC061755
        for <linux-media@vger.kernel.org>; Tue,  6 Oct 2020 07:24:09 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kPnsu-0005UY-IM; Tue, 06 Oct 2020 16:24:08 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kPnsu-0008Fb-86; Tue, 06 Oct 2020 16:24:08 +0200
Message-ID: <d9aaf2d9b9de85d6c3d731fa9b5c12cde5c10d2a.camel@pengutronix.de>
Subject: Re: [PATCH 4/6] coda: Clarify interrupt registered name
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, cphealy@gmail.com,
        Benjamin.Bara@skidata.com, l.stach@pengutronix.de,
        kernel@collabora.com
Date:   Tue, 06 Oct 2020 16:24:08 +0200
In-Reply-To: <20201006104414.67984-5-ezequiel@collabora.com>
References: <20201006104414.67984-1-ezequiel@collabora.com>
         <20201006104414.67984-5-ezequiel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2020-10-06 at 07:44 -0300, Ezequiel Garcia wrote:
> Make interrupt naming more consistent by using a common
> pattern for video and jpeg interrupts.
> 
> With this commit, interrupts are shown as:
> 
> 29:          0          0       GPC  12 Level     coda-video
> 30:          0          0       GPC   3 Level     coda-jpeg
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  drivers/media/platform/coda/coda-common.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
> index a72ea4bb37d7..487dd653b24a 100644
> --- a/drivers/media/platform/coda/coda-common.c
> +++ b/drivers/media/platform/coda/coda-common.c
> @@ -3153,7 +3153,7 @@ static int coda_probe(struct platform_device *pdev)
>  		return irq;
>  
>  	ret = devm_request_irq(&pdev->dev, irq, coda_irq_handler, 0,
> -			       dev_name(&pdev->dev), dev);
> +			       CODA_NAME "-video", dev);
>  	if (ret < 0) {
>  		dev_err(&pdev->dev, "failed to request irq: %d\n", ret);
>  		return ret;
> @@ -3167,7 +3167,7 @@ static int coda_probe(struct platform_device *pdev)
>  
>  		ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
>  						coda9_jpeg_irq_handler,
> -						IRQF_ONESHOT, CODA_NAME " jpeg",
> +						IRQF_ONESHOT, CODA_NAME "-jpeg",
>  						dev);
>  		if (ret < 0) {
>  			dev_err(&pdev->dev, "failed to request jpeg irq\n");

I don't care very much for this, but I don't mind either.

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
