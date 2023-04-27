Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E5D86F0D8C
	for <lists+linux-media@lfdr.de>; Thu, 27 Apr 2023 23:03:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344037AbjD0VD5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Apr 2023 17:03:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229790AbjD0VD4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Apr 2023 17:03:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C7041FF3
        for <linux-media@vger.kernel.org>; Thu, 27 Apr 2023 14:03:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0791563BFC
        for <linux-media@vger.kernel.org>; Thu, 27 Apr 2023 21:03:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA46FC433D2;
        Thu, 27 Apr 2023 21:03:53 +0000 (UTC)
Message-ID: <66ad467b-0e5a-fb19-950d-f9cf019a23db@xs4all.nl>
Date:   Thu, 27 Apr 2023 23:03:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] vivid: ignore failed messages in vivid_received()
Content-Language: en-US
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Zheng Zhang <zheng.zhang@email.ucr.edu>
References: <a4a1c1dd-56ae-e949-2504-e8c2e2829a05@xs4all.nl>
In-Reply-To: <a4a1c1dd-56ae-e949-2504-e8c2e2829a05@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-8.1 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 27/04/2023 22:49, Hans Verkuil wrote:
> If a non-blocking transmit failed (either the transmit itself failed,
> or the reply (if requested) never arrived, then the received callback
> is still called since in some cases a driver might need to know about
> that.
> 
> The vivid_received function didn't check this and instead could try to
> transmit a reply, which can lead to a deadlock.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
> diff --git a/drivers/media/test-drivers/vivid/vivid-cec.c b/drivers/media/test-drivers/vivid/vivid-cec.c
> index 1f7469ff04d5..8399298d54ad 100644
> --- a/drivers/media/test-drivers/vivid/vivid-cec.c
> +++ b/drivers/media/test-drivers/vivid/vivid-cec.c
> @@ -269,6 +269,9 @@ static int vivid_received(struct cec_adapter *adap, struct cec_msg *msg)
>  	u8 disp_ctl;
>  	char osd[14];
> 
> +	if (!cec_msg_status_is_ok(msg))
> +		return 0;
> +
>  	if (cec_msg_is_broadcast(msg))
>  		dest = adap->log_addrs.log_addr[0];
>  	cec_msg_init(&reply, dest, cec_msg_initiator(msg));

Disregard this, this is not the right approach.

Regards,

	Hans
