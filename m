Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C49347C8050
	for <lists+linux-media@lfdr.de>; Fri, 13 Oct 2023 10:32:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230073AbjJMIcf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Oct 2023 04:32:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230122AbjJMIcd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Oct 2023 04:32:33 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF23CE0
        for <linux-media@vger.kernel.org>; Fri, 13 Oct 2023 01:32:30 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08B1CC433C7;
        Fri, 13 Oct 2023 08:32:29 +0000 (UTC)
Message-ID: <27b00133-040f-496b-b597-85e1e42e0e9a@xs4all.nl>
Date:   Fri, 13 Oct 2023 10:32:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] media: dvb-usb-v2: af9035: fix missing unlock
Content-Language: en-US, nl
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>
References: <cover.1696586632.git.hverkuil-cisco@xs4all.nl>
 <cae6602b2c8789239a3d302b3ffc21f5e09d1189.1696586632.git.hverkuil-cisco@xs4all.nl>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <cae6602b2c8789239a3d302b3ffc21f5e09d1189.1696586632.git.hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 06/10/2023 12:08, Hans Verkuil wrote:
> Instead of returning an error, goto the mutex unlock at
> the end of the function.
> 
> Fixes smatch warning:
> 
> drivers/media/usb/dvb-usb-v2/af9035.c:467 af9035_i2c_master_xfer() warn: inconsistent returns '&d->i2c_mutex'.
>   Locked on  : 326,387
>   Unlocked on: 465,467
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Fixes: 7bf744f2de0a ("media: dvb-usb-v2: af9035: Fix null-ptr-deref in af9035_i2c_master_xfer")

Regards,

	Hans

> CC: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  drivers/media/usb/dvb-usb-v2/af9035.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/usb/dvb-usb-v2/af9035.c b/drivers/media/usb/dvb-usb-v2/af9035.c
> index 33a2aa8907e6..4eb7dd4599b7 100644
> --- a/drivers/media/usb/dvb-usb-v2/af9035.c
> +++ b/drivers/media/usb/dvb-usb-v2/af9035.c
> @@ -322,8 +322,10 @@ static int af9035_i2c_master_xfer(struct i2c_adapter *adap,
>  			ret = -EOPNOTSUPP;
>  		} else if ((msg[0].addr == state->af9033_i2c_addr[0]) ||
>  			   (msg[0].addr == state->af9033_i2c_addr[1])) {
> -			if (msg[0].len < 3 || msg[1].len < 1)
> -				return -EOPNOTSUPP;
> +			if (msg[0].len < 3 || msg[1].len < 1) {
> +				ret = -EOPNOTSUPP;
> +				goto unlock;
> +			}
>  			/* demod access via firmware interface */
>  			u32 reg = msg[0].buf[0] << 16 | msg[0].buf[1] << 8 |
>  					msg[0].buf[2];
> @@ -383,8 +385,10 @@ static int af9035_i2c_master_xfer(struct i2c_adapter *adap,
>  			ret = -EOPNOTSUPP;
>  		} else if ((msg[0].addr == state->af9033_i2c_addr[0]) ||
>  			   (msg[0].addr == state->af9033_i2c_addr[1])) {
> -			if (msg[0].len < 3)
> -				return -EOPNOTSUPP;
> +			if (msg[0].len < 3) {
> +				ret = -EOPNOTSUPP;
> +				goto unlock;
> +			}
>  			/* demod access via firmware interface */
>  			u32 reg = msg[0].buf[0] << 16 | msg[0].buf[1] << 8 |
>  					msg[0].buf[2];
> @@ -459,6 +463,7 @@ static int af9035_i2c_master_xfer(struct i2c_adapter *adap,
>  		ret = -EOPNOTSUPP;
>  	}
>  
> +unlock:
>  	mutex_unlock(&d->i2c_mutex);
>  
>  	if (ret < 0)

