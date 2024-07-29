Return-Path: <linux-media+bounces-15449-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDCA93F4DC
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 14:06:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF9501C2161C
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 12:06:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B09F146A9B;
	Mon, 29 Jul 2024 12:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hkhheSnn"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0653145B37;
	Mon, 29 Jul 2024 12:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722254780; cv=none; b=hq0ZWIOYxx3SEFQMWzXz3T4yR/ufKLfItICAOI65PGnda2684Bp8cRSqbB9VKyaaXnCtc+eU+afyzFgr4uKTT57Si/ChgJxdvYLTBm9+0IAyWojqDglxEAeVpyW0hKVcW9xoA9lUxaLshZ0N/ZpqDpf9rfrM4rYjbcw4QQrRZi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722254780; c=relaxed/simple;
	bh=RelaqKDsjyfEAbhB5AiPyJ8qMD72m5Y657aORRZCsZM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t7+Enw+UYkccQ3iD08UgzonK2DZkPerkgNTD9/VgfNUf7GKMgyl1XZeITXHBs667a8RU0e3U6N6Obllu8eJxkSj9tVQ3pA3zjdtwUW0g7Ua13W19BcTZp5uJZeWIoNQbQW43c1wjUbYEPq1ZBaRPFQ77DyoORSVNQISXL6i7b4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hkhheSnn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [IPV6:2405:201:2015:f873:55d7:c02e:b2eb:ee3f] (unknown [IPv6:2405:201:2015:f873:55d7:c02e:b2eb:ee3f])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E74033E;
	Mon, 29 Jul 2024 14:05:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722254730;
	bh=RelaqKDsjyfEAbhB5AiPyJ8qMD72m5Y657aORRZCsZM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hkhheSnn0jXDF+9dKqBVO8Idr372g+vSnHSyX7JHMamB1j4J7kE6gJoFU4/zGUITn
	 AoCYNMULQdMS3Yo9kf8LfM1FkEIGl5e67T78cNfGioH/hKntSHxD4fymLc68gpyLZC
	 PCEVR1E2IMKYcVb2nvvXaFaQ55fIVVVbwAmld4Y4=
Message-ID: <2238e3e8-56f9-45e1-bd66-85953e091eb8@ideasonboard.com>
Date: Mon, 29 Jul 2024 17:36:11 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: imx335: Mention reset-gpio polarity
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, stable@vger.kernel.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
References: <20240729110437.199428-1-umang.jain@ideasonboard.com>
 <20240729110437.199428-2-umang.jain@ideasonboard.com>
 <20240729111006.GH2320@pendragon.ideasonboard.com>
Content-Language: en-US
From: Umang Jain <umang.jain@ideasonboard.com>
In-Reply-To: <20240729111006.GH2320@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Laurent,

On 29/07/24 4:40 pm, Laurent Pinchart wrote:
> Hi Umang,
>
> Thank you for the patch.
>
> On Mon, Jul 29, 2024 at 04:34:36PM +0530, Umang Jain wrote:
>> Mention the reset-gpio polarity in the device tree bindings.
>> It is GPIO_ACTIVE_LOW according to the datasheet.
>>
>> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
>> ---
>>   Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
>> index 106c36ee966d..fb4c9d42ed1c 100644
>> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
>> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
>> @@ -92,6 +92,8 @@ examples:
>>               ovdd-supply = <&camera_vddo_1v8>;
>>               dvdd-supply = <&camera_vddd_1v2>;
>>   
>> +            reset-gpios = <&gpio 50 GPIO_ACTIVE_LOW>;
>> +
> I think it's good to include this in the example, but it doesn't match
> the commit message. I was expecting to see a change to the binding
> rules, not to the example.

Currently the binding already states reset-gpio as

```
   reset-gpios:
     description: Reference to the GPIO connected to the XCLR pin, if any.
     maxItems: 1
```

Pardon my limited knowledge here, do you mean something like :

```
   reset-gpios:
     description: Reference to the GPIO connected to the XCLR pin 
(active LOW), if any.
     maxItems: 1
```

or something else?
>
>>               port {
>>                   imx335: endpoint {
>>                       remote-endpoint = <&cam>;


