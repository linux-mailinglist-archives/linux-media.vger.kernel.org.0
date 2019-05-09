Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B93BF18ED1
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2019 19:19:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726866AbfEIRT3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 May 2019 13:19:29 -0400
Received: from mga07.intel.com ([134.134.136.100]:28232 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726864AbfEIRT3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 9 May 2019 13:19:29 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 May 2019 10:19:28 -0700
X-ExtLoop1: 1
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.148]) ([10.7.153.148])
  by orsmga007.jf.intel.com with ESMTP; 09 May 2019 10:19:30 -0700
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
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <bd909078-323e-93a6-143f-0bb0f0d2229c@linux.intel.com>
Date:   Thu, 9 May 2019 10:19:28 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <b682cc6a480f2b8a5e14c5c001fa1927467d4e18.camel@kernel.crashing.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/8/2019 7:16 PM, Benjamin Herrenschmidt wrote:
> On Wed, 2019-05-08 at 18:19 -0700, Jae Hyun Yoo wrote:
>> I changed that from a bool because the maintainer of this code, Eddie
>> doesn't like adding of an additional flag. I'll change it back with
>> codes in the first submit:
>> https://www.spinics.net/lists/linux-media/msg148955.html
>>
>> Eddie,
>> Please let me know if you have any objection on that.
> 
> Ok, so random flags ... ugh.
> 
> Well, you can approach it either way. Have them all be bitops or all be
> bool.
> 
> The tricky thing however is that if they are bitops you need to ensure
> that they are *all* manipulated under the same lock. If not you have to
> use the atomic bitops variants.
> 
> The reason I don't like that is that experience shows that most uses of
> such atomic variants in drivers usually are failed attempts at papering
> over broken locking.
> 
> If everything is covered by a lock, then using the non-atomic versions
> is more efficient, but so is using bool (optionally with :1 bitfield
> qualifiers to avoid wasting memory), which from a pure C language
> perspective I think is more expressive of what you are doing and more
> readable.

Okay. Probably I need to add one another patch in this series to address
what you pointed out.

I have one question. I reviewed again all bitops in this driver and
checked that some bitops are protected by a spinlock and some others
are not. In this case, can I mix use atomic and non-atomic bitops
depend on each bitop's protection state by the spinlock? Or, would it be
better to change all of them to bool in this case?

Thanks,
Jae

> 
> Cheers,
> Ben.
> 
