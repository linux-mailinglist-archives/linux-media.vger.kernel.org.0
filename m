Return-Path: <linux-media+bounces-7113-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAEF87CA66
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 10:07:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0192C282614
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 09:07:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2713517BA3;
	Fri, 15 Mar 2024 09:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="CbceiDz9"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB77175B6;
	Fri, 15 Mar 2024 09:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710493622; cv=none; b=f9mTWq2oY1H2qNT6GM2EV4LPnXH/Vlm+IpHDVp2AZX3sJj/HO78NOeuBh33w7FiU1kKjmq319XrecFH7Se9Z1KjfObGvWu4v4ycj5UjsOvDpaXtavXoG223mLUwXoZs0vjKhfDZ462DJknxLpg3gGah0N6oO3PDItFdc9DB2GI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710493622; c=relaxed/simple;
	bh=1Ws2PEVK12K1rvEMVWjC/34838lGqG3dLqUeO2pdz+A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eYAuQAdzZI4sy84swY5kPtEvjqRQ+lqFu62kJVIiH/5+ywLugkHVrRULutl161ErpdvtWzJCrqzOKMVp3zOvtrMjAE1fKsyFdVmt/eLks4UXeCuPB2mWQlHW+VbAryu0UDmpWiDDox3fNoqmepeHCzUsvVgQRQdey+dqyu8DhWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=CbceiDz9; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710493619;
	bh=1Ws2PEVK12K1rvEMVWjC/34838lGqG3dLqUeO2pdz+A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CbceiDz9vEHtKvvnLHkZh7m6vWGvOiQRZzqqvEocRAFhUVwPxrH36ADybMY7n/HFP
	 Z8j1ZfcKnYljNJBSX+RDeDYY20Gxu6M+mrdGeVdFvsxc1B6OQwp00bj6S6pg/pXkrP
	 CyT+vt3AiRyWnIGzBw6RfsVD6j5RLUxZtcQS8jfRADgBBDcvgjhj3zobVtX8XCfNv2
	 TSY1vFgd0ks45tLxuzIejUnmgz1S4wY0OFv+qVmVGse8ShF8KQXhHXI2RM1D8gtW3g
	 dhtYr6mzy2XHwnA5gAyx75lq/tqZCZpdM1U8PrXm8McfGRPk/dLYMr9e6KZdbLMgn4
	 qG9GNYWIQHWTQ==
Received: from [100.74.67.65] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id C65F537820FF;
	Fri, 15 Mar 2024 09:06:58 +0000 (UTC)
Message-ID: <fa53c31c-b76a-4370-9660-96f3d6155ffe@collabora.com>
Date: Fri, 15 Mar 2024 10:06:57 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: dt-bindings: st-vgxy61: relax data-lanes
 restriction
Content-Language: en-US
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Conor Dooley <conor@kernel.org>
Cc: sylvain.petinot@foss.st.com, mchehab@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 kernel@collabora.com, devicetree@vger.kernel.org, linux-media@vger.kernel.org
References: <20231213071737.1070162-1-julien.massot@collabora.com>
 <20231213-chest-turf-8e9c4fb0a3db@spud>
 <aa478429-57f6-40f8-8481-269311fdc937@collabora.com>
 <4bffed14-0edf-49a6-8bbb-cc122137e9de@foss.st.com>
From: Julien Massot <julien.massot@collabora.com>
In-Reply-To: <4bffed14-0edf-49a6-8bbb-cc122137e9de@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Benjamin,

On 2/9/24 10:24, Benjamin Mugnier wrote:
> Hi Julien,
> 
> On 1/5/24 10:36, Julien Massot wrote:
>> Hi,
>>
>> On 12/13/23 17:30, Conor Dooley wrote:
>>> On Wed, Dec 13, 2023 at 08:17:37AM +0100, Julien Massot wrote:
>>>> The ST VGXY61 sensors support multiple lane number, as
>>>> well as lane mapping.
>>>>
>>>> Signed-off-by: Julien Massot <julien.massot@collabora.com>
>>>> ---
>>>>    .../devicetree/bindings/media/i2c/st,st-vgxy61.yaml        | 7 ++-----
>>>>    1 file changed, 2 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git
>>>> a/Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml
>>>> b/Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml
>>>> index 8c28848b226a..733fac85a20f 100644
>>>> --- a/Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml
>>>> +++ b/Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml
>>>> @@ -67,11 +67,8 @@ properties:
>>>>              data-lanes:
>>>>                description:
>>>>                  CSI lanes to use
>>>> -            items:
>>>> -              - const: 1
>>>> -              - const: 2
>>>> -              - const: 3
>>>> -              - const: 4
>>>> +            minItems: 1
>>>> +            maxItems: 4
>>>
>>> So, it is now valid to have "data-lanes = <6 7 8>;" now?
>>
>> Indeed it's not valid, I will send a v2 with a 'minimum: 1', 'maximum:
>> 4' items properties.
> 
> I'm interested in this patch. Did you send a v2 yet that I might have
> missed ?
> Thank you.

I just sent a v2, which add minimum/maximum so that we can only use 
index 1..4.

Regards,
Julien

