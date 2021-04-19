Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D7A9364140
	for <lists+linux-media@lfdr.de>; Mon, 19 Apr 2021 14:07:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239036AbhDSMIG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Apr 2021 08:08:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239027AbhDSMIC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Apr 2021 08:08:02 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDF21C06174A
        for <linux-media@vger.kernel.org>; Mon, 19 Apr 2021 05:07:32 -0700 (PDT)
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 23C82499;
        Mon, 19 Apr 2021 14:07:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618834051;
        bh=eiitpbBWNdThwRflbyWLstUDOyHWQWMzUlK6yy8fcxo=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=JAsQRW+7KsO/yOA9tGY+ITzJ1QkTB2E5mjPVDymDVHr4DCZLCXPr87E3kWGvXLBbN
         m8cVYRwlVgsuXqS79i9HhGwfxtldfCVmLwxwCV6L07Sj/d0u8Twbz9oGgKGExlbZ7N
         IqYBPhfP5VaT/aUkZQMbG9sSXgvPdgVdEHs01Gzw=
Subject: Re: [PATCH 20/28] media: ti-vpe: cal: add vc and datatype fields to
 cal_ctx
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Benoit Parrot <bparrot@ti.com>, Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
References: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
 <20210412113457.328012-21-tomi.valkeinen@ideasonboard.com>
 <YHwu06i2OZsJAa4a@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <e9f827dc-ebc0-f769-b926-8a7e6aa12e60@ideasonboard.com>
Date:   Mon, 19 Apr 2021 15:07:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YHwu06i2OZsJAa4a@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18/04/2021 16:06, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Mon, Apr 12, 2021 at 02:34:49PM +0300, Tomi Valkeinen wrote:
>> In preparation for supporting multiple virtual channels and datatypes,
>> add vc and datatype fields to cal_ctx, initialize them to the currently
>> used values, and use those fields when writing to the register.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/media/platform/ti-vpe/cal.c | 6 ++++--
>>   drivers/media/platform/ti-vpe/cal.h | 2 ++
>>   2 files changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
>> index 0fef892854ef..91d2139adc9b 100644
>> --- a/drivers/media/platform/ti-vpe/cal.c
>> +++ b/drivers/media/platform/ti-vpe/cal.c
>> @@ -335,8 +335,8 @@ static void cal_ctx_csi2_config(struct cal_ctx *ctx)
>>   	 *  0x2A: RAW8   1 pixel  = 1 byte
>>   	 *  0x1E: YUV422 2 pixels = 4 bytes
>>   	 */
>> -	cal_set_field(&val, 0x1, CAL_CSI2_CTX_DT_MASK);
>> -	cal_set_field(&val, 0, CAL_CSI2_CTX_VC_MASK);
>> +	cal_set_field(&val, ctx->datatype, CAL_CSI2_CTX_DT_MASK);
>> +	cal_set_field(&val, ctx->vc, CAL_CSI2_CTX_VC_MASK);
>>   	cal_set_field(&val, ctx->v_fmt.fmt.pix.height, CAL_CSI2_CTX_LINES_MASK);
>>   	cal_set_field(&val, CAL_CSI2_CTX_ATT_PIX, CAL_CSI2_CTX_ATT_MASK);
>>   	cal_set_field(&val, CAL_CSI2_CTX_PACK_MODE_LINE,
>> @@ -926,6 +926,8 @@ static struct cal_ctx *cal_ctx_create(struct cal_dev *cal, int inst)
>>   	ctx->dma_ctx = inst;
>>   	ctx->ppi_ctx = inst;
>>   	ctx->cport = inst;
>> +	ctx->vc = 0;
>> +	ctx->datatype = 1;	/* datatype filter disabled */
> 
> Could you define a macro in cal_regs.h for this ? You can then drop the
> comment.

Yes, good idea. I added:

#define CAL_CSI2_CTX_DT_DISABLED	0
#define CAL_CSI2_CTX_DT_ANY		1

  Tomi
