Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 963EBB1327
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2019 19:04:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731054AbfILRER (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Sep 2019 13:04:17 -0400
Received: from mga17.intel.com ([192.55.52.151]:13838 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728286AbfILRER (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Sep 2019 13:04:17 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Sep 2019 10:04:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,492,1559545200"; 
   d="scan'208";a="190048964"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.148]) ([10.7.153.148])
  by orsmga006.jf.intel.com with ESMTP; 12 Sep 2019 10:04:16 -0700
Subject: Re: [PATCH -next 1/2] media: aspeed: refine hsync/vsync polarity
 setting logic
To:     Andrew Jeffery <andrew@aj.id.au>,
        Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joel Stanley <joel@jms.id.au>
Cc:     linux-aspeed@lists.ozlabs.org, linux-media@vger.kernel.org,
        openbmc@lists.ozlabs.org
References: <20190910190756.31432-1-jae.hyun.yoo@linux.intel.com>
 <20190910190756.31432-2-jae.hyun.yoo@linux.intel.com>
 <a11026fa-f2bb-47a2-b792-6009c2bbe63d@www.fastmail.com>
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <564501a5-f4db-b1ed-76b5-9e76c29aa7d4@linux.intel.com>
Date:   Thu, 12 Sep 2019 10:04:16 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a11026fa-f2bb-47a2-b792-6009c2bbe63d@www.fastmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andrew,

On 9/11/2019 10:33 PM, Andrew Jeffery wrote:
> On Wed, 11 Sep 2019, at 04:37, Jae Hyun Yoo wrote:
>> This commit refines hsync/vsync polarity setting logic by making
>> also clearing register bits possible based on probed sync state
>> accordingly.
> 
> That was tough to parse, but I think I understand. Trying to rephrase:
> 
> Enable clearing of hsync/vsync plarity bits based on probed sync state.

Correct.

> What was the issue that drove the change? Do you know why it was done
> the way it was prior to this patch?

Because this driver detects weird resolutions sometimes. Investigated
that it uses
     aspeed_video_update(video, VE_CTRL, 0, ctrl);
so only setting of polarity bits is available. Means that clearing of
the bits isn't available so it can't set back the polarities to normal.

To fix the issue, this patch makes it use
     aspeed_video_write(video, VE_CTRL, ctrl);
instead of above one with adding bit masking code changes.

Thanks,
Jae
