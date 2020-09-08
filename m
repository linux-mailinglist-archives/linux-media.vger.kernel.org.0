Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2062426195F
	for <lists+linux-media@lfdr.de>; Tue,  8 Sep 2020 20:13:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731791AbgIHSNW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Sep 2020 14:13:22 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:13431 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728297AbgIHSNU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Sep 2020 14:13:20 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f57c98e0000>; Tue, 08 Sep 2020 11:12:30 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 08 Sep 2020 11:13:20 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 08 Sep 2020 11:13:20 -0700
Received: from [10.2.171.137] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 8 Sep
 2020 18:13:18 +0000
Subject: Re: [PATCH v5 3/3] media: i2c: imx274: Add IMX274 power on and off
 sequence
To:     Jacopo Mondi <jacopo@jmondi.org>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <sakari.ailus@iki.fi>, <hverkuil@xs4all.nl>,
        <jacopo+renesas@jmondi.org>, <luca@lucaceresoli.net>,
        <leonl@leopardimaging.com>, <robh+dt@kernel.org>,
        <lgirdwood@gmail.com>, <broonie@kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <1599012278-10203-1-git-send-email-skomatineni@nvidia.com>
 <1599012278-10203-4-git-send-email-skomatineni@nvidia.com>
 <20200903144713.fyhmhs2bfcz5br6d@uno.localdomain>
 <094073f1-ef58-a2fd-bed4-7fa3b99dd120@nvidia.com>
 <20200904085552.5xddn2kecoktuesg@uno.localdomain>
 <5ebe8d22-86fb-7bf2-ab19-e729caf8d88f@nvidia.com>
 <20200907074854.uxq4a76k5amjfopi@uno.localdomain>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <e25e0537-f723-abfb-fd84-b74b0283c16d@nvidia.com>
Date:   Tue, 8 Sep 2020 11:13:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200907074854.uxq4a76k5amjfopi@uno.localdomain>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1599588750; bh=v0oEvFN4sVVTaf28ZaWjZlHZQyMojiy8rT7wrNRNgFo=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=CdS9t7nffzVjIWFzTDV62nY10cM3BSKRzMIs5DxNV/h89pfFBcqGbdhiPDlgl54km
         WIcX67UgeYUjEpDTvjz5zum1vI5L+qByhdNwbp2tp9kvJ/ST0eq3DB2cRRDZq93Zgt
         LvVGcrxSTcMDk5wPMYOXDu0X2LSapZEbFixMVMZ/S4sVyhARvckVDCHBj0qfWAcWMN
         cNoVI65rrNTFQ0iwpCxtAdRQb8ElnPYSAiENJxdi6o1E5A6dltAPO9l7i57xBMFXis
         bj+1K3LPieni8cHFGzbwaci9mz3VZitTNE3CJSiMVcxNRUEwgkliXiWndL1itjFUUi
         v3m0LiByqiLVg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 9/7/20 12:48 AM, Jacopo Mondi wrote:
> Hello,
>
> On Fri, Sep 04, 2020 at 10:04:10AM -0700, Sowjanya Komatineni wrote:
>> On 9/4/20 1:55 AM, Jacopo Mondi wrote:
>>>>> usleep_range() allows you to provide an interval in which your timeout
>>>>> can be coalesced with others. Giving a [1usec, 2usec] range kind of
>>>>> defeat the purpose. And most than everything, does sleeping for 2usec
>>>>> serve any real purpose ?
>>>> Following delay recommendation from DS for power on sequence.
>>>>
>>> 2 useconds ? Seems very short:)
>>>
>> As per IMX274 datasheet for power on sequence, 100ns is the min wait time
>> after the last power supply of 1v8/1v2/2v8 is ON before releasing RESET
>> high.
> ook.. well, it's actually reasonable, it's just the time for the
> regulators to ramp up, I initially thought it was the time for the
> chip to exit reset.
>
> Let me be a bit more picky and ask if you have considered busy waiting
> on such a small sleep interval by using udelay. Again, as this happens
> at chip power on only, the impact on the system of mis-using
> usleep_range() is negligible, but according to documentation:
>
> 	SLEEPING FOR "A FEW" USECS ( < ~10us? ):
> 		* Use udelay
>
> 		- Why not usleep?
> 			On slower systems, (embedded, OR perhaps a speed-
> 			stepped PC!) the overhead of setting up the hrtimers
> 			for usleep *may* not be worth it. Such an evaluation
> 			will obviously depend on your specific situation, but
> 			it is something to be aware of.
>
> Up to you, really!
>
> Thanks
>    j
Thanks Jacopo. Will update in v6 to use udelay.
