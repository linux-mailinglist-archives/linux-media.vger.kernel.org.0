Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63124758D98
	for <lists+linux-media@lfdr.de>; Wed, 19 Jul 2023 08:17:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230450AbjGSGRB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Jul 2023 02:17:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230461AbjGSGQ7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Jul 2023 02:16:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A1D8268D
        for <linux-media@vger.kernel.org>; Tue, 18 Jul 2023 23:16:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 27C1F602F1
        for <linux-media@vger.kernel.org>; Wed, 19 Jul 2023 06:16:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1409C433C8;
        Wed, 19 Jul 2023 06:16:38 +0000 (UTC)
Message-ID: <6fc14d76-a0c6-50a6-e5ea-5099eab4fa9c@xs4all.nl>
Date:   Wed, 19 Jul 2023 08:16:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/1] media:dvb: check the return value of mb86a16_read()
Content-Language: en-US
To:     Yuanjun Gong <ruc_gongyuanjun@163.com>,
        Antti Palosaari <crope@iki.fi>, linux-media@vger.kernel.org
References: <20230715094530.36820-1-ruc_gongyuanjun@163.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20230715094530.36820-1-ruc_gongyuanjun@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Yuanjun Gong,

Please add the name of the driver to the subject line:

"media: dvb: mb86a16: check the return value of mb86a16_read()"

On 15/07/2023 11:45, Yuanjun Gong wrote:
> return an error code if mb86a16_read() gets an unexpected return
> value.
> 
> Signed-off-by: Yuanjun Gong <ruc_gongyuanjun@163.com>
> ---
>  drivers/media/dvb-frontends/mb86a16.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/dvb-frontends/mb86a16.c b/drivers/media/dvb-frontends/mb86a16.c
> index d3e29937cf4c..f04188a72e7a 100644
> --- a/drivers/media/dvb-frontends/mb86a16.c
> +++ b/drivers/media/dvb-frontends/mb86a16.c
> @@ -1487,9 +1487,12 @@ static int mb86a16_set_fe(struct mb86a16_state *state)
>  		}
>  	}
>  
> -	mb86a16_read(state, 0x15, &agcval);
> -	mb86a16_read(state, 0x26, &cnmval);
> -	dprintk(verbose, MB86A16_INFO, 1, "AGC = %02x CNM = %02x", agcval, cnmval);
> +	if (mb86a16_read(state, 0x15, &agcval) != 2 ||	mb86a16_read(state, 0x26, &cnmval) != 2){
> +		dprintk(verbose, MB86A16_ERROR, 1, "I2C transfer error");
> +		ret = -EREMOTEIO;
> +	}
> +	else
> +		dprintk(verbose, MB86A16_INFO, 1, "AGC = %02x CNM = %02x", agcval, cnmval);

And also run 'checkpatch.pl --strict' over your patch and fix the issues it finds.

Thank you!

	Hans

>  
>  	return ret;
>  }

