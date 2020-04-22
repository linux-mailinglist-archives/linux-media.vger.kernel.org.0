Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FAB81B3780
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2020 08:23:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726400AbgDVGXH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Apr 2020 02:23:07 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:15843 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726082AbgDVGXH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Apr 2020 02:23:07 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e9fe2560001>; Tue, 21 Apr 2020 23:21:10 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 21 Apr 2020 23:23:06 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 21 Apr 2020 23:23:06 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 22 Apr
 2020 06:23:06 +0000
Received: from [10.2.165.49] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 22 Apr
 2020 06:23:05 +0000
Subject: Re: [RFC PATCH v8 0/9] Add Tegra driver for video capture
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
CC:     <jonathanh@nvidia.com>, <frankc@nvidia.com>, <sakari.ailus@iki.fi>,
        <helen.koike@collabora.com>, <digetx@gmail.com>,
        <sboyd@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1587427874-3291-1-git-send-email-skomatineni@nvidia.com>
 <5c44beca-4016-6e4f-01bb-e38480bfc34b@xs4all.nl>
 <20200421205032.GD3233341@ulmo>
 <cfbd9954-6a89-3973-55f5-920b7a807774@nvidia.com>
Message-ID: <154b779e-e3f5-1322-2f10-1356402ff956@nvidia.com>
Date:   Tue, 21 Apr 2020 23:23:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <cfbd9954-6a89-3973-55f5-920b7a807774@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1587536470; bh=0MjPPOLvF0Koh9IIPl/Xwd7aLx+PTICwfRq0xHoYkQs=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=klxqohSY/6GbdZdLOXvDJjYTVGeNTxVWp+v+1HfSFIbIIlLgy+u99GTzpouOL2+6k
         LlqsO+MXDxsXOuydKKM8TDzqhnqiZF9GMo/nPjWYsZoF0m7i0U/abRDeVTpC9rFwBZ
         3LD539xao5yz/yU7fkAulH1vKYMDdUw92gPxptikBYR1ZaYdFPsvDNWvWrE5i4KYaj
         DtN9sC7pq52aflMt5NaV+3A25YdQW0aCicssTDAHOAclartwbR3Mz2mYRX6bLHiD20
         1qEbAy+wWi7eEv3XcHy7syu+TMJ5XupwkmCMFT49HFVIsriTsvuCOCkTm81DEUDucT
         XZe1gqhcQtVmQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 4/21/20 9:12 PM, Sowjanya Komatineni wrote:
>
> On 4/21/20 1:50 PM, Thierry Reding wrote:
>> On Tue, Apr 21, 2020 at 01:09:50PM +0200, Hans Verkuil wrote:
>>> Hi Sowjanya,
>>>
>>> On 21/04/2020 02:11, Sowjanya Komatineni wrote:
>>>> This series adds Tegra210 VI and CSI driver for built-in test pattern
>>>> generator (TPG) capture.
>>>>
>>>> Tegra210 supports max 6 channels on VI and 6 ports on CSI where each
>>>> CSI port is one-to-one mapped to VI channel for video capture.
>>>>
>>>> This series has TPG support only where it creates hard media links
>>>> between CSI subdevice and VI video device without device graphs.
>>>>
>>>> v4l2-compliance results are available below the patch diff.
>>> I'm ready to merge this v8. Looking at the series I should only merge
>>> patches 6 and 7, all other patches go through different subsystems, 
>>> right?
>> You could also pick up patch 5 because it adds the bindings that are
>> implemented by the driver in patch 6. But I can also pick that up into
>> the Tegra tree. In fact, I do have a set of patches to convert some
>> Tegra bindings to the new json-schema format and the host1x file is
>> among them. If I do get around to finish those up for v5.8 it might be
>> better for me to pick up patch 5 so that I can base my conversion patch
>> on top of that.
>>
>> Either way is fine with me, so I've acked the three patches. Take which
>> ones you want and I'll pick up the rest.
>>
>> Thanks again for your guidance on this patch set!
>>
>> Thierry
>
> Hi Hans,
>
> Would like to add a small fix to the driver for explicit check for vi 
> and csi availability before TPG setup and cleanup in case if video 
> driver is enabled without device tree support where vi and csi drivers 
> does not register.
>
> Although we are not enabling driver by default now, would be good to 
> have this in this series itself.
>
> Will send out the updated version, please pick v9.
>
> Thanks
>
> Sowjanya

Sorry Hans. Just sent v9 which has small fix of explicit check on csi 
and vi both channels availability before TPG setup and cleanup.

As for later Tegras (Tegra186+), CSI is not a child device to VI and in 
case if either of CSI/VI platform driver register doesn't happen this 
explicit check helps to skip TPG setup. Mostly as device tree changes go 
with driver updates, should not be real issue but in case of wrong 
compatible or missing in device tree to avoid crash added this explicit 
check.

Please consider this v9 for merge.

Thanks

Sowjanya

>
>
