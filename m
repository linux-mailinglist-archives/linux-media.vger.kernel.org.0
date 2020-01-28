Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C49DE14C1DC
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2020 22:04:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726266AbgA1VEM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jan 2020 16:04:12 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:12793 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726143AbgA1VEL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jan 2020 16:04:11 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e30a1bc0000>; Tue, 28 Jan 2020 13:03:56 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 28 Jan 2020 13:04:10 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 28 Jan 2020 13:04:10 -0800
Received: from [10.2.164.115] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 Jan
 2020 21:04:10 +0000
Subject: Re: [RFC PATCH v1 3/5] dt-binding: tegra: Add VI and CSI bindings
To:     Helen Koike <helen.koike@collabora.com>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <frankc@nvidia.com>, <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <1580235801-4129-1-git-send-email-skomatineni@nvidia.com>
 <1580235801-4129-4-git-send-email-skomatineni@nvidia.com>
 <ee1e61bc-918d-8f9c-592d-f9e63322a1c0@collabora.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <00e429fa-05aa-e95d-05a4-e5a1be739796@nvidia.com>
Date:   Tue, 28 Jan 2020 13:04:09 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <ee1e61bc-918d-8f9c-592d-f9e63322a1c0@collabora.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1580245436; bh=6ucVfsoMKmLc2n1n78QOE62mD4eBar17gmTO8NpM2XI=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=X0cccaeeBDusden5FgTVAvaIWyByM5aE+OMR1dm0hNHpmm4tLb/bAWbqQdmDw2Us5
         NHeLTqpPIqKCcbWamKsNg22RPTvaBQBhBtMn0UY6gNmp4h6SRLXfCVPESaxKJ2nPJB
         n22Wl6W9pbbPFZTER8MkhNtov+fWf5/E+LVOqXUo/F8QoniY+lBt4CcJJeWJW/UI4Z
         juZ8kP2KGZ2z5tvkFspsBfdpv/hK5PXtRlQ+oPpjVQ5AHnPQYTifX99RsdHUSXerFY
         ESLiuTfPBm5V4iMFDXN/nOQ+OxXOOe6w9Ea275ACgvRP/1KGegRpend25t5dx+8y19
         7wjHCMTHk/4/Q==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 1/28/20 12:32 PM, Helen Koike wrote:
> External email: Use caution opening links or attachments
>
>
> Hi,
>
> On 1/28/20 4:23 PM, Sowjanya Komatineni wrote:
>> Tegra contains VI controller which can support up to 6 MIPI CSI
>> camera sensors.
>>
>> Each Tegra CSI port from CSI unit can be one-to-one mapper to
>> VI channel and can capture from an external camera sensor or
>> from built-in test pattern generator.
>>
>> This patch adds dt-bindings for Tegra VI and CSI.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>   .../bindings/display/tegra/nvidia,tegra20-host1x.txt           | 10 +++++++++-
>>   1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
>> index 9999255ac5b6..47cd6532b7d3 100644
>> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
>> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
>> @@ -40,7 +40,7 @@ of the following host1x client modules:
>>
>>     Required properties:
>>     - compatible: "nvidia,tegra<chip>-vi"
>> -  - reg: Physical base address and length of the controller's registers.
>> +  - reg: Physical base address and length of the controller registers.
>>     - interrupts: The interrupt outputs from the controller.
>>     - clocks: Must contain one entry, for the module clock.
>>       See ../clocks/clock-bindings.txt for details.
>> @@ -49,6 +49,14 @@ of the following host1x client modules:
>>     - reset-names: Must include the following entries:
>>       - vi
>>
>> +- csi: mipi csi interface to vi
>> +
>> +  Required properties:
>> +  - compatible: "nvidia,tegra<chip>-csi"
>> +  - reg: Physical base address and length of the controller registers.
>> +  - clocks: Must contain entries csi, cilab, cilcd, cile clocks.
>> +    See ../clocks/clock-bindings.txt for details.
>> +
> I think it would be nice to add an example, in the Example section at the end of this file, same as other modules do.
>
> Regards,
> Helen
Thanks Helen. Will add in v2.
>
>>   - epp: encoder pre-processor
>>
>>     Required properties:
>>
