Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DD6219F47A
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 13:21:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726873AbgDFLU6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 07:20:58 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:52874 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727193AbgDFLU5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 07:20:57 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id E6A8928EA9F
Subject: Re: [PATCH v2 2/5] media: staging: rkisp1: cap: fix value written to
 uv swap register in selfpath
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, linux-rockchip@lists.infradead.org
References: <20200402190419.15155-1-dafna.hirschfeld@collabora.com>
 <20200402190419.15155-3-dafna.hirschfeld@collabora.com>
 <20200405181044.GO5846@pendragon.ideasonboard.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <8117add9-3780-3913-2b4f-3585a3c738e9@collabora.com>
Date:   Mon, 6 Apr 2020 13:20:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200405181044.GO5846@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 4/5/20 8:10 PM, Laurent Pinchart wrote:
> Hi Dafna,
> 
> Thank you for the patch.
> 
> On Thu, Apr 02, 2020 at 09:04:16PM +0200, Dafna Hirschfeld wrote:
>> The value RKISP1_CIF_MI_XTD_FMT_CTRL_SP_CB_CR_SWAP should be
>> set to the register instead of masking with ~BIT(1)
>>
>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>> ---
>>   drivers/staging/media/rkisp1/rkisp1-capture.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
>> index 5700d7be2819..84a3cf565106 100644
>> --- a/drivers/staging/media/rkisp1/rkisp1-capture.c
>> +++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
>> @@ -469,8 +469,8 @@ static void rkisp1_sp_config(struct rkisp1_capture *cap)
>>   	if (cap->pix.cfg->uv_swap) {
>>   		u32 reg = rkisp1_read(rkisp1, RKISP1_CIF_MI_XTD_FORMAT_CTRL);
>>   
>> -		rkisp1_write(rkisp1, reg & ~BIT(1),
>> -			     RKISP1_CIF_MI_XTD_FORMAT_CTRL);
>> +		reg = reg | RKISP1_CIF_MI_XTD_FMT_CTRL_SP_CB_CR_SWAP;
>> +		rkisp1_write(rkisp1, reg, RKISP1_CIF_MI_XTD_FORMAT_CTRL);
> 
> This indeed simplifies the code, but I think the logic is wrong in the
> first place. Shouldn't this be
> 
> 	reg = rkisp1_read(rkisp1, RKISP1_CIF_MI_XTD_FORMAT_CTRL);
> 	if (cap->pix.cfg->uv_swap)
> 		reg |= RKISP1_CIF_MI_XTD_FMT_CTRL_SP_CB_CR_SWAP;
> 	else
> 		reg &= ~RKISP1_CIF_MI_XTD_FMT_CTRL_SP_CB_CR_SWAP;
> 	rkisp1_write(rkisp1, reg, RKISP1_CIF_MI_XTD_FORMAT_CTRL);
> 
> ? Same for patch 1/5.
Right, I'll send v3.

Thanks,
Dafna
> 
>>   	}
>>   
>>   	rkisp1_mi_config_ctrl(cap);
> 
