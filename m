Return-Path: <linux-media+bounces-26393-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91824A3C243
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 15:36:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 02B8E7A6765
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 14:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 415A91F2B88;
	Wed, 19 Feb 2025 14:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="un/2wA9v"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046521EFFA7;
	Wed, 19 Feb 2025 14:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739975794; cv=none; b=tLxSCZVeBnBwbSwQI3OrlOaFyWeAQOWLjNz0bKe8K/Z1iDzpc2JKGPbTFWwGhNS3T2IZT6k/7M0wZtmmLG2FTXw/OSiJgWoYZxG1OIbwRA0lBrkZ1yFI2TQrtL0ccXHq0N0gyFwb36hiauMIJAUelIryEQUS1LlBOliIB1EBfk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739975794; c=relaxed/simple;
	bh=S1wEomMubQ8Qzsz3uiF2/eE26D5d+ws1NBpGm2b8xUQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=riR14rAU6LOLER4V4tntr16Bji40/kV9GFnAlI8WtBu2rC84PcGzldfzkA/F0vMCo3nG3d22wLaIDiLOYhpKwUX6zO65PFoedTzuLwYLuL7xoh2Wvblfj3GCz0+wPwSRguQL8SdRSEt4Lj4P4CjKnyGGWNWF//uLsuanlOZxm5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=un/2wA9v; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 093FA514;
	Wed, 19 Feb 2025 15:35:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739975707;
	bh=S1wEomMubQ8Qzsz3uiF2/eE26D5d+ws1NBpGm2b8xUQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=un/2wA9v80jUXrd1C9rzwYK5oYYbd0CGkrKc9oqPlDHWc52ac6vTqjVweEJIyu4+d
	 J/V/H6RYNVckCh2Jfny6zzLAxnB5A/DGdRA3ZFR/4XLehopYp7AIs9RBozBf3WB2mN
	 n7x0Vz4sPolQqWxmOzWmw5cizKM+wUzE3fnh2hpA=
Message-ID: <458fd743-e6d6-475d-9da8-121c7d1a6bb4@ideasonboard.com>
Date: Wed, 19 Feb 2025 16:36:27 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/18] media: rcar-csi2: Fix typo
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
References: <20250219-rcar-streams-v1-0-f1b93e370aab@ideasonboard.com>
 <20250219-rcar-streams-v1-7-f1b93e370aab@ideasonboard.com>
 <20250219142459.GB512344@ragnatech.se>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <20250219142459.GB512344@ragnatech.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 19/02/2025 16:24, Niklas Söderlund wrote:
> Hi Tomi,
> 
> On 2025-02-19 15:49:01 +0200, Tomi Valkeinen wrote:
>> Fix typo with variable name 'msps'.
> 
> FWIW, this is not a typo, C-PHY uses symbols per seconds, not bits per
> second.

Hmm, but the code calls rcsi2_calc_mbps() and uses the returned value as 
msps. How can that be right, if it's symbols?

  Tomi

>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>> ---
>>   drivers/media/platform/renesas/rcar-csi2.c | 10 +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
>> index 845fb3e155f1..92697ea3df01 100644
>> --- a/drivers/media/platform/renesas/rcar-csi2.c
>> +++ b/drivers/media/platform/renesas/rcar-csi2.c
>> @@ -1301,7 +1301,7 @@ static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv,
>>   	const struct rcar_csi2_format *format;
>>   	const struct v4l2_mbus_framefmt *fmt;
>>   	unsigned int lanes;
>> -	int msps;
>> +	int mbps;
>>   	int ret;
>>   
>>   	/* Use the format on the sink pad to compute the receiver config. */
>> @@ -1314,9 +1314,9 @@ static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv,
>>   	if (ret)
>>   		return ret;
>>   
>> -	msps = rcsi2_calc_mbps(priv, format->bpp, lanes);
>> -	if (msps < 0)
>> -		return msps;
>> +	mbps = rcsi2_calc_mbps(priv, format->bpp, lanes);
>> +	if (mbps < 0)
>> +		return mbps;
>>   
>>   	/* Reset LINK and PHY*/
>>   	rcsi2_write(priv, V4H_CSI2_RESETN_REG, 0);
>> @@ -1352,7 +1352,7 @@ static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv,
>>   	rcsi2_write16(priv, V4H_PPI_RW_COMMON_CFG_REG, 0x0003);
>>   
>>   	/* C-PHY settings */
>> -	ret = rcsi2_c_phy_setting_v4h(priv, msps);
>> +	ret = rcsi2_c_phy_setting_v4h(priv, mbps);
>>   	if (ret)
>>   		return ret;
>>   
>>
>> -- 
>> 2.43.0
>>
> 


