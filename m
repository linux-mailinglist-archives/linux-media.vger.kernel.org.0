Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 343A32E0193
	for <lists+linux-media@lfdr.de>; Mon, 21 Dec 2020 21:33:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725820AbgLUUde (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Dec 2020 15:33:34 -0500
Received: from mga11.intel.com ([192.55.52.93]:19457 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725780AbgLUUde (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Dec 2020 15:33:34 -0500
IronPort-SDR: /8RxgycB2T9Zp3l8pZk/UZmQayDpPz3LzVVLngCX2DKojE/8Vk+PrptgXwdfoZiHBnN2Mjj3HO
 o0/nQVRH8RSw==
X-IronPort-AV: E=McAfee;i="6000,8403,9842"; a="172270212"
X-IronPort-AV: E=Sophos;i="5.78,437,1599548400"; 
   d="scan'208";a="172270212"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2020 12:31:48 -0800
IronPort-SDR: jbpk4wHi2BbEYcQvfiLDlQ0dffQ71lPrQNFpA2D+HPdRV/+ww2GY8CEgewuCh4WFAjhkuGpbOZ
 FzPmn1B6kvMw==
X-IronPort-AV: E=Sophos;i="5.78,437,1599548400"; 
   d="scan'208";a="456810261"
Received: from yoojae-mobl.amr.corp.intel.com (HELO [10.251.28.113]) ([10.251.28.113])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2020 12:31:47 -0800
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
 <d3f2d76c-40d9-b167-7002-5a25ec81c73a@linux.intel.com>
 <160842289176.1580929.13125223155803124427@swboyd.mtv.corp.google.com>
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <4b67f62c-012b-d6e9-cf98-1093175793c4@linux.intel.com>
Date:   Mon, 21 Dec 2020 12:31:46 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <160842289176.1580929.13125223155803124427@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/19/2020 4:08 PM, Stephen Boyd wrote:
> Quoting Jae Hyun Yoo (2020-12-17 11:54:15)
>> On 12/17/2020 2:46 AM, Stephen Boyd wrote:
>>> Quoting Jae Hyun Yoo (2020-12-08 09:16:29)
>>> So should the two patches be squashed together and go through the
>>> media tree?
>>>
>>
>> The first patch should go through clk tree, and the second one (this
>> patch) should go through media tree. Both patches should be applied at
>> the same time. Should I squash them in this case?
> 
> If one depends on the other, and having the first one breaks something
> unless the second one is applied, then yes they should be squashed
> together.
> 

Okay. Will send a squashed commit as v2.

Thanks,
Jae
