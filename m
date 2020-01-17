Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBD9E140475
	for <lists+linux-media@lfdr.de>; Fri, 17 Jan 2020 08:25:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729159AbgAQHZt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jan 2020 02:25:49 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:58265 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727136AbgAQHZs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jan 2020 02:25:48 -0500
Received: from [192.168.2.10] ([62.249.185.68])
        by smtp-cloud8.xs4all.net with ESMTPA
        id sM0jicDxnpLtbsM0nithAZ; Fri, 17 Jan 2020 08:25:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1579245946; bh=UeKBLZ/CdLAZrnCykhZrVadqCwYfx67m4+oSWoKkHOs=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=NV9b5sVhgxUlYdSI3IOVzraQ4/7B4G7mQB2DBuhQQhRo0gDrB1DuCtjWmWQwMq9mv
         9caOoa80YupsKTd2J63PY1FZz6Pq2IYb0KOKPOvIxE50K55cyt/tWdXfN2Q24tpUfO
         oax/Q34NSRW44aSjWy9qTZKP2yXfZilHuww41DLKb37NUs040af/V9cLD3Jalsum+O
         10g4ZErRwj/cwUU9ShkMIQ328PHldOozvbEPyIVyA9RnyHzOXP/XHa/yvZNS5OMsib
         9UxHp1OuOXuh1K9mOG0Nrj6peY2FV3rY52v4F2KWD7H7Bw9Y6WxHRZLc4wPV1DN2KW
         FZ+NDtBPKRmIg==
Subject: Re: [PATCH] media: i2c: adv748x: Fix unsafe macros
To:     Nathan Chancellor <natechancellor@gmail.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com
References: <20191022132522.GA12072@embeddedor>
 <20200113231413.GA23583@ubuntu-x2-xlarge-x86>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <a729415d-1304-9722-2433-129bd2255188@xs4all.nl>
Date:   Fri, 17 Jan 2020 08:25:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200113231413.GA23583@ubuntu-x2-xlarge-x86>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfKyK/rzVjxnvkwsMf1qYMwClCWjHZYQSwtv4fCa+bjIiWSl35QLfhQTLEONgzTrvuzo0nGXVqfWPv/Y6XZ995571exmOIxPjek+cZCzNbC28LzOJfMqM
 0nSdK8oWqIs1T5UXeaBBYdAEUH1uhV7hhY4xZn9Y0TjDuPEdBRAB0YMZdVVTou6DkAFZEZnj9wNdod9kVwWSyLOL9BfFnMXG91wu+AtPMa0LYcKjd00tJOEp
 XQ038SezE5EVrQL0W1/dVPM7cq16wOPgK8zqlWyOdEqpDD9PsHJuhzDFsBtJ7pDThdN+9qL+LNIwESEMBvkIUNQ+emUJ7j/BNJzrbfBElA8sQ3nHQSPNXvP3
 5H6qWMqBPvU9R/QBy+bdtfjHanwosQvKO12HvC1gSuwJ+9wvZBjfdDW+ZFaxuKCEw8dHP+3sIqolOg16zwYU1epGkTO/HdJ71zYqEHmT+qWrm+LoiXcC/4xc
 QwWJEaKCXCDb7o61ShAHaNzfmIxbuqogodSs3g==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 1/14/20 12:14 AM, Nathan Chancellor wrote:
> On Tue, Oct 22, 2019 at 08:25:22AM -0500, Gustavo A. R. Silva wrote:
>> Enclose multiple macro parameters in parentheses in order to
>> make such macros safer and fix the Clang warning below:
>>
>> drivers/media/i2c/adv748x/adv748x-afe.c:452:12: warning: operator '?:'
>> has lower precedence than '|'; '|' will be evaluated first
>> [-Wbitwise-conditional-parentheses]
>>
>> ret = sdp_clrset(state, ADV748X_SDP_FRP, ADV748X_SDP_FRP_MASK, enable
>> ? ctrl->val - 1 : 0);
>>
>> Fixes: 3e89586a64df ("media: i2c: adv748x: add adv748x driver")
>> Reported-by: Dmitry Vyukov <dvyukov@google.com>
>> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com
> 
> It doesn't look like this was picked up? I still see this warning on
> 5.5-rc6 and next-20200113.

It's been picked up some time ago and will appear in 5.6.

Regards,

	Hans

> 
> If it helps:
> 
> Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> 
>> ---
>>  drivers/media/i2c/adv748x/adv748x.h | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/media/i2c/adv748x/adv748x.h b/drivers/media/i2c/adv748x/adv748x.h
>> index 5042f9e94aee..fccb388ce179 100644
>> --- a/drivers/media/i2c/adv748x/adv748x.h
>> +++ b/drivers/media/i2c/adv748x/adv748x.h
>> @@ -394,10 +394,10 @@ int adv748x_write_block(struct adv748x_state *state, int client_page,
>>  
>>  #define io_read(s, r) adv748x_read(s, ADV748X_PAGE_IO, r)
>>  #define io_write(s, r, v) adv748x_write(s, ADV748X_PAGE_IO, r, v)
>> -#define io_clrset(s, r, m, v) io_write(s, r, (io_read(s, r) & ~m) | v)
>> +#define io_clrset(s, r, m, v) io_write(s, r, (io_read(s, r) & ~(m)) | (v))
>>  
>>  #define hdmi_read(s, r) adv748x_read(s, ADV748X_PAGE_HDMI, r)
>> -#define hdmi_read16(s, r, m) (((hdmi_read(s, r) << 8) | hdmi_read(s, r+1)) & m)
>> +#define hdmi_read16(s, r, m) (((hdmi_read(s, r) << 8) | hdmi_read(s, (r)+1)) & (m))
>>  #define hdmi_write(s, r, v) adv748x_write(s, ADV748X_PAGE_HDMI, r, v)
>>  
>>  #define repeater_read(s, r) adv748x_read(s, ADV748X_PAGE_REPEATER, r)
>> @@ -405,11 +405,11 @@ int adv748x_write_block(struct adv748x_state *state, int client_page,
>>  
>>  #define sdp_read(s, r) adv748x_read(s, ADV748X_PAGE_SDP, r)
>>  #define sdp_write(s, r, v) adv748x_write(s, ADV748X_PAGE_SDP, r, v)
>> -#define sdp_clrset(s, r, m, v) sdp_write(s, r, (sdp_read(s, r) & ~m) | v)
>> +#define sdp_clrset(s, r, m, v) sdp_write(s, r, (sdp_read(s, r) & ~(m)) | (v))
>>  
>>  #define cp_read(s, r) adv748x_read(s, ADV748X_PAGE_CP, r)
>>  #define cp_write(s, r, v) adv748x_write(s, ADV748X_PAGE_CP, r, v)
>> -#define cp_clrset(s, r, m, v) cp_write(s, r, (cp_read(s, r) & ~m) | v)
>> +#define cp_clrset(s, r, m, v) cp_write(s, r, (cp_read(s, r) & ~(m)) | (v))
>>  
>>  #define tx_read(t, r) adv748x_read(t->state, t->page, r)
>>  #define tx_write(t, r, v) adv748x_write(t->state, t->page, r, v)
>> -- 
>> 2.23.0
>>

