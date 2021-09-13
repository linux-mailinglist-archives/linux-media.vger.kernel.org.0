Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EA284089D5
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 13:04:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239337AbhIMLFb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 07:05:31 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:56600
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239171AbhIMLFa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 07:05:30 -0400
Received: from [10.172.193.212] (1.general.cking.uk.vpn [10.172.193.212])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 405923F0FD;
        Mon, 13 Sep 2021 11:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1631531046;
        bh=Yp56eiOhuJUOUSqsC9RhQCuTloHI269gSNPewoOCijQ=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=s5+mrK//ZMln/SBpO/yONeaqyQoZZmMgw/0GOGHg2oaTT9P7YGwD0gJn7JA3cMAQ1
         cLj796ZUvSysl6jCFRT/v8sQAYrcc1AQxdPR+067rB7erjFTs7/3NeQRN/wa3F4vF8
         bnA8rpo8GrwNaSYixNUbmeVzZUGnDcdCFPeYqzvHDy+sdhOjclUHLG99Kot1pS7ixJ
         2wqH2qy/9/EuWCzNQtK+9oIJiGPkgUq7cKjxmejX1mov6O/KUr+JlHQa4wiD4TUMEL
         28y6buim+az8LVka27XCz1fqg1JW/y4AkOY0Y7i9osNXauMFesyuIP3HZJIMrHBYVs
         guztRDCSpEf9Q==
Subject: Re: NAK: [PATCH][next] media: pvrusb2: add newline between two
 statements
To:     Hans Verkuil <hverkuil@xs4all.nl>, Mike Isely <isely@pobox.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210902220112.55824-1-colin.king@canonical.com>
 <52c324ad-2467-9edc-c386-bc5a086cecbc@canonical.com>
 <82d125bd-9d16-803d-754b-48aa79fde06c@xs4all.nl>
From:   Colin Ian King <colin.king@canonical.com>
Message-ID: <8b4c86dd-a7d5-ce0d-3ba6-03eba28c0288@canonical.com>
Date:   Mon, 13 Sep 2021 12:04:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <82d125bd-9d16-803d-754b-48aa79fde06c@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 13/09/2021 12:00, Hans Verkuil wrote:
> On 03/09/2021 00:02, Colin Ian King wrote:
>> On 02/09/2021 23:01, Colin King wrote:
>>> From: Colin Ian King <colin.king@canonical.com>
>>>
>>> There are two statements on the same line, add a newline to clean
>>> this up.
>>>
>>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>>> ---
>>>  drivers/media/usb/pvrusb2/pvrusb2-hdw.c | 3 ++-
>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
>>> index d38dee1792e4..ca00b7fe1e7f 100644
>>> --- a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
>>> +++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
>>> @@ -1727,7 +1727,8 @@ int pvr2_hdw_set_streaming(struct pvr2_hdw *hdw,int enable_flag)
>>>  				   enable_flag ? "enable" : "disable");
>>>  		}
>>>  		pvr2_hdw_state_sched(hdw);
>>> -	} while (0); LOCK_GIVE(hdw->big_lock);
>>> +	} while (0);
>>> +	LOCK_GIVE(hdw->big_lock);
>>>  	if ((ret = pvr2_hdw_wait(hdw,0)) < 0) return ret;
>>>  	if (enable_flag) {
>>>  		while ((st = hdw->master_state) != PVR2_STATE_RUN) {
>>>
>>
>> ignore, V2 being sent in a moment.
> 
> I haven't seen a V2 yet... In any case, I've rejected this patch in patchwork.

After looking at all the unconventional code style issues I chose not to
clean this up.

> 
> Regards,
> 
> 	Hans
> 

