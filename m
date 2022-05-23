Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BA7F531F17
	for <lists+linux-media@lfdr.de>; Tue, 24 May 2022 01:07:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229493AbiEWXHb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 May 2022 19:07:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbiEWXH2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 May 2022 19:07:28 -0400
X-Greylist: delayed 1859 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 23 May 2022 16:07:26 PDT
Received: from knet-dmarc.kensnet.org (knetgate.kensnet.org [80.168.136.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 817D370369
        for <linux-media@vger.kernel.org>; Mon, 23 May 2022 16:07:26 -0700 (PDT)
Received: from knetgate.kensnet.org ([192.168.122.1])
        by knet-dmarc.kensnet.org (8.14.4/8.14.4) with ESMTP id 24NMaKLO023507
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Mon, 23 May 2022 23:36:20 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 knet-dmarc.kensnet.org 24NMaKLO023507
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kensnet.org;
        s=default; t=1653345380;
        bh=FCDUANuU593h0QNOlQu15RGuHO5k4a9KkIJXLACBPYY=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=NK8Vgcd73I1WuvMAGhkQtxekW1GGAusyEegRzQws9zlXwRtLgYs59Sa5P7re6PfZq
         Pt6VnziGT+fJJm5XwXtzPJeoVHyZ9KVTB2bNBJShcbIzVq5ICRmNiIMmwWhL8x9aSp
         jikLHtEPNkyYqEGsJVTdKTjZH4o/HEcWYGBhVu7E=
Received: from [172.16.0.178] (kenslt3-fcore.kensnet [172.16.0.178])
        (authenticated bits=0)
        by knetgate.kensnet.org (8.14.4/8.14.4) with ESMTP id 24NMaGok009229
        (version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NO);
        Mon, 23 May 2022 23:36:18 +0100
Subject: Re: HauppaugeTV-quadHD DVB-T & HVR5525 mpeg risc op code error
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Brad Love <brad@nextdimension.cc>
References: <20200423155908.GA22613@gofer.mess.org>
 <bc0644cd-3438-6505-d438-8f3f71347ccb@mindspring.com>
 <20200423163559.GB23006@gofer.mess.org>
 <0cd2436c-0a39-0f85-929e-5d8f333b5027@burnicki.net>
 <20200425114147.GA3037@gofer.mess.org>
 <4aa38e2a-6b98-6530-69d9-d945a467bf0b@burnicki.net>
 <1a2d9e15-55e2-88a7-d197-208a8ce99218@burnicki.net>
 <20200427080751.GA5925@gofer.mess.org>
 <e7d8aeb8-124a-f7b3-d469-4c47f182f067@burnicki.net>
 <0fc5d43f-7928-1649-220b-45916b189d8f@burnicki.net>
 <20200430164934.GA16730@gofer.mess.org>
From:   Ken Smith <kens@kensnet.org>
Organization: K-Net Technology
Message-ID: <49697978-c4ef-66fe-94ac-17117540c111@kensnet.org>
Date:   Mon, 23 May 2022 23:36:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20200430164934.GA16730@gofer.mess.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-kensnet-MailScanner-Information: Please contact the ISP for more information
X-kensnet-MailScanner-ID: 24NMaGok009229
X-kensnet-MailScanner: Found to be clean
X-kensnet-MailScanner-From: kens@kensnet.org
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Sean Young wrote:
> On Tue, Apr 28, 2020 at 08:24:20PM +0200, Martin Burnicki wrote:
>> Hi,
>>
>> Am 27.04.20 um 10:59 schrieb Martin Burnicki:
>>> Sean Young wrote:
>>>> Would you mind testing this patch please?
>>> I'm going to try it this evening.
>>>
>>> I'll have to find out how to do an out-of-tree build for a copy of the
>>> cx module that includes the patch.
>>>
>>> My own kernel driver is always and only built out-of-tree, but for the
>>> cx driver I need to see which files I need to copy to a local directory,
>>> and if there is anything else that needs to be done to build a copy of
>>> it out-of-tree.
>> Sorry, I haven't managed to test the patch, yet.
>>
>> Currently I have the driver loaded with
>>
>> options cx23885 dma_reset_workaround=2
>>
>> but today there were 3 occurrences of the risc opcode error:
>>
>>
> Drats.
>
>> So the workaround doesn't seem to fix the problem anyway, and the patch
>> would just enable the workaround with out the specific option, right?
> Yes, that's right.
>
>> The effect of the workaround looks just like debug levels lower than 7,
>> it just seems to reduce the probability that the bug occurs, but doesn't
>> really fix it.
>>
>> So my conclusion is still that that this smells like a missing memory
>> barrier or so in the driver.
>>
>> Since the driver seems to work properly with older mainboards/CPU types,
>> this doesn't sound like a problem in the CX chip, IMO.
> I would agree with that. I would suspect same issue was being papered over
> by the patch; now what that issue is, I don't know. Certainly some ordering
> or barrier issue seems likely.
>
> Actually I suspected this all along, but the workaround is the best we have.
>
> I think, some time spent hunting down the issue would really be helpful
> here. Hopefully that doesn't mean too many aborted recordings..
>
> Thanks,
>
> Sean
>

Hi, I'd like to resurrect this thread (copied below). I have a system 
showing this error. Its a HP ML350 server with 2x Xeon 5675 running 
Rocky Linux 8.5. It has a Hauppauge HVR5525 card that uses the same 
cx23885 kernel module as the quadHD card discussed above. The HVR5525 is 
a dual DVB-T2/DVB-S2 card.

In other threads I read about the dma_reset_workaround option. That 
option did not appear to be in the version included in standard kernel 
in Rocky 8.5. I have loaded a 5.4 kernel and compiled the DVB media 
modules from .git source and set dma_reset_workaround=2 in a file in 
modprobe.d. The built module shows version 0.0.4

Sadly the error remains. The system runs MythTV v.31. The main symptom 
is occasional aborted recordings. Although the card does appear to 
recover, not requiring a reboot/cold restart.

I'd appreciate some assistance with this. What information can I provide 
to help to trace this.

Many thanks

Ken

-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.

