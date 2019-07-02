Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C81E5D12A
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2019 16:06:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726591AbfGBOGT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jul 2019 10:06:19 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:37798 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726375AbfGBOGS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Jul 2019 10:06:18 -0400
Received: by mail-pf1-f193.google.com with SMTP id 19so8316774pfa.4
        for <linux-media@vger.kernel.org>; Tue, 02 Jul 2019 07:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=cc:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vz42lXCNVuBmxRO09+m6KHlZclALBcC1LyOwdf+3/fs=;
        b=kHauhUYC5XibaSc39kW66VxOCYpQ7uzF2pHyKo+n7SMkukA1zl6tyymKZzcl3Dps0o
         6mQjzyA1NmPuUqQTQt4t8OTRSn3utUOLK5pYfjQjpBVWhOa+kWegJx3jaEWTK9BFXF5x
         JrsAyoDpdFNyTZfdjedXiFmdNGugZ7w1euFJ4FVCNTYPdN7ENOiovNp9uC9cUjmGSFRb
         uX1RBPs6KvClSCYR1/pObTt1GXD9dwbbq5Y+LzzhAhEme/wwYW2MgpBFgcANDmkW7O6H
         lCLHxtftuBlddc9BwH79f5p6VQdK6AEAcUA0UGui/5JwDHrJGIrJsU0OCFK5FdzMPUDh
         9eBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:cc:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vz42lXCNVuBmxRO09+m6KHlZclALBcC1LyOwdf+3/fs=;
        b=fQ9LKHx2fza48z/fA0RqvrYdlpRgyDHzXEKHJ+FzInmfMqLProvUBAuWCLWvW5IZMI
         EmUY98FydqPG6igYt6wRhBpn0IFTaUblERhNheF7wrm1HVcTghOESmO9mtSQueJcufMM
         POYfW7XrKqs2kRQpqGrqLLlFu7B3Usypbcmimre2y+exyRaphJtObkpmrj4iwbeYjt7g
         zbpkreyw6nxv1kwTkQRVwkYqKxaybSHPX+oIHw+oSkb7RLOgj1IsX9ho69h3xozeM48P
         goY1lzMwJ5FRuss9tieOSz8VwxeOc4HpRHcrF0mzCKeMOuuADLnf4SiSXwARbm0D4q63
         H3vw==
X-Gm-Message-State: APjAAAWfTd4hyLuOITvl9ukALsD+kEXTBFe4x3TzpQHBbEs7cD4VKglD
        XnQCKcQFYdC9zbhJHu/TmIADJjAdy8Y=
X-Google-Smtp-Source: APXvYqzG1hbkqjr0adXBcjVPIT3xr9ifGoNstECqNQO13a2xlICjeAM+mE+4lNqeuA7e7wzNvZcmrA==
X-Received: by 2002:a17:90a:b30a:: with SMTP id d10mr5962465pjr.8.1562076377850;
        Tue, 02 Jul 2019 07:06:17 -0700 (PDT)
Received: from ?IPv6:2405:4800:58f7:57a9:d288:4a68:7763:f51e? ([2405:4800:58f7:57a9:d288:4a68:7763:f51e])
        by smtp.gmail.com with ESMTPSA id a3sm17984302pfi.63.2019.07.02.07.06.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jul 2019 07:06:16 -0700 (PDT)
Cc:     tranmanphong@gmail.com, mchehab@kernel.org, hans.verkuil@cisco.com,
        keescook@chromium.org, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-media@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] Analyze syzbot report
 technisat_usb2_rc_query KASAN
To:     Greg KH <gregkh@linuxfoundation.org>
References: <ede75d50-7475-3478-b30f-ef9077b6bf48@gmail.com>
 <20190702044510.GA1045@kroah.com>
From:   Phong Tran <tranmanphong@gmail.com>
Message-ID: <cf3f9c63-bd2d-1e26-bfa7-1fd220bc0652@gmail.com>
Date:   Tue, 2 Jul 2019 21:06:13 +0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190702044510.GA1045@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 7/2/19 11:45 AM, Greg KH wrote:
> On Tue, Jul 02, 2019 at 07:49:26AM +0700, Phong Tran wrote:
>> Hello,
>>
>> I did a checking for this report of syzbot [1]
>>  From the call stack of dump log:
>>
>> There shows that a problem within technisat_usb2_get_ir()
>>
>> BUG: KASAN: slab-out-of-bounds in technisat_usb2_get_ir
>> drivers/media/usb/dvb-usb/technisat-usb2.c:664 [inline]
>> BUG: KASAN: slab-out-of-bounds in technisat_usb2_rc_query+0x5fa/0x660
>> drivers/media/usb/dvb-usb/technisat-usb2.c:679
>> Read of size 1 at addr ffff8880a8791ea8 by task kworker/0:1/12
>>
>> Take a look into while loop in technisat_usb2_get_ir().
>> I recognized that a problem. The loop will not break out with the condition
>> doesn't reach. Then "b++" will go wrong and buffer will be overflow.
>>
>> while (1) {
>> [...]
>> 	b++;
>> 	if (*b == 0xff) {
>> 		ev.pulse = 0;
>> 		ev.duration = 888888*2;
>> 		ir_raw_event_store(d->rc_dev, &ev);
>> 		break;
>> 	}
>> }
>>
>> I would propose changing the loop condition by checking the address of the
>> buffer. If acceptable, I will send this patch to the mailing-list.
>> eg:
>>
>> -       while (1) {
>> +       while (b != (buf + 63)) {
>> [...]
>> }
>>
>> Tested with syzbot, result is good [2].
>>
>> [1] https://syzkaller.appspot.com/bug?extid=eaaaf38a95427be88f4b
>> [2] https://groups.google.com/d/msg/syzkaller-bugs/CySBCKuUOOs/0hKq1CdjCwAJ
> 
> Great, can you submit a patch for this?
> 

Yes, sent a patch
https://lore.kernel.org/lkml/20190702140211.28399-1-tranmanphong@gmail.com/

Phong.

> thanks,
> 
> greg k-h
> 
