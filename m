Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA1BF2DD991
	for <lists+linux-media@lfdr.de>; Thu, 17 Dec 2020 20:56:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729070AbgLQT4J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Dec 2020 14:56:09 -0500
Received: from mga07.intel.com ([134.134.136.100]:34787 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727543AbgLQT4I (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Dec 2020 14:56:08 -0500
IronPort-SDR: UHrMB/LB05hfibUgkd+5ICuJuueUzuIpWp/bMvLlkfoc6HzainXl2DXpDuestT2SlYhjT2zh2n
 dOmnBJUUyzcw==
X-IronPort-AV: E=McAfee;i="6000,8403,9838"; a="239411631"
X-IronPort-AV: E=Sophos;i="5.78,428,1599548400"; 
   d="scan'208";a="239411631"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2020 11:54:22 -0800
IronPort-SDR: FZ2N9ds8QEC0kE8o1hMo8/m1rRrLolO5/ePaqGLg0htBqC3Av5dnv+wi948si0iPkjyWbf+UEx
 /jTymnde4piA==
X-IronPort-AV: E=Sophos;i="5.78,428,1599548400"; 
   d="scan'208";a="413599052"
Received: from yoojae-mobl.amr.corp.intel.com (HELO [10.254.113.190]) ([10.254.113.190])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2020 11:54:21 -0800
Subject: Re: [PATCH 2/2] media: aspeed: fix clock handling logic
To:     Stephen Boyd <sboyd@kernel.org>, Joel Stanley <joel@jms.id.au>
Cc:     linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Michael Turquette <mturquette@baylibre.com>,
        Eddie James <eajames@linux.ibm.com>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-clk@vger.kernel.org, linux-media@vger.kernel.org
References: <20201207164240.15436-1-jae.hyun.yoo@linux.intel.com>
 <20201207164240.15436-3-jae.hyun.yoo@linux.intel.com>
 <CACPK8Xd3dz1WLGNGqMiAZxhMEeGHbkPtvO2rYQ36Kbj=Uvy-jA@mail.gmail.com>
 <d3faea9e-e7d6-eba0-a6b2-c30bc9b6e147@linux.intel.com>
 <160820199393.1580929.9806429719720580479@swboyd.mtv.corp.google.com>
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <d3f2d76c-40d9-b167-7002-5a25ec81c73a@linux.intel.com>
Date:   Thu, 17 Dec 2020 11:54:15 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <160820199393.1580929.9806429719720580479@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stephen,

On 12/17/2020 2:46 AM, Stephen Boyd wrote:
> Quoting Jae Hyun Yoo (2020-12-08 09:16:29)
>> Hi Joel,
>>
>> On 12/7/2020 6:39 PM, Joel Stanley wrote:
>>> On Mon, 7 Dec 2020 at 16:33, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>>>>
>>>> Video engine uses eclk and vclk for its clock sources and its reset
>>>> control is coupled with eclk so the current clock enabling sequence works
>>>> like below.
>>>>
>>>>    Enable eclk
>>>>    De-assert Video Engine reset
>>>>    10ms delay
>>>>    Enable vclk
>>>
>>> This is the case after " clk: ast2600: fix reset settings for eclk and
>>> vclk" is applied, correct? Without that patch applied the reset
>>> sequence is correct by accident for the 2600, but it will be wrong for
>>> the 2500?
>>
>> Correct. Video Engine reset was coupled with eclk for AST2500 and vclk
>> for AST2600 so above sequence was observed only in AST2500. As you said,
>> AST2600 didn't make the issue by accident but the clk/reset pair should
>> be fixed by this patch series.
> 
> So should the two patches be squashed together and go through the
> media tree?
> 

The first patch should go through clk tree, and the second one (this
patch) should go through media tree. Both patches should be applied at
the same time. Should I squash them in this case?
