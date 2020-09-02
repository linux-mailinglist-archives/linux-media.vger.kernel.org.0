Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E96AA25A5D3
	for <lists+linux-media@lfdr.de>; Wed,  2 Sep 2020 08:52:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726567AbgIBGw0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Sep 2020 02:52:26 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:59917 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726144AbgIBGwZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Sep 2020 02:52:25 -0400
Received: from [88.147.20.154] (port=44912 helo=[192.168.77.66])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <luca@lucaceresoli.net>)
        id 1kDMd5-000Com-EF; Wed, 02 Sep 2020 08:52:23 +0200
Subject: Re: [PATCH v5 2/3] dt-bindings: media: imx274: Add optional input
 clock and supplies
From:   Luca Ceresoli <luca@lucaceresoli.net>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        sakari.ailus@iki.fi, hverkuil@xs4all.nl, jacopo+renesas@jmondi.org,
        leonl@leopardimaging.com, robh+dt@kernel.org, lgirdwood@gmail.com,
        broonie@kernel.org
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1599012278-10203-1-git-send-email-skomatineni@nvidia.com>
 <1599012278-10203-3-git-send-email-skomatineni@nvidia.com>
 <7ce6003c-a27d-5831-66a1-832db0114188@lucaceresoli.net>
Message-ID: <09270110-39ca-7232-0848-c5c338de8552@lucaceresoli.net>
Date:   Wed, 2 Sep 2020 08:52:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7ce6003c-a27d-5831-66a1-832db0114188@lucaceresoli.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi again...

On 02/09/20 08:46, Luca Ceresoli wrote:
> Hi Sowjanya,
> 
> On 02/09/20 04:04, Sowjanya Komatineni wrote:
>> This patch adds IMX274 optional external clock input and voltage
>> supplies to device tree bindings.
>>
>> Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>  .../devicetree/bindings/media/i2c/sony,imx274.yaml  | 21 +++++++++++++++++++++
>>  1 file changed, 21 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml
>> index 7ae47a6..57e7176 100644
>> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml
>> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml
>> @@ -25,6 +25,27 @@ properties:
>>    reset-gpios:
>>      maxItems: 1
>>  
>> +  clocks:
>> +    maxItems: 1
>> +    description: Reference to the sensor input clock
>> +
>> +  clock-names:
>> +    maxItems: 1
>> +    items:
>> +      - const: inck
> 
> I think this can be simpler:
> 
>   clock-names:
>     maxItems: 1
>     items:
>       - const: inck

Which is equal to the original... copy-paste-and-forgot.

Here's the simplified form, for real:

  clocks:
    maxItems: 1
  clock-names:
    const: inck

As in:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml?h=v5.9-rc3#n90


-- 
Luca
