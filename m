Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84F6C571777
	for <lists+linux-media@lfdr.de>; Tue, 12 Jul 2022 12:39:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230332AbiGLKjx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jul 2022 06:39:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229889AbiGLKjw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jul 2022 06:39:52 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32169286DB
        for <linux-media@vger.kernel.org>; Tue, 12 Jul 2022 03:39:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id B4DA5CE1A71
        for <linux-media@vger.kernel.org>; Tue, 12 Jul 2022 10:39:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0D35C3411C;
        Tue, 12 Jul 2022 10:39:45 +0000 (UTC)
Message-ID: <f0c63d66-74ff-19f0-4d77-f1dad522b1ec@xs4all.nl>
Date:   Tue, 12 Jul 2022 12:39:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] media: venus: venus_helper_get_bufreq(): req is never
 NULL
Content-Language: en-US
From:   Hans Verkuil <hverkuil@xs4all.nl>
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
References: <44d3b224-5ea4-3d18-4aff-0e938fd8503c@xs4all.nl>
In-Reply-To: <44d3b224-5ea4-3d18-4aff-0e938fd8503c@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Please ignore, there is another 'if (req)' later in this function.

I'll post a v2 later today.

	Hans

On 7/12/22 09:56, Hans Verkuil wrote:
> Fix a smatch error:
> 
> drivers/media/platform/qcom/venus/helpers.c: drivers/media/platform/qcom/venus/helpers.c:678 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 674)
> 
> After checking how venus_helper_get_bufreq() is called it is clear that
> req is never NULL, so just drop the check.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
> diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
> index 5c1104379c49..ad8aaebf86be 100644
> --- a/drivers/media/platform/qcom/venus/helpers.c
> +++ b/drivers/media/platform/qcom/venus/helpers.c
> @@ -671,8 +671,7 @@ int venus_helper_get_bufreq(struct venus_inst *inst, u32 type,
>  	unsigned int i;
>  	int ret;
>  
> -	if (req)
> -		memset(req, 0, sizeof(*req));
> +	memset(req, 0, sizeof(*req));
>  
>  	if (type == HFI_BUFFER_OUTPUT || type == HFI_BUFFER_OUTPUT2)
>  		req->count_min = inst->fw_min_cnt;
