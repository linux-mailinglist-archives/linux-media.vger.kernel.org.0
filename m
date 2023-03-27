Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6C9E6C9CCF
	for <lists+linux-media@lfdr.de>; Mon, 27 Mar 2023 09:52:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232071AbjC0Hwi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Mar 2023 03:52:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232389AbjC0Hwg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Mar 2023 03:52:36 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF9D0C7
        for <linux-media@vger.kernel.org>; Mon, 27 Mar 2023 00:52:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8092DB80E9E
        for <linux-media@vger.kernel.org>; Mon, 27 Mar 2023 07:52:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 516BDC433EF;
        Mon, 27 Mar 2023 07:52:30 +0000 (UTC)
Message-ID: <b4bf6e40-3b76-6f48-6f3d-c47657cea2f1@xs4all.nl>
Date:   Mon, 27 Mar 2023 09:52:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 002/117] media: cros-ec-cec: Don't exit early in .remove()
 callback
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Benson Leung <bleung@chromium.org>,
        Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
        Scott Chao <scott_chao@wistron.corp-partner.google.com>,
        Rory Liu <hellojacky0226@hotmail.com>
Cc:     Guenter Roeck <groeck@chromium.org>, linux-media@vger.kernel.org,
        chrome-platform@lists.linux.dev, kernel@pengutronix.de
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
 <20230326143224.572654-5-u.kleine-koenig@pengutronix.de>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230326143224.572654-5-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Just ignore this reply: for some reason this patch only ended up in my
private mailbox, but not on linux-media (and therefor also not in
patchwork). This should hopefully cause patchwork to pick it up.

Regards,

	Hans

On 26/03/2023 16:30, Uwe Kleine-König wrote:
> Exiting early in remove without releasing all acquired resources yields
> leaks. Note that e.g. memory allocated with devm_zalloc() is freed after
> .remove() returns, even if the return code was negative.
> 
> While blocking_notifier_chain_unregister() won't fail and so the
> change is somewhat cosmetic, platform driver's .remove callbacks are
> about to be converted to return void. To prepare that, keep the error
> message but don't return early.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
> index 6ebedc71d67d..960432230bbf 100644
> --- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
> +++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
> @@ -332,14 +332,16 @@ static int cros_ec_cec_remove(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	int ret;
>  
> +	/*
> +	 * blocking_notifier_chain_unregister() only fails if the notifier isn't
> +	 * in the list. We know it was added to it by .probe(), so there should
> +	 * be no need for error checking. Be cautious and still check.
> +	 */
>  	ret = blocking_notifier_chain_unregister(
>  			&cros_ec_cec->cros_ec->event_notifier,
>  			&cros_ec_cec->notifier);
> -
> -	if (ret) {
> +	if (ret)
>  		dev_err(dev, "failed to unregister notifier\n");
> -		return ret;
> -	}
>  
>  	cec_notifier_cec_adap_unregister(cros_ec_cec->notify,
>  					 cros_ec_cec->adap);

