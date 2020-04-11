Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 949141A5146
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2020 14:24:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728142AbgDKMYj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 11 Apr 2020 08:24:39 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:58554 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726699AbgDKMYi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 11 Apr 2020 08:24:38 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 4F6152A07CD
Subject: Re: [PATCH v3 3/6] media: staging: rkisp1: cap: change the logic for
 writing to uv swap register
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org
References: <20200408114822.27360-1-dafna.hirschfeld@collabora.com>
 <20200408114822.27360-4-dafna.hirschfeld@collabora.com>
 <20200408121011.GE4881@pendragon.ideasonboard.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <b27c1762-cdd6-a010-0950-ae2eec89ccab@collabora.com>
Date:   Sat, 11 Apr 2020 14:24:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200408121011.GE4881@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 4/8/20 2:10 PM, Laurent Pinchart wrote:
> Hi Dafna,
> 
> Thank you for the patch.
> 
> On Wed, Apr 08, 2020 at 01:48:19PM +0200, Dafna Hirschfeld wrote:
>> The register RKISP1_CIF_MI_XTD_FORMAT_CTRL is currently written
>> with "on" only if the u,v streams need to be swapped. This patch
>> also write to it with "off" if they don't need to be swapped.
>>
>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> 
> I think you can squash this with 1/6 and 2/6.
Hi, as Helen already commented, since it is a combination of
cleanups and bug fixes, I think it is better to keep them separated.

Thanks,
Dafna
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
>> ---
>>   drivers/staging/media/rkisp1/rkisp1-capture.c | 21 ++++++++++---------
>>   1 file changed, 11 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
>> index 5d0e489505f0..4830083c33fd 100644
>> --- a/drivers/staging/media/rkisp1/rkisp1-capture.c
>> +++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
>> @@ -383,12 +383,12 @@ static void rkisp1_mp_config(struct rkisp1_capture *cap)
>>   		     cap->config->mi.cr_size_init);
>>   
>>   	rkisp1_irq_frame_end_enable(cap);
>> -	if (cap->pix.cfg->uv_swap) {
>> -		reg = rkisp1_read(rkisp1, RKISP1_CIF_MI_XTD_FORMAT_CTRL);
>> -
>> +	reg = rkisp1_read(rkisp1, RKISP1_CIF_MI_XTD_FORMAT_CTRL);
>> +	if (cap->pix.cfg->uv_swap)
>>   		reg |= RKISP1_CIF_MI_XTD_FMT_CTRL_MP_CB_CR_SWAP;
>> -		rkisp1_write(rkisp1, reg, RKISP1_CIF_MI_XTD_FORMAT_CTRL);
>> -	}
>> +	else
>> +		reg &= ~RKISP1_CIF_MI_XTD_FMT_CTRL_MP_CB_CR_SWAP;
>> +	rkisp1_write(rkisp1, reg, RKISP1_CIF_MI_XTD_FORMAT_CTRL);
>>   
>>   	rkisp1_mi_config_ctrl(cap);
>>   
>> @@ -406,7 +406,7 @@ static void rkisp1_sp_config(struct rkisp1_capture *cap)
>>   {
>>   	const struct v4l2_pix_format_mplane *pixm = &cap->pix.fmt;
>>   	struct rkisp1_device *rkisp1 = cap->rkisp1;
>> -	u32 mi_ctrl;
>> +	u32 mi_ctrl, reg;
>>   
>>   	rkisp1_write(rkisp1, rkisp1_pixfmt_comp_size(pixm, RKISP1_PLANE_Y),
>>   		     cap->config->mi.y_size_init);
>> @@ -420,12 +420,13 @@ static void rkisp1_sp_config(struct rkisp1_capture *cap)
>>   	rkisp1_write(rkisp1, cap->sp_y_stride, RKISP1_CIF_MI_SP_Y_LLENGTH);
>>   
>>   	rkisp1_irq_frame_end_enable(cap);
>> -	if (cap->pix.cfg->uv_swap) {
>> -		u32 reg = rkisp1_read(rkisp1, RKISP1_CIF_MI_XTD_FORMAT_CTRL);
>>   
>> +	reg = rkisp1_read(rkisp1, RKISP1_CIF_MI_XTD_FORMAT_CTRL);
>> +	if (cap->pix.cfg->uv_swap)
>>   		reg |= RKISP1_CIF_MI_XTD_FMT_CTRL_SP_CB_CR_SWAP;
>> -		rkisp1_write(rkisp1, reg, RKISP1_CIF_MI_XTD_FORMAT_CTRL);
>> -	}
>> +	else
>> +		reg &= ~RKISP1_CIF_MI_XTD_FMT_CTRL_SP_CB_CR_SWAP;
>> +	rkisp1_write(rkisp1, reg, RKISP1_CIF_MI_XTD_FORMAT_CTRL);
>>   
>>   	rkisp1_mi_config_ctrl(cap);
>>   
> 
