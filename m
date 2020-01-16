Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A06E213FBFA
	for <lists+linux-media@lfdr.de>; Thu, 16 Jan 2020 23:06:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389709AbgAPWGr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jan 2020 17:06:47 -0500
Received: from gateway24.websitewelcome.com ([192.185.51.162]:47740 "EHLO
        gateway24.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729260AbgAPWGr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jan 2020 17:06:47 -0500
X-Greylist: delayed 1301 seconds by postgrey-1.27 at vger.kernel.org; Thu, 16 Jan 2020 17:06:46 EST
Received: from cm16.websitewelcome.com (cm16.websitewelcome.com [100.42.49.19])
        by gateway24.websitewelcome.com (Postfix) with ESMTP id 6BE55A766
        for <linux-media@vger.kernel.org>; Thu, 16 Jan 2020 15:45:04 -0600 (CST)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id sCwqiqZOR32AdsCwqi1ELy; Thu, 16 Jan 2020 15:45:04 -0600
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=MIME-Version:Content-Type:In-Reply-To:
        References:Subject:Cc:To:From:Message-ID:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=Uo2cT09CAUfsX0mNEXeVuvzQ9UQGtxxGE/nVeDW36gs=; b=jA97zYVTHqDPUAYsoxkgSDvxK
        JZ3TIJ0j8BkjjkCP7UmH/9XhhHDYgRuz8AFpttUk6MU8p9RwkaYLpClhIHrooCxbUqIse8Yqncf5i
        YXwpSZx4vf/0Gg1/kABUy5TC2vatTblXw45HGkpMxgHY2vt/h3sPl0XY1tJeAWW0dojPxv1yALACr
        f7xUdSuRVMUpOjCv6QDf8jGqkg4Q0xNwKo8U22SQr2/y7sTf/9P6XXT2S1jQ942fotVVIYxstxbD7
        sMQ/aW4LHd9QZPVBmvbPQ5SjyO9RfI2ilxPgp4Dzq2l9akJzF5zwgO+KfA1pFtNKniBvhcnIWJO46
        I1V7zs0zw==;
Received: from gator4166.hostgator.com ([108.167.133.22]:41607)
        by gator4166.hostgator.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1isCwp-000U4i-WC; Thu, 16 Jan 2020 15:45:03 -0600
Received: from [187.162.252.62] ([187.162.252.62]) by embeddedor.com (Horde
 Framework) with HTTPS; Thu, 16 Jan 2020 15:45:03 -0600
Date:   Thu, 16 Jan 2020 15:45:03 -0600
Message-ID: <20200116154503.Horde.MnWaeq-f0qzzp8gx01ERP2p@embeddedor.com>
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com
Subject: Re: [PATCH] media: i2c: adv748x: Fix unsafe macros
References: <20191022132522.GA12072@embeddedor>
 <20200113231413.GA23583@ubuntu-x2-xlarge-x86>
In-Reply-To: <20200113231413.GA23583@ubuntu-x2-xlarge-x86>
User-Agent: Horde Application Framework 5
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 108.167.133.22
X-Source-L: Yes
X-Exim-ID: 1isCwp-000U4i-WC
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: gator4166.hostgator.com [108.167.133.22]:41607
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 9
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi!

Quoting Nathan Chancellor <natechancellor@gmail.com>:

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
>
> If it helps:
>
> Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
>

Thank you, Nathan! :)


Friendly ping:

Who can take this?

It's been almost three months now since I first sent this patch out.

Thanks!
--
Gustavo

>> ---
>>  drivers/media/i2c/adv748x/adv748x.h | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/media/i2c/adv748x/adv748x.h  
>> b/drivers/media/i2c/adv748x/adv748x.h
>> index 5042f9e94aee..fccb388ce179 100644
>> --- a/drivers/media/i2c/adv748x/adv748x.h
>> +++ b/drivers/media/i2c/adv748x/adv748x.h
>> @@ -394,10 +394,10 @@ int adv748x_write_block(struct adv748x_state  
>> *state, int client_page,
>>
>>  #define io_read(s, r) adv748x_read(s, ADV748X_PAGE_IO, r)
>>  #define io_write(s, r, v) adv748x_write(s, ADV748X_PAGE_IO, r, v)
>> -#define io_clrset(s, r, m, v) io_write(s, r, (io_read(s, r) & ~m) | v)
>> +#define io_clrset(s, r, m, v) io_write(s, r, (io_read(s, r) & ~(m)) | (v))
>>
>>  #define hdmi_read(s, r) adv748x_read(s, ADV748X_PAGE_HDMI, r)
>> -#define hdmi_read16(s, r, m) (((hdmi_read(s, r) << 8) |  
>> hdmi_read(s, r+1)) & m)
>> +#define hdmi_read16(s, r, m) (((hdmi_read(s, r) << 8) |  
>> hdmi_read(s, (r)+1)) & (m))
>>  #define hdmi_write(s, r, v) adv748x_write(s, ADV748X_PAGE_HDMI, r, v)
>>
>>  #define repeater_read(s, r) adv748x_read(s, ADV748X_PAGE_REPEATER, r)
>> @@ -405,11 +405,11 @@ int adv748x_write_block(struct adv748x_state  
>> *state, int client_page,
>>
>>  #define sdp_read(s, r) adv748x_read(s, ADV748X_PAGE_SDP, r)
>>  #define sdp_write(s, r, v) adv748x_write(s, ADV748X_PAGE_SDP, r, v)
>> -#define sdp_clrset(s, r, m, v) sdp_write(s, r, (sdp_read(s, r) & ~m) | v)
>> +#define sdp_clrset(s, r, m, v) sdp_write(s, r, (sdp_read(s, r) &  
>> ~(m)) | (v))
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



