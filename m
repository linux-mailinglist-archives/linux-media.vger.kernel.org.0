Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8613519789
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2019 06:28:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726940AbfEJE2F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 May 2019 00:28:05 -0400
Received: from mga05.intel.com ([192.55.52.43]:30406 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725904AbfEJE2F (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 May 2019 00:28:05 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 May 2019 21:28:04 -0700
X-ExtLoop1: 1
Received: from dgmorgan-mobl2.amr.corp.intel.com (HELO [10.254.7.87]) ([10.254.7.87])
  by fmsmga001.fm.intel.com with ESMTP; 09 May 2019 21:28:04 -0700
Subject: Re: [PATCH 1/7] media: aspeed: fix a kernel warning on clk control
To:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Cc:     linux-aspeed@lists.ozlabs.org, linux-media@vger.kernel.org
References: <20190502191317.29698-1-jae.hyun.yoo@linux.intel.com>
 <20190502191317.29698-2-jae.hyun.yoo@linux.intel.com>
 <1ec7397cb164b40877839bbc90f79b5942675fdb.camel@kernel.crashing.org>
 <6e93467e-1556-3cfd-b15c-c12b6907f526@linux.intel.com>
 <3b4269d829467870f0b6adac18089b93114fcd3c.camel@kernel.crashing.org>
 <3786afed-c34d-e3f0-4cd5-620185807091@linux.intel.com>
 <b682cc6a480f2b8a5e14c5c001fa1927467d4e18.camel@kernel.crashing.org>
 <bd909078-323e-93a6-143f-0bb0f0d2229c@linux.intel.com>
 <9b9f9e0d8fdeef0749fa5fcef1647216e9a74f8c.camel@kernel.crashing.org>
 <2f21bac3-7095-a535-e964-ae24ae6e021d@linux.intel.com>
 <1b208c6b78107aeca7b68fb496466e92957b935a.camel@kernel.crashing.org>
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <2c1ee4fd-5f88-1254-608b-73ded050d3a6@linux.intel.com>
Date:   Thu, 9 May 2019 21:28:05 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <1b208c6b78107aeca7b68fb496466e92957b935a.camel@kernel.crashing.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/9/2019 8:01 PM, Benjamin Herrenschmidt wrote:
> On Thu, 2019-05-09 at 16:51 -0700, Jae Hyun Yoo wrote:
>> On 5/9/2019 4:19 PM, Benjamin Herrenschmidt wrote:
>>> On Thu, 2019-05-09 at 10:19 -0700, Jae Hyun Yoo wrote:
>>>>
>>>> Okay. Probably I need to add one another patch in this series to
>>>> address
>>>> what you pointed out.
>>>>
>>>> I have one question. I reviewed again all bitops in this driver
>>>> and
>>>> checked that some bitops are protected by a spinlock and some
>>>> others
>>>> are not. In this case, can I mix use atomic and non-atomic bitops
>>>> depend on each bitop's protection state by the spinlock? Or,
>>>> would it be
>>>> better to change all of them to bool in this case?
>>>
>>> No, if some aren't protected by a lock and some are, then they need
>>> to
>>> remain atomic.
>>>
>>> The question then becomes whether the unprotected ones are actually
>>> correct or just exposing more races.
>>
>> Got it. Not sure yet but I think the protected bitops could be moved
>> out
>> from the spinlock scope then all bitops could be kept as atomic.
> 
> Which is very likely to be extremely racy... (and gratuitously more
> costly) :-)

Okay then, will try to wrap all bitops using a single spinlock and
change all of them to non-atomic bitops. Is it right approach?

Thanks,
Jae

>>   I'll
>> look at and test this driver code more deeply again, and will submit
>> v2
>> soon.
>>
>> Again, thanks a lot for your review.
>>
>> Regards,
>> Jae
> 
