Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69313D111E
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2019 16:24:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731180AbfJIOYY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Oct 2019 10:24:24 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:60996 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729491AbfJIOYY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 9 Oct 2019 10:24:24 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id D5B68D1D3597239601EF;
        Wed,  9 Oct 2019 22:24:21 +0800 (CST)
Received: from [127.0.0.1] (10.177.29.68) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.439.0; Wed, 9 Oct 2019
 22:24:19 +0800
Message-ID: <5D9DED92.8060201@huawei.com>
Date:   Wed, 9 Oct 2019 22:24:18 +0800
From:   zhong jiang <zhongjiang@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To:     Sean Young <sean@mess.org>
CC:     <mchehab@kernel.org>, <hansverk@cisco.com>,
        <daniel.vetter@ffwll.ch>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/4] media: dvb-frontends: Use DIV_ROUND_CLOSEST directly
 to make it readable
References: <1567700092-27769-1-git-send-email-zhongjiang@huawei.com> <1567700092-27769-2-git-send-email-zhongjiang@huawei.com> <20191001111552.GA18622@gofer.mess.org>
In-Reply-To: <20191001111552.GA18622@gofer.mess.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.29.68]
X-CFilter-Loop: Reflected
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2019/10/1 19:15, Sean Young wrote:
> Hi,
>
> On Fri, Sep 06, 2019 at 12:14:49AM +0800, zhong jiang wrote:
>> The kernel.h macro DIV_ROUND_CLOSEST performs the computation (x + d/2)/d
>> but is perhaps more readable.
>>
>> Signed-off-by: zhong jiang <zhongjiang@huawei.com>
>> ---
>>  drivers/media/dvb-frontends/mt312.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/dvb-frontends/mt312.c b/drivers/media/dvb-frontends/mt312.c
>> index 7cae7d6..251ff41 100644
>> --- a/drivers/media/dvb-frontends/mt312.c
>> +++ b/drivers/media/dvb-frontends/mt312.c
>> @@ -137,7 +137,7 @@ static inline int mt312_writereg(struct mt312_state *state,
>>  
>>  static inline u32 mt312_div(u32 a, u32 b)
>>  {
>> -	return (a + (b / 2)) / b;
>> +	return DIV_ROUND_CLOSEST(a, b);
> Well spotted, that is absolutely correct. However now mt312_div() is just
> a wrapper for DIV_ROUND_CLOSEST() -- and even marked inline. Really all
> the callers to mt312_div() should be replaced with DIV_ROUND_CLOSEST().
Thanks for your suggestion.   I will use DIV_ROUND_CLOSEST directly in v2.

Sincerely,
zhong jiang
> Thanks,
>
> Sean
>
> .
>


