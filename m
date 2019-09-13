Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2721B23ED
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2019 18:14:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730715AbfIMQO4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Sep 2019 12:14:56 -0400
Received: from mga06.intel.com ([134.134.136.31]:27876 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730575AbfIMQO4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Sep 2019 12:14:56 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Sep 2019 09:14:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,489,1559545200"; 
   d="scan'208";a="336937990"
Received: from unknown (HELO [10.7.153.148]) ([10.7.153.148])
  by orsmga004.jf.intel.com with ESMTP; 13 Sep 2019 09:14:55 -0700
Subject: Re: [PATCH -next 2/2] media: aspeed: set hsync and vsync polarities
 to normal before starting mode detection
To:     Andrew Jeffery <andrew@aj.id.au>,
        Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joel Stanley <joel@jms.id.au>
Cc:     linux-aspeed@lists.ozlabs.org, linux-media@vger.kernel.org,
        openbmc@lists.ozlabs.org
References: <20190910190756.31432-1-jae.hyun.yoo@linux.intel.com>
 <20190910190756.31432-3-jae.hyun.yoo@linux.intel.com>
 <5c5538e7-4b7a-4d13-b4ac-584be4090d48@www.fastmail.com>
 <490bc4d9-e471-3b0f-49c9-39e99af95d62@linux.intel.com>
 <2c24c8a9-b357-4948-8744-3900ed28012c@www.fastmail.com>
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <46c1fc35-1e9f-c08b-1c9f-ef5d82c46659@linux.intel.com>
Date:   Fri, 13 Sep 2019 09:14:55 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2c24c8a9-b357-4948-8744-3900ed28012c@www.fastmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/12/2019 5:18 PM, Andrew Jeffery wrote:
> 
> 
> On Fri, 13 Sep 2019, at 02:36, Jae Hyun Yoo wrote:
>> On 9/11/2019 10:39 PM, Andrew Jeffery wrote:
>>>
>>>
>>> On Wed, 11 Sep 2019, at 04:37, Jae Hyun Yoo wrote:
>>>> Sometimes it detects a weird resolution such as 1024x287 when the
>>>> actual resolution is 1024x768. To resolve such an issue, this
>>>> commit adds clearing for hsync and vsync polarity register bits
>>>> at the beginning of the first mode detection. This is recommended
>>>> in the datasheet.
>>>
>>> I guess this answers my question on the previous patch's commit
>>> message. Maybe it should be in both?
>>
>> I think the previous patch is a bug fix and this one is an enhancement
>> patch. Better splitting them.
> 
> I wasn't suggesting squashing the patches, I was suggesting updating
> the commit message of the first patch to better justify/explain the
> change.

Okay. Will update the commit message of the first patch.

Thanks,
Jae

