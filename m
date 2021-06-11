Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 969183A3E91
	for <lists+linux-media@lfdr.de>; Fri, 11 Jun 2021 11:06:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231229AbhFKJID (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Jun 2021 05:08:03 -0400
Received: from mga17.intel.com ([192.55.52.151]:61648 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231210AbhFKJID (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Jun 2021 05:08:03 -0400
IronPort-SDR: noQx/FPKEEyWdZW4/G4mk9YlC8e008xqTa3nqxafvRcGukQ8hO3KmCcLW8wgFM+x4dMBZ0YQn+
 4C1IAMu2qpig==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="185865700"
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; 
   d="scan'208";a="185865700"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2021 02:06:05 -0700
IronPort-SDR: He+kiiJDW/aMy5hGRhObJ6XDvxRWx5U/gdIKxV9sJkfHQ9016R3pRvag24JyxSa6O+KVf0hkKJ
 oki6RZ18yMvg==
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; 
   d="scan'208";a="449047754"
Received: from mkrastex-mobl.ger.corp.intel.com (HELO [10.104.88.16]) ([10.104.88.16])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2021 02:06:02 -0700
Subject: Re: [PATCH v2 0/6] Camera Sensor Drivers
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        daniele.alessandrelli@linux.intel.com,
        paul.j.murphy@linux.intel.com, gjorgjix.rosikopulos@linux.intel.com
References: <20210527142145.173-1-martinax.krasteva@linux.intel.com>
 <20210610212751.GJ3@paasikivi.fi.intel.com>
From:   "Krasteva, Martina" <martinax.krasteva@linux.intel.com>
Message-ID: <747a5d78-2575-4d1e-f4c2-ae803a02a654@linux.intel.com>
Date:   Fri, 11 Jun 2021 10:06:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210610212751.GJ3@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thanks for the review

On 6/10/2021 10:27 PM, Sakari Ailus wrote:
> Hi Martina,
>
> On Thu, May 27, 2021 at 03:21:39PM +0100, Martina Krasteva wrote:
>> From: Martina Krasteva <martinax.krasteva@intel.com>
>>
>> Patch series contains Sony IMX335, Sony IMX412 and OmniVision OV9282
>> camera sensor drivers and respective binding documentation.
>>
>> v1->v2:
>> - define maxItems for reset-gpios in dt binding document
>> - make sure the device is powered off on remove
>> - use pm_runtime_resume_and_get() instead of pm_runtime_get_sync()
>>
>> v1: https://patchwork.kernel.org/project/linux-media/list/?series=458115
> Thanks for the update.
>
> The patches seem fine, but I noticed one problem: the analogue gain is only
> updated when exposure is set. This is a bug.
>
> Most drivers do not try to synchronise setting analogue gain and exposure
> to the same frame. Do you need that? Alternatively the control framework
> would probably need to be amended a little --- something that would have
> other benefits, too.

Analog gain and exposure are "clustered". If I understand correctly, 
when several controls are in a cluster and one/several of them are 
set/get from userspace only the first control ops is called - 
V4L2_CID_EXPOSURE in my case.

Analog gain can be set explicitly, exposure control ops will be called 
with analog gain new value and current exp. value.
Then I could have checked the is_new flag, so I can write the reg value 
just to the updated control, not to both.

In my case the userspace provides gain and exposure settings in sync so 
cluster is used to mirror that behavior.

>
> I don't think that blocks merging the drivers though. But this needs to be
> addressed.


Best Regards,
Martina

