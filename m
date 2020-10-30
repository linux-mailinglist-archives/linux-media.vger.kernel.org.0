Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EFEF2A029F
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 11:14:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725993AbgJ3KOt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Oct 2020 06:14:49 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:57884 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbgJ3KOt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Oct 2020 06:14:49 -0400
Received: from [IPv6:2003:c7:cf1c:4d00:58b3:6683:91ae:b6a8] (p200300c7cf1c4d0058b3668391aeb6a8.dip0.t-ipconnect.de [IPv6:2003:c7:cf1c:4d00:58b3:6683:91ae:b6a8])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 3B2FC1F45E82;
        Fri, 30 Oct 2020 10:14:47 +0000 (GMT)
Subject: Re: [PATCH] media: staging: rkisp1: uapi: add "WITH
 Linux-syscall-note"
To:     Helen Koike <helen.koike@collabora.com>,
        linux-media@vger.kernel.org,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     laurent.pinchart@ideasonboard.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
References: <20201020132514.26651-1-dafna.hirschfeld@collabora.com>
 <2e5116d7-10c1-6eee-9a80-5350515ac314@collabora.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <aff1c42d-d65b-a8ef-3097-de1b1d44f170@collabora.com>
Date:   Fri, 30 Oct 2020 11:14:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2e5116d7-10c1-6eee-9a80-5350515ac314@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



Am 30.10.20 um 06:28 schrieb Helen Koike:
> Hi Dafna,
> 
> On 10/20/20 10:25 AM, Dafna Hirschfeld wrote:
>> Add "WITH Linux-syscall-note" to the uapi
>> header SPDX comment.
>>
>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> 
> Acked-by: Helen Koike <helen.koike@collabora.com>
> 
> Since Niklas reported[1], it wold be nice to add his Reported-by tag.

Hi, sure,

Reported-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>


Thanks,
Dafna

> 
> [1] https://www.spinics.net/lists/linux-media/msg177793.html
> 
> Regards,
> Helen
> 
>> ---
>>   drivers/staging/media/rkisp1/uapi/rkisp1-config.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/staging/media/rkisp1/uapi/rkisp1-config.h b/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
>> index 432cb6be55b4..8d906cc7da8f 100644
>> --- a/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
>> +++ b/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
>> @@ -1,4 +1,4 @@
>> -/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
>> +/* SPDX-License-Identifier: ((GPL-2.0+ WITH Linux-syscall-note) OR MIT) */
>>   /*
>>    * Rockchip ISP1 userspace API
>>    * Copyright (C) 2017 Rockchip Electronics Co., Ltd.
>>
