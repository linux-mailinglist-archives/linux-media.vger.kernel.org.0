Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A965A595D56
	for <lists+linux-media@lfdr.de>; Tue, 16 Aug 2022 15:29:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235746AbiHPN3A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Aug 2022 09:29:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235651AbiHPN27 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Aug 2022 09:28:59 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22D46B5E43
        for <linux-media@vger.kernel.org>; Tue, 16 Aug 2022 06:28:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D0C05B819C9
        for <linux-media@vger.kernel.org>; Tue, 16 Aug 2022 13:28:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B92EDC433C1;
        Tue, 16 Aug 2022 13:28:54 +0000 (UTC)
Message-ID: <9727f813-09ca-96e9-a86a-ba69a7c8d62d@xs4all.nl>
Date:   Tue, 16 Aug 2022 15:28:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] fixup! media: dw100: Add i.MX8MP dw100 dewarper driver
Content-Language: en-US
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        laurent.pinchart@ideasonboard.com
Cc:     linux-media@vger.kernel.org
References: <20220804122302.2218906-1-xavier.roumegue@oss.nxp.com>
 <27ba23fa3d060149128c4ba5a880bef43a9df193.camel@ndufresne.ca>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <27ba23fa3d060149128c4ba5a880bef43a9df193.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 16/08/2022 15:26, Nicolas Dufresne wrote:
> Le jeudi 04 août 2022 à 14:23 +0200, Xavier Roumegue a écrit :
> 
> Perhaps you meant to use a Fixes tag rather then git --fixup feature here ?

I squashed this in the patch adding this driver. No need for a fixes tag.

PR is pending.

Hans

> 
>> Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
>> ---
>>  drivers/media/platform/nxp/dw100/dw100.c | 4 +---
>>  1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/platform/nxp/dw100/dw100.c b/drivers/media/platform/nxp/dw100/dw100.c
>> index 651622f8ac8c..94518f0e486b 100644
>> --- a/drivers/media/platform/nxp/dw100/dw100.c
>> +++ b/drivers/media/platform/nxp/dw100/dw100.c
>> @@ -379,14 +379,12 @@ static void dw100_ctrl_dewarping_map_init(const struct v4l2_ctrl *ctrl,
>>  	struct dw100_ctx *ctx =
>>  		container_of(ctrl->handler, struct dw100_ctx, hdl);
>>  
>> -	u32 sw, sh, dw, dh, mw, mh, idx;
>> +	u32 sw, sh, mw, mh, idx;
>>  	u16 qx, qy, qdx, qdy, qsh, qsw;
>>  	u32 *map = ctrl->p_cur.p_u32;
>>  
>>  	sw = ctx->q_data[DW100_QUEUE_SRC].pix_fmt.width;
>> -	dw = ctx->q_data[DW100_QUEUE_DST].pix_fmt.width;
>>  	sh = ctx->q_data[DW100_QUEUE_SRC].pix_fmt.height;
>> -	dh = ctx->q_data[DW100_QUEUE_DST].pix_fmt.height;
>>  
>>  	mw = ctrl->dims[0];
>>  	mh = ctrl->dims[1];
> 
