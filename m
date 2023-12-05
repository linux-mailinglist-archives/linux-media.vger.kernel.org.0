Return-Path: <linux-media+bounces-1624-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D22C9804A68
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 07:40:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7AE341F214B5
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 06:40:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1AF512E53;
	Tue,  5 Dec 2023 06:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HhvZRnIQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E500F194
	for <linux-media@vger.kernel.org>; Mon,  4 Dec 2023 22:39:52 -0800 (PST)
Received: from [192.168.1.105] (unknown [103.251.226.73])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 071634DB;
	Tue,  5 Dec 2023 07:39:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701758350;
	bh=KRiCRSMzhN+jR4SLc+ozbGmLLTLRTzaUA3xh6zlTM3g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HhvZRnIQAgaqOZ4IgNNVKMD0eUUGLcFIdQa1VvZMLJ48i1f5Fpw8HoB6cy0XM3axB
	 5eNXeNj900a+e76RzyBiJNMX6WVzGv1k076nL95xy+1UdiUvzgdZR1qfzHhyAfJnM8
	 IkJ18aFJG7FjaJwKFsRSG0gjENrNHulGRxhV5LmI=
Message-ID: <a87efe94-b3fb-a360-dfcd-db2097b89d6f@ideasonboard.com>
Date: Tue, 5 Dec 2023 12:09:41 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 0/5] staging: vc04_services: Drop custom logging
To: Stefan Wahren <wahrenst@gmx.net>, linux-staging@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dan Carpenter <error27@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 "Ricardo B . Marliere" <ricardo@marliere.net>
References: <20231128201926.489269-1-umang.jain@ideasonboard.com>
 <42cd081f-bee9-49ff-b8f6-17ec58f43058@gmx.net>
Content-Language: en-US
From: Umang Jain <umang.jain@ideasonboard.com>
In-Reply-To: <42cd081f-bee9-49ff-b8f6-17ec58f43058@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Stefan,

On 11/29/23 4:56 AM, Stefan Wahren wrote:
> Hi Umang,
>
> Am 28.11.23 um 21:19 schrieb Umang Jain:
>> This series also removes the vchiq_log_* macro and makes use of 
>> dev_dbg()
>> directly.
> sorry, i didn't had the time to follow the logging discussion, but the
> following commits:
>
> staging: vc04: Convert vchiq_log_error() to use dynamic debug
> staging: vc04: Convert vchiq_log_warning() to use dynamic debug
> staging: vc04: Convert(and rename) vchiq_log_info() to use dynamic debug
>
> changed the logging behavior. I don't think it's intended to move
> everything to dev_dbg.
>
> I would expected the following mapping:
> vchiq_log_error -> dev_err
> vchiq_log_warning -> dev_warn

For this I agree,
> vchiq_log_info -> dev_info

However, I think vchiq_log_info and vchiq_log_debug should be moved to 
dev_dbg.

Otherwise, I think they'll spew a ton of information to dmesg by default.
>>
>> Patch 1/5 is fix. It prevents passing NULL to one of vchiq_log_error().
>> The function there in question, does not have any users as of
>> now. However, it is going to be used by the vc-sm-cma and bcm2835-isp
>> drivers (posted on list for review [1]). There was discussion on v1,
>> whether I should drop and add the function later, however, didn't
>> conclude.
>>
>> Patch 2/5 removes vchiq_log_error() macro
>> Patch 3/5 removes vchiq_log_warning() macro
>> Patch 4/5 removes vchiq_log_trace() macro
>> Patch 5/5 removes vchiq_log_debug() macro
>>
>> This completes the following TODO item:
>>
>> ```
>> * Cleanup logging mechanism
>>
>> The driver should probably be using the standard kernel logging 
>> mechanisms
>> such as dev_info, dev_dbg, and friends.
>> ```
>>
>> [1]: 
>> https://lore.kernel.org/linux-media/20231109210309.638594-1-umang.jain@ideasonboard.com/
>>
>> Changes in v2:
>> - Separate out one fixup patch from v1 (Patch 1/9)and send separately
>> - Drop usage of log_type() and log_category() helpers. Directly use
>>    dev_dbg() as suggested by Greg KH.
>> - Drop __func__ annotation from all logs. Dynamic debug has 'f'
>>    decorator flag which can be used instead of manual __func__
>> - Reword commit messages.
>>
>> Umang Jain (5):
>>    staging: vc04_services: Do not pass NULL to vchiq_log_error()
>>    staging: vc04_services: Drop vchiq_log_error() in favour of dev_dbg
>>    staging: vc04_services: Drop vchiq_log_warning() in favour of dev_dbg
>>    staging: vc04_services: Drop vchiq_log_trace() in favour of dev_dbg
>>    staging: vc04_services: Drop vchiq_log_debug() in favour of dev_dbg
>>
>>   drivers/staging/vc04_services/interface/TODO  |   5 -
>>   .../interface/vchiq_arm/vchiq_arm.c           | 176 ++++----
>>   .../interface/vchiq_arm/vchiq_connected.c     |   8 +-
>>   .../interface/vchiq_arm/vchiq_connected.h     |   4 +-
>>   .../interface/vchiq_arm/vchiq_core.c          | 402 +++++++++---------
>>   .../interface/vchiq_arm/vchiq_core.h          |  38 --
>>   .../interface/vchiq_arm/vchiq_dev.c           |  92 ++--
>>   7 files changed, 315 insertions(+), 410 deletions(-)
>>
>


