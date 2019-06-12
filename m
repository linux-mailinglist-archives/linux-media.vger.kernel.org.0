Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBEB542BD6
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2019 18:13:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409459AbfFLQNV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jun 2019 12:13:21 -0400
Received: from mga01.intel.com ([192.55.52.88]:17564 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2409458AbfFLQNV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 12:13:21 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Jun 2019 09:13:20 -0700
X-ExtLoop1: 1
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.151]) ([10.7.153.151])
  by orsmga001.jf.intel.com with ESMTP; 12 Jun 2019 09:13:20 -0700
Subject: Re: [PATCH v3 10/10] media: aspeed: add a workaround to fix a silicon
 bug
To:     Eddie James <eajames@linux.vnet.ibm.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Eddie James <eajames@linux.ibm.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-aspeed@lists.ozlabs.org, linux-media@vger.kernel.org
References: <20190531221548.14757-1-jae.hyun.yoo@linux.intel.com>
 <20190531221548.14757-11-jae.hyun.yoo@linux.intel.com>
 <38a8ca27-9991-fe8c-4d89-abdaacd4130b@linux.intel.com>
 <490d6111-32c1-f8f4-dc3c-39314446709e@xs4all.nl>
 <7486bdf6-8ab1-4e96-d5ca-b1b0f018af6b@linux.vnet.ibm.com>
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <cae799c1-0e10-791c-a74b-66bafd39184e@linux.intel.com>
Date:   Wed, 12 Jun 2019 09:13:20 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <7486bdf6-8ab1-4e96-d5ca-b1b0f018af6b@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/12/2019 8:03 AM, Eddie James wrote:
> 
> On 6/12/19 2:17 AM, Hans Verkuil wrote:
>> Eddie: ping!
>>
>> Regards,
>>
>>     Hans
>>
>> On 6/6/19 2:53 AM, Jae Hyun Yoo wrote:
>>> Hi Eddie,
>>>
>>> All patches in this series were queued to linux/media tree except this
>>> one. Can you please review this patch?
>>>
>>> Thanks,
>>> Jae
>>>
>>> On 5/31/2019 3:15 PM, Jae Hyun Yoo wrote:
>>>> AST2500 silicon revision A1 and A2 have a silicon bug which causes
>>>> extremly long capturing time on specific resolutions (1680 width).
>>>> To fix the bug, this commit adjusts the capturing window register
>>>> setting to 1728 if detected width is 1680. The compression window
>>>> register setting will be kept as the original width so output
>>>> result will be the same.

Hi Hans,

Can you please fix a typo in the commit message when you queue this
patch? Thanks in advance!

s/extremly/extremely/g

> 
> 
> Sorry, missed your followup email Jae and assumed everything was merged.
> 
> 
> Looks fine to me.
> 
> Reviewed-by: Eddie James <eajames@linux.ibm.com>

Thanks for your review Eddie!

Regards,
Jae
