Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B448B2C37F3
	for <lists+linux-media@lfdr.de>; Wed, 25 Nov 2020 05:16:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726477AbgKYENw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 23:13:52 -0500
Received: from mga01.intel.com ([192.55.52.88]:11761 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726039AbgKYENw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 23:13:52 -0500
IronPort-SDR: Vzx/2VIthfBLn7U0hXNTflnipNJXgUd0fRBLyvSY6n2a8SZt6DjXi6n23GEyqbud2ekAVdRZyA
 3kL67hKpCGIg==
X-IronPort-AV: E=McAfee;i="6000,8403,9815"; a="190197757"
X-IronPort-AV: E=Sophos;i="5.78,368,1599548400"; 
   d="scan'208";a="190197757"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2020 20:13:52 -0800
IronPort-SDR: 7RWNUNsw3OWCgMhVvjYE95BN2rhV8aUOIcuXCoo8xXcO/6EmmNUPF86MrCjrUnlzFuozMSo2+E
 9oAALJJPBYOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,368,1599548400"; 
   d="scan'208";a="362175730"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.196]) ([10.238.232.196])
  by fmsmga004.fm.intel.com with ESMTP; 24 Nov 2020 20:13:50 -0800
Subject: Re: [PATCH] media: ov8856: Remove 3280x2464 mode
To:     Robert Foss <robert.foss@linaro.org>
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Ben Kao <ben.kao@intel.com>
References: <20201116155008.118124-1-robert.foss@linaro.org>
 <cf0b935d-3ccd-8360-1b52-89fab0b181eb@linux.intel.com>
 <CAG3jFyssMMHpi4WgWmeDjuVYKz12UwJoBT0WoOsdB4PZxnuqSw@mail.gmail.com>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <e132769f-cfb5-141a-6cd1-603d82a92b9e@linux.intel.com>
Date:   Wed, 25 Nov 2020 12:11:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAG3jFyssMMHpi4WgWmeDjuVYKz12UwJoBT0WoOsdB4PZxnuqSw@mail.gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 11/24/20 6:20 PM, Robert Foss wrote:
> On Tue, 24 Nov 2020 at 10:42, Bingbu Cao <bingbu.cao@linux.intel.com> wrote:
>>
>> Hi, Robert
>>
>> I remember that the full size of ov8856 image sensor is 3296x2480 and we can get the 3280x2464
>> frames based on current settings.
>>
>> Do you have any issues with this mode?
> 
> As far as I can tell using the 3280x2464 mode actually yields an
> output resolution that is 3264x2448.
> 
> What does your hardware setup look like? And which revision of the
> sensor are you using?
> 

Robert, the sensor revision I am using is v1.1. I just checked the actual output pixels on our
hardware, the output resolution with 2464 mode is 3280x2464, no black pixels.

As Tomasz said, some ISP has the requirement of extra pixel padding, From the ov8856 datasheet,
the central 3264x2448 pixels are *suggested* to be output from the pixel array and the boundary
pixels can be used for additional processing. In my understanding, the 32 dummy lines are not
black lines.

-- 
Best regards,
Bingbu Cao
