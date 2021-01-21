Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D0482FF1BA
	for <lists+linux-media@lfdr.de>; Thu, 21 Jan 2021 18:24:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387703AbhAURXR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jan 2021 12:23:17 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:38580 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732109AbhAURXC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jan 2021 12:23:02 -0500
Received: from [IPv6:2804:214:8590:5e63:127e:7b33:24d:fd7d] (unknown [IPv6:2804:214:8590:5e63:127e:7b33:24d:fd7d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id A06021F45F74;
        Thu, 21 Jan 2021 17:22:14 +0000 (GMT)
Subject: Re: [PATCH v8 4/6] media: rockchip: rkisp1: reduce number of
 histogram grid elements in uapi
To:     =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        hverkuil@xs4all.nl, sakari.ailus@linux.intel.com
Cc:     ezequiel@collabora.com, kernel@collabora.com, dafna3@gmail.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
References: <20210121144407.9045-1-dafna.hirschfeld@collabora.com>
 <20210121144407.9045-5-dafna.hirschfeld@collabora.com>
 <c9d0ac1b-2cb7-a5b6-aa97-1510c44404c1@collabora.com>
 <2974513.zE8UqtGg2D@diego>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <f1d04d96-37b2-c054-0a89-c5f00a7ff723@collabora.com>
Date:   Thu, 21 Jan 2021 14:22:10 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <2974513.zE8UqtGg2D@diego>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 1/21/21 2:12 PM, Heiko Stübner wrote:
> Hi Helen,
> 
> Am Donnerstag, 21. Januar 2021, 18:04:49 CET schrieb Helen Koike:
>> Hi Dafna,
>>
>> On 1/21/21 11:44 AM, Dafna Hirschfeld wrote:
>>> From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
>>>
>>> The uapi right now specifies an array size of 28 but the actual number
>>> of elements is only 25 with the last 3 being unused.
>>>
>>> Reduce the array size to the correct number of elements and change
>>> the params code to iterate the array 25 times.
>>>
>>> Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
>>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>>> ---
>>>  drivers/media/platform/rockchip/rkisp1/rkisp1-params.c | 3 ++-
>>>  include/uapi/linux/rkisp1-config.h                     | 3 +--
>>>  2 files changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
>>> index 6af4d551ffb5..021939466b24 100644
>>> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
>>> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
>>> @@ -589,7 +589,6 @@ static void rkisp1_hst_config(struct rkisp1_params *params,
>>>  		RKISP1_CIF_ISP_HIST_WEIGHT_22TO03,
>>>  		RKISP1_CIF_ISP_HIST_WEIGHT_13TO43,
>>>  		RKISP1_CIF_ISP_HIST_WEIGHT_04TO34,
>>> -		RKISP1_CIF_ISP_HIST_WEIGHT_44,
>>>  	};
>>>  	const u8 *weight;
>>>  	unsigned int i;
>>> @@ -622,6 +621,8 @@ static void rkisp1_hst_config(struct rkisp1_params *params,
>>>  							    weight[2],
>>>  							    weight[3]),
>>>  				 hist_weight_regs[i]);
>>> +
>>> +	rkisp1_write(params->rkisp1, weight[0] & 0x1F, RKISP1_CIF_ISP_HIST_WEIGHT_44);
>>
>> I just noticed that the default value to arg->hist_weight was:
>>
>> 	memset(hst.hist_weight, 0x01, sizeof(hst.hist_weight));
>>
>> Shouldn't the value be RKISP1_CIF_ISP_HIST_WEIGHT_SET(weight[0], 0x01, 0x01, 0x01) ?
>> Or am I missing something?
> 
> The last register only has that one value from weight[24];
> 
> I.e. before we were writing the 4 values into that last register as well
> from indices 24, 25, 26, 27 ... hence the 3 unused values in the weight array.
> 
> But that was merely a crutch to make that fit into the write loop.

right, lgtm, thank you and Dafna for working on this.

For the whole series:

Acked-by: Helen Koike <helen.koike@collabora.com>

Regards,
Helen

> 
> 
> Heiko
> 
> 
>>>  }
>>>  
>>>  static void
>>> diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
>>> index 24f05d6d258f..35aa82d5f6dd 100644
>>> --- a/include/uapi/linux/rkisp1-config.h
>>> +++ b/include/uapi/linux/rkisp1-config.h
>>> @@ -102,8 +102,7 @@
>>>  /*
>>>   * Histogram calculation
>>>   */
>>> -/* Last 3 values unused. */
>>> -#define RKISP1_CIF_ISP_HISTOGRAM_WEIGHT_GRIDS_SIZE 28
>>> +#define RKISP1_CIF_ISP_HISTOGRAM_WEIGHT_GRIDS_SIZE 25
>>>  
>>>  /*
>>>   * Defect Pixel Cluster Correction
>>>
>>
> 
> 
> 
> 
