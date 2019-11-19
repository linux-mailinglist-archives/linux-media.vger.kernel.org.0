Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53C24102424
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2019 13:19:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727750AbfKSMTc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Nov 2019 07:19:32 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:49387 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727646AbfKSMTb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Nov 2019 07:19:31 -0500
Received: from [IPv6:2001:983:e9a7:1:9879:d2e2:f0e2:9c7]
 ([IPv6:2001:983:e9a7:1:9879:d2e2:f0e2:9c7])
        by smtp-cloud7.xs4all.net with ESMTPA
        id X2TgiDPlWcs92X2ThizITc; Tue, 19 Nov 2019 13:19:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1574165969; bh=buYvgl3P8tgdmEwDO0VaNme6c5DKjtTMqY+pxCvCUG0=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=T7Qipm9CimWEqp/3WGsqVravr4zuWOZK9RVfeNLOu6BTRMTDi64Zr7Ah7Z8VSPKRC
         /PT8qbnuNnaFowEhzLgxz8F6KaFjTEG9kmUxhiq56ZjVeTlro54wqp1kyGh30jorT9
         u8AkbPSclDhdAC8hu4kJQGPElVetvLm6xTyxvYja/sJmRK/7sa28O5sFrhNoH/pCXQ
         bSp9cgVCHh2UkG7ju2adxp4tsEQxdDV4AQN3zr8xmCuq3dtRKJSQ49ylUwoanFap2h
         V5bOc08+S622Ld7P4WtQ4WPOxUu9OX4ASEC64lGiSoYvyTrEvye3zMClgui1wxjR2q
         +xkqZHitEi0Rg==
Subject: Re: [PATCH 5/5] input/rmi4/rmi_smbus.c: don't increment rmiaddr in
 rmi_smb_read_block()
To:     Lucas Stach <l.stach@pengutronix.de>, linux-media@vger.kernel.org
Cc:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Nick Dyer <nick@shmanahar.org>,
        Christopher Heiny <cheiny@synaptics.com>,
        Vandana BN <bnvandana@gmail.com>
References: <20191119105118.54285-1-hverkuil-cisco@xs4all.nl>
 <20191119105118.54285-6-hverkuil-cisco@xs4all.nl>
 <409e5b53516fbf5daa752211d90f1fbba2f1c3b2.camel@pengutronix.de>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <3f21e94c-5ef5-f6f4-934d-2921fa93833f@xs4all.nl>
Date:   Tue, 19 Nov 2019 13:19:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <409e5b53516fbf5daa752211d90f1fbba2f1c3b2.camel@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfFomjj1p7LvuUNfj35h7pFwfUaIHI7RC9bEmTDtWGsfUgwNWI3TxeP8+Gnj7qiDSEzLG8ruWtHiPiqUU+EyGKLT4TTPWdfNh//t8HMhmzdziwXCJl4Pt
 kqqwaV1kH3RHa5pCMO6wQsZPpFN+iUv2Rk+VSLp9N+I5cmeOkpMh8wuY8AypjxOJKk/wa37vAM9g5i4qrweVzvUJj+lzKIbnFBfEVwVobakZkWLZ9fmZjQNA
 uZv3h1on+TczJXd983QMKnDM06AxXE+6XwtYqzXSjmai/7wH8DHu20oW/t2L6qXO0M9ow0sNEU+gd/H5hnc7MlPmRkGZZ8d7jzHwYWlhzHpJjMLS3ruQnPtA
 aTA45BqwlSk7rcshdIwpSoF0f/XRFBX0lb5DKUJspL6lAhBMKom9m8wvRoLAmFCoi/UxYxqB0Vg1svIA5TxBBuX/CtsjtpJUHUT/7CwpjJFGTT/NoEBWWR0X
 gI+5UV7krmwFag3dlm4uiQ0eooJz39fUo1HkCXfPysmb1twBMR1lR77puhE=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Lucas,

On 11/19/19 12:48 PM, Lucas Stach wrote:
> Hi Hans,
> 
> On Di, 2019-11-19 at 11:51 +0100, Hans Verkuil wrote:
>> This increment of rmi_smbus causes garbage to be returned.
>> The first read of SMB_MAX_COUNT bytes is fine, but after that
>> it is nonsense. Trial-and-error showed that by dropping the
>> increment of rmiaddr everything is fine and the F54 function
>> properly works.
>>
>> Even going back to the original code when F54 was added, I
>> could not make it work without this patch. So I do not understand
>> how this ever worked.
> 
> My guess is that F54 has mostly been tested with touchscreens that are
> connected to a regular i2c bus, not smbus. i2c has a separate transport
> implementation in rmi4. Most of the other functions are probably
> reading much smaller block data than F54.

That's my suspicion as well. I tried to configure my kernel so that it
would be using i2c instead of smbus, but I couldn't make it work. I'll
have to try again next week.

I only have Rev E of the RMI4 spec, which does not appear to document
the mapping table entry that rmi_smb_get_command_code() uses.

Do you (or someone else) have access to a newer version? If so, can you check
how this is supposed to work for reading large blocks over smbus?

With the current code it will create a new mapping entry for every 32
byte read. I suspect that that is not how it is supposed to work, but
without a spec this is just trial-and-error.

Regards,

	Hans

> 
> Regards,
> Lucas
> 
>> My guess is that the same change is needed in rmi_smb_write_block,
>> but I wouldn't know how to test this.
>>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> ---
>>  drivers/input/rmi4/rmi_smbus.c | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/input/rmi4/rmi_smbus.c b/drivers/input/rmi4/rmi_smbus.c
>> index 2407ea43de59..79ecea5edacc 100644
>> --- a/drivers/input/rmi4/rmi_smbus.c
>> +++ b/drivers/input/rmi4/rmi_smbus.c
>> @@ -215,7 +215,6 @@ static int rmi_smb_read_block(struct rmi_transport_dev *xport, u16 rmiaddr,
>>  		/* prepare to read next block of bytes */
>>  		cur_len -= SMB_MAX_COUNT;
>>  		databuff += SMB_MAX_COUNT;
>> -		rmiaddr += SMB_MAX_COUNT;
>>  	}
>>  
>>  	retval = 0;
> 

