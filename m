Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 044A95259E
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2019 09:57:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729096AbfFYH5n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jun 2019 03:57:43 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:47941 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726663AbfFYH5m (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jun 2019 03:57:42 -0400
Received: from [IPv6:2001:420:44c1:2579:b032:593c:25fc:ff9b] ([IPv6:2001:420:44c1:2579:b032:593c:25fc:ff9b])
        by smtp-cloud9.xs4all.net with ESMTPA
        id fgKchOG7LSfvXfgKghG8hZ; Tue, 25 Jun 2019 09:57:40 +0200
Subject: Re: [PATCH][next] media: vivid: fix potential integer overflow on
 left shift
To:     wharms@bfs.de, Colin King <colin.king@canonical.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190624215804.12122-1-colin.king@canonical.com>
 <5D11D1BB.5070701@bfs.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <14e870cf-27db-a4de-b142-dd5703eea8d4@xs4all.nl>
Date:   Tue, 25 Jun 2019 09:57:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <5D11D1BB.5070701@bfs.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfDytbCQAeAYD5hN2QmXE+0fD80IMzTewHc4KrIMOMFB5OWekuD/MixRDirA5ILtz8ooHraupn9dFYqk8d6n82ddjM9JveJJUr2VvkbeKMGG4s3Ebj9Yg
 FSpPCJz7Wxy19eHkXMQwkMcvEljGqFWzKlaYZfw3imuES7tR8v4Us7GSV7nqS3891JMMCnlM1jC/gnfUG817euwizpVRYKT66XHABBMkqv2x+4WpYPAI+qS7
 tDUA35QM5R/FbuqXjIfErNnzGwBSQbUTzKETcGWtyx2gmQbEHY5jHKDILeJWJQTvP+wFiVsIMimNhm21no88ejr27lnJ74ANow/c1+u+9A7Kayvv0mpHNPNE
 393Zlgu7wJ6USOsZOvbtH/pkZfmyEihG15qWuwGNZx2bbhA5sjqZUi33k4X9cKJj2IBlRsivBppZtg1/LbMYS8MAOM8+8Jpt3ONWV94bLq5SI/afJps=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/25/19 9:48 AM, walter harms wrote:
> 
> 
> Am 24.06.2019 23:58, schrieb Colin King:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> There is a potential integer overflow when int 2 is left shifted
>> as this is evaluated using 32 bit arithmetic but is being used in
>> a context that expects an expression of type s64.  Fix this by
>> shifting 2ULL to avoid a 32 bit overflow.
>>
>> Addresses-Coverity: ("Unintentional integer overflow")
>> Fixes: 8a99e9faa131 ("media: vivid: add HDMI (dis)connect RX emulation")
>> Fixes: 79a792dafac6 ("media: vivid: add HDMI (dis)connect TX emulation")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  drivers/media/platform/vivid/vivid-ctrls.c | 16 ++++++++--------
>>  1 file changed, 8 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/media/platform/vivid/vivid-ctrls.c b/drivers/media/platform/vivid/vivid-ctrls.c
>> index 3e916c8befb7..8f340cfd6993 100644
>> --- a/drivers/media/platform/vivid/vivid-ctrls.c
>> +++ b/drivers/media/platform/vivid/vivid-ctrls.c
>> @@ -1634,8 +1634,8 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
>>  			0, V4L2_DV_RGB_RANGE_AUTO);
>>  		dev->ctrl_rx_power_present = v4l2_ctrl_new_std(hdl_vid_cap,
>>  			NULL, V4L2_CID_DV_RX_POWER_PRESENT, 0,
>> -			(2 << (dev->num_hdmi_inputs - 1)) - 1, 0,
>> -			(2 << (dev->num_hdmi_inputs - 1)) - 1);
>> +			(2ULL << (dev->num_hdmi_inputs - 1)) - 1, 0,
>> +			(2ULL << (dev->num_hdmi_inputs - 1)) - 1);
>>  
>>  	}
>>  	if (dev->num_hdmi_outputs) {
>> @@ -1653,16 +1653,16 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
>>  			&vivid_ctrl_display_present, NULL);
>>  		dev->ctrl_tx_hotplug = v4l2_ctrl_new_std(hdl_vid_out,
>>  			NULL, V4L2_CID_DV_TX_HOTPLUG, 0,
>> -			(2 << (dev->num_hdmi_outputs - 1)) - 1, 0,
>> -			(2 << (dev->num_hdmi_outputs - 1)) - 1);
>> +			(2ULL << (dev->num_hdmi_outputs - 1)) - 1, 0,
>> +			(2ULL << (dev->num_hdmi_outputs - 1)) - 1);
>>  		dev->ctrl_tx_rxsense = v4l2_ctrl_new_std(hdl_vid_out,
>>  			NULL, V4L2_CID_DV_TX_RXSENSE, 0,
>> -			(2 << (dev->num_hdmi_outputs - 1)) - 1, 0,
>> -			(2 << (dev->num_hdmi_outputs - 1)) - 1);
>> +			(2ULL << (dev->num_hdmi_outputs - 1)) - 1, 0,
>> +			(2ULL << (dev->num_hdmi_outputs - 1)) - 1);
>>  		dev->ctrl_tx_edid_present = v4l2_ctrl_new_std(hdl_vid_out,
>>  			NULL, V4L2_CID_DV_TX_EDID_PRESENT, 0,
>> -			(2 << (dev->num_hdmi_outputs - 1)) - 1, 0,
>> -			(2 << (dev->num_hdmi_outputs - 1)) - 1);
>> +			(2ULL << (dev->num_hdmi_outputs - 1)) - 1, 0,
>> +			(2ULL << (dev->num_hdmi_outputs - 1)) - 1);
>>  	}
>>  	if ((dev->has_vid_cap && dev->has_vid_out) ||
>>  	    (dev->has_vbi_cap && dev->has_vbi_out))
> 
> 
> To make this more readable for humans, it could help to store
>  (2ULL << (dev->num_hdmi_outputs - 1)) - 1 in an intermediate.
> like:
> s64 hdmi=(2ULL << (dev->num_hdmi_outputs - 1)) - 1;
> 
>   		dev->ctrl_tx_edid_present = v4l2_ctrl_new_std(hdl_vid_out,
>   			NULL, V4L2_CID_DV_TX_EDID_PRESENT, 0,
> 			hdmi, 0,hdmi);
> 
> 
> just my 2 cents,

I agree. Call it hdmi_output/input_mask, that is a good name for it.

Regards,

	Hans
