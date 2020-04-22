Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1A081B3608
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2020 06:12:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726505AbgDVEMu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Apr 2020 00:12:50 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:2939 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725968AbgDVEMu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Apr 2020 00:12:50 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e9fc4350001>; Tue, 21 Apr 2020 21:12:37 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 21 Apr 2020 21:12:50 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 21 Apr 2020 21:12:50 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 22 Apr
 2020 04:12:49 +0000
Received: from [10.2.165.49] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 22 Apr
 2020 04:12:48 +0000
Subject: Re: Re: [RFC PATCH v8 0/9] Add Tegra driver for video capture
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
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <cfbd9954-6a89-3973-55f5-920b7a807774@nvidia.com>
Date:   Tue, 21 Apr 2020 21:12:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200421205032.GD3233341@ulmo>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1587528757; bh=e1UDRc9LEWdDQqaH6RNlYU5o4VaoyIvF1ybwOVa69Y0=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=J4tOajztaOIXIOdr2cQJxAyPjXsnlchY3FCd7y0FRaKBWMCKFzfzbEFSh4uf6AbID
         3zIouYXEl2IZ4TXHwg2+hlnhxjsfQe9J2Uu6do5hnn+FoofcNvcR2tB5FFyYcPrKO9
         aycILuMg9uvUPxG647Kb082qLwc94hTDyznYVHQab4Fd6ti+s5RDenr52//WmL+g5K
         kVy+cC29xWw5zT15mnze/LZnq72S6Hazek0o+k2FJuzSrBz0jAReohMGN87jqUo0gq
         KtKQQr5zsAfMEb5eSr+Z7Z2YxNeOwEBUcCesIeDlNizzSdrtfLQjvxTxOGyNcI/U7z
         dE7AH2VqS0NTg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 4/21/20 1:50 PM, Thierry Reding wrote:
> On Tue, Apr 21, 2020 at 01:09:50PM +0200, Hans Verkuil wrote:
>> Hi Sowjanya,
>>
>> On 21/04/2020 02:11, Sowjanya Komatineni wrote:
>>> This series adds Tegra210 VI and CSI driver for built-in test pattern
>>> generator (TPG) capture.
>>>
>>> Tegra210 supports max 6 channels on VI and 6 ports on CSI where each
>>> CSI port is one-to-one mapped to VI channel for video capture.
>>>
>>> This series has TPG support only where it creates hard media links
>>> between CSI subdevice and VI video device without device graphs.
>>>
>>> v4l2-compliance results are available below the patch diff.
>> I'm ready to merge this v8. Looking at the series I should only merge
>> patches 6 and 7, all other patches go through different subsystems, right?
> You could also pick up patch 5 because it adds the bindings that are
> implemented by the driver in patch 6. But I can also pick that up into
> the Tegra tree. In fact, I do have a set of patches to convert some
> Tegra bindings to the new json-schema format and the host1x file is
> among them. If I do get around to finish those up for v5.8 it might be
> better for me to pick up patch 5 so that I can base my conversion patch
> on top of that.
>
> Either way is fine with me, so I've acked the three patches. Take which
> ones you want and I'll pick up the rest.
>
> Thanks again for your guidance on this patch set!
>
> Thierry

Hi Hans,

Would like to add a small fix to the driver for explicit check for vi 
and csi availability before TPG setup and cleanup in case if video 
driver is enabled without device tree support where vi and csi drivers 
does not register.

Although we are not enabling driver by default now, would be good to 
have this in this series itself.

Will send out the updated version, please pick v9.

Thanks

Sowjanya


